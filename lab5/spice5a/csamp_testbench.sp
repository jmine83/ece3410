* NMOS Common-Source Amplifier
*****************************
* By Chris Winstead
* ECE 3410, Utah State Univ.
*****************************
.param VINoffset=2.4V
.param VINamplitude=10mV

* Idealized MOSFET models:
.model ntype NMOS(KP=500e-6,VTo=2,LAMBDA=0.005) 
.model ptype PMOS(KP=100e-6,VTo=-2,LAMBDA=0.005) 

* Gate voltage source and VDD:
Vin ng  0 DC VINoffset SIN('VINoffset' 'VINamplitude' 1kHz)
VDD ndd 0 DC 5V
 
* MOSFET connection:
M1 nd ng 0 0 ntype W=1u L=1u

* Resistor connections:
R1 ndd nda 100k

* Vsource to use as a current meter:
Vm1 nda nd DC 0V

* Control commands to simulate the 
* DC transfer characteristic:
.control
save all @M1[gm]

* Simulate with LAMBDA=0.01
altermod @ntype[lambda] = 0.01
tran 10us 5ms
meas tran vopp1 PP v(nd)

* Simulate with LAMBDA=0.05
altermod @ntype[lambda] = 0.05
tran 10us 5ms
meas tran vopp2 PP v(nd)

* Simulate with LAMBDA=0.1
altermod @ntype[lambda] = 0.1
tran 10us 5ms
meas tran vopp3 PP v(nd)

echo INPUT Peak-to-Peak amplitude:
meas tran vipp PP v(ng)

echo OUTPUT Peak-to-Peak amplitudes:
print tran1.vopp1 tran2.vopp2 tran3.vopp3

echo GAIN magnitudes:
print tran1.vopp1/vipp tran2.vopp2/vipp tran3.vopp3/vipp

* Plot all results together:
plot tran1.nd tran2.nd tran3.nd
hardcopy csamp.ps tran1.nd tran2.nd tran3.nd

.endc
.end
