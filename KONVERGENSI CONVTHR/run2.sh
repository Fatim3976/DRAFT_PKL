#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
#############

name='Gan.Convthr'

#############


for conv in 1.0d-4 1.0d-5 1.0d-6 1.0d-7 1.0d-8 1.0d-9 1.0d-10 1.0d-11 1.0d-12 ; do
  
cat > $name.$conv.in << EOF
&CONTROL
calculation = 'scf',
prefix = 'graphene2',
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
ecutwfc = 100,
/
&ELECTRONS
conv_thr = ${conv},
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

pw.x <$name.$conv.in>$name.$conv.out
awk '/\!/ {E=$5} $1=="PWSCF" {printf"%4d %s %s\n",'$conv',E,$3}' $name.$conv.out >> calc-ecut.dat

done


