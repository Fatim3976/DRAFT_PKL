set terminal pdfcairo size 4cm,4cm font "Helvetico,4"
set output "dos.pdf"


Emax = 5.0000
Emin = -5.0000
input = "graphene.dos"
E_fermi = -2.1222
set title "Density of states"
set yrange [Emin:Emax]
set xrange [0:3]
set ytics 1
set ylabel "{/Helvetico-Italic E}-{/Helvetico-Italic E}_F (eV)"
set xlabel "DOS (states/eV/u.c)"
set xzeroaxis
plot input using 2:($1-E_fermi) with filledcurve x=0 lc rgb "blue" notitle
