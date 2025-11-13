#include <stdbool.h>

bool mode_to_func_mapping[29][50000] = {{0}};
int initialized = 1;
char* func_names[50000] = {0};
void* func_addresses[50000] = {0};
