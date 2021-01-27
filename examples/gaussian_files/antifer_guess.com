%nprocshared=16
%mem=50000MB
%chk=antiferro.chk
# upbe1pbe/gen guess=(only,fragment=3) geom=connectivity pop=minimal pseudo=read

JAVYEK

0 1 -8 1 4 4 4 -4
 Mn(Fragment=2)    -1.35726700    0.00000200    0.00000000
 Mn(Fragment=3)     1.35726700   -0.00000200    0.00000000
 O(Fragment=1)      0.00000200    1.19323400    0.00000000
 O(Fragment=1)     -2.68332800   -1.37218400   -0.30097900
 O(Fragment=1)     -3.90342500   -2.39661000   -1.89590400
 O(Fragment=1)     -0.00000200   -1.19323400    0.00000000
 O(Fragment=1)     -2.68332500    1.37219100    0.30097800
 O(Fragment=1)      2.68332500   -1.37219100    0.30097800
 O(Fragment=1)      2.68332800    1.37218400   -0.30097900
 O(Fragment=1)     -3.90340500    2.39663300    1.89590500
 O(Fragment=1)      3.90340500   -2.39663300    1.89590500
 O(Fragment=1)      3.90342500    2.39661000   -1.89590400
 N(Fragment=1)     -1.64657100    0.29144100   -1.96304300
 N(Fragment=1)     -1.64657200   -0.29143500    1.96304200
 N(Fragment=1)      1.64657200    0.29143500    1.96304200
 N(Fragment=1)      1.64657100   -0.29144100   -1.96304300
 C(Fragment=1)     -1.12506800    1.28624100   -2.68532600
 C(Fragment=1)     -1.48383700    1.45287900   -4.01627400
 C(Fragment=1)     -2.39978600    0.57081500   -4.58795400
 C(Fragment=1)     -2.94731600   -0.44414800   -3.81136500
 C(Fragment=1)     -2.55149500   -0.54398300   -2.48668300
 C(Fragment=1)     -3.12053000   -1.55085200   -1.51390300
 C(Fragment=1)     -1.12507000   -1.28623500    2.68532700
 C(Fragment=1)     -2.55149100    0.54399400    2.48668300
 C(Fragment=1)     -3.12053000    1.55085800    1.51390000
 C(Fragment=1)      1.12507000    1.28623500    2.68532700
 C(Fragment=1)      2.55149100   -0.54399400    2.48668300
 C(Fragment=1)      1.12506800   -1.28624100   -2.68532600
 C(Fragment=1)      2.55149500    0.54398300   -2.48668300
 C(Fragment=1)      3.12053000   -1.55085800    1.51390000
 C(Fragment=1)      3.12053000    1.55085200   -1.51390300
 C(Fragment=1)     -1.48383600   -1.45286900    4.01627600
 C(Fragment=1)     -2.94731000    0.44416300    3.81136500
 C(Fragment=1)      1.48383600    1.45286900    4.01627600
 C(Fragment=1)      2.94731000   -0.44416300    3.81136500
 C(Fragment=1)      1.48383700   -1.45287900   -4.01627400
 C(Fragment=1)      2.94731600    0.44414800   -3.81136500
 C(Fragment=1)     -2.39978100   -0.57080000    4.58795600
 C(Fragment=1)      2.39978100    0.57080000    4.58795600
 C(Fragment=1)      2.39978600   -0.57081500   -4.58795400
 H(Fragment=1)     -0.42715600    1.93014600   -2.15915900
 H(Fragment=1)     -1.05357100    2.26820900   -4.58726700
 H(Fragment=1)     -2.69315600    0.68611800   -5.62732200
 H(Fragment=1)     -3.68070700   -1.15306500   -4.18018400
 H(Fragment=1)     -0.42716100   -1.93014300    2.15916000
 H(Fragment=1)      0.42716100    1.93014300    2.15916000
 H(Fragment=1)      0.42715600   -1.93014600   -2.15915900
 H(Fragment=1)     -1.05357200   -2.26819800    4.58727000
 H(Fragment=1)     -3.68069900    1.15308200    4.18018500
 H(Fragment=1)      1.05357200    2.26819800    4.58727000
 H(Fragment=1)      3.68069900   -1.15308200    4.18018500
 H(Fragment=1)      1.05357100   -2.26820900   -4.58726700
 H(Fragment=1)      3.68070700    1.15306500   -4.18018400
 H(Fragment=1)     -2.69315000   -0.68610000    5.62732500
 H(Fragment=1)      2.69315000    0.68610000    5.62732500
 H(Fragment=1)      2.69315600   -0.68611800   -5.62732200

 1 3 1.0 4 1.0 6 1.0 7 1.0
 2 3 1.0 6 1.0 8 1.0 9 1.0
 3
 4 22 1.5
 5 22 2.0
 6
 7 25 1.5
 8 30 1.5
 9 31 1.5
 10 25 2.0
 11 30 2.0
 12 31 2.0
 13 17 1.5 21 1.5
 14 23 1.5 24 1.5
 15 26 1.5 27 1.5
 16 28 1.5 29 1.5
 17 18 1.5 41 1.0
 18 19 1.5 42 1.0
 19 20 1.5 43 1.0
 20 21 1.5 44 1.0
 21 22 1.0
 22
 23 32 1.5 45 1.0
 24 25 1.0 33 1.5
 25
 26 34 1.5 46 1.0
 27 30 1.0 35 1.5
 28 36 1.5 47 1.0
 29 31 1.0 37 1.5
 30
 31
 32 38 1.5 48 1.0
 33 38 1.5 49 1.0
 34 39 1.5 50 1.0
 35 39 1.5 51 1.0
 36 40 1.5 52 1.0
 37 40 1.5 53 1.0
 38 54 1.0
 39 55 1.0
 40 56 1.0
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56

C O N H 0
6-31g(d,p)
****
Mn 0
SDDALL
****

Mn 0
SDDALL



