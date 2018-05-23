* MOSFET I/V Sweeps
* SPICE 5a, Exercise 1
* ****************************
* By Chris Winstead
* Modified by Joel Meine
* ECE 3410, Utah State Univ.
* ****************************

* Idealized MOSFET models:
.model ntype NMOS(KP=100e-6,VTo=2,LAMBDA=0.005)
.model ptype PMOS(KP=100e-6,VTo=-2,LAMBDA=0.005)

* Gate voltage source and VDD:
VDD ndd 0 DC 5V
VGS1 ng1 0 DC 2.5V
VDS1 nd1 0 DC 2.5V

* Dependent voltage sources:
EDS2 ndd nd2 nd1 0 1
EGS2 ndd ng2 ng1 0 1

* MOSFET connections: MX Drain Gate Source Substrate ModelName
M1 nd1 ng1 0 0 ntype W=1u L=1u
M2 nd2 ng2 ndd ndd ptype W=1u L=1u

* Control commands to simulate the
* DC transfer characteristic:
.control
DC VDS1 0 5 0.1 VGS1 0 3 0.5

* Plot NMOS I/V curves:
plot -i(VDS1)
hardcopy IVsweep_VDS1.ps -i(VDS1)

* Plot PMOS I/V curves:
plot -i(EDS2)
hardcopy IVsweep_EDS2.ps -i(EDS2)

.endc
.end
