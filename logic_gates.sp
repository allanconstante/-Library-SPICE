* Descriptions =========================================================================================
* 
* Autor: Allan Appelt Constante
* Data:  29/08/2019
*
* ----------------------------------------------------------
* :        :--------Pinos--------:                         :
* : Nome   : Alim.   : in  : out : Parâmetros              :
* ----------------------------------------------------------
* : inv    : Vdd Vss : a   :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* : and    : Vdd Vss : a b :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* : or     : Vdd Vss : a b :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* : xor    : Vdd Vss : a b :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* : nand   : Vdd Vss : a b :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* : nor    : Vdd Vss : a b :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* : xnor   : Vdd Vss : a b :  z  : Lg Tfin Hfin Lfin Nfin Nf:
* ----------------------------------------------------------
*
* - Lg:   Comprinento do gate; 
* - Tfin: Largura do fin;
* - Hfin: Altura do fin;
* - Lfin: Comprinento do fin;
* - Nfin: Quantidade de fins;
* - Nf:   Quantidade de fingers (gates);
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

.subckt inv vdd vss a z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mip 	z 		a 		vdd 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	min		z		a		vss		vss		nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends inv

.subckt nand vdd vss a b z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mndp1 	z 		a 		vdd 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mndp2	z		b 		vdd 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mndn1	z 		a 		no 		vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mndn2	no		b		vss		vss		nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends nand

.subckt nor vdd vss a b z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	*Ins.	Drain	Gate	Source	Buck	Type

	mp1 	no 		a 		vdd 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mp2 	z 		b 		no  	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mn1 	z 		a 		vss		vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mn2 	z		b 		vss 	vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends nor

.subckt xor vdd vss a b z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	x1 vdd vss a na 	inv 	Lg=Lg Tfin=Tfin Lfin=Lfin Nfin=Nfin
	x2 vdd vss b nb 	inv 	Lg=Lg Tfin=Tfin Lfin=Lfin Nfin=Nfin

	*Ins.	Drain	Gate	Source	Buck	Type

	mp1 	no1		nb 		vdd 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mp2 	z 		a 		no1 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mp3 	no2		b 		vdd 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mp4 	z 		na 		no2 	vdd 	pfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mn1 	z 		b 		no3		vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mn2 	no3		a 		vss 	vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mn3 	z 		nb 		no4		vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================

	mn4 	no4		na 		vss 	vss 	nfet
		+	l    = Lg
		+	nf   = Nf
		+	nfin = Nfin
		+	hfin = Hfin
		+	tfin = Tfin
		+	asej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	psej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
		+	adej = '(Tfin*Lfin)*(Nfin*Nf)'
		+	pdej = '(2*Tfin+2*Lfin)*(Nfin*Nf)'
	*===========================================
.ends xor

.subckt and vdd vss a b z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	x1 vdd vss a  b nz 	nand 	Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
	x2 vdd vss nz z 	inv 	Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
.ends and

.subckt or vdd vss a b z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	x1 vdd vss a  b nz 	nor 	Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
	x2 vdd vss nz z 	inv 	Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
.ends or

.subckt xnor vdd vss a b z Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=1 Nf=1

	x1 vdd vss a  b nz 	xor 	Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
	x2 vdd vss nz z 	inv 	Lg=Lg Tfin=Tfin Hfin=Hfin Lfin=Lfin Nfin=Nfin Nf=Nf
.ends xnor
