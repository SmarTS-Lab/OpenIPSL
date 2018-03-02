within ThreePhase.Branches.MonoTri;
model Transformer_MT
  "Transformer modeled in a PI element with a hybrid interface Single Phase x Three Phase"

  import ThreePhase.Branches.MonoTri.TransformerFcn.Yg_Yg;
  import ThreePhase.Branches.MonoTri.TransformerFcn.D_D;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Y_Y;
  import ThreePhase.Branches.MonoTri.TransformerFcn.D_Yg;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Yg_D;
  import ThreePhase.Branches.MonoTri.TransformerFcn.D_Y;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Y_D;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Y_Yg;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Yg_Y;

  import ThreePhase.Branches.MonoTri.TransformerFcn.Yg_Yg_FinImp;
  import ThreePhase.Branches.MonoTri.TransformerFcn.D_D_FinImp;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Y_Y_FinImp;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Y_Yg_FinImp;
  import ThreePhase.Branches.MonoTri.TransformerFcn.Yg_Y_FinImp;

  outer OpenIPSL.Electrical.SystemBase SysData;
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin A
    annotation (Placement(transformation(extent={{100,80},{120,100}})));
  OpenIPSL.Interfaces.PwPin B
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Interfaces.PwPin C
    annotation (Placement(transformation(extent={{100,-100},{120,-80}})));

  parameter Integer Connection=0
    "0 Yg-Yg; 1 D-D; 2 Y-Y; 3 D-Yg; 4 Yg-D; 5 D-Y; 6 Y-D; 7 Y-Yg; 8 Yg-Y;"
    annotation (choices(
      choice=0 "Yg-Yg",
      choice=1 "D-D",
      choice=2 "Y-Y",
      choice=3 "D-Yg",
      choice=4 "Yg-D",
      choice=5 "D-Y",
      choice=6 "Y-D",
      choice=7 "Y-Yg",
      choice=8 "Yg-Y"));

  // Options for the type of model that the user wants to simulate
  parameter Integer ModelType=0
    "0- Assuming that the negative and zero norton admittances are infinite (Aproximation), 1- Considering that the negative and zero norton admittances finite values;"
    annotation (Dialog(group="Selection of model"),choices(choice=0
        "Norton admittances have infinite values", choice=1
        "Norton admittances have finite values (Only possible if the transformer connection does not introduce a phase displacement)"));

  parameter Real Sb=SysData.S_b "System base power (MVA)"
    annotation (Dialog(group="Power flow"));
  parameter Real fn=SysData.fn "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow"));
  parameter Real tap=1 "Nominal tap ratio (Vs/Vp)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Real X=0.001 "Reactance (pu system base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Real R=0.1 "Resistance (pu system base)"
    annotation (Dialog(group="Transformer parameters"));

  parameter Real G_0=0 "Zero sequence conductance in p.u." annotation (Dialog(
        group=
          "Norton equivalent admittances in terminal K - Considering that the negative and zero norton admittances have finite values"));
  parameter Real B_0=0 "Zero sequence susceptance in p.u." annotation (Dialog(
        group=
          "Norton equivalent admittances in terminal K - Considering that the negative and zero norton admittances have finite values"));
  parameter Real G_1=0 "Positive sequence conductance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering that the negative and zero norton admittances have finite values"));
  parameter Real B_1=0 "Positive sequence susceptance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering that the negative and zero norton admittances have finite values"));
  parameter Real G_2=0 "Negative sequence conductance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering that the negative and zero norton admittances have finite values"));
  parameter Real B_2=0 "Negative sequence susceptance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering that the negative and zero norton admittances have finite values"));

  //Writing the Y012 Norton matrix for the exact model
