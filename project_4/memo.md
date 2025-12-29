# 곱셈구현
### 의사코드 작성

```plaintext

n = 0

LOOP
    if (n == R1) goto END
    R2 = R2 + R0
    n = n + 1
    goto LOOP
END;

```

### project_4/Mult.asm을 구현한 결과
- (END)다음에 있는 @END와 0;JMP에서 무한 루프하는 것을 확인했다. 정상동작이다.