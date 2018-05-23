Lab 4, Exercise 3, ECE 3410
***************************
* By Chris Winstead
* Peak rectifier circuit
***************************

* Include the model file:
.include ../lab_parts.md

* Voltage Inputs
V1 n1 0 DC 0V SIN(0 2V 1k)

* Diode
D1 n1 nout D1N914

* Load resistor
R1 nout 0 10k
C1 nout 0 10nF

**************
* ANALYSIS
**************
.control
tran 1u 5m
plot v(n1) v(nout)
echo Results at 1kHz:
meas TRAN vpeak MAX v(nout)
meas TRAN vpp PP v(nout) FROM=3m TO=5m

alter @V1[sin] = [ 0 2V 10k ]
tran .1u .5m
plot v(n1) v(nout)
echo Results at 10kHz:
meas TRAN vpeak MAX v(nout)
meas TRAN vpp PP v(nout) FROM=.3m TO=.5m

alter @V1[sin] = [ 0 2V 100k ]
tran .01u .05m
plot v(n1) v(nout)
echo Results at 100kHz:
meas TRAN vpeak MAX v(nout)
meas TRAN vpp PP v(nout) FROM=.03m TO=.05m

.endc

.end
