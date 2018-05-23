Lab 2, Exercise 1, ECE 3410
***************************
* By Chris Winstead
***************************

* Include the model file:
.include lab_parts.md

* Power supplies:
VDD ndd 0 DC 15V
VSS nss 0 DC -15V

* The input voltage sources
V1 n1 0 DC 1V
V2 n2 0 DC 5V

* Resistors
R1 n1 nn 10k
R2 n2 nn 5k
RF nn nout 10k

* Op Amp Model
X1 0 nn ndd nss nout uA741

* Control Commands:
.control
op
print all

echo "Result for Part A:"
print v(nout)

alter V2 DC 0V

dc V1 1V 2V 0.05V
plot v(nout)

echo "Results for Part B:"

* Print out specific data points:
meas dc vo1 FIND v(nout) AT=1
meas dc vo2 FIND v(nout) AT==1.25
meas dc vo3 FIND v(nout) AT==1.5
meas dc vo4 FIND v(nout) AT==1.75
meas dc vo5 FIND v(nout) AT==2.0

let gain='(vo5 - vo1)/(2.0-1.0)'
echo The measured gain is $&gain

.endc

.end
