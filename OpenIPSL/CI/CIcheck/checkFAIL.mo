within ;
model checkFAIL
  Real y(start=1);
equation
  der(x) = -x;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end checkFAIL;
