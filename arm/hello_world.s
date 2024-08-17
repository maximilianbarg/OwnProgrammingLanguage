.section .data
message: .asciz "Hello, World!\n"

.section .text
.global _start

_start:
    // Write syscall number
    mov x0, #1
    // Address of message to write
    ldr x1, =message
    // Length of message
    mov x2, #13
    // File descriptor (stdout)
    mov x8, #64   // sys_write
    svc #0        // call kernel

    // Exit syscall number
    mov x8, #93   // exit
    mov x0, #0    // status
    svc #0        // call kernel
