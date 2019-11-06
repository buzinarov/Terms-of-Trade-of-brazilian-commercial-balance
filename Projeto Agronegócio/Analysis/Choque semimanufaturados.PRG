
OPEN DATA "C:\Users\Windows-7\Desktop\Projeto Agronegócio\Data.xls"
CALENDAR 2000 1 12
ALL 2013:11
DATA(FORMAT=XLS,ORG=COLUMNS) 2000:01 2013:11 BCB BCS BCM CAMR CAM TT PIB USA CHINA EU MUNDO
Log BCB / LBCB
Log BCS / LBCS
Log BCM / LBCM
Log CAMR / LCAMR
Log CAM / LCAM
Log TT / LTT
Log PIB / LPIB
Log USA / LUSA
Log CHINA / LCHINA
Log EU / LEU
Log MUNDO / LMUNDO
Diff LBCS / DBCS
Diff LTT / DTT
DIff LPIB / DPIB
Diff LMUNDO / DMUNDO
set trend = t
system(model=chap2) 1 to 4
set r1 = 1.00*LBCS(t-1)+0.048*LTT(t-1)-0.667*LPIB(t-1)+0.268*LMUNDO(t-1)-2.972
lags 1 to 1
variables DBCS DTT DPIB DMUNDO
det constant r1
end(system)
estimate(outsigma=V,noprint)
declare rect pattern(4,4)
nonlin b c d
DEC FRML[RECT] AFRML
FRML AFRML = ||	1,-b,-c,-d|$
                0,1,0,0|$
                0,0,1,0|$
                0,0,0,1||
COMPUTE  b=c=d=0.0
CVMODEL(ITERS=100,METHOD=BFGS,TRACE,FACTOR=AFACTOR) %SIGMA AFRML
errors(impulse, MODEL=CHAP2, DEC=AFACTOR) *12
compute hstart=2000:02
compute hend=2013:10
history(model=chap2,add,results=history,window='saida') *hend-hstart+1 hstart %sigma





Non-Linear Optimization, Iteration 1. Function Calls 4.
 Cosine of Angle between Direction and Gradient  1.0000000. Alpha used was 0.000000
 Adjusted squared norm of gradient 41.58892
 Diagnostic measure (0=perfect) 0.3000
 Subiterations 4. Distance scale  0.125000000
Old Function = 2151.353558      New Function = 2153.778667
New Coefficients:
      0.214370      -0.691869      -0.353822

Non-Linear Optimization, Iteration 2. Function Calls 7.
 Cosine of Angle between Direction and Gradient  0.7703986. Alpha used was 0.000000
 Adjusted squared norm of gradient 18.43574
 Diagnostic measure (0=perfect) 0.1800
 Subiterations 3. Distance scale  0.250000000
Old Function = 2153.778667      New Function = 2155.851515
New Coefficients:
      1.139092      -0.767569      -1.232900

Non-Linear Optimization, Iteration 3. Function Calls 10.
 Cosine of Angle between Direction and Gradient  0.8589311. Alpha used was 0.000000
 Adjusted squared norm of gradient 0.8167467
 Diagnostic measure (0=perfect) 0.1080
 Subiterations 3. Distance scale  0.250000000
Old Function = 2155.851515      New Function = 2155.997064
New Coefficients:
      1.327505      -0.795180      -1.071435

Non-Linear Optimization, Iteration 4. Function Calls 11.
 Cosine of Angle between Direction and Gradient  0.8730881. Alpha used was 0.000000
 Adjusted squared norm of gradient 0.03829586
 Diagnostic measure (0=perfect) 0.0648
 Subiterations 1. Distance scale  1.000000000
Old Function = 2155.997064      New Function = 2156.021722
New Coefficients:
      1.241839      -0.744530      -0.974295

Non-Linear Optimization, Iteration 5. Function Calls 12.
 Cosine of Angle between Direction and Gradient  0.7932624. Alpha used was 0.000000
 Adjusted squared norm of gradient 0.0003841415
 Diagnostic measure (0=perfect) 0.0389
 Subiterations 1. Distance scale  1.000000000
Old Function = 2156.021722      New Function = 2156.022002
New Coefficients:
      1.251010      -0.750342      -0.981844

Non-Linear Optimization, Iteration 6. Function Calls 13.
 Cosine of Angle between Direction and Gradient  0.9181417. Alpha used was 0.000000
 Adjusted squared norm of gradient 4.596567e-08
 Diagnostic measure (0=perfect) 0.0233
 Subiterations 1. Distance scale  1.000000000
