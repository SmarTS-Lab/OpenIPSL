within iPSL.Examples.Wind;
model PSAT_WT_Test
  iPSL.Electrical.Wind.PSAT.PSAT_Type_3.PSAT_WT dfig_Turbine1(
    V_b=1,
    angle_0=0.00161587015139445,
    P_0=0.016,
    Q_0=-0.002086945,
    fn=50,
    poles=2,
    vw_base=15,
    Pnom=10,
    ngb=1/89) annotation (Placement(visible=true, transformation(
        origin={46.6515,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine5(
    B=0.001,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={6.551,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Wind.WindGenerator windGenerator1(
    v0=0.537631527453836,
    typ=3,
    tstop=15,
    sigma=1,
    vmax=25/15,
    wmag=-0.2) annotation (Placement(visible=true, transformation(
        origin={25.0,40.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.InfiniteBus infiniteBus1(V=1, angle=0)
    annotation (Placement(visible=true, transformation(
        origin={-28.2108,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  connect(infiniteBus1.p, pwLine5.p) annotation (Line(
      visible=true,
      origin={-8.8299,15.0},
      points={{-8.3809,0.0},{8.3809,0.0}},
      color={0,0,255}));
  connect(windGenerator1.Vw, dfig_Turbine1.Wind_Speed)
    annotation (Line(
      visible=true,
      origin={43.101,34.2663},
      points={{-7.101,5.7337},{3.5505,5.7337},{3.5505,-11.4673}},
      color={0,0,127}));
  connect(pwLine5.n, dfig_Turbine1.pin) annotation (Line(
      visible=true,
      origin={24.6013,15.0},
      points={{-11.0503,0},{11.0502,0}},
      color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation(revisions="<html>
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
end PSAT_WT_Test;
