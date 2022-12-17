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
;   ImprimeTelaJogo
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

;------------Coisas do hugo-----------------
alimento: var #1 static alimento, #' '

cabeca: string "o"
corpoNormal: string "/|\\"
corpoBracoLevantado: string "/|"

caractereAlimento1: var #1 static caractereAlimento1, #'@'
caractereAlimento2: var #1 static caractereAlimento2, #'$'
caractereAlimento3: var #1 static caractereAlimento3, #'#'

posAlimento1: var #1 static posAlimento1, #801
posAlimento2: var #1 static posAlimento2, #803
posAlimento3: var #1 static posAlimento3, #805

;Posição do personagem na tela, começando do 820.
posicao: var #1 static posicao, #820

;Flag de mão ocupada. Começa com a mão desocupada.
maoEstaOcupada: var #1 static maoEstaOcupada, #0

;-------------------------------------------

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
	call Menu
	
<<<<<<< HEAD
	call GerarComanda
	load r0, ComandaAtual
	call ImprimeTelaJogo
	
	;RECEBE A MOVIMENTAÇÃO.
	loop:
		push r0
		load r0, posicao
		call imprimePessoa
		call movimentaPersonagem
		pop r0
		jmp loop
	sair:
		halt
		rts



;----------FUNÇÕES DE MOVIMENTAÇÃO-------

recebeComando:
	;R0: tecla recebida.
	;R1: caractere vazio.
	inchar r0
	;Carrega r1 com caractere vazio.
	loadn r1, #255
	cmp r0,r1
	jeq recebeComando
	rts

movimentaPersonagem:
	;R0: tecla recebida.
	;R1: tecla esperada.
	;R2: posicao do personagem.
	push r0
	push r1
	push r2
	push r3
	
	load r2, posicao
	
	;Recebe um comando válido do teclado
	call recebeComando
	
	loadn r1, #'a'
	cmp r0,r1
	ceq moveEsquerda
	
	loadn r1, #'d'
	cmp r0, r1
	ceq moveDireita
	
	loadn r1, #' '
	cmp r0, r1
	ceq pegaAlimento
	
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts

moveEsquerda:
	;R2: posição do personagem.
	;R3: limite esquerdo.
	
	;Carrega o limite esquerdo.
	loadn r3, #801
	
	;Compara r2 com r3.
	cmp	r2, r3
	;Se r2 == r3
	jeq fimMoveEsquerda
		
	dec r2
	store posicao, r2
	
	fimMoveEsquerda:
	rts

moveDireita:
	;R2: posição do personagem.
	;R3: limite esquerdo.

	loadn r3, #838
	cmp r2, r3
	jeq fimMoveDireita
	
	inc r2
	store posicao, r2
	
	fimMoveDireita:
	rts

pegaAlimento:
	push r0
	push r1
	push r2
	push r3
	
	;Variável maoEstaOcupada começa como true (1).
	loadn r3, #1
	store maoEstaOcupada, r3
	
	;Carrega a posição do personagem.
	load r0, posicao
	
	;Carrega a posição do alimento 1 e vê se o personagem está lá.
	load r1, posAlimento1
	cmp r1,r0
	jeq pegarAlimento1
	
	;Carrega a posição do alimento 2 e vê se o personagem está lá.
	load r1, posAlimento2
	cmp r1,r0
	jeq pegarAlimento2
	
	;Carrega a posição do alimento 3 e vê se o personagem está lá.
	load r1, posAlimento3
	cmp r1,r0
	jeq pegarAlimento3
	
	;Se chegou aqui, não pegou nenhum alimento. Atualiza maoEstaOcupada para false (0).
	loadn r3, #0
	store maoEstaOcupada, r3
	;Põe um alimento vazio na variável alimento.
	loadn r3, #' '
	store alimento, r3
	jmp alimentoPegado
	
	pegarAlimento1:
	    load r2, caractereAlimento1
		store alimento, r2
		jmp alimentoPegado
	pegarAlimento2:
		load r2, caractereAlimento2
		store alimento, r2
		jmp alimentoPegado
	pegarAlimento3:
		load r2, caractereAlimento3
		store alimento, r2
		jmp alimentoPegado
	
	;CONTINUA PARA OS PROXIMOS ALIMENTOS...
	
	alimentoPegado:
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts

limpaPessoaTela:
	push r0
	push r1
	push r2
	push r3
	push r4
	
	;Lê a posição do personagem
	load r0, posicao
	;Lê o tamanho de uma linha.
	loadn r1, #40
	;Lê um espaço vazio.
	loadn r2, #' '
	;Lê o limite da limpeza.
	mov r4,r0
	inc r4
	inc r4
	
	;Volta duas linhas a partir do braço esquerdo.
	dec r0
	dec r0
	sub r0, r0, r1
	sub r0, r0, r1
	
	;r3 recebe o limite da linha.
	mov r3, r0
	inc r3
	inc r3
	inc r3
	inc r3
	
	limpaLinhaPersonagem:
		outchar r2, r0 	;imprime vazio.
		inc r0			;proxima posicao
		outchar r2, r0 	;imprime vazio.
		cmp r0, r3		;verifica se chegou no fim da linha.
		jne limpaLinhaPersonagem	;se não chegou, reseta.
		
		cmp r3,r4		;Verifica se é a ultima linha.
		jeq fimLimpeza
		;Se chegou no limite da linha, volta duas posições
		dec r0			
		dec r0
		dec r0
		dec r0
		;Pula uma linha.
		add r0, r0, r1
		add r3 , r3, r1
		jmp limpaLinhaPersonagem
	
	fimLimpeza:
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts

imprimePessoa:
	;R0: POSICAO.
	;R1: ENDEREOÇO DA CABEÇA.
	;R2: ENDEREÇO DO CORPO.
	;R4: POSICAO DA CABEÇA.
	;R5: CARACTERE A IMPRIMIR
	
	call limpaPessoaTela

	;PEGA POSICAO DA CABECA.
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	
	;Carrega a posição e volta duas linhas.
	load r4, posicao
	loadn r5, #40
	sub r4, r4, r5
	sub r4, r4, r5
	
	;Põe na posição do alimento e o imprime.
	inc r4
	load r1, alimento
	outchar r1, r4
	
	;Volta cursor para a posição da cabeça.
	dec r4
	add r4, r4, r5
	
	;Carrega o caractere da cabeça.
	loadn r1, #cabeca
	loadi r5, r1

	;ESCREVE 'cabeça' NA POSIÇÃO r4.
	outchar r5, r4
	
	;Verifica se a mão esta ocupada.
	loadn r5, #1
	load r3, maoEstaOcupada
	cmp r3, r5
	ceq levantaBraco
	cne abaixaBraco
	
	;Carrega posição do corpo;
	load r4, posicao
	dec r4
	
	;Carrega um caractere do corpo.
	loadi r5, r2
	outchar r5, r4
	;Carrega e imprime o próximo caractere do corpo.
	inc r2
	inc r4
	loadi r5, r2
	outchar r5, r4
	;Carrega e imprime o próximo caractere do corpo.
	inc r2
	inc r4
	loadi r5, r2
	outchar r5, r4
	
	;Obtem os valores dos registradores de volta.
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
imprimeAlimentos:
	push r0
	push r1
	push r2
	push r3
	
	load r0, caractereAlimento1
	load r1, caractereAlimento2
	load r2, caractereAlimento3
	
	loadn r3, #840
	inc r3
	
	outchar r0, r3
	
	inc r3
	inc r3
	
	outchar r1, r3
	
	inc r3
	inc r3
	
	outchar r2, r3
	
	pop r3
=======
	halt
	rts

Menu:
	;--ImprimeMenu--;
	call print_menu_chapeu_Screen
	push r0 ; input tecla
	push r1 ; tecla a ser testada
	push r2 ; numero aleatorio
		LoopMenu:
			;inchar r0
			call GerarNumeroAleatorio
			;store NumeroAleatorio, r0
			loadn r1, #50 
			cmp r0, r1
			inc r2
			ceq Tutorial ; digitou 1 pula pra Tutorial
			loadn r1, #49  
			cmp r0, r1
			inc r2
			jeq IniciaJogo ; digitou 2 pula IniciaJogo
			loadn r1, #48 
			cmp r0, r1 ; digitou 0 pula para SairMenu
			inc r2
			jeq SairMenu
			jne LoopMenu ; se nao for nenhuma das opcoes pula para LoopMenu 
			
		IniciaJogo:
			;store NumeroAleatorio, r0
			pop r2
			pop r1
			pop r0
			;call GerarNumeroAleatorio
			call GerarComanda
			load r0, ComandaAtual			
			call print_telaScreen			
			call ImprimeTelaJogo
			breakp	
			;--IniciaJogo--;
			jmp Menu
			
	SairMenu:		
>>>>>>> main
	pop r2
	pop r1
	pop r0
	rts

<<<<<<< HEAD
levantaBraco:
	;Põe o braço ao lado da cabeça.
	inc r4
	loadn r5, #'/'
	outchar r5, r4
	
	;Atualiza o corpo
	loadn r2, #corpoBracoLevantado
	
	rts

abaixaBraco:
	loadn r2, #corpoNormal
	rts


;----------------------------------------
=======

Tutorial:
	;--ImprimeTelaTutorial--;
	call print_tutorialScreen
	LoopTutorial:
		inchar r0
		loadn r1, #48 ; digitou 0 volta para Menu
		cmp r0, r1
		inc r2
		jne LoopTutorial
		jeq Menu
	rts
	
>>>>>>> main

GerarNumeroAleatorio:
	;push r0
	push r1
	push r2
		inchar r0
		loadn r1, #255
		cmp r0, r1
		call LoopGerarNumeroAleatorio
<<<<<<< HEAD
=======
		;breakp
