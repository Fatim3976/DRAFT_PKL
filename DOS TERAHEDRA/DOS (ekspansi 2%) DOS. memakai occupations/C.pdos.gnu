#set terminal pdfcairo enhanced color solid font "Arial,10" size 10in,6in
set terminal pdfcairo enhanced color solid font ",12" size 10in,6in
set output "C_pdos.pdf"

efermi= -2.5645
input2 = "graphene1.pdos_atm#1(C)_wfc#1(s)"
input3 = "graphene1.pdos_atm#1(C)_wfc#2(p)"
input4 = "graphene1.pdos_atm#2(C)_wfc#1(s)"
input5 = "graphene1.pdos_atm#2(C)_wfc#2(p)"

set yzeroaxis
unset key
set xrange [-5:5]
#set format y "%.0f"
set xlabel "{/Symbol e} (eV)"
set ylabel "PDOS"
set format y "%.1f"

set style fill solid 1.0 noborder
set style data filledcurves y1=0

plot input2 using ($1-efermi):3 with lines lc rgb "red" title "C 1(s)", input2 using ($1-efermi):3 with lines lc rgb "black" title "C 2(p)", input3 using ($1-efermi):3 with lines lc rgb "pink" title "c 1(s)", input4 using ($1-efermi):3  with lines lc rgb "blue" title "c 2(p)"


