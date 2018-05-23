* Control commands to simulate the 
* DC transfer characteristic:
.control
save all @M1[gm]

* Simulate with LAMBDA=0.01
DC Vin $&dcstart $&dcstop 0.01
meas DC IDS1 FIND i(Vm1) AT=2.4V
let G1=deriv(nd)
meas DC gain1 FIND G1 at=2.4v
meas DC gm1 FIND @M1[gm] at=2.4v
let rds1=1/(0.01*ids1)
print rds1

* Simulate with LAMBDA=0.05
altermod @ntype[lambda] = 0.05
DC Vin $&dcstart $&dcstop 0.01
meas DC IDS2 FIND i(Vm1) AT=2.4V
let rds2=1/(0.05*ids2)
meas DC gm2 FIND @M1[gm] at=2.4v
print rds2
let G2=deriv(nd)
meas DC gain2 FIND G2 AT=2.4V

* Simulate with LAMBDA=0.1
altermod @ntype[lambda] = 0.1
DC Vin $&dcstart $&dcstop 0.01
meas DC IDS3 FIND i(Vm1) AT=2.4V
meas DC gm3 FIND @M1[gm] at=2.4v
let rds3=1/(0.1*ids3)
print rds3
let G3=deriv(nd)
meas DC gain3 FIND G3 AT=2.4V


* Plot all results together:
plot dc1.nd dc2.nd dc3.nd


.endc
.end
