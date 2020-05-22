* Descriptions ===================================================
*
* Autor: Allan Appelt Constante
* Data:  29/08/2019
*
* ------------------------------------------------------------------------------------------
* :                 :------------------Pinos------------------:                            :
* : Nome            : Alim.   : control     : data            : Parametrôs                 :
* ------------------------------------------------------------------------------------------
* : sram_cell       : Vdd Vss : wl          : BL nBL          : L TFIN LB NFIN Vnbti Vpbti :
* : sense_amplifier : Vdd Vss : rd srd nLPC : BL nBL out nout : L TFIN LB NFIN             :
* : ckt_write       : Vdd Vss : wr swr      : BL nBL in       : L TFIN LB NFIN             :
* : pre_charge      : Vdd     : nPC         : BL nBL          : L TFIN LB NFIN             :
* ------------------------------------------------------------------------------------------
*
* ================================================================

.subckt sram_cell vdd vss wl BL nBL L=18n TFIN=10n LB=63n NFIN=1 Vnbti=0 Vpbti=0

	vp		Nbti	nbit	dc		Vnbti
	vn		bit		Pbti	dc		Vpbti

	*Ins.	Drain	Gate	Source	Buck	Type
	msc1 	bit		Nbti	vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msc3 	bit		nbit	vss 	vss 	nfet 	
		+	l=L 
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msc2 	nbit	bit		vdd 	vdd 	pfet 	
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msc4 	nbit	Pbti	vss 	vss 	nfet 	
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msc5 	bit 	wl 		BL		vss 	nfet 	
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msc6 	nbit 	wl 		nBL		vss 	nfet
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends sram_cell

.subckt sense_amplifier vdd vss rd srd nLPC BL nBL out nout L=18n TFIN=10n LB=63n NFIN=1

	*Ins.	Drain	Gate	Source	Buck	Type
	msa1 	SA		nSA	 	vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa3 	SA		nSA	 	saf 	vss 	nfet
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa2 	nSA 	SA	 	vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa4 	nSA 	SA	 	saf 	vss 	nfet
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa5	saf 	rd 		vss 	vss 	nfet
		+	l=L
		+	nfin='4*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa6	SA	 	nLPC 	vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa7	nSA	 	nLPC 	vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa8	SA	 	nLPC 	nSA 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa9	SA	 	srd 	BL	 	vss 	pfet
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	msa10	nSA	 	srd 	nBL	 	vss 	pfet
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	xd1		vdd		vss 	SA		nout		inv
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	lb=LB
	*===========================================

	xd2		vdd		vss 	nSA		out			inv
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	lb=LB
	*===========================================

.ends sense_amplifier

.subckt ckt_write vdd vss wr swr BL nBL in L=18n TFIN=10n LB=63n NFIN=1

	*Ins.	Drain	Gate	Source	Buck	Type
	mcw1 	CW		nCW		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mcw3 	CW		nCW		scf	 	vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mcw2 	nCW		in		vdd		vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
	
	mcw4 	nCW		in		scf	 	vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mcw5	scf	 	wr		vss 	vss 	nfet
		+	l=L
		+	nfin='2*NFIN'
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mcw6	CW	 	swr		BL  	vss 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mcw7	nCW	 	swr		nBL 	vss 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends ckt_write

.subckt pre_charge vdd nPC BL nBL L=18n TFIN=10n LB=63n NFIN=1

	*Ins.	Drain	Gate	Source	Buck	Type
	mpc1 	BL		nPC		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mpc2 	nBL		nPC		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mpc3 	nBL		nPC		BL  	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends pre_charge