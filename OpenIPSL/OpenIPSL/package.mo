package OpenIPSL "Open-Instance Power System Library"
  import SI = Modelica.SIunits;
  import C = Modelica.Constants;

annotation (
  Protection(access = Access.packageDuplicate),
  uses(Modelica(version="3.2.3"), Complex(version="3.2.3")),
  version="2.0.0-dev",
  conversion(
     from(version={"0.8","0.8.1","1.0.0","1.5.0"}, script="modelica://OpenIPSL/Resources/Scripts/ConvertOpenIPSL_from_1.5.0_to_2.0.0.mos")),
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://OpenIPSL/Resources/Images/OpenIPSL_Logo.png")}));
end OpenIPSL;
