Lab 3, Exercise 1, ECE 3410
***************************
* By Chris Winstead
* Measure offset voltage
***************************

* Include the model file:
.include lab_parts.md

* Define a numerical constant for 
* estimating VOFS:
.csparam Go=2102

* Power supplies:
VDD ndd 0 DC 15V
VSS nss 0 DC -15V

* The input voltage sources
Vofs n1 0 DC 5mV 

* Resistors
R1 0 ny   10k
R2 ny nout 10k
R3 ny nx   100k
R4 nx 0    100 

* Op Amp Model
X1 n1 nx ndd nss nout uA741

* Control Commands:
.control
dc Vofs 0 10m 100u

plot v(nout) $&Go*v(n1)

.endc

.end
