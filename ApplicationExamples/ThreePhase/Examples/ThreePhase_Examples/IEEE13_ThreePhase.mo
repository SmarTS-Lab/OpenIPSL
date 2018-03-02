within ThreePhase.Examples.ThreePhase_Examples;
model IEEE13_ThreePhase
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(
        visible=true, transformation(
        origin={470,282},
        extent={{-12,-10},{12,10}},
        rotation=0)));
  ThreePhase.Buses.InfiniteBus InfBus(
    P_A=1,
    P_B=1,
    P_C=1,
    Q_A=0,
    Q_B=0,
    Q_C=0,
    V_A=1.0625,
    V_B=1.05,
    V_C=1.0687,
    angle_A=0,
    angle_B=-120,
    angle_C=120) annotation (Placement(visible=true, transformation(
        origin={38,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus632 annotation (Placement(visible=true,
        transformation(
        origin={148,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus671 annotation (Placement(visible=true,
        transformation(
        origin={364,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph L632_671(
    Bseraa=-0.5712,
    Bserab=0.2112,
    Bserac=0.1579,
    Bserbb=-0.5413,
    Bserbc=0.1206,
    Bsercc=-0.5106,
    Gseraa=0.1982,
    Gserab=-0.0841,
    Gserac=-0.0460,
    Gserbb=0.1735,
    Gserbc=-0.0219,
    Gsercc=0.1535) annotation (Placement(visible=true, transformation(
        origin={272,88},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus633 annotation (Placement(visible=true,
        transformation(
        origin={204,192},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Lines.Line_3Ph L632_633(
    Bseraa=-1.2346,
    Bserab=0.2606,
    Bserac=0.2925,
    Bserbb=-1.2224,
    Bserbc=0.2392,
    Bsercc=-1.2262,
    Gseraa=0.9630,
    Gserab=-0.2587,
    Gserac=-0.3702,
    Gserbb=0.8495,
    Gserbc=-0.1883,
    Gsercc=0.8980) annotation (Placement(visible=true, transformation(
        origin={204,144},
        extent={{-14,-10},{14,10}},
        rotation=90)));
  ThreePhase.Loads.WyeLoad_3Ph SpotLoad634(
    ModelType=0,
    P_a=0.160,
    P_b=0.120,
    P_c=0.12,
    Q_a=0.110,
    Q_b=0.09,
    Q_c=0.09) annotation (Placement(visible=true, transformation(
        origin={204,268},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThreePhase.Buses.Bus_3Ph Bus675 annotation (Placement(visible=true,
        transformation(
        origin={382,210},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Lines.Line_3Ph L692_675(
    Bseraa=-1.3443,
    Bserab=0.5197,
    Bserac=0.4255,
    Bserbb=-1.4001,
    Bserbc=0.5197,
    Bsercc=-1.3443,
    Gseraa=1.7857,
    Gserab=-0.4189,
    Gserac=-0.1865,
    Gserbb=1.9810,
    Gserbc=-0.4189,
    Gsercc=1.7857) annotation (Placement(visible=true, transformation(
        origin={382,184},
        extent={{-14,-10},{14,10}},
        rotation=90)));
  ThreePhase.Loads.WyeLoad_3Ph SpotLoad675(
    ModelType=0,
    P_a=0.485,
    P_b=0.068,
    P_c=0.290,
    Q_a=0.19,
    Q_b=0.06,
    Q_c=0.212) annotation (Placement(visible=true, transformation(
        origin={382,256},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThreePhase.Loads.WyeLoad_3Ph DistLoad671(
    ModelType=0,
    P_a=0.0085,
    P_b=0.033,
    P_c=0.0585,
    Q_a=0.005,
    Q_b=0.019,
    Q_c=0.034) annotation (Placement(visible=true, transformation(
        origin={310,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_3Ph DisLoad632(
    ModelType=0,
    P_a=0.0085,
    P_b=0.033,
    P_c=0.0585,
    Q_a=0.005,
    Q_b=0.019,
    Q_c=0.034) annotation (Placement(visible=true, transformation(
        origin={226,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Banks.CapacitorBank_3Ph CapBank675(
    Q_a=0.2,
    Q_b=0.2,
    Q_c=0.2) annotation (Placement(visible=true, transformation(
        origin={420,226},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Buses.Bus_3Ph Bus634 annotation (Placement(visible=true,
        transformation(
        origin={204,238},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Transformer.Transformer_3Ph XFM1(
    Connection=0,
    R=2.2,
    X=4,
    tap=1) annotation (Placement(visible=true, transformation(
        origin={204,216},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  OpenIPSL.Electrical.Events.Breaker breaker annotation (Placement(visible=true,
        transformation(
        origin={374,116},
        extent={{-4,-4},{4,4}},
        rotation=90)));
  OpenIPSL.Electrical.Events.Breaker breaker2 annotation (Placement(visible=
          true, transformation(
        origin={382,122},
        extent={{-4,-4},{4,4}},
        rotation=90)));
  OpenIPSL.Electrical.Events.Breaker breaker3 annotation (Placement(visible=
          true, transformation(
        origin={390,116},
        extent={{-4,-4},{4,4}},
        rotation=90)));
  ThreePhase.Buses.Bus_3Ph Bus692 annotation (Placement(visible=true,
        transformation(
        origin={382,138},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Lines.Line_2Ph L632_645(
    Bseraa=-0.69,
    Bserab=0.1038,
    Bserbb=-0.6931,
    Gseraa=0.7502,
    Gserab=-0.25,
    Gserbb=0.7450) annotation (Placement(visible=true, transformation(
        origin={166,48},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Buses.Bus_2Ph Bus645(
    V_1=1,
    V_2=1,
    angle_1=-120,
    angle_2=120) annotation (Placement(visible=true, transformation(
        origin={166,16},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_2Ph L645_646(
    Bseraa=-1.1499,
    Bserab=0.1729,
    Bserbb=-1.1552,
    Gseraa=1.2503,
    Gserab=-0.4167,
    Gserbb=1.2417) annotation (Placement(visible=true, transformation(
        origin={166,-20},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Buses.Bus_2Ph Bus646(
    V_1=1,
    V_2=1,
    angle_1=-120,
    angle_2=120) annotation (Placement(visible=true, transformation(
        origin={166,-62},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Loads.WyeLoad_1Ph SpotLoad645(
    AngA=-120,
    P_a=0.17,
    Q_a=0.125,
    VA=1) annotation (Placement(visible=true, transformation(
        origin={200,6},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Buses.Bus_3Ph Bus680 annotation (Placement(visible=true,
        transformation(
        origin={456,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph L671_680(
    Bseraa=-1.1424,
    Bserab=0.4224,
    Bserac=0.3157,
    Bserbb=-1.0825,
    Bserbc=0.2411,
    Bsercc=-1.0212,
    Gseraa=0.3963,
    Gserab=-0.1682,
    Gserac=-0.0921,
    Gserbb=0.3471,
    Gserbc=-0.0437,
    Gsercc=0.3069) annotation (Placement(visible=true, transformation(
        origin={422,88},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_2Ph Bus684(angle_2=120) annotation (Placement(visible=
          true, transformation(
        origin={390,12},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_2Ph L671_684(
    Bseraa=-1.1552,
    Bserab=0.1729,
    Bserbb=-1.1499,
    Gseraa=1.2417,
    Gserab=-0.4167,
    Gserbb=1.2503) annotation (Placement(visible=true, transformation(
        origin={390,44},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_1Ph L684_652(Bser=-0.2834, Gser=0.7426)
    annotation (Placement(visible=true, transformation(
        origin={422,-10},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_1Ph Bus652 annotation (Placement(visible=true,
        transformation(
        origin={454,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_1Ph SpotLoad652(
    C_pa=100,
    ModelType=1,
    P_a=0.128,
    Q_a=0.086) annotation (Placement(visible=true, transformation(
        origin={484,-10},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Buses.Bus_1Ph Bus611(angle_1=120) annotation (Placement(visible=
          true, transformation(
        origin={386,-62},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_1Ph L684_611(Bser=-1.1456, Gser=1.1301)
    annotation (Placement(visible=true, transformation(
        origin={386,-32},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Loads.WyeLoad_1Ph SpotLoad611(
    AngA=120,
    B_pa=100,
    ModelType=1,
    P_a=0.17,
    Q_a=0.08) annotation (Placement(visible=true, transformation(
        origin={386,-88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Banks.CapacitorBank_1Ph CapacitorBank611(AngA=120, Q_a=0.1)
    annotation (Placement(visible=true, transformation(
        origin={420,-78},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph LRG60_632(
    Bseraa=-0.5712,
    Bserab=0.2112,
    Bserac=0.1579,
    Bserbb=-0.5413,
    Bserbc=0.1206,
    Bsercc=-0.5106,
    Gseraa=0.1982,
    Gserab=-0.0841,
    Gserac=-0.046,
    Gserbb=0.1735,
    Gserbc=-0.0219,
    Gsercc=0.1535) annotation (Placement(visible=true, transformation(
        origin={114,88},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph BusRG60(
    V_A=1.0625,
    V_B=1.05,
    V_C=1.0687) annotation (Placement(visible=true, transformation(
        origin={76,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.DeltaLoad_3Ph SpotLoad671(
    P_ab=0.385,
    P_bc=0.385,
    P_ca=0.385,
    Q_ab=0.22,
    Q_bc=0.22,
    Q_ca=0.22) annotation (Placement(visible=true, transformation(
        origin={344,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.DeltaLoad_2Ph SpotLoad692(
    AngA=120,
    AngB=0,
    B_ab=100,
    ModelType=1,
    P_ab=0.17,
    Q_ab=0.151,
    VA=1,
    VB=1) annotation (Placement(visible=true, transformation(
        origin={420,154},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Loads.DeltaLoad_2Ph SpotLoad646(
    AngA=-120,
    AngB=120,
    C_ab=100,
    ModelType=1,
    P_ab=0.23,
    Q_ab=0.132) annotation (Placement(visible=true, transformation(
        origin={166,-88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(Bus646.p2, SpotLoad646.B) annotation (Line(points={{161.5,-62},{162,-62},
          {162,-77},{161.5,-77}}, color={0,0,255}));
  connect(Bus646.p1, SpotLoad646.A) annotation (Line(points={{170.5,-62},{170,-62},
          {170,-77},{170.5,-77}}, color={0,0,255}));
  connect(SpotLoad692.B, Bus692.p1) annotation (Line(points={{409,149.5},{372,
          149.5},{372,138},{373,138}}, color={0,0,255}));
  connect(SpotLoad692.A, Bus692.p3) annotation (Line(points={{409,158.5},{392,
          158.5},{392,138},{391,138}}, color={0,0,255}));
  connect(Bus671.p3, SpotLoad671.C) annotation (Line(points={{364,79},{336,79},
          {336,61},{335.1,61}}, color={0,0,255}));
  connect(Bus671.p2, SpotLoad671.B) annotation (Line(points={{364,88},{344,88},
          {344,61},{344,61}}, color={0,0,255}));
  connect(Bus671.p1, SpotLoad671.A) annotation (Line(points={{364,97},{352,97},
          {352,61},{352.9,61}}, color={0,0,255}));
  connect(InfBus.p3, BusRG60.p3) annotation (Line(points={{47,79},{76,79},{76,
          79},{76,79}}, color={0,0,255}));
  connect(InfBus.p2, BusRG60.p2) annotation (Line(points={{47,88},{76,88},{76,
          88},{76,88}}, color={0,0,255}));
  connect(InfBus.p1, BusRG60.p1) annotation (Line(points={{47,97},{76,97},{76,
          97},{76,97}}, color={0,0,255}));
  connect(BusRG60.p3, LRG60_632.Cin) annotation (Line(points={{76,79},{102,79},
          {102,79},{101,79}}, color={0,0,255}));
  connect(BusRG60.p2, LRG60_632.Bin) annotation (Line(points={{76,88},{102,88},
          {102,88},{101,88}}, color={0,0,255}));
  connect(BusRG60.p1, LRG60_632.Ain) annotation (Line(points={{76,97},{102,97},
          {102,97},{101,97}}, color={0,0,255}));
  connect(LRG60_632.Cout, Bus632.p3) annotation (Line(points={{127,79},{148,79},
          {148,79},{148,79}}, color={0,0,255}));
  connect(LRG60_632.Bout, Bus632.p2) annotation (Line(points={{127,88},{148,88},
          {148,88},{148,88}}, color={0,0,255}));
  connect(LRG60_632.Aout, Bus632.p1) annotation (Line(points={{127,97},{148,97},
          {148,97},{148,97}}, color={0,0,255}));
  connect(Bus632.p2, L632_633.Bin)
    annotation (Line(points={{148,88},{204,88},{204,131}}, color={0,0,255}));
  connect(Bus632.p3, L632_633.Cin)
    annotation (Line(points={{148,79},{213,79},{213,131}}, color={0,0,255}));
  connect(Bus632.p1, L632_633.Ain)
    annotation (Line(points={{148,97},{195,97},{195,131}}, color={0,0,255}));
  connect(Bus632.p1, L632_671.Ain)
    annotation (Line(points={{148,97},{259,97}}, color={0,0,255}));
  connect(Bus632.p3, L632_671.Cin)
    annotation (Line(points={{148,79},{259,79}}, color={0,0,255}));
  connect(Bus632.p2, L632_671.Bin)
    annotation (Line(points={{148,88},{259,88}}, color={0,0,255}));
  connect(Bus632.p3, DisLoad632.C) annotation (Line(points={{148,79},{217.1,79},
          {217.1,61}}, color={0,0,255}));
  connect(Bus632.p2, DisLoad632.B)
    annotation (Line(points={{148,88},{226,88},{226,61}}, color={0,0,255}));
  connect(Bus632.p1, DisLoad632.A) annotation (Line(points={{148,97},{236,97},{
          236,61},{234.9,61}}, color={0,0,255}));
  connect(Bus632.p2, L632_645.Ain) annotation (Line(points={{148,88},{170.5,88},
          {170.5,61}}, color={0,0,255}));
  connect(Bus632.p3, L632_645.Bin) annotation (Line(points={{148,79},{161.5,79},
          {161.5,61}}, color={0,0,255}));
  connect(Bus611.p1, CapacitorBank611.A) annotation (Line(points={{386,-62},{
          420,-62},{420,-67},{420,-67}}, color={0,0,255}));
  connect(SpotLoad611.A, Bus611.p1) annotation (Line(points={{386,-77},{386,-77},
          {386,-62},{386,-62}}, color={0,0,255}));
  connect(Bus684.p2, L684_611.Ain) annotation (Line(points={{385.5,12},{386,12},
          {386,-19},{386,-19}}, color={0,0,255}));
  connect(Bus611.p1, L684_611.Aout) annotation (Line(points={{386,-62},{386,-62},
          {386,-45},{386,-45}}, color={0,0,255}));
  connect(Bus652.p1, SpotLoad652.A) annotation (Line(points={{454,-10},{474,-10},
          {474,-10},{473,-10}}, color={0,0,255}));
  connect(L684_652.Aout, Bus652.p1) annotation (Line(points={{435,-10},{454,-10},
          {454,-10},{454,-10}}, color={0,0,255}));
  connect(L684_652.Ain, Bus684.p1) annotation (Line(points={{409,-10},{394,-10},
          {394,12},{394.5,12}}, color={0,0,255}));
  connect(L671_684.Bout, Bus684.p2) annotation (Line(points={{385.5,31},{385.5,
          31},{385.5,12},{385.5,12}}, color={0,0,255}));
  connect(L671_684.Aout, Bus684.p1) annotation (Line(points={{394.5,31},{394.5,
          31},{394.5,12},{394.5,12}}, color={0,0,255}));
  connect(Bus671.p3, L671_684.Bin) annotation (Line(points={{364,79},{386,79},{
          386,57},{385.5,57}}, color={0,0,255}));
  connect(Bus671.p1, L671_684.Ain) annotation (Line(points={{364,97},{394,97},{
          394,57},{394.5,57}}, color={0,0,255}));
  connect(L671_680.Cout, Bus680.p3) annotation (Line(points={{435,79},{456,79},
          {456,79},{456,79}}, color={0,0,255}));
  connect(L671_680.Bout, Bus680.p2) annotation (Line(points={{435,88},{456,88},
          {456,88},{456,88}}, color={0,0,255}));
  connect(L671_680.Aout, Bus680.p1) annotation (Line(points={{435,97},{456,97},
          {456,97},{456,97}}, color={0,0,255}));
  connect(Bus671.p3, L671_680.Cin) annotation (Line(points={{364,79},{408,79},{
          408,79},{409,79}}, color={0,0,255}));
  connect(Bus671.p2, L671_680.Bin) annotation (Line(points={{364,88},{408,88},{
          408,88},{409,88}}, color={0,0,255}));
  connect(Bus671.p1, L671_680.Ain) annotation (Line(points={{364,97},{408,97},{
          408,97},{409,97}}, color={0,0,255}));
  connect(Bus645.p1, SpotLoad645.A) annotation (Line(points={{170.5,16},{172,16},
          {172,6},{189,6},{189,6}}, color={0,0,255}));
  connect(L645_646.Bout, Bus646.p2) annotation (Line(points={{161.5,-33},{161.5,
          -33},{161.5,-62},{161.5,-62}}, color={0,0,255}));
  connect(L645_646.Aout, Bus646.p1) annotation (Line(points={{170.5,-33},{170.5,
          -33},{170.5,-62},{170.5,-62}}, color={0,0,255}));
  connect(Bus645.p2, L645_646.Bin) annotation (Line(points={{161.5,16},{162,16},
          {162,-7},{161.5,-7}}, color={0,0,255}));
  connect(Bus645.p1, L645_646.Ain) annotation (Line(points={{170.5,16},{170,16},
          {170,-7},{170.5,-7}}, color={0,0,255}));
  connect(L632_645.Bout, Bus645.p2) annotation (Line(points={{161.5,35},{161.5,
          35},{161.5,16},{161.5,16}}, color={0,0,255}));
  connect(L632_645.Aout, Bus645.p1) annotation (Line(points={{170.5,35},{170.5,
          35},{170.5,16},{170.5,16}}, color={0,0,255}));
  connect(Bus692.p3, L692_675.Cin) annotation (Line(points={{391,138},{391,145},
          {391,145},{391,171}}, color={0,0,255}));
  connect(Bus692.p2, L692_675.Bin)
    annotation (Line(points={{382,138},{382,171}}, color={0,0,255}));
  connect(L692_675.Ain, Bus692.p1)
    annotation (Line(points={{373,171},{373,171},{373,138}}, color={0,0,255}));
  connect(L692_675.Bout, Bus675.p2)
    annotation (Line(points={{382,197},{382,210}}, color={0,0,255}));
  connect(Bus675.p1, L692_675.Aout)
    annotation (Line(points={{373,210},{373,197}}, color={0,0,255}));
  connect(Bus675.p3, L692_675.Cout)
    annotation (Line(points={{391,210},{391,197}}, color={0,0,255}));
  connect(Bus671.p3, breaker3.s) annotation (Line(points={{364,79},{390,79},{
          390,111},{390,111}}, color={0,0,255}));
  connect(Bus671.p2, breaker2.s) annotation (Line(points={{364,88},{382,88},{
          382,117},{382,117}}, color={0,0,255}));
  connect(Bus671.p1, breaker.s) annotation (Line(points={{364,97},{374,97},{374,
          111},{374,111}}, color={0,0,255}));
  connect(breaker3.r, Bus692.p3) annotation (Line(points={{390,121},{390,121},{
          390,138},{391,138}}, color={0,0,255}));
  connect(breaker2.r, Bus692.p2) annotation (Line(points={{382,127},{382,127},{
          382,138},{382,138}}, color={0,0,255}));
  connect(breaker.r, Bus692.p1) annotation (Line(points={{374,121},{374,121},{
          374,138},{373,138}}, color={0,0,255}));
  connect(Bus671.p3, DistLoad671.C) annotation (Line(points={{364,79},{302,79},
          {302,61},{301.1,61}}, color={0,0,255}));
  connect(Bus671.p2, DistLoad671.B) annotation (Line(points={{364,88},{310,88},
          {310,61},{310,61}}, color={0,0,255}));
  connect(Bus671.p1, DistLoad671.A) annotation (Line(points={{364,97},{320,97},
          {320,61},{318.9,61}}, color={0,0,255}));
  connect(CapBank675.A, Bus675.p1) annotation (Line(points={{409,234.9},{374,
          234.9},{374,210},{373,210}}, color={0,0,255}));
  connect(Bus675.p2, CapBank675.B) annotation (Line(points={{382,210},{382,210},
          {382,226},{409,226},{409,226}}, color={0,0,255}));
  connect(Bus675.p3, CapBank675.C) annotation (Line(points={{391,210},{390,210},
          {390,217.1},{409,217.1}}, color={0,0,255}));
  connect(SpotLoad675.C, Bus675.p3) annotation (Line(points={{390.9,245},{390.9,
          228},{391,228},{391,210}}, color={0,0,255}));
  connect(SpotLoad675.B, Bus675.p2)
    annotation (Line(points={{382,245},{382,210}}, color={0,0,255}));
  connect(SpotLoad675.A, Bus675.p1) annotation (Line(points={{373.1,245},{372.1,
          245},{372.1,210},{373,210}}, color={0,0,255}));
  connect(L632_671.Aout, Bus671.p1)
    annotation (Line(points={{285,97},{364,97}}, color={0,0,255}));
  connect(L632_671.Bout, Bus671.p2)
    annotation (Line(points={{285,88},{364,88}}, color={0,0,255}));
  connect(L632_671.Cout, Bus671.p3)
    annotation (Line(points={{285,79},{364,79}}, color={0,0,255}));
  connect(SpotLoad634.C, Bus634.p3) annotation (Line(points={{212.9,257},{214,
          257},{214,238},{213,238}}, color={0,0,255}));
  connect(SpotLoad634.B, Bus634.p2) annotation (Line(points={{204,257},{204,257},
          {204,238},{204,238}}, color={0,0,255}));
  connect(Bus634.p1, SpotLoad634.A) annotation (Line(points={{195,238},{194,238},
          {194,257},{195.1,257}}, color={0,0,255}));
  connect(XFM1.Cout, Bus634.p3) annotation (Line(points={{213,225},{213,225},{
          213,238},{213,238}}, color={0,0,255}));
  connect(XFM1.Bout, Bus634.p2) annotation (Line(points={{204,225},{204,225},{
          204,238},{204,238}}, color={0,0,255}));
  connect(XFM1.Aout, Bus634.p1) annotation (Line(points={{195,225},{195,225},{
          195,238},{195,238}}, color={0,0,255}));
  connect(XFM1.Cin, Bus633.p3) annotation (Line(points={{213,207},{213,207},{
          213,192},{213,192}}, color={0,0,255}));
  connect(XFM1.Bin, Bus633.p2) annotation (Line(points={{204,207},{204,207},{
          204,192},{204,192}}, color={0,0,255}));
  connect(XFM1.Ain, Bus633.p1) annotation (Line(points={{195,207},{195,207},{
          195,192},{195,192}}, color={0,0,255}));
  connect(L632_633.Cout, Bus633.p3) annotation (Line(points={{213,157},{213,157},
          {213,192},{213,192}}, color={0,0,255}));
  connect(L632_633.Aout, Bus633.p1)
    annotation (Line(points={{195,157},{195,192}}, color={0,0,255}));
  connect(L632_633.Bout, Bus633.p2)
    annotation (Line(points={{204,157},{204,192}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{500,300}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    version="",
    uses(OpenIPSL(version="1.0.0"), ThreePhase(version="1")),
    __OpenModelica_commandLineOptions="",
    experiment(
      StartTime=0,
      StopTime=10,
      Tolerance=1e-06,
      Interval=0.001));
end IEEE13_ThreePhase;
