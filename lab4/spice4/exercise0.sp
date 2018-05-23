* Test diode forward drop
.include ../lab_parts.md

V1 n1 0  DC 1V
D1 n1 n2 D1N914
R1 n2 0  10k

.control
DC V1 0 50 0.01

let vd=v(n1)-v(n2)
let id=-i(V1)
plot id vs vd

echo Forward drop at 1mA:
meas DC vd0 FIND vd WHEN id=1mA
.endc
.end
