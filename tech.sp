* Descriptions ===================================================
*
* Autor: Allan Appelt Constante
* Data: 29/08/2019
*
* Teste nas portas lógicas - 04/09/2019
* Modificação para transistores - 19/09/2019
* Modificação - 03/10/2019
* -- Exclusão do subcircuito "saida"
* -- Alterado os nomes de sucircuitos para:
* ---- sense_amplifier;
* ---- ckto_write;
*
* Modificação - 06/10/2019
* -- Alterado os parametros de entrada (nfin e l);
* -- Alterado as nomeclaturas dos componentes;
* -- Alterado os nomes de sucircuitos para:
* ---- hangup;
*
* Modificação - 06/10/2019
* -- Alterado os nomes de sucircuitos para:
* ---- pre_charge;
* 
* wl = word line
* bl = bit line
* nbl = bit line barrado
*
* ================================================================

* Tech files =====================================================
.include 'modelfiles/hp/14nfet.pm'
.include 'modelfiles/hp/14pfet.pm'
* ================================================================

.subckt inv vdd vss a z L=18n TFIN=10n LB=63n NFIN=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mip 	z 		a 		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	min		z		a		vss		vss		nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends inv

.subckt nand vdd vss a b z L=18n TFIN=10n LB=63n NFIN=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mndp1 	z 		a 		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mndp2	z		b 		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mndn1	z 		a 		no 		vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mndn2	no		b		vss		vss		nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends nand

.subckt nor vdd vss a b z L=18n TFIN=10n LB=63n NFIN=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mp1 	no 		a 		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mp2 	z 		b 		no  	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mn1 	z 		a 		vss		vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mn2 	z		b 		vss 	vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends nor

.subckt xor vdd vss a b z L=18n TFIN=10n LB=63n NFIN=1

	x1 vdd vss a na 	inv 	L=L TFIN=TFIN LB=LB NFIN=NFIN
	x2 vdd vss b nb 	inv 	L=L TFIN=TFIN LB=LB NFIN=NFIN

	*Ins.	Drain	Gate	Source	Buck	Type

	mp1 	no1		nb 		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mp2 	z 		a 		no1 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mp3 	no2		b 		vdd 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mp4 	z 		na 		no2 	vdd 	pfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mn1 	z 		b 		no3		vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mn2 	no3		a 		vss 	vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mn3 	z 		nb 		no4		vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================

	mn4 	no4		na 		vss 	vss 	nfet
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	asej='TFIN*LB'
		+	psej='2*TFIN+2*LB'
		+	adej='TFIN*LB'
		+	pdej='2*TFIN+2*LB'
	*===========================================
.ends xor

.subckt and vdd vss a b z L=18n TFIN=10n LB=63n NFIN=1

	x1 vdd vss a  b nz 	nand 	L=L TFIN=TFIN LB=LB NFIN=NFIN
	x2 vdd vss nz z 	inv 	L=L TFIN=TFIN LB=LB NFIN=NFIN
.ends and

.subckt or vdd vss a b z L=18n TFIN=10n LB=63n NFIN=1

	x1 vdd vss a  b nz 	nor 	L=L TFIN=TFIN LB=LB NFIN=NFIN
	x2 vdd vss nz z 	inv 	L=L TFIN=TFIN LB=LB NFIN=NFIN
.ends or

.subckt xnor vdd vss a b z L=18n TFIN=10n LB=63n NFIN=1

	x1 vdd vss a  b nz 	xor 	L=L TFIN=TFIN LB=LB NFIN=NFIN
	x2 vdd vss nz z 	inv 	L=L TFIN=TFIN LB=LB NFIN=NFIN
.ends xnor

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

	xd1		vdd		vss 	SA		out		inv
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	lb=LB
	*===========================================

	xd2		vdd		vss 	nSA		nout	inv
		+	l=L
		+	nfin=NFIN
		+	tfin=TFIN
		+	lb=LB
	*===========================================

.ends sense_amplifier

.subckt ckto_write vdd vss wr swr BL nBL in L=18n TFIN=10n LB=63n NFIN=1

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
.ends ckto_write

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