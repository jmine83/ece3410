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
