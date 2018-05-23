Lab 2, Exercise 2, ECE 3410
***************************
* By Chris Winstead
***************************

* Include the model file:
.include lab_parts.md

* Define a numerical constant for 
* estimating VOFS:
.csparam Ga=1001


* Power supplies:
VDD ndd 0 DC 15V
VSS nss 0 DC -15V

* The input voltage sources
Vin n1 0 DC 0V SIN(0 1 5.0)

* Resistors
R1 n1 ny   10k
R2 ny nout 10k
R3 ny nx   100k
R4 nx 0    100 

* Op Amp Model
X1 0 nx ndd nss nout uA741

* Control Commands:
.control

tran 10m 10s
plot v(n1) v(ny)

meas tran VY  PP v(ny) FROM=0 TO=10s
meas tran VIN PP v(n1) FROM=0 TO=10s
let A=VIN/VY*$&Ga
print A

.endc

.end
