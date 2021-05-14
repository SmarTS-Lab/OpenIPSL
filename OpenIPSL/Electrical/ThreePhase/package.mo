within OpenIPSL.Electrical;
package ThreePhase "Package with three-phase and hybrid positive-sequence/three-phase models"
  extends Modelica.Icons.Package;

annotation (
  Documentation(info="<html>
<p>This package contains three-phase models that can be used to create systems where unbalance plays an important role.
 Distribution and sub-transmission systems are candidates.</p>
<p>Three-phase systems can be easily connected to equivalent positive-sequence systems by using hybrid positive-sequence/three-phase devices.
These models are called MonoTri and are usually represented as a pi-equivalent model. Transformers and power lines have their MonoTri representation in this package.</p>
<p>In addition, multi-phase bus, bank and load models are also available here. The modelling of such devices is based, mainly, on the following works:</p>
<ul>
<li><em>A hybrid three-phase single-phase power flow formulation</em>, by J.M.T. Marinho, and G.N. Taranto, and</li>
<li><em>Computer modelling of electrical power systems</em>, by J. Arrillaga, C.P. Arnold, and B.J. Harker. </li>
</ul>
</html>",revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2020-05-20</td>
</tr>
<tr>
<td><p>Authors</p></td>
<td><p>Marcelo de Castro, AlsetLab, and Maxime Baudette, LBNL</p></td>
</tr>
</table>
</html>"));
end ThreePhase;
