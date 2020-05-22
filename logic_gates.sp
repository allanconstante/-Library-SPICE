* Descriptions ===================================================
*
* Autor: Allan Appelt Constante
* Data:  29/08/2019
*
* -------------------------------------------------
* :        :--------Pinos--------:                :
* : Nome   : Alim.   : in  : out : Parametrôs     :
* -------------------------------------------------
* : inv    : Vdd Vss : a   :  z  : L TFIN LB NFIN :
* : and    : Vdd Vss : a b :  z  : L TFIN LB NFIN :
* : or     : Vdd Vss : a b :  z  : L TFIN LB NFIN :
* : xor    : Vdd Vss : a b :  z  : L TFIN LB NFIN :
* : nand   : Vdd Vss : a b :  z  : L TFIN LB NFIN :
* : nor    : Vdd Vss : a b :  z  : L TFIN LB NFIN :
* : xnor   : Vdd Vss : a b :  z  : L TFIN LB NFIN :
* -------------------------------------------------
*
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
