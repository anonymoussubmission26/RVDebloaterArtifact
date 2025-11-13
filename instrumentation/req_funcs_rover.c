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

int initialized = 1;

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
    MANUAL       = 0,
    ACRO         = 1,
    STEERING     = 3,
    HOLD         = 4,
    LOITER       = 5,
    FOLLOW       = 6,
    SIMPLE       = 7,
    DOCK         = 8,
    CIRCLE       = 9,
    AUTO         = 10,
    RTL          = 11,
    SMART_RTL    = 12,
    GUIDED       = 15,
    INITIALISING = 16
};

enum Number curr_mode_id;
enum Number mode_enum;

const char* mode_to_string(enum Number mode) {
    switch (mode) {
        case MANUAL: return "MANUAL";
        case CIRCLE: return "CIRCLE";
        case ACRO: return "ACRO";
        case AUTO: return "AUTO";
        case RTL: return "RTL";
        case LOITER: return "LOITER";
        case HOLD: return "HOLD";
        case GUIDED: return "GUIDED";
        case STEERING: return "STEERING";
        case FOLLOW: return "FOLLOW";
        case SIMPLE: return "SIMPLE";
        case DOCK: return "DOCK";
        case SMART_RTL: return "SMART_RTL";
        case INITIALISING: return "INITIALISING";
        default: return "UNKNOWN";
    }
    return "UNKNOWN";
}

void __attribute__((noinline)) mode_entry(uint8_t new_mode) {
    // enum Number mode_enum = (enum Number)new_mode; 
    mode_enum = (enum Number)new_mode; 

    // printf("Previous mode is %d and %s\n", curr_mode_id, mode_to_string(curr_mode_id));  
    if (curr_mode_id == new_mode) return;

    // Get the home directory path
    const char* home_dir = getenv("HOME");
    if (home_dir == NULL) {
        perror("Error getting home directory");
        return;
    }

    // Construct the path to the "profiles" directory
    char profiles_dir[512];
    snprintf(profiles_dir, sizeof(profiles_dir), "%s/rvd-project/RVDefender/profiles", home_dir);

    // Check if the "profiles" directory exists
    struct stat statbuf;
    if (stat(profiles_dir, &statbuf) != 0 || !S_ISDIR(statbuf.st_mode)) {
        // Directory does not exist, so create it
        if (mkdir(profiles_dir, 0755) != 0) {
            perror("Error creating profiles directory");
            return;
        }
        printf("Created profiles directory: %s\n", profiles_dir);
    }

    // Construct the full file path inside the "profiles" directory
    char filepath[512];
    snprintf(filepath, sizeof(filepath), "%s/mode_profile", profiles_dir);

    // Open the file for appending
    FILE* file = fopen(filepath, "a");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    fprintf(file, "Mode: %d (%s)\n", curr_mode_id, mode_to_string(curr_mode_id));
    for (int i = 0; i < 50000; i++) {
        if (mode_to_func_mapping[curr_mode_id][i]) {
            // fprintf(file, "%d: %s\n", curr_mode_id, func_names[i]);
            fprintf(file, "%s: %s @ %p\n", mode_to_string((enum Number)curr_mode_id), func_names[i], func_addresses[i]);
        }
    }
    fprintf(file, "----------------------\n");
    fclose(file);
    printf("Writing the information for %s mode is done\n", mode_to_string(curr_mode_id));  

    curr_mode_id = new_mode;
    printf("Going to new mode: %d , %s\n", curr_mode_id, mode_to_string(mode_enum));    
    return;
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

    mode_switching = 0;
    return;
}

void __attribute__((noinline)) log_fn(int id, char * str, int size, void *addr) {
	if (initialized == 1){
		for(int j = 0; j < 50000; j++) {			
			for(int i = 0; i < 29; i++) {
				mode_to_func_mapping[i][j] = false;
			}
            // func_names[j][0] = '\0';
            func_names[j] = NULL;
            func_addresses[j] = NULL;
		}
        printf("Initializing is finished! %d \n", initialized);
        printf("First function executed: %s at address %p\n", str, addr);
		initialized = -1;
	}
	if(mode_to_func_mapping[curr_mode_id][id]) {
        // if(curr_mode_id == 4){
        //     printf("This function has been seen in %d! \n", curr_mode_id);
        // }
        return;
    } 
	mode_to_func_mapping[curr_mode_id][id] = true;

    // if (strstr(str, "_ZNK6AP_HAL8RCOutput22get_output_mode_bannerEPch") != NULL) {
    //         printf("Matched function in mode %s: %s\n", mode_to_string(curr_mode_id), str);
    // }

    if (func_names[id] == NULL) {
        // Directly assign the string pointer to func_names
        func_names[id] = str + '\0';  // Store the pointer to the function name   
        func_addresses[id] = addr;
    }

    // if (strlen(func_names[id]) == 0) {
    //     memcpy(func_names[id], str, size);
    //     func_names[id][size] = '\0';  // Ensure the string is null-terminated
    //     func_addresses[id] = addr;
    // }

	return;
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

        if (entry == NULL) {  
           
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
    return;
}
