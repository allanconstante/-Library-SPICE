* Descriptions ===================================================
*
* Autor: Allan Appelt Constante
* Data:  29/08/2019
*
* ----------------------------------------------------------
* :        :--------Pinos--------:                         :
* : Nome   : Alim.   : in  : out : Parametrôs              :
* ----------------------------------------------------------
* : inv    : Vdd Vss : a   :  z  : L Tfin Hfin Lfin Nfin Nf:
* : and    : Vdd Vss : a b :  z  : L Tfin Hfin Lfin Nfin Nf:
* : or     : Vdd Vss : a b :  z  : L Tfin Hfin Lfin Nfin Nf:
* : xor    : Vdd Vss : a b :  z  : L Tfin Hfin Lfin Nfin Nf:
* : nand   : Vdd Vss : a b :  z  : L Tfin Hfin Lfin Nfin Nf:
* : nor    : Vdd Vss : a b :  z  : L Tfin Hfin Lfin Nfin Nf:
* : xnor   : Vdd Vss : a b :  z  : L Tfin Hfin Lfin Nfin Nf:
* ----------------------------------------------------------
*
* ================================================================

.subckt inv vdd vss a z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mip 	z 		a 		vdd 	vdd 	pfet
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

	min		z		a		vss		vss		nfet
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
.ends inv

.subckt nand vdd vss a b z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mndp1 	z 		a 		vdd 	vdd 	pfet
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

	mndp2	z		b 		vdd 	vdd 	pfet
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

	mndn1	z 		a 		no 		vss 	nfet
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

	mndn2	no		b		vss		vss		nfet
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
.ends nand

.subckt nor vdd vss a b z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mp1 	no 		a 		vdd 	vdd 	pfet
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

	mp2 	z 		b 		no  	vdd 	pfet
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

	mn1 	z 		a 		vss		vss 	nfet
		+	l=L
		+	nf = Nf
		+	nfin=Nfin
		+	hfin=Hfin
		+	tfin=Tfin
		+	asej='Tfin*LB'
		+	psej='2*Tfin+2*Lfin'
		+	adej='Tfin*Lfin'
		+	pdej='2*Tfin+2*Lfin'
	*===========================================

	mn2 	z		b 		vss 	vss 	nfet
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
.ends nor

.subckt xor vdd vss a b z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	x1 vdd vss a na 	inv 	L=L Tfin=Tfin Lfin=Lfin Nfin=Nfin
	x2 vdd vss b nb 	inv 	L=L Tfin=Tfin Lfin=Lfin Nfin=Nfin

	*Ins.	Drain	Gate	Source	Buck	Type

	mp1 	no1		nb 		vdd 	vdd 	pfet
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

	mp2 	z 		a 		no1 	vdd 	pfet
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

	mp3 	no2		b 		vdd 	vdd 	pfet
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

	mp4 	z 		na 		no2 	vdd 	pfet
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

	mn1 	z 		b 		no3		vss 	nfet
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

	mn2 	no3		a 		vss 	vss 	nfet
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

	mn3 	z 		nb 		no4		vss 	nfet
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

	mn4 	no4		na 		vss 	vss 	nfet
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
.ends xor

.subckt and vdd vss a b z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	x1 vdd vss a  b nz 	nand 	L=L Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
	x2 vdd vss nz z 	inv 	L=L Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
.ends and

.subckt or vdd vss a b z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	x1 vdd vss a  b nz 	nor 	L=L Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
	x2 vdd vss nz z 	inv 	L=L Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
.ends or

.subckt xnor vdd vss a b z L=18n Tfin=10n Hfin=23n Lfin=63n Nfin=1 Nf=1

	x1 vdd vss a  b nz 	xor 	L=L Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
	x2 vdd vss nz z 	inv 	L=L Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
.ends xnor