>>>>>>> main
		store NumeroAleatorio, r2
		
	pop r2
	pop r1
	;pop r0
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
	call limpaIngredientes

	load r0, ComandaAtual
	loadn r5, #82
	
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
	push r5	; protege o r4 na pilha para ser usado na subrotina
	push r6	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #282	; Criterio de parada
	loadn r4, #40
	loadn r5, #82
	loadn r6, #40
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
    pop r6;	
   	pop r5;
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
	
	loadn r0, #41		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #Espaco	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #0		; Seleciona a COR da Mensagem
	
	call ImprimeStr   	; r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	
	loadn r0, #41		; Posicao na tela onde a mensagem sera' escrita
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
	
	menu_chapeu_ : var #1200
  ;Linha 0
  static menu_chapeu_ + #0, #3967
  static menu_chapeu_ + #1, #127
  static menu_chapeu_ + #2, #127
  static menu_chapeu_ + #3, #127
  static menu_chapeu_ + #4, #127
  static menu_chapeu_ + #5, #127
  static menu_chapeu_ + #6, #127
  static menu_chapeu_ + #7, #127
  static menu_chapeu_ + #8, #127
  static menu_chapeu_ + #9, #127
  static menu_chapeu_ + #10, #127
  static menu_chapeu_ + #11, #127
  static menu_chapeu_ + #12, #127
  static menu_chapeu_ + #13, #3967
  static menu_chapeu_ + #14, #127
  static menu_chapeu_ + #15, #127
  static menu_chapeu_ + #16, #127
  static menu_chapeu_ + #17, #127
  static menu_chapeu_ + #18, #3967
  static menu_chapeu_ + #19, #3967
  static menu_chapeu_ + #20, #3967
  static menu_chapeu_ + #21, #127
  static menu_chapeu_ + #22, #127
  static menu_chapeu_ + #23, #127
  static menu_chapeu_ + #24, #127
  static menu_chapeu_ + #25, #127
  static menu_chapeu_ + #26, #127
  static menu_chapeu_ + #27, #127
  static menu_chapeu_ + #28, #127
  static menu_chapeu_ + #29, #127
  static menu_chapeu_ + #30, #127
  static menu_chapeu_ + #31, #3967
  static menu_chapeu_ + #32, #3967
  static menu_chapeu_ + #33, #3967
  static menu_chapeu_ + #34, #127
  static menu_chapeu_ + #35, #127
  static menu_chapeu_ + #36, #127
  static menu_chapeu_ + #37, #127
  static menu_chapeu_ + #38, #127
  static menu_chapeu_ + #39, #127

  ;Linha 1
  static menu_chapeu_ + #40, #3967
  static menu_chapeu_ + #41, #127
  static menu_chapeu_ + #42, #127
  static menu_chapeu_ + #43, #127
  static menu_chapeu_ + #44, #127
  static menu_chapeu_ + #45, #127
  static menu_chapeu_ + #46, #127
  static menu_chapeu_ + #47, #127
  static menu_chapeu_ + #48, #127
  static menu_chapeu_ + #49, #127
  static menu_chapeu_ + #50, #127
  static menu_chapeu_ + #51, #127
  static menu_chapeu_ + #52, #127
  static menu_chapeu_ + #53, #127
  static menu_chapeu_ + #54, #127
  static menu_chapeu_ + #55, #127
  static menu_chapeu_ + #56, #127
  static menu_chapeu_ + #57, #127
  static menu_chapeu_ + #58, #3967
  static menu_chapeu_ + #59, #3967
  static menu_chapeu_ + #60, #127
  static menu_chapeu_ + #61, #127
  static menu_chapeu_ + #62, #127
  static menu_chapeu_ + #63, #127
  static menu_chapeu_ + #64, #127
  static menu_chapeu_ + #65, #127
  static menu_chapeu_ + #66, #127
  static menu_chapeu_ + #67, #0
  static menu_chapeu_ + #68, #0
  static menu_chapeu_ + #69, #127
  static menu_chapeu_ + #70, #3967
  static menu_chapeu_ + #71, #3967
  static menu_chapeu_ + #72, #3967
  static menu_chapeu_ + #73, #3967
  static menu_chapeu_ + #74, #3967
  static menu_chapeu_ + #75, #127
  static menu_chapeu_ + #76, #127
  static menu_chapeu_ + #77, #127
  static menu_chapeu_ + #78, #127
  static menu_chapeu_ + #79, #127

  ;Linha 2
  static menu_chapeu_ + #80, #3967
  static menu_chapeu_ + #81, #127
  static menu_chapeu_ + #82, #127
  static menu_chapeu_ + #83, #127
  static menu_chapeu_ + #84, #127
  static menu_chapeu_ + #85, #127
  static menu_chapeu_ + #86, #127
  static menu_chapeu_ + #87, #127
  static menu_chapeu_ + #88, #127
  static menu_chapeu_ + #89, #127
  static menu_chapeu_ + #90, #127
  static menu_chapeu_ + #91, #127
  static menu_chapeu_ + #92, #127
  static menu_chapeu_ + #93, #127
  static menu_chapeu_ + #94, #127
  static menu_chapeu_ + #95, #127
  static menu_chapeu_ + #96, #127
  static menu_chapeu_ + #97, #127
  static menu_chapeu_ + #98, #3967
  static menu_chapeu_ + #99, #3967
  static menu_chapeu_ + #100, #127
  static menu_chapeu_ + #101, #127
  static menu_chapeu_ + #102, #127
  static menu_chapeu_ + #103, #127
  static menu_chapeu_ + #104, #127
  static menu_chapeu_ + #105, #127
  static menu_chapeu_ + #106, #0
  static menu_chapeu_ + #107, #0
  static menu_chapeu_ + #108, #0
  static menu_chapeu_ + #109, #0
  static menu_chapeu_ + #110, #127
  static menu_chapeu_ + #111, #3967
  static menu_chapeu_ + #112, #3967
  static menu_chapeu_ + #113, #3967
  static menu_chapeu_ + #114, #3967
  static menu_chapeu_ + #115, #127
  static menu_chapeu_ + #116, #127
  static menu_chapeu_ + #117, #127
  static menu_chapeu_ + #118, #127
  static menu_chapeu_ + #119, #127

  ;Linha 3
  static menu_chapeu_ + #120, #3967
  static menu_chapeu_ + #121, #127
  static menu_chapeu_ + #122, #127
  static menu_chapeu_ + #123, #127
  static menu_chapeu_ + #124, #127
  static menu_chapeu_ + #125, #3967
  static menu_chapeu_ + #126, #127
  static menu_chapeu_ + #127, #127
  static menu_chapeu_ + #128, #127
  static menu_chapeu_ + #129, #3967
  static menu_chapeu_ + #130, #3967
  static menu_chapeu_ + #131, #3967
  static menu_chapeu_ + #132, #3967
  static menu_chapeu_ + #133, #3967
  static menu_chapeu_ + #134, #127
  static menu_chapeu_ + #135, #3967
  static menu_chapeu_ + #136, #3967
  static menu_chapeu_ + #137, #3967
  static menu_chapeu_ + #138, #3967
  static menu_chapeu_ + #139, #3967
  static menu_chapeu_ + #140, #3967
  static menu_chapeu_ + #141, #3967
  static menu_chapeu_ + #142, #3967
  static menu_chapeu_ + #143, #3967
  static menu_chapeu_ + #144, #3967
  static menu_chapeu_ + #145, #127
  static menu_chapeu_ + #146, #3967
  static menu_chapeu_ + #147, #0
  static menu_chapeu_ + #148, #0
  static menu_chapeu_ + #149, #127
  static menu_chapeu_ + #150, #127
  static menu_chapeu_ + #151, #3967
  static menu_chapeu_ + #152, #3967
  static menu_chapeu_ + #153, #3967
  static menu_chapeu_ + #154, #3967
  static menu_chapeu_ + #155, #127
  static menu_chapeu_ + #156, #127
  static menu_chapeu_ + #157, #127
  static menu_chapeu_ + #158, #127
  static menu_chapeu_ + #159, #127

  ;Linha 4
  static menu_chapeu_ + #160, #3967
  static menu_chapeu_ + #161, #127
  static menu_chapeu_ + #162, #127
  static menu_chapeu_ + #163, #127
  static menu_chapeu_ + #164, #127
  static menu_chapeu_ + #165, #3967
  static menu_chapeu_ + #166, #3967
  static menu_chapeu_ + #167, #127
  static menu_chapeu_ + #168, #3967
  static menu_chapeu_ + #169, #3967
  static menu_chapeu_ + #170, #3967
  static menu_chapeu_ + #171, #3967
  static menu_chapeu_ + #172, #127
  static menu_chapeu_ + #173, #127
  static menu_chapeu_ + #174, #3967
  static menu_chapeu_ + #175, #3967
  static menu_chapeu_ + #176, #3967
  static menu_chapeu_ + #177, #3967
  static menu_chapeu_ + #178, #3967
  static menu_chapeu_ + #179, #3967
  static menu_chapeu_ + #180, #127
  static menu_chapeu_ + #181, #127
  static menu_chapeu_ + #182, #3967
  static menu_chapeu_ + #183, #127
  static menu_chapeu_ + #184, #127
  static menu_chapeu_ + #185, #127
  static menu_chapeu_ + #186, #3967
  static menu_chapeu_ + #187, #0
  static menu_chapeu_ + #188, #0
  static menu_chapeu_ + #189, #3967
  static menu_chapeu_ + #190, #127
  static menu_chapeu_ + #191, #3967
  static menu_chapeu_ + #192, #127
  static menu_chapeu_ + #193, #3967
  static menu_chapeu_ + #194, #127
  static menu_chapeu_ + #195, #3967
  static menu_chapeu_ + #196, #3967
  static menu_chapeu_ + #197, #3967
  static menu_chapeu_ + #198, #3967
  static menu_chapeu_ + #199, #3967

  ;Linha 5
  static menu_chapeu_ + #200, #3967
  static menu_chapeu_ + #201, #3967
  static menu_chapeu_ + #202, #3967
  static menu_chapeu_ + #203, #3967
  static menu_chapeu_ + #204, #127
  static menu_chapeu_ + #205, #3967
  static menu_chapeu_ + #206, #3967
  static menu_chapeu_ + #207, #3967
  static menu_chapeu_ + #208, #3967
  static menu_chapeu_ + #209, #3967
  static menu_chapeu_ + #210, #3967
  static menu_chapeu_ + #211, #3967
  static menu_chapeu_ + #212, #3967
  static menu_chapeu_ + #213, #3967
  static menu_chapeu_ + #214, #127
  static menu_chapeu_ + #215, #3967
  static menu_chapeu_ + #216, #3967
  static menu_chapeu_ + #217, #3967
  static menu_chapeu_ + #218, #3967
  static menu_chapeu_ + #219, #3967
  static menu_chapeu_ + #220, #3967
  static menu_chapeu_ + #221, #3967
  static menu_chapeu_ + #222, #3967
  static menu_chapeu_ + #223, #3967
  static menu_chapeu_ + #224, #3967
  static menu_chapeu_ + #225, #127
  static menu_chapeu_ + #226, #3967
  static menu_chapeu_ + #227, #3967
  static menu_chapeu_ + #228, #3967
  static menu_chapeu_ + #229, #3967
  static menu_chapeu_ + #230, #127
  static menu_chapeu_ + #231, #3967
  static menu_chapeu_ + #232, #3967
  static menu_chapeu_ + #233, #3967
  static menu_chapeu_ + #234, #127
  static menu_chapeu_ + #235, #127
  static menu_chapeu_ + #236, #127
  static menu_chapeu_ + #237, #127
  static menu_chapeu_ + #238, #127
  static menu_chapeu_ + #239, #127

  ;Linha 6
  static menu_chapeu_ + #240, #3967
  static menu_chapeu_ + #241, #127
  static menu_chapeu_ + #242, #127
  static menu_chapeu_ + #243, #127
  static menu_chapeu_ + #244, #127
  static menu_chapeu_ + #245, #0
  static menu_chapeu_ + #246, #3967
  static menu_chapeu_ + #247, #3967
  static menu_chapeu_ + #248, #3967
  static menu_chapeu_ + #249, #0
  static menu_chapeu_ + #250, #127
  static menu_chapeu_ + #251, #0
  static menu_chapeu_ + #252, #0
  static menu_chapeu_ + #253, #0
  static menu_chapeu_ + #254, #127
  static menu_chapeu_ + #255, #3967
  static menu_chapeu_ + #256, #0
  static menu_chapeu_ + #257, #0
  static menu_chapeu_ + #258, #0
  static menu_chapeu_ + #259, #3967
  static menu_chapeu_ + #260, #0
  static menu_chapeu_ + #261, #0
  static menu_chapeu_ + #262, #0
  static menu_chapeu_ + #263, #0
  static menu_chapeu_ + #264, #0
  static menu_chapeu_ + #265, #127
  static menu_chapeu_ + #266, #0
  static menu_chapeu_ + #267, #0
  static menu_chapeu_ + #268, #0
  static menu_chapeu_ + #269, #3967
  static menu_chapeu_ + #270, #127
  static menu_chapeu_ + #271, #0
  static menu_chapeu_ + #272, #0
  static menu_chapeu_ + #273, #0
  static menu_chapeu_ + #274, #127
  static menu_chapeu_ + #275, #127
  static menu_chapeu_ + #276, #127
  static menu_chapeu_ + #277, #127
  static menu_chapeu_ + #278, #127
  static menu_chapeu_ + #279, #127

  ;Linha 7
  static menu_chapeu_ + #280, #3967
  static menu_chapeu_ + #281, #127
  static menu_chapeu_ + #282, #127
  static menu_chapeu_ + #283, #127
  static menu_chapeu_ + #284, #127
  static menu_chapeu_ + #285, #0
  static menu_chapeu_ + #286, #0
  static menu_chapeu_ + #287, #3967
  static menu_chapeu_ + #288, #0
  static menu_chapeu_ + #289, #0
  static menu_chapeu_ + #290, #127
  static menu_chapeu_ + #291, #0
  static menu_chapeu_ + #292, #3967
  static menu_chapeu_ + #293, #3967
  static menu_chapeu_ + #294, #3967
  static menu_chapeu_ + #295, #0
  static menu_chapeu_ + #296, #3967
  static menu_chapeu_ + #297, #3967
  static menu_chapeu_ + #298, #3967
  static menu_chapeu_ + #299, #3967
  static menu_chapeu_ + #300, #127
  static menu_chapeu_ + #301, #127
  static menu_chapeu_ + #302, #0
  static menu_chapeu_ + #303, #127
  static menu_chapeu_ + #304, #127
  static menu_chapeu_ + #305, #127
  static menu_chapeu_ + #306, #0
  static menu_chapeu_ + #307, #3967
  static menu_chapeu_ + #308, #3967
  static menu_chapeu_ + #309, #0
  static menu_chapeu_ + #310, #127
  static menu_chapeu_ + #311, #0
  static menu_chapeu_ + #312, #3967
  static menu_chapeu_ + #313, #3967
  static menu_chapeu_ + #314, #127
  static menu_chapeu_ + #315, #127
  static menu_chapeu_ + #316, #127
  static menu_chapeu_ + #317, #127
  static menu_chapeu_ + #318, #127
  static menu_chapeu_ + #319, #127

  ;Linha 8
  static menu_chapeu_ + #320, #3967
  static menu_chapeu_ + #321, #127
  static menu_chapeu_ + #322, #127
  static menu_chapeu_ + #323, #127
  static menu_chapeu_ + #324, #127
  static menu_chapeu_ + #325, #0
  static menu_chapeu_ + #326, #127
  static menu_chapeu_ + #327, #0
  static menu_chapeu_ + #328, #127
  static menu_chapeu_ + #329, #0
  static menu_chapeu_ + #330, #127
  static menu_chapeu_ + #331, #0
  static menu_chapeu_ + #332, #0
  static menu_chapeu_ + #333, #3967
  static menu_chapeu_ + #334, #127
  static menu_chapeu_ + #335, #3967
  static menu_chapeu_ + #336, #0
  static menu_chapeu_ + #337, #0
  static menu_chapeu_ + #338, #3967
  static menu_chapeu_ + #339, #3967
  static menu_chapeu_ + #340, #127
  static menu_chapeu_ + #341, #127
  static menu_chapeu_ + #342, #0
  static menu_chapeu_ + #343, #127
  static menu_chapeu_ + #344, #127
  static menu_chapeu_ + #345, #127
  static menu_chapeu_ + #346, #0
  static menu_chapeu_ + #347, #0
  static menu_chapeu_ + #348, #0
  static menu_chapeu_ + #349, #3967
  static menu_chapeu_ + #350, #127
  static menu_chapeu_ + #351, #0
  static menu_chapeu_ + #352, #0
  static menu_chapeu_ + #353, #3967
  static menu_chapeu_ + #354, #127
  static menu_chapeu_ + #355, #127
  static menu_chapeu_ + #356, #127
  static menu_chapeu_ + #357, #127
  static menu_chapeu_ + #358, #127
  static menu_chapeu_ + #359, #127

  ;Linha 9
  static menu_chapeu_ + #360, #3967
  static menu_chapeu_ + #361, #127
  static menu_chapeu_ + #362, #127
  static menu_chapeu_ + #363, #127
  static menu_chapeu_ + #364, #127
  static menu_chapeu_ + #365, #0
  static menu_chapeu_ + #366, #127
  static menu_chapeu_ + #367, #127
  static menu_chapeu_ + #368, #127
  static menu_chapeu_ + #369, #0
  static menu_chapeu_ + #370, #127
  static menu_chapeu_ + #371, #0
  static menu_chapeu_ + #372, #3967
  static menu_chapeu_ + #373, #3967
  static menu_chapeu_ + #374, #3967
  static menu_chapeu_ + #375, #3967
  static menu_chapeu_ + #376, #3967
  static menu_chapeu_ + #377, #3967
  static menu_chapeu_ + #378, #0
  static menu_chapeu_ + #379, #3967
  static menu_chapeu_ + #380, #3967
  static menu_chapeu_ + #381, #3967
  static menu_chapeu_ + #382, #0
  static menu_chapeu_ + #383, #3967
  static menu_chapeu_ + #384, #127
  static menu_chapeu_ + #385, #127
  static menu_chapeu_ + #386, #0
  static menu_chapeu_ + #387, #3967
  static menu_chapeu_ + #388, #3967
  static menu_chapeu_ + #389, #0
  static menu_chapeu_ + #390, #127
  static menu_chapeu_ + #391, #0
  static menu_chapeu_ + #392, #3967
  static menu_chapeu_ + #393, #3967
  static menu_chapeu_ + #394, #127
  static menu_chapeu_ + #395, #127
  static menu_chapeu_ + #396, #127
  static menu_chapeu_ + #397, #127
  static menu_chapeu_ + #398, #127
  static menu_chapeu_ + #399, #127

  ;Linha 10
  static menu_chapeu_ + #400, #3967
  static menu_chapeu_ + #401, #127
  static menu_chapeu_ + #402, #127
  static menu_chapeu_ + #403, #127
  static menu_chapeu_ + #404, #127
  static menu_chapeu_ + #405, #0
  static menu_chapeu_ + #406, #127
  static menu_chapeu_ + #407, #127
  static menu_chapeu_ + #408, #3967
  static menu_chapeu_ + #409, #0
  static menu_chapeu_ + #410, #3967
  static menu_chapeu_ + #411, #0
  static menu_chapeu_ + #412, #0
  static menu_chapeu_ + #413, #0
  static menu_chapeu_ + #414, #127
  static menu_chapeu_ + #415, #0
  static menu_chapeu_ + #416, #0
  static menu_chapeu_ + #417, #0
  static menu_chapeu_ + #418, #3967
  static menu_chapeu_ + #419, #3967
  static menu_chapeu_ + #420, #3967
  static menu_chapeu_ + #421, #127
  static menu_chapeu_ + #422, #0
  static menu_chapeu_ + #423, #127
  static menu_chapeu_ + #424, #127
  static menu_chapeu_ + #425, #3967
  static menu_chapeu_ + #426, #0
  static menu_chapeu_ + #427, #127
  static menu_chapeu_ + #428, #3967
  static menu_chapeu_ + #429, #0
  static menu_chapeu_ + #430, #127
  static menu_chapeu_ + #431, #0
  static menu_chapeu_ + #432, #0
  static menu_chapeu_ + #433, #0
  static menu_chapeu_ + #434, #127
  static menu_chapeu_ + #435, #127
  static menu_chapeu_ + #436, #127
  static menu_chapeu_ + #437, #127
  static menu_chapeu_ + #438, #127
  static menu_chapeu_ + #439, #127

  ;Linha 11
  static menu_chapeu_ + #440, #3967
  static menu_chapeu_ + #441, #127
  static menu_chapeu_ + #442, #127
  static menu_chapeu_ + #443, #127
  static menu_chapeu_ + #444, #127
  static menu_chapeu_ + #445, #127
  static menu_chapeu_ + #446, #127
  static menu_chapeu_ + #447, #127
  static menu_chapeu_ + #448, #127
  static menu_chapeu_ + #449, #127
  static menu_chapeu_ + #450, #3967
  static menu_chapeu_ + #451, #3967
  static menu_chapeu_ + #452, #3967
  static menu_chapeu_ + #453, #3967
  static menu_chapeu_ + #454, #127
  static menu_chapeu_ + #455, #3967
  static menu_chapeu_ + #456, #127
  static menu_chapeu_ + #457, #127
  static menu_chapeu_ + #458, #3967
  static menu_chapeu_ + #459, #3967
  static menu_chapeu_ + #460, #3967
  static menu_chapeu_ + #461, #3967
  static menu_chapeu_ + #462, #3967
  static menu_chapeu_ + #463, #3967
  static menu_chapeu_ + #464, #127
  static menu_chapeu_ + #465, #3967
  static menu_chapeu_ + #466, #3967
  static menu_chapeu_ + #467, #3967
  static menu_chapeu_ + #468, #3967
  static menu_chapeu_ + #469, #127
  static menu_chapeu_ + #470, #127
  static menu_chapeu_ + #471, #127
  static menu_chapeu_ + #472, #127
  static menu_chapeu_ + #473, #127
  static menu_chapeu_ + #474, #127
  static menu_chapeu_ + #475, #127
  static menu_chapeu_ + #476, #127
  static menu_chapeu_ + #477, #127
  static menu_chapeu_ + #478, #127
  static menu_chapeu_ + #479, #127

  ;Linha 12
  static menu_chapeu_ + #480, #3967
  static menu_chapeu_ + #481, #127
  static menu_chapeu_ + #482, #127
  static menu_chapeu_ + #483, #127
  static menu_chapeu_ + #484, #127
  static menu_chapeu_ + #485, #127
  static menu_chapeu_ + #486, #127
  static menu_chapeu_ + #487, #127
  static menu_chapeu_ + #488, #127
  static menu_chapeu_ + #489, #127
  static menu_chapeu_ + #490, #3967
  static menu_chapeu_ + #491, #3967
  static menu_chapeu_ + #492, #3967
  static menu_chapeu_ + #493, #3967
  static menu_chapeu_ + #494, #3967
  static menu_chapeu_ + #495, #3967
  static menu_chapeu_ + #496, #127
  static menu_chapeu_ + #497, #3967
  static menu_chapeu_ + #498, #3967
  static menu_chapeu_ + #499, #3967
  static menu_chapeu_ + #500, #3967
  static menu_chapeu_ + #501, #3967
  static menu_chapeu_ + #502, #3967
  static menu_chapeu_ + #503, #3967
  static menu_chapeu_ + #504, #127
  static menu_chapeu_ + #505, #3967
  static menu_chapeu_ + #506, #3967
  static menu_chapeu_ + #507, #3967
  static menu_chapeu_ + #508, #3967
  static menu_chapeu_ + #509, #127
  static menu_chapeu_ + #510, #127
  static menu_chapeu_ + #511, #127
  static menu_chapeu_ + #512, #127
  static menu_chapeu_ + #513, #127
  static menu_chapeu_ + #514, #127
  static menu_chapeu_ + #515, #127
  static menu_chapeu_ + #516, #127
  static menu_chapeu_ + #517, #127
  static menu_chapeu_ + #518, #127
  static menu_chapeu_ + #519, #127

  ;Linha 13
  static menu_chapeu_ + #520, #3967
  static menu_chapeu_ + #521, #127
  static menu_chapeu_ + #522, #127
  static menu_chapeu_ + #523, #127
  static menu_chapeu_ + #524, #127
  static menu_chapeu_ + #525, #127
  static menu_chapeu_ + #526, #127
  static menu_chapeu_ + #527, #127
  static menu_chapeu_ + #528, #127
  static menu_chapeu_ + #529, #127
  static menu_chapeu_ + #530, #3967
  static menu_chapeu_ + #531, #0
  static menu_chapeu_ + #532, #0
  static menu_chapeu_ + #533, #0
  static menu_chapeu_ + #534, #127
  static menu_chapeu_ + #535, #0
  static menu_chapeu_ + #536, #3967
  static menu_chapeu_ + #537, #3967
  static menu_chapeu_ + #538, #0
  static menu_chapeu_ + #539, #3967
  static menu_chapeu_ + #540, #3967
  static menu_chapeu_ + #541, #0
  static menu_chapeu_ + #542, #0
  static menu_chapeu_ + #543, #0
  static menu_chapeu_ + #544, #3967
  static menu_chapeu_ + #545, #3967
  static menu_chapeu_ + #546, #0
  static menu_chapeu_ + #547, #0
  static menu_chapeu_ + #548, #3967
  static menu_chapeu_ + #549, #127
  static menu_chapeu_ + #550, #127
  static menu_chapeu_ + #551, #127
  static menu_chapeu_ + #552, #127
  static menu_chapeu_ + #553, #127
  static menu_chapeu_ + #554, #127
  static menu_chapeu_ + #555, #127
  static menu_chapeu_ + #556, #127
  static menu_chapeu_ + #557, #127
  static menu_chapeu_ + #558, #127
  static menu_chapeu_ + #559, #127

  ;Linha 14
  static menu_chapeu_ + #560, #127
  static menu_chapeu_ + #561, #3967
  static menu_chapeu_ + #562, #127
  static menu_chapeu_ + #563, #127
  static menu_chapeu_ + #564, #127
  static menu_chapeu_ + #565, #127
  static menu_chapeu_ + #566, #127
  static menu_chapeu_ + #567, #127
  static menu_chapeu_ + #568, #127
  static menu_chapeu_ + #569, #127
  static menu_chapeu_ + #570, #0
  static menu_chapeu_ + #571, #127
  static menu_chapeu_ + #572, #127
  static menu_chapeu_ + #573, #127
  static menu_chapeu_ + #574, #127
  static menu_chapeu_ + #575, #0
  static menu_chapeu_ + #576, #127
  static menu_chapeu_ + #577, #127
  static menu_chapeu_ + #578, #0
  static menu_chapeu_ + #579, #3967
  static menu_chapeu_ + #580, #0
  static menu_chapeu_ + #581, #127
  static menu_chapeu_ + #582, #127
  static menu_chapeu_ + #583, #127
  static menu_chapeu_ + #584, #127
  static menu_chapeu_ + #585, #0
  static menu_chapeu_ + #586, #3967
  static menu_chapeu_ + #587, #3967
  static menu_chapeu_ + #588, #0
  static menu_chapeu_ + #589, #127
  static menu_chapeu_ + #590, #127
  static menu_chapeu_ + #591, #127
  static menu_chapeu_ + #592, #127
  static menu_chapeu_ + #593, #127
  static menu_chapeu_ + #594, #127
  static menu_chapeu_ + #595, #127
  static menu_chapeu_ + #596, #127
  static menu_chapeu_ + #597, #127
  static menu_chapeu_ + #598, #127
  static menu_chapeu_ + #599, #127

  ;Linha 15
  static menu_chapeu_ + #600, #127
  static menu_chapeu_ + #601, #3967
  static menu_chapeu_ + #602, #127
  static menu_chapeu_ + #603, #127
  static menu_chapeu_ + #604, #127
  static menu_chapeu_ + #605, #127
  static menu_chapeu_ + #606, #127
  static menu_chapeu_ + #607, #127
  static menu_chapeu_ + #608, #127
  static menu_chapeu_ + #609, #127
  static menu_chapeu_ + #610, #0
  static menu_chapeu_ + #611, #3967
  static menu_chapeu_ + #612, #3967
  static menu_chapeu_ + #613, #3967
  static menu_chapeu_ + #614, #127
  static menu_chapeu_ + #615, #0
  static menu_chapeu_ + #616, #127
  static menu_chapeu_ + #617, #127
  static menu_chapeu_ + #618, #0
  static menu_chapeu_ + #619, #3967
  static menu_chapeu_ + #620, #0
  static menu_chapeu_ + #621, #3967
  static menu_chapeu_ + #622, #3967
  static menu_chapeu_ + #623, #3967
  static menu_chapeu_ + #624, #127
  static menu_chapeu_ + #625, #0
  static menu_chapeu_ + #626, #0
  static menu_chapeu_ + #627, #0
  static menu_chapeu_ + #628, #0
  static menu_chapeu_ + #629, #127
  static menu_chapeu_ + #630, #127
  static menu_chapeu_ + #631, #127
  static menu_chapeu_ + #632, #127
  static menu_chapeu_ + #633, #127
  static menu_chapeu_ + #634, #127
  static menu_chapeu_ + #635, #127
  static menu_chapeu_ + #636, #127
  static menu_chapeu_ + #637, #127
  static menu_chapeu_ + #638, #127
  static menu_chapeu_ + #639, #127

  ;Linha 16
  static menu_chapeu_ + #640, #3967
  static menu_chapeu_ + #641, #3967
  static menu_chapeu_ + #642, #127
  static menu_chapeu_ + #643, #127
  static menu_chapeu_ + #644, #127
  static menu_chapeu_ + #645, #127
  static menu_chapeu_ + #646, #127
  static menu_chapeu_ + #647, #127
  static menu_chapeu_ + #648, #127
  static menu_chapeu_ + #649, #127
  static menu_chapeu_ + #650, #0
  static menu_chapeu_ + #651, #3967
  static menu_chapeu_ + #652, #3967
  static menu_chapeu_ + #653, #3967
  static menu_chapeu_ + #654, #127
  static menu_chapeu_ + #655, #0
  static menu_chapeu_ + #656, #3967
  static menu_chapeu_ + #657, #3967
  static menu_chapeu_ + #658, #0
  static menu_chapeu_ + #659, #3967
  static menu_chapeu_ + #660, #0
  static menu_chapeu_ + #661, #3967
  static menu_chapeu_ + #662, #3967
  static menu_chapeu_ + #663, #3967
  static menu_chapeu_ + #664, #127
  static menu_chapeu_ + #665, #0
  static menu_chapeu_ + #666, #3967
  static menu_chapeu_ + #667, #3967
  static menu_chapeu_ + #668, #0
  static menu_chapeu_ + #669, #127
  static menu_chapeu_ + #670, #127
  static menu_chapeu_ + #671, #127
  static menu_chapeu_ + #672, #127
  static menu_chapeu_ + #673, #127
  static menu_chapeu_ + #674, #127
  static menu_chapeu_ + #675, #127
  static menu_chapeu_ + #676, #127
  static menu_chapeu_ + #677, #127
  static menu_chapeu_ + #678, #127
  static menu_chapeu_ + #679, #127

  ;Linha 17
  static menu_chapeu_ + #680, #3967
  static menu_chapeu_ + #681, #127
  static menu_chapeu_ + #682, #127
  static menu_chapeu_ + #683, #127
  static menu_chapeu_ + #684, #127
  static menu_chapeu_ + #685, #127
  static menu_chapeu_ + #686, #127
  static menu_chapeu_ + #687, #127
  static menu_chapeu_ + #688, #127
  static menu_chapeu_ + #689, #127
  static menu_chapeu_ + #690, #127
  static menu_chapeu_ + #691, #0
  static menu_chapeu_ + #692, #0
  static menu_chapeu_ + #693, #0
  static menu_chapeu_ + #694, #127
  static menu_chapeu_ + #695, #127
  static menu_chapeu_ + #696, #0
  static menu_chapeu_ + #697, #0
  static menu_chapeu_ + #698, #127
  static menu_chapeu_ + #699, #3967
  static menu_chapeu_ + #700, #127
  static menu_chapeu_ + #701, #0
  static menu_chapeu_ + #702, #0
  static menu_chapeu_ + #703, #0
  static menu_chapeu_ + #704, #127
  static menu_chapeu_ + #705, #0
  static menu_chapeu_ + #706, #127
  static menu_chapeu_ + #707, #127
  static menu_chapeu_ + #708, #0
  static menu_chapeu_ + #709, #127
  static menu_chapeu_ + #710, #127
  static menu_chapeu_ + #711, #127
  static menu_chapeu_ + #712, #127
  static menu_chapeu_ + #713, #127
  static menu_chapeu_ + #714, #127
  static menu_chapeu_ + #715, #127
  static menu_chapeu_ + #716, #127
  static menu_chapeu_ + #717, #127
  static menu_chapeu_ + #718, #127
  static menu_chapeu_ + #719, #127

  ;Linha 18
  static menu_chapeu_ + #720, #3967
  static menu_chapeu_ + #721, #127
  static menu_chapeu_ + #722, #127
  static menu_chapeu_ + #723, #127
  static menu_chapeu_ + #724, #127
  static menu_chapeu_ + #725, #127
  static menu_chapeu_ + #726, #127
  static menu_chapeu_ + #727, #127
  static menu_chapeu_ + #728, #127
  static menu_chapeu_ + #729, #127
  static menu_chapeu_ + #730, #127
  static menu_chapeu_ + #731, #127
  static menu_chapeu_ + #732, #127
  static menu_chapeu_ + #733, #127
  static menu_chapeu_ + #734, #127
  static menu_chapeu_ + #735, #127
  static menu_chapeu_ + #736, #127
  static menu_chapeu_ + #737, #127
  static menu_chapeu_ + #738, #127
  static menu_chapeu_ + #739, #3967
  static menu_chapeu_ + #740, #127
  static menu_chapeu_ + #741, #3967
  static menu_chapeu_ + #742, #3967
  static menu_chapeu_ + #743, #127
  static menu_chapeu_ + #744, #127
  static menu_chapeu_ + #745, #127
  static menu_chapeu_ + #746, #127
  static menu_chapeu_ + #747, #127
  static menu_chapeu_ + #748, #127
  static menu_chapeu_ + #749, #127
  static menu_chapeu_ + #750, #127
  static menu_chapeu_ + #751, #127
  static menu_chapeu_ + #752, #127
  static menu_chapeu_ + #753, #127
  static menu_chapeu_ + #754, #127
  static menu_chapeu_ + #755, #127
  static menu_chapeu_ + #756, #127
  static menu_chapeu_ + #757, #127
  static menu_chapeu_ + #758, #127
  static menu_chapeu_ + #759, #127

  ;Linha 19
  static menu_chapeu_ + #760, #3967
  static menu_chapeu_ + #761, #127
  static menu_chapeu_ + #762, #127
  static menu_chapeu_ + #763, #127
  static menu_chapeu_ + #764, #127
  static menu_chapeu_ + #765, #127
  static menu_chapeu_ + #766, #127
  static menu_chapeu_ + #767, #127
  static menu_chapeu_ + #768, #127
  static menu_chapeu_ + #769, #127
  static menu_chapeu_ + #770, #127
  static menu_chapeu_ + #771, #127
  static menu_chapeu_ + #772, #127
  static menu_chapeu_ + #773, #127
  static menu_chapeu_ + #774, #3967
  static menu_chapeu_ + #775, #3967
  static menu_chapeu_ + #776, #3967
  static menu_chapeu_ + #777, #3967
  static menu_chapeu_ + #778, #3967
  static menu_chapeu_ + #779, #3967
  static menu_chapeu_ + #780, #3967
  static menu_chapeu_ + #781, #3967
  static menu_chapeu_ + #782, #3967
  static menu_chapeu_ + #783, #3967
  static menu_chapeu_ + #784, #3967
  static menu_chapeu_ + #785, #127
  static menu_chapeu_ + #786, #127
  static menu_chapeu_ + #787, #127
  static menu_chapeu_ + #788, #127
  static menu_chapeu_ + #789, #127
  static menu_chapeu_ + #790, #127
  static menu_chapeu_ + #791, #127
  static menu_chapeu_ + #792, #127
  static menu_chapeu_ + #793, #127
  static menu_chapeu_ + #794, #127
  static menu_chapeu_ + #795, #127
  static menu_chapeu_ + #796, #127
  static menu_chapeu_ + #797, #127
  static menu_chapeu_ + #798, #127
  static menu_chapeu_ + #799, #127

  ;Linha 20
  static menu_chapeu_ + #800, #3967
  static menu_chapeu_ + #801, #3967
  static menu_chapeu_ + #802, #127
  static menu_chapeu_ + #803, #127
  static menu_chapeu_ + #804, #127
  static menu_chapeu_ + #805, #127
  static menu_chapeu_ + #806, #127
  static menu_chapeu_ + #807, #127
  static menu_chapeu_ + #808, #127
  static menu_chapeu_ + #809, #127
  static menu_chapeu_ + #810, #127
  static menu_chapeu_ + #811, #127
  static menu_chapeu_ + #812, #127
  static menu_chapeu_ + #813, #127
  static menu_chapeu_ + #814, #127
  static menu_chapeu_ + #815, #80
  static menu_chapeu_ + #816, #82
  static menu_chapeu_ + #817, #69
  static menu_chapeu_ + #818, #83
  static menu_chapeu_ + #819, #83
  static menu_chapeu_ + #820, #73
  static menu_chapeu_ + #821, #79
  static menu_chapeu_ + #822, #78
  static menu_chapeu_ + #823, #69
  static menu_chapeu_ + #824, #58
  static menu_chapeu_ + #825, #127
  static menu_chapeu_ + #826, #127
  static menu_chapeu_ + #827, #127
  static menu_chapeu_ + #828, #127
  static menu_chapeu_ + #829, #127
  static menu_chapeu_ + #830, #127
  static menu_chapeu_ + #831, #127
  static menu_chapeu_ + #832, #127
  static menu_chapeu_ + #833, #127
  static menu_chapeu_ + #834, #127
  static menu_chapeu_ + #835, #127
  static menu_chapeu_ + #836, #127
  static menu_chapeu_ + #837, #127
  static menu_chapeu_ + #838, #127
  static menu_chapeu_ + #839, #127

  ;Linha 21
  static menu_chapeu_ + #840, #127
  static menu_chapeu_ + #841, #3967
  static menu_chapeu_ + #842, #127
  static menu_chapeu_ + #843, #127
  static menu_chapeu_ + #844, #127
  static menu_chapeu_ + #845, #127
  static menu_chapeu_ + #846, #127
  static menu_chapeu_ + #847, #127
  static menu_chapeu_ + #848, #127
  static menu_chapeu_ + #849, #127
  static menu_chapeu_ + #850, #127
  static menu_chapeu_ + #851, #127
  static menu_chapeu_ + #852, #127
  static menu_chapeu_ + #853, #127
  static menu_chapeu_ + #854, #127
  static menu_chapeu_ + #855, #127
  static menu_chapeu_ + #856, #3967
  static menu_chapeu_ + #857, #3967
  static menu_chapeu_ + #858, #3967
  static menu_chapeu_ + #859, #3967
  static menu_chapeu_ + #860, #3967
  static menu_chapeu_ + #861, #3967
  static menu_chapeu_ + #862, #3967
  static menu_chapeu_ + #863, #127
  static menu_chapeu_ + #864, #127
  static menu_chapeu_ + #865, #3967
  static menu_chapeu_ + #866, #127
  static menu_chapeu_ + #867, #127
  static menu_chapeu_ + #868, #127
  static menu_chapeu_ + #869, #127
  static menu_chapeu_ + #870, #127
  static menu_chapeu_ + #871, #127
  static menu_chapeu_ + #872, #127
  static menu_chapeu_ + #873, #127
  static menu_chapeu_ + #874, #127
  static menu_chapeu_ + #875, #127
  static menu_chapeu_ + #876, #127
  static menu_chapeu_ + #877, #127
  static menu_chapeu_ + #878, #127
  static menu_chapeu_ + #879, #127

  ;Linha 22
  static menu_chapeu_ + #880, #127
  static menu_chapeu_ + #881, #127
  static menu_chapeu_ + #882, #127
  static menu_chapeu_ + #883, #127
  static menu_chapeu_ + #884, #127
  static menu_chapeu_ + #885, #127
  static menu_chapeu_ + #886, #127
  static menu_chapeu_ + #887, #127
  static menu_chapeu_ + #888, #127
  static menu_chapeu_ + #889, #127
  static menu_chapeu_ + #890, #127
  static menu_chapeu_ + #891, #127
  static menu_chapeu_ + #892, #127
  static menu_chapeu_ + #893, #127
  static menu_chapeu_ + #894, #127
  static menu_chapeu_ + #895, #3967
  static menu_chapeu_ + #896, #49
  static menu_chapeu_ + #897, #45
  static menu_chapeu_ + #898, #74
  static menu_chapeu_ + #899, #79
  static menu_chapeu_ + #900, #71
  static menu_chapeu_ + #901, #65
  static menu_chapeu_ + #902, #82
  static menu_chapeu_ + #903, #127
  static menu_chapeu_ + #904, #3967
  static menu_chapeu_ + #905, #3967
  static menu_chapeu_ + #906, #127
  static menu_chapeu_ + #907, #127
  static menu_chapeu_ + #908, #127
  static menu_chapeu_ + #909, #127
  static menu_chapeu_ + #910, #127
  static menu_chapeu_ + #911, #127
  static menu_chapeu_ + #912, #127
  static menu_chapeu_ + #913, #127
  static menu_chapeu_ + #914, #127
  static menu_chapeu_ + #915, #127
  static menu_chapeu_ + #916, #127
  static menu_chapeu_ + #917, #127
  static menu_chapeu_ + #918, #127
  static menu_chapeu_ + #919, #127

  ;Linha 23
  static menu_chapeu_ + #920, #127
  static menu_chapeu_ + #921, #127
  static menu_chapeu_ + #922, #127
  static menu_chapeu_ + #923, #127
  static menu_chapeu_ + #924, #127
  static menu_chapeu_ + #925, #127
  static menu_chapeu_ + #926, #127
  static menu_chapeu_ + #927, #127
  static menu_chapeu_ + #928, #127
  static menu_chapeu_ + #929, #127
  static menu_chapeu_ + #930, #127
  static menu_chapeu_ + #931, #127
  static menu_chapeu_ + #932, #127
  static menu_chapeu_ + #933, #127
  static menu_chapeu_ + #934, #127
  static menu_chapeu_ + #935, #3967
  static menu_chapeu_ + #936, #3967
  static menu_chapeu_ + #937, #3967
  static menu_chapeu_ + #938, #3967
  static menu_chapeu_ + #939, #3967
  static menu_chapeu_ + #940, #3967
  static menu_chapeu_ + #941, #3967
  static menu_chapeu_ + #942, #3967
  static menu_chapeu_ + #943, #3967
  static menu_chapeu_ + #944, #3967
  static menu_chapeu_ + #945, #127
  static menu_chapeu_ + #946, #127
  static menu_chapeu_ + #947, #127
  static menu_chapeu_ + #948, #127
  static menu_chapeu_ + #949, #127
  static menu_chapeu_ + #950, #127
  static menu_chapeu_ + #951, #127
  static menu_chapeu_ + #952, #127
  static menu_chapeu_ + #953, #127
  static menu_chapeu_ + #954, #127
  static menu_chapeu_ + #955, #127
  static menu_chapeu_ + #956, #127
  static menu_chapeu_ + #957, #127
  static menu_chapeu_ + #958, #127
  static menu_chapeu_ + #959, #127

  ;Linha 24
  static menu_chapeu_ + #960, #127
  static menu_chapeu_ + #961, #127
  static menu_chapeu_ + #962, #127
  static menu_chapeu_ + #963, #127
  static menu_chapeu_ + #964, #127
  static menu_chapeu_ + #965, #127
  static menu_chapeu_ + #966, #127
  static menu_chapeu_ + #967, #127
  static menu_chapeu_ + #968, #127
  static menu_chapeu_ + #969, #127
  static menu_chapeu_ + #970, #127
  static menu_chapeu_ + #971, #127
  static menu_chapeu_ + #972, #127
  static menu_chapeu_ + #973, #127
  static menu_chapeu_ + #974, #127
  static menu_chapeu_ + #975, #50
  static menu_chapeu_ + #976, #45
  static menu_chapeu_ + #977, #84
  static menu_chapeu_ + #978, #85
  static menu_chapeu_ + #979, #84
  static menu_chapeu_ + #980, #79
  static menu_chapeu_ + #981, #82
  static menu_chapeu_ + #982, #73
  static menu_chapeu_ + #983, #65
  static menu_chapeu_ + #984, #76
  static menu_chapeu_ + #985, #127
  static menu_chapeu_ + #986, #127
  static menu_chapeu_ + #987, #127
  static menu_chapeu_ + #988, #127
  static menu_chapeu_ + #989, #127
  static menu_chapeu_ + #990, #127
  static menu_chapeu_ + #991, #127
  static menu_chapeu_ + #992, #127
  static menu_chapeu_ + #993, #127
  static menu_chapeu_ + #994, #127
  static menu_chapeu_ + #995, #127
  static menu_chapeu_ + #996, #127
  static menu_chapeu_ + #997, #127
  static menu_chapeu_ + #998, #127
  static menu_chapeu_ + #999, #127

  ;Linha 25
  static menu_chapeu_ + #1000, #127
  static menu_chapeu_ + #1001, #127
  static menu_chapeu_ + #1002, #127
  static menu_chapeu_ + #1003, #127
  static menu_chapeu_ + #1004, #127
  static menu_chapeu_ + #1005, #127
  static menu_chapeu_ + #1006, #127
  static menu_chapeu_ + #1007, #127
  static menu_chapeu_ + #1008, #127
  static menu_chapeu_ + #1009, #127
  static menu_chapeu_ + #1010, #127
  static menu_chapeu_ + #1011, #127
  static menu_chapeu_ + #1012, #127
  static menu_chapeu_ + #1013, #127
  static menu_chapeu_ + #1014, #127
  static menu_chapeu_ + #1015, #127
  static menu_chapeu_ + #1016, #127
  static menu_chapeu_ + #1017, #3967
  static menu_chapeu_ + #1018, #127
  static menu_chapeu_ + #1019, #3967
  static menu_chapeu_ + #1020, #127
  static menu_chapeu_ + #1021, #127
  static menu_chapeu_ + #1022, #127
  static menu_chapeu_ + #1023, #3967
  static menu_chapeu_ + #1024, #127
  static menu_chapeu_ + #1025, #127
  static menu_chapeu_ + #1026, #127
  static menu_chapeu_ + #1027, #127
  static menu_chapeu_ + #1028, #127
  static menu_chapeu_ + #1029, #127
  static menu_chapeu_ + #1030, #127
  static menu_chapeu_ + #1031, #127
  static menu_chapeu_ + #1032, #127
  static menu_chapeu_ + #1033, #127
  static menu_chapeu_ + #1034, #127
  static menu_chapeu_ + #1035, #127
  static menu_chapeu_ + #1036, #127
  static menu_chapeu_ + #1037, #127
  static menu_chapeu_ + #1038, #127
  static menu_chapeu_ + #1039, #127

  ;Linha 26
  static menu_chapeu_ + #1040, #127
  static menu_chapeu_ + #1041, #127
  static menu_chapeu_ + #1042, #127
  static menu_chapeu_ + #1043, #127
  static menu_chapeu_ + #1044, #127
  static menu_chapeu_ + #1045, #127
  static menu_chapeu_ + #1046, #127
  static menu_chapeu_ + #1047, #127
  static menu_chapeu_ + #1048, #127
  static menu_chapeu_ + #1049, #127
  static menu_chapeu_ + #1050, #127
  static menu_chapeu_ + #1051, #127
  static menu_chapeu_ + #1052, #127
  static menu_chapeu_ + #1053, #127
  static menu_chapeu_ + #1054, #127
  static menu_chapeu_ + #1055, #3967
  static menu_chapeu_ + #1056, #3967
  static menu_chapeu_ + #1057, #3967
  static menu_chapeu_ + #1058, #3967
  static menu_chapeu_ + #1059, #3967
  static menu_chapeu_ + #1060, #3967
  static menu_chapeu_ + #1061, #3967
  static menu_chapeu_ + #1062, #3967
  static menu_chapeu_ + #1063, #3967
  static menu_chapeu_ + #1064, #127
  static menu_chapeu_ + #1065, #127
  static menu_chapeu_ + #1066, #127
  static menu_chapeu_ + #1067, #127
  static menu_chapeu_ + #1068, #127
  static menu_chapeu_ + #1069, #127
  static menu_chapeu_ + #1070, #127
  static menu_chapeu_ + #1071, #127
  static menu_chapeu_ + #1072, #127
  static menu_chapeu_ + #1073, #127
  static menu_chapeu_ + #1074, #127
  static menu_chapeu_ + #1075, #127
  static menu_chapeu_ + #1076, #127
  static menu_chapeu_ + #1077, #127
  static menu_chapeu_ + #1078, #127
  static menu_chapeu_ + #1079, #127

  ;Linha 27
  static menu_chapeu_ + #1080, #127
  static menu_chapeu_ + #1081, #127
  static menu_chapeu_ + #1082, #127
  static menu_chapeu_ + #1083, #127
  static menu_chapeu_ + #1084, #127
  static menu_chapeu_ + #1085, #127
  static menu_chapeu_ + #1086, #127
  static menu_chapeu_ + #1087, #127
  static menu_chapeu_ + #1088, #127
  static menu_chapeu_ + #1089, #127
  static menu_chapeu_ + #1090, #127
  static menu_chapeu_ + #1091, #127
  static menu_chapeu_ + #1092, #127
  static menu_chapeu_ + #1093, #127
  static menu_chapeu_ + #1094, #127
  static menu_chapeu_ + #1095, #127
  static menu_chapeu_ + #1096, #127
  static menu_chapeu_ + #1097, #127
  static menu_chapeu_ + #1098, #3967
  static menu_chapeu_ + #1099, #3967
  static menu_chapeu_ + #1100, #127
  static menu_chapeu_ + #1101, #127
  static menu_chapeu_ + #1102, #3967
  static menu_chapeu_ + #1103, #127
  static menu_chapeu_ + #1104, #127
  static menu_chapeu_ + #1105, #127
  static menu_chapeu_ + #1106, #127
  static menu_chapeu_ + #1107, #127
  static menu_chapeu_ + #1108, #127
  static menu_chapeu_ + #1109, #127
  static menu_chapeu_ + #1110, #127
  static menu_chapeu_ + #1111, #127
  static menu_chapeu_ + #1112, #127
  static menu_chapeu_ + #1113, #127
  static menu_chapeu_ + #1114, #127
  static menu_chapeu_ + #1115, #127
  static menu_chapeu_ + #1116, #127
  static menu_chapeu_ + #1117, #127
  static menu_chapeu_ + #1118, #127
  static menu_chapeu_ + #1119, #127

  ;Linha 28
  static menu_chapeu_ + #1120, #127
  static menu_chapeu_ + #1121, #127
  static menu_chapeu_ + #1122, #127
  static menu_chapeu_ + #1123, #127
  static menu_chapeu_ + #1124, #127
  static menu_chapeu_ + #1125, #127
  static menu_chapeu_ + #1126, #127
  static menu_chapeu_ + #1127, #127
  static menu_chapeu_ + #1128, #127
  static menu_chapeu_ + #1129, #127
  static menu_chapeu_ + #1130, #127
  static menu_chapeu_ + #1131, #127
  static menu_chapeu_ + #1132, #127
  static menu_chapeu_ + #1133, #127
  static menu_chapeu_ + #1134, #127
  static menu_chapeu_ + #1135, #127
  static menu_chapeu_ + #1136, #127
  static menu_chapeu_ + #1137, #127
  static menu_chapeu_ + #1138, #127
  static menu_chapeu_ + #1139, #3967
  static menu_chapeu_ + #1140, #3967
  static menu_chapeu_ + #1141, #3967
  static menu_chapeu_ + #1142, #127
  static menu_chapeu_ + #1143, #127
  static menu_chapeu_ + #1144, #127
  static menu_chapeu_ + #1145, #127
  static menu_chapeu_ + #1146, #127
  static menu_chapeu_ + #1147, #127
  static menu_chapeu_ + #1148, #127
  static menu_chapeu_ + #1149, #127
  static menu_chapeu_ + #1150, #127
  static menu_chapeu_ + #1151, #127
  static menu_chapeu_ + #1152, #127
  static menu_chapeu_ + #1153, #127
  static menu_chapeu_ + #1154, #127
  static menu_chapeu_ + #1155, #127
  static menu_chapeu_ + #1156, #127
  static menu_chapeu_ + #1157, #127
  static menu_chapeu_ + #1158, #127
  static menu_chapeu_ + #1159, #127

  ;Linha 29
  static menu_chapeu_ + #1160, #127
  static menu_chapeu_ + #1161, #127
  static menu_chapeu_ + #1162, #127
  static menu_chapeu_ + #1163, #127
  static menu_chapeu_ + #1164, #127
  static menu_chapeu_ + #1165, #127
  static menu_chapeu_ + #1166, #127
  static menu_chapeu_ + #1167, #127
  static menu_chapeu_ + #1168, #127
  static menu_chapeu_ + #1169, #127
  static menu_chapeu_ + #1170, #127
  static menu_chapeu_ + #1171, #127
  static menu_chapeu_ + #1172, #127
  static menu_chapeu_ + #1173, #127
  static menu_chapeu_ + #1174, #127
  static menu_chapeu_ + #1175, #127
  static menu_chapeu_ + #1176, #127
  static menu_chapeu_ + #1177, #127
  static menu_chapeu_ + #1178, #127
  static menu_chapeu_ + #1179, #3967
  static menu_chapeu_ + #1180, #127
  static menu_chapeu_ + #1181, #3967
  static menu_chapeu_ + #1182, #3967
  static menu_chapeu_ + #1183, #3967
  static menu_chapeu_ + #1184, #3967
  static menu_chapeu_ + #1185, #31
  static menu_chapeu_ + #1186, #50
  static menu_chapeu_ + #1187, #48
  static menu_chapeu_ + #1188, #50
  static menu_chapeu_ + #1189, #50
  static menu_chapeu_ + #1190, #44
  static menu_chapeu_ + #1191, #99
  static menu_chapeu_ + #1192, #111
  static menu_chapeu_ + #1193, #112
  static menu_chapeu_ + #1194, #121
  static menu_chapeu_ + #1195, #114
  static menu_chapeu_ + #1196, #105
  static menu_chapeu_ + #1197, #103
  static menu_chapeu_ + #1198, #104
  static menu_chapeu_ + #1199, #116

