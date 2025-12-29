// program: multiply R0, R1

@n
M=0
(LOOP)
    // if ( n== R1) goto END
    @n
    D=M
    @R1
    D=D-M
    @END
    D;JEQ
    // R2 = R2 + R0
    @R0
    D=M
    @R2
    D=D+M
    M=D
    // n = n + 1
    @n
    M=M+1
    // goto LOOP
    @LOOP
    0;JMP
(END)
    @END
    0;JMP