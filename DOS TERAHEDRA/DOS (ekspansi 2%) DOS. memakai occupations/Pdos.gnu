set terminal pdfcairo enhanced color solid font ",25" size 6in,6in

set output "graphene.pdf"
input1 = "graphene1.pdos_tot"
input2 = "graphene1.pdos_atm#1(C)_wfc#1(s)"
input3 = "graphene1.pdos_atm#1(C)_wfc#2(p)"
input4 = "graphene1.pdos_atm#2(C)_wfc#1(s)"
input5 = "graphene1.pdos_atm#2(C)_wfc#2(p)"

efermi= -2.5645
Emax= 5.0
Emin=-5.0

set yrange[Emin:Emax]
set ytics 1 
set xzeroaxis

#set yzeroax
#unset key
#set xrange [-8:15]
#set format y "%.0f"

#set xlabel "{/Symbol e} (eV)"
set xlabel "DOS (states/eV)"

#set format y "%.1f"
set ylabel "{/Helvetica-Italic E}-{/Helvetica-Italic E}_F (eV)"
set style fill solid 1.0 noborder
#set style data filledcurves y1=0

plot input1 using 3:($1-efermi) with lines lc rgb "black" title "Pdos_total", input2 using 3:($1-efermi) with lines lc rgb "red" title "atm#1(C) 1(s)", input3 using 3:($1-efermi) with lines lc rgb "blue" title "atm#1(C) 2(p)", input4 using 3:($1-efermi) with lines lc rgb "brown" title "atm#2(C) 1(S)", input5 using 3:($1-efermi) with lines lc rgb "pink" title "atm#2(C) 2(p)"
