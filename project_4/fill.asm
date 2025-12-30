@SCREEN
D=A-1
@position
M=D

(POLL)
@KBD
D=M
@PAINT
D;JGT
@ERASE
D;JEQ

(PAINT)
@KBD
D=A
@position
D=D-M
@POLL
D;JEQ

@position
M=M+1
A=M
M=-1

@POLL
0;JMP

(ERASE)
@SCREEN
D=A-1
@position
D=D-M
@POLL
D;JEQ

@position
D=M
M=M-1
A=D
M=0

@POLL
0;JMP
