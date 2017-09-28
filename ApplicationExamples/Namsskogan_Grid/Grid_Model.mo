within Namsskogan_Grid;
model Grid_Model
  // power flow: Bus voltage and angle
  parameter Real V1=1;
  parameter Real V2=1.000978686192306;
  parameter Real V3=1;
  parameter Real V4=1.001144870523547;
  parameter Real V5=0.990020695285066;
  parameter Real V6=0.991917071975107;
  parameter Real V7=0.999615092363111;
  parameter Real V8=1;
  parameter Real V9=1.005264704500199;
  parameter Real V10=1;
  parameter Real V11=1.001556334539315;
  parameter Real V12=1.006202074015938;
  parameter Real V13=1.000000000000000;
  parameter Real V14=1.002111573421558;
  parameter Real V15=1.000000000000000;
  parameter Real V16=1.005604575469775;
  parameter Real V17=1.009794898737450;
  parameter Real V18=1.000000000000000;
  parameter Real V19=1.008781516367090;
  parameter Real V20=1;
  parameter Real V21=1.012927254781854;
  parameter Real V22=1;
  parameter Real V23=0.990365039555955;
  parameter Real V24=0.992547458367065;
  parameter Real V25=1;
  parameter Real V26=1.002923143837613;
  parameter Real V27=1.006140397842372;
  parameter Real V28=1;
  parameter Real V29=1.012448925490739;
  parameter Real V30=1;
  parameter Real V31=1.002824689578292;
  parameter Real V32=1.004709989851770;
  parameter Real V33=1;

  parameter Real A1=0;
  parameter Real A2=0.012115755806484;
  parameter Real A3=0.082104439709160;
  parameter Real A4=0.018646091088315;
  parameter Real A5=0.097659480242634;
  parameter Real A6=0.108076654318283;
  parameter Real A7=0.131030947639985;
  parameter Real A8=0.195385827816926;
  parameter Real A9=0.139383558459376;
  parameter Real A10=0.172643191674894;
  parameter Real A11=0.190217292503320;
  parameter Real A12=0.197208802953018;
  parameter Real A13=0.235551877788020;
  parameter Real A14=0.190575809878652;
  parameter Real A15=0.229503417720643;
  parameter Real A16=0.210698071068972;
  parameter Real A17=0.214843158238043;
  parameter Real A18=0.250897893281931;
  parameter Real A19=0.225718726448939;
  parameter Real A20=0.272921892240354;
  parameter Real A21=0.230335027909897;
  parameter Real A22=0.268846818377855;
  parameter Real A23=0.128478717667788;
  parameter Real A24=0.129308136402056;
  parameter Real A25=0.174661512804609;
  parameter Real A26=0.186581039775171;
  parameter Real A27=0.193547709333211;
  parameter Real A28=0.223369006924396;
  parameter Real A29=0.200756261937865;
  parameter Real A30=0.236321108087801;
  parameter Real A31=0.224124501167591;
  parameter Real A32=0.229781948566553;
  parameter Real A33=0.266019238907426;

  //Power flow: active power
  parameter Real P1=0.052;
  parameter Real P2=0.1;
  parameter Real P3=0.06;
  parameter Real P4=0.026;
  parameter Real P5=0.034;
  parameter Real P6=0.039;
  parameter Real P7=0.013;
  parameter Real P8=0.026;
  parameter Real P9=0.036;
  parameter Real P10=0.01;
  parameter Real P11=0.015;
  parameter Real P12=0.35;
  parameter Real PinfBus=-0.731785154599269;
  //Power flow: Reactive power
  parameter Real Q1=-0.007324710145409;
  parameter Real Q2=0.003817600219383;
  parameter Real Q3=-0.008497237496540;
  parameter Real Q4=-0.006527593903969;
  parameter Real Q5=-0.005469908840906;
  parameter Real Q6=-0.012176182035471;
  parameter Real Q7=-4.504107405815501e-04;
  parameter Real Q8=-0.002893142134279;
  parameter Real Q9=-0.011808690774769;
  parameter Real Q10=-0.001897297640474;
  parameter Real Q11=0.002824778539280;
  parameter Real Q12=0.007359590829532;
  parameter Real QinfBus=0.094186096048226;
  //Power flow: Gen field voltage
  parameter Real VF1=1.514917156447076;
  parameter Real VF2=1.415463512981568;
  parameter Real VF3=1.673011441020379;
  parameter Real VF4=1.440249537769634;
  parameter Real VF5=1.547064720603257;
  parameter Real VF6=1.403336792187835;
  parameter Real VF7=1.516519670430372;
  parameter Real VF8=1.536585695281951;
  parameter Real VF9=1.506707258466347;
  parameter Real VF10=1.212912773594076;
  parameter Real VF11=1.960438233476215;
  parameter Real VF12=1.294154485396935;
  // Power flow: Reference voltage
  parameter Real VR1=0.998835608710304;
  parameter Real VR2=0.999494535063984;
  parameter Real VR3=1.004193839884901;
  parameter Real VR4=0.998622927924158;
  parameter Real VR5=0.998527646052893;
  parameter Real VR6=0.998936877367948;
  parameter Real VR7=1.003800205404283;
  parameter Real VR8=1.007701305520621;
  parameter Real VR9=0.998563459160107;
  parameter Real VR10=0.997078697666231;
  parameter Real VR11=0.996020051548693;

  OpenIPSL.Electrical.Machines.PSAT.Order6 syn1(
    V_b=6.6,
    V_0=V10,
    Sn=8,
    Vn=6.6,
    ra=0,
    xd1=0.2,
    M=5,
    D=0,
    xd=2,
    xq=1.5,
    xq1=0.3,
    xd2=0.15,
    xq2=0.25,
    Td10=4,
    Tq10=0.8,
    Td20=0.026667,
    Tq20=0.18,
    Taa=0.002,
    P_0=P1*SysData.S_b,
    Q_0=Q1*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A10))
    annotation (Placement(transformation(extent={{28,-158},{48,-138}})));
  OpenIPSL.Electrical.Buses.BusExt B1(
    V_b=132,
    nu=1,
    V_0=V1,
    angle_0=Modelica.SIunits.Conversions.to_deg(A1),
    no=1) annotation (Placement(transformation(
        extent={{-2,-28},{2,28}},
        rotation=90,
        origin={208,-134})));
  OpenIPSL.Electrical.Buses.BusExt B2(
    V_b=132,
    no=3,
    nu=1,
    V_0=V2,
    angle_0=Modelica.SIunits.Conversions.to_deg(A2)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={162,-82})));
  OpenIPSL.Electrical.Buses.BusExt B3(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V3,
    angle_0=Modelica.SIunits.Conversions.to_deg(A3)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={290,-96})));
  OpenIPSL.Electrical.Buses.BusExt B4(
    V_b=132,
    no=1,
    nu=1,
    V_0=V4,
    angle_0=Modelica.SIunits.Conversions.to_deg(A4)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={134,-32})));
  OpenIPSL.Electrical.Buses.BusExt B5(
    V_b=22,
    no=4,
    V_0=V5,
    angle_0=Modelica.SIunits.Conversions.to_deg(A5),
    nu=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={106,2})));
  OpenIPSL.Electrical.Buses.BusExt B6(
    V_b=22,
    no=2,
    nu=2,
    V_0=V6,
    angle_0=Modelica.SIunits.Conversions.to_deg(A6)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={18,18})));
  OpenIPSL.Electrical.Buses.BusExt B7(
    V_b=22,
    no=1,
    nu=2,
    V_0=V7,
    angle_0=Modelica.SIunits.Conversions.to_deg(A7)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-12,-44})));
  OpenIPSL.Electrical.Buses.BusExt B8(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V8,
    angle_0=Modelica.SIunits.Conversions.to_deg(A8)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-40,-92})));
  OpenIPSL.Electrical.Buses.BusExt B9(
    V_b=22,
    no=1,
    nu=1,
    V_0=V9,
    angle_0=Modelica.SIunits.Conversions.to_deg(A9)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={58,-82})));
  OpenIPSL.Electrical.Buses.BusExt B10(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V10,
    angle_0=Modelica.SIunits.Conversions.to_deg(A10)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={58,-124})));
  OpenIPSL.Electrical.Buses.BusExt B11(
    V_b=22,
    no=3,
    nu=2,
    V_0=V11,
    angle_0=Modelica.SIunits.Conversions.to_deg(A11)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={-82,16})));
  OpenIPSL.Electrical.Buses.BusExt B12(
    V_b=22,
    no=1,
    nu=1,
    V_0=V12,
    angle_0=Modelica.SIunits.Conversions.to_deg(A12)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-110,-60})));
  OpenIPSL.Electrical.Buses.BusExt B13(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V13,
    angle_0=Modelica.SIunits.Conversions.to_deg(A13)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-122,-118})));
  OpenIPSL.Electrical.Buses.BusExt B14(
    V_b=22,
    no=1,
    nu=1,
    V_0=V14,
    angle_0=Modelica.SIunits.Conversions.to_deg(A14)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-106,80})));
  OpenIPSL.Electrical.Buses.BusExt B15(
    V_b=0.69,
    no=1,
    nu=1,
    V_0=V15,
    angle_0=Modelica.SIunits.Conversions.to_deg(A15)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={-42,114})));
  OpenIPSL.Electrical.Buses.BusExt B16(
    V_b=22,
    no=2,
    nu=1,
    V_0=V16,
    angle_0=Modelica.SIunits.Conversions.to_deg(A16)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-194,-18})));
  OpenIPSL.Electrical.Buses.BusExt B17(
    V_b=22,
    nu=1,
    V_0=V17,
    angle_0=Modelica.SIunits.Conversions.to_deg(A17),
    no=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-214,-66})));
  OpenIPSL.Electrical.Buses.BusExt B18(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V18,
    angle_0=Modelica.SIunits.Conversions.to_deg(A18)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-228,-112})));
  OpenIPSL.Electrical.Buses.BusExt B19(
    V_b=22,
    no=2,
    nu=1,
    V_0=V19,
    angle_0=Modelica.SIunits.Conversions.to_deg(A19)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-266,-12})));
  OpenIPSL.Electrical.Buses.BusExt B20(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V20,
    angle_0=Modelica.SIunits.Conversions.to_deg(A20)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-310,-72})));
  OpenIPSL.Electrical.Buses.BusExt B21(
    V_b=22,
    no=1,
    nu=1,
    V_0=V21,
    angle_0=Modelica.SIunits.Conversions.to_deg(A21)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={-318,50})));
  OpenIPSL.Electrical.Buses.BusExt B22(
    V_b=6.6,
    nu=1,
    V_0=V22,
    angle_0=Modelica.SIunits.Conversions.to_deg(A22),
    no=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-288,122})));
  OpenIPSL.Electrical.Buses.BusExt B23(
    V_b=22,
    no=3,
    nu=1,
    V_0=V23,
    angle_0=Modelica.SIunits.Conversions.to_deg(A23)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={98,62})));
  OpenIPSL.Electrical.Buses.BusExt B24(
    V_b=22,
    no=1,
    V_0=V24,
    angle_0=Modelica.SIunits.Conversions.to_deg(A24),
    nu=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={192,44})));
  OpenIPSL.Electrical.Buses.BusExt B25(
    V_b=0.69,
    no=1,
    nu=1,
    V_0=V25,
    angle_0=Modelica.SIunits.Conversions.to_deg(A25)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={240,-2})));
  OpenIPSL.Electrical.Buses.BusExt B26(
    V_b=22,
    no=2,
    nu=4,
    V_0=V26,
    angle_0=Modelica.SIunits.Conversions.to_deg(A26)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={98,110})));
  OpenIPSL.Electrical.Buses.BusExt B27(
    V_b=22,
    no=2,
    nu=1,
    V_0=V27,
    angle_0=Modelica.SIunits.Conversions.to_deg(A27)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={196,94})));
  OpenIPSL.Electrical.Buses.BusExt B28(
    V_b=0.69,
    no=1,
    V_0=V28,
    angle_0=Modelica.SIunits.Conversions.to_deg(A28),
    nu=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={266,56})));
  OpenIPSL.Electrical.Buses.BusExt B29(
    V_b=22,
    nu=1,
    V_0=V29,
    angle_0=Modelica.SIunits.Conversions.to_deg(A29),
    no=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={322,96})));
  OpenIPSL.Electrical.Buses.BusExt B30(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V30,
    angle_0=Modelica.SIunits.Conversions.to_deg(A30)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={342,18})));
  OpenIPSL.Electrical.Buses.BusExt B31(
    V_b=22,
    no=1,
    nu=1,
    V_0=V31,
    angle_0=Modelica.SIunits.Conversions.to_deg(A31)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={94,158})));
  OpenIPSL.Electrical.Buses.BusExt B32(
    V_b=22,
    no=2,
    nu=1,
    V_0=V32,
    angle_0=Modelica.SIunits.Conversions.to_deg(A32)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={212,140})));
  OpenIPSL.Electrical.Buses.BusExt B33(
    V_b=6.6,
    no=1,
    nu=1,
    V_0=V33,
    angle_0=Modelica.SIunits.Conversions.to_deg(A33)) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={284,136})));

  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=50,
    V_b=6.6,
    Vn=6.6,
    fn=50,
    kT=6.6/132,
    x=0.1,
    r=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={230,-78})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer1(
    Sn=50,
    fn=50,
    x=0.1,
    r=0,
    V_b=132,
    Vn=132,
    kT=132/22) annotation (Placement(transformation(
        extent={{-8,-9},{8,9}},
        rotation=90,
        origin={131,-16})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer2(
    V_b=6.6,
    Vn=6.6,
    fn=50,
    r=0,
    Sn=14,
    kT=6.6/22,
    x=0.09) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-38,-74})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer3(
    V_b=6.6,
    Vn=6.6,
    fn=50,
    r=0,
    Sn=14,
    x=0.09,
    kT=6.6/22) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-106})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer4(
    V_b=6.6,
    Vn=6.6,
    fn=50,
    r=0,
    Sn=14,
    kT=6.6/22,
    x=0.09) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-114,-92})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer5(
    fn=50,
    r=0,
    Sn=2,
    V_b=0.69,
    Vn=0.69,
    kT=0.69/22,
    x=0.06) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,110})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer6(
    V_b=6.6,
    Vn=6.6,
    fn=50,
    r=0,
    Sn=5,
    kT=6.6/22,
    x=0.07) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-212,-88})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer7(
    V_b=6.6,
    Vn=6.6,
    fn=50,
    r=0,
    Sn=5,
    kT=6.6/22,
    x=0.07) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-292,-46})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer8(
    V_b=6.6,
    Vn=6.6,
    fn=50,
    r=0,
    kT=6.6/22,
    Sn=8,
    x=0.08) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-330,96})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer9(
    fn=50,
    r=0,
    Sn=2,
    V_b=0.69,
    Vn=0.69,
    kT=0.69/22,
    x=0.06) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,22})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer10(
    fn=50,
    r=0,
    Sn=2,
    V_b=0.69,
    Vn=0.69,
    kT=0.69/22,
    x=0.06) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={238,78})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer11(
    fn=50,
    r=0,
    Sn=8,
    V_b=6.6,
    Vn=6.6,
    kT=6.6/22,
    x=0.08) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={328,54})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer12(
    fn=50,
    r=0,
    Sn=5,
    V_b=6.6,
    Vn=6.6,
    kT=6.6/22,
    x=0.07) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={250,140})));
  OpenIPSL.Electrical.Branches.PwLine Line1_2(
    R=0.00336,
    X=0.01613,
    G=0,
    B=0.00426/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={198,-108})));
  OpenIPSL.Electrical.Branches.PwLine Line2_4(
    R=0.00336,
    X=0.01613,
    G=0,
    B=0.0026/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={144,-60})));
  OpenIPSL.Electrical.Branches.PwLine line56_1(
    R=0.0262,
    X=0.0595,
    G=0,
    B=0.00001289376/2,
    t2=11,
    t1=10) annotation (Placement(transformation(extent={{48,-4},{68,16}})));
  OpenIPSL.Electrical.Branches.PwLine Line56_2(
    G=0,
    R=0.0262,
    X=0.0595,
    B=0.00001289376/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,30})));
  OpenIPSL.Electrical.Branches.PwLine Line6_11(
    G=0,
    R=0.192,
    X=0.436,
    B=0.0000947/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-32,18})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7(
    G=0,
    R=0.064,
    X=0.145,
    B=0.00003151808/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,-16})));
  OpenIPSL.Electrical.Branches.PwLine Line7_9(
    G=0,
    R=0.134,
    X=0.138,
    B=0.0000267/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,-68})));
  OpenIPSL.Electrical.Branches.PwLine Line7_1(
    G=0,
    R=0.0964,
    X=0.10,
    B=0.0000193/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-66,-30})));
  OpenIPSL.Electrical.Branches.PwLine Line11_16(
    G=0,
    R=0.09814,
    X=0.1807,
    B=0.000039/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-132,22})));
  OpenIPSL.Electrical.Branches.PwLine Line16_19(
    G=0,
    R=0.098,
    X=0.181,
    B=0.0000394/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-236,22})));
  OpenIPSL.Electrical.Branches.PwLine Line19_21(
    G=0,
    R=0.134,
    X=0.0734,
    B=0.0000126/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-284,24})));
  OpenIPSL.Electrical.Branches.PwLine Line11_14(
    G=0,
    R=0.0446,
    X=0.0244,
    B=0.0000042/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-100,52})));
  OpenIPSL.Electrical.Branches.PwLine Line5_23(
    G=0,
    R=0.157,
    X=0.289,
    B=0.00000632/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,38})));
  OpenIPSL.Electrical.Branches.PwLine Line2326_1(
    G=0,
    R=1.016,
    X=1.055,
    B=0.0002038/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={74,84})));
  OpenIPSL.Electrical.Branches.PwLine Line2326_2(
    G=0,
    R=1.016,
    X=1.055,
    B=0.0002038/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={98,84})));
  OpenIPSL.Electrical.Branches.PwLine Line26_31(
    G=0,
    R=0.742,
    X=0.771,
    B=0.000148/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={94,132})));
  OpenIPSL.Electrical.Branches.PwLine Line31_32(
    G=0,
    R=0.1489,
    X=0.0816,
    B=0.00014/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={156,164})));
  OpenIPSL.Electrical.Branches.PwLine Line26_27(
    G=0,
    R=0.111,
    X=0.116,
    B=0.0000223/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={156,116})));
  OpenIPSL.Electrical.Branches.PwLine Line26_29(
    G=0,
    R=0.223,
    X=0.122,
    B=0.000021/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={252,102})));
  OpenIPSL.Electrical.Branches.PwLine Line26_1(
    G=0,
    R=0.134,
    X=0.0734,
    B=0.0000126/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={154,64})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant voltDependant(
    V_b=22,
    V_0=V11,
    angle_0=Modelica.SIunits.Conversions.to_deg(A11),
    P_0=0.2116,
    Q_0=0.043)
    annotation (Placement(transformation(extent={{-100,-16},{-88,-4}})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant voltDependant1(
    V_b=22,
    V_0=V26,
    angle_0=Modelica.SIunits.Conversions.to_deg(A26),
    P_0=0.0074,
    Q_0=0.0018)
    annotation (Placement(transformation(extent={{116,82},{126,92}})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant voltDependant2(
    V_b=132,
    V_0=V2,
    angle_0=Modelica.SIunits.Conversions.to_deg(A2),
    P_0=0.702,
    Q_0=0.143)
    annotation (Placement(transformation(extent={{120,-86},{128,-78}})));
  OpenIPSL.Electrical.Branches.PwLine Line16_17(
    G=0,
    R=0.19365,
    X=0.10609,
    B=0.000082/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-196,-44})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant voltDependant3(
    V_b=22,
    V_0=V5,
    angle_0=Modelica.SIunits.Conversions.to_deg(A5),
    P_0=0,
    Q_0=-8) annotation (Placement(transformation(extent={{152,-2},{160,6}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1(
    vrmin=-1,
    vrmax=1,
    Ka=62,
    Ta=0.05,
    Kf=0.1140,
    Tf=0.5,
    Ke=-0.05,
    Te=0.405,
    Tr=1,
    v0=V10,
    vref0=VR1,
    vf0=VF1)
    annotation (Placement(transformation(extent={{-2,-154},{18,-134}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn2(
    V_b=6.6,
    Vn=6.6,
    ra=0,
    M=5,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    V_0=V8,
    Sn=15,
    xd1=0.3,
    xd=1.5,
    xq=1,
    xd2=0.2,
    xq2=0.15,
    Td10=3,
    Td20=0.015,
    Tq20=0.2,
    P_0=P2*SysData.S_b,
    Q_0=Q2*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A8))
    annotation (Placement(transformation(extent={{-64,-152},{-44,-132}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2(
    vrmin=-1,
    vrmax=1,
    Tr=1,
    Ka=50,
    Ta=0.06,
    Kf=0.08,
    Tf=1,
    Ke=-0.02,
    Te=0.5,
    vref0=VR2,
    vf0=VF2,
    v0=V8)
    annotation (Placement(transformation(extent={{-94,-148},{-74,-128}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn3(
    V_b=6.6,
    Sn=8,
    Vn=6.6,
    ra=0,
    xd1=0.2,
    D=0,
    xd=2,
    xq=1.5,
    xq1=0.3,
    xd2=0.15,
    xq2=0.25,
    Td10=4,
    Tq10=0.8,
    Td20=0.026667,
    Tq20=0.18,
    Taa=0.002,
    V_0=V13,
    M=2.5,
    P_0=P3*SysData.S_b,
    Q_0=Q3*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A13))
    annotation (Placement(transformation(extent={{-158,-156},{-138,-136}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR3(
    Tr=1,
    vrmin=-7.3,
    vrmax=7.3,
    Ka=400,
    Ta=0.02,
    Kf=0.03,
    Tf=1,
    Ke=1,
    Te=0.790,
    v0=V13,
    vref0=VR3,
    vf0=VF3)
    annotation (Placement(transformation(extent={{-188,-152},{-168,-132}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn4(
    V_b=6.6,
    Vn=6.6,
    ra=0,
    xd1=0.2,
    D=0,
    xd=2,
    xq=1.5,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    V_0=V18,
    Sn=4,
    M=0.7,
    xd2=0.1,
    xq2=0.15,
    Td10=3,
    Td20=0.02,
    Tq20=0.2,
    P_0=P4*SysData.S_b,
    Q_0=Q4*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A18))
    annotation (Placement(transformation(extent={{-252,-148},{-232,-128}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR4(
    vrmin=-1,
    vrmax=1,
    Ke=-0.05,
    Tr=1,
    Ka=50,
    Ta=0.06,
    Kf=0.08,
    Tf=1,
    Te=0.5,
    v0=V18,
    vref0=VR4,
    vf0=VF4)
    annotation (Placement(transformation(extent={{-282,-144},{-262,-124}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn5(
    V_b=6.6,
    Vn=6.6,
    ra=0,
    xd1=0.2,
    D=0,
    xd=2,
    xq=1.5,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    xd2=0.1,
    Td20=0.02,
    V_0=V20,
    Sn=5,
    M=1,
    xq2=0.2,
    Td10=4,
    Tq20=0.225,
    P_0=P5*SysData.S_b,
    Q_0=Q5*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A20)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-310,-106})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR5(
    vrmin=-1,
    vrmax=1,
    Ke=-0.05,
    Tr=1,
    Ka=50,
    Ta=0.06,
    Kf=0.08,
    Tf=1,
    Te=0.5,
    v0=V20,
    vref0=VR5,
    vf0=VF5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-312,-136})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn6(
    V_b=6.6,
    Vn=6.6,
    ra=0,
    xd1=0.2,
    D=0,
    xd=2,
    xq=1.5,
    xq1=0.3,
    Td10=4,
    Tq10=0.8,
    Taa=0.002,
    V_0=V22,
    Sn=6,
    M=1.5,
    xd2=0.1,
    xq2=0.2,
    Td20=0.04,
    Tq20=0.225,
    P_0=P6*SysData.S_b,
    Q_0=Q6*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A22)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-250,144})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR6(
    vrmin=-1,
    vrmax=1,
    Tr=1,
    Ka=50,
    Ta=0.02,
    Kf=0.06,
    Tf=1.25,
    Ke=-0.04,
    Te=0.470,
    v0=V22,
    vref0=VR6,
    vf0=VF6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-214,152})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn7(
    ra=0,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    xd2=0.1,
    V_b=0.69,
    V_0=V15,
    Sn=1.6,
    Vn=0.69,
    xd1=0.15,
    M=0.5,
    xd=1.5,
    xq=1,
    xq2=0.1,
    Td10=2,
    Td20=0.015,
    Tq20=0.1,
    P_0=P7*SysData.S_b,
    Q_0=Q7*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A15)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-4,118})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR7(
    Tr=1,
    Ta=0.02,
    vrmin=-6.5,
    vrmax=6.5,
    Ka=400,
    Kf=0.03,
    Tf=1,
    Ke=1,
    Te=0.730,
    v0=V15,
    vref0=VR7,
    vf0=VF7) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={32,126})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn8(
    ra=0,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    xd2=0.1,
    V_b=6.6,
    V_0=V33,
    Sn=4,
    Vn=6.6,
    xd1=0.2,
    M=0.7,
    xd=2,
    xq=1.5,
    xq2=0.15,
    Td10=3,
    Td20=0.02,
    Tq20=0.2,
    P_0=P8*SysData.S_b,
    Q_0=Q8*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A33)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={320,142})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR8(
    Tr=1,
    Ta=0.02,
    Kf=0.03,
    Tf=1,
    Ke=1,
    vrmin=-4.26,
    vrmax=4.26,
    Ka=200,
    Te=1.4,
    v0=V33,
    vref0=VR8,
    vf0=VF8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={356,148})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn9(
    ra=0,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    xd2=0.1,
    V_b=6.6,
    Vn=6.6,
    xd1=0.2,
    xd=2,
    xq=1.5,
    Td20=0.02,
    V_0=V30,
    Sn=5,
    M=1,
    xq2=0.2,
    Td10=4,
    Tq20=0.225,
    P_0=P9*SysData.S_b,
    Q_0=Q9*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A30)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={342,-12})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR9(
    Tr=1,
    Ta=0.02,
    vrmin=-1,
    vrmax=1,
    Ka=50,
    Kf=0.0332,
    Tf=1.26,
    Ke=-0.05,
    Te=0.530,
    v0=V30,
    vref0=VR9,
    vf0=VF9) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={378,-4})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn10(
    ra=0,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    xd2=0.1,
    V_b=0.69,
    V_0=V28,
    Sn=1.6,
    Vn=0.69,
    xd1=0.15,
    M=0.5,
    xd=1.5,
    xq=1,
    xq2=0.1,
    Td10=2,
    Td20=0.015,
    Tq20=0.15,
    P_0=P10*SysData.S_b,
    Q_0=Q10*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A28)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={276,26})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR10(
    Tr=1,
    vrmin=-1,
    vrmax=1,
    Ka=25,
    Ta=0.2,
    Kf=0.6571,
    Tf=0.35,
    Ke=-0.062,
    Te=0.5,
    v0=V28,
    vref0=VR10,
    vf0=VF10) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={278,-2})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn11(
    ra=0,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    xd2=0.1,
    V_b=0.69,
    Vn=0.69,
    M=0.5,
    xq2=0.1,
    Tq20=0.15,
    V_0=V25,
    Sn=2,
    xd1=0.2,
    xd=2,
    xq=1.5,
    Td10=3,
    Td20=0.02,
    P_0=P11*SysData.S_b,
    Q_0=Q11*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A25)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={238,-30})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR11(
    Tr=1,
    vrmin=-1,
    vrmax=1,
    Ta=0.2,
    vref0=VR11,
    vf0=VF11,
    Ka=16.5,
    Kf=0.06,
    Tf=1,
    Ke=-0.037,
    Te=0.270,
    v0=V25) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={240,-58})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn12(
    ra=0,
    D=0,
    xq1=0.3,
    Tq10=0.8,
    Taa=0.002,
    V_b=6.6,
    V_0=V3,
    Sn=45,
    Vn=6.6,
    xd1=0.3,
    M=2.5,
    xd=1.05,
    xq=0.8,
    xd2=0.2,
    xq2=0.2,
    Td10=2.8,
    Td20=0.03,
    Tq20=0.12,
    P_0=P12*SysData.S_b,
    Q_0=Q12*SysData.S_b,
    angle_0=Modelica.SIunits.Conversions.to_deg(A3)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={294,-128})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    V_0=V1,
    angle_0=Modelica.SIunits.Conversions.to_deg(A1),
    V_b=132,
    P_0=PinfBus,
    Q_0=QinfBus) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={140,-148})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=50)
    annotation (Placement(transformation(extent={{-358,138},{-284,180}})));
  Modelica.Blocks.Sources.Constant const(k=VR9)
    annotation (Placement(transformation(extent={{370,-38},{380,-28}})));
  Modelica.Blocks.Sources.Constant const1(k=VR10) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={273,-25})));
  Modelica.Blocks.Sources.Constant const2(k=VR11) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={217,-67})));
  Modelica.Blocks.Sources.Constant const3(k=VR8) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={383,143})));
  Modelica.Blocks.Sources.Constant const4(k=VR1) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-17,-129})));
  Modelica.Blocks.Sources.Constant const5(k=VR2) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-109,-155})));
  Modelica.Blocks.Sources.Constant const6(k=VR3) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-205,-133})));
  Modelica.Blocks.Sources.Constant const7(k=VR4) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-298,-130})));
  Modelica.Blocks.Sources.Constant const8(k=VR5) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-337,-155})));
  Modelica.Blocks.Sources.Constant const9(k=VR6) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-183,145})));
  Modelica.Blocks.Sources.Constant const10(k=VR7) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={59,125})));
  StaticCondenser staticCondenser(B=0.02)
    annotation (Placement(transformation(extent={{164,130},{176,142}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=1e-3,
    X=1e-3,
    t1=1,
    t2=1.02) annotation (Placement(transformation(extent={{138,86},{150,98}})));
equation
  connect(twoWindingTransformer.p, B3.o[1]) annotation (Line(points={{241,-78},
          {262,-78},{292,-78},{292,-96}}, color={0,0,255}));
  connect(B2.o[1], twoWindingTransformer.n) annotation (Line(points={{172.8,-82},
          {164,-82},{164,-78},{219,-78}}, color={0,0,255}));
  connect(twoWindingTransformer1.p, B4.o[1]) annotation (Line(points={{131,-24.8},
          {131,-28.4},{136,-28.4},{136,-32}}, color={0,0,255}));
  connect(B5.u[1], twoWindingTransformer1.n) annotation (Line(points={{108,-2},
          {110,-2},{110,-7.2},{131,-7.2}}, color={0,0,255}));
  connect(B1.u[1], Line1_2.p) annotation (Line(points={{206,-130},{204,-130},{
          204,-122},{198,-122},{198,-119.667}}, color={0,0,255}));
  connect(Line1_2.n, B2.u[1]) annotation (Line(points={{198,-96.3333},{198,-96.3333},
          {198,-92},{162,-92},{162,-86},{164,-86}}, color={0,0,255}));
  connect(B2.o[2], Line2_4.p) annotation (Line(points={{164,-82},{168,-82},{168,
          -76},{144,-76},{144,-71.6667}}, color={0,0,255}));
  connect(B2.o[3], voltDependant2.p) annotation (Line(points={{155.2,-82},{158,
          -82},{158,-74},{122,-74},{122,-77.6},{124,-77.6}}, color={0,0,255}));
  connect(B4.u[1], Line2_4.n) annotation (Line(points={{136,-36},{138,-36},{138,
          -44},{138,-46},{144,-46},{144,-48.3333}}, color={0,0,255}));
  connect(B5.o[1], voltDependant3.p) annotation (Line(points={{117.9,2},{112,2},
          {112,8},{156,8},{156,6.4}}, color={0,0,255}));
  connect(B5.o[2], Line5_23.n) annotation (Line(points={{111.3,2},{110,2},{110,
          12},{110,18},{102,18},{102,26.3333},{100,26.3333}}, color={0,0,255}));
  connect(B5.o[3], Line56_2.p) annotation (Line(points={{104.7,2},{108,2},{108,
          12},{92,12},{92,30},{71.6667,30}}, color={0,0,255}));
  connect(B5.o[4], line56_1.n) annotation (Line(points={{98.1,2},{104,2},{104,6},
          {69.6667,6}}, color={0,0,255}));
  connect(B6.u[1], Line56_2.n) annotation (Line(points={{24,24.6},{38,24.6},{38,
          30},{48.3333,30}}, color={0,0,255}));
  connect(B6.u[2], line56_1.p) annotation (Line(points={{24,11.4},{38,11.4},{38,
          6},{46.3333,6}}, color={0,0,255}));
  connect(Line6_11.p, B6.o[1]) annotation (Line(points={{-20.3333,18},{20,18},{
          20,24.6}}, color={0,0,255}));
  connect(B23.u[1], Line5_23.p) annotation (Line(points={{100,58},{100,49.6667},
          {100,49.6667}}, color={0,0,255}));
  connect(B25.o[1], twoWindingTransformer9.p) annotation (Line(points={{242,-2},
          {244,-2},{244,8},{244,11},{242,11}}, color={0,0,255}));
  connect(B24.u[1], twoWindingTransformer9.n) annotation (Line(points={{194,40},
          {196,40},{196,33},{242,33}}, color={0,0,255}));
  connect(Line26_1.p, B24.o[1]) annotation (Line(points={{165.667,64},{194,64},
          {194,44}}, color={0,0,255}));
  connect(B23.o[1], Line26_1.n) annotation (Line(points={{108.8,62},{108,62},{
          108,64},{142.333,64}}, color={0,0,255}));
  connect(B23.o[2], Line2326_2.n) annotation (Line(points={{100,62},{100,76},{
          98,76},{98,72.3333}}, color={0,0,255}));
  connect(Line2326_1.n, B23.o[3]) annotation (Line(points={{74,72.3333},{76,
          72.3333},{76,70},{76,64},{91.2,64},{91.2,62}}, color={0,0,255}));
  connect(B26.u[1], voltDependant1.p) annotation (Line(points={{109.9,106},{104,
          106},{104,96},{121,96},{121,92.5}}, color={0,0,255}));
  connect(B26.u[2], Line2326_2.p) annotation (Line(points={{103.3,106},{98,106},
          {98,95.6667}}, color={0,0,255}));
  connect(B26.u[3], Line2326_1.p) annotation (Line(points={{96.7,106},{96,106},
          {96,100},{74,100},{74,95.6667}}, color={0,0,255}));
  connect(B26.o[1], Line26_31.n) annotation (Line(points={{106.6,110},{98,110},
          {98,120},{94,120},{94,120.333}}, color={0,0,255}));
  connect(Line26_31.p, B31.u[1]) annotation (Line(points={{94,143.667},{92,
          143.667},{92,154},{96,154}}, color={0,0,255}));
  connect(B31.o[1], Line31_32.n) annotation (Line(points={{96,158},{96,164},{
          144.333,164}}, color={0,0,255}));
  connect(Line31_32.p, B32.o[1]) annotation (Line(points={{167.667,164},{190,
          164},{190,146.6},{214,146.6}}, color={0,0,255}));
  connect(B32.u[1], twoWindingTransformer12.n)
    annotation (Line(points={{218,140},{224,140},{239,140}}, color={0,0,255}));
  connect(twoWindingTransformer12.p, B33.o[1])
    annotation (Line(points={{261,140},{286,140},{286,136}}, color={0,0,255}));
  connect(B26.o[2], Line26_27.n) annotation (Line(points={{93.4,110},{93.4,116},
          {144.333,116}}, color={0,0,255}));
  connect(Line26_27.p, B27.o[1]) annotation (Line(points={{167.667,116},{204.6,
          116},{204.6,94}}, color={0,0,255}));
  connect(B27.u[1], twoWindingTransformer10.n) annotation (Line(points={{198,90},
          {200,90},{200,82},{200,78},{227,78}}, color={0,0,255}));
  connect(twoWindingTransformer10.p, B28.o[1])
    annotation (Line(points={{249,78},{268,78},{268,56}}, color={0,0,255}));
  connect(B27.o[2], Line26_29.n) annotation (Line(points={{191.4,94},{202,94},{
          202,100},{240.333,100},{240.333,102}}, color={0,0,255}));
  connect(B29.o[1], Line26_29.p) annotation (Line(points={{324,96},{324,102},{
          263.667,102}}, color={0,0,255}));
  connect(B29.u[1], twoWindingTransformer11.n) annotation (Line(points={{324,92},
          {326,92},{326,78},{326,65},{328,65}}, color={0,0,255}));
  connect(B30.o[1], twoWindingTransformer11.p) annotation (Line(points={{344,18},
          {346,18},{346,43},{328,43}}, color={0,0,255}));
  connect(Line6_11.n, B11.u[1]) annotation (Line(points={{-43.6667,18},{-58,18},
          {-58,22.6},{-76,22.6}}, color={0,0,255}));
  connect(B11.o[1], voltDependant.p) annotation (Line(points={{-80,24.8},{-94,
          24.8},{-94,-3.4}}, color={0,0,255}));
  connect(Line11_14.n, B11.o[2]) annotation (Line(points={{-100,40.3333},{-100,
          40.3333},{-100,34},{-84,34},{-84,16},{-80,16}}, color={0,0,255}));
  connect(Line11_16.p, B11.o[3]) annotation (Line(points={{-120.333,22},{-116,
          22},{-116,24},{-108,24},{-108,7.2},{-80,7.2}}, color={0,0,255}));
  connect(Line11_14.p, B14.u[1]) annotation (Line(points={{-100,63.6667},{-100,
          76},{-104,76}}, color={0,0,255}));
  connect(B14.o[1], twoWindingTransformer5.n) annotation (Line(points={{-104,80},
          {-96,80},{-96,110},{-85,110}}, color={0,0,255}));
  connect(B15.o[1], twoWindingTransformer5.p) annotation (Line(points={{-40,114},
          {-48,114},{-48,110},{-56,110},{-63,110}}, color={0,0,255}));
  connect(B6.o[2], Line6_7.p) annotation (Line(points={{20,11.4},{14,11.4},{14,
          10},{2,10},{2,-4.33333}}, color={0,0,255}));
  connect(B7.u[1], Line7_9.p) annotation (Line(points={{-3.4,-48},{-4,-48},{-4,
          -58},{18,-58},{18,-56.3333}}, color={0,0,255}));
  connect(Line7_9.n, B9.o[1]) annotation (Line(points={{18,-79.6667},{36,-79.6667},
          {36,-72},{60,-72},{60,-82}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.u[2]) annotation (Line(points={{-27,-74},
          {-16.6,-74},{-16.6,-48}}, color={0,0,255}));
  connect(B8.o[1], twoWindingTransformer2.p) annotation (Line(points={{-38,-92},
          {-38,-92},{-38,-84},{-38,-80},{-49,-80},{-49,-74}}, color={0,0,255}));
  connect(B7.o[1], Line6_7.n) annotation (Line(points={{-10,-44},{-10,-27.6667},
          {2,-27.6667}}, color={0,0,255}));
  connect(B11.u[2], Line7_1.n) annotation (Line(points={{-76,9.4},{-70,9.4},{-70,
          8},{-70,-18.3333},{-66,-18.3333}}, color={0,0,255}));
  connect(Line7_1.p, B12.o[1]) annotation (Line(points={{-66,-41.6667},{-66,-41.6667},
          {-66,-48},{-102,-48},{-102,-60},{-108,-60}}, color={0,0,255}));
  connect(B12.u[1], twoWindingTransformer4.p) annotation (Line(points={{-108,-64},
          {-108,-81},{-114,-81}}, color={0,0,255}));
  connect(twoWindingTransformer4.n, B13.o[1]) annotation (Line(points={{-114,-103},
          {-114,-118},{-120,-118}}, color={0,0,255}));
  connect(B16.o[1], Line11_16.n) annotation (Line(points={{-185.4,-18},{-185.4,
          22},{-143.667,22}}, color={0,0,255}));
  connect(B16.o[2], Line16_19.p) annotation (Line(points={{-198.6,-18},{-198.6,
          22},{-224.333,22}}, color={0,0,255}));
  connect(B19.o[1], Line16_19.n) annotation (Line(points={{-257.4,-12},{-257.4,
          22},{-247.667,22}}, color={0,0,255}));
  connect(Line19_21.n, B19.o[2]) annotation (Line(points={{-284,12.3333},{-268,
          12.3333},{-268,14},{-268,-12},{-270.6,-12}}, color={0,0,255}));
  connect(B21.u[1], Line19_21.p) annotation (Line(points={{-312,50},{-284,50},{
          -284,35.6667}}, color={0,0,255}));
  connect(twoWindingTransformer8.n, B21.o[1]) annotation (Line(points={{-330,85},
          {-328,85},{-328,46},{-316,46},{-316,50}}, color={0,0,255}));
  connect(B22.u[1], twoWindingTransformer8.p) annotation (Line(points={{-286,
          118},{-286,107},{-330,107}}, color={0,0,255}));
  connect(B19.u[1], twoWindingTransformer7.p) annotation (Line(points={{-264,-16},
          {-264,-35},{-292,-35}}, color={0,0,255}));
  connect(B20.o[1], twoWindingTransformer7.n) annotation (Line(points={{-308,-72},
          {-308,-57},{-292,-57}}, color={0,0,255}));
  connect(B16.u[1], Line16_17.n) annotation (Line(points={{-192,-22},{-192,-30},
          {-196,-30},{-196,-32.3333}}, color={0,0,255}));
  connect(B17.o[1], Line16_17.p) annotation (Line(points={{-212,-66},{-212,-55.6667},
          {-196,-55.6667}}, color={0,0,255}));
  connect(B17.u[1], twoWindingTransformer6.p)
    annotation (Line(points={{-212,-70},{-212,-77}}, color={0,0,255}));
  connect(twoWindingTransformer6.n, B18.o[1]) annotation (Line(points={{-212,-99},
          {-218,-99},{-218,-100},{-226,-100},{-226,-112}}, color={0,0,255}));
  connect(B10.o[1], twoWindingTransformer3.n)
    annotation (Line(points={{60,-124},{60,-117},{60,-117}}, color={0,0,255}));
  connect(B9.u[1], twoWindingTransformer3.p)
    annotation (Line(points={{60,-86},{60,-95},{60,-95}}, color={0,0,255}));
  connect(aVR1.vf, syn1.vf) annotation (Line(points={{16.5,-141.4},{22.25,-141.4},
          {22.25,-143},{28,-143}}, color={0,0,127}));
  connect(syn1.v, aVR1.v) annotation (Line(points={{49,-145},{54,-145},{54,-162},
          {-12,-162},{-12,-145},{0,-145}}, color={0,0,127}));
  connect(aVR2.vf, syn2.vf) annotation (Line(points={{-75.5,-135.4},{-69.75,-135.4},
          {-69.75,-137},{-64,-137}}, color={0,0,127}));
  connect(syn2.v, aVR2.v) annotation (Line(points={{-43,-139},{-34,-139},{-34,-154},
          {-100,-154},{-100,-139},{-92,-139}}, color={0,0,127}));
  connect(aVR3.vf, syn3.vf) annotation (Line(points={{-169.5,-139.4},{-163.75,-139.4},
          {-163.75,-141},{-158,-141}}, color={0,0,127}));
  connect(syn3.v, aVR3.v) annotation (Line(points={{-137,-143},{-128,-143},{-128,
          -158},{-194,-158},{-194,-143},{-186,-143}}, color={0,0,127}));
  connect(aVR4.vf, syn4.vf) annotation (Line(points={{-263.5,-131.4},{-257.75,-131.4},
          {-257.75,-133},{-252,-133}}, color={0,0,127}));
  connect(syn4.v, aVR4.v) annotation (Line(points={{-231,-135},{-222,-135},{-222,
          -150},{-288,-150},{-288,-135},{-280,-135}}, color={0,0,127}));
  connect(aVR5.vf, syn5.vf) annotation (Line(points={{-314.6,-127.5},{-314.6,-121.75},
          {-315,-121.75},{-315,-116}}, color={0,0,127}));
  connect(syn5.v, aVR5.v) annotation (Line(points={{-313,-95},{-313,-86},{-324,
          -86},{-324,-150},{-311,-150},{-311,-144}}, color={0,0,127}));
  connect(aVR6.vf, syn6.vf) annotation (Line(points={{-222.5,149.4},{-230,149.4},
          {-230,139},{-240,139}}, color={0,0,127}));
  connect(syn6.v, aVR6.v) annotation (Line(points={{-261,141},{-264,141},{-264,
          132},{-198,132},{-198,153},{-206,153}}, color={0,0,127}));
  connect(syn5.p, B20.u[1]) annotation (Line(points={{-310.05,-95},{-310.05,-86.5},
          {-308,-86.5},{-308,-76}}, color={0,0,255}));
  connect(syn4.p, B18.u[1]) annotation (Line(points={{-231,-137.95},{-226,-137.95},
          {-226,-116}}, color={0,0,255}));
  connect(syn3.p, B13.u[1]) annotation (Line(points={{-137,-145.95},{-120,-145.95},
          {-120,-122}}, color={0,0,255}));
  connect(syn2.p, B8.u[1]) annotation (Line(points={{-43,-141.95},{-38,-141.95},
          {-38,-96}}, color={0,0,255}));
  connect(syn1.p, B10.u[1]) annotation (Line(points={{49,-147.95},{60,-147.95},
          {60,-128}}, color={0,0,255}));
  connect(aVR7.vf, syn7.vf) annotation (Line(points={{23.5,123.4},{16,123.4},{
          16,113},{6,113}}, color={0,0,127}));
  connect(syn7.v, aVR7.v) annotation (Line(points={{-15,115},{-18,115},{-18,106},
          {48,106},{48,127},{40,127}}, color={0,0,127}));
  connect(aVR8.vf, syn8.vf) annotation (Line(points={{347.5,145.4},{340,145.4},
          {340,137},{330,137}}, color={0,0,127}));
  connect(syn8.v, aVR8.v) annotation (Line(points={{309,139},{306,139},{306,128},
          {372,128},{372,149},{364,149}}, color={0,0,127}));
  connect(aVR9.vf, syn9.vf) annotation (Line(points={{369.5,-6.6},{362,-6.6},{
          362,-17},{352,-17}}, color={0,0,127}));
  connect(syn9.v, aVR9.v) annotation (Line(points={{331,-15},{328,-15},{328,-24},
          {394,-24},{394,-3},{386,-3}}, color={0,0,127}));
  connect(syn10.v, aVR10.v) annotation (Line(points={{273,37},{273,42},{298,42},
          {298,-16},{279,-16},{279,-10}}, color={0,0,127}));
  connect(aVR10.vf, syn10.vf) annotation (Line(points={{275.4,6.5},{275.4,12},{
          271,12},{271,16}}, color={0,0,127}));
  connect(syn11.v, aVR11.v) annotation (Line(points={{235,-19},{235,-14},{264,-14},
          {264,-72},{241,-72},{241,-66}}, color={0,0,127}));
  connect(aVR11.vf, syn11.vf) annotation (Line(points={{237.4,-49.5},{237.4,-44},
          {233,-44},{233,-40}}, color={0,0,127}));
  connect(syn6.p, B22.o[1]) annotation (Line(points={{-261,143.95},{-286,143.95},
          {-286,122}}, color={0,0,255}));
  connect(syn7.p, B15.u[1]) annotation (Line(points={{-15,117.95},{-26,117.95},
          {-26,114},{-36,114}}, color={0,0,255}));
  connect(syn8.p, B33.u[1]) annotation (Line(points={{309,141.95},{298,141.95},
          {298,136},{290,136}}, color={0,0,255}));
  connect(syn9.p, B30.u[1]) annotation (Line(points={{331,-12.0496},{322,-12.0496},
          {322,8},{344,8},{344,14}}, color={0,0,255}));
  connect(syn11.p, B25.u[1]) annotation (Line(points={{237.95,-19},{237.95,-12.5},
          {242,-12.5},{242,-6}}, color={0,0,255}));
  connect(syn12.p, B3.u[1]) annotation (Line(points={{293.95,-117},{293.95,-108.5},
          {292,-108.5},{292,-100}}, color={0,0,255}));
  connect(aVR9.vref, const.y) annotation (Line(points={{386,-9.4},{392,-9.4},{
          392,-32},{380.5,-32},{380.5,-33}}, color={0,0,127}));
  connect(syn9.pm0, syn9.pm) annotation (Line(points={{350,-1},{350,0},{356,0},
          {356,-7},{352,-7}}, color={0,0,127}));
  connect(const1.y, aVR10.vref) annotation (Line(points={{273,-19.5},{273,-15.75},
          {272.6,-15.75},{272.6,-10}}, color={0,0,127}));
  connect(syn10.pm0, syn10.pm) annotation (Line(points={{287,18},{290,18},{290,
          12},{281,12},{281,16}}, color={0,0,127}));
  connect(const2.y, aVR11.vref) annotation (Line(points={{222.5,-67},{230,-67},
          {230,-70},{234.6,-70},{234.6,-66}}, color={0,0,127}));
  connect(syn11.pm0, syn11.pm) annotation (Line(points={{249,-38},{254,-38},{
          254,-44},{243,-44},{243,-40}}, color={0,0,127}));
  connect(aVR8.vref, const3.y) annotation (Line(points={{364,142.6},{371,142.6},
          {371,143},{377.5,143}}, color={0,0,127}));
  connect(syn8.pm0, syn8.pm) annotation (Line(points={{328,153},{328,154},{334,
          154},{334,147},{330,147}}, color={0,0,127}));
  connect(syn10.p, B28.u[1]) annotation (Line(points={{275.95,37},{275.95,46},{
          268,46},{268,52}}, color={0,0,255}));
  connect(aVR7.vref, const10.y) annotation (Line(points={{40,120.6},{47,120.6},
          {47,125},{53.5,125}}, color={0,0,127}));
  connect(syn7.pm0, syn7.pm) annotation (Line(points={{4,129},{4,132},{12,132},
          {12,123},{6,123}}, color={0,0,127}));
  connect(aVR6.vref, const9.y) annotation (Line(points={{-206,146.6},{-197,
          146.6},{-197,145},{-188.5,145}}, color={0,0,127}));
  connect(syn6.pm0, syn6.pm) annotation (Line(points={{-242,155},{-242,158},{-236,
          158},{-236,149},{-240,149}}, color={0,0,127}));
  connect(const8.y, aVR5.vref) annotation (Line(points={{-331.5,-155},{-317.4,-155},
          {-317.4,-144}}, color={0,0,127}));
  connect(syn5.pm0, syn5.pm) annotation (Line(points={{-299,-114},{-298,-114},{
          -298,-122},{-305,-122},{-305,-116}}, color={0,0,127}));
  connect(aVR4.vref, const7.y) annotation (Line(points={{-280,-128.6},{-284,-128.6},
          {-284,-130},{-286,-130},{-293.6,-130}}, color={0,0,127}));
  connect(syn4.pm0, syn4.pm) annotation (Line(points={{-250,-149},{-250,-152},{
          -258,-152},{-258,-143},{-252,-143}}, color={0,0,127}));
  connect(const6.y, aVR3.vref) annotation (Line(points={{-199.5,-133},{-194,-133},
          {-194,-136.6},{-186,-136.6}}, color={0,0,127}));
  connect(syn3.pm0, syn3.pm) annotation (Line(points={{-156,-157},{-156,-162},{
          -164,-162},{-164,-151},{-158,-151}}, color={0,0,127}));
  connect(const5.y, aVR2.vref) annotation (Line(points={{-109,-149.5},{-109,-132.6},
          {-92,-132.6}}, color={0,0,127}));
  connect(syn2.pm0, syn2.pm) annotation (Line(points={{-62,-153},{-62,-158},{-68,
          -158},{-68,-147},{-64,-147}}, color={0,0,127}));
  connect(const4.y, aVR1.vref) annotation (Line(points={{-17,-134.5},{-17,-138.6},
          {0,-138.6}}, color={0,0,127}));
  connect(syn1.pm0, syn1.pm) annotation (Line(points={{30,-159},{30,-166},{16,-166},
          {16,-153},{28,-153}}, color={0,0,127}));
  connect(syn12.vf0, syn12.vf) annotation (Line(points={{283,-136},{280,-136},{
          280,-140},{289,-140},{289,-138}}, color={0,0,127}));
  connect(syn12.pm0, syn12.pm) annotation (Line(points={{305,-136},{310,-136},{
          310,-140},{299,-140},{299,-138}}, color={0,0,127}));
  connect(B32.o[2], staticCondenser.p) annotation (Line(points={{214,133.4},{
          175.4,133.4},{175.4,136.12}}, color={0,0,255}));
  connect(B26.u[4], pwFault.p) annotation (Line(points={{90.1,106},{104,106},{
          104,102},{137,102},{137,92}}, color={0,0,255}));
  connect(infiniteBus.p, B1.o[1]) annotation (Line(points={{148.8,-148},{180,-148},
          {180,-152},{206,-152},{206,-134}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-360,-180},{400,180}},
          preserveAspectRatio=false), graphics={Text(
          extent={{132,-90},{132,-80}},
          lineColor={0,0,0},
          textString="B2",
          textStyle={TextStyle.Bold}),Text(
          extent={{244,-144},{244,-134}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B1"),Text(
          extent={{312,-94},{312,-84}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B3"),Text(
          extent={{172,-40},{172,-30}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B4"),Text(
          extent={{140,-4},{140,6}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B5"),Text(
          extent={{10,44},{10,54}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B6"),Text(
          extent={{-72,44},{-72,54}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B11"),Text(
          extent={{24,-52},{24,-42}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B7"),Text(
          extent={{-4,-98},{-4,-88}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B8"),Text(
          extent={{94,-88},{94,-78}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B9"),Text(
          extent={{94,-128},{94,-118}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B10"),Text(
          extent={{-74,-66},{-74,-56}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B12"),Text(
          extent={{-84,-126},{-84,-116}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B13"),Text(
          extent={{-126,88},{-126,98}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B14"),Text(
          extent={{-40,142},{-40,152}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B15"),Text(
          extent={{-152,-22},{-152,-12}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B16"),Text(
          extent={{-178,-72},{-178,-62}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B17"),Text(
          extent={{-192,-118},{-192,-108}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B18"),Text(
          extent={{-316,-18},{-316,-8}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B19"),Text(
          extent={{-298,60},{-298,72}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B21"),Text(
          extent={{-250,112},{-250,122}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B22"),Text(
          extent={{-274,-80},{-274,-70}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B20"),Text(
          extent={{62,58},{62,68}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B23"),Text(
          extent={{60,106},{60,116}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B26"),Text(
          extent={{56,152},{56,162}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B31"),Text(
          extent={{156,38},{156,48}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B24"),Text(
          extent={{214,2},{214,12}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B25"),Text(
          extent={{162,84},{162,94}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B27"),Text(
          extent={{234,56},{234,66}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B28"),Text(
          extent={{342,100},{342,110}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B29"),Text(
          extent={{362,20},{362,30}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B30"),Text(
          extent={{216,166},{216,176}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B32"),Text(
          extent={{288,166},{288,176}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B33")}),
    Icon(coordinateSystem(extent={{-360,-180},{400,180}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p> Namsskogan (Norway) Distribution Grid, Reference: PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>13/04/2016</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: <a href=\"http://www.aia.es/en/energy\">http://www.aia.es/en/energy</a></span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU: <a href=\"http://www.dtu.dk/english\">http://www.dtu.dk/english</a></span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a> </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\">http://mozilla.org/MPL/2.0</a>.</span></p>
</html>"));
end Grid_Model;
