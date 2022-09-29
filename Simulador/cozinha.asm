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
