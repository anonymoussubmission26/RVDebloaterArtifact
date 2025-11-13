#include <stdint.h>
#include <stdio.h>
#include <uthash.h> // install sudo apt install uthash-dev
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

int counter2 = 0;
int counter3 , counter4 = 0;

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
    MANUAL        = 0,
    CIRCLE        = 1,
    STABILIZE     = 2,
    TRAINING      = 3,
    ACRO          = 4,
    FLY_BY_WIRE_A = 5,
    FLY_BY_WIRE_B = 6,
    CRUISE        = 7,
    AUTOTUNE      = 8,
    AUTO          = 10,
    RTL           = 11,
    LOITER        = 12,
    TAKEOFF       = 13,
    AVOID_ADSB    = 14,
    GUIDED        = 15,
    INITIALISING  = 16,
    QSTABILIZE    = 17,
    QHOVER        = 18,
    QLOITER       = 19,
    QLAND         = 20,
    QRTL          = 21,
    QAUTOTUNE     = 22,
    QACRO         = 23,
    THERMAL       = 24,
    LOITER_ALT_QLAND = 25,
    AUTOLAND      = 26
};

enum Number curr_mode_id;
enum Number mode_enum;

const char* mode_to_string(enum Number mode) {
    switch (mode) {
        case MANUAL: return "MANUAL";
        case CIRCLE: return "CIRCLE";
        case STABILIZE: return "STABILIZE";
        case TRAINING: return "TRAINING";
        case ACRO: return "ACRO";
        case FLY_BY_WIRE_A: return "FBWA";
        case FLY_BY_WIRE_B: return "FBWB";
        case CRUISE: return "CRUISE";
        case AUTOTUNE: return "AUTOTUNE";
        case AUTO: return "AUTO";
        case RTL: return "RTL";
        case LOITER: return "LOITER";
        case TAKEOFF: return "TAKEOFF";
        case AVOID_ADSB: return "AVOID_ADSB";
        case GUIDED: return "GUIDED";
        case INITIALISING: return "INITIALISING";
        case QSTABILIZE: return "QSTABILIZE";
        case QHOVER: return "QHOVER";
        case QLOITER: return "QLOITER";
        case QLAND: return "QLAND";
        case QRTL: return "QRTL";
        case QAUTOTUNE: return "QAUTOTUNE";
        case QACRO: return "QACRO";
        case THERMAL: return "THERMAL";
        case LOITER_ALT_QLAND: return "LOITER_ALT_QLAND";
        case AUTOLAND: return "AUTOLAND";
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
    printf("Loaded %u functions for mode %s\n", HASH_CNT(hh_name,allowed_functions), mode_to_string(mode_enum));

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
            snprintf(addr_str, sizeof(addr_str), "%p", addr);  
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

void __attribute__((noinline)) log_return_address(void *addr) {

    if(initialized == 1){
        printf("Return Address: %p\n", addr);
        counter4++;
        if(counter4 == 5) initialized = -1;
    }
    return;
}
