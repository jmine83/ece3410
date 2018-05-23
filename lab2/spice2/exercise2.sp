Lab 2, Exercise 2, ECE 3410
***************************
* By Chris Winstead
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
R2 n3 nn 10k
RF nn nout 10k
C1 n2 n3 10n

* Op Amp Model
X1 0 nn ndd nss nout uA741

*================================
* CONTROL COMMANDS:
*================================
.control

* Declare some variables to store results in:
let ofs_1=unitvec(6)
let ofs_2=unitvec(6)
let ofs_out=unitvec(6)
let idx=0

* Automate a batch of simulations:

*----- START OF LOOP ----*
foreach vo1 1 2
foreach vo2 0.5 1.0 1.5

* Alter V1 and V2:
alter V1 DC $vo1
alter @V2[sin] = [ $vo2 0.5 50k ]
* ^^^Quirk: make sure to put spaces around
* the brackets in the alter statement

* Do a transient simulation
tran 1u 100u
plot v(n2) v(nout)

* Measure the output offset:
meas tran ofs1 AVG v(nout)

* Record results from this simulation:
let ofs_1[idx]=$vo1
let ofs_2[idx]=$vo2
let ofs_out[idx]=ofs1

* Increment the loop index:
let idx=idx+1
end
end
*----- END OF LOOP ----*

*----- AC SIMULATION -----*
ac dec 100 1 1e6

plot vdb(nout)-vdb(n2)

meas ac Av0  FIND vdb(nout) AT=10k
let A3dB=Av0-3
print A3dB

meas ac fhigh WHEN vdb(nout)=$&A3dB FALL=LAST
meas ac flow  WHEN vdb(nout)=$&A3dB RISE=1
meas ac ft    WHEN vdb(nout)=0

* Print out the reults:
print ofs_1 ofs_2 ofs_out

.endc

.end
