Lab 4, Exercise 1(A), ECE 3410
***************************
* By Chris Winstead
* Diode MAX circuit
***************************

* Include the model file:
.include ../lab_parts.md

* Voltage Inputs
V1 n1 0 DC 3V
V2 n2 0 DC 2V

* Diodes
D1 n1 nout D1N914
D2 n2 nout D1N914

* Load resistor
R1 nout 0 10k

**************
* ANALYSIS
**************
.control
op
print v(n1) v(n2) v(nout)

alter V2 DC 2.8V
op
print v(n1) v(n2) v(nout)

alter V2 DC 3.2V
op
print v(n1) v(n2) v(nout)

alter V2 DC 4V
op
print v(n1) v(n2) v(nout)

DC V2 0 6 0.1
plot v(nout) v(n1) v(n2)
plot 'v(nout)-v(n2)'

let vd=v(nout)-v(n2)
meas DC vdmin MIN vd
.endc

.end
