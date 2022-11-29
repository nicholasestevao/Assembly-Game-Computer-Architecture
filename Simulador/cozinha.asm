;Jogo Organizacao e Arquitetura de Computadores


;Opcao: var #1 // opção escolhida no menu.
;Comandas: var #5  // vetor de todas as comandas definidas
;ComandaAtual: var #1
;Receitas: var #20 // todas as receitas possiveis no jogo
;IndiceComandaAtual: var #1
;Prato: var #1 // “Soma” dos ingrediente que o usuario colocou 
;Ingrediente: var #1 // ingrediente na mao.
;MaoVazia: var #1 // flag de 
;NumeroPratosCorretos: var #1
;NomeRestaurante: var #41
;TeclaDigitada: var #1
;
;main:
;	Seta parâmetros e variáveis…
;ImprimeTelaOpcoes
;LoopMenu
;
;LoopMenu: (Isaac)
;	TeclaDigitada = INCHAR
;	if(TeclaDigitada == 255) //digitou nao digitou nada
;		LoopMenu
;if (Opcao == tutorial)
;	ImprimeTelaTutorial
;	LoopMenu
;if (Opcao == iniciar)
;	LerNomeRestaunte
;	GerarComandas
;ImprimeTelaJogo
;	LoopJogo
;if (Opcao == sair)
;	FechaJogo
;
;LoopJogo: (Hugo)
;	TeclaDigitada = INCHAR
;	if(TeclaDigitada == 255) //digitou nao digitou nada
;		LoopJogo
;	
;	if(TeclaDigitada == esquerda)
;		moveEsquerda
;	if(TeclaDigitada == direita)
;		moveDireita
;	if(TeclaDigitada == espaco)
;		if(estaSobreBancada)
;			PegaOuColocaOuDescartaIngrediente
;		if(estaSobreCampainha) (Isaac e Guilherme)
;			ComparaPratoComComanda 
;			If(PratoEstaCorreto)
;AtualizaPontos (Isaac e Guilherme)
;			Incrementa IndiceComandaAtual
;			If(IndiceComandaAtual == 6)
;				FimDoJogo – Exibir tela final com pontuacao (Isaac e Guilherme)
;			ImprimeTelaJogo
;
;	LoopJogo
;	
;
;LerNomeRestaurante:
;	– Imprime tela ler nome do restaurante
;	(Ler String jogo da Forca …)
;
;ImprimeTelaJogo: 
;AtualizaComanda	
;ImprimeComanda
;	ImprimeBancada
;	ResetaPrato
;	
;GerarComandas: (Nicholas)
;	(Usa nome do restaurante para gerar comandas)
;	(Preenche vetor de comandas)
;
;FimDoJogo:
;	–Imprime tela de fim

;NomeRestaurante: var #41		;Veotr para armazenar nome do restaurante


;DEFINICAO DOS BITS DOS INGREDIENTES:
; (do mais significativo ao menos significativo)
; bit 0 - tomate
; bit 1 - alface
; bit 2 - queijo
; bit 3 - carne
; bit 4 - ovo
; bit 5 - maionese
; bit 6 - ketchup
; bit 7 - mostarda

jmp main

NomeRestaurante: string "Burger King"
ComandaAtual: var #1
	static ComandaAtual, #0 ;inicializa comanda com 0
TextoComandaAtual: var #1
Comandas: var #5 ; ATENCAO! Essa variavel nao foi implementada ainda (usar apenas a comanda autal e o IndiceComandaAtual)
IndiceComandaAtual: var #1
NumeroAleatorio: var #1

;	Hamburger (sem molho)
;	(tomate, alface, carne)
;	11010000 => 208
Receita1: var #1
	static Receita1, #208 ; Variavel que guarda o codigo binario da receita 1
	
;	Hamburger com ketchup
; 	(tomate, alface, carne, ketchup)
;	11010010 => 210
Receita2: var #1
	static Receita2, #210 ; Variavel que guarda o codigo binario da receita 2
	
;	Hamburger com mostarda
;	(tomate, alface, carne, mostarda)
;	11010001 => 209
Receita3: var #1 ; Variavel que guarda o codigo binario da receita 3
	static Receita3, #209
	
;	Hamburger com ovo
;	(tomate, alface, carne, ovo)
;	11011000 => 216
Receita4: var #1 ; Variavel que guarda o codigo binario da receita 4
	static Receita4, #216

