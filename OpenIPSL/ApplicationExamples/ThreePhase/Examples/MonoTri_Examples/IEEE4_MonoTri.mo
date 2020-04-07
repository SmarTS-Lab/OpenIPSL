within ThreePhase.Examples.MonoTri_Examples;
model IEEE4_MonoTri
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(
        visible=true, transformation(
        origin={70,84},
        extent={{-12,-10},{12,10}},
        rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus annotation (Placement(
        visible=true, transformation(
        origin={-90,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpenIPSL.Electrical.Buses.Bus Bus1 annotation (Placement(visible=true,
        transformation(extent={{-78,-10},{-58,10}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine Line1(
    B=0,
    G=0,
    R=0.074563536332,
    X=0.152732235479) annotation (Placement(visible=true, transformation(extent
          ={{-56,-4},{-44,4}}, rotation=0)));
  OpenIPSL.Electrical.Buses.Bus Bus2(V_0=1, angle_0=0) annotation (Placement(
        visible=true, transformation(extent={{-42,-10},{-22,10}}, rotation=0)));
  ThreePhase.Branches.MonoTri.Transformer_MT Transformer(
    B_0=-1.82768503568,
    B_1=-5.2872570055,
    B_2=-5.2872570055,
    Connection=0,
    G_0=0.729734359723,
    G_1=2.58122706441,
    G_2=2.58122706441,
    ModelType=1,
    R=0.166666666667,
    X=1,
    tap=1) annotation (Placement(visible=true, transformation(
        origin={-10,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus3 annotation (Placement(visible=true,
        transformation(
        origin={24,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph Line2(
    Bseraa=-0.3687,
    Bserab=0.1265,
    Bserac=0.0822,
    Bserbb=-0.3821,
    Bserbc=0.1004,
    Bsercc=-0.3559,
    Gseraa=0.1779,
    Gserab=-0.0864,
    Gserac=-0.0312,
    Gserbb=0.1989,
    Gserbc=-0.0529,
    Gsercc=0.1598) annotation (Placement(visible=true, transformation(
        origin={46,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus4 annotation (Placement(visible=true,
        transformation(
        origin={68,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_3Ph Load(
    ModelType=0,
    P_a=1.275,
    P_b=1.800,
    P_c=2.375,
    Q_a=0.790,
    Q_b=0.872,
    Q_c=0.781) annotation (Placement(visible=true, transformation(
        origin={90,0},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  connect(Transformer.C, Bus3.p3) annotation (Line(points={{1,-9},{24,-9},{24,-9},
          {24,-9}}, color={0,0,255}));
  connect(Transformer.B, Bus3.p2)
    annotation (Line(points={{1,0},{24,0},{24,0},{24,0}}, color={0,0,255}));
  connect(Transformer.A, Bus3.p1)
    annotation (Line(points={{1,9},{24,9},{24,9},{24,9}}, color={0,0,255}));
  connect(infiniteBus.p, Bus1.p)
    annotation (Line(points={{-80,0},{-68,0}}, color={0,0,255}));
  connect(Bus4.p3, Load.C) annotation (Line(points={{68,-9},{78,-9},{78,-8.9},{
          79,-8.9}}, color={0,0,255}));
  connect(Bus4.p2, Load.B)
    annotation (Line(points={{68,0},{80,0},{80,0},{79,0}}, color={0,0,255}));
  connect(Bus4.p1, Load.A) annotation (Line(points={{68,9},{80,9},{80,8.9},{79,
          8.9}}, color={0,0,255}));
  connect(Line2.Cout, Bus4.p3) annotation (Line(points={{55.2857,-9},{68,-9},{
          68,-9},{68,-9}}, color={0,0,255}));
  connect(Line2.Bout, Bus4.p2) annotation (Line(points={{55.2857,0},{68,0},{68,
          0},{68,0}}, color={0,0,255}));
  connect(Line2.Aout, Bus4.p1) annotation (Line(points={{55.2857,9},{68,9},{68,
          9},{68,9}}, color={0,0,255}));
  connect(Bus3.p3, Line2.Cin) annotation (Line(points={{24,-9},{38,-9},{38,-9},
          {36.7143,-9}}, color={0,0,255}));
  connect(Bus3.p2, Line2.Bin) annotation (Line(points={{24,0},{38,0},{38,0},{
          36.7143,0}}, color={0,0,255}));
  connect(Bus3.p1, Line2.Ain) annotation (Line(points={{24,9},{36,9},{36,9},{
          36.7143,9}}, color={0,0,255}));
  connect(Line1.n, Bus2.p)
    annotation (Line(points={{-44.6,0},{-32,0}}, color={0,0,255}));
  connect(Transformer.p, Bus2.p)
    annotation (Line(points={{-21,0},{-32,0}}, color={0,0,255}));
  connect(Line1.p, Bus1.p)
    annotation (Line(points={{-55.4,0},{-68,0}}, color={0,0,255}));
  annotation (experiment(
      StartTime=0,
      StopTime=0.1,
      Tolerance=1e-06,
      Interval=0.0002), uses(
      Modelica(version="3.2.1"),
      OpenIPSL(version="1.0.0"),
      ThreePhase(version="1")));
end IEEE4_MonoTri;
