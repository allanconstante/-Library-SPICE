
.lib ptm_hp_FinFET_14nm

    .param Vdd=0.8
    .param Hfin=2.3e-008
    .param Tfin=1e-008
    .param Lg=1.8e-008
    .param Lfin=6.3e-008
    
    .include 'modelfiles/hp/14nfet.pm'
    .include 'modelfiles/hp/14pfet.pm'
    
    .include 'logic_gates.sp'
    .include 'sram.sp'

.endl ptm_hp_FinFET_14nm