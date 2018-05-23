Lab 4, Supplemental Exercise, ECE 3410
*******************************
* By Chris Winstead
* Modified by Joel Meine
* "Super-Diode"
* precision rectifier circuit
*******************************

* Include the model file:
.include ../lab_parts.md

* Generic diode model:
*.model diode d(Is=2.0298e-15, n=1)

VIN nin  0 SIN(0 4 10k)
VDD nvdd 0 DC 10V
VSS nvss 0 DC -10V

* 741 instance
* Pin order: v+ v- VR+ VR- vo
X1 nin nout nvdd nvss nx uA741

D1 nx nout D1N914
RL nout 0 1k

.control
tran 1u 500u
plot v(nin) v(nx) 
plot v(nin) v(nout)
plot v(nout)
hardcopy sd1.ps v(nin) v(nx) 
hardcopy sd2.ps v(nin) v(nout)
hardcopy sd3.ps v(nout)
.endc
.end



