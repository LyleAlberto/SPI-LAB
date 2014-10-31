            list        p=16f877a
            #include    <p16f877a.inc>

            __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

var         EQU         25h
var1        EQU         26h

            ORG         00H
            GOTO        PUERTOS
            ORG         05H

PUERTOS     BSF         STATUS,RP0
            BCF         STATUS,RP1
            MOVLW       b'00000100'
            MOVWF       TRISC
            MOVLW       b'00000000'
            MOVWF       TRISB
            MOVLW       H'00'
            MOVWF       ADCON0
            MOVLW       h'00'
            MOVWF       var
            MOVWF       var1
            BCF         STATUS,RP0
            BCF         STATUS,RP1

INICIO
            MOVLW       b'00000000'
            MOVWF       PORTC
            MOVFW       var
            ANDLW       b'00011111'
            CALL        DATO
            MOVWF       PORTB
            INCF        var,f
            MOVFW       var
            MOVLW       .15
            XORWF       var,w
            BTFSC       STATUS,Z
            CLRF        var
            GOTO        UNO
            GOTO        UNO
UNO
            MOVLW       b'00000001'
            MOVWF       PORTC
            MOVFW       var1
            ANDLW       b'00011111'
            CALL        DATO
            MOVWF       PORTB
            INCF        var1,f
            MOVFW       var1
            MOVLW       .15
            XORWF       var1,w
            BTFSC       STATUS,Z
            CLRF        var1
            GOTO        INICIO
            GOTO        INICIO
DATO
            addwf       PCL,F
Tabla       retlw	b'00000001'
            retlw	b'00000001'
            retlw	b'00000001'
            retlw	b'00000001'
            retlw	b'00000001'
            retlw	b'00000001'
            retlw	b'00000001'
            retlw	b'00000001'
            retlw   b'00000000'
            retlw	b'00000000'
            retlw	b'00000000'
            retlw	b'00000000'
            retlw	b'00000000'
            retlw	b'00000000'
            retlw	b'00000000'
            retlw	b'00000000'

            END



