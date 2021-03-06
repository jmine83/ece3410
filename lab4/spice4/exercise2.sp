Lab 4, Exercise 2, ECE 3410
***************************
* By Chris Winstead
* Modified by Joel Meine
* Diode Half-Wave Rectifier circuit
***************************

* Include the model file:
.include ../lab_parts.md

* Voltage Inputs
Vin n1 0 DC 0V SIN(0 2V 1k)

* Diodes
D1 n1 nout D1N914

* Resistors
R1 nout 0 10k

**************
* ANALYSIS
**************
.control
tran 10us 2ms
plot v(nout)
hardcopy halfwave.ps v(nout)

meas TRAN vpeak MAX v(nout)

.endc

.end
