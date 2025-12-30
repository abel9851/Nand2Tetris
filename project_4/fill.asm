@16383
D=A
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
@24575
D=A
@position
D=D-M
@POLL
D;JLE

@position
M=M+1
A=M 
M=-1

@POLL
0;JMP

(ERASE)
@16383
D=A
@position
D=D-M
@POLL
D;JGE

@position
D=M
M=M-1
A=D
M=0

@POLL
0;JMP
 