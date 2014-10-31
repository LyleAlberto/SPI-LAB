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
            MOVLW       b'00000001'
            MOVWF       TRISC
            MOVLW       b'00000001'
            MOVWF       TRISB
            MOVLW       b'00000000'
            MOVWF       PORTD
            MOVLW       H'00'
            MOVWF       ADCON0
            MOVLW       h'00'
            MOVWF       var
            MOVWF       var1
            BCF         STATUS,RP0
            BCF         STATUS,RP1

INICIO
            MOVFW       PORTC
            XORWF       PORTB
            BTFSS       STATUS,Z
            GOTO        PIN
            GOTO        INICIO
PIN
            CLRW        
            MOVFW       PORTB
            MOVWF       PORTD
            GOTO        INICIO

            END


