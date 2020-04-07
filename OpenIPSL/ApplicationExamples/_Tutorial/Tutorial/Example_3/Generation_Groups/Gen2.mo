within Tutorial.Example_3.Generation_Groups;
model Gen2
  extends Gen1(gen(
      Vn=13.8,
      xd=1.3125,
      xq=1.2578,
      x1d=0.1813,
      x1q=0.25,
      T1d0=5.89,
      T1q0=0.6,
      M=6.02));
  annotation (Documentation);
end Gen2;
