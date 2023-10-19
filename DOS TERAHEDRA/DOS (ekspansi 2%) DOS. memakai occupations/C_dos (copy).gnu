set terminal pdfcairo size 4cm,4cm font "Helvetico,4"
set output "dos.pdf"
input1 = "graphene1.pdos_tot"
input2 = "graphene1.pdos_atm#1(C)_wfc#1(s)"
input3 = "graphene1.pdos_atm#1(C)_wfc#2(p)"
input4 = "graphene1.pdos_atm#2(C)_wfc#1(s)"
input5 = "graphene1.pdos_atm#2(C)_wfc#2(p)"

Emin = -5.0000
Emax = 5.0000
input = "graphene.dos"
E_fermi = -2.5645

set title "Density of states"
set yrange [Emin:Emax]
set ytics 1
set xrange [0:3]
set ylabel "{/Helvetico-Italic E}-{/Helvetico-Italic E}_F (eV)"
set xlabel "DOS (states/eV/u.c)"
set xzeroaxis
plot input1 using 3:($1-E_fermi) with filledcurve x=0 lc rgb "blue" title "Pdos_total", input2 using1 3:($1-E_fermi) with filledcurve x=0 lc rgb "blue" title "atm1(s)", input3 using 3:($1-E_fermi) with filledcurve x=0 lc rgb "blue" title "atm 1(p)", input4 using 3:($1-E_fermi) with filledcurve x=0 lc rgb "blue" title "atm(s)", input5 using1 3:($1-E_fermi) with filledcurve x=0 lc rgb "blue" title "atm(s)"
