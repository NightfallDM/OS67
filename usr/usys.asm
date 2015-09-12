[bits 32]
[section .text]

sys_fork    EQU 1
sys_exit    EQU 2
sys_wait    EQU 3
sys_pipe    EQU 4
sys_read    EQU 5
sys_kill    EQU 6
sys_exec    EQU 7
sys_fstat   EQU 8
sys_chdir   EQU 9
sys_fdup    EQU 10
sys_getpid  EQU 11
sys_sbrk    EQU 12
sys_sleep   EQU 13
sys_uptime  EQU 14
sys_open    EQU 15
sys_write   EQU 16
sys_mknod   EQU 17
sys_unlink  EQU 18
sys_link    EQU 19
sys_mkdir   EQU 20
sys_close   EQU 21

%macro syscall 1
[global %1]
%1:
    mov eax, sys%1
    int 0x80
    ret
%endmacro

syscall _fork  
syscall _exit  
syscall _wait  
syscall _pipe  
syscall _read  
syscall _kill 
syscall _exec  
syscall _fstat 
syscall _chdir 
syscall _fdup  
syscall _getpid
syscall _sbrk  
syscall _sleep 
syscall _uptime
syscall _open  
syscall _write 
syscall _mknod 
syscall _unlink
syscall _link  
syscall _mkdir 
syscall _close 