print_menu_chapeu_Screen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #menu_chapeu_
  loadn R1, #0
  loadn R2, #1200

  print_menu_chapeu_ScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne print_menu_chapeu_ScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts
  
tutorial : var #1200
  ;Linha 0
  static tutorial + #0, #9
  static tutorial + #1, #6
  static tutorial + #2, #6
  static tutorial + #3, #6
  static tutorial + #4, #6
  static tutorial + #5, #6
  static tutorial + #6, #6
  static tutorial + #7, #6
  static tutorial + #8, #6
  static tutorial + #9, #6
  static tutorial + #10, #6
  static tutorial + #11, #6
  static tutorial + #12, #6
  static tutorial + #13, #6
  static tutorial + #14, #6
  static tutorial + #15, #6
  static tutorial + #16, #6
  static tutorial + #17, #6
  static tutorial + #18, #6
  static tutorial + #19, #6
  static tutorial + #20, #6
  static tutorial + #21, #6
  static tutorial + #22, #6
  static tutorial + #23, #6
  static tutorial + #24, #6
  static tutorial + #25, #6
  static tutorial + #26, #6
  static tutorial + #27, #5
  static tutorial + #28, #83
  static tutorial + #29, #67
  static tutorial + #30, #79
  static tutorial + #31, #82
  static tutorial + #32, #69
  static tutorial + #33, #58
  static tutorial + #34, #3967
  static tutorial + #35, #3967
  static tutorial + #36, #3967
  static tutorial + #37, #3967
  static tutorial + #38, #3967
  static tutorial + #39, #3967

  ;Linha 1
  static tutorial + #40, #5
  static tutorial + #41, #3967
  static tutorial + #42, #3967
  static tutorial + #43, #3967
  static tutorial + #44, #3967
  static tutorial + #45, #3967
  static tutorial + #46, #3967
  static tutorial + #47, #3967
  static tutorial + #48, #3967
  static tutorial + #49, #3967
  static tutorial + #50, #3967
  static tutorial + #51, #3967
  static tutorial + #52, #3967
  static tutorial + #53, #3967
  static tutorial + #54, #3967
  static tutorial + #55, #3967
  static tutorial + #56, #3967
  static tutorial + #57, #3967
  static tutorial + #58, #3967
  static tutorial + #59, #3967
  static tutorial + #60, #3967
  static tutorial + #61, #3967
  static tutorial + #62, #3967
  static tutorial + #63, #3967
  static tutorial + #64, #3967
  static tutorial + #65, #3967
  static tutorial + #66, #3967
  static tutorial + #67, #5
  static tutorial + #68, #3967
  static tutorial + #69, #3967
  static tutorial + #70, #3967
  static tutorial + #71, #3967
  static tutorial + #72, #3967
  static tutorial + #73, #3967
  static tutorial + #74, #3967
  static tutorial + #75, #25
  static tutorial + #76, #3967
  static tutorial + #77, #3967
  static tutorial + #78, #3967
  static tutorial + #79, #3967

  ;Linha 2
  static tutorial + #80, #5
  static tutorial + #81, #3967
  static tutorial + #82, #3967
  static tutorial + #83, #3967
  static tutorial + #84, #3967
  static tutorial + #85, #3967
  static tutorial + #86, #3967
  static tutorial + #87, #3967
  static tutorial + #88, #3967
  static tutorial + #89, #3967
  static tutorial + #90, #3967
  static tutorial + #91, #3967
  static tutorial + #92, #3967
  static tutorial + #93, #3967
  static tutorial + #94, #3967
  static tutorial + #95, #3967
  static tutorial + #96, #3967
  static tutorial + #97, #3967
  static tutorial + #98, #3967
  static tutorial + #99, #3967
  static tutorial + #100, #3967
  static tutorial + #101, #3967
  static tutorial + #102, #3967
  static tutorial + #103, #3967
  static tutorial + #104, #3967
  static tutorial + #105, #3967
  static tutorial + #106, #3967
  static tutorial + #107, #5
  static tutorial + #108, #3967
  static tutorial + #109, #3967
  static tutorial + #110, #3967
  static tutorial + #111, #3967
  static tutorial + #112, #3967
  static tutorial + #113, #3967
  static tutorial + #114, #3967
  static tutorial + #115, #20
  static tutorial + #116, #3967
  static tutorial + #117, #3967
  static tutorial + #118, #3967
  static tutorial + #119, #3967

  ;Linha 3
  static tutorial + #120, #5
  static tutorial + #121, #3967
  static tutorial + #122, #3967
  static tutorial + #123, #3967
  static tutorial + #124, #3967
  static tutorial + #125, #3967
  static tutorial + #126, #3967
  static tutorial + #127, #3967
  static tutorial + #128, #3967
  static tutorial + #129, #3967
  static tutorial + #130, #67
  static tutorial + #131, #111
  static tutorial + #132, #109
  static tutorial + #133, #97
  static tutorial + #134, #110
  static tutorial + #135, #100
  static tutorial + #136, #97
  static tutorial + #137, #3967
  static tutorial + #138, #3967
  static tutorial + #139, #3967
  static tutorial + #140, #3967
  static tutorial + #141, #3967
  static tutorial + #142, #3967
  static tutorial + #143, #3967
  static tutorial + #144, #3967
  static tutorial + #145, #3967
  static tutorial + #146, #3967
  static tutorial + #147, #5
  static tutorial + #148, #3967
  static tutorial + #149, #3967
  static tutorial + #150, #3967
  static tutorial + #151, #3967
  static tutorial + #152, #3967
  static tutorial + #153, #3967
  static tutorial + #154, #83
  static tutorial + #155, #117
  static tutorial + #156, #97
  static tutorial + #157, #3967
  static tutorial + #158, #3967
  static tutorial + #159, #3967

  ;Linha 4
  static tutorial + #160, #5
  static tutorial + #161, #3967
  static tutorial + #162, #3967
  static tutorial + #163, #3967
  static tutorial + #164, #3967
  static tutorial + #165, #3967
  static tutorial + #166, #3967
  static tutorial + #167, #3967
  static tutorial + #168, #3967
  static tutorial + #169, #3967
  static tutorial + #170, #3967
  static tutorial + #171, #3967
  static tutorial + #172, #100
  static tutorial + #173, #111
  static tutorial + #174, #3967
  static tutorial + #175, #3967
  static tutorial + #176, #3967
  static tutorial + #177, #3967
  static tutorial + #178, #3967
  static tutorial + #179, #3967
  static tutorial + #180, #3967
  static tutorial + #181, #3967
  static tutorial + #182, #3967
  static tutorial + #183, #3967
  static tutorial + #184, #3967
  static tutorial + #185, #3967
  static tutorial + #186, #3967
  static tutorial + #187, #5
  static tutorial + #188, #3967
  static tutorial + #189, #3967
  static tutorial + #190, #3967
  static tutorial + #191, #80
  static tutorial + #192, #111
  static tutorial + #193, #110
  static tutorial + #194, #116
  static tutorial + #195, #117
  static tutorial + #196, #97
  static tutorial + #197, #99
  static tutorial + #198, #97
  static tutorial + #199, #111

  ;Linha 5
  static tutorial + #200, #5
  static tutorial + #201, #3967
  static tutorial + #202, #3967
  static tutorial + #203, #3967
  static tutorial + #204, #3967
  static tutorial + #205, #3967
  static tutorial + #206, #3967
  static tutorial + #207, #80
  static tutorial + #208, #101
  static tutorial + #209, #100
  static tutorial + #210, #105
  static tutorial + #211, #100
  static tutorial + #212, #111
  static tutorial + #213, #3967
  static tutorial + #214, #65
  static tutorial + #215, #116
  static tutorial + #216, #117
  static tutorial + #217, #97
  static tutorial + #218, #108
  static tutorial + #219, #3967
  static tutorial + #220, #3967
  static tutorial + #221, #3967
  static tutorial + #222, #3967
  static tutorial + #223, #3967
  static tutorial + #224, #3967
  static tutorial + #225, #3967
  static tutorial + #226, #3967
  static tutorial + #227, #5
  static tutorial + #228, #3967
  static tutorial + #229, #3967
  static tutorial + #230, #3967
  static tutorial + #231, #3967
  static tutorial + #232, #3967
  static tutorial + #233, #3967
  static tutorial + #234, #3967
  static tutorial + #235, #3967
  static tutorial + #236, #3967
  static tutorial + #237, #3967
  static tutorial + #238, #3967
  static tutorial + #239, #3967

  ;Linha 6
  static tutorial + #240, #5
  static tutorial + #241, #3967
  static tutorial + #242, #3967
  static tutorial + #243, #3967
  static tutorial + #244, #3967
  static tutorial + #245, #3967
  static tutorial + #246, #3967
  static tutorial + #247, #3967
  static tutorial + #248, #3967
  static tutorial + #249, #3967
  static tutorial + #250, #3967
  static tutorial + #251, #3967
  static tutorial + #252, #3967
  static tutorial + #253, #3967
  static tutorial + #254, #3967
  static tutorial + #255, #3967
  static tutorial + #256, #3967
  static tutorial + #257, #3967
  static tutorial + #258, #3967
  static tutorial + #259, #3967
  static tutorial + #260, #3967
  static tutorial + #261, #3967
  static tutorial + #262, #3967
  static tutorial + #263, #3967
  static tutorial + #264, #3967
  static tutorial + #265, #3967
  static tutorial + #266, #3967
  static tutorial + #267, #5
  static tutorial + #268, #3967
  static tutorial + #269, #3967
  static tutorial + #270, #3967
  static tutorial + #271, #3967
  static tutorial + #272, #3967
  static tutorial + #273, #3967
  static tutorial + #274, #3967
  static tutorial + #275, #3967
  static tutorial + #276, #3967
  static tutorial + #277, #3967
  static tutorial + #278, #3967
  static tutorial + #279, #3967

  ;Linha 7
  static tutorial + #280, #12
  static tutorial + #281, #7
  static tutorial + #282, #7
  static tutorial + #283, #7
  static tutorial + #284, #7
  static tutorial + #285, #7
  static tutorial + #286, #7
  static tutorial + #287, #7
  static tutorial + #288, #7
  static tutorial + #289, #7
  static tutorial + #290, #7
  static tutorial + #291, #7
  static tutorial + #292, #7
  static tutorial + #293, #7
  static tutorial + #294, #7
  static tutorial + #295, #7
  static tutorial + #296, #7
  static tutorial + #297, #7
  static tutorial + #298, #7
  static tutorial + #299, #7
  static tutorial + #300, #7
  static tutorial + #301, #7
  static tutorial + #302, #7
  static tutorial + #303, #7
  static tutorial + #304, #7
  static tutorial + #305, #7
  static tutorial + #306, #7
  static tutorial + #307, #5
  static tutorial + #308, #3967
  static tutorial + #309, #3967
  static tutorial + #310, #3967
  static tutorial + #311, #3967
  static tutorial + #312, #3967
  static tutorial + #313, #3967
  static tutorial + #314, #3967
  static tutorial + #315, #3967
  static tutorial + #316, #3967
  static tutorial + #317, #3967
  static tutorial + #318, #3967
  static tutorial + #319, #3967

  ;Linha 8
  static tutorial + #320, #3967
  static tutorial + #321, #3967
  static tutorial + #322, #3967
  static tutorial + #323, #3967
  static tutorial + #324, #3967
  static tutorial + #325, #3967
  static tutorial + #326, #3967
  static tutorial + #327, #3967
  static tutorial + #328, #3967
  static tutorial + #329, #3967
  static tutorial + #330, #3967
  static tutorial + #331, #3967
  static tutorial + #332, #3967
  static tutorial + #333, #3967
  static tutorial + #334, #3967
  static tutorial + #335, #3967
  static tutorial + #336, #3967
  static tutorial + #337, #3967
  static tutorial + #338, #3967
  static tutorial + #339, #3967
  static tutorial + #340, #3967
  static tutorial + #341, #3967
  static tutorial + #342, #3967
  static tutorial + #343, #3967
  static tutorial + #344, #3967
  static tutorial + #345, #3967
  static tutorial + #346, #3967
  static tutorial + #347, #3967
  static tutorial + #348, #3967
  static tutorial + #349, #3967
  static tutorial + #350, #3967
  static tutorial + #351, #3967
  static tutorial + #352, #3967
  static tutorial + #353, #3967
  static tutorial + #354, #3967
  static tutorial + #355, #3967
  static tutorial + #356, #3967
  static tutorial + #357, #3967
  static tutorial + #358, #3967
  static tutorial + #359, #3967

  ;Linha 9
  static tutorial + #360, #3967
  static tutorial + #361, #3967
  static tutorial + #362, #3967
  static tutorial + #363, #3967
  static tutorial + #364, #3967
  static tutorial + #365, #3967
  static tutorial + #366, #3967
  static tutorial + #367, #3967
  static tutorial + #368, #3967
  static tutorial + #369, #3967
  static tutorial + #370, #3967
  static tutorial + #371, #3967
  static tutorial + #372, #3967
  static tutorial + #373, #3967
  static tutorial + #374, #3967
  static tutorial + #375, #3967
  static tutorial + #376, #3967
  static tutorial + #377, #3967
  static tutorial + #378, #3967
  static tutorial + #379, #3967
  static tutorial + #380, #3967
  static tutorial + #381, #3967
  static tutorial + #382, #3967
  static tutorial + #383, #3967
  static tutorial + #384, #3967
  static tutorial + #385, #3967
  static tutorial + #386, #3967
  static tutorial + #387, #3967
  static tutorial + #388, #3967
  static tutorial + #389, #3967
  static tutorial + #390, #3967
  static tutorial + #391, #3967
  static tutorial + #392, #3967
  static tutorial + #393, #3967
  static tutorial + #394, #3967
  static tutorial + #395, #3967
  static tutorial + #396, #3967
  static tutorial + #397, #3967
  static tutorial + #398, #3967
  static tutorial + #399, #3967

  ;Linha 10
  static tutorial + #400, #3967
  static tutorial + #401, #3967
  static tutorial + #402, #3967
  static tutorial + #403, #3967
  static tutorial + #404, #3967
  static tutorial + #405, #3967
  static tutorial + #406, #3967
  static tutorial + #407, #3967
  static tutorial + #408, #3967
  static tutorial + #409, #3967
  static tutorial + #410, #3967
  static tutorial + #411, #3967
  static tutorial + #412, #3967
  static tutorial + #413, #3967
  static tutorial + #414, #3967
  static tutorial + #415, #3967
  static tutorial + #416, #3967
  static tutorial + #417, #3967
  static tutorial + #418, #3967
  static tutorial + #419, #3967
  static tutorial + #420, #3967
  static tutorial + #421, #3967
  static tutorial + #422, #3967
  static tutorial + #423, #3967
  static tutorial + #424, #3967
  static tutorial + #425, #3967
  static tutorial + #426, #3967
  static tutorial + #427, #3967
  static tutorial + #428, #3967
  static tutorial + #429, #3967
  static tutorial + #430, #3967
  static tutorial + #431, #3967
  static tutorial + #432, #3967
  static tutorial + #433, #3967
  static tutorial + #434, #3967
  static tutorial + #435, #3967
  static tutorial + #436, #3967
  static tutorial + #437, #3967
  static tutorial + #438, #3967
  static tutorial + #439, #3967

  ;Linha 11
  static tutorial + #440, #3967
  static tutorial + #441, #3967
  static tutorial + #442, #3967
  static tutorial + #443, #3967
  static tutorial + #444, #3967
  static tutorial + #445, #3967
  static tutorial + #446, #3967
  static tutorial + #447, #3967
  static tutorial + #448, #3967
  static tutorial + #449, #3967
  static tutorial + #450, #3967
  static tutorial + #451, #84
  static tutorial + #452, #69
  static tutorial + #453, #67
  static tutorial + #454, #76
  static tutorial + #455, #65
  static tutorial + #456, #83
  static tutorial + #457, #58
  static tutorial + #458, #3967
  static tutorial + #459, #3967
  static tutorial + #460, #3967
  static tutorial + #461, #3967
  static tutorial + #462, #3967
  static tutorial + #463, #3967
  static tutorial + #464, #3967
  static tutorial + #465, #3967
  static tutorial + #466, #3967
  static tutorial + #467, #3967
  static tutorial + #468, #3967
  static tutorial + #469, #3967
  static tutorial + #470, #3967
  static tutorial + #471, #3967
  static tutorial + #472, #3967
  static tutorial + #473, #3967
  static tutorial + #474, #3967
  static tutorial + #475, #3967
  static tutorial + #476, #3967
  static tutorial + #477, #3967
  static tutorial + #478, #3967
  static tutorial + #479, #3967

  ;Linha 12
  static tutorial + #480, #3967
  static tutorial + #481, #3967
  static tutorial + #482, #3967
  static tutorial + #483, #3967
  static tutorial + #484, #3967
  static tutorial + #485, #3967
  static tutorial + #486, #3967
  static tutorial + #487, #3967
  static tutorial + #488, #3967
  static tutorial + #489, #3967
  static tutorial + #490, #3967
  static tutorial + #491, #3967
  static tutorial + #492, #3967
  static tutorial + #493, #3967
  static tutorial + #494, #3967
  static tutorial + #495, #3967
  static tutorial + #496, #3967
  static tutorial + #497, #3967
  static tutorial + #498, #3967
  static tutorial + #499, #3967
  static tutorial + #500, #3967
  static tutorial + #501, #3967
  static tutorial + #502, #3967
  static tutorial + #503, #3967
  static tutorial + #504, #3967
  static tutorial + #505, #3967
  static tutorial + #506, #3967
  static tutorial + #507, #3967
  static tutorial + #508, #3967
  static tutorial + #509, #3967
  static tutorial + #510, #3967
  static tutorial + #511, #3967
  static tutorial + #512, #3967
  static tutorial + #513, #3967
  static tutorial + #514, #3967
  static tutorial + #515, #3967
  static tutorial + #516, #3967
  static tutorial + #517, #3967
  static tutorial + #518, #3967
  static tutorial + #519, #3967

  ;Linha 13
  static tutorial + #520, #3967
  static tutorial + #521, #3967
  static tutorial + #522, #3967
  static tutorial + #523, #3967
  static tutorial + #524, #3967
  static tutorial + #525, #3967
  static tutorial + #526, #3967
  static tutorial + #527, #3967
  static tutorial + #528, #3967
  static tutorial + #529, #3967
  static tutorial + #530, #3967
  static tutorial + #531, #3967
  static tutorial + #532, #3967
  static tutorial + #533, #119
  static tutorial + #534, #3967
  static tutorial + #535, #3967
  static tutorial + #536, #3967
  static tutorial + #537, #3967
  static tutorial + #538, #3967
  static tutorial + #539, #3967
  static tutorial + #540, #3967
  static tutorial + #541, #3967
  static tutorial + #542, #3967
  static tutorial + #543, #3967
  static tutorial + #544, #3967
  static tutorial + #545, #3967
  static tutorial + #546, #3967
  static tutorial + #547, #3967
  static tutorial + #548, #3967
  static tutorial + #549, #3967
  static tutorial + #550, #3967
  static tutorial + #551, #3967
  static tutorial + #552, #3967
  static tutorial + #553, #3967
  static tutorial + #554, #3967
  static tutorial + #555, #3967
  static tutorial + #556, #3967
  static tutorial + #557, #3967
  static tutorial + #558, #3967
  static tutorial + #559, #3967

  ;Linha 14
  static tutorial + #560, #3967
  static tutorial + #561, #3967
  static tutorial + #562, #3967
  static tutorial + #563, #3967
  static tutorial + #564, #3967
  static tutorial + #565, #3967
  static tutorial + #566, #3967
  static tutorial + #567, #3967
  static tutorial + #568, #3967
  static tutorial + #569, #3967
  static tutorial + #570, #3967
  static tutorial + #571, #3967
  static tutorial + #572, #3967
  static tutorial + #573, #3967
  static tutorial + #574, #3967
  static tutorial + #575, #3967
  static tutorial + #576, #3967
  static tutorial + #577, #3967
  static tutorial + #578, #3967
  static tutorial + #579, #3967
  static tutorial + #580, #3967
  static tutorial + #581, #3967
  static tutorial + #582, #3967
  static tutorial + #583, #3967
  static tutorial + #584, #3967
  static tutorial + #585, #3967
  static tutorial + #586, #3967
  static tutorial + #587, #3967
  static tutorial + #588, #3967
  static tutorial + #589, #3967
  static tutorial + #590, #3967
  static tutorial + #591, #3967
  static tutorial + #592, #3967
  static tutorial + #593, #3967
  static tutorial + #594, #3967
  static tutorial + #595, #3967
  static tutorial + #596, #3967
  static tutorial + #597, #3967
  static tutorial + #598, #3967
  static tutorial + #599, #3967

  ;Linha 15
  static tutorial + #600, #3967
  static tutorial + #601, #3967
  static tutorial + #602, #3967
  static tutorial + #603, #3967
  static tutorial + #604, #3967
  static tutorial + #605, #3967
  static tutorial + #606, #3967
  static tutorial + #607, #3967
  static tutorial + #608, #3967
  static tutorial + #609, #3967
  static tutorial + #610, #3967
  static tutorial + #611, #97
  static tutorial + #612, #3967
  static tutorial + #613, #115
  static tutorial + #614, #3967
  static tutorial + #615, #100
  static tutorial + #616, #3967
  static tutorial + #617, #3967
  static tutorial + #618, #0
  static tutorial + #619, #0
  static tutorial + #620, #0
  static tutorial + #621, #0
  static tutorial + #622, #0
  static tutorial + #623, #3967
  static tutorial + #624, #3967
  static tutorial + #625, #3967
  static tutorial + #626, #3967
  static tutorial + #627, #3967
  static tutorial + #628, #3967
  static tutorial + #629, #3967
  static tutorial + #630, #3967
  static tutorial + #631, #3967
  static tutorial + #632, #3967
  static tutorial + #633, #3967
  static tutorial + #634, #3967
  static tutorial + #635, #3967
  static tutorial + #636, #3967
  static tutorial + #637, #3967
  static tutorial + #638, #3967
  static tutorial + #639, #3967

  ;Linha 16
  static tutorial + #640, #3967
  static tutorial + #641, #3967
  static tutorial + #642, #3967
  static tutorial + #643, #3967
  static tutorial + #644, #3967
  static tutorial + #645, #3967
  static tutorial + #646, #3967
  static tutorial + #647, #3967
  static tutorial + #648, #3967
  static tutorial + #649, #3967
  static tutorial + #650, #3967
  static tutorial + #651, #3967
  static tutorial + #652, #3967
  static tutorial + #653, #3967
  static tutorial + #654, #3967
  static tutorial + #655, #3967
  static tutorial + #656, #3967
  static tutorial + #657, #3967
  static tutorial + #658, #3967
  static tutorial + #659, #3967
  static tutorial + #660, #3967
  static tutorial + #661, #3967
  static tutorial + #662, #3967
  static tutorial + #663, #3967
  static tutorial + #664, #3967
  static tutorial + #665, #3967
  static tutorial + #666, #3967
  static tutorial + #667, #3967
  static tutorial + #668, #3967
  static tutorial + #669, #3967
  static tutorial + #670, #3967
  static tutorial + #671, #67
  static tutorial + #672, #97
  static tutorial + #673, #109
  static tutorial + #674, #112
  static tutorial + #675, #97
  static tutorial + #676, #105
  static tutorial + #677, #110
  static tutorial + #678, #104
  static tutorial + #679, #97

  ;Linha 17
  static tutorial + #680, #3967
  static tutorial + #681, #3967
  static tutorial + #682, #3967
  static tutorial + #683, #3967
  static tutorial + #684, #3967
  static tutorial + #685, #3967
  static tutorial + #686, #3967
  static tutorial + #687, #3967
  static tutorial + #688, #3967
  static tutorial + #689, #3967
  static tutorial + #690, #3967
  static tutorial + #691, #65
  static tutorial + #692, #110
  static tutorial + #693, #100
  static tutorial + #694, #97
  static tutorial + #695, #114
  static tutorial + #696, #3967
  static tutorial + #697, #3967
  static tutorial + #698, #80
  static tutorial + #699, #101
  static tutorial + #700, #103
  static tutorial + #701, #97
  static tutorial + #702, #114
  static tutorial + #703, #3967
  static tutorial + #704, #3967
  static tutorial + #705, #3967
  static tutorial + #706, #3967
  static tutorial + #707, #3967
  static tutorial + #708, #3967
  static tutorial + #709, #3967
  static tutorial + #710, #3967
  static tutorial + #711, #3967
  static tutorial + #712, #3967
  static tutorial + #713, #3967
  static tutorial + #714, #3967
  static tutorial + #715, #3967
  static tutorial + #716, #3967
  static tutorial + #717, #20
  static tutorial + #718, #3967
  static tutorial + #719, #3967

  ;Linha 18
  static tutorial + #720, #3967
  static tutorial + #721, #3967
  static tutorial + #722, #3967
  static tutorial + #723, #3967
  static tutorial + #724, #3967
  static tutorial + #725, #3967
  static tutorial + #726, #3967
  static tutorial + #727, #3967
  static tutorial + #728, #3967
  static tutorial + #729, #3967
  static tutorial + #730, #3967
  static tutorial + #731, #3967
  static tutorial + #732, #3967
  static tutorial + #733, #3967
  static tutorial + #734, #3967
  static tutorial + #735, #3967
  static tutorial + #736, #3967
  static tutorial + #737, #3967
  static tutorial + #738, #3967
  static tutorial + #739, #3967
  static tutorial + #740, #3967
  static tutorial + #741, #3967
  static tutorial + #742, #3967
  static tutorial + #743, #3967
  static tutorial + #744, #3967
  static tutorial + #745, #3967
  static tutorial + #746, #3967
  static tutorial + #747, #3967
  static tutorial + #748, #66
  static tutorial + #749, #97
  static tutorial + #750, #110
  static tutorial + #751, #100
  static tutorial + #752, #101
  static tutorial + #753, #105
  static tutorial + #754, #106
  static tutorial + #755, #97
  static tutorial + #756, #3967
  static tutorial + #757, #20
  static tutorial + #758, #3967
  static tutorial + #759, #3967

  ;Linha 19
  static tutorial + #760, #3967
  static tutorial + #761, #3967
  static tutorial + #762, #3967
  static tutorial + #763, #3967
  static tutorial + #764, #3967
  static tutorial + #765, #3967
  static tutorial + #766, #3967
  static tutorial + #767, #3967
  static tutorial + #768, #3967
  static tutorial + #769, #79
  static tutorial + #770, #118
  static tutorial + #771, #111
  static tutorial + #772, #3967
  static tutorial + #773, #3967
  static tutorial + #774, #3967
  static tutorial + #775, #3967
  static tutorial + #776, #3967
  static tutorial + #777, #3967
  static tutorial + #778, #3967
  static tutorial + #779, #3967
  static tutorial + #780, #3967
  static tutorial + #781, #3967
  static tutorial + #782, #3967
  static tutorial + #783, #3967
  static tutorial + #784, #3967
  static tutorial + #785, #3967
  static tutorial + #786, #3967
  static tutorial + #787, #3967
  static tutorial + #788, #3967
  static tutorial + #789, #3967
  static tutorial + #790, #3967
  static tutorial + #791, #3967
  static tutorial + #792, #20
  static tutorial + #793, #3967
  static tutorial + #794, #3967
  static tutorial + #795, #3967
  static tutorial + #796, #3967
  static tutorial + #797, #20
  static tutorial + #798, #3967
  static tutorial + #799, #3967

  ;Linha 20
  static tutorial + #800, #72
  static tutorial + #801, #97
  static tutorial + #802, #109
  static tutorial + #803, #98
  static tutorial + #804, #117
  static tutorial + #805, #114
  static tutorial + #806, #103
  static tutorial + #807, #117
  static tutorial + #808, #101
  static tutorial + #809, #114
  static tutorial + #810, #3967
  static tutorial + #811, #3967
  static tutorial + #812, #22
  static tutorial + #813, #3967
  static tutorial + #814, #3967
  static tutorial + #815, #3967
  static tutorial + #816, #3967
  static tutorial + #817, #3967
  static tutorial + #818, #3967
  static tutorial + #819, #3967
  static tutorial + #820, #3967
  static tutorial + #821, #3967
  static tutorial + #822, #3967
  static tutorial + #823, #3967
  static tutorial + #824, #3967
  static tutorial + #825, #3967
  static tutorial + #826, #76
  static tutorial + #827, #105
  static tutorial + #828, #120
  static tutorial + #829, #111
  static tutorial + #830, #3967
  static tutorial + #831, #3967
  static tutorial + #832, #20
  static tutorial + #833, #3967
  static tutorial + #834, #3967
  static tutorial + #835, #3967
  static tutorial + #836, #3967
  static tutorial + #837, #20
  static tutorial + #838, #3967
  static tutorial + #839, #3967

  ;Linha 21
  static tutorial + #840, #3967
  static tutorial + #841, #3967
  static tutorial + #842, #3967
  static tutorial + #843, #3967
  static tutorial + #844, #3967
  static tutorial + #845, #3967
  static tutorial + #846, #3967
  static tutorial + #847, #3967
  static tutorial + #848, #3967
  static tutorial + #849, #3967
  static tutorial + #850, #22
  static tutorial + #851, #3967
  static tutorial + #852, #3967
  static tutorial + #853, #22
  static tutorial + #854, #3967
  static tutorial + #855, #3967
  static tutorial + #856, #3967
  static tutorial + #857, #3967
  static tutorial + #858, #3967
  static tutorial + #859, #3967
  static tutorial + #860, #3967
  static tutorial + #861, #3967
  static tutorial + #862, #3967
  static tutorial + #863, #3967
  static tutorial + #864, #3967
  static tutorial + #865, #3967
  static tutorial + #866, #3967
  static tutorial + #867, #26
  static tutorial + #868, #3967
  static tutorial + #869, #3967
  static tutorial + #870, #3967
  static tutorial + #871, #3967
  static tutorial + #872, #26
  static tutorial + #873, #3967
  static tutorial + #874, #3967
  static tutorial + #875, #3967
  static tutorial + #876, #3967
  static tutorial + #877, #26
  static tutorial + #878, #3967
  static tutorial + #879, #3967

  ;Linha 22
  static tutorial + #880, #9
  static tutorial + #881, #6
  static tutorial + #882, #6
  static tutorial + #883, #6
  static tutorial + #884, #6
  static tutorial + #885, #6
  static tutorial + #886, #6
  static tutorial + #887, #6
  static tutorial + #888, #6
  static tutorial + #889, #6
  static tutorial + #890, #6
  static tutorial + #891, #29
  static tutorial + #892, #6
  static tutorial + #893, #6
  static tutorial + #894, #29
  static tutorial + #895, #6
  static tutorial + #896, #6
  static tutorial + #897, #6
  static tutorial + #898, #6
  static tutorial + #899, #6
  static tutorial + #900, #6
  static tutorial + #901, #6
  static tutorial + #902, #6
  static tutorial + #903, #6
  static tutorial + #904, #6
  static tutorial + #905, #6
  static tutorial + #906, #0
  static tutorial + #907, #0
  static tutorial + #908, #0
  static tutorial + #909, #6
  static tutorial + #910, #2048
  static tutorial + #911, #2048
  static tutorial + #912, #2048
  static tutorial + #913, #2048
  static tutorial + #914, #2048
  static tutorial + #915, #6
  static tutorial + #916, #2816
  static tutorial + #917, #2816
  static tutorial + #918, #6
  static tutorial + #919, #10

  ;Linha 23
  static tutorial + #920, #5
  static tutorial + #921, #3967
  static tutorial + #922, #2304
  static tutorial + #923, #512
  static tutorial + #924, #3967
  static tutorial + #925, #3967
  static tutorial + #926, #512
  static tutorial + #927, #768
  static tutorial + #928, #3967
  static tutorial + #929, #2817
  static tutorial + #930, #2819
  static tutorial + #931, #3967
  static tutorial + #932, #256
  static tutorial + #933, #256
  static tutorial + #934, #3967
  static tutorial + #935, #0
  static tutorial + #936, #2816
  static tutorial + #937, #3967
  static tutorial + #938, #110
  static tutorial + #939, #3967
  static tutorial + #940, #110
  static tutorial + #941, #3967
  static tutorial + #942, #110
  static tutorial + #943, #3967
  static tutorial + #944, #3967
  static tutorial + #945, #3967
  static tutorial + #946, #0
  static tutorial + #947, #0
  static tutorial + #948, #0
  static tutorial + #949, #3967
  static tutorial + #950, #2048
  static tutorial + #951, #2048
  static tutorial + #952, #2048
  static tutorial + #953, #2048
  static tutorial + #954, #2048
  static tutorial + #955, #3967
  static tutorial + #956, #2816
  static tutorial + #957, #2816
  static tutorial + #958, #3967
  static tutorial + #959, #8

  ;Linha 24
  static tutorial + #960, #5
  static tutorial + #961, #3967
  static tutorial + #962, #2304
  static tutorial + #963, #2304
  static tutorial + #964, #3967
  static tutorial + #965, #3967
  static tutorial + #966, #512
  static tutorial + #967, #768
  static tutorial + #968, #3967
  static tutorial + #969, #2818
  static tutorial + #970, #2820
  static tutorial + #971, #3967
  static tutorial + #972, #256
  static tutorial + #973, #256
  static tutorial + #974, #3967
  static tutorial + #975, #0
  static tutorial + #976, #0
  static tutorial + #977, #3967
  static tutorial + #978, #2133
  static tutorial + #979, #3967
  static tutorial + #980, #2389
  static tutorial + #981, #3967
  static tutorial + #982, #2901
  static tutorial + #983, #3967
  static tutorial + #984, #3967
  static tutorial + #985, #3967
  static tutorial + #986, #0
  static tutorial + #987, #0
  static tutorial + #988, #0
  static tutorial + #989, #3967
  static tutorial + #990, #2048
  static tutorial + #991, #2048
  static tutorial + #992, #2048
  static tutorial + #993, #2048
  static tutorial + #994, #2048
  static tutorial + #995, #3967
  static tutorial + #996, #3967
  static tutorial + #997, #3967
  static tutorial + #998, #3967
  static tutorial + #999, #8

  ;Linha 25
  static tutorial + #1000, #5
  static tutorial + #1001, #3967
  static tutorial + #1002, #3967
  static tutorial + #1003, #3967
  static tutorial + #1004, #28
  static tutorial + #1005, #3967
  static tutorial + #1006, #3967
  static tutorial + #1007, #3967
  static tutorial + #1008, #28
  static tutorial + #1009, #3967
  static tutorial + #1010, #28
  static tutorial + #1011, #3967
  static tutorial + #1012, #3967
  static tutorial + #1013, #3967
  static tutorial + #1014, #3967
  static tutorial + #1015, #3967
  static tutorial + #1016, #3967
  static tutorial + #1017, #3967
  static tutorial + #1018, #3967
  static tutorial + #1019, #28
  static tutorial + #1020, #3967
  static tutorial + #1021, #28
  static tutorial + #1022, #3967
  static tutorial + #1023, #28
  static tutorial + #1024, #3967
  static tutorial + #1025, #3967
  static tutorial + #1026, #3967
  static tutorial + #1027, #3967
  static tutorial + #1028, #3967
  static tutorial + #1029, #3967
  static tutorial + #1030, #3967
  static tutorial + #1031, #3967
  static tutorial + #1032, #3967
  static tutorial + #1033, #3967
  static tutorial + #1034, #3967
  static tutorial + #1035, #3967
  static tutorial + #1036, #3967
  static tutorial + #1037, #3967
  static tutorial + #1038, #3967
  static tutorial + #1039, #8

  ;Linha 26
  static tutorial + #1040, #5
  static tutorial + #1041, #3967
  static tutorial + #1042, #3967
  static tutorial + #1043, #3967
  static tutorial + #1044, #3967
  static tutorial + #1045, #22
  static tutorial + #1046, #3967
  static tutorial + #1047, #3967
  static tutorial + #1048, #3967
  static tutorial + #1049, #22
  static tutorial + #1050, #3967
  static tutorial + #1051, #81
  static tutorial + #1052, #117
  static tutorial + #1053, #101
  static tutorial + #1054, #105
  static tutorial + #1055, #106
  static tutorial + #1056, #111
  static tutorial + #1057, #3967
  static tutorial + #1058, #3967
  static tutorial + #1059, #3967
  static tutorial + #1060, #22
  static tutorial + #1061, #3967
  static tutorial + #1062, #22
  static tutorial + #1063, #3967
  static tutorial + #1064, #77
  static tutorial + #1065, #111
  static tutorial + #1066, #115
  static tutorial + #1067, #116
  static tutorial + #1068, #97
  static tutorial + #1069, #114
  static tutorial + #1070, #100
  static tutorial + #1071, #97
  static tutorial + #1072, #3967
  static tutorial + #1073, #3967
  static tutorial + #1074, #3967
  static tutorial + #1075, #3967
  static tutorial + #1076, #3967
  static tutorial + #1077, #3967
  static tutorial + #1078, #3967
  static tutorial + #1079, #8

  ;Linha 27
  static tutorial + #1080, #5
  static tutorial + #1081, #3967
  static tutorial + #1082, #3967
  static tutorial + #1083, #3967
  static tutorial + #1084, #3967
  static tutorial + #1085, #3967
  static tutorial + #1086, #22
  static tutorial + #1087, #3967
  static tutorial + #1088, #3967
  static tutorial + #1089, #3967
  static tutorial + #1090, #65
  static tutorial + #1091, #108
  static tutorial + #1092, #102
  static tutorial + #1093, #97
  static tutorial + #1094, #99
  static tutorial + #1095, #101
  static tutorial + #1096, #3967
  static tutorial + #1097, #3967
  static tutorial + #1098, #3967
  static tutorial + #1099, #3967
  static tutorial + #1100, #3967
  static tutorial + #1101, #22
  static tutorial + #1102, #3967
  static tutorial + #1103, #75
  static tutorial + #1104, #101
  static tutorial + #1105, #116
  static tutorial + #1106, #99
  static tutorial + #1107, #104
  static tutorial + #1108, #117
  static tutorial + #1109, #112
  static tutorial + #1110, #3967
  static tutorial + #1111, #3967
  static tutorial + #1112, #3967
  static tutorial + #1113, #3967
  static tutorial + #1114, #3967
  static tutorial + #1115, #3967
  static tutorial + #1116, #3967
  static tutorial + #1117, #3967
  static tutorial + #1118, #3967
  static tutorial + #1119, #8

  ;Linha 28
  static tutorial + #1120, #5
  static tutorial + #1121, #3967
  static tutorial + #1122, #3967
  static tutorial + #1123, #3967
  static tutorial + #1124, #3967
  static tutorial + #1125, #3967
  static tutorial + #1126, #3967
  static tutorial + #1127, #84
  static tutorial + #1128, #111
  static tutorial + #1129, #109
  static tutorial + #1130, #97
  static tutorial + #1131, #116
  static tutorial + #1132, #101
  static tutorial + #1133, #3967
  static tutorial + #1134, #3967
  static tutorial + #1135, #3967
  static tutorial + #1136, #3967
  static tutorial + #1137, #3967
  static tutorial + #1138, #3967
  static tutorial + #1139, #3967
  static tutorial + #1140, #3967
  static tutorial + #1141, #3967
  static tutorial + #1142, #77
  static tutorial + #1143, #97
  static tutorial + #1144, #105
  static tutorial + #1145, #111
  static tutorial + #1146, #110
  static tutorial + #1147, #101
  static tutorial + #1148, #115
  static tutorial + #1149, #101
  static tutorial + #1150, #3967
  static tutorial + #1151, #3967
  static tutorial + #1152, #3967
  static tutorial + #1153, #3967
  static tutorial + #1154, #3967
  static tutorial + #1155, #3967
  static tutorial + #1156, #3967
  static tutorial + #1157, #3967
  static tutorial + #1158, #3967
  static tutorial + #1159, #8

  ;Linha 29
  static tutorial + #1160, #12
  static tutorial + #1161, #7
  static tutorial + #1162, #7
  static tutorial + #1163, #7
  static tutorial + #1164, #7
  static tutorial + #1165, #7
  static tutorial + #1166, #7
  static tutorial + #1167, #7
  static tutorial + #1168, #7
  static tutorial + #1169, #7
  static tutorial + #1170, #7
  static tutorial + #1171, #7
  static tutorial + #1172, #7
  static tutorial + #1173, #7
  static tutorial + #1174, #7
  static tutorial + #1175, #7
  static tutorial + #1176, #7
  static tutorial + #1177, #7
  static tutorial + #1178, #7
  static tutorial + #1179, #7
  static tutorial + #1180, #7
  static tutorial + #1181, #7
  static tutorial + #1182, #7
  static tutorial + #1183, #7
  static tutorial + #1184, #7
  static tutorial + #1185, #7
  static tutorial + #1186, #7
  static tutorial + #1187, #7
  static tutorial + #1188, #7
  static tutorial + #1189, #7
  static tutorial + #1190, #7
  static tutorial + #1191, #7
  static tutorial + #1192, #7
  static tutorial + #1193, #7
  static tutorial + #1194, #7
  static tutorial + #1195, #7
  static tutorial + #1196, #7
  static tutorial + #1197, #7
  static tutorial + #1198, #7
  static tutorial + #1199, #11

