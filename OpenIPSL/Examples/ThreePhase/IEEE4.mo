within OpenIPSL.Examples.ThreePhase;
model IEEE4 "Initial conditions (power-flow) calculation of IEEE4 bus system, in full three-phase formulation"
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(
        transformation(
        origin={70,84},
        extent={{-12,-10},{12,10}})));
  Electrical.ThreePhase.Buses.InfiniteBus InfiniteBus annotation (Placement(
        transformation(
        origin={-88,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Buses.Bus_3Ph Bus1
    annotation (Placement(transformation(
        origin={-66,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Branches.Lines.Line_3Ph Line1(
    Bseraa=-3.9929,
    Bserab=1.5824,
    Bserac=1.0891,
    Bserbb=-4.1181,
    Bserbc=1.3055,
    Bsercc=-3.8154,
    Gseraa=1.8794,
    Gserab=-1.1096,
    Gserac=-0.5004,
    Gserbb=2.0690,
    Gserbc=-0.7714,
    Gsercc=1.6050) annotation (Placement(transformation(
        origin={-44,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Buses.Bus_3Ph Bus2
    annotation (Placement(transformation(
        origin={-22,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Buses.Bus_3Ph Bus3(
    angle_A=-30,
    angle_B=-150,
    angle_C=90) annotation (Placement(transformation(
        origin={24,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Branches.Lines.Line_3Ph Line2(
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
    Gsercc=0.1598) annotation (Placement(transformation(
        origin={46,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Buses.Bus_3Ph Bus4(
    angle_A=-30,
    angle_B=-150,
    angle_C=90) annotation (Placement(transformation(
        origin={68,0},
        extent={{-10,-10},{10,10}})));
  Electrical.ThreePhase.Loads.WyeLoad_3Ph Load(
    AngA=0,
    ModelType=0,
    P_a=1275000,
    Q_a=790000,
    P_b=1800000,
    Q_b=872000,
    P_c=2375000,
    Q_c=781000) annotation (Placement(transformation(
        origin={90,0},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Electrical.ThreePhase.Branches.Transformer.Transformer_3Ph Trafo(
    Connection=0,
    R=0.16666667,
    X=1,
    tap=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}})));
equation
  connect(Trafo.Cout, Bus3.p3) annotation (Line(points={{9,-9},{24,-9},{24,-9},
          {24,-9}}, color={0,0,255}));
  connect(Trafo.Bout, Bus3.p2)
    annotation (Line(points={{9,0},{24,0},{24,0},{24,0}}, color={0,0,255}));
  connect(Trafo.Aout, Bus3.p1)
    annotation (Line(points={{9,9},{24,9},{24,9},{24,9}}, color={0,0,255}));
  connect(Bus2.p3, Trafo.Cin) annotation (Line(points={{-22,-9},{-8,-9},{-8,-9},
          {-9,-9}}, color={0,0,255}));
  connect(Bus2.p2, Trafo.Bin) annotation (Line(points={{-22,0},{-10,0},{-10,0},
          {-9,0}}, color={0,0,255}));
  connect(Bus2.p1, Trafo.Ain)
    annotation (Line(points={{-22,9},{-8,9},{-8,9},{-9,9}}, color={0,0,255}));
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
  connect(Line1.Cout, Bus2.p3) annotation (Line(points={{-34.7143,-9},{-22,-9},
          {-22,-9},{-22,-9}}, color={0,0,255}));
  connect(Line1.Bout, Bus2.p2) annotation (Line(points={{-34.7143,0},{-22,0},{
          -22,0},{-22,0}},
                       color={0,0,255}));
  connect(Line1.Aout, Bus2.p1) annotation (Line(points={{-34.7143,9},{-22,9},{
          -22,9},{-22,9}},
                       color={0,0,255}));
  connect(Bus1.p3, Line1.Cin) annotation (Line(points={{-66,-9},{-54,-9},{-54,
          -9},{-53.2857,-9}},
                          color={0,0,255}));
  connect(Bus1.p2, Line1.Bin) annotation (Line(points={{-66,0},{-54,0},{-54,0},
          {-53.2857,0}}, color={0,0,255}));
  connect(Bus1.p1, Line1.Ain) annotation (Line(points={{-66,9},{-54,9},{-54,9},
          {-53.2857,9}}, color={0,0,255}));
  connect(InfiniteBus.p3, Bus1.p3) annotation (Line(points={{-79,-9},{-66,-9},{
          -66,-9},{-66,-9}}, color={0,0,255}));
  connect(InfiniteBus.p2, Bus1.p2) annotation (Line(points={{-79,0},{-66,0},{-66,
          0},{-66,0}}, color={0,0,255}));
  connect(InfiniteBus.p1, Bus1.p1) annotation (Line(points={{-79,9},{-66,9},{-66,
          9},{-66,9}}, color={0,0,255}));
  annotation (experiment(
      StartTime=0,
      StopTime=0.1,
      Tolerance=1e-06,
      Interval=0.0002),
      Documentation(info="<html>
<p>This test system aims to show how a very small three-phase system should be assembled for simulation.
 Its results should be compared to the example IEEE4_MonoTri, in order to show what to expect from the hybrid transformer.
 Here, all buses are modeled as three-phase buses.</p>
<p>This example is not a dynamic system, and therefore the voltages and angles from all buses are static during the simulation.
The simulation just calculates the initialization variables, which are the solution for the three-phase power flow.
The results can be verified against any tool that calculates a three-phase power-flow.</p>
</html>"));
end IEEE4;
