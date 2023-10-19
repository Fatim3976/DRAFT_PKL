#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
#############

name='Graphene.ecut'

#############


for ecut in 40 50 60 70 80 90 100 110 120 ; do
  
cat > $name.$ecut.in << EOF
&CONTROL
calculation = 'scf',
prefix = 'graphene1',
restart_mode = 'from_scratch',
pseudo_dir = './Pseudo/',
outdir = './tmp/',
/
&SYSTEM
ibrav = 12,
a = 2.467,
b = 2.467,
c = 20,
cosab = -0.50,
nat = 2,
ntyp = 1,
ecutwfc = ${ecut}
/
&ELECTRONS
conv_thr = 1.0d-10,
mixing_beta = 0.5,
/
ATOMIC_SPECIES
C 12.0107 C.pbe-n-kjpaw_psl.1.0.0.UPF

ATOMIC_POSITIONS crystal
C 0.000000000 0.000000000 0.250000000
C 0.333333333 0.666666667 0.250000000

K_POINTS automatic
16 16 1 0 0 0
EOF

pw.x <$name.$ecut.in>$name.$ecut.out
awk '/\!/ {E=$5} $1=="PWSCF" {printf"%4d %s %s\n",'$ecut',E,$3}' $name.$ecut.out >> calc-ecut.dat

done


