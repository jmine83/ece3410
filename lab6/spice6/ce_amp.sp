* Common Emitter Circuit
* SPICE 6
* ********************************
* By Chris Winstead
* Modified by Joel Meine
* ECE 3410, Utah State University
* ********************************

.include ../../lab_parts.md

* Parameters
.param RC=1k
* RE1 (Calculated = 50, Standard = 51)
.param RE1=50.8
* RE2 (Calculated = 918.9105058, Standard = 910)
.param RE2=940
* CB (Calculated = 3.46002u, Standard = 3.3u)
.param CB=3.3u
* CE (Calculated = 31.9981u, Standard = 33u)
.param CE=33u
* CC (Calculated = 1.92838u, Standard = 2.2u)
.param CC=2.2u

* Voltage input
VIN nin 0 DC 0 AC 1 SIN(0 .05 10k)

* Voltage sources
VCC ncc 0 DC 10
VEE nee 0 DC -10

* BJT connections: 
* Q# ncollector nbase nemitter Q2N2222
Q1 nc nb ne Q2N2222

* Resistor and Capacitor connections:
RF nb nc 9.83k
RL nout 0 9.86k
RC ncc nc 0.98k
CC nc nout CC
RE1 ne nx RE1
RE2 nx nee RE2
CE nx 0 CE
CB nin nb CB

* Control commands to simulate the
* DC transfer characteristic:
.control
op
print all

tran 50n 1m
meas tran vipp PP v(nin)
meas tran vopp PP v(nout)

let Gain = vopp/vipp
print Gain

plot v(nin) v(nout)
hardcopy TRANsim.ps v(nin) v(nout)

AC dec 10 10 100e6

plot vdb(nout)
hardcopy ACsim.ps vdb(nout)

.endc
.end
