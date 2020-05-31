* Descriptions ===================================================
*
* Autor: Allan Appelt Constante
* Data:  29/08/2019
*
* ----------------------------------------------------------------------------------------------------
* :                 :------------------Pinos------------------:                                      :
* : Nome            : Alim.   : control     : data            : Parametrôs                           :
* ----------------------------------------------------------------------------------------------------
* : sram_cell       : Vdd Vss : wl          : BL nBL          : L Tfin Hfin Lfin Nfin Nf Vnbti Vpbti :
* : sense_amplifier : Vdd Vss : rd srd nLPC : BL nBL out nout : L Tfin Hfin Lfin Nfin Nf             :
* : ckt_write       : Vdd Vss : wr swr      : BL nBL in       : L Tfin Hfin Lfin Nfin Nf             :
* : pre_charge      : Vdd     : nPC         : BL nBL          : L Tfin Hfin Lfin Nfin Nf             :
* ----------------------------------------------------------------------------------------------------
*
* ================================================================

.subckt sram_cell vdd vss wl BL nBL L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1 Vnbti=0 Vpbti=0

	vp		Nbti	nbit	dc		Vnbti
	vn		bit		Pbti	dc		Vpbti

	*Ins.	Drain	Gate	Source	Buck	Type
	msc1 	bit		Nbti	vdd 	vdd 	pfet
		+	l=L
		+	nf = Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msc3 	bit		nbit	vss 	vss 	nfet 	
		+	l=L
		+	nf = Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*LB=fin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msc2 	nbit	bit		vdd 	vdd 	pfet 	
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msc4 	nbit	Pbti	vss 	vss 	nfet 	
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msc5 	bit 	wl 		BL		vss 	nfet 	
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msc6 	nbit 	wl 		nBL		vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================
.ends sram_cell

.subckt sense_amplifier vdd vss rd srd nLPC BL nBL out nout L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type
	msa1 	SA		nSA	 	vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa3 	SA		nSA	 	saf 	vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa2 	nSA 	SA	 	vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa4 	nSA 	SA	 	saf 	vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa5	saf 	rd 		vss 	vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin='4*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa6	SA	 	nLPC 	vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa7	nSA	 	nLPC 	vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa8	SA	 	nLPC 	nSA 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa9	SA	 	srd 	BL	 	vss 	pfet
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	msa10	nSA	 	srd 	nBL	 	vss 	pfet
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	xd1		vdd		vss 	SA		nout		inv
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	lfin=Lfin
	*===========================================

	xd2		vdd		vss 	nSA		out			inv
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	lfin=Lfin
	*===========================================

.ends sense_amplifier

.subckt ckt_write vdd vss wr swr BL nBL in L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type
	mcw1 	CW		nCW		vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mcw3 	CW		nCW		scf	 	vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mcw2 	nCW		in		vdd		vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================
	
	mcw4 	nCW		in		scf	 	vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mcw5	scf	 	wr		vss 	vss 	nfet
		+	l=L
		+	nf=Nf
		+	nfin='2*Nfin'
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mcw6	CW	 	swr		BL  	vss 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mcw7	nCW	 	swr		nBL 	vss 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================
.ends ckt_write

.subckt pre_charge vdd nPC BL nBL L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type
	mpc1 	BL		nPC		vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mpc2 	nBL		nPC		vdd 	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mpc3 	nBL		nPC		BL  	vdd 	pfet
		+	l=L
		+	nf=Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*Lfin'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================
.ends pre_charge