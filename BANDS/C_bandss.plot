set terminal pdfcairo font 'Helvetico'
set output 'bands.pdf'

input= 'graphene.bands.gnu'
E_fermi = -2.3530

Emax = 6
Emin = -6

#k-path
G1 = 0.0000 
K = 0.6667
M  = 1.0000
G2 = 1.5773

set yrange [Emin:Emax]
set ytics
set xtics ("{/Symbol G}" G1, "K" K, "M" M, "{/Symbol G}" G2)
set ylabel "{/Helvetica-Italic E}-{/Helvetica-Italic E}_F(eV)"

set arrow from K, Emin to K,Emax nohead
set arrow from M,Emin to M,Emax nohead
plot input using 1:($2-E_fermi) with lines lc rgb"black" notitle
