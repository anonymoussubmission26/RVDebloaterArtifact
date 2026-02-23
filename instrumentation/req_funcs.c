#include <stdint.h>
#include <stdio.h>
#include <uthash.h> 
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <unistd.h>

#define true 1
#define false 0
#define MAX_MODE_NAME 50
#define MAX_FUNC_NAME 50000
#define MAX_ADDR_STR_LEN 20  
#define STACK_SIZE 128  

typedef char bool;
bool mode_to_func_mapping[29][50000] = {{0, 1, 2, 3, 4, 5}};

volatile int mode_switching = 0;

char* func_names[50000];
void *func_addresses[50000] = {NULL};  

typedef struct {
    char name[MAX_FUNC_NAME];         
    char addr_str_index[MAX_ADDR_STR_LEN]; 
    UT_hash_handle hh_name;           
    UT_hash_handle hh_addr;           
} FuncEntry;

FuncEntry *allowed_functions = NULL;          
FuncEntry *allowed_functions_address = NULL;   

typedef struct {
    char addr_str[MAX_ADDR_STR_LEN];  
    UT_hash_handle hh;                
} LoggedAddrEntry;

LoggedAddrEntry *logged_addresses = NULL; 

enum Number {
    STABILIZE = 0,
    ACRO = 1,
    ALT_HOLD = 2,
    AUTO = 3,
    GUIDED = 4,
    LOITER = 5,
    RTL = 6,
    CIRCLE = 7,
    LAND = 9,
    DRIFT = 11,
    SPORT = 13,
    FLIP = 14,
    AUTOTUNE = 15,
    POSHOLD = 16,
    BRAKE = 17,
    THROW = 18,
    AVOID_ADSB = 19,
    GUIDED_NOGPS = 20,
    SMART_RTL = 21,
    FLOWHOLD = 22,
    FOLLOW = 23,
    ZIGZAG = 24,
    SYSTEMID = 25,
    AUTOROTATE = 26,
    AUTO_RTL = 27,
    TURTLE = 28
};

enum Number curr_mode_id;
enum Number mode_enum = STABILIZE;
int counter = 0;
bool attack = false;

const char* mode_to_string(enum Number mode) {
    // printf("Inside mode_to_string, mode: %d\n", (int)mode);
    switch (mode) {
        case STABILIZE: return "STABILIZE";
        case ACRO: return "ACRO";
        case ALT_HOLD: return "ALT_HOLD";
        case AUTO: return "AUTO";
        case GUIDED: return "GUIDED";
        case LOITER: return "LOITER";
        case RTL: return "RTL";
        case CIRCLE: return "CIRCLE";
        case LAND: return "LAND";
        case DRIFT: return "DRIFT";
        case SPORT: return "SPORT";
        case FLIP: return "FLIP";
        case AUTOTUNE: return "AUTOTUNE";
        case POSHOLD: return "POSHOLD";
        case BRAKE: return "BRAKE";
        case THROW: return "THROW";
        case AVOID_ADSB: return "AVOID_ADSB";
        case GUIDED_NOGPS: return "GUIDED_NOGPS";
        case SMART_RTL: return "SMART_RTL";
        case FLOWHOLD: return "FLOWHOLD";
        case FOLLOW: return "FOLLOW";
        case ZIGZAG: return "ZIGZAG";
        case SYSTEMID: return "SYSTEMID";
        case AUTOROTATE: return "AUTOROTATE";
        case AUTO_RTL: return "AUTO_RTL";
        case TURTLE: return "TURTLE";
        default: return "UNKNOWN";
    }
    return "UNKNOWN";
}


void __attribute__((noinline)) mode_entry_runtime(uint8_t new_mode) {

    if (curr_mode_id == new_mode) return;

    mode_switching = 1;

    if(allowed_functions){
        FuncEntry *current, *tmp;
        HASH_ITER(hh_name, allowed_functions, current, tmp) {  
            HASH_DELETE(hh_name, allowed_functions, current);  
            HASH_DELETE(hh_addr, allowed_functions_address, current);

            free(current);
        }
        allowed_functions = NULL; 
        allowed_functions_address = NULL;
    }


    mode_enum = (enum Number)new_mode; 
    printf("Previous mode is %s and new mode is %s\n", mode_to_string(curr_mode_id), mode_to_string(mode_enum));  

    char filename[MAX_MODE_NAME + 100];
    snprintf(filename, sizeof(filename), "/home/mohsen/rvd-project/RVDefender/profiles/%s_functions.txt", mode_to_string(mode_enum));

    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening function list file");
        return;
    }


    char line[10000];  
    char func_name[MAX_FUNC_NAME];
    char addr_str[MAX_ADDR_STR_LEN]; 

    while (fgets(line, sizeof(line), file)) {
        line[strcspn(line, "\n")] = 0;  

        char *ptr = line;
        while (*ptr == ' ' || *ptr == '\t') ptr++;

        if (sscanf(ptr, "%499s %19s", func_name, addr_str) != 2) {
            fprintf(stderr, "Error parsing function: '%s'\n", ptr);
            continue;
        }

        FuncEntry *entry = malloc(sizeof(FuncEntry));
        if (!entry) {
            perror("Memory allocation error");
            fclose(file);
            return;
        }
        memset(entry, 0, sizeof(FuncEntry));

        strncpy(entry->name, func_name, MAX_FUNC_NAME - 1);
        strncpy(entry->addr_str_index, addr_str, sizeof(entry->addr_str_index) - 1);

        HASH_ADD(hh_name, allowed_functions, name, strlen(entry->name), entry);
        HASH_ADD(hh_addr, allowed_functions_address, addr_str_index, strlen(entry->addr_str_index), entry);


    }

    fclose(file);

    curr_mode_id = mode_enum;

    mode_switching = 0;

    return;
}

