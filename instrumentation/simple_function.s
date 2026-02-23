    .global simple_function
    .text

simple_function:
    push {r0, lr}           // Save r0 and lr to the stack
    mov r0, #42             // Set r0 to 42
    pop {r0, pc}            // Restore r0 and return (using pc for return address)

