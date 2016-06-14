within iPSL.NonElectrical.Eurostag;
model ImInverseFunction "Inverse Piecewise function. It takes into account the case 
  when the inverse function is monotonally decreasing. Developed by AIA
          2014/03/10"
  function findValue
    input Real v[:];
    input Real val;
    input Boolean inv;
    output Real y;
  protected
    Real w[size(v, 1)];
    Boolean found = false;
    Real aux;
    Integer index;
  algorithm
    index := size(v, 1);
    w := v;
    //    if inv then
    //      while (index >= 2) loop
    //                aux:=w[index];
    //        w[index]:=w[index - 1];
    //        w[index - 1]:=aux;
    //        index:=index - 2;
    //      end while;
    //    else
    //   end if;
    while index >= 2 loop
      if inv then
        w[index] := v[index - 1];
        w[index - 1] := v[index];
      else
        w[index] := v[index];
        w[index - 1] := v[index - 1];
      end if;
      index := index - 2;
    end while;
    index := size(w, 1) - 1;
    if w[size(w, 1) - 1] > w[1] then
      if val >= w[size(w, 1) - 1] then
        index := size(w, 1) - 1;
      elseif val < w[1] then
        index := 3;
      else
        while index >= 3 and found == false loop
          if val >= w[index - 2] and val < w[index] then
            found := true;
          else
            index := index - 2;
          end if;
        end while;
      end if;
    else
      if val >= w[3] then
        index := 3;
      elseif val < w[size(w, 1) - 1] then
        index := size(w, 1) - 1;
      else
        while index >= 3 and found == false loop
          if val >= w[index] and val < w[index - 2] then
            found := true;
          else
            index := index - 2;
          end if;
        end while;
      end if;
    end if;
    y := (val - w[index - 2]) * (w[index + 1] - w[index - 1]) / (w[index] - w[index - 2]) + w[index - 1];
  end findValue;

 extends Modelica.Blocks.Interfaces.SISO;
  parameter Real[:] v;
equation
  y = findValue(v, u, true);
  annotation(Diagram(graphics), Icon(graphics={                                                                       Text(extent={{
              -46,66},{50,-52}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "y = f(x)")}));
end ImInverseFunction;
