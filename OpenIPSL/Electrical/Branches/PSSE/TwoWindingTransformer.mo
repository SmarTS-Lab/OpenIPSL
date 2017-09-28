within OpenIPSL.Electrical.Branches.PSSE;
model TwoWindingTransformer
  "Static Two-winding transformer according to PSS/E, without phase shift"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.Constants.pi;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.conj;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-80,
            -10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{60,
            -10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real S_b=SysData.S_b "System base power (MVA)"
    annotation (Dialog(enable=false));
  parameter Integer CZ=1 "Impedance I/O code" annotation (Dialog(tab=
          "Transformer impedance data"), choices(
      choice=1 "Z pu (winding kV system MVA)",
      choice=2 "Z pu (winding kV widing MVA)",
      choice=3 "Load loss (W) & |Z| (pu)"));
  parameter Real R "Specified R (pu)"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Real X "Specified X (pu)"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Real G "Magnetizing G"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Real B "Magnetizing B"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Integer CW=1 "Winding I/O code" annotation (Dialog(tab=
          "Transformer Nominal Ratings Data"), choices(
      choice=1 "Turns ratio (pu on bus base kV)",
      choice=2 "Winding voltage (kV)",
      choice=3 "Turns ratio (pu on nom wind kV)"));
  parameter Real t1=1 "Winding 1 ratio (pu)"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real VNOM1=0 "Winding 1 Nominal kV"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real VB1=300 "Bus Base kV on the side of winding 1"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real t2=1 "Secondary winding tap ratio"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real VNOM2=0 "Winding 2 Nominal kV"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real VB2=300 "Bus Base kV on the side of winding 2"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real ANG1=0 "Winding (1-2) Angle (degrees)"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Real S_n=S_b "Winding MVA"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
protected
  parameter Real VNOM1_int=if abs(VNOM1) < Modelica.Constants.eps then VB1
       else VNOM1;
  parameter Real VNOM2_int=if abs(VNOM2) < Modelica.Constants.eps then VB2
       else VNOM2;
  parameter Real r=if CZ == 1 then R else R*S_b/S_n;
  parameter Real x=if CZ == 1 then X else X*S_b/S_n;
  parameter Complex t=T1/T2*(cos(ANG1/180*pi) + j*sin(ANG1/180*pi));
  parameter Real T2=if CW == 1 then t2 elseif CW == 3 then t2*(VNOM2_int/VB2)
       else t2/VB2;
  parameter Real T1=if CW == 1 then t1 elseif CW == 3 then t1*(VNOM1_int/VB1)
       else t1/VB1;
  parameter Complex Ym(re=G, im=B);
  parameter Complex xeq(re=r*abs(T2)^2, im=x*abs(T2)^2);
  Complex ei(re=p.vr, im=p.vi);
  Complex ej(re=n.vr, im=n.vi);
  Complex ii(re=p.ir, im=p.ii);
  Complex ij(re=n.ir, im=n.ii);
equation
  ej = ei/t + xeq*ij;
  (ii - ei*Ym)*conj(t) = -ij;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}),
        graphics={Rectangle(
          extent={{-60,40},{60,-40}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Ellipse(extent={{-50,30},{10,-30}},
          lineColor={28,108,200}),Ellipse(extent={{-12,30},{52,-30}}, lineColor
          ={28,108,200}),Line(
          points={{-60,0},{-50,0}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled}),Line(points={{52,0},{60,0}}, color={
          28,108,200}),Polygon(
          points={{-56,4},{-50,0},{-56,-4},{-56,4}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(extent={{-60,-40},{60,40}}, preserveAspectRatio=
            false)),
    Documentation);
end TwoWindingTransformer;
