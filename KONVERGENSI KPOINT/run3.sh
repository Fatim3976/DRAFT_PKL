#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
#############

name='Graphene.ecut'

#############
for s in 0 ; do
for m in 1 ; do
for n in 6 8 10 12 14 16 18 20 22; do

cat > $name.$s.$n.in << EOF
&CONTROL
calculation = 'scf',
prefix = 'graphene4',
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
conv_thr = 1.0d-8,
mixing_beta = 0.5,
/
ATOMIC_SPECIES
C 12.0107 C.pbe-n-kjpaw_psl.1.0.0.UPF

ATOMIC_POSITIONS crystal
C 0.000000000 0.000000000 0.250000000
C 0.333333333 0.666666667 0.250000000

K_POINTS automatic
${n} ${n} ${m} ${s} ${s} ${s}
EOF

pw.x <$name.$s.$n.in>$name.$s.$n.out

awk '/\!/ {E=$5} $1=="PWSCF" {printf"%3d%3d %s %s\n",'$n','$s',E,$3}' $name.$s.$n.out >> calc-mp.dat

done
done
done
done
