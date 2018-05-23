VCC = 10; VEE = -10; IE = 10e-3;
RF = 10e3; RL=10e3; Av = -20;
fmin = 100; beta = 256; VA = 74.03;
RE1 = 50; VT = 0.0258519; vBE = 0.7;
pi = 3.14159265359;
syms RC
eqn01 = -RC/RE1 == Av;
solRC = solve(eqn01,RC)
syms alpha
eqn02 = beta/(beta+1) == alpha;
solalpha = solve(eqn02,alpha)
syms gm
eqn03 = (solalpha*IE)/VT == gm;
solgm = solve(eqn03,gm)
syms ro
eqn04 = VA/(solalpha*IE) == ro;
solro = solve(eqn04,ro)
syms rpi
eqn05 = beta/solgm == rpi;
solrpi = solve(eqn05,rpi)
syms Rcoll
eqn06 = RE1+solro+solgm*solro*RE1 == Rcoll;
solRcoll = solve(eqn06,Rcoll)
syms Rbase
eqn07 = solrpi+(beta+1)*RE1 == Rbase;
solRbase = solve(eqn07,Rbase)
syms RinF
eqn08 = RF/(1+abs(Av)) == RinF;
solRinF = solve(eqn08,RinF)
syms RoutF
eqn09 = RF/(1+(1/abs(Av))) == RoutF;
solRoutF = solve(eqn09,RoutF)
syms RBtot
eqn10 = (1/solRbase)+(1/solRinF) == 1/RBtot;
solRBtot = solve(eqn10,RBtot)
syms CB
eqn11 = 1/(2*pi*fmin*solRBtot) == CB;
solCB = solve(eqn11,CB)
syms RCtot
eqn12 = (1/solRC)+(1/RL)+(1/solRcoll)+(1/solRoutF) == 1/RCtot;
solRCtot = solve(eqn12,RCtot)
syms CC
eqn13 = 1/(2*pi*fmin*solRCtot) == CC;
solCC = solve(eqn13,CC)
syms IC
eqn14 = solalpha*IE == IC;
solIC = solve(eqn14,IC)
syms IB
eqn15 = solIC/beta == IB;
solIB = solve(eqn15,IB)
syms VC
eqn16 = (solIC+solIB)*solRC == VC;
solVC = solve(eqn16,VC)
syms VB
eqn17 = solIB*RF == VB;
solVB = solve(eqn17,VB)
syms VE
eqn18 = solVB-VE == vBE;
solVE = solve(eqn18,VE)
syms RE2
eqn19 = IE*(RE1+RE2) == solVE-VEE;
solRE2 = solve(eqn19,RE2)
syms REtot
eqn20 = (1/(RE1+(solalpha/solgm)))+(1/solRE2) == 1/REtot;
solREtot = solve(eqn20,REtot)
syms CE
eqn21 = 1/(2*pi*fmin*solREtot) == CE;
solCE = solve(eqn21,CE)
syms Av1
eqn22 = (-solgm*solRCtot)/(1+solgm*RE1) == Av1;
solAv1 = solve(eqn22,Av1)
syms Av2
eqn23 = 20*log(solAv1) == Av2;
solAv2 = solve(eqn23,Av2)
double(solRC)
double(solalpha)
double(solgm)
double(solro)
double(solrpi)
double(solRcoll)
double(solRbase)
double(solRinF)
double(solRoutF)
double(solRBtot)
double(solCB)
double(solRCtot)
double(solCC)
double(solIC)
double(solIB)
double(solVC)
double(solVB)
double(solVE)
double(solRE2)
double(solREtot)
double(solCE)
double(solAv1)
double(solAv2)
solRC < solRcoll
solRC < solRoutF
solVC-solVE > 0.3
