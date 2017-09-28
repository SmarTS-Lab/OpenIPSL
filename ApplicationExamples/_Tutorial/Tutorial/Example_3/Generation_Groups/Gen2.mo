within Tutorial.Example_3.Generation_Groups;
model Gen2
  extends Gen1(gen(
      Vn=13.8,
      xd=1.3125,
      xq=1.2578,
      xd1=0.1813,
      xq1=0.25,
      Td10=5.89,
      Tq10=0.6,
      M=6.02));
  annotation (Documentation);
end Gen2;