print_tutorialScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #tutorial
  loadn R1, #0
  loadn R2, #1200

  print_tutorialScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne print_tutorialScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts
  
tela : var #1200
  ;Linha 0
  static tela + #0, #9
  static tela + #1, #6
  static tela + #2, #6
  static tela + #3, #6
  static tela + #4, #6
  static tela + #5, #6
  static tela + #6, #6
  static tela + #7, #6
  static tela + #8, #6
  static tela + #9, #6
  static tela + #10, #6
  static tela + #11, #6
  static tela + #12, #6
  static tela + #13, #6
  static tela + #14, #6
  static tela + #15, #6
  static tela + #16, #6
  static tela + #17, #6
  static tela + #18, #6
  static tela + #19, #6
  static tela + #20, #6
  static tela + #21, #6
  static tela + #22, #6
  static tela + #23, #6
  static tela + #24, #6
  static tela + #25, #6
  static tela + #26, #6
  static tela + #27, #5
  static tela + #28, #83
  static tela + #29, #67
  static tela + #30, #79
  static tela + #31, #82
  static tela + #32, #69
  static tela + #33, #58
  static tela + #34, #3967
  static tela + #35, #3967
  static tela + #36, #3967
  static tela + #37, #3967
  static tela + #38, #3967
  static tela + #39, #3967

  ;Linha 1
  static tela + #40, #5
  static tela + #41, #3967
  static tela + #42, #3967
  static tela + #43, #3967
  static tela + #44, #3967
  static tela + #45, #3967
  static tela + #46, #3967
  static tela + #47, #3967
  static tela + #48, #3967
  static tela + #49, #3967
  static tela + #50, #3967
  static tela + #51, #3967
  static tela + #52, #3967
  static tela + #53, #3967
  static tela + #54, #3967
  static tela + #55, #3967
  static tela + #56, #3967
  static tela + #57, #3967
  static tela + #58, #3967
  static tela + #59, #3967
  static tela + #60, #3967
  static tela + #61, #3967
  static tela + #62, #3967
  static tela + #63, #3967
  static tela + #64, #3967
  static tela + #65, #3967
  static tela + #66, #3967
  static tela + #67, #5
  static tela + #68, #3967
  static tela + #69, #3967
  static tela + #70, #3967
  static tela + #71, #3967
  static tela + #72, #3967
  static tela + #73, #3967
  static tela + #74, #3967
  static tela + #75, #3967
  static tela + #76, #3967
  static tela + #77, #3967
  static tela + #78, #3967
  static tela + #79, #3967

  ;Linha 2
  static tela + #80, #5
  static tela + #81, #3967
  static tela + #82, #3967
  static tela + #83, #3967
  static tela + #84, #3967
  static tela + #85, #3967
  static tela + #86, #3967
  static tela + #87, #3967
  static tela + #88, #3967
  static tela + #89, #3967
  static tela + #90, #3967
  static tela + #91, #3967
  static tela + #92, #3967
  static tela + #93, #3967
  static tela + #94, #3967
  static tela + #95, #3967
  static tela + #96, #3967
  static tela + #97, #3967
  static tela + #98, #3967
  static tela + #99, #3967
  static tela + #100, #3967
  static tela + #101, #3967
  static tela + #102, #3967
  static tela + #103, #3967
  static tela + #104, #3967
  static tela + #105, #3967
  static tela + #106, #3967
  static tela + #107, #5
  static tela + #108, #3967
  static tela + #109, #3967
  static tela + #110, #3967
  static tela + #111, #3967
  static tela + #112, #3967
  static tela + #113, #3967
  static tela + #114, #3967
  static tela + #115, #3967
  static tela + #116, #3967
  static tela + #117, #3967
  static tela + #118, #3967
  static tela + #119, #3967

  ;Linha 3
  static tela + #120, #5
  static tela + #121, #3967
  static tela + #122, #3967
  static tela + #123, #3967
  static tela + #124, #3967
  static tela + #125, #3967
  static tela + #126, #3967
  static tela + #127, #3967
  static tela + #128, #3967
  static tela + #129, #3967
  static tela + #130, #3967
  static tela + #131, #3967
  static tela + #132, #3967
  static tela + #133, #3967
  static tela + #134, #3967
  static tela + #135, #3967
  static tela + #136, #3967
  static tela + #137, #3967
  static tela + #138, #3967
  static tela + #139, #3967
  static tela + #140, #3967
  static tela + #141, #3967
  static tela + #142, #3967
  static tela + #143, #3967
  static tela + #144, #3967
  static tela + #145, #3967
  static tela + #146, #3967
  static tela + #147, #5
  static tela + #148, #3967
  static tela + #149, #3967
  static tela + #150, #3967
  static tela + #151, #3967
  static tela + #152, #3967
  static tela + #153, #3967
  static tela + #154, #3967
  static tela + #155, #3967
  static tela + #156, #3967
  static tela + #157, #3967
  static tela + #158, #3967
  static tela + #159, #3967

  ;Linha 4
  static tela + #160, #5
  static tela + #161, #3967
  static tela + #162, #3967
  static tela + #163, #3967
  static tela + #164, #3967
  static tela + #165, #3967
  static tela + #166, #3967
  static tela + #167, #3967
  static tela + #168, #3967
  static tela + #169, #3967
  static tela + #170, #3967
  static tela + #171, #3967
  static tela + #172, #3967
  static tela + #173, #3967
  static tela + #174, #3967
  static tela + #175, #3967
  static tela + #176, #3967
  static tela + #177, #3967
  static tela + #178, #3967
  static tela + #179, #3967
  static tela + #180, #3967
  static tela + #181, #3967
  static tela + #182, #3967
  static tela + #183, #3967
  static tela + #184, #3967
  static tela + #185, #3967
  static tela + #186, #3967
  static tela + #187, #5
  static tela + #188, #3967
  static tela + #189, #3967
  static tela + #190, #3967
  static tela + #191, #3967
  static tela + #192, #3967
  static tela + #193, #3967
  static tela + #194, #3967
  static tela + #195, #3967
  static tela + #196, #3967
  static tela + #197, #3967
  static tela + #198, #3967
  static tela + #199, #3967

  ;Linha 5
  static tela + #200, #5
  static tela + #201, #3967
  static tela + #202, #3967
  static tela + #203, #3967
  static tela + #204, #3967
  static tela + #205, #3967
  static tela + #206, #3967
  static tela + #207, #3967
  static tela + #208, #3967
  static tela + #209, #3967
  static tela + #210, #3967
  static tela + #211, #3967
  static tela + #212, #3967
  static tela + #213, #3967
  static tela + #214, #3967
  static tela + #215, #3967
  static tela + #216, #3967
  static tela + #217, #3967
  static tela + #218, #3967
  static tela + #219, #3967
  static tela + #220, #3967
  static tela + #221, #3967
  static tela + #222, #3967
  static tela + #223, #3967
  static tela + #224, #3967
  static tela + #225, #3967
  static tela + #226, #3967
  static tela + #227, #5
  static tela + #228, #3967
  static tela + #229, #3967
  static tela + #230, #3967
  static tela + #231, #3967
  static tela + #232, #3967
  static tela + #233, #3967
  static tela + #234, #3967
  static tela + #235, #3967
  static tela + #236, #3967
  static tela + #237, #3967
  static tela + #238, #3967
  static tela + #239, #3967

  ;Linha 6
  static tela + #240, #5
  static tela + #241, #3967
  static tela + #242, #3967
  static tela + #243, #3967
  static tela + #244, #3967
  static tela + #245, #3967
  static tela + #246, #3967
  static tela + #247, #3967
  static tela + #248, #3967
  static tela + #249, #3967
  static tela + #250, #3967
  static tela + #251, #3967
  static tela + #252, #3967
  static tela + #253, #3967
  static tela + #254, #3967
  static tela + #255, #3967
  static tela + #256, #3967
  static tela + #257, #3967
  static tela + #258, #3967
  static tela + #259, #3967
  static tela + #260, #3967
  static tela + #261, #3967
  static tela + #262, #3967
  static tela + #263, #3967
  static tela + #264, #3967
  static tela + #265, #3967
  static tela + #266, #3967
  static tela + #267, #5
  static tela + #268, #3967
  static tela + #269, #3967
  static tela + #270, #3967
  static tela + #271, #3967
  static tela + #272, #3967
  static tela + #273, #3967
  static tela + #274, #3967
  static tela + #275, #3967
  static tela + #276, #3967
  static tela + #277, #3967
  static tela + #278, #3967
  static tela + #279, #3967

  ;Linha 7
  static tela + #280, #12
  static tela + #281, #7
  static tela + #282, #7
  static tela + #283, #7
  static tela + #284, #7
  static tela + #285, #7
  static tela + #286, #7
  static tela + #287, #7
  static tela + #288, #7
  static tela + #289, #7
  static tela + #290, #7
  static tela + #291, #7
  static tela + #292, #7
  static tela + #293, #7
  static tela + #294, #7
  static tela + #295, #7
  static tela + #296, #7
  static tela + #297, #7
  static tela + #298, #7
  static tela + #299, #7
  static tela + #300, #7
  static tela + #301, #7
  static tela + #302, #7
  static tela + #303, #7
  static tela + #304, #7
  static tela + #305, #7
  static tela + #306, #7
  static tela + #307, #5
  static tela + #308, #3967
  static tela + #309, #3967
  static tela + #310, #3967
  static tela + #311, #3967
  static tela + #312, #3967
  static tela + #313, #3967
  static tela + #314, #3967
  static tela + #315, #3967
  static tela + #316, #3967
  static tela + #317, #3967
  static tela + #318, #3967
  static tela + #319, #3967

  ;Linha 8
  static tela + #320, #3967
  static tela + #321, #3967
  static tela + #322, #3967
  static tela + #323, #3967
  static tela + #324, #3967
  static tela + #325, #3967
  static tela + #326, #3967
  static tela + #327, #3967
  static tela + #328, #3967
  static tela + #329, #3967
  static tela + #330, #3967
  static tela + #331, #3967
  static tela + #332, #3967
  static tela + #333, #3967
  static tela + #334, #3967
  static tela + #335, #3967
  static tela + #336, #3967
  static tela + #337, #3967
  static tela + #338, #3967
  static tela + #339, #3967
  static tela + #340, #3967
  static tela + #341, #3967
  static tela + #342, #3967
  static tela + #343, #3967
  static tela + #344, #3967
  static tela + #345, #3967
  static tela + #346, #3967
  static tela + #347, #3967
  static tela + #348, #3967
  static tela + #349, #3967
  static tela + #350, #3967
  static tela + #351, #3967
  static tela + #352, #3967
  static tela + #353, #3967
  static tela + #354, #3967
  static tela + #355, #3967
  static tela + #356, #3967
  static tela + #357, #3967
  static tela + #358, #3967
  static tela + #359, #3967

  ;Linha 9
  static tela + #360, #3967
  static tela + #361, #3967
  static tela + #362, #3967
  static tela + #363, #3967
  static tela + #364, #3967
  static tela + #365, #3967
  static tela + #366, #3967
  static tela + #367, #3967
  static tela + #368, #3967
  static tela + #369, #3967
  static tela + #370, #3967
  static tela + #371, #3967
  static tela + #372, #3967
  static tela + #373, #3967
  static tela + #374, #3967
  static tela + #375, #3967
  static tela + #376, #3967
  static tela + #377, #3967
  static tela + #378, #3967
  static tela + #379, #3967
  static tela + #380, #3967
  static tela + #381, #3967
  static tela + #382, #3967
  static tela + #383, #3967
  static tela + #384, #3967
  static tela + #385, #3967
  static tela + #386, #3967
  static tela + #387, #3967
  static tela + #388, #3967
  static tela + #389, #3967
  static tela + #390, #3967
  static tela + #391, #3967
  static tela + #392, #3967
  static tela + #393, #3967
  static tela + #394, #3967
  static tela + #395, #3967
  static tela + #396, #3967
  static tela + #397, #3967
  static tela + #398, #3967
  static tela + #399, #3967

  ;Linha 10
  static tela + #400, #3967
  static tela + #401, #3967
  static tela + #402, #3967
  static tela + #403, #3967
  static tela + #404, #3967
  static tela + #405, #3967
  static tela + #406, #3967
  static tela + #407, #3967
  static tela + #408, #3967
  static tela + #409, #3967
  static tela + #410, #3967
  static tela + #411, #3967
  static tela + #412, #3967
  static tela + #413, #3967
  static tela + #414, #3967
  static tela + #415, #3967
  static tela + #416, #3967
  static tela + #417, #3967
  static tela + #418, #3967
  static tela + #419, #3967
  static tela + #420, #3967
  static tela + #421, #3967
  static tela + #422, #3967
  static tela + #423, #3967
  static tela + #424, #3967
  static tela + #425, #3967
  static tela + #426, #3967
  static tela + #427, #3967
  static tela + #428, #3967
  static tela + #429, #3967
  static tela + #430, #3967
  static tela + #431, #3967
  static tela + #432, #3967
  static tela + #433, #3967
  static tela + #434, #3967
  static tela + #435, #3967
  static tela + #436, #3967
  static tela + #437, #3967
  static tela + #438, #3967
  static tela + #439, #3967

  ;Linha 11
  static tela + #440, #3967
  static tela + #441, #3967
  static tela + #442, #3967
  static tela + #443, #3967
  static tela + #444, #3967
  static tela + #445, #3967
  static tela + #446, #3967
  static tela + #447, #3967
  static tela + #448, #3967
  static tela + #449, #3967
  static tela + #450, #3967
  static tela + #451, #3967
  static tela + #452, #3967
  static tela + #453, #3967
  static tela + #454, #3967
  static tela + #455, #3967
  static tela + #456, #3967
  static tela + #457, #3967
  static tela + #458, #3967
  static tela + #459, #3967
  static tela + #460, #3967
  static tela + #461, #3967
  static tela + #462, #3967
  static tela + #463, #3967
  static tela + #464, #3967
  static tela + #465, #3967
  static tela + #466, #3967
  static tela + #467, #3967
  static tela + #468, #3967
  static tela + #469, #3967
  static tela + #470, #3967
  static tela + #471, #3967
  static tela + #472, #3967
  static tela + #473, #3967
  static tela + #474, #3967
  static tela + #475, #3967
  static tela + #476, #3967
  static tela + #477, #3967
  static tela + #478, #3967
  static tela + #479, #3967

  ;Linha 12
  static tela + #480, #3967
  static tela + #481, #3967
  static tela + #482, #3967
  static tela + #483, #3967
  static tela + #484, #3967
  static tela + #485, #3967
  static tela + #486, #3967
  static tela + #487, #3967
  static tela + #488, #3967
  static tela + #489, #3967
  static tela + #490, #3967
  static tela + #491, #3967
  static tela + #492, #3967
  static tela + #493, #3967
  static tela + #494, #3967
  static tela + #495, #3967
  static tela + #496, #3967
  static tela + #497, #3967
  static tela + #498, #3967
  static tela + #499, #3967
  static tela + #500, #3967
  static tela + #501, #3967
  static tela + #502, #3967
  static tela + #503, #3967
  static tela + #504, #3967
  static tela + #505, #3967
  static tela + #506, #3967
  static tela + #507, #3967
  static tela + #508, #3967
  static tela + #509, #3967
  static tela + #510, #3967
  static tela + #511, #3967
  static tela + #512, #3967
  static tela + #513, #3967
  static tela + #514, #3967
  static tela + #515, #3967
  static tela + #516, #3967
  static tela + #517, #3967
  static tela + #518, #3967
  static tela + #519, #3967

  ;Linha 13
  static tela + #520, #3967
  static tela + #521, #3967
  static tela + #522, #3967
  static tela + #523, #3967
  static tela + #524, #3967
  static tela + #525, #3967
  static tela + #526, #3967
  static tela + #527, #3967
  static tela + #528, #3967
  static tela + #529, #3967
  static tela + #530, #3967
  static tela + #531, #3967
  static tela + #532, #3967
  static tela + #533, #3967
  static tela + #534, #3967
  static tela + #535, #3967
  static tela + #536, #3967
  static tela + #537, #3967
  static tela + #538, #3967
  static tela + #539, #3967
  static tela + #540, #3967
  static tela + #541, #3967
  static tela + #542, #3967
  static tela + #543, #3967
  static tela + #544, #3967
  static tela + #545, #3967
  static tela + #546, #3967
  static tela + #547, #3967
  static tela + #548, #3967
  static tela + #549, #3967
  static tela + #550, #3967
  static tela + #551, #3967
  static tela + #552, #3967
  static tela + #553, #3967
  static tela + #554, #3967
  static tela + #555, #3967
  static tela + #556, #3967
  static tela + #557, #3967
  static tela + #558, #3967
  static tela + #559, #3967

  ;Linha 14
  static tela + #560, #3967
  static tela + #561, #3967
  static tela + #562, #3967
  static tela + #563, #3967
  static tela + #564, #3967
  static tela + #565, #3967
  static tela + #566, #3967
  static tela + #567, #3967
  static tela + #568, #3967
  static tela + #569, #3967
  static tela + #570, #3967
  static tela + #571, #3967
  static tela + #572, #3967
  static tela + #573, #3967
  static tela + #574, #3967
  static tela + #575, #3967
  static tela + #576, #3967
  static tela + #577, #3967
  static tela + #578, #3967
  static tela + #579, #3967
  static tela + #580, #3967
  static tela + #581, #3967
  static tela + #582, #3967
  static tela + #583, #3967
  static tela + #584, #3967
  static tela + #585, #3967
  static tela + #586, #3967
  static tela + #587, #3967
  static tela + #588, #3967
  static tela + #589, #3967
  static tela + #590, #3967
  static tela + #591, #3967
  static tela + #592, #3967
  static tela + #593, #3967
  static tela + #594, #3967
  static tela + #595, #3967
  static tela + #596, #3967
  static tela + #597, #3967
  static tela + #598, #3967
  static tela + #599, #3967

  ;Linha 15
  static tela + #600, #3967
  static tela + #601, #3967
  static tela + #602, #3967
  static tela + #603, #3967
  static tela + #604, #3967
  static tela + #605, #3967
  static tela + #606, #3967
  static tela + #607, #3967
  static tela + #608, #3967
  static tela + #609, #3967
  static tela + #610, #3967
  static tela + #611, #3967
  static tela + #612, #3967
  static tela + #613, #3967
  static tela + #614, #3967
  static tela + #615, #3967
  static tela + #616, #3967
  static tela + #617, #3967
  static tela + #618, #3967
  static tela + #619, #3967
  static tela + #620, #3967
  static tela + #621, #3967
  static tela + #622, #3967
  static tela + #623, #3967
  static tela + #624, #3967
  static tela + #625, #3967
  static tela + #626, #3967
  static tela + #627, #3967
  static tela + #628, #3967
  static tela + #629, #3967
  static tela + #630, #3967
  static tela + #631, #3967
  static tela + #632, #3967
  static tela + #633, #3967
  static tela + #634, #3967
  static tela + #635, #3967
  static tela + #636, #3967
  static tela + #637, #3967
  static tela + #638, #3967
  static tela + #639, #3967

  ;Linha 16
  static tela + #640, #3967
  static tela + #641, #3967
  static tela + #642, #3967
  static tela + #643, #3967
  static tela + #644, #3967
  static tela + #645, #3967
  static tela + #646, #3967
  static tela + #647, #3967
  static tela + #648, #3967
  static tela + #649, #3967
  static tela + #650, #3967
  static tela + #651, #3967
  static tela + #652, #3967
  static tela + #653, #3967
  static tela + #654, #3967
  static tela + #655, #3967
  static tela + #656, #3967
  static tela + #657, #3967
  static tela + #658, #3967
  static tela + #659, #3967
  static tela + #660, #3967
  static tela + #661, #3967
  static tela + #662, #3967
  static tela + #663, #3967
  static tela + #664, #3967
  static tela + #665, #3967
  static tela + #666, #3967
  static tela + #667, #3967
  static tela + #668, #3967
  static tela + #669, #3967
  static tela + #670, #3967
  static tela + #671, #3967
  static tela + #672, #3967
  static tela + #673, #3967
  static tela + #674, #3967
  static tela + #675, #3967
  static tela + #676, #3967
  static tela + #677, #3967
  static tela + #678, #3967
  static tela + #679, #3967

  ;Linha 17
  static tela + #680, #3967
  static tela + #681, #3967
  static tela + #682, #3967
  static tela + #683, #3967
  static tela + #684, #3967
  static tela + #685, #3967
  static tela + #686, #3967
  static tela + #687, #3967
  static tela + #688, #3967
  static tela + #689, #3967
  static tela + #690, #3967
  static tela + #691, #3967
  static tela + #692, #3967
  static tela + #693, #3967
  static tela + #694, #3967
  static tela + #695, #3967
  static tela + #696, #3967
  static tela + #697, #3967
  static tela + #698, #3967
  static tela + #699, #3967
  static tela + #700, #3967
  static tela + #701, #3967
  static tela + #702, #3967
  static tela + #703, #3967
  static tela + #704, #3967
  static tela + #705, #3967
  static tela + #706, #3967
  static tela + #707, #3967
  static tela + #708, #3967
  static tela + #709, #3967
  static tela + #710, #3967
  static tela + #711, #3967
  static tela + #712, #3967
  static tela + #713, #3967
  static tela + #714, #3967
  static tela + #715, #3967
  static tela + #716, #3967
  static tela + #717, #3967
  static tela + #718, #3967
  static tela + #719, #3967

  ;Linha 18
  static tela + #720, #3967
  static tela + #721, #3967
  static tela + #722, #3967
  static tela + #723, #3967
  static tela + #724, #3967
  static tela + #725, #3967
  static tela + #726, #3967
  static tela + #727, #3967
  static tela + #728, #3967
  static tela + #729, #3967
  static tela + #730, #3967
  static tela + #731, #3967
  static tela + #732, #3967
  static tela + #733, #3967
  static tela + #734, #3967
  static tela + #735, #3967
  static tela + #736, #3967
  static tela + #737, #3967
  static tela + #738, #3967
  static tela + #739, #3967
  static tela + #740, #3967
  static tela + #741, #3967
  static tela + #742, #3967
  static tela + #743, #3967
  static tela + #744, #3967
  static tela + #745, #3967
  static tela + #746, #3967
  static tela + #747, #3967
  static tela + #748, #3967
  static tela + #749, #3967
  static tela + #750, #3967
  static tela + #751, #3967
  static tela + #752, #3967
  static tela + #753, #3967
  static tela + #754, #3967
  static tela + #755, #3967
  static tela + #756, #3967
  static tela + #757, #3967
  static tela + #758, #3967
  static tela + #759, #3967

  ;Linha 19
  static tela + #760, #3967
  static tela + #761, #3967
  static tela + #762, #3967
  static tela + #763, #3967
  static tela + #764, #3967
  static tela + #765, #3967
  static tela + #766, #3967
  static tela + #767, #3967
  static tela + #768, #3967
  static tela + #769, #3967
  static tela + #770, #3967
  static tela + #771, #3967
  static tela + #772, #3967
  static tela + #773, #3967
  static tela + #774, #3967
  static tela + #775, #3967
  static tela + #776, #3967
  static tela + #777, #3967
  static tela + #778, #3967
  static tela + #779, #3967
  static tela + #780, #3967
  static tela + #781, #3967
  static tela + #782, #3967
  static tela + #783, #3967
  static tela + #784, #3967
  static tela + #785, #3967
  static tela + #786, #3967
  static tela + #787, #3967
  static tela + #788, #3967
  static tela + #789, #3967
  static tela + #790, #3967
  static tela + #791, #3967
  static tela + #792, #3967
  static tela + #793, #3967
  static tela + #794, #3967
  static tela + #795, #3967
  static tela + #796, #3967
  static tela + #797, #3967
  static tela + #798, #3967
  static tela + #799, #3967

  ;Linha 20
  static tela + #800, #3967
  static tela + #801, #3967
  static tela + #802, #3967
  static tela + #803, #3967
  static tela + #804, #3967
  static tela + #805, #3967
  static tela + #806, #3967
  static tela + #807, #3967
  static tela + #808, #3967
  static tela + #809, #3967
  static tela + #810, #3967
  static tela + #811, #3967
  static tela + #812, #3967
  static tela + #813, #3967
  static tela + #814, #3967
  static tela + #815, #3967
  static tela + #816, #3967
  static tela + #817, #3967
  static tela + #818, #3967
  static tela + #819, #3967
  static tela + #820, #3967
  static tela + #821, #3967
  static tela + #822, #3967
  static tela + #823, #3967
  static tela + #824, #3967
  static tela + #825, #3967
  static tela + #826, #3967
  static tela + #827, #3967
  static tela + #828, #3967
  static tela + #829, #3967
  static tela + #830, #3967
  static tela + #831, #3967
  static tela + #832, #3967
  static tela + #833, #3967
  static tela + #834, #3967
  static tela + #835, #3967
  static tela + #836, #3967
  static tela + #837, #3967
  static tela + #838, #3967
  static tela + #839, #3967

  ;Linha 21
  static tela + #840, #3967
  static tela + #841, #3967
  static tela + #842, #3967
  static tela + #843, #3967
  static tela + #844, #3967
  static tela + #845, #3967
  static tela + #846, #3967
  static tela + #847, #3967
  static tela + #848, #3967
  static tela + #849, #3967
  static tela + #850, #3967
  static tela + #851, #3967
  static tela + #852, #3967
  static tela + #853, #3967
  static tela + #854, #3967
  static tela + #855, #3967
  static tela + #856, #3967
  static tela + #857, #3967
  static tela + #858, #3967
  static tela + #859, #3967
  static tela + #860, #3967
  static tela + #861, #3967
  static tela + #862, #3967
  static tela + #863, #3967
  static tela + #864, #3967
  static tela + #865, #3967
  static tela + #866, #3967
  static tela + #867, #3967
  static tela + #868, #3967
  static tela + #869, #3967
  static tela + #870, #3967
  static tela + #871, #3967
  static tela + #872, #3967
  static tela + #873, #3967
  static tela + #874, #3967
  static tela + #875, #3967
  static tela + #876, #3967
  static tela + #877, #3967
  static tela + #878, #3967
  static tela + #879, #3967

  ;Linha 22
  static tela + #880, #9
  static tela + #881, #6
  static tela + #882, #6
  static tela + #883, #6
  static tela + #884, #6
  static tela + #885, #6
  static tela + #886, #6
  static tela + #887, #6
  static tela + #888, #6
  static tela + #889, #6
  static tela + #890, #6
  static tela + #891, #6
  static tela + #892, #6
  static tela + #893, #6
  static tela + #894, #6
  static tela + #895, #6
  static tela + #896, #6
  static tela + #897, #6
  static tela + #898, #6
  static tela + #899, #6
  static tela + #900, #6
  static tela + #901, #6
  static tela + #902, #6
  static tela + #903, #6
  static tela + #904, #6
  static tela + #905, #6
  static tela + #906, #0
  static tela + #907, #0
  static tela + #908, #0
  static tela + #909, #6
  static tela + #910, #2048
  static tela + #911, #2048
  static tela + #912, #2048
  static tela + #913, #2048
  static tela + #914, #2048
  static tela + #915, #6
  static tela + #916, #2816
  static tela + #917, #2816
  static tela + #918, #6
  static tela + #919, #10

  ;Linha 23
  static tela + #920, #5
  static tela + #921, #3967
  static tela + #922, #2304
  static tela + #923, #512
  static tela + #924, #3967
  static tela + #925, #3967
  static tela + #926, #512
  static tela + #927, #768
  static tela + #928, #3967
  static tela + #929, #2817
  static tela + #930, #2819
  static tela + #931, #3967
  static tela + #932, #256
  static tela + #933, #256
  static tela + #934, #3967
  static tela + #935, #0
  static tela + #936, #2816
  static tela + #937, #3967
  static tela + #938, #110
  static tela + #939, #3967
  static tela + #940, #110
  static tela + #941, #3967
  static tela + #942, #110
  static tela + #943, #3967
  static tela + #944, #3967
  static tela + #945, #3967
  static tela + #946, #0
  static tela + #947, #0
  static tela + #948, #0
  static tela + #949, #3967
  static tela + #950, #2048
  static tela + #951, #2048
  static tela + #952, #2048
  static tela + #953, #2048
  static tela + #954, #2048
  static tela + #955, #3967
  static tela + #956, #2816
  static tela + #957, #2816
  static tela + #958, #3967
  static tela + #959, #8

  ;Linha 24
  static tela + #960, #5
  static tela + #961, #3967
  static tela + #962, #2304
  static tela + #963, #2304
  static tela + #964, #3967
  static tela + #965, #3967
  static tela + #966, #512
  static tela + #967, #768
  static tela + #968, #3967
  static tela + #969, #2818
  static tela + #970, #2820
  static tela + #971, #3967
  static tela + #972, #256
  static tela + #973, #256
  static tela + #974, #3967
  static tela + #975, #0
  static tela + #976, #0
  static tela + #977, #3967
  static tela + #978, #2133
  static tela + #979, #3967
  static tela + #980, #2389
  static tela + #981, #3967
  static tela + #982, #2901
  static tela + #983, #3967
  static tela + #984, #3967
  static tela + #985, #3967
  static tela + #986, #0
  static tela + #987, #0
  static tela + #988, #0
  static tela + #989, #3967
  static tela + #990, #2048
  static tela + #991, #2048
  static tela + #992, #2048
  static tela + #993, #2048
  static tela + #994, #2048
  static tela + #995, #3967
  static tela + #996, #3967
  static tela + #997, #3967
  static tela + #998, #3967
  static tela + #999, #8

  ;Linha 25
  static tela + #1000, #5
  static tela + #1001, #3967
  static tela + #1002, #3967
  static tela + #1003, #3967
  static tela + #1004, #3967
  static tela + #1005, #3967
  static tela + #1006, #3967
  static tela + #1007, #3967
  static tela + #1008, #3967
  static tela + #1009, #3967
  static tela + #1010, #3967
  static tela + #1011, #3967
  static tela + #1012, #3967
  static tela + #1013, #3967
  static tela + #1014, #3967
  static tela + #1015, #3967
  static tela + #1016, #3967
  static tela + #1017, #3967
  static tela + #1018, #3967
  static tela + #1019, #3967
  static tela + #1020, #3967
  static tela + #1021, #3967
  static tela + #1022, #3967
  static tela + #1023, #3967
  static tela + #1024, #3967
  static tela + #1025, #3967
  static tela + #1026, #3967
  static tela + #1027, #3967
  static tela + #1028, #3967
  static tela + #1029, #3967
  static tela + #1030, #3967
  static tela + #1031, #3967
  static tela + #1032, #3967
  static tela + #1033, #3967
  static tela + #1034, #3967
  static tela + #1035, #3967
  static tela + #1036, #3967
  static tela + #1037, #3967
  static tela + #1038, #3967
  static tela + #1039, #8

  ;Linha 26
  static tela + #1040, #5
  static tela + #1041, #3967
  static tela + #1042, #3967
  static tela + #1043, #3967
  static tela + #1044, #3967
  static tela + #1045, #3967
  static tela + #1046, #3967
  static tela + #1047, #3967
  static tela + #1048, #3967
  static tela + #1049, #3967
  static tela + #1050, #3967
  static tela + #1051, #3967
  static tela + #1052, #3967
  static tela + #1053, #3967
  static tela + #1054, #3967
  static tela + #1055, #3967
  static tela + #1056, #3967
  static tela + #1057, #3967
  static tela + #1058, #3967
  static tela + #1059, #3967
  static tela + #1060, #3967
  static tela + #1061, #3967
  static tela + #1062, #3967
  static tela + #1063, #3967
  static tela + #1064, #3967
  static tela + #1065, #3967
  static tela + #1066, #3967
  static tela + #1067, #3967
  static tela + #1068, #3967
  static tela + #1069, #3967
  static tela + #1070, #3967
  static tela + #1071, #3967
  static tela + #1072, #3967
  static tela + #1073, #3967
  static tela + #1074, #3967
  static tela + #1075, #3967
  static tela + #1076, #3967
  static tela + #1077, #3967
  static tela + #1078, #3967
  static tela + #1079, #8

  ;Linha 27
  static tela + #1080, #5
  static tela + #1081, #3967
  static tela + #1082, #3967
  static tela + #1083, #3967
  static tela + #1084, #3967
  static tela + #1085, #3967
  static tela + #1086, #3967
  static tela + #1087, #3967
  static tela + #1088, #3967
  static tela + #1089, #3967
  static tela + #1090, #3967
  static tela + #1091, #3967
  static tela + #1092, #3967
  static tela + #1093, #3967
  static tela + #1094, #3967
  static tela + #1095, #3967
  static tela + #1096, #3967
  static tela + #1097, #3967
  static tela + #1098, #3967
  static tela + #1099, #3967
  static tela + #1100, #3967
  static tela + #1101, #3967
  static tela + #1102, #3967
  static tela + #1103, #3967
  static tela + #1104, #3967
  static tela + #1105, #3967
  static tela + #1106, #3967
  static tela + #1107, #3967
  static tela + #1108, #3967
  static tela + #1109, #3967
  static tela + #1110, #3967
  static tela + #1111, #3967
  static tela + #1112, #3967
  static tela + #1113, #3967
  static tela + #1114, #3967
  static tela + #1115, #3967
  static tela + #1116, #3967
  static tela + #1117, #3967
  static tela + #1118, #3967
  static tela + #1119, #8

  ;Linha 28
  static tela + #1120, #5
  static tela + #1121, #3967
  static tela + #1122, #3967
  static tela + #1123, #3967
  static tela + #1124, #3967
  static tela + #1125, #3967
  static tela + #1126, #3967
  static tela + #1127, #3967
  static tela + #1128, #3967
  static tela + #1129, #3967
  static tela + #1130, #3967
  static tela + #1131, #3967
  static tela + #1132, #3967
  static tela + #1133, #3967
  static tela + #1134, #3967
  static tela + #1135, #3967
  static tela + #1136, #3967
  static tela + #1137, #3967
  static tela + #1138, #3967
  static tela + #1139, #3967
  static tela + #1140, #3967
  static tela + #1141, #3967
  static tela + #1142, #3967
  static tela + #1143, #3967
  static tela + #1144, #3967
  static tela + #1145, #3967
  static tela + #1146, #3967
  static tela + #1147, #3967
  static tela + #1148, #3967
  static tela + #1149, #3967
  static tela + #1150, #3967
  static tela + #1151, #3967
  static tela + #1152, #3967
  static tela + #1153, #3967
  static tela + #1154, #3967
  static tela + #1155, #3967
  static tela + #1156, #3967
  static tela + #1157, #3967
  static tela + #1158, #3967
  static tela + #1159, #8

  ;Linha 29
  static tela + #1160, #12
  static tela + #1161, #7
  static tela + #1162, #7
  static tela + #1163, #7
  static tela + #1164, #7
  static tela + #1165, #7
  static tela + #1166, #7
  static tela + #1167, #7
  static tela + #1168, #7
  static tela + #1169, #7
  static tela + #1170, #7
  static tela + #1171, #7
  static tela + #1172, #7
  static tela + #1173, #7
  static tela + #1174, #7
  static tela + #1175, #7
  static tela + #1176, #7
  static tela + #1177, #7
  static tela + #1178, #7
  static tela + #1179, #7
  static tela + #1180, #7
  static tela + #1181, #7
  static tela + #1182, #7
  static tela + #1183, #7
  static tela + #1184, #7
  static tela + #1185, #7
  static tela + #1186, #7
  static tela + #1187, #7
  static tela + #1188, #7
  static tela + #1189, #7
  static tela + #1190, #7
  static tela + #1191, #7
  static tela + #1192, #7
  static tela + #1193, #7
  static tela + #1194, #7
  static tela + #1195, #7
  static tela + #1196, #7
  static tela + #1197, #7
  static tela + #1198, #7
  static tela + #1199, #11

print_telaScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #tela
  loadn R1, #0
  loadn R2, #1200

  print_telaScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne print_telaScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts