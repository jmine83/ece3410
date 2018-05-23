Lab 4, Exercise 4, ECE 3410
***************************
* By Chris Winstead
* Limiter circuit
***************************

* Include the model file:
.include ../lab_parts.md

* Voltage Inputs
V1 n1 0 DC 0V SIN(0 3V 1k)

* Diode
D1 nout n2   D1N914
D2 n2   0    D1N914
D3 n3   nout D1N914
D4 0    n3   D1N914

* Resistor
R1 n1 nout 10k


**************
* ANALYSIS
**************
.control
tran 1u 5m
plot n(n1) v(nout)

* Measurements:
echo Results at 1kHz:
meas TRAN vpeak   MAX v(nout)
meas TRAN vtrough MIN v(nout)
meas TRAN vpp     PP  v(nout) FROM=3m TO=5m

.endc

.end
