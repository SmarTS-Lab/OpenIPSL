within TwoAreas.Data;
record PF3
  import Modelica.Constants.pi;
  extends Support.PF_TwoAreas(
    voltages(
      V1=1.03,
      A1=20.27066,
      V2=1.01,
      A2=10.50628,
      V3=1.03,
      A3=-6.8,
      V4=1.01,
      A4=-16.9921,
      V5=1.0069,
      A5=13.7881,
      V6=0.97914,
      A6=3.7146,
      V7=0.9610106,
      A7=-4.68651,
      V8=0.94828,
      A8=-18.5131,
      V9=0.9713628,
      A9=-32.15403,
      V10=0.98486,
      A10=-23.7131,
      V11=1.0088,
      A11=-13.4215),
    machines(
      P1_1=700,
      Q1_1=185.0296,
      P2_1=700,
      Q2_1=234.6113,
      P3_1=719.0941,
      Q3_1=176.0262,
      P4_1=700,
      Q4_1=202.0827),
    loads(
      PL7_1=967,
      QL7_1=-84.70,
      PL9_1=1767,
      QL9_1=-230.2));
  annotation (Documentation);
end PF3;
