Lab 2, Exercise 3, ECE 3410
***************************
* By Chris Winstead
* Modified by Joel Meine
***************************

* Include the model file:
.include lab_parts.md

*===== CIRCUIT DESCRIPTION ======
* Power supplies:
VDD ndd 0 DC 15V
VSS nss 0 DC -15V

* The input voltage sources
V1 n1 0 DC 1V
V2 n2 0 DC 0V AC 1 SIN(0V 0.5V 50kHz)

* Resistors
R1 n1 nn 10k
R2 n3 nn 5k
RF nn nout 10k
C1 n2 n4 10n
RX 0 n4 10k

* Op Amp Model
X1 0 nn ndd nss nout uA741
X2 n4 n3 ndd nss n3 uA741

*================================
* CONTROL COMMANDS:
*================================
.control

*----- START OF LOOP ----*
foreach rff 10k 20k 40k

* Alter RF:
alter RF $rff
* ^^^Quirk: make sure to put spaces around
* the brackets in the alter statement

*----- AC SIMULATION -----*

ac dec 10 100 1e6

plot vdb(nout)-vdb(n2)

meas ac Av0  FIND vdb(nout) AT=10k
let A3dB=Av0-3
print A3dB

meas ac fhigh WHEN vdb(nout)=$&A3dB FALL=LAST
meas ac flow  WHEN vdb(nout)=$&A3dB RISE=1
meas ac ft    WHEN vdb(nout)=0

end
*----- END OF LOOP ----*
.endc

.end