// **** For attack 
// Define the function pointer type
void call_function_from_file(void) {
    if(!attack) return;
    attack = false;

    FILE *fp = fopen("/home/mohsen/rvd-project/RVDefender/profiles/attackfunc.txt", "r");
    if (!fp) {
        perror("Error opening file");
        return;
    }

    char func_name[256];
    unsigned long long addr_val = 0;

    // Read the first line from the file
    if (fscanf(fp, "%255s %llx", func_name, &addr_val) != 2) {
        fprintf(stderr, "Failed to read address from file\n");
        fclose(fp);
        return;
    }
    fclose(fp);

    printf("Read function %s at address 0x%llx\n", func_name, addr_val);

    // /* Known values for this member function */
    // const char *mangled = "_ZN10ModeTurtle13disarm_motorsEv";
    // const char *demangled = "ModeTurtle::disarm_motors";

    // /* Prefer calling the wrapper (safe). Accept either mangled or readable name. */
    // if (strcmp(func_name, mangled) == 0 || strcmp(func_name, demangled) == 0) {
    //     printf("[req_funcs] Triggering ModeTurtle::disarm_motors() via wrapper\n");
    //     ModeTurtle_disarm_motors_rvdefender();
    //     return;
    // }

    // Convert to function pointer
    void (*target_func)(void) = (void (*)(void))(uintptr_t)addr_val;

    if (target_func) {
        printf("Calling function at 0x%llx...\n", addr_val);
        target_func();
    } else {
        fprintf(stderr, "Invalid function pointer\n");
    }
}
void __attribute__((noinline)) dummy_fn(void *addr){

    if(mode_switching) return;
    
        FuncEntry *entry;
        if (allowed_functions_address != NULL) {
            char addr_str[20]; 
            snprintf(addr_str, sizeof(addr_str), "%p", addr);  
            
            HASH_FIND(hh_addr, allowed_functions_address, addr_str, strlen(addr_str), entry);
        } else {
            return; 
        }

    if(strcmp(mode_to_string(curr_mode_id), "GUIDED") == 0 && counter >= 200000){
        // printf("[RVDefender] came inside \n");
        attack = true;
        counter = 0;
    }
    counter++;
    if (entry == NULL && strcmp(mode_to_string(mode_enum), "STABILIZE") != 0) {  
            LoggedAddrEntry *logged_entry;
            char addr_str[20];
            snprintf(addr_str, sizeof(addr_str), "%p", addr);  // Convert addr to string
            HASH_FIND(hh, logged_addresses, addr_str, strlen(addr_str), logged_entry);

            if (logged_entry == NULL) {
                FILE *log_file = fopen("/home/mohsen/rvd-project/RVDefender/profiles/access_violation_indirect.log", "a");
                if (log_file != NULL) {
                    fprintf(log_file, "Indirect Call: Not allowed at address %p in mode %s\n", addr, mode_to_string(mode_enum));
                    fclose(log_file);
                } else {
                    printf("Error opening log file!\n");
                }

                logged_entry = malloc(sizeof(LoggedAddrEntry));
                if (logged_entry) {
                    strncpy(logged_entry->addr_str, addr_str, sizeof(logged_entry->addr_str) - 1);
                    HASH_ADD(hh, logged_addresses, addr_str, strlen(logged_entry->addr_str), logged_entry);
                } else {
                    perror("Memory allocation error");
                }
            }
        } 
    
    return;
}

typedef struct {
    void* return_addr;
} InstrumentationData;

void ret_function() {
    InstrumentationData data;
    data.return_addr = __builtin_return_address(0);
    
}

void __attribute__((noinline)) log_return_address(void *addr) {

    return;
}
