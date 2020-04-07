within OpenIPSL.Examples.Controls.PSSE.ES;
model ESAC2A "SMIB model example of GENROU with Excitation System ESAC2A"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    angle_0=4.04626655578613,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    M_b=100000000,
    P_0=39999952.9123306,
    Q_0=5416571.34890556,
    v_0=1) annotation (Placement(transformation(extent={{-108,-14},{-80,16}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-42,-26})));
  Modelica.Blocks.Sources.Constant const4(k=1000) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-41,-45})));
  Modelica.Blocks.Sources.Constant const5(k=-1000) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-41,-61})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESAC2A eSAC2A(
    V_RMAX=4,
    V_RMIN=-4,
    V_FEMAX=10)
    annotation (Placement(transformation(extent={{-74,-70},{-144,-24}})));
equation
  connect(eSAC2A.EFD0, gENROU.EFD0) annotation (Line(
      points={{-74,-61.0556},{-60,-61.0556},{-60,-6.5},{-78.6,-6.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, eSAC2A.VOTHSG) annotation (Line(
      points={{-46.4,-26},{-63.25,-26},{-63.25,-32.9444},{-74,-32.9444}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, eSAC2A.XADIFD) annotation (Line(
      points={{-78.88,-12.5},{-56,-12.5},{-56,-53.3889},{-74,-53.3889}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.VOEL, const4.y) annotation (Line(
      points={{-96.75,-70},{-58.6875,-70},{-58.6875,-45},{-46.5,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, eSAC2A.VUEL) annotation (Line(
      points={{-46.5,-61},{-54,-61},{-54,-70},{-86.25,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.ECOMP, gENROU.ETERM) annotation (Line(points={{-74,-44.4444},
          {-72,-44.4444},{-72,-44},{-68,-44},{-68,-3.5},{-78.6,-3.5}}, color={0,
          0,127}));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-78.6,8.5},{-74,8.5},{-74,20},{-110,20},{-110,8.5},{-110.8,8.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.EFD, gENROU.EFD) annotation (Line(points={{-145.75,-44.4444},
          {-150,-44.4444},{-150,-6.5},{-110.8,-6.5}}, color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-80,1},{-58.3,1},{-58.3,
          0},{-40,0}}, color={0,0,255}));
  annotation (
experiment(StopTime=10));
end ESAC2A;
