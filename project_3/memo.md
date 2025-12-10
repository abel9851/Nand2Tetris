- program counter를 생각으로만 구축했을 때 코드

```verilog

CHIP PC {
    IN in[16], reset, load, inc;
    OUT out[16];
    
    PARTS:
    Mux16(a=fbOut, b=false, sel=reset, out=reset16MuxOut);
    Mux16(a=fbOut, b=in, sel=load, out=load16MuxOut);
    Inc16(in=fbOut, out=inc16Out);
    Mux16(a=fbOut, b=inc16Out, sel=inc, out=incMux16Out);
    
    Mux16(a=incMux16Out, b=load16MuxOut, sel=load, out=middleSelectedOut);
    Mux16(a=middleSelectedOut, b=reset16MuxOut, sel=reset, out=finalSelectedOut);
    
    Or(a=reset, b=inc, out=or1Out);
    Or(a=or1Out, b=load, out=or2Out);
    Register(in=finalSelectedOut, load=or2Out, out=out, out=fbOut);
}

```


- ai에게 검토받고 개선한 코드
  - Mux 2개, Or 2개 삭제

```verilog

CHIP PC {
    IN in[16], reset, load, inc;
    OUT out[16];

    PARTS:
    // 1. Inc 처리 (가장 낮은 우선순위)
    Inc16(in=fbOut, out=pcPlusOne);
    Mux16(a=fbOut, b=pcPlusOne, sel=inc, out=w1);

    // 2. Load 처리 (Inc보다 우선)
    // load가 1이면 w1(Inc 결과)을 무시하고 in을 선택
    Mux16(a=w1, b=in, sel=load, out=w2);

    // 3. Reset 처리 (가장 높은 우선순위)
    // reset이 1이면 w2(Load나 Inc 결과)를 무시하고 0을 선택
    Mux16(a=w2, b=false, sel=reset, out=w3);

    // 4. 레지스터 저장
    // 아무 신호가 없으면(0,0,0) w1에서 fbOut이 선택되어 계속 뺑뺑이 돈다.
    // 따라서 load 조건을 따질 필요 없이 항상 업데이트(true)하면 됨.
    Register(in=w3, load=true, out=out, out=fbOut);
}

```