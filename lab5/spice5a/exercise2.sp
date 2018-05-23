* CLM in an NMOS RTL Inverter
* SPICE 5a, Exercise 2
* ****************************
* By Chris Winstead
* Modified by Joel Meine
* ECE 3410, Utah State Univ.
* ****************************

.csparam dcstart=2
.csparam dcstop=2.47

* Idealized MOSFET models:
.model ntype NMOS(KP=500e-6,VTo=2,LAMBDA=0.005)
.model ptype PMOS(KP=500e-6,VTo=-2,LAMBDA=0.005)

* Gate voltage source and VDD:
Vin ng 0 DC 1V
VDD ndd 0 DC 5V
Vm0 nda nd DC 0V

* MOSFET connections:
M1 nd ng 0 0 ntype W=1u L=1u

* Resistor connections:
R1 ndd nda 100k

* Control commands to simulate the 
* DC transfer characteristic:
.control
save all @M1[gm]

* Simulate with LAMBDA=0.01
altermod @ntype[lambda] = 0.01
DC Vin $&dcstart $&dcstop 0.01
meas DC IDS1 FIND i(Vm0) AT=2.4V
let G1=deriv(nd)
meas DC gain1 FIND G1 at=2.4v
meas DC gm1 FIND @M1[gm] at=2.4v
let rds1=1/(0.01*ids1)
print rds1

* Simulate with LAMBDA=0.05
altermod @ntype[lambda] = 0.05
DC Vin $&dcstart $&dcstop 0.01
meas DC IDS2 FIND i(Vm0) AT=2.4V
let G2=deriv(nd)
meas DC gain2 FIND G2 AT=2.4V
meas DC gm2 FIND @M1[gm] at=2.4v
let rds2=1/(0.05*ids2)
print rds2

* Simulate with LAMBDA=0.1
altermod @ntype[lambda] = 0.1
DC Vin $&dcstart $&dcstop 0.01
meas DC IDS3 FIND i(Vm0) AT=2.4V
let G3=deriv(nd)
meas DC gain3 FIND G3 AT=2.4V
meas DC gm3 FIND @M1[gm] at=2.4v
let rds3=1/(0.1*ids3)
print rds3

* Plot all results together:
plot dc1.nd dc2.nd dc3.nd
hardcopy inverter.ps dc1.nd dc2.nd dc3.nd

.endc
.end
