set terminal pdfcairo size 9cm,10cm font 'Helvetica,18'
set output "graphene-pdos.pdf"

input = "graphene.dos"

#energy
Emin   = -5.0000
Emax   =  5.0000
EFermi = -2.5645

set title "DoS of Graphene"
set yrange[Emin:Emax]
set xrange [0:4]
set xzeroaxis lt 1 dt 2 lw 1.5 lc rgb "red"

set xlabel "DOS (arb. unit)"
set ylabel "E-E_F (eV)"

plot input using 2:($1-EFermi) with filledcurve x=0 lc rgb "blue" notitle
