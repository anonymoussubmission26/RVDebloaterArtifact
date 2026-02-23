#include <stdint.h>
#include <stdio.h>
#include <uthash.h> 
#include <stdatomic.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <dirent.h>


#define true 1
#define false 0
#define MAX_MODE_NAME 50
#define MAX_FUNC_NAME 50000
#define MAX_ADDR_STR_LEN 20  
#define STACK_SIZE 128  
#define MAX_PIDS     10    
#define MAX_MODES 16
#define MAX_Funcs 50000
#define MAX_MODE_NAME_LEN 32


volatile int mode_switching = 0;

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

int curr_mode_id = 0;

char curr_mode_buf[MAX_MODE_NAME_LEN] = "initialized";
char new_mode_buf[MAX_MODE_NAME_LEN] = "initialized";
char *curr_mode = curr_mode_buf;
char *new_mode = new_mode_buf;

void __attribute__((noinline)) mode_entry_runtime(int argc, char **argv) {

    if (curr_mode && argc == 1 && !strcmp(argv[0], curr_mode)){
        printf("New mode is equal to current mode!\n");
        return;
    }else if (curr_mode && argc == 2 && !strcmp(argv[1], curr_mode)){
        printf("New mode is equal to current mode!\n");
        return;
    }else if (argc == 2) {
        printf("Argc==2 From %s to %s\n", curr_mode ? curr_mode : "NULL", argv[1]);
        strncpy(new_mode_buf, argv[1], MAX_MODE_NAME_LEN - 1);
        new_mode_buf[MAX_MODE_NAME_LEN - 1] = '\0';
    } else {
        printf("Argc==1 From %s to %s\n", curr_mode ? curr_mode : "NULL", argv[0]);
        strncpy(new_mode_buf, argv[0], MAX_MODE_NAME_LEN - 1);
        new_mode_buf[MAX_MODE_NAME_LEN - 1] = '\0';
    }

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

    printf("Previous mode is %s and new mode is %s\n", curr_mode, new_mode_buf);  

    char filename[MAX_MODE_NAME + 100];
    snprintf(filename, sizeof(filename), "/home/mohsen/rvd-project/RVDefender/profiles/%s_functions.txt", new_mode_buf);

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

        if (entry == NULL && new_mode_buf != "initialized") {  
            LoggedAddrEntry *logged_entry;
            char addr_str[20];
            snprintf(addr_str, sizeof(addr_str), "%p", addr);  
            HASH_FIND(hh, logged_addresses, addr_str, strlen(addr_str), logged_entry);

            if (logged_entry == NULL) {
                FILE *log_file = fopen("/home/mohsen/rvd-project/RVDefender/profiles/access_violation_indirect.log", "a");
                if (log_file != NULL) {
                    fprintf(log_file, "Indirect Call: Not allowed at address %p in mode %s\n", addr, new_mode_buf);
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