;	Hamburger vegano
;	(tomate, alface)
;	11000000 => 192
Receita5: var #1 ; Variavel que guarda o codigo binario da receita 5
	static Receita5, #192

;	Cheeseburger
;	(tomate, alface, carne, queijo)
;	11110000 => 240
Receita6: var #1 ; Variavel que guarda o codigo binario da receita 6
	static Receita6, #240

;	Cheeseburger com maionese
;	(tomate, alface, carne, queijo, maionese)
;	11110100 => 244
Receita7: var #1 ; Variavel que guarda o codigo binario da receita 7
	static Receita7, #244

;	Cheeseburger com ovo
;	(tomate, alface, carne, queijo, ovo)
;	11111000 => 248
Receita8: var #1 ; Variavel que guarda o codigo binario da receita 8
	static Receita8, #248

;	Cheeseburger vegetariano
;	(tomate, alface, queijo)
;	11100000 =>224
Receita9: var #1 ; Variavel que guarda o codigo binario da receita 9
	static Receita9, #224


NomeReceita1: string "Hamburger (sem molho)" 	; Variavel que guarda o nome da receita 1
NomeReceita2: string "Hamburger com ketchup" 	; Variavel que guarda o nome da receita 2
NomeReceita3: string "Hamburger com mostarda"	; Variavel que guarda o nome da receita 3
NomeReceita4: string "Hamburger com ovo" 		; Variavel que guarda o nome da receita 4
NomeReceita5: string "Hamburger vegano" 		; Variavel que guarda o nome da receita 5
NomeReceita6: string "Cheeseburger" 			; Variavel que guarda o nome da receita 6
NomeReceita7: string "Cheeseburger com maionese"; Variavel que guarda o nome da receita 7
NomeReceita8: string "Cheeseburger com ovo" 	; Variavel que guarda o nome da receita 8
NomeReceita9: string "Cheeseburger vegetariano" ; Variavel que guarda o nome da receita 9
Espaco: string 		 "                         "

StringMostarda: string "Mostarda"
StringKetchup: string "Ketchup"
StringMaionese: string "Maionese"
StringOvo: string "Ovo"
StringCarne: string "Carne"
StringQueijo: string "Queijo"
StringAlface: string "Alface"
StringTomate: string "Tomate"


main:
	call GerarNumeroAleatorio
	
	call GerarComanda
	load r0, ComandaAtual
	call ImprimeTelaJogo
	halt
	rts


GerarNumeroAleatorio:
	push r0
	push r1
	push r2
		inchar r0
		loadn r1, #255
		cmp r0, r1
		call LoopGerarNumeroAleatorio
		breakp
		store NumeroAleatorio, r2
		
	pop r2
	pop r1
	pop r0
	rts
	
LoopGerarNumeroAleatorio:
	inchar r0
	loadn r1, #255
	cmp r0, r1
	inc r2
	jeq LoopGerarNumeroAleatorio
	rts 

GerarComanda:
	push r0		; 
	push r1		; 
	push r2		; 
	push r3		; 
	push r4		; 
	push r5		;

	;load r3, ComandaAtual ; garante que proxima comanda sera diferente da anterior
	;load r2, NomeRestaurante ; Pega valor ascii do primeiro caractere do restaurante
	;add r1, r2, r3 
	load r1, NumeroAleatorio
	loadn r2, #9
	mod r3, r1, r2 ; r3 eh o indice da comanda atual (de 0 a 8)
	
	
	;Identifica qual comanda foi selecionada
	;Receita 1
	loadn r2, #0
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_1
	
	;Receita 2
	loadn r2, #1
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_2
	
	;Receita 3
	loadn r2, #2
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_3
	
	;Receita 4	
	loadn r2, #3
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_4
	
	;Receita 5
	loadn r2, #4
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_5
	
	;Receita 6
	loadn r2, #5
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_6

	;Receita 7	
	loadn r2, #6
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_7
	
	;Receita 8
	loadn r2, #7
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_8
	
	;Receita 9
	loadn r2, #8
	cmp r3, r2
	ceq ComandaAtual_Recebe_Receita_9

	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
ComandaAtual_Recebe_Receita_1:
	push r0
		load r0, Receita1
		store ComandaAtual, r0
		loadn r0, #NomeReceita1
		store TextoComandaAtual, r0
	pop r0
	rts
	
ComandaAtual_Recebe_Receita_2:
	push r0
		load r0, Receita2
		store ComandaAtual, r0
		loadn r0, #NomeReceita2
		store TextoComandaAtual, r0
	pop r0
	rts

