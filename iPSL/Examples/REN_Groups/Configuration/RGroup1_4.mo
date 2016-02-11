within iPSL.Examples.REN_Groups.Configuration;
model RGroup1_4 "Machine configuration of synchronous machine with regulators: GENSAL, HYGOV, ESAC1A;
  from REN model: Buses XXX
  Configuration from Bus 79724
  Exciter reg_esac1a_8d802c92_f9a2_11e4_b5b1_78acc0ae2875
  Hygov reg_hygov_8d802c92_f9a2_11e4_b5b1_78acc0ae2875"
  //NOTES
  //ESAC1A if00 and vf00 addes just to check
  //Checked ok
  //Simulation error: The following parameter doesn't have any value:
  //eSAC1A.imLimited_min.Ymax
  //In ESAC1A model  imLimited_min(Ymin=1e-6) hasn't Ymax value
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    Tpd0=2.6,
    Tppd0=0.019,
    Tppq0=0.02,
    H=2.37,
    D=1.0,
    Xd=1.12,
    Xq=0.71,
    Xpd=0.39,
    Xppd=0.29,
    Xppq=0.29,
    Xl=0.17,
    S10=0.11,
    S12=0.4,
    V_0=1,
    M_b=41.30869412998648,
    angle_0=-0.1014632,
    P_0=5,
    Q_0=17.88221) annotation (Placement(transformation(extent={{-80,-28},{-28,26}})));
  // Mbase has been changed: Mbase > SQRT(P^2 + Q^2)
  iPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.05,
    r=0.2,
    T_r=1.6,
    T_f=0.05,
    T_g=0.5,
    VELM=0.167,
    G_MAX=0.98,
    G_MIN=0.0,
    T_w=0.4,
    A_t=1.2,
    D_turb=0.5,
    q_NL=0.08) annotation (Placement(transformation(extent={{-128,0},{-76,28}})));
  iPSL.Electrical.Controls.PSSE.ES.ESAC1A.ESAC1A eSAC1A(
    V0=1,
    T_R=0.04,
    T_B=1.0,
    T_C=1.0,
    K_A=75.0,
    T_A=0.05,
    V_AMAX=5.0,
    V_AMIN=-5.0,
    T_E=0.5,
    K_F=0.07,
    T_F=1.0,
    K_C=0.38,
    K_D=0.2,
    K_E=1.0,
    E_1=2.47,
    S_EE_1=0.035,
    E_2=4.5,
    S_EE_2=0.47,
    V_RMAX=4.0,
    V_RMIN=-4.0) annotation (Placement(transformation(extent={{-114,-26},{-80,0}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-143,-25},{-133,-15}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.Constant cte1(k=-9999) annotation (Placement(transformation(extent={{-143,-41},{-133,-31}})));
  Modelica.Blocks.Sources.Constant cte2(k=9999) annotation (Placement(transformation(extent={{-143,-57},{-133,-47}})));
equation
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-25.92,23.3},{-30,23.3},{-30,34},{-126,34},{-126,21},{-127.35,21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-25.92,-9.1},{-28,-9.1},{-28,38},{-128,38},{-128,7},{-127.35,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, eSAC1A.VOTHSG) annotation (Line(
      points={{-132.5,-20},{-124,-20},{-124,-19.5},{-113.63,-19.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, eSAC1A.XADIFD) annotation (Line(
      points={{-25.92,-25.3},{-25.92,-44},{-120,-44},{-120,-24.895},{-97.7761,-24.895}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENSAL.p) annotation (Line(points={{110,0},{32,0},{32,-1},{-25.4,-1}}, color={0,0,255}));
  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eSAC1A.ECOMP, gENSAL.ETERM) annotation (Line(points={{-113.63,-6.5},{-118,-6.5},{-118,-42},{-26,-42},{-26,12.5},{-25.92,12.5}}, color={0,0,127}));
  connect(cte1.y, eSAC1A.VUEL) annotation (Line(points={{-132.5,-36},{-128,-36},{-128,-24.83},{-106.609,-24.83}}, color={0,0,127}));
  connect(cte2.y, eSAC1A.VOEL) annotation (Line(points={{-132.5,-52},{-124,-52},{-124,-24.895},{-102.189,-24.895}}, color={0,0,127}));
  connect(eSAC1A.EFD0, gENSAL.EFD0) annotation (Line(points={{-93.3043,-24.7},{-93.3043,-36},{-32,-36},{-32,-19.9},{-25.92,-19.9}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-74.7,14},{-82,14},{-82,12.5},{-79.48,12.5}}, color={0,0,127}));
  connect(eSAC1A.EFD, gENSAL.EFD) annotation (Line(points={{-79.6304,-13},{-76,-13},{-76,-14.5},{-79.48,-14.5}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL &
ESAC1A &
HYGOV")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}})),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end RGroup1_4;
