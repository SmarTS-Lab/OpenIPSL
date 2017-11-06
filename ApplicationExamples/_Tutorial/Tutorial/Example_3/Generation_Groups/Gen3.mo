within Tutorial.Example_3.Generation_Groups;
model Gen3
  extends Gen1(gen(
      Vn=16.5,
      xd=0.1460,
      xq=0.0969,
      x1d=0.0608,
      x1q=0.0969,
      T1d0=8.96,
      T1q0=0.310,
      M=47.28));
  annotation (Documentation);
end Gen3;
