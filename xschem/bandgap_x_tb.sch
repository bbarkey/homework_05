v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -400 0 -400 40 {lab=VDD}
N -400 100 -400 130 {lab=0}
N 170 90 170 110 {lab=0}
N 140 -10 170 -10 {lab=Vref}
N 170 -10 170 30 {lab=Vref}
C {bandgap_x.sym} -10 -10 0 0 {name=x1}
C {vdd.sym} -400 0 0 0 {name=l1 lab=VDD}
C {vsource.sym} -400 70 0 0 {name=Vdd value=3.3 savecurrent=false}
C {gnd.sym} -400 130 0 0 {name=l2 lab=0}
C {capa.sym} 170 60 0 0 {name=C1
m=1
value=100n
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 170 110 0 0 {name=l3 lab=0}
C {lab_wire.sym} 170 -10 0 0 {name=p1 sig_type=std_logic lab=Vref}
C {code_shown.sym} -350 -30 0 0 {name=NGSPICE only_toplevel=false 
value=".optionw nflag=1
.save all
.control
tran 10n 10u
plot V(Vref) title 'Vref vs time'
dc VDD 3.0 3.5 0.1
plot V(Vref) vs V(VDD) title 'Vref vs Vdd'
dc VDD 3.0 3.5 0.1 TEMP -40 40 10
plot V(Vref) vs V(VDD) title 'Vref vs Vdd vs Temp'
dc TEMP -40 40 10
plot V(Vref) title 'Vref vs Temp at VDD=3.3'
.endc"}
C {code.sym} -560 30 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
