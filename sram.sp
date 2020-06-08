* Descriptions =========================================================================================
*
* Autor: Allan Appelt Constante
* Data:  29/08/2019
*
* -----------------------------------------------------------------------------------------------------
* :                 :------------------Pinos------------------:                                       :
* : Nome            : Alim.   : control     : data            : Parâmetros                            :
* -----------------------------------------------------------------------------------------------------
* : sram_cell       : Vdd Vss : wl          : BL nBL          : Lg Tfin Hfin Lfin Nfin Nf Vnbti Vpbti :
* : sense_amplifier : Vdd Vss : rd srd nLPC : BL nBL out nout : Lg Tfin Hfin Lfin Nfin Nf             :
* : ckt_write       : Vdd Vss : wr swr      : BL nBL in       : Lg Tfin Hfin Lfin Nfin Nf             :
* : pre_charge      : Vdd     : nPC         : BL nBL          : Lg Tfin Hfin Lfin Nfin Nf             :
* -----------------------------------------------------------------------------------------------------
*
* Os parâmetros Vnbti e Vpbti são fontes de tensão postas nos transistores da celula SRAM de forma cru-
* zada para simular a variação da tensão de threshold (Vth) ocasionado pelos efeitos de BTI. Por exemplo
* se quiser que o Vth do transistor aumente 2mV, basta passar este valor como parâmetro (Vpbti=2m ou
* Vnbti=2m). Não é necessario passar valores negativos, as fontes já estão postas de modo a simular os 
* efeitos de forma adequadas para o transistor de canal p e n.
*
* - Lg:   Comprinento do gate; 
* - Tfin: Largura do fin;
* - Hfin: Altura do fin;
* - Lfin: Comprinento do fin;
* - Nfin: Quantidade de fins;
* - Nf:   Quantidade de finger (gates);
*
* O parâmetro Lfin é utilizado para a realização dos calculos das área e perimetros do drain e source.
* O valor da área e perimetro considerados é a somatoria de todos os fins, sendo o numero total de fins
* dados pela multiplicação de Nfin e Nf (Nfin*Nf).
*
* Os parâmetros Tfin, Hfin e Lg são provenientes da tecnologia utilizada, para se variar o Wef deve-se
* alter os numeros de fins (Nfin) e fingers (Nf). O valor de Wef é dado por:
*
*    Wef=(Nf*Nfin)*(2*Hfin+Tfin)
*
* ======================================================================================================

.subckt sram_cell vdd vss wl BL nBL Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1 Vnbti=0 Vpbti=0

	vp		Nbti	nbit	dc		Vnbti
	vn		bit		Pbti	dc		Vpbti

	*Ins.	Drain	Gate	Source	Buck	Type
	msc1 	bit		Nbti	vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msc3 	bit		nbit	vss 	vss 	nfet 	
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msc2 	nbit	bit		vdd 	vdd 	pfet 	
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msc4 	nbit	Pbti	vss 	vss 	nfet 	
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msc5 	bit 	wl 		BL		vss 	nfet 	
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msc6 	nbit 	wl 		nBL		vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends sram_cell

.subckt sense_amplifier vdd vss rd srd nLPC BL nBL out nout Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type
	msa1 	SA		nSA	 	vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa3 	SA		nSA	 	saf 	vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa2 	nSA 	SA	 	vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa4 	nSA 	SA	 	saf 	vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa5	saf 	rd 		vss 	vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin='4*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa6	SA	 	nLPC 	vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa7	nSA	 	nLPC 	vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa8	SA	 	nLPC 	nSA 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa9	SA	 	srd 	BL	 	vss 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	msa10	nSA	 	srd 	nBL	 	vss 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	xd1		vdd		vss 	SA		nout		inv
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	lfin=Lfin
	*===========================================

	xd2		vdd		vss 	nSA		out			inv
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	lfin=Lfin
	*===========================================

.ends sense_amplifier

.subckt ckt_write vdd vss wr swr BL nBL in Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type
	mcw1 	CW		nCW		vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mcw3 	CW		nCW		scf	 	vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mcw2 	nCW		in		vdd		vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
	
	mcw4 	nCW		in		scf	 	vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mcw5	scf	 	wr		vss 	vss 	nfet
		+	l=Lg
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mcw6	CW	 	swr		BL  	vss 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mcw7	nCW	 	swr		nBL 	vss 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends ckt_write

.subckt pre_charge vdd nPC BL nBL Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type
	mpc1 	BL		nPC		vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mpc2 	nBL		nPC		vdd 	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mpc3 	nBL		nPC		BL  	vdd 	pfet
		+	l=Lg
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='(Tfin*Lfin)*(Nfin*Nf)'
		+	psej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej='(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej='(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends pre_charge