Lab 2, Exercise 3, ECE 3410
***************************
* By Chris Winstead
***************************

* Include the model file:
.include lab_parts.md
.param f=50k
.csparam f=f
.csparam T=2/f

* Power supplies:
VDD ndd 0 DC 15V
VSS nss 0 DC -15V

* The input voltage sources
Vin n1 0 DC 0V SIN(0 2 f)

* Op Amp Model
X1 n1 nout ndd nss nout uA741

* Control Commands:
.control

tran 10n 1m
linearize
wrdata slewing v(nout)

fourier $&f v(nout)

plot xlimit 0 $&T v(n1) v(nout)

fft v(nout)
plot xlog xlimit 1000 10e6 vdb(nout)
wrdata fft vdb(nout)

.endc

.end
