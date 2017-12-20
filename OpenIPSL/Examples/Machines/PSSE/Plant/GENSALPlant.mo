within OpenIPSL.Examples.Machines.PSSE.Plant;
model GENSALPlant
  extends OpenIPSL.Electrical.Machines.PSSE.Plant(
  redeclare OpenIPSL.Electrical.Machines.PSSE.GENSAL machine(
  M_b = valuesGENSAL.M_b,
  Tpd0 = valuesGENSAL.Tpd0,
  Tppd0 = valuesGENSAL.Tppd0,
  Tppq0 = valuesGENSAL.Tppq0,
  H = valuesGENSAL.H,
  D = valuesGENSAL.D,
  Xd = valuesGENSAL.Xd,
  Xq = valuesGENSAL.Xq,
  Xpd = valuesGENSAL.Xpd,
  Xppd = valuesGENSAL.Xppd,
  Xl = valuesGENSAL.Xl,
  S10 = valuesGENSAL.S10,
  S12 = valuesGENSAL.S12, 
  V_0 = valuesGENSAL.V_0,
  P_0 = valuesGENSAL.P_0,
  angle_0 = valuesGENSAL.angle_0,
  Q_0 = valuesGENSAL.Q_0,
  Xppq = valuesGENSAL.Xppq,
  R_a = valuesGENSAL.R_a));
  OpenIPSL.Examples.Machines.PSSEPlant.MachineGENSAL valuesGENSAL(M_b = 100, Tpd0 = 5, Tppd0 = 0.07, Tppq0 = 0.09, H = 4.28, D = 0, Xd = 1.84, Xq = 1.75, Xpd = 0.41, Xppd = 0.2, Xl = 0.12, S10 = 0.11, S12 = 0.39, V_0 = 1, P_0 = 40, angle_0 = 4.046276, Q_0 = 5.416582, Xppq = 0.2, R_a = 0)  annotation(
    Placement(visible = true, transformation(origin = {-76, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
end GENSALPlant;