Old Function = 2156.022002      New Function = 2156.022002
New Coefficients:
      1.251027      -0.750304      -0.981875

Non-Linear Optimization, Iteration 7. Function Calls 14.
 Cosine of Angle between Direction and Gradient  0.8096544. Alpha used was 0.000000
 Adjusted squared norm of gradient 9.082683e-11
 Diagnostic measure (0=perfect) 0.0140
 Subiterations 1. Distance scale  1.000000000
Old Function = 2156.022002      New Function = 2156.022002
New Coefficients:
      1.251026      -0.750305      -0.981873

Covariance Model-Concentrated Likelihood - Estimation by BFGS
Convergence in     7 Iterations. Final criterion was  0.0000016 <  0.0000100
Observations                    165
Log Likelihood                    2156.02200164
Log Likelihood Unrestricted       2174.93178754
Chi-Squared(3)                      37.81957180
Significance Level              3.08632572e-08

   Variable                     Coeff       Std Error      T-Stat     Signif
*******************************************************************************
1.  B                         1.251025790  0.603112966      2.07428  0.03805322
2.  C                        -0.750305010  0.299171358     -2.50794  0.01214359
3.  D                        -0.981873454  0.491673006     -1.99701  0.04582464


Responses to Shock in DBCS

 Entry      DBCS         DTT        DPIB       DMUNDO
       1  0.13289044 -0.00000000 0.000000000  0.00000000
       2 -0.00703181 -0.00219579 0.000210256 -0.00423165
       3  0.00149120  0.00011169 0.001372294 -0.00122517
       4 -0.00044069 -0.00023853 0.000372205 -0.00054182
       5  0.00001411 -0.00001267 0.000266971 -0.00020647
       6 -0.00007095 -0.00002976 0.000094676 -0.00009093
       7 -0.00001316 -0.00000548 0.000049228 -0.00003738
       8 -0.00001181 -0.00000440 0.000019457 -0.00001638
       9 -0.00000361 -0.00000130 0.000009072 -0.00000694
      10 -0.00000205 -0.00000073 0.000003766 -0.00000302
      11 -0.00000076 -0.00000027 0.000001682 -0.00000130
      12 -0.00000037 -0.00000013 0.000000714 -0.00000056


Responses to Shock in DTT

 Entry      DBCS         DTT        DPIB       DMUNDO
       1  0.02386581  0.01907699  0.00000000 0.000000000
       2 -0.00473604 -0.00492290 -0.01216509 0.001129313
       3  0.00603073  0.00171179 -0.00098404 0.001365966
       4 -0.00047893 -0.00031173 -0.00139117 0.000479013
       5  0.00057384  0.00017808 -0.00026546 0.000278952
       6 -0.00000474 -0.00001035 -0.00019745 0.000109102
       7  0.00006408  0.00002124 -0.00005835 0.000052669
       8  0.00000715  0.00000194 -0.00003224 0.000021717
       9  0.00000864  0.00000296 -0.00001175 0.000009820
      10  0.00000206  0.00000068 -0.00000567 0.000004154
      11  0.00000135  0.00000047 -0.00000227 0.000001830
      12  0.00000045  0.00000015 -0.00000103 0.000000784


Responses to Shock in DPIB

 Entry      DBCS         DTT        DPIB       DMUNDO
       1 -0.02899545  0.00000000 0.038644884  0.00000000
       2 -0.01466485 -0.00055689 0.013138506 -0.00346172
       3 -0.00396945 -0.00040318 0.004739472 -0.00206702
       4 -0.00130881 -0.00021981 0.001823206 -0.00104127
       5 -0.00045628 -0.00010305 0.000737699 -0.00048416
       6 -0.00017393 -0.00004728 0.000306249 -0.00021757
       7 -0.00006904 -0.00002085 0.000129676 -0.00009599
       8 -0.00002859 -0.00000918 0.000055364 -0.00004198
       9 -0.00001201 -0.00000399 0.000023796 -0.00001826
      10 -0.00000513 -0.00000174 0.000010252 -0.00000793
      11 -0.00000220 -0.00000075 0.000004426 -0.00000343
      12 -0.00000095 -0.00000033 0.000001912 -0.00000149


