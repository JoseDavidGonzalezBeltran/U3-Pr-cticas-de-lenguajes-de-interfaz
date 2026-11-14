INCLUDE Irvine32.inc

.data
msgMain BYTE "main ESP: ",0
msgA    BYTE "  A ESP: ",0
msgB    BYTE "    B ESP: ",0
msgRet  BYTE "[ESP]=",0

.code
main PROC
    mov  edx, OFFSET msgMain
    call WriteString
    mov  eax, esp
    call WriteHex
    call Crlf
    call A
    exit
main ENDP

A PROC
    mov  edx, OFFSET msgA
    call WriteString
    mov  eax, esp
    call WriteHex           
    mov  edx, OFFSET msgRet
    call WriteString
    mov  eax, [esp]         
    call WriteHex
    call Crlf
    call B
    ret
A ENDP

B PROC
    mov  edx, OFFSET msgB
    call WriteString
    mov  eax, esp
    call WriteHex           
    mov  edx, OFFSET msgRet
    call WriteString
    mov  eax, [esp]         
    call WriteHex
    call Crlf
    ret
B ENDP

END main