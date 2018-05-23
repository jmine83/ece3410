.include ../../lab_parts.md

* Voltage input
Vin nin 0 DC 0V SIN(0 500mV 50k)

* Gate voltage sources and VDD:
VDD ndd 0 DC 10V
VG nr 0 DC 8.0060060060

* MOSFET connections: M# ndrain ngate nsource nsubstrate CD4007N W=# L=#
M1 nd ng ns 0 CD4007N W=30u L=10u

* Resistor and Capacitor connections:
Cin nin ng 20u
RG ng nr 97.4k
RD ndd nd 2.01k
CD nd no1 1u
RLD no1 0 2k
RS ns 0 2.03k
CS ns no2 1u
RLS no2 0 1.99k

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
plot v(no1) v(no2)
plot 'v(no1)-v(no2)'
.endc
.end
