set terminal pdfcairo size 5cm,8cm font "Helvetico,7"
set output "dos.pdf"


Emax = 6
Emin = -6
input = "graphene.dos"
E_fermi = -2.3530 
set title "Density of states"
set yrange [Emin:Emax]
set ytics 1
set ylabel "{/Helvetico-Italic E}-{/Helvetico-Italic E}_F (eV)"
set xlabel "DOS (states/eV/u.c)"
set xzeroaxis
plot input using 2:($1-E_fermi) with filledcurve x=0 lc rgb "blue" notitle
