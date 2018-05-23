.include ../../lab_parts.md

* M2 parameters
.param VG2=8.3472563473
.param RD21=808
.param RD22=39.1
.param RS21=502
.param RS22=34.8
.param Rin=313

* Voltage input
Vin nin 0 DC 0V SIN(0 500mV 50k)

* Gate voltage sources and VDD:
VDD ndd 0 DC 10V
VG2 ng2 0 DC VG2

* MOSFET connections: M# ndrain ngate nsource nsubstrate CD4007N W=# L=#
M2 nd2 ng2 ns2 0 CD4007N W=30u L=10u

* Resistor and Capacitor connections:
Rin nin pin Rin
* M2 Components
RD21 ndd nrd2 RD21
RD22 nrd2 nd2 RD22
RS21 0 nrs2 RS21
RS22 nrs2 ns2 RS22
CS2 ns2 pin 1u

* Control commands to simulate the
* DC transfer characteristic:
.control
tran 50n 60u
meas tran pp0 PP v(nd2)

plot v(nin)
plot v(nd2)
.endc
.end
