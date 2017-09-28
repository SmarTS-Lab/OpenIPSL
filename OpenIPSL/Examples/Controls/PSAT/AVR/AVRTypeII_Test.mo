within OpenIPSL.Examples.Controls.PSAT.AVR;
model AVRTypeII_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={122.283,26},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=12,
    t2=12.1) annotation (Placement(visible=true, transformation(
        origin={79,16},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={79,31},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={84,-19},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={124,-19},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={44,26},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={44,-4},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Events.PwFaultPQ pwFault(
    X=0.001,
    t1=3,
    t2=3.1,
    R=0.2) annotation (Placement(transformation(extent={{115,-52},{135,-32}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6Type2_Inputs_Outputs(
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    V_b=200,
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0) annotation (Placement(transformation(extent={{-68,-12},{12,66}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=1)
    annotation (Placement(transformation(extent={{52,88},{32,108}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(
    vref0=1,
    vrmin=-5,
    vrmax=5,
    Ta=0.1,
    Te=1,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    Kf=0.45,
    Tf=1,
    Ka=400,
    vf0=1.064,
    Ke=0.01) annotation (Placement(transformation(extent={{4,58},{-58,110}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{100,80},{124,100}})));
equation
  connect(pwLine4.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={101.213,29},
      points={{-10.5463,2},{3.0708,2},{3.0708,8},{21.07,8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={86,23.5},
      points={{0,-7.5},{0,7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={72,23.5},
      points={{0,7.5},{0,-7.5}}));
  connect(pwLine3.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={107.5,-18.5},
      points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      points={{55.6667,26},{64,26},{64,31},{67.3333,31}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      points={{55.6667,-4},{64,-4},{64,-19},{72.3333,-19}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, pwLine1.n) annotation (Line(
      points={{55.6667,26},{55.6667,20},{56,20},{56,12},{55.6667,12},{55.6667,-4}},

      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine3.n) annotation (Line(
      points={{113.333,-42},{104,-42},{104,-19},{95.6667,-19}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order6Type2_Inputs_Outputs.p, pwLine2.p) annotation (Line(
      points={{16,27.1936},{27,27.1936},{27,26},{32.3333,26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, pwLine2.p) annotation (Line(
      points={{32.3333,-4},{32.3333,4},{32,4},{32,12},{32.3333,12},{32.3333,26}},

      color={0,0,255},
      smooth=Smooth.None));
  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm)
    annotation (Line(
      points={{-60,-15.9},{38,-15.9},{38,52},{60,52},{60,112},{-92,112},{-92,
          7.5},{-68,7.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order6Type2_Inputs_Outputs.v, exciter_Type_II.v) annotation (Line(
      points={{16,38.7},{32,38.7},{32,81.4},{-2.2,81.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exciter_Type_II.vf, order6Type2_Inputs_Outputs.vf) annotation (Line(
      points={{-53.35,90.76},{-68,90.76},{-68,46.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exciter_Type_II.vref, imSetPoint.y) annotation (Line(points={{-2.2,
          98.04},{14.9,98.04},{14.9,98},{31,98}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{140,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{140,120}})),
    Documentation);
end AVRTypeII_Test;
