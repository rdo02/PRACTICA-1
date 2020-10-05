PROCESSOR 16F887
    
    #include <xc.inc>   
    CONFIG FOSC=INTRC_NOCLKOUT    
    CONFIG WDTE=OFF
    CONFIG PWRTE=ON
    CONFIG MCLRE=OFF
    CONFIG CP=OFF
    CONFIG CPD=OFF
    CONFIG BOREN=OFF
    CONFIG IESO=OFF
    CONFIG FCMEN=OFF
    CONFIG LVP=OFF
    CONFIG DEBUG=ON
    
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
     
      GLOBAL mul 
    PSECT udata
 mul:
    DS 1
   
    PSECT resetVEC,class=CODE, delta=2
    resetvec:
    PAGESEL main
    goto main
    
    PSECT code
 pausa:
    movlw 1
    movwf 0x20
    nop
    suma:
    movlw 0b11111111
    movwf 0x21
    buc:
    movlw 0b11111111
    movwf 0x22
    rp:
    decfsz 0x22,1
    goto rp
    decfsz 0x21,1
    goto buc
    decfsz 0x20,1
    goto suma
    return
    
   PSECT code
    main:
    BANKSEL PORTA 
    BANKSEL TRISA
    clrf TRISA
    loop:
    movlw 0b00000000
    movwf PORTA
    nop
    rep:
    RLF  PORTA,1
    CALL pausa
    BTFSS PORTA,7
    goto rep
   rep2:
    RRF PORTA,1
    CALL pausa
    BTFSS PORTA,0
    goto rep2
    END
    
    
    
   

