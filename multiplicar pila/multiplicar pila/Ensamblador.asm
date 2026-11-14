; nombre: jose david gonzalez beltran
; materia: lenguajes de interfaz
; profesor: jose luis medina jimenez

INCLUDE Irvine32.inc

.data

.code
main PROC
    ; guardamos un numero de prueba en ebx
    mov ebx, 999

    ; metemos los numeros a la pila (al reves)
    push 3          
    push 25         
    
    ; llamamos al procedimiento
    call SumarPila
    
    nop             
    exit
main ENDP

; procedimiento que recibe dos numeros de la pila, los multiplica y regresa el resultado
SumarPila PROC
    push ebp        ; guardamos el marco anterior
    mov ebp, esp    ; apuntamos al inicio de la pila local

    push ebx        ; guardamos ebx para no perder su valor

    ; sacamos los numeros que mandamos desde el main
    mov eax, [ebp+8]   
    mov ebx, [ebp+12]  

    ; multiplicamos los dos valores
    imul eax, ebx

    pop ebx         ; regresamos el valor original de ebx
    pop ebp         ; regresamos el marco anterior

    ret 8           ; limpiamos los 8 bytes que usamos como parametros
SumarPila ENDP

END main