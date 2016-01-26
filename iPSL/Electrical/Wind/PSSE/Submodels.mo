within iPSL.Electrical.Wind.PSSE;
package Submodels

  model LVACL
    //The Low Voltage Active Current Management block is designed to capture the characteristic
    //of active power under very low voltage scenarios. This low voltage limit is designed to reduce active current in a linear fashion.
    //  The protection function is activated when
    //the terminal voltage drops below 0.8 pu and strangling power completely if the terminal voltage is lower than
    //0.4 pu. For voltages between 0.8 pu and 0.4 pu to reduce the active power is linear according to equation
    Modelica.Blocks.Interfaces.RealOutput Ip_LVACL annotation (Placement(transformation(extent={{100,-8},{118,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=90,
          origin={-3,-29}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-90})));
    Modelica.Blocks.Interfaces.RealInput Ip_LVPL
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-33,-3}), iconTransformation(extent={{-100,-10},{-80,10}})));
  equation
    if Vt < 0.4 then
      Ip_LVACL = 0;
    elseif Vt > 0.8 then
      Ip_LVACL = Ip_LVPL;
    else
      Ip_LVACL = Ip_LVPL*1.25*Vt;
    end if;
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-26,18},{20,-22}}, lineColor={0,0,255})}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-44,114},{44,54}},
            lineColor={0,0,255},
            textString="LVACL"),
          Line(
            points={{-60,-60},{-42,-60},{0,20},{20,20}},
            color={0,128,255},
            thickness=0.5),
          Line(
            points={{0,20},{0,-4},{0,-60}},
            color={0,0,0},
            pattern=LinePattern.Dot),
          Line(
            points={{-60,20},{-30,20},{0,20}},
            color={0,0,0},
            pattern=LinePattern.Dot),
          Line(
            points={{-60,60},{-60,-60},{60,-60}},
            color={0,0,0},
            thickness=0.5,
            arrow={Arrow.Filled,Arrow.Filled}),
          Text(
            extent={{-98,-8},{-68,-22}},
            lineColor={0,0,255},
            textString="IP_LVLP"),
          Text(
            extent={{64,6},{98,-8}},
            lineColor={0,0,255},
            textString="IP_LVACL"),
          Text(
            extent={{4,-78},{22,-92}},
            lineColor={0,0,255},
            textString="V")}),
      Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end LVACL;

  model HVRCL
    //The 'High Voltage Reactive Current Management' block limits the reactive current injected into the network equations such that the terminal voltage of the machine never exceeds Volim of nominal, as long as the converter is within current limits."
    parameter Real VHVRCR "Threthod voltage for HVRCL";
    parameter Real CurHVRCR "Max. reactive current at VHVRCR";
    Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=90,
          origin={15,-19}), iconTransformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={0,-35})));
    Modelica.Blocks.Interfaces.RealOutput Iq_HVRCL annotation (Placement(transformation(extent={{42,4},{60,22}}), iconTransformation(extent={{40,-10},{60,10}})));
    Modelica.Blocks.Interfaces.RealInput Iq
      annotation (Placement(transformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-27,11}), iconTransformation(extent={{-40,-5},{-30,5}})));
  equation
    if Vt > VHVRCR then
      Iq_HVRCL = CurHVRCR;
    else
      Iq_HVRCL = Iq;
    end if;
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-40,-40},{40,40}},
          grid={1,1}), graphics),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-40,-40},{40,40}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-20,40},{20,30}},
            lineColor={0,0,255},
            textString="HVRCL "),
          Line(
            points={{14,30},{-6,30},{-16,10},{-16,10}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None),
          Text(
            extent={{-28,3},{-20,-3}},
            lineColor={0,0,255},
            textString="I_q"),
          Text(
            extent={{-5,-21},{5,-29}},
            lineColor={0,0,255},
            textString="V"),
          Text(
            extent={{19,4},{38,-4}},
            lineColor={0,0,255},
            textString="I_sorc")}),
      Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end HVRCL;

  model LVPL "Low voltage power logic"
    parameter Real VLVPL1 "LVPL voltage 1 (Low voltage power logic)";
    parameter Real VLVPL2 "LVPL voltage 2";
    parameter Real GLVPL "LVPL gain";
    parameter Real K=GLVPL/(VLVPL2 - VLVPL1);
    Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(extent={{-112,-18},{-72,22}}), iconTransformation(extent={{-100,-10},{-80,10}})));
    Modelica.Blocks.Interfaces.RealOutput LVPL annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  equation
    if Vt < VLVPL1 then
      LVPL = 0;
    elseif Vt > VLVPL2 then
      LVPL = 1e+6;
    else
      LVPL = K*(Vt - VLVPL1);
    end if;
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-78,30},{92,-58}}, lineColor={0,0,255})}),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{44,-40},{74,-58}},
            lineColor={0,0,255},
            lineThickness=0.5,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="V"),
          Text(
            extent={{-54,68},{-24,50}},
            lineColor={0,0,255},
            lineThickness=0.5,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="LVPL"),
          Line(
            points={{-66,20},{-54,20},{-54,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None),
          Line(
            points={{-60,60},{-60,-60},{60,-60}},
            color={0,0,255},
            thickness=0.5,
            arrow={Arrow.Filled,Arrow.Filled}),
          Line(
            points={{-42,-60}},
            color={0,0,255},
            thickness=0.5),
          Line(
            points={{-40,-60},{20,20},{20,40}},
            color={0,0,255},
            thickness=0.5),
          Text(
            extent={{-102,22},{-72,4}},
            lineColor={0,0,255},
            lineThickness=0.5,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="V"),
          Text(
            extent={{66,8},{96,-10}},
            lineColor={0,0,255},
            lineThickness=0.5,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="LVLP")}),
      Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end LVPL;

  model CCL
    parameter Real Qmax;
    parameter Boolean pqflag;
    parameter Real ImaxTD "Converter current limit";
    parameter Real Iphl "Hard active current limit";
    parameter Real Iqhl "Hard reactive current limit";
    Modelica.Blocks.Interfaces.RealOutput IQmin annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-12,96}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,110})));
    Modelica.Blocks.Interfaces.RealInput IpCMD annotation (Placement(transformation(
          extent={{-16,-16},{16,16}},
          rotation=180,
          origin={134,-20}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,-100})));
    Modelica.Blocks.Interfaces.RealInput IqCMD
      annotation (Placement(transformation(extent={{-146,-30},{-120,-4}}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,100})));
    Modelica.Blocks.Interfaces.RealOutput IQmax annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={16,96}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,110})));
    Modelica.Blocks.Interfaces.RealOutput IPmax annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-2,-84}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-110})));
    Modelica.Blocks.Math.Min min1 annotation (Placement(transformation(
          extent={{-6,6},{6,-6}},
          rotation=270,
          origin={-52,-38})));
    Modelica.Blocks.Sources.Constant const1(k=Iphl) annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=270,
          origin={-9,-19})));
    Modelica.Blocks.Sources.Constant const2(k=Iqhl) annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=0,
          origin={-19,23})));
    Modelica.Blocks.Math.Min min2 annotation (Placement(transformation(
          extent={{-6,6},{6,-6}},
          rotation=90,
          origin={-54,8})));
    Modelica.Blocks.Math.Min min3 annotation (Placement(transformation(
          extent={{-6,6},{6,-6}},
          rotation=270,
          origin={44,-38})));
    Modelica.Blocks.Math.Min min4 annotation (Placement(transformation(
          extent={{-6,6},{6,-6}},
          rotation=90,
          origin={44,6})));
    Modelica.Blocks.Math.Min min5 annotation (Placement(transformation(
          extent={{-6,6},{6,-6}},
          rotation=270,
          origin={-4,8})));
    Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={-83,51})));
    Modelica.Blocks.Math.Gain gain1(k=-1) annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={75,47})));
    Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,78}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-100,0})));
  protected
    Modelica.Blocks.Interfaces.RealInput Iqmax annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,40}), iconTransformation(
          extent={{-9,-9},{9,9}},
          rotation=0,
          origin={-101,5})));
  protected
    Modelica.Blocks.Interfaces.RealOutput IQmin1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={44,80}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-52,42})));
    Modelica.Blocks.Interfaces.RealOutput IQmax1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={74,80}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={2,42})));
    Modelica.Blocks.Interfaces.RealOutput IQmin2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-82,80}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-52,42})));
    Modelica.Blocks.Interfaces.RealOutput IQmax2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-52,80}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={2,42})));
    Modelica.Blocks.Interfaces.RealOutput IPmax1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={44,-68}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-40})));
    Modelica.Blocks.Interfaces.RealOutput IPmax2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-52,-68}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-40})));
    Modelica.Blocks.Interfaces.RealInput Available_remain1 "sqrt(ImaxTD^2 - IpCMD^2)" annotation (Placement(transformation(
          extent={{-16,-16},{16,16}},
          rotation=180,
          origin={76,-18}), iconTransformation(
          extent={{-9,-9},{9,9}},
          rotation=90,
          origin={55,-35})));
    Modelica.Blocks.Interfaces.RealInput Available_remain2 "sqrt(ImaxTD^2 - IqCMD^2)" annotation (Placement(transformation(
          extent={{-16,-16},{16,16}},
          rotation=0,
          origin={-90,-20}), iconTransformation(
          extent={{-9,-9},{9,9}},
          rotation=90,
          origin={55,-35})));
  equation
    Available_remain1 = sqrt(ImaxTD^2 - IpCMD^2);
    Available_remain2 = sqrt(ImaxTD^2 - IqCMD^2);
    Iqmax = (Qmax - 1.6)*(Vt - 1) + Qmax;
    if pqflag then
      IQmin = IQmin1;
      IQmax = IQmax1;
      IPmax = IPmax1;
    else
      IQmin = IQmin2;
      IQmax = IQmax2;
      IPmax = IPmax2;
    end if;
    connect(const1.y, min1.u2) annotation (Line(
        points={{-9,-26.7},{-9,-30},{-48.4,-30},{-48.4,-30.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const1.y, min3.u1) annotation (Line(
        points={{-9,-26.7},{-9,-30},{40.4,-30},{40.4,-30.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const2.y, min5.u1) annotation (Line(
        points={{-11.3,23},{-7.6,23},{-7.6,15.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min5.y, min4.u2) annotation (Line(
        points={{-4,1.4},{-4,-4},{40.4,-4},{40.4,-1.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min2.u1, min5.y) annotation (Line(
        points={{-50.4,0.8},{-50.4,-4},{-4,-4},{-4,1.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min2.y, IQmax2) annotation (Line(
        points={{-54,14.6},{-52,14.6},{-52,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min1.y, IPmax2) annotation (Line(
        points={{-52,-44.6},{-52,-68}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min3.y, IPmax1) annotation (Line(
        points={{44,-44.6},{44,-68}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min4.y, IQmin1) annotation (Line(
        points={{44,12.6},{44,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain.u, min2.y) annotation (Line(
        points={{-83,45},{-83,14.6},{-54,14.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain.y, IQmin2) annotation (Line(
        points={{-83,56.5},{-83,65.25},{-82,65.25},{-82,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain1.y, IQmax1) annotation (Line(
        points={{75,52.5},{75,61.25},{74,61.25},{74,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain1.u, min4.y) annotation (Line(
        points={{75,41},{75,12.6},{44,12.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Iqmax, min5.u2) annotation (Line(
        points={{0,40},{0,15.2},{-0.4,15.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min4.u1, Available_remain1) annotation (Line(
        points={{47.6,-1.2},{47.6,-18},{76,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min3.u2, Available_remain1) annotation (Line(
        points={{47.6,-30.8},{47.6,-18},{76,-18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Available_remain2, min2.u2) annotation (Line(
        points={{-90,-20},{-57.6,-20},{-57.6,0.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(min1.u1, Available_remain2) annotation (Line(
        points={{-55.6,-30.8},{-55.6,-20},{-90,-20}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-76,58},{82,18}},
            lineColor={244,125,35},
            textString="Converter Current Limit
"),
          Text(
            extent={{-86,6},{-46,-6}},
            lineColor={28,108,200},
            textString="VTERM"),
          Text(
            extent={{-70,96},{-30,84}},
            lineColor={28,108,200},
            textString="I_Qmin"),
          Text(
            extent={{-18,96},{22,84}},
            lineColor={28,108,200},
            textString="I_Qmax"),
          Text(
            extent={{32,88},{72,76}},
            lineColor={28,108,200},
            textString="I_Qcmd"),
          Text(
            extent={{26,-76},{66,-88}},
            lineColor={28,108,200},
            textString="I_Pcmd"),
          Text(
            extent={{-72,-76},{-32,-88}},
            lineColor={28,108,200},
            textString="I_Pmax")}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{-112,96},{-34,-86}},
              lineColor={255,0,0},
              pattern=LinePattern.Dot,
              lineThickness=0.5),Text(
              extent={{-52,90},{-40,80}},
              lineColor={255,0,0},
              pattern=LinePattern.Dot,
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Q"),Text(
              extent={{64,-38},{120,-62}},
              lineColor={0,0,255},
              textString="sqrt(ImaxTD^2 - IpCMD^2)"),Text(
              extent={{-112,-42},{-58,-58}},
              lineColor={0,0,255},
              textString="sqrt(ImaxTD^2 - IqCMD^2)")}),
      Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end CCL;
end Submodels;
