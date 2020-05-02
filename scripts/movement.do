vsim -t ps movement_full -gINIT="000000100" -gWIDTH=9

add wave *

force ext_change 0 0, 1 500, 0 600, 1 1000, 0 1200

force enable 0 0, 1 20 -repeat 40

force clock 0 0, 1 10 -repeat 20

force reset 0 0, 1 15, 0 50, 1 300, 0 400, 1 800, 0 950

run 2000