protected
  parameter Real[1, 18] Y012=[G_0, B_0, 0, 0, 0, 0, 0, 0, G_1, B_1, 0, 0, 0, 0,
      0, 0, G_2, B_2];

  //Writing the function for selecting the type of model and the type of transformer connection
  function ConnectionType
    input Integer Connection;
    input Integer Model;
    input Real X;
    input Real R;
    input Real tap;
    input Real[1, 18] Y012;
    output Real[1, 32] Y;
  algorithm
    if Connection == 0 then

      if Model == 0 then
        Y := Yg_Yg(
            X,
            R,
            tap);
      elseif Model == 1 then
        Y := Yg_Yg_FinImp(
            X,
            R,
            tap,
            Y012);
      end if;

    elseif Connection == 1 then

      if Model == 0 then
        Y := D_D(
            X,
            R,
            tap);
      elseif Model == 1 then
        Y := D_D_FinImp(
            X,
            R,
            tap,
            Y012);
      end if;

    elseif Connection == 2 then

      if Model == 0 then
        Y := Y_Y(
            X,
            R,
            tap);
      elseif Model == 1 then
        Y := Y_Y_FinImp(
            X,
            R,
            tap,
            Y012);
      end if;

    elseif Connection == 3 then
      Y := D_Yg(
          X,
          R,
          tap);
    elseif Connection == 4 then
      Y := Yg_D(
          X,
          R,
          tap);
    elseif Connection == 5 then
      Y := D_Y(
          X,
          R,
          tap);
    elseif Connection == 6 then
      Y := Y_D(
          X,
          R,
          tap);
    elseif Connection == 7 then

      if Model == 0 then
        Y := Y_Yg(
            X,
            R,
            tap);
      elseif Model == 1 then
        Y := Y_Yg_FinImp(
            X,
            R,
            tap,
            Y012);
      end if;

    elseif Connection == 8 then

      if Model == 0 then
        Y := Yg_Y(
            X,
            R,
            tap);
      elseif Model == 1 then
        Y := Yg_Y_FinImp(
            X,
            R,
            tap,
            Y012);
      end if;

    end if;
  end ConnectionType;
  // It is possible to observe that transformers connections that have phase displacement does not have an exact model with finite values for the zero and
  // negative impedances. This is due to a singular matrix that appears in the development of the model. Therefore, there is no necessity to consider the
  // ModelType chosen, if the ConnectionType chosen introduces a phase displacement.

  parameter Real[1, 32] Aux=ConnectionType(
      Connection,
      ModelType,
      X,
      R,
      tap,
      Y012);
  parameter Real Ar=Aux[1, 1];
  parameter Real Ai=Aux[1, 2];
  parameter Real MB1r=Aux[1, 3];
  parameter Real MB1i=Aux[1, 4];
  parameter Real MB2r=Aux[1, 5];
  parameter Real MB2i=Aux[1, 6];
  parameter Real MB3r=Aux[1, 7];
  parameter Real MB3i=Aux[1, 8];
  parameter Real C1r=Aux[1, 9];
  parameter Real C1i=Aux[1, 10];
  parameter Real C2r=Aux[1, 11];
  parameter Real C2i=Aux[1, 12];
  parameter Real C3r=Aux[1, 13];
  parameter Real C3i=Aux[1, 14];
  parameter Real D11r=Aux[1, 15];
  parameter Real D11i=Aux[1, 16];
  parameter Real D12r=Aux[1, 17];
  parameter Real D12i=Aux[1, 18];
  parameter Real D13r=Aux[1, 19];
  parameter Real D13i=Aux[1, 20];
  parameter Real D21r=Aux[1, 21];
  parameter Real D21i=Aux[1, 22];
  parameter Real D22r=Aux[1, 23];
  parameter Real D22i=Aux[1, 24];
  parameter Real D23r=Aux[1, 25];
  parameter Real D23i=Aux[1, 26];
  parameter Real D31r=Aux[1, 27];
  parameter Real D31i=Aux[1, 28];
  parameter Real D32r=Aux[1, 29];
  parameter Real D32i=Aux[1, 30];
  parameter Real D33r=Aux[1, 31];
  parameter Real D33i=Aux[1, 32];

equation
  // Equations related to the MonoxTri interface
  p.ir = Ar*p.vr - Ai*p.vi + MB1r*A.vr - MB1i*A.vi + MB2r*B.vr - MB2i*B.vi +
    MB3r*C.vr - MB3i*C.vi;
  p.ii = Ar*p.vi + Ai*p.vr + MB1r*A.vi + MB1i*A.vr + MB2r*B.vi + MB2i*B.vr +
    MB3r*C.vi + MB3i*C.vr;
  A.ir = C1r*p.vr - C1i*p.vi + D11r*A.vr - D11i*A.vi + D12r*B.vr - D12i*B.vi +
    D13r*C.vr - D13i*C.vi;
  A.ii = C1r*p.vi + C1i*p.vr + D11r*A.vi + D11i*A.vr + D12r*B.vi + D12i*B.vr +
    D13r*C.vi + D13i*C.vr;
  B.ir = C2r*p.vr - C2i*p.vi + D21r*A.vr - D21i*A.vi + D22r*B.vr - D22i*B.vi +
    D23r*C.vr - D23i*C.vi;
  B.ii = C2r*p.vi + C2i*p.vr + D21r*A.vi + D21i*A.vr + D22r*B.vi + D22i*B.vr +
    D23r*C.vi + D23i*C.vr;
  C.ir = C3r*p.vr - C3i*p.vi + D31r*A.vr - D31i*A.vi + D32r*B.vr - D32i*B.vi +
    D33r*C.vr - D33i*C.vi;
  C.ii = C3r*p.vi + C3i*p.vr + D31r*A.vi + D31i*A.vr + D32r*B.vi + D32i*B.vr +
    D33r*C.vi + D33i*C.vr;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(graphics={Ellipse(
          lineColor={0,0,255},
          extent={{-46,30},{8,-30}},
          endAngle=360),Ellipse(
          lineColor={0,0,255},
          extent={{-8,30},{46,-30}},
          endAngle=360),Line(points={{100,0},{46,0}}, color={0,0,255}),Line(
          points={{-100,0},{-46,0}}, color={0,0,255}),Line(points={{110,90},{75,
          90},{39.3,20}}, color={0,0,255}),Line(points={{110,-90},{75,-90},{
          39.3,-20}}, color={0,0,255}),Text(
          lineColor={28,108,200},
          extent={{-38,20},{-4,-20}},
          textString="K"),Text(
          lineColor={28,108,200},
          extent={{7,20},{41,-20}},
          textString="M"),Text(
          origin={-56,64},
          lineColor={28,108,200},
          extent={{4,18},{104,-34}},
          textString="Hybrid Transformer")}, coordinateSystem(initialScale=0.1)),

    Documentation);
end Transformer_MT;