Responses to Shock in DMUNDO

 Entry      DBCS         DTT        DPIB       DMUNDO
       1 -0.02118950 0.000000000  0.00000000 0.021580682
       2 -0.00299679 0.003002550  0.00044013 0.006834168
       3 -0.00187667 0.000164934 -0.00162520 0.002293408
       4  0.00031290 0.000317302 -0.00061260 0.000915075
       5  0.00000785 0.000048400 -0.00039139 0.000352147
       6  0.00008764 0.000042155 -0.00015675 0.000149462
       7  0.00002487 0.000011117 -0.00007702 0.000061829
       8  0.00001715 0.000006614 -0.00003199 0.000026695
       9  0.00000621 0.000002285 -0.00001453 0.000011358
      10  0.00000318 0.000001141 -0.00000616 0.000004920
      11  0.00000127 0.000000447 -0.00000272 0.000002115
      12  0.00000059 0.000000206 -0.00000116 0.000000916


Decomposition of Variance for Series DBCS
 Step   Std Error    DBCS     DTT      DPIB   DMUNDO
      1 0.13971105   90.474    2.918    4.307   2.300
      2 0.14076609   89.373    2.988    5.328   2.311
      3 0.14097150   89.124    3.162    5.392   2.322
      4 0.14097942   89.115    3.163    5.400   2.322
      5 0.14098133   89.112    3.164    5.401   2.322
      6 0.14098148   89.112    3.164    5.401   2.322
      7 0.14098152   89.112    3.164    5.401   2.322
      8 0.14098152   89.112    3.164    5.401   2.322
      9 0.14098152   89.112    3.164    5.401   2.322
     10 0.14098152   89.112    3.164    5.401   2.322
     11 0.14098152   89.112    3.164    5.401   2.322
     12 0.14098152   89.112    3.164    5.401   2.322

Decomposition of Variance for Series DTT
 Step   Std Error    DBCS     DTT      DPIB   DMUNDO
      1 0.01907699    0.000  100.000    0.000   0.000
      2 0.02005776    1.198   96.484    0.077   2.241
      3 0.02013569    1.192   96.461    0.117   2.230
      4 0.02014322    1.205   96.413    0.128   2.253
      5 0.02014433    1.205   96.410    0.131   2.254
      6 0.02014445    1.205   96.409    0.132   2.254
      7 0.02014448    1.206   96.409    0.132   2.254
      8 0.02014448    1.206   96.409    0.132   2.254
      9 0.02014448    1.206   96.409    0.132   2.254
     10 0.02014448    1.206   96.409    0.132   2.254
     11 0.02014448    1.206   96.409    0.132   2.254
     12 0.02014448    1.206   96.409    0.132   2.254

Decomposition of Variance for Series DPIB
 Step   Std Error    DBCS     DTT      DPIB   DMUNDO
      1 0.03864488    0.000    0.000  100.000   0.000
      2 0.04259430    0.002    8.157   91.830   0.011
      3 0.04292121    0.105    8.086   91.656   0.154
      4 0.04298841    0.112    8.165   91.549   0.174
      5 0.04299817    0.116    8.165   91.537   0.182
      6 0.04300010    0.116    8.167   91.534   0.183
      7 0.04300043    0.116    8.167   91.534   0.184
      8 0.04300050    0.116    8.167   91.533   0.184
      9 0.04300051    0.116    8.167   91.533   0.184
     10 0.04300051    0.116    8.167   91.533   0.184
     11 0.04300051    0.116    8.167   91.533   0.184
     12 0.04300051    0.116    8.167   91.533   0.184

Decomposition of Variance for Series DMUNDO
 Step   Std Error    DBCS     DTT      DPIB   DMUNDO
      1 0.02158068    0.000    0.000    0.000 100.000
      2 0.02331517    3.294    0.235    2.204  94.267
      3 0.02359018    3.488    0.564    2.921  93.027
      4 0.02364194    3.525    0.603    3.102  92.770
      5 0.02365206    3.529    0.616    3.142  92.713
      6 0.02365396    3.530    0.618    3.150  92.702
      7 0.02365433    3.530    0.619    3.151  92.700
      8 0.02365439    3.530    0.619    3.151  92.699
      9 0.02365441    3.530    0.619    3.151  92.699
     10 0.02365441    3.530    0.619    3.151  92.699
     11 0.02365441    3.530    0.619    3.151  92.699
     12 0.02365441    3.530    0.619    3.151  92.699