ComandaAtual_Recebe_Receita_3:
	push r0
		load r0, Receita3
		store ComandaAtual, r0
		loadn r0, #NomeReceita3
		store TextoComandaAtual, r0
	pop r0
	rts
	
ComandaAtual_Recebe_Receita_4:
	push r0
		load r0, Receita4
		store ComandaAtual, r0
		loadn r0, #NomeReceita4
		store TextoComandaAtual, r0
	pop r0
	rts
	
ComandaAtual_Recebe_Receita_5:
	push r0
		load r0, Receita5
		store ComandaAtual, r0
		loadn r0, #NomeReceita5
		store TextoComandaAtual, r0
	pop r0
	rts
	
ComandaAtual_Recebe_Receita_6:
	push r0
		load r0, Receita6
		store ComandaAtual, r0
		loadn r0, #NomeReceita6
		store TextoComandaAtual, r0
	pop r0
	rts

ComandaAtual_Recebe_Receita_7:
	push r0
		load r0, Receita7
		store ComandaAtual, r0
		loadn r0, #NomeReceita7
		store TextoComandaAtual, r0
	pop r0
	rts
	
ComandaAtual_Recebe_Receita_8:
	push r0
		load r0, Receita8
		store ComandaAtual, r0
		loadn r0, #NomeReceita8
		store TextoComandaAtual, r0
	pop r0
	rts

ComandaAtual_Recebe_Receita_9:
	push r0
		load r0, Receita9
		store ComandaAtual, r0
		loadn r0, #NomeReceita9
		store TextoComandaAtual, r0
	pop r0
	rts
	
ImprimeTelaJogo:
	
	call printTextoComandaAtual
	call printIngredientes
	rts
	
	
	
printIngredientes:
	push r0		; 
	push r1		; 
	push r2		; 
	push r3		; 
	push r4		; 
	push r5		;
	push fr
	
	; bit 0 - tomate
; bit 1 - alface
; bit 2 - queijo
; bit 3 - carne
; bit 4 - ovo
; bit 5 - maionese
; bit 6 - ketchup
; bit 7 - mostarda
	load r0, ComandaAtual
	loadn r5, #40
	
	loadn r1, #1
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente1
	
	loadn r1, #2
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente2
	
	loadn r1, #4
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente3
	
	loadn r1, #8
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente4
	
	loadn r1, #16
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente5
	
	loadn r1, #32
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente6
	
	loadn r1, #64
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente7
	
	loadn r1, #128
	and r2, r0, r1
	cmp r2, r1
	ceq imprimeIngrediente8
	
	call limpaIngredientes
	
	pop fr
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts	
	
limpaIngredientes:
	push fr		; Protege o registrador de flags
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #280	; Criterio de parada
	loadn r4, #40
	
  	Limpa_Loop:	
		cmp r3, r5
		jeq Limpa_sai
		mov r0, r5	; Posicao na tela onde a mensagem sera' escrita
		loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
		loadn r2, #0		; Seleciona a COR da Mensagem
		call ImprimeStr
		add r5, r5, r4
		jmp Limpa_Loop
	
   Limpa_sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	
	rts
	
imprimeIngrediente1:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5  ;posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringMostarda	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	

imprimeIngrediente2:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5 	; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringKetchup	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	
	
imprimeIngrediente3:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5 		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringMaionese	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	

imprimeIngrediente4:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5 		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringOvo	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	
	
imprimeIngrediente5:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5 		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringCarne	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	
	
imprimeIngrediente6:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringQueijo ; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	
	
imprimeIngrediente7:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringAlface	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	
	
imprimeIngrediente8:
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr
	
	mov r0, r5		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #StringTomate	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #40
	add r5, r5, r0
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	


;********************************************************
;                   IMPRIME A PALAVRA DIGITADA
;********************************************************
	
printTextoComandaAtual:	; Seleciona uma mensagem para imprimir - Digite uma palavra!!
	push fr		; Protege o registrador de flags
	push r0
	push r1
	push r2
	
	loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita
	load r1, TextoComandaAtual	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	pop r2
	pop r1
	pop r0	
	pop fr
	rts	
	
;---------------------------	
;********************************************************
;                   IMPRIME STRING
;********************************************************
	
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push fr		; Protege o registrador de flags
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3
		jeq ImprimeStr_Sai
		add r4, r2, r4
		outchar r4, r0
		inc r0
		inc r1
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts