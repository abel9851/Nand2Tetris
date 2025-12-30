// 초기화

// n = SCREEN (주소용 변수) !!! n은 주소용 변수, RAM[n]이 되도록 해야한다.
@SCREEN // 16374, 2^14
D=A // 얘가 잘못됬다고하니까, 오늘 저녁에 하자.
@n
M=D


(PAINT)
// (if KBD = 0) goto END
@KBD
D=M
@END
D;JEQ

// (if n = 24576) goto END
@KBD
D=A
@n
D=D-M
@END
D;JEQ

// RAM[n] = -1 // 여기가 맛이 간것 같다.
@n 
A=M // @n의 M에는 주소값이 들어가있고 그 값을 A에 할당하면 레지스터가 [A] 즉, RAM[n]이 된다.
M=-1

// n = n + 1
@n // 여기가 맛이 간것 같다.
M=M+1

// go to PAINT
@PAINT
0;JMP

(ERASE)
// (if KBD > 0) goto END
@KBD
D=M
@END
D;JGT

// (if n = 24576) goto END
@KBD
D=A
@n
D=D-M
@END
D;JEQ

// RAM[n] = 0
@n
A=M
M=0

// n = n + 1
@n
M=M+1

// go to ERASE
@ERASE
0;JMP


(END)
// n = SCREEN
@SCREEN
D=A
@n
M=D

// (if KBD > 0) goto PAINT
@KBD
D=M
@PAINT
D;JGT

// (if KBD = 0) goto ERASE
@KBD
D=M
@ERASE
D;JEQ
