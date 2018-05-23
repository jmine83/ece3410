* Balun Circuit
* SPICE 5b
* ********************************
* By Chris Winstead
* Modified by Joel Meine
* ECE 3410, Utah State University
* ********************************

.include ../../lab_parts.md

* M1 parameters
.param VG1=8.0060060060
.param RD1=2k
.param RS1=2k

* M2 parameters
.param VG2=8.3472563473
.param RD2=860.2150537634
.param RS2=545.4545454545

* Voltage input
Vin nin 0 DC 0V SIN(0 500mV 50k)

* Gate voltage sources and VDD:
VDD ndd 0 DC 10V
VG1 nr1 0 DC VG1
VG2 ng2 0 DC VG2

* MOSFET connections: 
* M# ndrain ngate nsource nsubstrate CD4007N W=# L=#
M1 nd1 ng1 ns1 0 CD4007N W=30u L=10u
M2 nd2 ng2 ns2 0 CD4007N W=30u L=10u

* Resistor and Capacitor connections:
R1 nr1 ng1 100k
Rin nin pin 300
* M1 Components
RD1 ndd nd1 RD1
RL1 no1 0 2k
CD1 nd1 no1 1u
RS1 ns1 0 RS1
RL2 no2 0 2k
CS1 ns1 no2 1u
* M2 Components
RD2 ndd nd2 RD2
CD2 nd2 ng1 20u
RS2 ns2 0 RS2
CS2 ns2 pin 1u

* Control commands to simulate the
* DC transfer characteristic:
.control
tran 50n 60u
meas tran pp1 PP v(no1)
meas tran pp2 PP v(no2)
meas tran ppin PP v(nin)

meas tran cross1 WHEN v(no1)=0 CROSS=1
meas tran cross2 WHEN v(no2)=0 CROSS=2

echo "Measuring the Amplitude Imbalance (in dBm):"
let dA = 20*log10(abs(pp1-pp2)/(ppin*0.001))
print dA

echo "Measuring the Phase Imbalance (in radians):"
let dPhi = 2*PI*50e3*(cross1-cross2)
print dPhi

plot v(nin)
hardcopy nin.ps v(nin)
plot v(no1) v(no2)
hardcopy no1_no2.ps v(no1) v(no2)
plot 'v(no1)-v(no2)'
hardcopy no1-no2.ps 'v(no1)-v(no2)'
.endc
.end
