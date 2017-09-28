within N44;
package Original "Library of original Nordic 44 model"
  model Nordic44_Original_Case
    "Original version of the original Nordic 44 model"

    OpenIPSL.Electrical.Buses.BusExt bus_7020(
      nn=1,
      np=1,
      V_0=pSSE_data.voltages.V7020,
      angle_0=pSSE_data.voltages.A7020,
      V_b=420)
      annotation (Placement(transformation(extent={{-282,-20},{-280,-10}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7020(
      V_b=420,
      V_0=pSSE_data.voltages.V7020,
      angle_0=pSSE_data.voltages.A7020,
      P_0=pSSE_data.powers.PL7020,
      Q_0=pSSE_data.powers.QL7020,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-288.25,-15.75})));
    OpenIPSL.Electrical.Buses.BusExt bus_7000(
      nn=16,
      np=3,
      V_0=pSSE_data.voltages.V7000,
      angle_0=pSSE_data.voltages.A7000,
      V_b=420)
      annotation (Placement(transformation(extent={{-272,-108},{-270,-36}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7000(
      V_b=420,
      V_0=pSSE_data.voltages.V7000,
      angle_0=pSSE_data.voltages.A7000,
      P_0=pSSE_data.powers.PL7000,
      Q_0=pSSE_data.powers.QL7000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-36})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus7000(
      V_b=420,
      V_0=pSSE_data.voltages.V7000,
      angle_0=pSSE_data.voltages.A7000,
      P_0=pSSE_data.powers.PL7000,
      Q_0=pSSE_data.powers.QL7000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-42})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus7000(
      V_b=420,
      V_0=pSSE_data.voltages.V7000,
      angle_0=pSSE_data.voltages.A7000,
      P_0=pSSE_data.powers.PL7000,
      Q_0=pSSE_data.powers.QL7000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-48})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load4_bus7000(
      V_b=420,
      V_0=pSSE_data.voltages.V7000,
      angle_0=pSSE_data.voltages.A7000,
      P_0=pSSE_data.powers.PL7000,
      Q_0=pSSE_data.powers.QL7000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-54})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load5_bus7000(
      V_b=420,
      V_0=pSSE_data.voltages.V7000,
      angle_0=pSSE_data.voltages.A7000,
      P_0=pSSE_data.powers.PL7000,
      Q_0=pSSE_data.powers.QL7000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-288,-60})));
    Generators.Gen1_bus_7000 G1_bus7000
      annotation (Placement(transformation(extent={{-292,-82},{-286,-76}})));
    Generators.Gen1_bus_7000 G2_bus7000
      annotation (Placement(transformation(extent={{-292,-90},{-286,-84}})));
    Generators.Gen1_bus_7000 G3_bus7000
      annotation (Placement(transformation(extent={{-292,-98},{-286,-92}})));
    Generators.Gen1_bus_7000 G4_bus7000
      annotation (Placement(transformation(extent={{-292,-106},{-286,-100}})));
    Generators.Gen1_bus_7000 G5_bus7000
      annotation (Placement(transformation(extent={{-292,-114},{-286,-108}})));
    Generators.Gen1_bus_7000 G6_bus7000
      annotation (Placement(transformation(extent={{-292,-122},{-286,-116}})));
    Generators.Gen1_bus_7000 G7_bus7000
      annotation (Placement(transformation(extent={{-292,-130},{-286,-124}})));
    Generators.Gen1_bus_7000 G8_bus7000
      annotation (Placement(transformation(extent={{-292,-138},{-286,-132}})));
    Generators.Gen1_bus_7000 G9_bus7000
      annotation (Placement(transformation(extent={{-292,-146},{-286,-140}})));
    OpenIPSL.Electrical.Buses.BusExt bus_7010(
      nn=1,
      np=1,
      V_0=pSSE_data.voltages.V7010,
      angle_0=pSSE_data.voltages.A7010,
      V_b=420)
      annotation (Placement(transformation(extent={{-282,0},{-280,10}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7010(
      V_b=420,
      V_0=pSSE_data.voltages.V7010,
      angle_0=pSSE_data.voltages.A7010,
      P_0=pSSE_data.powers.PL7010,
      Q_0=pSSE_data.powers.QL7010,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-288.25,4.25})));
    Generators.Gen3_bus_7100 G1_bus7100
      annotation (Placement(transformation(extent={{-266,-14},{-260,-8}})));
    Generators.Gen3_bus_7100 G2_bus7100
      annotation (Placement(transformation(extent={{-266,-20},{-260,-14}})));
    Generators.Gen3_bus_7100 G3_bus7100
      annotation (Placement(transformation(extent={{-266,-26},{-260,-20}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7100(
      V_b=420,
      V_0=pSSE_data.voltages.V7100,
      angle_0=pSSE_data.voltages.A7100,
      P_0=pSSE_data.powers.PL7100,
      Q_0=pSSE_data.powers.QL7100,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-264,-30})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus7100(
      V_b=420,
      V_0=pSSE_data.voltages.V7100,
      angle_0=pSSE_data.voltages.A7100,
      P_0=pSSE_data.powers.PL7100,
      Q_0=pSSE_data.powers.QL7100,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-264,-35})));
    OpenIPSL.Electrical.Buses.BusExt bus_7100(
      nn=8,
      np=2,
      V_0=pSSE_data.voltages.V7100,
      angle_0=pSSE_data.voltages.A7100,
      V_b=420)
      annotation (Placement(transformation(extent={{-252,-52},{-250,-14}})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7010(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-275,-1})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7020(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-278,-29})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7100_1(
      R=0.040000,
      X=0.120000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-260,-47})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7100_2(
      R=0.040000,
      X=0.120000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-257,-57})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7100_3(
      R=0.040000,
      X=0.140000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-254,-69})));
    OpenIPSL.Electrical.Buses.BusExt bus_3115(
      nn=6,
      np=4,
      V_0=pSSE_data.voltages.V3115,
      angle_0=pSSE_data.voltages.A3115,
      V_b=420)
      annotation (Placement(transformation(extent={{-228,-20},{-226,34}})));
    Generators.Gen3_bus_3115 G1_bus3115
      annotation (Placement(transformation(extent={{-242,14},{-236,20}})));
    Generators.Gen3_bus_3115 G2_bus3115
      annotation (Placement(transformation(extent={{-242,8},{-236,14}})));
    Generators.Gen3_bus_3115 G3_bus3115
      annotation (Placement(transformation(extent={{-242,0},{-236,6}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3115(
      V_b=420,
      V_0=pSSE_data.voltages.V3115,
      angle_0=pSSE_data.voltages.A3115,
      P_0=pSSE_data.powers.PL3115,
      Q_0=pSSE_data.powers.QL3115,
      characteristic=2) annotation (Placement(transformation(
          extent={{-3,-2.5},{3,2.5}},
          rotation=270,
          origin={-239,-4.5})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_7100(
      R=0.040000,
      X=0.130000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-239,-26})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3115(
      R=0.075000,
      X=0.900000,
      G=0,
      B=0.500000*0.5) annotation (Placement(transformation(
          extent={{5,-3},{-5,3}},
          rotation=180,
          origin={-239,29})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3115(
      R=0.030000,
      X=0.400000,
      G=0,
      B=0.110000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-206,34})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_3249(
      R=0.015000,
      X=0.200000,
      G=0,
      B=0.080000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-207,11})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_6701(
      R=0.040000,
      X=0.400000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-204,-36})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_3245(
      R=0.045000,
      X=0.500000,
      G=0,
      B=0.140000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-212,-19})));
    OpenIPSL.Electrical.Branches.PwLine line_3249_7100(
      R=0.020000,
      X=0.075000,
      G=0,
      B=0.078000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-231,-45})));
    OpenIPSL.Electrical.Buses.BusExt bus_3000(
      nn=7,
      np=5,
      V_0=pSSE_data.voltages.V3000,
      angle_0=pSSE_data.voltages.A3000,
      V_b=420)
      annotation (Placement(transformation(extent={{-258,46},{-256,66}})));
    Generators.Gen1_bus_3000 G1_bus3000
      annotation (Placement(transformation(extent={{-280,64},{-274,70}})));
    Generators.Gen1_bus_3000 G2_bus3000
      annotation (Placement(transformation(extent={{-280,56},{-274,62}})));
    Generators.Gen1_bus_3000 G3_bus3000
      annotation (Placement(transformation(extent={{-280,48},{-274,54}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus3000(
      V_b=420,
      V_0=pSSE_data.voltages.V3000,
      angle_0=pSSE_data.voltages.A3000,
      P_0=pSSE_data.powers.PL3000,
      Q_0=pSSE_data.powers.QL3000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-272.25,45.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus3000(
      V_b=420,
      V_0=pSSE_data.voltages.V3000,
      angle_0=pSSE_data.voltages.A3000,
      P_0=pSSE_data.powers.PL3000,
      Q_0=pSSE_data.powers.QL3000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-272.25,39.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus3000(
      V_b=420,
      V_0=pSSE_data.voltages.V3000,
      angle_0=pSSE_data.voltages.A3000,
      P_0=pSSE_data.powers.PL3000,
      Q_0=pSSE_data.powers.QL3000,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-272.25,32.25})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3020(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-269,79})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3300_1(
      R=0.006000,
      X=0.080000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-249,75})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3300_2(
      R=0.009000,
      X=0.100000,
      G=0,
      B=0.025000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-249,65})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3245_1(
      R=0.008000,
      X=0.120000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-234,56})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3245_2(
      R=0.018000,
      X=0.200000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-252,15})));
    OpenIPSL.Electrical.Buses.BusExt bus_3020(
      nn=1,
      np=1,
      V_0=pSSE_data.voltages.V3020,
      angle_0=pSSE_data.voltages.A3020,
      V_b=420)
      annotation (Placement(transformation(extent={{-282,70},{-280,90}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3020(
      V_b=420,
      V_0=pSSE_data.voltages.V3020,
      angle_0=pSSE_data.voltages.A3020,
      P_0=pSSE_data.powers.PL3020,
      Q_0=pSSE_data.powers.QL3020,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-288.25,77.25})));
    OpenIPSL.Electrical.Buses.BusExt bus_3300(
      nn=5,
      np=5,
      V_0=pSSE_data.voltages.V3300,
      angle_0=pSSE_data.voltages.A3300,
      V_b=420)
      annotation (Placement(transformation(extent={{-220,88},{-218,108}})));
    Generators.Gen4_bus_3300 G2_bus3300 annotation (Placement(transformation(
          extent={{-3,-3},{3,3}},
          rotation=180,
          origin={-205,97})));
    Generators.Gen4_bus_3300 G3_bus3300
      annotation (Placement(transformation(extent={{-202,92},{-208,86}})));
    Generators.Gen4_bus_3300 G1_bus3300
      annotation (Placement(transformation(extent={{-236,89},{-230,95}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus3300(
      V_b=420,
      V_0=pSSE_data.voltages.V3300,
      angle_0=pSSE_data.voltages.A3300,
      P_0=pSSE_data.powers.PL3300,
      Q_0=pSSE_data.powers.QL3300,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-230.25,102.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus3300(
      V_b=420,
      V_0=pSSE_data.voltages.V3300,
      angle_0=pSSE_data.voltages.A3300,
      P_0=pSSE_data.powers.PL3300,
      Q_0=pSSE_data.powers.QL3300,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.25,-1.75},{2.25,1.75}},
          rotation=270,
          origin={-230.25,97.75})));
    OpenIPSL.Electrical.Buses.BusExt bus_3200(
      nn=5,
      np=1,
      V_0=pSSE_data.voltages.V3200,
      angle_0=pSSE_data.voltages.A3200,
      V_b=420)
      annotation (Placement(transformation(extent={{-178,88},{-176,108}})));
    OpenIPSL.Electrical.Branches.PwLine line_3200_3300(
      R=0.020000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-197,103})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3200_3(
      R=0.040000,
      X=0.240000,
      G=0,
      B=0.200000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-193,77})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3200_2(
      R=0.040000,
      X=0.240000,
      G=0,
      B=0.200000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-187,77})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3200_1(
      R=0.040000,
      X=0.240000,
      G=0,
      B=0.200000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-181,77})));
    OpenIPSL.Electrical.Buses.BusExt bus_3100(
      nn=6,
      np=2,
      V_0=pSSE_data.voltages.V3100,
      angle_0=pSSE_data.voltages.A3100,
      V_b=420)
      annotation (Placement(transformation(extent={{-178,36},{-176,56}})));
    OpenIPSL.Electrical.Branches.PwLine line_3300_8500_1(
      R=0.020000,
      X=0.230000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-211,119})));
    OpenIPSL.Electrical.Branches.PwLine line_3300_8500_2(
      R=0.012000,
      X=0.270000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-207,119})));
    OpenIPSL.Electrical.Buses.BusExt bus_8500(
      nn=8,
      np=8,
      V_0=pSSE_data.voltages.V8500,
      angle_0=pSSE_data.voltages.A8500,
      V_b=420)
      annotation (Placement(transformation(extent={{-198,124},{-196,166}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus8500(
      V_b=420,
      V_0=pSSE_data.voltages.V8500,
      angle_0=pSSE_data.voltages.A8500,
      P_0=pSSE_data.powers.PL8500,
      Q_0=pSSE_data.powers.QL8500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-212.25,162.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus8500(
      V_b=420,
      V_0=pSSE_data.voltages.V8500,
      angle_0=pSSE_data.voltages.A8500,
      P_0=pSSE_data.powers.PL8500,
      Q_0=pSSE_data.powers.QL8500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-212.25,156.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus8500(
      V_b=420,
      V_0=pSSE_data.voltages.V8500,
      angle_0=pSSE_data.voltages.A8500,
      P_0=pSSE_data.powers.PL8500,
      Q_0=pSSE_data.powers.QL8500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-214,148})));
    Generators.Gen4_bus_8500 G1_bus8500
      annotation (Placement(transformation(extent={{-218,138},{-212,144}})));
    Generators.Gen4_bus_8500 G2_bus8500
      annotation (Placement(transformation(extent={{-218,130},{-212,136}})));
    OpenIPSL.Electrical.Branches.PwLine line_8500_8700(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-215,167})));
    Generators.Gen4_bus_8500 G3_bus8500
      annotation (Placement(transformation(extent={{-176,166},{-182,160}})));
    OpenIPSL.Electrical.Branches.PwLine line_8500_8600(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-179,169})));
    OpenIPSL.Electrical.Branches.PwLine line_3200_8500(
      R=0.010000,
      X=0.170000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-189,121})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_8500_2(
      R=0.025000,
      X=0.320000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-161,133})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_8500_1(
      R=0.012000,
      X=0.270000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-161,129})));
    Generators.Gen4_bus_8500 G4_bus8500
      annotation (Placement(transformation(extent={{-178,158},{-184,152}})));
    Generators.Gen4_bus_8500 G5_bus8500
      annotation (Placement(transformation(extent={{-178,150},{-184,144}})));
    Generators.Gen4_bus_8500 G6_bus8500
      annotation (Placement(transformation(extent={{-178,142},{-184,136}})));
    OpenIPSL.Electrical.Buses.BusExt bus_8700(
      nn=1,
      np=1,
      V_0=pSSE_data.voltages.V8700,
      angle_0=pSSE_data.voltages.A8700,
      V_b=420)
      annotation (Placement(transformation(extent={{-238,156},{-236,176}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus8700(
      V_0=pSSE_data.voltages.V8700,
      angle_0=pSSE_data.voltages.A8700,
      V_b=420,
      P_0=pSSE_data.powers.PL8700,
      Q_0=pSSE_data.powers.QL8700,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-246.25,166.25})));
    OpenIPSL.Electrical.Buses.BusExt bus_8600(
      nn=1,
      np=1,
      V_0=pSSE_data.voltages.V8600,
      angle_0=pSSE_data.voltages.A8600,
      V_b=420)
      annotation (Placement(transformation(extent={{-162,156},{-160,176}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus8600(
      V_b=420,
      V_0=pSSE_data.voltages.V8600,
      angle_0=pSSE_data.voltages.A8600,
      P_0=pSSE_data.powers.PL8600,
      Q_0=pSSE_data.powers.QL8600,
      characteristic=2) annotation (Placement(transformation(
          extent={{2,-1.5},{-2,1.5}},
          rotation=90,
          origin={-152,166.5})));
    OpenIPSL.Electrical.Buses.BusExt bus_3359(
      nn=9,
      np=9,
      V_0=pSSE_data.voltages.V3359,
      angle_0=pSSE_data.voltages.A3359,
      V_b=420)
      annotation (Placement(transformation(extent={{-124,54},{-122,112}})));
    OpenIPSL.Electrical.Branches.PwLine line_3200_3359(
      R=0.010000,
      X=0.200000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-153,99})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus3359(
      V_b=420,
      V_0=pSSE_data.voltages.V3359,
      angle_0=pSSE_data.voltages.A3359,
      P_0=pSSE_data.powers.PL3359,
      Q_0=pSSE_data.powers.QL3359,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.25,-1.75},{1.25,1.75}},
          rotation=270,
          origin={-132.25,86.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus3359(
      V_b=420,
      V_0=pSSE_data.voltages.V3359,
      angle_0=pSSE_data.voltages.A3359,
      P_0=pSSE_data.powers.PL3359,
      Q_0=pSSE_data.powers.QL3359,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-134.25,82.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus3359(
      V_b=420,
      V_0=pSSE_data.voltages.V3359,
      angle_0=pSSE_data.voltages.A3359,
      P_0=pSSE_data.powers.PL3359,
      Q_0=pSSE_data.powers.QL3359,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-136.25,78.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load4_bus3359(
      V_b=420,
      V_0=pSSE_data.voltages.V3359,
      angle_0=pSSE_data.voltages.A3359,
      P_0=pSSE_data.powers.PL3359,
      Q_0=pSSE_data.powers.QL3359,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-138.25,74.25})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3359_1(
      R=0.080000,
      X=0.500000,
      G=0,
      B=0.250000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-155,57})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3359_2(
      R=0.040000,
      X=0.230000,
      G=0,
      B=0.240000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={-155,51})));
    OpenIPSL.Electrical.Buses.BusExt bus_3360(
      np=1,
      V_0=pSSE_data.voltages.V3360,
      angle_0=pSSE_data.voltages.A3360,
      V_b=135,
      nn=1) annotation (Placement(transformation(extent={{-96,130},{-94,150}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3360(
      V_b=135,
      V_0=pSSE_data.voltages.V3360,
      angle_0=pSSE_data.voltages.A3360,
      P_0=pSSE_data.powers.PL3360,
      Q_0=pSSE_data.powers.QL3360,
      characteristic=2) annotation (Placement(transformation(
          extent={{1.75,-1.75},{-1.75,1.75}},
          rotation=90,
          origin={-83.75,140.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3100(
      V_b=420,
      V_0=pSSE_data.voltages.V3100,
      angle_0=pSSE_data.voltages.A3100,
      P_0=pSSE_data.powers.PL3100,
      Q_0=pSSE_data.powers.QL3100,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-196.25,47.25})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3249(
      R=0.030000,
      X=0.430000,
      G=0,
      B=0.160000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-189,15})));
    OpenIPSL.Electrical.Buses.BusExt bus_3249(
      np=5,
      nn=7,
      V_0=pSSE_data.voltages.V3249,
      angle_0=pSSE_data.voltages.A3249,
      V_b=420)
      annotation (Placement(transformation(extent={{-176,-52},{-174,6}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3249(
      V_b=420,
      V_0=pSSE_data.voltages.V3249,
      angle_0=pSSE_data.voltages.A3249,
      P_0=pSSE_data.powers.PL3249,
      Q_0=pSSE_data.powers.QL3249,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-190.25,-9.75})));
    Generators.Gen2_bus_3249 G1_bus3249
      annotation (Placement(transformation(extent={{-198,-20},{-192,-14}})));
    Generators.Gen2_bus_3249 G2_bus3249
      annotation (Placement(transformation(extent={{-198,-28},{-192,-22}})));
    Generators.Gen2_bus_3249 G3_bus3249
      annotation (Placement(transformation(extent={{-198,-36},{-192,-30}})));
    Generators.Gen2_bus_3249 G4_bus3249
      annotation (Placement(transformation(extent={{-158,-12},{-164,-18}})));
    Generators.Gen2_bus_3249 G5_bus3249
      annotation (Placement(transformation(extent={{-158,-20},{-164,-26}})));
    Generators.Gen2_bus_3249 G6_bus3249
      annotation (Placement(transformation(extent={{-158,-26},{-164,-32}})));
    Generators.Gen2_bus_3249 G7_bus3249
      annotation (Placement(transformation(extent={{-158,-34},{-164,-40}})));
    OpenIPSL.Electrical.Buses.BusExt bus_3701(
      np=1,
      V_0=pSSE_data.voltages.V3701,
      angle_0=pSSE_data.voltages.A3701,
      V_b=300,
      nn=1)
      annotation (Placement(transformation(extent={{-118,-70},{-116,-50}})));
    OpenIPSL.Electrical.Buses.BusExt bus_3245(
      nn=3,
      np=2,
      V_0=pSSE_data.voltages.V3245,
      angle_0=pSSE_data.voltages.A3245,
      V_b=420)
      annotation (Placement(transformation(extent={{-208,-82},{-206,-62}})));
    Generators.Gen2_bus_3245 G1_bus3245
      annotation (Placement(transformation(extent={{-194,-62},{-200,-68}})));
    OpenIPSL.Electrical.Buses.BusExt bus_3244(
      np=1,
      V_0=pSSE_data.voltages.V3244,
      angle_0=pSSE_data.voltages.A3244,
      V_b=300,
      nn=1)
      annotation (Placement(transformation(extent={{-178,-106},{-176,-86}})));
    OpenIPSL.Electrical.Buses.BusExt bus_6701(
      nn=1,
      V_0=pSSE_data.voltages.V6701,
      angle_0=pSSE_data.voltages.A6701,
      V_b=420,
      np=1)
      annotation (Placement(transformation(extent={{-146,-94},{-144,-74}})));
    OpenIPSL.Electrical.Buses.BusExt bus_6700(
      np=3,
      nn=4,
      V_0=pSSE_data.voltages.V6700,
      angle_0=pSSE_data.voltages.A6700,
      V_b=300)
      annotation (Placement(transformation(extent={{-78,-94},{-76,-74}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus6700(
      V_b=300,
      V_0=pSSE_data.voltages.V6700,
      angle_0=pSSE_data.voltages.A6700,
      P_0=pSSE_data.powers.PL6700,
      Q_0=pSSE_data.powers.QL6700,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-92.25,-87.75})));
    Generators.Gen3_bus_6700 G1_bus6700
      annotation (Placement(transformation(extent={{-98,-98},{-92,-92}})));
    Generators.Gen3_bus_6700 G2_bus6700
      annotation (Placement(transformation(extent={{-58,-74},{-64,-80}})));
    OpenIPSL.Electrical.Branches.PwLine line_3701_6700(
      R=0.250000,
      X=2.000000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-95,-69})));
    OpenIPSL.Electrical.Branches.PwLine line_3244_6500(
      R=0.010000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-111,-111})));
    OpenIPSL.Electrical.Buses.BusExt bus_6500(
      nn=6,
      np=5,
      V_0=pSSE_data.voltages.V6500,
      angle_0=pSSE_data.voltages.A6500,
      V_b=300)
      annotation (Placement(transformation(extent={{-20,-122},{-18,-78}})));
    OpenIPSL.Electrical.Branches.PwLine line_6500_6700_1(
      R=0.170000,
      X=1.800000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-51,-85})));
    OpenIPSL.Electrical.Branches.PwLine line_6500_6700_2(
      R=0.100000,
      X=1.300000,
      G=0,
      B=0.120000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-51,-91})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus6500(
      V_b=300,
      V_0=pSSE_data.voltages.V6500,
      angle_0=pSSE_data.voltages.A6500,
      P_0=pSSE_data.powers.PL6500,
      Q_0=pSSE_data.powers.QL6500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-32.25,-97.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus6500(
      V_b=300,
      V_0=pSSE_data.voltages.V6500,
      angle_0=pSSE_data.voltages.A6500,
      P_0=pSSE_data.powers.PL6500,
      Q_0=pSSE_data.powers.QL6500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-32.25,-103.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus6500(
      V_b=300,
      V_0=pSSE_data.voltages.V6500,
      angle_0=pSSE_data.voltages.A6500,
      P_0=pSSE_data.powers.PL6500,
      Q_0=pSSE_data.powers.QL6500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-32.25,-111.75})));
    Generators.Gen5_bus_6500 G1_bus6500
      annotation (Placement(transformation(extent={{2,-90},{-4,-96}})));
    Generators.Gen5_bus_6500 G2_bus6500
      annotation (Placement(transformation(extent={{2,-98},{-4,-104}})));
    Generators.Gen5_bus_6500 G3_bus6500
      annotation (Placement(transformation(extent={{2,-106},{-4,-112}})));
    Generators.Gen5_bus_6500 G4_bus6500
      annotation (Placement(transformation(extent={{2,-114},{-4,-120}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5100(
      np=2,
      nn=3,
      V_0=pSSE_data.voltages.V5100,
      angle_0=pSSE_data.voltages.A5100,
      V_b=300)
      annotation (Placement(transformation(extent={{22,-74},{24,-54}})));
    OpenIPSL.Electrical.Branches.PwLine line_5100_6500(
      R=0.080000,
      X=0.900000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={3,-79})));
    Generators.Gen5_bus_5100 G1_bus5100
      annotation (Placement(transformation(extent={{2,-68},{8,-62}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus5100(
      V_b=300,
      V_0=pSSE_data.voltages.V5100,
      angle_0=pSSE_data.voltages.A5100,
      P_0=pSSE_data.powers.PL5100,
      Q_0=pSSE_data.powers.QL5100,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={7.75,-59.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5100_5500(
      R=0.027000,
      X=0.260000,
      G=0,
      B=0.044000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={41,-65})));
    OpenIPSL.Electrical.Buses.BusExt bus_5101(
      nn=3,
      np=3,
      V_0=pSSE_data.voltages.V5101,
      angle_0=pSSE_data.voltages.A5101,
      V_b=420) annotation (Placement(transformation(extent={{22,-2},{24,18}})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_5101_2(
      R=0.020000,
      X=0.220000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-65,11})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_5101_1(
      R=0.016000,
      X=0.260000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-65,17})));
    Generators.Gen4_bus_3359 G1_bus3359
      annotation (Placement(transformation(extent={{-92,110},{-98,104}})));
    Generators.Gen4_bus_3359 G2_bus3359
      annotation (Placement(transformation(extent={{-92,102},{-98,96}})));
    Generators.Gen4_bus_3359 G3_bus3359
      annotation (Placement(transformation(extent={{-92,94},{-98,88}})));
    Generators.Gen4_bus_3359 G4_bus3359
      annotation (Placement(transformation(extent={{-92,86},{-98,80}})));
    Generators.Gen4_bus_3359 G5_bus3359
      annotation (Placement(transformation(extent={{-92,78},{-98,72}})));
    Generators.Gen4_bus_3359 G6_bus3359
      annotation (Placement(transformation(extent={{-92,70},{-98,64}})));
    OpenIPSL.Electrical.Branches.PwLine line_5101_5103(
      R=0.010000,
      X=0.140000,
      G=0,
      B=0.040000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={43,15})));
    OpenIPSL.Electrical.Branches.PwLine line_5101_5102(
      R=0.008000,
      X=0.100000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={43,9})));
    OpenIPSL.Electrical.Branches.PwLine line_5101_5501(
      R=0.010000,
      X=0.150000,
      G=0,
      B=0.550000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={43,3})));
    OpenIPSL.Electrical.Buses.BusExt bus_5103(
      nn=1,
      np=3,
      V_0=pSSE_data.voltages.V5103,
      angle_0=pSSE_data.voltages.A5103,
      V_b=420) annotation (Placement(transformation(extent={{80,38},{82,58}})));
    OpenIPSL.Electrical.Branches.PwLine line_5103_5304_2(
      R=0.013000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={97,47})));
    OpenIPSL.Electrical.Branches.PwLine line_5103_5304_1(
      R=0.020000,
      X=0.250000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={97,53})));
    OpenIPSL.Electrical.Branches.PwLine line_5102_5103(
      R=0.004000,
      X=0.070000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={97,41})));
    OpenIPSL.Electrical.Buses.BusExt bus_5304(
      np=3,
      nn=3,
      V_0=pSSE_data.voltages.V5304,
      angle_0=pSSE_data.voltages.A5304,
      V_b=420)
      annotation (Placement(transformation(extent={{122,70},{124,90}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5102(
      nn=3,
      np=1,
      V_0=pSSE_data.voltages.V5102,
      angle_0=pSSE_data.voltages.A5102,
      V_b=420) annotation (Placement(transformation(extent={{122,4},{124,24}})));
    OpenIPSL.Electrical.Branches.PwLine line_5102_5304(
      R=0.017000,
      X=0.240000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={116,49})));
    OpenIPSL.Electrical.Branches.PwLine line_5102_6001(
      R=0.030000,
      X=0.460000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={136,14})));
    OpenIPSL.Electrical.Buses.BusExt bus_5305(
      np=1,
      nn=2,
      V_0=pSSE_data.voltages.V5305,
      angle_0=pSSE_data.voltages.A5305,
      V_b=420)
      annotation (Placement(transformation(extent={{162,110},{164,130}})));
    OpenIPSL.Electrical.Branches.PwLine line_5304_5305_1(
      R=0.010000,
      X=0.150000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={135,97})));
    OpenIPSL.Electrical.Branches.PwLine line_5304_5305_2(
      R=0.013000,
      X=0.017000,
      G=0,
      B=0.040000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={141,97})));
    OpenIPSL.Electrical.Branches.PwLine line_5301_5304(
      R=0.010000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={159,75})));
    OpenIPSL.Electrical.Buses.BusExt bus_5301(
      nn=3,
      V_0=pSSE_data.voltages.V5301,
      angle_0=pSSE_data.voltages.A5301,
      V_b=420,
      np=1) annotation (Placement(transformation(extent={{200,70},{202,90}})));
    OpenIPSL.Electrical.Branches.PwLine line_5301_5305(
      R=0.007000,
      X=0.120000,
      G=0,
      B=0.031000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={183,97})));
    OpenIPSL.Electrical.Branches.PwLine line_5301_6001(
      R=0.013000,
      X=0.200000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={172,53})));
    OpenIPSL.Electrical.Buses.BusExt bus_5300(
      np=2,
      nn=3,
      V_0=pSSE_data.voltages.V5300,
      angle_0=pSSE_data.voltages.A5300,
      V_b=300)
      annotation (Placement(transformation(extent={{240,70},{242,90}})));
    Generators.Gen3_bus_5300 G1_bus5300
      annotation (Placement(transformation(extent={{220,64},{226,70}})));
    Generators.Gen3_bus_5300 G2_bus5300
      annotation (Placement(transformation(extent={{262,88},{256,82}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus5300(
      V_b=300,
      V_0=pSSE_data.voltages.V5300,
      angle_0=pSSE_data.voltages.A5300,
      P_0=pSSE_data.powers.PL5300,
      Q_0=pSSE_data.powers.QL5300,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={222.75,77.25})));
    OpenIPSL.Electrical.Buses.BusExt bus_6100(
      np=4,
      nn=5,
      V_0=pSSE_data.voltages.V6100,
      angle_0=pSSE_data.voltages.A6100,
      V_b=300)
      annotation (Placement(transformation(extent={{280,38},{282,58}})));
    OpenIPSL.Electrical.Branches.PwLine line_5300_6100(
      R=0.021000,
      X=0.220000,
      G=0,
      B=0.010000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={259,75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus6100(
      V_b=300,
      V_0=pSSE_data.voltages.V6100,
      angle_0=pSSE_data.voltages.A6100,
      P_0=pSSE_data.powers.PL6100,
      Q_0=pSSE_data.powers.QL6100,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,63.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus6100(
      V_b=300,
      V_0=pSSE_data.voltages.V6100,
      angle_0=pSSE_data.voltages.A6100,
      P_0=pSSE_data.powers.PL6100,
      Q_0=pSSE_data.powers.QL6100,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,53.25})));
    Generators.Gen3_bus_6100 G1_bus6100
      annotation (Placement(transformation(extent={{262,42},{268,48}})));
    Generators.Gen3_bus_6100 G2_bus6100
      annotation (Placement(transformation(extent={{296,64},{290,58}})));
    Generators.Gen3_bus_6100 G4_bus6100
      annotation (Placement(transformation(extent={{296,48},{290,42}})));
    Generators.Gen3_bus_6100 G5_bus6100
      annotation (Placement(transformation(extent={{296,40},{290,34}})));
    Generators.Gen3_bus_6100 G3_bus6100
      annotation (Placement(transformation(extent={{296,56},{290,50}})));
    OpenIPSL.Electrical.Branches.PwLine line_6000_6100(
      R=0.034000,
      X=0.420000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={254,31})));
    OpenIPSL.Electrical.Buses.BusExt bus_6000(
      np=2,
      nn=3,
      V_0=pSSE_data.voltages.V6000,
      angle_0=pSSE_data.voltages.A6000,
      V_b=300)
      annotation (Placement(transformation(extent={{240,-8},{242,12}})));
    Generators.Gen5_bus_6000 G1_bus6000
      annotation (Placement(transformation(extent={{219,-2},{227,6}})));
    OpenIPSL.Electrical.Branches.PwLine line_5400_6000(
      R=0.033000,
      X=0.360000,
      G=0,
      B=0.025000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={222,-23})));
    OpenIPSL.Electrical.Buses.BusExt bus_6001(
      nn=3,
      np=3,
      V_0=pSSE_data.voltages.V6001,
      angle_0=pSSE_data.voltages.A6001,
      V_b=420)
      annotation (Placement(transformation(extent={{182,12},{184,32}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5601(
      np=1,
      V_0=pSSE_data.voltages.V5601,
      angle_0=pSSE_data.voltages.A5601,
      V_b=300,
      nn=1) annotation (Placement(transformation(extent={{280,-2},{282,18}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5600(
      nn=4,
      np=4,
      V_0=pSSE_data.voltages.V5600,
      angle_0=pSSE_data.voltages.A5600,
      V_b=300)
      annotation (Placement(transformation(extent={{280,-54},{282,-34}})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_5601(
      R=0.030000,
      X=0.340000,
      G=0,
      B=0.020000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={289,-15})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_6000(
      R=0.020000,
      X=0.200000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={265,-1})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5600(
      V_b=300,
      V_0=pSSE_data.voltages.V5600,
      angle_0=pSSE_data.voltages.A5600,
      P_0=pSSE_data.powers.PL5600,
      Q_0=pSSE_data.powers.QL5600,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,-34.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus5600(
      V_b=300,
      V_0=pSSE_data.voltages.V5600,
      angle_0=pSSE_data.voltages.A5600,
      P_0=pSSE_data.powers.PL5600,
      Q_0=pSSE_data.powers.QL5600,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,-44.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_5603(
      R=0.020000,
      X=0.220000,
      G=0,
      B=0.020000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=0,
          origin={255,-53})));
    OpenIPSL.Electrical.Buses.BusExt bus_5620(
      np=1,
      nn=1,
      V_0=pSSE_data.voltages.V5620,
      angle_0=pSSE_data.voltages.A5620,
      V_b=300)
      annotation (Placement(transformation(extent={{280,-104},{282,-84}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus5620(
      V_b=300,
      V_0=pSSE_data.voltages.V5620,
      angle_0=pSSE_data.voltages.A5620,
      P_0=pSSE_data.powers.PL5620,
      Q_0=pSSE_data.powers.QL5620,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,-94.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_5620(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={288,-71})));
    Generators.Gen2_bus_5600 G1_bus5600
      annotation (Placement(transformation(extent={{296,-38},{290,-44}})));
    Generators.Gen2_bus_5600 G2_bus5600
      annotation (Placement(transformation(extent={{296,-46},{290,-52}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5603(
      np=2,
      nn=2,
      V_0=pSSE_data.voltages.V5603,
      angle_0=pSSE_data.voltages.A5603,
      V_b=300)
      annotation (Placement(transformation(extent={{220,-86},{222,-66}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5610(
      np=1,
      nn=1,
      V_0=pSSE_data.voltages.V5610,
      angle_0=pSSE_data.voltages.A5610,
      V_b=300)
      annotation (Placement(transformation(extent={{242,-116},{244,-96}})));
    OpenIPSL.Electrical.Branches.PwLine line_5603_5610(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={233,-91})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5610(
      V_b=300,
      V_0=pSSE_data.voltages.V5610,
      angle_0=pSSE_data.voltages.A5610,
      P_0=pSSE_data.powers.PL5610,
      Q_0=pSSE_data.powers.QL5610,
      characteristic=2) annotation (Placement(transformation(
          extent={{3.25,-2.75},{-3.25,2.75}},
          rotation=90,
          origin={254.75,-104.75})));
    OpenIPSL.Electrical.Buses.BusExt bus_5602(
      nn=1,
      V_0=pSSE_data.voltages.V5602,
      angle_0=pSSE_data.voltages.A5602,
      V_b=420,
      np=1) annotation (Placement(transformation(extent={{182,-86},{184,-66}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5500(
      nn=4,
      np=3,
      V_0=pSSE_data.voltages.V5500,
      angle_0=pSSE_data.voltages.A5500,
      V_b=300)
      annotation (Placement(transformation(extent={{76,-90},{78,-58}})));
    OpenIPSL.Electrical.Branches.PwLine line_5500_5603(
      R=0.050000,
      X=0.600000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={114,-89})));
    Generators.Gen5_bus_5500 G1_bus5500
      annotation (Placement(transformation(extent={{96,-71},{90,-77}})));
    OpenIPSL.Electrical.Branches.PwLine line_5400_5500(
      R=0.009000,
      X=0.940000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={125,-63})));
    OpenIPSL.Electrical.Buses.BusExt bus_5401(
      nn=1,
      np=3,
      V_0=pSSE_data.voltages.V5401,
      angle_0=pSSE_data.voltages.A5401,
      V_b=420)
      annotation (Placement(transformation(extent={{122,-44},{124,-24}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5501(
      np=1,
      nn=2,
      V_0=pSSE_data.voltages.V5501,
      angle_0=pSSE_data.voltages.A5501,
      V_b=420) annotation (Placement(transformation(extent={{80,-26},{82,-6}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5500(
      V_b=300,
      V_0=pSSE_data.voltages.V5500,
      angle_0=pSSE_data.voltages.A5500,
      P_0=pSSE_data.powers.PL5500,
      Q_0=pSSE_data.powers.QL5500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={63.75,-75.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus5500(
      V_b=300,
      V_0=pSSE_data.voltages.V5500,
      angle_0=pSSE_data.voltages.A5500,
      P_0=pSSE_data.powers.PL5500,
      Q_0=pSSE_data.powers.QL5500,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={63.75,-83.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5401_5501(
      R=0.017500,
      X=0.270000,
      G=0,
      B=0.080000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={106,-16})));
    OpenIPSL.Electrical.Buses.BusExt bus_5400(
      np=3,
      nn=4,
      V_0=pSSE_data.voltages.V5400,
      angle_0=pSSE_data.voltages.A5400,
      V_b=300)
      annotation (Placement(transformation(extent={{180,-56},{182,-36}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5402(
      nn=1,
      V_0=pSSE_data.voltages.V5402,
      angle_0=pSSE_data.voltages.A5402,
      V_b=420,
      np=1) annotation (Placement(transformation(extent={{194,-18},{196,2}})));
    OpenIPSL.Electrical.Branches.PwLine line_5401_6001(
      R=0.006400,
      X=0.100000,
      G=0,
      B=0.028000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={135,-10})));
    OpenIPSL.Electrical.Branches.PwLine line_5401_5602(
      R=0.016000,
      X=0.255000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=90,
          origin={135,-50})));
    Generators.Gen5_bus_5400 G1_bus5400
      annotation (Placement(transformation(extent={{162,-60},{168,-54}})));
    Generators.Gen5_bus_5400 G2_bus5400
      annotation (Placement(transformation(extent={{202,-50},{196,-56}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5400(
      V_b=300,
      V_0=pSSE_data.voltages.V5400,
      angle_0=pSSE_data.voltages.A5400,
      P_0=pSSE_data.powers.PL5400,
      Q_0=pSSE_data.powers.QL5400,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={165.75,-45.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5402_6001(
      R=0.000700,
      X=0.010000,
      G=0,
      B=0.003000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=90,
          origin={188,3})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5101_5501(G=0.02230, B=-0.97440)
      annotation (Placement(transformation(extent={{36,-6},{40,0}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5501_5101(G=-0.02160, B=0.97440)
      annotation (Placement(transformation(extent={{46,-6},{50,0}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5102_6001(G=0.00020, B=0.00010)
      annotation (Placement(transformation(extent={{128,6},{132,12}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_6001_5102(G=0.00020, B=-0.00010)
      annotation (Placement(transformation(extent={{140,6},{144,12}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_6001_5401(G=0.00020, B=0.00050)
      annotation (Placement(transformation(extent={{141,-20},{145,-14}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5401_6001(G=-0.00020, B=-0.00050)
      annotation (Placement(transformation(extent={{126,-20},{130,-14}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5500_5603(G=0.00030, B=0.00130)
      annotation (Placement(transformation(extent={{104,-98},{108,-92}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5603_5500(G=-0.00030, B=-0.00130)
      annotation (Placement(transformation(extent={{120,-98},{124,-92}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_3244_3245(
      R=0.005,
      X=0.02,
      G=0,
      B=0,
      t1=1,
      t2=1) annotation (Placement(transformation(
          extent={{6,4},{-6,-4}},
          rotation=0,
          origin={-190,-80})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_3249_3701(
      R=0.02,
      X=0.5,
      G=0,
      B=0,
      t2=1,
      t1=0.9936508) annotation (Placement(transformation(
          extent={{-7,5},{7,-5}},
          rotation=180,
          origin={-141,-9})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5100_5101(
      R=0.0008,
      X=0.0305,
      G=0,
      B=0,
      t2=1,
      t1=1.012699) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=270,
          origin={30,-26})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5300_5301(
      R=0.0016,
      X=0.061,
      G=0,
      B=0,
      t1=1,
      t2=1) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=0,
          origin={220,90})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5400_5401(
      R=0.0032,
      X=0.12,
      G=0,
      B=0,
      t1=1.00635,
      t2=1) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=0,
          origin={154,-34})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5400_5402(
      R=0.0004,
      X=0.015,
      G=0,
      B=0,
      t1=1,
      t2=1) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=-90,
          origin={200,-28})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5500_5501(
      R=0.0004,
      X=0.015,
      G=0,
      B=0,
      t1=1.0126,
      t2=1) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=-90,
          origin={70,-38})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5601_6001(
      R=0.0002,
      X=0.0076,
      G=0,
      B=0,
      t2=1,
      t1=1.005362) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=0,
          origin={228,26})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_5602_5603(
      R=0.0008,
      X=0.0305,
      G=0,
      B=0,
      t2=1,
      t1=0.9428532) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=0,
          origin={204,-72})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_6000_6001(
      R=0.0004,
      X=0.015,
      G=0,
      B=0,
      t1=1.00625,
      t2=1) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=0,
          origin={206,16})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_6700_6701(
      R=0.005,
      X=0.02,
      G=0,
      B=0,
      t1=1.0125,
      t2=1) annotation (Placement(transformation(
          extent={{-6,4},{6,-4}},
          rotation=180,
          origin={-118,-84})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo_3359_3360(
      R=0.005,
      X=0.02,
      G=0,
      B=0,
      t1=0.9998,
      t2=1)
      annotation (Placement(transformation(extent={{-114,136},{-102,144}})));
    Original.Data.PSSE_data_Original_case pSSE_data
      annotation (Placement(transformation(extent={{-286,192},{-266,212}})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=1000)
      annotation (Placement(transformation(extent={{176,172},{278,208}})));
  equation
    connect(G9_bus7000.pwPin, bus_7000.n[1]) annotation (Line(
        points={{-285.7,-143},{-274.075,-143},{-274.075,-92.25},{-272,-92.25}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G8_bus7000.pwPin, bus_7000.n[2]) annotation (Line(
        points={{-285.7,-135},{-275.075,-135},{-275.075,-89.55},{-272,-89.55}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G7_bus7000.pwPin, bus_7000.n[3]) annotation (Line(
        points={{-285.7,-127},{-276.075,-127},{-276.075,-86.85},{-272,-86.85}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G6_bus7000.pwPin, bus_7000.n[4]) annotation (Line(
        points={{-285.7,-119},{-277.075,-119},{-277.075,-84.15},{-272,-84.15}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G5_bus7000.pwPin, bus_7000.n[5]) annotation (Line(
        points={{-285.7,-111},{-278.075,-111},{-278.075,-81.45},{-272,-81.45}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G4_bus7000.pwPin, bus_7000.n[6]) annotation (Line(
        points={{-285.7,-103},{-279.075,-103},{-279.075,-78.75},{-272,-78.75}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G3_bus7000.pwPin, bus_7000.n[7]) annotation (Line(
        points={{-285.7,-95},{-280.075,-95},{-280.075,-76.05},{-272,-76.05}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G2_bus7000.pwPin, bus_7000.n[8]) annotation (Line(
        points={{-285.7,-87},{-281.075,-87},{-281.075,-73.35},{-272,-73.35}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G1_bus7000.pwPin, bus_7000.n[9]) annotation (Line(
        points={{-285.7,-79},{-281.075,-79},{-281.075,-70.65},{-272,-70.65}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load5_bus7000.p, bus_7000.n[10]) annotation (Line(
        points={{-285.8,-60},{-283.9,-60},{-283.9,-67.95},{-272,-67.95}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load4_bus7000.p, bus_7000.n[11]) annotation (Line(
        points={{-283.8,-54},{-282.9,-54},{-282.9,-65.25},{-272,-65.25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus7000.p, bus_7000.n[12]) annotation (Line(
        points={{-283.8,-48},{-281.9,-48},{-281.9,-62.55},{-272,-62.55}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus7000.p, bus_7000.n[13]) annotation (Line(
        points={{-283.8,-42},{-280.9,-42},{-280.9,-59.85},{-272,-59.85}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7000.p, bus_7000.n[14]) annotation (Line(
        points={{-283.8,-36},{-279.9,-36},{-279.9,-57.15},{-272,-57.15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7020.p, bus_7020.n[1]) annotation (Line(
        points={{-286.325,-15.75},{-283.9,-15.75},{-283.9,-15},{-282,-15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7010.p, bus_7010.n[1]) annotation (Line(
        points={{-286.325,4.25},{-283.9,4.25},{-283.9,5},{-282,5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_7010.p[1], line_7000_7010.p) annotation (Line(
        points={{-280,5},{-278,5},{-278,4.83333},{-275,4.83333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_7020.p[1], line_7000_7020.p) annotation (Line(
        points={{-280,-15},{-278,-15},{-278,-23.1667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7020.n, bus_7000.n[15]) annotation (Line(
        points={{-278,-34.8333},{-278,-54.25},{-272,-54.25},{-272,-54.45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7010.n, bus_7000.n[16]) annotation (Line(
        points={{-275,-6.83333},{-275,-26},{-274,-26},{-274,-52},{-272,-52},{-272,
            -51.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_3.n, bus_7000.p[1]) annotation (Line(
        points={{-254,-74.8333},{-254,-87.25},{-270,-87.25},{-270,-86.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_2.n, bus_7000.p[2]) annotation (Line(
        points={{-257,-62.8333},{-257.5,-62.8333},{-257.5,-72},{-270,-72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_1.n, bus_7000.p[3]) annotation (Line(
        points={{-260,-52.8333},{-260,-54},{-262,-54},{-262,-58},{-270,-58},{-270,
            -57.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_3.p, bus_7100.n[1]) annotation (Line(
        points={{-254,-63.1667},{-254,-42.975},{-252,-42.975}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_2.p, bus_7100.n[2]) annotation (Line(
        points={{-257,-51.1667},{-257,-40.125},{-252,-40.125}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_1.p, bus_7100.n[3]) annotation (Line(
        points={{-260,-41.1667},{-260,-37.275},{-252,-37.275}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus7100.p, bus_7100.n[4]) annotation (Line(
        points={{-261.8,-35},{-254.9,-35},{-254.9,-34.425},{-252,-34.425}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7100.p, bus_7100.n[5]) annotation (Line(
        points={{-261.8,-30},{-257.9,-30},{-257.9,-31.575},{-252,-31.575}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_7100.p[1], line_3249_7100.n) annotation (Line(
        points={{-250,-38.7},{-244,-38.7},{-244,-45},{-236.833,-45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus3000.p, bus_3000.n[1]) annotation (Line(
        points={{-270.325,32.25},{-264,32.25},{-264,50.8571},{-258,50.8571}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus3000.p, bus_3000.n[2]) annotation (Line(
        points={{-270.325,39.25},{-266,39.25},{-266,52.5714},{-258,52.5714}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load1_bus3000.p, bus_3000.n[3]) annotation (Line(
        points={{-270.325,45.25},{-268,45.25},{-268,54.2857},{-258,54.2857}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G3_bus3000.pwPin, bus_3000.n[4]) annotation (Line(
        points={{-273.7,51},{-270,51},{-270,56},{-258,56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3000.pwPin, bus_3000.n[5]) annotation (Line(
        points={{-273.7,59},{-273.7,57.7143},{-258,57.7143}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3000.pwPin, bus_3000.n[6]) annotation (Line(
        points={{-273.7,67},{-265.075,67},{-265.075,59.4286},{-258,59.4286}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3000_3020.n, bus_3000.n[7]) annotation (Line(
        points={{-263.167,79},{-262,79},{-262,61.1429},{-258,61.1429}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3115.p, bus_3000.p[1]) annotation (Line(
        points={{-244.833,29},{-254,29},{-254,51.2},{-256,51.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3245_2.p, bus_3000.p[2]) annotation (Line(
        points={{-252,20.8333},{-252,53.6},{-256,53.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3245_1.p, bus_3000.p[3]) annotation (Line(
        points={{-239.833,56},{-256,56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_2.n, bus_3000.p[4]) annotation (Line(
        points={{-249,59.1667},{-252.5,59.1667},{-252.5,58.4},{-256,58.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_1.n, bus_3000.p[5]) annotation (Line(
        points={{-249,69.1667},{-254,69.1667},{-254,60.8},{-256,60.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3020.p, bus_3020.n[1]) annotation (Line(
        points={{-286.325,77.25},{-283.9,77.25},{-283.9,80},{-282,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_2.p, bus_3300.n[1]) annotation (Line(
        points={{-249,70.8333},{-222,70.8333},{-222,93.2},{-220,93.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_1.p, bus_3300.n[2]) annotation (Line(
        points={{-249,80.8333},{-224,80.8333},{-224,95.6},{-220,95.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3300.pwPin, bus_3300.n[3]) annotation (Line(
        points={{-229.7,92},{-225,92},{-225,98},{-220,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus3300.p, bus_3300.n[4]) annotation (Line(
        points={{-228.325,97.75},{-228,97.75},{-228,100.4},{-220,100.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus3300.p, bus_3300.n[5]) annotation (Line(
        points={{-228.325,102.25},{-228,102.25},{-228,102.8},{-220,102.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3300.pwPin, bus_3300.p[1]) annotation (Line(
        points={{-208.3,89},{-212.94,89},{-212.94,93.2},{-218,93.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3300.pwPin, bus_3300.p[2]) annotation (Line(
        points={{-208.3,97},{-212.94,97},{-212.94,95.6},{-218,95.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_3300.p, bus_3300.p[3]) annotation (Line(
        points={{-202.833,103},{-209.25,103},{-209.25,98},{-218,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_1.p, bus_3200.n[1]) annotation (Line(
        points={{-181,82.8333},{-181,86.25},{-178,86.25},{-178,93.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_2.p, bus_3200.n[2]) annotation (Line(
        points={{-187,82.8333},{-187,86},{-182,86},{-182,95.6},{-178,95.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_3.p, bus_3200.n[3]) annotation (Line(
        points={{-193,82.8333},{-193,90},{-184,90},{-184,98},{-178,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_3300.n, bus_3200.n[4]) annotation (Line(
        points={{-191.167,103},{-185.75,103},{-185.75,100.4},{-178,100.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3300_8500_2.n, bus_3300.p[4]) annotation (Line(
        points={{-207,113.167},{-207,108},{-211,108},{-211,100.4},{-218,100.4}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3300_8500_1.n, bus_3300.p[5]) annotation (Line(
        points={{-211,113.167},{-211,110},{-214,110},{-214,102.8},{-218,102.8}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3300_8500_2.p, bus_8500.n[1]) annotation (Line(
        points={{-207,124.833},{-207,126},{-202,126},{-202,133.975},{-198,
            133.975}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3300_8500_1.p, bus_8500.n[2]) annotation (Line(
        points={{-211,124.833},{-211,128},{-204,128},{-204,137.125},{-198,
            137.125}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G2_bus8500.pwPin, bus_8500.n[3]) annotation (Line(
        points={{-211.7,133},{-206,133},{-206,140.275},{-198,140.275}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus8500.pwPin, bus_8500.n[4]) annotation (Line(
        points={{-211.7,141},{-208,141},{-208,143.425},{-198,143.425}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus8500.p, bus_8500.n[5]) annotation (Line(
        points={{-211.8,148},{-208,148},{-208,146.575},{-198,146.575}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus8500.p, bus_8500.n[6]) annotation (Line(
        points={{-210.325,156.25},{-210,156.25},{-210,149.725},{-198,149.725}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load1_bus8500.p, bus_8500.n[7]) annotation (Line(
        points={{-210.325,162.25},{-206,162.25},{-206,152.875},{-198,152.875}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_8500_8700.n, bus_8500.n[8]) annotation (Line(
        points={{-209.167,167},{-204,167},{-204,156.025},{-198,156.025}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_8500.p, bus_8500.p[1]) annotation (Line(
        points={{-189,126.833},{-189,126},{-194,126},{-194,133.975},{-196,
            133.975}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3359_8500_1.p, bus_8500.p[2]) annotation (Line(
        points={{-166.833,129},{-192,129},{-192,137.125},{-196,137.125}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_8500_2.p, bus_8500.p[3]) annotation (Line(
        points={{-166.833,133},{-190,133},{-190,140.275},{-196,140.275}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G6_bus8500.pwPin, bus_8500.p[4]) annotation (Line(
        points={{-184.3,139},{-188,139},{-188,143.425},{-196,143.425}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus8500.pwPin, bus_8500.p[5]) annotation (Line(
        points={{-184.3,147},{-186,147},{-186,146.575},{-196,146.575}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus8500.pwPin, bus_8500.p[6]) annotation (Line(
        points={{-184.3,155},{-186,155},{-186,149.725},{-196,149.725}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus8500.pwPin, bus_8500.p[7]) annotation (Line(
        points={{-182.3,163},{-188,163},{-188,152.875},{-196,152.875}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8700.p, bus_8700.p[1]) annotation (Line(
        points={{-220.833,167},{-227.25,167},{-227.25,166},{-236,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus8700.p, bus_8700.n[1]) annotation (Line(
        points={{-244.325,166.25},{-241.9,166.25},{-241.9,166},{-238,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8600.n, bus_8500.p[8]) annotation (Line(
        points={{-184.833,169},{-190,169},{-190,156.025},{-196,156.025}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8600.p, bus_8600.n[1]) annotation (Line(
        points={{-173.167,169},{-168.75,169},{-168.75,166},{-162,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus8600.p, bus_8600.p[1]) annotation (Line(
        points={{-153.65,166.5},{-157.1,166.5},{-157.1,166},{-160,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_8500.n, bus_3200.n[5]) annotation (Line(
        points={{-189,115.167},{-189,106},{-180,106},{-180,102.8},{-178,102.8}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3200_3359.p, bus_3200.p[1]) annotation (Line(
        points={{-158.833,99},{-166.25,99},{-166.25,98},{-176,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_3100.p[1], line_3100_3359_2.p) annotation (Line(
        points={{-176,43},{-163,43},{-163,51},{-160.833,51}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_3100.p[2], line_3100_3359_1.p) annotation (Line(
        points={{-176,49},{-168,49},{-168,57},{-160.833,57}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3359_2.n, bus_3359.n[1]) annotation (Line(
        points={{-149.167,51},{-128,51},{-128,67.5333},{-124,67.5333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3359_1.n, bus_3359.n[2]) annotation (Line(
        points={{-149.167,57},{-132,57},{-132,71.4},{-124,71.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load4_bus3359.p, bus_3359.n[3]) annotation (Line(
        points={{-136.325,74.25},{-133.9,74.25},{-133.9,75.2667},{-124,75.2667}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load3_bus3359.p, bus_3359.n[4]) annotation (Line(
        points={{-134.325,78.25},{-129.9,78.25},{-129.9,79.1333},{-124,79.1333}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus3359.p, bus_3359.n[5]) annotation (Line(
        points={{-132.325,82.25},{-130.9,82.25},{-130.9,83},{-124,83}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus3359.p, bus_3359.n[6]) annotation (Line(
        points={{-130.325,86.75},{-129.9,86.75},{-129.9,86.8667},{-124,86.8667}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3200_3359.n, bus_3359.n[7]) annotation (Line(
        points={{-147.167,99},{-129,99},{-129,92},{-125,92},{-125,90.7333},{-124,
            90.7333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_8500_1.n, bus_3359.n[8]) annotation (Line(
        points={{-155.167,129},{-137,129},{-137,106},{-127,106},{-127,94.6},{-124,
            94.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_8500_2.n, bus_3359.n[9]) annotation (Line(
        points={{-155.167,133},{-127,133},{-127,108},{-125,108},{-125,98.4667},
            {-124,98.4667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3360.p, bus_3360.p[1]) annotation (Line(
        points={{-85.675,140.25},{-89.1,140.25},{-89.1,140},{-94,140}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3249.p, bus_3100.n[1]) annotation (Line(
        points={{-189,20.8333},{-189,38},{-182,38},{-182,41},{-178,41}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3115.p, bus_3100.n[2]) annotation (Line(
        points={{-200.167,34},{-196,34},{-196,40},{-184,40},{-184,43},{-178,43}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load_bus3100.p, bus_3100.n[3]) annotation (Line(
        points={{-194.325,47.25},{-186.9,47.25},{-186.9,45},{-178,45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_3.n, bus_3100.n[4]) annotation (Line(
        points={{-193,71.1667},{-193,52},{-184,52},{-184,47},{-178,47}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_2.n, bus_3100.n[5]) annotation (Line(
        points={{-187,71.1667},{-187,58},{-182,58},{-182,48},{-180,48},{-180,49},
            {-178,49}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_1.n, bus_3100.n[6]) annotation (Line(
        points={{-181,71.1667},{-181,62},{-180,62},{-180,50},{-178,50},{-178,51}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3115_6701.n, bus_6701.n[1]) annotation (Line(
        points={{-204,-41.8333},{-204,-60},{-172,-60},{-172,-84},{-146,-84}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(bus_3701.p[1], line_3701_6700.n) annotation (Line(
        points={{-116,-60},{-108,-60},{-108,-69},{-100.833,-69}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_3244.p[1], line_3244_6500.n) annotation (Line(
        points={{-176,-96},{-160,-96},{-160,-111},{-116.833,-111}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_6700.p[1], line_6500_6700_2.n) annotation (Line(
        points={{-76,-88},{-70,-88},{-70,-91},{-56.8333,-91}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6500_6700_1.n, bus_6700.p[2]) annotation (Line(
        points={{-56.8333,-85},{-70.25,-85},{-70.25,-84},{-76,-84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3244_6500.p, bus_6500.n[1]) annotation (Line(
        points={{-105.167,-111},{-46,-111},{-46,-119},{-24,-119},{-24,-111},{-20,
            -111}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus6500.p, bus_6500.n[2]) annotation (Line(
        points={{-30.325,-111.75},{-25.9,-111.75},{-25.9,-106.6},{-20,-106.6}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus6500.p, bus_6500.n[3]) annotation (Line(
        points={{-30.325,-103.75},{-25.9,-103.75},{-25.9,-102.2},{-20,-102.2}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load1_bus6500.p, bus_6500.n[4]) annotation (Line(
        points={{-30.325,-97.75},{-25.9,-97.75},{-25.9,-97.8},{-20,-97.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6500_6700_2.p, bus_6500.n[5]) annotation (Line(
        points={{-45.1667,-91},{-38.75,-91},{-38.75,-93.4},{-20,-93.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6500_6700_1.p, bus_6500.n[6]) annotation (Line(
        points={{-45.1667,-85},{-38.75,-85},{-38.75,-89},{-20,-89}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5100.p[1], line_5100_5500.n) annotation (Line(
        points={{24,-67},{32,-67},{32,-65},{35.1667,-65}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_2.n, bus_3359.p[1]) annotation (Line(
        points={{-70.8333,11},{-118,11},{-118,67.5333},{-122,67.5333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_1.n, bus_3359.p[2]) annotation (Line(
        points={{-70.8333,17},{-114,17},{-114,71.4},{-122,71.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G6_bus3359.pwPin, bus_3359.p[3]) annotation (Line(
        points={{-98.3,67},{-111.94,67},{-111.94,75.2667},{-122,75.2667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus3359.pwPin, bus_3359.p[4]) annotation (Line(
        points={{-98.3,75},{-109.94,75},{-109.94,79.1333},{-122,79.1333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus3359.pwPin, bus_3359.p[5]) annotation (Line(
        points={{-98.3,83},{-110,83},{-110,83},{-122,83}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3359.pwPin, bus_3359.p[6]) annotation (Line(
        points={{-98.3,91},{-110.94,91},{-110.94,86.8667},{-122,86.8667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3359.pwPin, bus_3359.p[7]) annotation (Line(
        points={{-98.3,99},{-111.94,99},{-111.94,90.7333},{-122,90.7333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3359.pwPin, bus_3359.p[8]) annotation (Line(
        points={{-98.3,107},{-112.94,107},{-112.94,94.6},{-122,94.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_2.p, bus_5101.n[1]) annotation (Line(
        points={{-59.1667,11},{15.25,11},{15.25,4},{22,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_1.p, bus_5101.n[2]) annotation (Line(
        points={{-59.1667,17},{15.25,17},{15.25,8},{22,8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5101.p[1], line_5101_5501.n) annotation (Line(
        points={{24,4},{32,4},{32,3},{37.1667,3}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5101.p[2], line_5101_5102.n) annotation (Line(
        points={{24,8},{32,8},{32,9},{37.1667,9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5101.p[3], line_5101_5103.n) annotation (Line(
        points={{24,12},{32,12},{32,15},{37.1667,15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5103.p, bus_5103.n[1]) annotation (Line(
        points={{48.8333,15},{63.25,15},{63.25,48},{80,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_5103.n, bus_5103.p[1]) annotation (Line(
        points={{91.1667,41},{87.75,41},{87.75,44},{82,44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_2.n, bus_5103.p[2]) annotation (Line(
        points={{91.1667,47},{87.75,47},{87.75,48},{82,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_1.n, bus_5103.p[3]) annotation (Line(
        points={{91.1667,53},{87.75,53},{87.75,52},{82,52}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_5304.p, bus_5304.n[1]) annotation (Line(
        points={{116,54.8333},{116,76},{122,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_2.p, bus_5304.n[2]) annotation (Line(
        points={{102.833,47},{108,47},{108,80},{122,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_1.p, bus_5304.n[3]) annotation (Line(
        points={{102.833,53},{104,53},{104,84},{122,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5102.p, bus_5102.n[1]) annotation (Line(
        points={{48.8333,9},{84.25,9},{84.25,10},{122,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5102.n[2], line_5102_5103.p) annotation (Line(
        points={{122,14},{112,14},{112,24},{104,24},{104,41},{102.833,41}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_5304.n, bus_5102.n[3]) annotation (Line(
        points={{116,43.1667},{116,18},{122,18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5102.p[1], line_5102_6001.n) annotation (Line(
        points={{124,14},{130.167,14}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_5304.n, bus_5304.p[1]) annotation (Line(
        points={{153.167,75},{139.75,75},{139.75,76},{124,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_2.n, bus_5304.p[2]) annotation (Line(
        points={{141,91.1667},{141,80},{124,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_1.n, bus_5304.p[3]) annotation (Line(
        points={{135,91.1667},{135,84},{124,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_2.p, bus_5305.n[1]) annotation (Line(
        points={{141,102.833},{141,117},{162,117}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_1.p, bus_5305.n[2]) annotation (Line(
        points={{135,102.833},{135,123},{162,123}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5305.p[1], line_5301_5305.p) annotation (Line(
        points={{164,120},{183,120},{183,102.833}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_6001.p, bus_5301.n[1]) annotation (Line(
        points={{172,58.8333},{172,64},{186,64},{186,76},{200,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_5304.p, bus_5301.n[2]) annotation (Line(
        points={{164.833,75},{181.25,75},{181.25,80},{200,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_5305.n, bus_5301.n[3]) annotation (Line(
        points={{183,91.1667},{183,84},{200,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5300_6100.p, bus_5300.p[1]) annotation (Line(
        points={{253.167,75},{248.75,75},{248.75,77},{242,77}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6000_6100.p, bus_6100.n[1]) annotation (Line(
        points={{254,36.8333},{254,40},{278,40},{278,43.2},{280,43.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_5603.n, bus_5600.n[1]) annotation (Line(
        points={{260.833,-53},{272,-53},{272,-48.5},{280,-48.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus5600.p, bus_5600.n[2]) annotation (Line(
        points={{269.775,-44.75},{272.1,-44.75},{272.1,-45.5},{280,-45.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus5600.p, bus_5600.n[3]) annotation (Line(
        points={{269.775,-34.75},{272.1,-34.75},{272.1,-42.5},{280,-42.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_6000.n, bus_5600.n[4]) annotation (Line(
        points={{270.833,-1},{274,-1},{274,-39.5},{280,-39.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5601.p[1], line_5600_5601.p) annotation (Line(
        points={{282,8},{289,8},{289,-9.16667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5620.p[1], line_5600_5620.n) annotation (Line(
        points={{282,-94},{288,-94},{288,-76.8333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5603_5610.n, bus_5610.n[1]) annotation (Line(
        points={{233,-96.8333},{233,-106},{242,-106}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5603.p[1], line_5603_5610.p) annotation (Line(
        points={{222,-79},{233,-79},{233,-85.1667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5610.p[1], Load1_bus5610.p) annotation (Line(
        points={{244,-106},{245.9,-106},{245.9,-104.75},{251.725,-104.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5500_5603.p, bus_5603.n[1]) annotation (Line(
        points={{119.833,-89},{168,-89},{168,-100},{196,-100},{196,-79},{220,-79}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus5500.p, bus_5500.n[1]) annotation (Line(
        points={{65.675,-83.75},{71.1,-83.75},{71.1,-81.2},{76,-81.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus5500.p, bus_5500.n[2]) annotation (Line(
        points={{65.675,-75.75},{70.1,-75.75},{70.1,-76.4},{76,-76.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5100_5500.p, bus_5500.n[3]) annotation (Line(
        points={{46.8333,-65},{60.25,-65},{60.25,-71.6},{76,-71.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5501.p, bus_5501.n[1]) annotation (Line(
        points={{48.8333,3},{72,3},{72,-19},{80,-19}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5501.p[1], line_5401_5501.n) annotation (Line(
        points={{82,-16},{100.167,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_5501.p, bus_5401.n[1]) annotation (Line(
        points={{111.833,-16},{111.25,-16},{111.25,-34},{122,-34}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_6001.p, bus_6001.n[1]) annotation (Line(
        points={{140.833,-10},{140.833,2},{150,2},{150,18},{182,18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_5602.n, bus_5401.p[1]) annotation (Line(
        points={{135,-44.1667},{135,-38},{124,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_5602.p, bus_5602.n[1]) annotation (Line(
        points={{135,-55.8333},{135,-76},{182,-76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5402_6001.p, bus_5402.n[1]) annotation (Line(
        points={{188,-2.83333},{188,-8},{194,-8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_6001.p, bus_6001.n[2]) annotation (Line(
        points={{141.833,14},{146,14},{146,22},{182,22}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_6001.n[3], line_5301_6001.n) annotation (Line(
        points={{182,26},{172,26},{172,47.1667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_6000.p, bus_6000.p[1]) annotation (Line(
        points={{259.167,-1},{242,-1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_6000.p[2], line_6000_6100.n) annotation (Line(
        points={{242,5},{254,5},{254,25.1667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5501.n, shunt_5101_5501.p) annotation (Line(
        points={{37.1667,3},{37.1667,1.5},{37.92,1.5},{37.92,-0.72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5501.p, shunt_5501_5101.p) annotation (Line(
        points={{48.8333,3},{48.8333,0.5},{47.92,0.5},{47.92,-0.72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_6001.n, shunt_5102_6001.p) annotation (Line(
        points={{130.167,14},{133,14},{133,11.28},{129.92,11.28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_6001.p, shunt_6001_5102.p) annotation (Line(
        points={{141.833,14},{139,14},{139,11.28},{141.92,11.28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(shunt_5401_6001.p, line_5401_6001.n) annotation (Line(
        points={{127.92,-14.72},{127.92,-10},{129.167,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_6001.p, shunt_6001_5401.p) annotation (Line(
        points={{140.833,-10},{142.92,-10},{142.92,-14.72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(shunt_5500_5603.p, line_5500_5603.n) annotation (Line(
        points={{105.92,-92.72},{108.167,-92.72},{108.167,-89}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5500_5603.p, shunt_5603_5500.p) annotation (Line(
        points={{119.833,-89},{119.833,-92.72},{121.92,-92.72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_5603.p, bus_5603.p[2]) annotation (Line(
        points={{249.167,-53},{241.75,-53},{241.75,-73},{222,-73}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus7100.p, bus_7100.n[6]) annotation (Line(
        points={{-259.7,-23},{-257,-23},{-257,-28.725},{-252,-28.725}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus7100.p, bus_7100.n[7]) annotation (Line(
        points={{-259.7,-17},{-255,-17},{-255,-25.875},{-252,-25.875}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus7100.p, bus_7100.n[8]) annotation (Line(
        points={{-259.7,-11},{-254,-11},{-254,-24},{-252,-24},{-252,-23.025}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G7_bus3249.p, bus_3249.p[1]) annotation (Line(
        points={{-164.3,-37},{-169.15,-37},{-169.15,-36.92},{-174,-36.92}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G6_bus3249.p, bus_3249.p[2]) annotation (Line(
        points={{-164.3,-29},{-169.15,-29},{-169.15,-29.96},{-174,-29.96}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus3249.p, bus_3249.p[3]) annotation (Line(
        points={{-164.3,-23},{-170,-23},{-170,-23},{-174,-23}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus3249.p, bus_3249.p[4]) annotation (Line(
        points={{-164.3,-15},{-169.15,-15},{-169.15,-16.04},{-174,-16.04}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6700.p, bus_6700.n[1]) annotation (Line(
        points={{-91.7,-95},{-82,-95},{-82,-88.5},{-78,-88.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus6700.p, bus_6700.n[2]) annotation (Line(
        points={{-90.325,-87.75},{-84,-87.75},{-84,-85.5},{-78,-85.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3701_6700.p, bus_6700.n[3]) annotation (Line(
        points={{-89.1667,-69},{-82,-69},{-82,-82.5},{-78,-82.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus6700.p, bus_6700.p[3]) annotation (Line(
        points={{-64.3,-77},{-70.15,-77},{-70.15,-80},{-76,-80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5401.p[2], line_5401_6001.n) annotation (Line(
        points={{124,-34},{132,-34},{132,-28},{129.167,-28},{129.167,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus5400.p, bus_5400.p[1]) annotation (Line(
        points={{195.7,-53},{188.85,-53},{188.85,-50},{182,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_6000.n, bus_5400.p[2]) annotation (Line(
        points={{216.167,-23},{206,-23},{206,-46},{182,-46}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus5300.p, bus_5300.p[2]) annotation (Line(
        points={{255.7,85},{248.85,85},{248.85,83},{242,83}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6100.p, bus_6100.n[2]) annotation (Line(
        points={{268.3,45},{276,45},{276,45.6},{280,45.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus6100.p, bus_6100.n[3]) annotation (Line(
        points={{269.775,53.25},{271.1,53.25},{271.1,48},{280,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus6100.p, bus_6100.n[4]) annotation (Line(
        points={{269.775,63.25},{274,63.25},{274,50.4},{280,50.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5300_6100.n, bus_6100.n[5]) annotation (Line(
        points={{264.833,75},{276,75},{276,52.8},{280,52.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus6100.p, bus_6100.p[1]) annotation (Line(
        points={{289.7,37},{286,37},{286,43.5},{282,43.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus6100.p, bus_6100.p[2]) annotation (Line(
        points={{289.7,45},{287.85,45},{287.85,46.5},{282,46.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus6100.p, bus_6100.p[3]) annotation (Line(
        points={{289.7,53},{287.85,53},{287.85,49.5},{282,49.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus6100.p, bus_6100.p[4]) annotation (Line(
        points={{289.7,61},{286,61},{286,52.5},{282,52.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus5620.p, bus_5620.n[1]) annotation (Line(
        points={{269.775,-94.75},{271.9,-94.75},{271.9,-94},{280,-94}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_7100.n, bus_3115.n[1]) annotation (Line(
        points={{-233.167,-26},{-233.75,-26},{-233.75,-6.5},{-228,-6.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3115.p, bus_3115.n[2]) annotation (Line(
        points={{-236.25,-4.5},{-231.9,-4.5},{-231.9,-1.1},{-228,-1.1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3115.p, bus_3115.n[3]) annotation (Line(
        points={{-235.7,3},{-231.85,3},{-231.85,4.3},{-228,4.3}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3115.p, bus_3115.n[4]) annotation (Line(
        points={{-235.7,11},{-228,11},{-228,9.7}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3115.p, bus_3115.n[5]) annotation (Line(
        points={{-235.7,17},{-228,17},{-228,15.1}},
        color={0,0,255},
        smooth=Smooth.Bezier));
    connect(line_3000_3115.n, bus_3115.n[6]) annotation (Line(
        points={{-233.167,29},{-233.5,29},{-233.5,20.5},{-228,20.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_7100.p, bus_7100.p[2]) annotation (Line(
        points={{-244.833,-26},{-244.833,-26.5},{-250,-26.5},{-250,-27.3}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus6500.p, bus_6500.p[1]) annotation (Line(
        points={{-4.3,-117},{-12,-117},{-12,-110.56},{-18,-110.56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus6500.p, bus_6500.p[2]) annotation (Line(
        points={{-4.3,-109},{-11.15,-109},{-11.15,-105.28},{-18,-105.28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus6500.p, bus_6500.p[3]) annotation (Line(
        points={{-4.3,-101},{-11.15,-101},{-11.15,-100},{-18,-100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6500.p, bus_6500.p[4]) annotation (Line(
        points={{-4.3,-93},{-11.15,-93},{-11.15,-94.72},{-18,-94.72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5100_6500.n, bus_6500.p[5]) annotation (Line(
        points={{-2.83333,-79},{-6,-79},{-6,-89.44},{-18,-89.44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_3245.p, bus_3115.p[1]) annotation (Line(
        points={{-212,-13.1667},{-220,-13.1667},{-220,-5.15},{-226,-5.15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_6701.p, bus_3115.p[2]) annotation (Line(
        points={{-204,-30.1667},{-204.5,-30.1667},{-204.5,2.95},{-226,2.95}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3115_3249.n, bus_3115.p[3]) annotation (Line(
        points={{-212.833,11},{-218.25,11},{-218.25,11.05},{-226,11.05}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3115.n, bus_3115.p[4]) annotation (Line(
        points={{-211.833,34},{-211.833,19.15},{-226,19.15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_6000.p, bus_6000.n[1]) annotation (Line(
        points={{227.833,-23},{236,-23},{236,-2},{240,-2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6000.p, bus_6000.n[2]) annotation (Line(
        points={{227.4,2},{234,2},{234,2},{240,2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5100_6500.p, bus_5100.n[1]) annotation (Line(
        points={{8.83333,-79},{16,-79},{16,-68},{22,-68}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5100.p, bus_5100.n[2]) annotation (Line(
        points={{8.3,-65},{15.15,-65},{15.15,-64},{22,-64}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus5100.p, bus_5100.n[3]) annotation (Line(
        points={{9.675,-59.75},{16,-59.75},{16,-60},{22,-60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3020.p, bus_3020.p[1]) annotation (Line(
        points={{-274.833,79},{-276.25,79},{-276.25,80},{-280,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_5500.p, bus_5400.n[1]) annotation (Line(
        points={{130.833,-63},{176,-63},{176,-50.5},{180,-50.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5400.p, bus_5400.n[2]) annotation (Line(
        points={{168.3,-57},{174,-57},{174,-47.5},{180,-47.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus5400.p, bus_5400.n[3]) annotation (Line(
        points={{167.675,-45.75},{171.1,-45.75},{171.1,-44.5},{180,-44.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5300.p, bus_5300.n[1]) annotation (Line(
        points={{226.3,67},{234,67},{234,76},{240,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus5300.p, bus_5300.n[2]) annotation (Line(
        points={{225.775,77.25},{232.1,77.25},{232.1,80},{240,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3249_7100.p, bus_3249.n[1]) annotation (Line(
        points={{-225.167,-45},{-184,-45},{-184,-37.9143},{-176,-37.9143}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3249.p, bus_3249.n[2]) annotation (Line(
        points={{-191.7,-33},{-183.85,-33},{-183.85,-32.9429},{-176,-32.9429}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G2_bus3249.p, bus_3249.n[3]) annotation (Line(
        points={{-191.7,-25},{-183.85,-25},{-183.85,-27.9714},{-176,-27.9714}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(G1_bus3249.p, bus_3249.n[4]) annotation (Line(
        points={{-191.7,-17},{-183.85,-17},{-183.85,-23},{-176,-23}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3249.p, bus_3249.n[5]) annotation (Line(
        points={{-188.325,-9.75},{-186,-9.75},{-186,-10},{-184,-10},{-184,-14},
            {-180,-14},{-180,-18.0286},{-176,-18.0286}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_3249.p, bus_3249.n[6]) annotation (Line(
        points={{-201.167,11},{-194,11},{-194,-4},{-182,-4},{-182,-13.0571},{-176,
            -13.0571}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3249.n, bus_3249.n[7]) annotation (Line(
        points={{-189,9.16667},{-189,0},{-180,0},{-180,-8.08571},{-176,-8.08571}},

        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3000_3245_2.n, bus_3245.n[1]) annotation (Line(
        points={{-252,9.16667},{-252,-8},{-242,-8},{-242,-22},{-230,-22},{-230,
            -40},{-218,-40},{-218,-76},{-208,-76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3245_1.n, bus_3245.n[2]) annotation (Line(
        points={{-228.167,56},{-218,56},{-218,-34},{-214,-34},{-214,-72},{-208,
            -72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_3245.n, bus_3245.n[3]) annotation (Line(
        points={{-212,-24.8333},{-212,-30},{-210,-30},{-210,-68},{-208,-68}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_5600_5620.p, bus_5600.p[1]) annotation (Line(
        points={{288,-65.1667},{288,-56},{285,-56},{285,-48.5},{282,-48.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus5600.p, bus_5600.p[2]) annotation (Line(
        points={{289.7,-49},{285.85,-49},{285.85,-45.5},{282,-45.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5600.p, bus_5600.p[3]) annotation (Line(
        points={{289.7,-41},{285.85,-41},{285.85,-42.5},{282,-42.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_5601.n, bus_5600.p[4]) annotation (Line(
        points={{289,-20.8333},{289,-38},{284,-38},{284,-39.5},{282,-39.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5500_5603.n, bus_5500.p[1]) annotation (Line(
        points={{108.167,-89},{86,-89},{86,-80.4},{78,-80.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5500.p, bus_5500.p[2]) annotation (Line(
        points={{89.7,-74},{78,-74}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_5500.n, bus_5500.p[3]) annotation (Line(
        points={{119.167,-63},{88,-63},{88,-67.6},{78,-67.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3245.p, bus_3245.p[1]) annotation (Line(
        points={{-200.3,-65},{-202,-65},{-202,-75},{-206,-75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5402_6001.n, bus_6001.p[1]) annotation (Line(
        points={{188,8.83333},{188,18},{184,18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(trafo_3359_3360.n, bus_3360.n[1]) annotation (Line(points={{-101,
            140},{-101,140},{-96,140}}, color={0,0,255}));
    connect(trafo_3359_3360.p, bus_3359.p[9]) annotation (Line(points={{-115,
            140},{-118,140},{-118,98.4667},{-122,98.4667}}, color={0,0,255}));
    connect(trafo_3249_3701.n, bus_3249.p[5]) annotation (Line(points={{-149.167,
            -9},{-161.666,-9},{-161.666,-9.08},{-174,-9.08}}, color={0,0,255}));
    connect(trafo_3249_3701.p, bus_3701.n[1]) annotation (Line(points={{-132.833,
            -9},{-122,-9},{-122,-60},{-118,-60}}, color={0,0,255}));
    connect(trafo_3244_3245.p, bus_3244.n[1]) annotation (Line(points={{-183,-80},
            {-180,-80},{-180,-96},{-178,-96}}, color={0,0,255}));
    connect(trafo_3244_3245.n, bus_3245.p[2]) annotation (Line(points={{-197,-80},
            {-200,-80},{-200,-69},{-206,-69}}, color={0,0,255}));
    connect(trafo_6700_6701.p, bus_6700.n[4]) annotation (Line(points={{-111,-84},
            {-100,-84},{-100,-79.5},{-78,-79.5}}, color={0,0,255}));
    connect(trafo_6700_6701.n, bus_6701.p[1]) annotation (Line(points={{-125,-84},
            {-125,-84},{-144,-84}}, color={0,0,255}));
    connect(trafo_5100_5101.n, bus_5100.p[2])
      annotation (Line(points={{30,-33},{30,-61},{24,-61}}, color={0,0,255}));
    connect(trafo_5100_5101.p, bus_5101.n[3]) annotation (Line(points={{30,-19},
            {30,-10},{16,-10},{16,12},{22,12}}, color={0,0,255}));
    connect(trafo_5500_5501.p, bus_5500.n[4]) annotation (Line(points={{70,-45},
            {70,-45},{70,-62},{70,-66.8},{76,-66.8}}, color={0,0,255}));
    connect(trafo_5500_5501.n, bus_5501.n[2])
      annotation (Line(points={{70,-31},{70,-13},{80,-13}}, color={0,0,255}));
    connect(trafo_5400_5401.p, bus_5400.n[4]) annotation (Line(points={{161,-34},
            {172,-34},{172,-41.5},{180,-41.5}}, color={0,0,255}));
    connect(trafo_5400_5401.n, bus_5401.p[3]) annotation (Line(points={{147,-34},
            {124,-34},{124,-30}}, color={0,0,255}));
    connect(trafo_5602_5603.n, bus_5602.p[1]) annotation (Line(points={{197,-72},
            {184,-72},{184,-76}}, color={0,0,255}));
    connect(trafo_5602_5603.p, bus_5603.n[2]) annotation (Line(points={{211,-72},
            {220,-72},{220,-73}}, color={0,0,255}));
    connect(trafo_5400_5402.p, bus_5400.p[3]) annotation (Line(points={{200,-35},
            {200,-42},{182,-42}}, color={0,0,255}));
    connect(trafo_5400_5402.n, bus_5402.p[1])
      annotation (Line(points={{200,-21},{200,-8},{196,-8}}, color={0,0,255}));
    connect(trafo_6000_6001.p, bus_6000.n[3]) annotation (Line(points={{213,16},
            {230,16},{230,6},{240,6}}, color={0,0,255}));
    connect(trafo_6000_6001.n, bus_6001.p[2]) annotation (Line(points={{199,16},
            {192,16},{192,22},{184,22}}, color={0,0,255}));
    connect(trafo_5601_6001.n, bus_6001.p[3])
      annotation (Line(points={{221,26},{210,26},{184,26}}, color={0,0,255}));
    connect(trafo_5601_6001.p, bus_5601.n[1]) annotation (Line(points={{235,26},
            {248,26},{248,8},{280,8}}, color={0,0,255}));
    connect(trafo_5300_5301.p, bus_5300.n[3]) annotation (Line(points={{227,90},
            {232,90},{232,84},{240,84}}, color={0,0,255}));
    connect(trafo_5300_5301.n, bus_5301.p[1]) annotation (Line(points={{213,90},
            {208,90},{208,80},{202,80}}, color={0,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,-220},{
              300,220}}), graphics={Text(
              extent={{-278,12},{-290,16}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
7010"),Text(  extent={{-266,-110},{-254,-114}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
7000"),Text(  extent={{-280,-10},{-292,-6}},
              lineColor={0,128,0},
              textString="bus 7020",
              textStyle={TextStyle.Bold}),Text(
              extent={{-256,-54},{-244,-58}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
7100"),Text(  extent={{-232,42},{-220,38}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3115"),Text(  extent={{-264,44},{-252,40}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3000"),Text(  extent={{-288,98},{-276,94}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3020"),Text(  extent={{-224,84},{-212,80}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3300"),Text(  extent={{-184,114},{-172,110}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3200"),Text(  extent={{-182,34},{-170,30}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3100"),Text(  extent={{-202,172},{-190,168}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
8500"),Text(  extent={{-242,154},{-230,150}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
8700"),Text(  extent={{-166,154},{-154,150}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
8600"),Text(  extent={{-128,118},{-116,114}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3359"),Text(  extent={{-100,156},{-88,152}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3360"),Text(  extent={{-182,-54},{-170,-58}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3249"),Text(  extent={{-124,-42},{-112,-46}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3701"),Text(  extent={{-212,-84},{-200,-88}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3245"),Text(  extent={{-182,-112},{-170,-116}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
3244"),Text(  extent={{-150,-96},{-138,-100}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
6701"),Text(  extent={{-82,-96},{-70,-100}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
6700"),Text(  extent={{-24,-124},{-12,-128}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
6500"),Text(  extent={{18,-76},{30,-80}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5100"),Text(  extent={{18,26},{30,22}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5101"),Text(  extent={{74,66},{86,62}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5103"),Text(  extent={{116,98},{128,94}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5304"),Text(  extent={{118,0},{130,-4}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5102"),Text(  extent={{158,138},{170,134}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5305"),Text(  extent={{196,98},{208,94}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5301"),Text(  extent={{236,98},{248,94}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5300"),Text(  extent={{276,66},{288,62}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
6100"),Text(  extent={{234,18},{246,14}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
6000"),Text(  extent={{178,38},{190,34}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
6001"),Text(  extent={{274,26},{286,22}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5601"),Text(  extent={{276,-58},{288,-62}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5600"),Text(  extent={{276,-108},{288,-112}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5620"),Text(  extent={{238,-120},{250,-124}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5610"),Text(  extent={{214,-88},{226,-92}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5603"),Text(  extent={{178,-88},{190,-92}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5602"),Text(  extent={{72,-92},{84,-96}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5500"),Text(  extent={{76,-28},{88,-32}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5501"),Text(  extent={{118,-46},{130,-50}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5401"),Text(  extent={{176,-30},{188,-34}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5400"),Text(  extent={{190,8},{202,4}},
              lineColor={0,128,0},
              textStyle={TextStyle.Bold},
              textString="bus
5402")}),
      Icon(coordinateSystem(extent={{-300,-220},{300,220}}, preserveAspectRatio
            =false)),
      Documentation);
  end Nordic44_Original_Case;

  package Data "Modelica records containing power flow results"
    record PSSE_powers_Original_case
      extends Modelica.Icons.Record;
      //Bus 3000
      parameter Real P3000=900;
      parameter Real Q3000=812.58;
      parameter Real PL3000=1167;
      parameter Real QL3000=567;
      //Bus 3020
      parameter Real PL3020=1127;
      parameter Real QL3020=616;
      //Bus 3100
      parameter Real PL3100=50;
      parameter Real QL3100=110;
      //Bus 3115
      parameter Real P3115=367;
      parameter Real Q3115=240.6575;
      parameter Real PL3115=750;
      parameter Real QL3115=650;
      //Bus 3245
      parameter Real P3245=300;
      parameter Real Q3245=185.4535;
      //Bus 3249
      parameter Real P3249=643;
      parameter Real Q3249=54.48716;
      parameter Real PL3249=1050;
      parameter Real QL3249=650;
      //Bus 3300
      parameter Real P3300=440.364;
      parameter Real Q3300=190.2016;
      parameter Real PL3300=1000;
      parameter Real QL3300=400;
      //Bus 3359
      parameter Real P3359=800;
      parameter Real Q3359=429.9607;
      parameter Real PL3359=1200;
      parameter Real QL3359=600;
      //Bus 3360
      parameter Real PL3360=225;
      parameter Real QL3360=262;
      //Bus 5100
      parameter Real P5100=950;
      parameter Real Q5100=715.1166;
      parameter Real PL5100=550;
      parameter Real QL5100=70;
      //Bus 5300
      parameter Real P5300=800;
      parameter Real Q5300=169.8511;
      parameter Real PL5300=30;
      parameter Real QL5300=-70;
      //Bus 5400
      parameter Real P5400=900;
      parameter Real Q5400=178.083;
      parameter Real PL5400=1150;
      parameter Real QL5400=100;
      //Bus 5500
      parameter Real P5500=950;
      parameter Real Q5500=-519.0964;
      parameter Real PL5500=1050;
      parameter Real QL5500=200;
      //Bus 5600
      parameter Real P5600=750;
      parameter Real Q5600=453.0866;
      parameter Real PL5600=675;
      parameter Real QL5600=125;
      //Bus 5610
      parameter Real PL5610=988;
      parameter Real QL5610=363;
      //Bus 5620
      parameter Real PL5620=729;
      parameter Real QL5620=175;
      //Bus 6000
      parameter Real P6000=500;
      parameter Real Q6000=56.8163;
      //Bus 6100
      parameter Real P6100=880;
      parameter Real Q6100=189.7237;
      parameter Real PL6100=1200;
      parameter Real QL6100=400;
      //Bus 6500
      parameter Real P6500=775;
      parameter Real Q6500=229.453;
      parameter Real PL6500=933;
      parameter Real QL6500=333;
      //Bus 6700
      parameter Real P6700=600;
      parameter Real Q6700=21.12792;
      parameter Real PL6700=750;
      parameter Real QL6700=150;
      //Bus 7000
      parameter Real P7000=611;
      parameter Real Q7000=81.09602;
      parameter Real PL7000=1280;
      parameter Real QL7000=70;
      //Bus 7010
      parameter Real PL7010=-1215;
      parameter Real QL7010=600;
      //Bus 7020
      parameter Real PL7020=187;
      parameter Real QL7020=-4;
      //Bus 7100
      parameter Real P7100=533;
      parameter Real Q7100=123.4662;
      parameter Real PL7100=1150;
      parameter Real QL7100=200;
      //Bus 8500
      parameter Real P8500=100;
      parameter Real Q8500=331.3799;
      parameter Real PL8500=1083;
      parameter Real QL8500=433;
      //Bus 8600
      parameter Real PL8600=630;
      parameter Real QL8600=10;
      //Bus 8700
      parameter Real PL8700=0;
      parameter Real QL8700=0;
      annotation (Documentation);
    end PSSE_powers_Original_case;

    record PSSE_voltages_Original_case
      extends Modelica.Icons.Record;
      //Bus 3000
      parameter Real V3000=1;
      parameter Real A3000=1.116337;
      //Bus 3020
      parameter Real V3020=0.9937368;
      parameter Real A3020=0.4665295;
      //Bus 3100
      parameter Real V3100=1.017992;
      parameter Real A3100=14.30254;
      //Bus 3115
      parameter Real V3115=1;
      parameter Real A3115=31.54624;
      //Bus 3200
      parameter Real V3200=1.013103;
      parameter Real A3200=7.635551;
      //Bus 3244
      parameter Real V3244=1.002142;
      parameter Real A3244=9.970654;
      //Bus 3244
      parameter Real V3245=0.9999999;
      parameter Real A3245=9.038589;
      //Bus 3249
      parameter Real V3249=0.9999999;
      parameter Real A3249=42.77423;
      //Bus 3300
      parameter Real V3300=1;
      parameter Real A3300=0;
      //Bus 3359
      parameter Real V3359=1;
      parameter Real A3359=11.67624;
      //Bus 3360
      parameter Real V3360=0.9937901;
      parameter Real A3360=11.49236;
      //Bus 3701
      parameter Real V3701=1.005135;
      parameter Real A3701=41.1718;
      //Bus 5100
      parameter Real V5100=1;
      parameter Real A5100=26.47007;
      //Bus 5101
      parameter Real V5101=0.990218;
      parameter Real A5101=26.18787;
      //Bus 5102
      parameter Real V5102=0.9921818;
      parameter Real A5102=32.57763;
      //Bus 5103
      parameter Real V5103=0.989711;
      parameter Real A5103=33.47605;
      //Bus 5300
      parameter Real V5300=1;
      parameter Real A5300=57.49048;
      //Bus 5301
      parameter Real V5301=0.9923382;
      parameter Real A5301=48.88903;
      //Bus 5304
      parameter Real V5304=0.9892719;
      parameter Real A5304=40.75034;
      //Bus 5305
      parameter Real V5305=0.9980365;
      parameter Real A5305=41.75614;
      //Bus 5400
      parameter Real V5400=1.007;
      parameter Real A5400=40.41059;
      //Bus 5401
      parameter Real V5401=0.9994396;
      parameter Real A5401=36.58119;
      //Bus 5402
      parameter Real V5402=1.003601;
      parameter Real A5402=40.53869;
      //Bus 5500
      parameter Real V5500=1.004;
      parameter Real A5500=25.21874;
      //Bus 5501
      parameter Real V5501=1.007397;
      parameter Real A5501=25.8328;
      //Bus 5600
      parameter Real V5600=1.01;
      parameter Real A5600=33.31656;
      //Bus 5601
      parameter Real V5601=1.006895;
      parameter Real A5601=40.46902;
      //Bus 5602
      parameter Real V5602=0.9922876;
      parameter Real A5602=28.26247;
      //Bus 5603
      parameter Real V5603=0.9354097;
      parameter Real A5603=27.26879;
      //Bus 5610
      parameter Real V5610=0.9314524;
      parameter Real A5610=26.61906;
      //Bus 5620
      parameter Real V5620=1.008238;
      parameter Real A5620=32.90638;
      //Bus 6000
      parameter Real V6000=1.005;
      parameter Real A6000=41.34129;
      //Bus 6001
      parameter Real V6001=1.001385;
      parameter Real A6001=40.63034;
      //Bus 6100
      parameter Real V6100=1;
      parameter Real A6100=68.72635;
      //Bus 6500
      parameter Real V6500=1;
      parameter Real A6500=19.15408;
      //Bus 6700
      parameter Real V6700=1.02;
      parameter Real A6700=34.79626;
      //Bus 6701
      parameter Real V6701=1.007554;
      parameter Real A6701=34.63046;
      //Bus 7000
      parameter Real V7000=1;
      parameter Real A7000=37.28787;
      //Bus 7010
      parameter Real V7010=0.9938884;
      parameter Real A7010=37.98831;
      //Bus 7020
      parameter Real V7020=1.000038;
      parameter Real A7020=37.18073;
      //Bus 7100
      parameter Real V7100=1;
      parameter Real A7100=36.95136;
      //Bus 8500
      parameter Real V8500=1.02;
      parameter Real A8500=-3.048752;
      //Bus 8600
      parameter Real V8600=1.019883;
      parameter Real A8600=-3.395741;
      //Bus 8700
      parameter Real V8700=1.02;
      parameter Real A8700=-3.048752;
      annotation (Documentation);
    end PSSE_voltages_Original_case;

    record PSSE_data_Original_case "PSSE complete data record"
      extends Modelica.Icons.Record;
      /* PSSE voltages from power flow solution */
      replaceable record Voltages_OC = PSSE_voltages_Original_case
        constrainedby PSSE_voltages_Original_case annotation (
          choicesAllMatching, Documentation(revisions="<html>
        <!--DISCLAIMER-->
        <p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
        <ul>
        <li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
        <li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
        <li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
        <li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
        </ul>
        <p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>
        
        <p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
        <p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
        </html>"));
      Voltages_OC voltages;
      /* PSSE powers from power flow solution */
      replaceable record Powers_OC = PSSE_powers_Original_case constrainedby
        PSSE_powers_Original_case annotation (choicesAllMatching, Documentation(
            revisions="<html>
        <!--DISCLAIMER-->
        <p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
        <ul>
        <li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
        <li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
        <li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
        <li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
        </ul>
        <p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>
        
        <p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
        <p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
        </html>"));
      Powers_OC powers;
      annotation (Documentation);
    end PSSE_data_Original_case;
    annotation (Documentation);
  end Data;

  package Generators "Package of generator groups for the Nordic 44 model"
    model Gen1_bus_3000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
           Nordic 44 model: Buses 3000, 7000"

      OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
        Tpd0=5 "d-axis transient open-circuit time constant s",
        Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
        Tpq0=1 "q-axis transient open-circuit time constant s",
        Tppq0=0.05 "q-axis transient open-circuit time constant s",
        H=5.97 "inertia constant s",
        D=0 "Damping",
        Xd=2.22 "d-axis reactance",
        Xq=2.13 "q-axis reactance",
        Xpd=0.36 "d-axis transient reactance",
        Xpq=0.468 "d-axis transient reactance",
        Xppd=0.225 "d-axis sub-transient reactance",
        Xppq=0.225 "q-axis sub-transient reactance",
        Xl=0.1688 "leakage reactance",
        V_b=420,
        V_0=PSSE_data.voltages.V3000,
        angle_0=PSSE_data.voltages.A3000,
        P_0=PSSE_data.powers.P3000,
        Q_0=PSSE_data.powers.Q3000,
        M_b=1300,
        S10=0.1089,
        S12=0.378,
        R_a=0) annotation (Placement(transformation(extent={{18,-43},{87,43}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
        T_1=0.01,
        T_2=0,
        T_3=0.15,
        T_4=0.3,
        T_5=8,
        T_6=0.4,
        K_1=0,
        K_2=0.7,
        K_3=0.43,
        P_MAX=1,
        P_MIN=0) annotation (Placement(transformation(
            extent={{-36.5,-12.5},{36.5,12.5}},
            rotation=0,
            origin={-48.5,19.5})));
      OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2(
        T_R=0,
        K_A=729,
        T_A=0.04,
        V_RMAX=5.32,
        V_RMIN=-4.05,
        K_E=1,
        T_E=0.44,
        K_F=0.0667,
        T_F1=2,
        T_F2=0.44,
        E_1=6.5,
        S_EE_1=0.054,
        E_2=8,
        S_EE_2=0.2020) annotation (Placement(transformation(
            extent={{-40,-33.5},{40,33.5}},
            rotation=0,
            origin={-48,-43.5})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=2,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-33,62},{29,94}})));
      Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(
            transformation(extent={{-114.5,-51},{-103,-39}})));
      OpenIPSL.Interfaces.PwPin pwPin
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{99,99}})));
    equation
      connect(gENROU.p, pwPin) annotation (Line(
          points={{90.45,0},{110,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{89.76,-21.5},
              {99,-21.5},{99,-86},{-116,-86},{-116,78},{-32.1545,78}}, color={0,
              0,127}));
      connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(points={{31.8182,
              78},{38,78},{38,72},{38,55},{-107,55},{-107,-30.1},{-86.6667,-30.1}},
            color={0,0,127}));
      connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{89.76,38.7},
              {95,38.7},{95,46},{-94,46},{-94,26.6429},{-83.175,26.6429}},
            color={0,0,127}));
      connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{-9.71875,
              21.2857},{1.6406,21.2857},{1.6406,21.5},{18.69,21.5}}, color={0,0,
              127}));
      connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{89.76,-12.9},
              {107,-12.9},{107,-89},{-94,-89},{-94,14.1429},{-83.175,14.1429}},
            color={0,0,127}));
      connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(points={{89.76,21.5},
              {99,21.5},{99,50},{-99,50},{-99,-16.7},{-86.6667,-16.7}}, color={
              0,0,127}));
      connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(points={{89.76,-30.1},
              {96,-30.1},{96,-82},{-92,-82},{-92,-70.3},{-86.6667,-70.3}},
            color={0,0,127}));
      connect(iEEET2.EFD, gENROU.EFD) annotation (Line(points={{-5,-43.5},{6,-43.5},
              {6,-21.5},{18.69,-21.5}}, color={0,0,127}));
      connect(iEEET2.VUEL, cte.y) annotation (Line(points={{-86.6667,-56.9},{-96,
              -56.9},{-96,-45},{-102.425,-45}}, color={0,0,127}));
      connect(iEEET2.VOEL, cte.y) annotation (Line(points={{-86.6667,-43.5},{-96,
              -43.5},{-96,-45},{-102.425,-45}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1})),
        Icon(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1}), graphics={Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255})}),
        Documentation);
    end Gen1_bus_3000;

    model Gen1_bus_7000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
           Nordic 44 model: Buses 3000, 7000"

      OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
        Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
        Tpq0=1 "q-axis transient open-circuit time constant s",
        Tppq0=0.05 "q-axis transient open-circuit time constant s",
        D=0 "Damping",
        Xd=2.22 "d-axis reactance",
        Xq=2.13 "q-axis reactance",
        Xpd=0.36 "d-axis transient reactance",
        Xpq=0.468 "d-axis transient reactance",
        Xppd=0.225 "d-axis sub-transient reactance",
        Xppq=0.225 "q-axis sub-transient reactance",
        Xl=0.1688 "leakage reactance",
        Tpd0=10,
        H=5.5,
        V_b=420,
        V_0=PSSE_data.voltages.V7000,
        angle_0=PSSE_data.voltages.A7000,
        P_0=PSSE_data.powers.P7000,
        Q_0=PSSE_data.powers.Q7000,
        M_b=1278,
        S10=0.1089,
        S12=0.378,
        R_a=0) annotation (Placement(transformation(extent={{24,-38},{84,39}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
        T_1=0.01,
        T_2=0,
        T_3=0.15,
        T_4=0.3,
        T_5=8,
        T_6=0.4,
        K_1=0,
        K_2=0.7,
        K_3=0.43,
        P_MAX=1,
        P_MIN=0) annotation (Placement(transformation(
            extent={{-21,-11},{21,11}},
            rotation=0,
            origin={-27,23})));
      OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2(
        T_R=0,
        K_A=800,
        T_A=0.04,
        V_RMAX=5.32,
        V_RMIN=-4.05,
        K_E=1,
        T_E=0.44,
        K_F=0.0667,
        T_F1=2,
        T_F2=0.44,
        E_1=6.5,
        S_EE_1=0.054,
        E_2=8,
        S_EE_2=0.2020) annotation (Placement(transformation(
            extent={{-35,-29},{35,29}},
            rotation=0,
            origin={-28,-30})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=1,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-23,69},{35,91}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-90,-35},{-80,-25}})));
      OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(
              extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
                {120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{85,86},{97,98}})));
    equation
      connect(gENROU.p, pwPin) annotation (Line(points={{87,0.5},{95.675,0.5},{
              95.675,0},{110,0}}, color={0,0,255}));
      connect(iEEET2.EFD, gENROU.EFD) annotation (Line(points={{9.625,-30},{
              15.3125,-30},{15.3125,-18.75},{24.6,-18.75}}, color={0,0,127}));
      connect(cte.y, iEEET2.VOEL) annotation (Line(points={{-79.5,-30},{-61.8333,
              -30}}, color={0,0,127}));
      connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(points={{86.4,-26.45},
              {91,-26.45},{91,-62},{-67,-62},{-67,-53.2},{-61.8333,-53.2}},
            color={0,0,127}));
      connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{86.4,-11.05},
              {93,-11.05},{93,-67},{-92,-67},{-92,18.2857},{-46.95,18.2857}},
            color={0,0,127}));
      connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{86.4,-18.75},
              {96,-18.75},{96,-75},{-96,-75},{-96,80},{-22.2091,80}}, color={0,
              0,127}));
      connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(points={{37.6364,
              80},{37.6364,80},{50,80},{50,50},{-80,50},{-80,-18.4},{-61.8333,-18.4}},
            color={0,0,127}));
      connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{86.4,35.15},
              {91,35.15},{91,42},{-53,42},{-53,29.2857},{-46.95,29.2857}},
            color={0,0,127}));
      connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(points={{86.4,19.75},
              {94,19.75},{94,45},{-73,45},{-73,-6.8},{-61.8333,-6.8}}, color={0,
              0,127}));
      connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{-4.6875,
              24.5714},{9.15625,24.5714},{9.15625,19.75},{24.6,19.75}}, color={
              0,0,127}));
      connect(iEEET2.VUEL, cte.y) annotation (Line(points={{-61.8333,-41.6},{-73,
              -41.6},{-73,-30},{-79.5,-30}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1})),
        Icon(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1}), graphics={Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255})}),
        Documentation);
    end Gen1_bus_7000;

    model Gen4_bus_3300 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
          Nordic 44 model: Buses 3300, 3359, 8500"

      OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
        Tpd0=10.8 "d-axis transient open-circuit time constant s",
        Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
        Tpq0=1 "q-axis transient open-circuit time constant s",
        Tppq0=0.05 "q-axis transient open-circuit time constant s",
        H=6 "inertia constant s",
        D=0 "Damping",
        Xd=2.42 "d-axis reactance",
        Xq=2 "q-axis reactance",
        Xpd=0.23 "d-axis transient reactance",
        Xpq=0.4108 "d-axis transient reactance",
        Xppd=0.16 "d-axis sub-transient reactance",
        Xppq=0.16 "q-axis sub-transient reactance",
        Xl=0.1481 "leakage reactance",
        V_b=420,
        V_0=PSSE_data.voltages.V3300,
        angle_0=PSSE_data.voltages.A3300,
        P_0=PSSE_data.powers.P3300,
        Q_0=PSSE_data.powers.Q3300,
        M_b=1100,
        S10=0.1089,
        S12=0.378,
        R_a=0) annotation (Placement(transformation(extent={{-58,-26},{6,44}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
        T_1=0.01,
        T_2=0,
        T_3=0.15,
        T_4=0.3,
        T_5=8,
        T_6=0.4,
        K_1=0,
        K_2=0.7,
        K_3=0.43,
        P_MAX=1,
        P_MIN=0) annotation (Placement(transformation(
            extent={{-28,-12},{28,12}},
            rotation=0,
            origin={-26,76})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=10 "K",
        T_AT_B=0,
        T_B=0.04,
        T_E=0.04,
        E_MIN=0,
        E_MAX=5,
        r_cr_fd=0,
        C_SWITCH=true) annotation (Placement(transformation(
            extent={{-28,-23},{28,23}},
            rotation=0,
            origin={62,-61})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-75,-60},{-32,-35}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-20,-65},{-9,-54}})));
      OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(
              extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
                {120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(cte.y, sCRX.VUEL) annotation (Line(points={{-8.45,-59.5},{24.775,
              -59.5},{24.775,-58.93},{34.2333,-58.93}}, color={0,0,127}));
      connect(sCRX.VOEL, cte.y) annotation (Line(points={{34.2333,-52.95},{-2,-52.95},
              {-2,-54},{-2,-59.5},{-8.45,-59.5}}, color={0,0,127}));
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-30.0455,-47.5},
              {1.97725,-47.5},{1.97725,-47.43},{34.2333,-47.43}}, color={0,0,
              127}));
      connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{8.56,40.5},
              {20,40.5},{20,92},{-60,92},{-60,82.8571},{-52.6,82.8571}}, color=
              {0,0,127}));
      connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{8.56,-1.5},
              {20,-1.5},{20,-28},{-70,-28},{-70,70.8571},{-52.6,70.8571}},
            color={0,0,127}));
      connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{90.9333,-60.77},{
              96,-60.77},{96,-90},{-90,-90},{-90,-8.5},{-57.36,-8.5}}, color={0,
              0,127}));
      connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{3.75,
              77.7143},{12,77.7143},{12,50},{-66,50},{-66,26.5},{-57.36,26.5}},
            color={0,0,127}));
      connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{8.56,26.5},{
              28,26.5},{28,-40.99},{34.2333,-40.99}}, color={0,0,127}));
      connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{8.56,-15.5},{16,
              -15.5},{16,-80},{26,-80},{26,-79.63},{34.2333,-79.63}}, color={0,
              0,127}));
      connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.56,-22.5},
              {12,-22.5},{12,-63.99},{33.7667,-63.99}}, color={0,0,127}));
      connect(gENROU.p, pwPin) annotation (Line(points={{9.2,9},{76,9},{76,0},{
              110,0}}, color={0,0,255}));
      connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{8.56,-8.5},
              {34,-8.5},{34,-32},{-82,-32},{-82,-47.5},{-74.4136,-47.5}}, color
            ={0,0,127}));
      annotation (
        Icon(graphics={Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen4_bus_3300;

    model Gen4_bus_3359 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
          Nordic 44 model: Buses 3300, 3359, 8500"

      OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
        Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
        Tpq0=1 "q-axis transient open-circuit time constant s",
        Tppq0=0.05 "q-axis transient open-circuit time constant s",
        D=0 "Damping",
        Tpd0=4.75,
        H=4.82,
        Xd=2.13,
        Xq=2.03,
        Xpd=0.31,
        Xpq=0.403,
        Xppd=0.1937,
        Xppq=0.1937,
        Xl=0.14531,
        V_b=420,
        V_0=PSSE_data.voltages.V3359,
        angle_0=PSSE_data.voltages.A3359,
        P_0=PSSE_data.powers.P3359,
        Q_0=PSSE_data.powers.Q3359,
        M_b=1350,
        S10=0.1089,
        S12=0.37795,
        R_a=0) annotation (Placement(transformation(extent={{-56,-24},{6,42}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
        T_1=0.01,
        T_2=0,
        T_3=0.15,
        T_4=0.3,
        T_5=8,
        T_6=0.4,
        K_1=0,
        K_2=0.7,
        K_3=0.43,
        P_MAX=1,
        P_MIN=0) annotation (Placement(transformation(
            extent={{-30,-13},{30,13}},
            rotation=0,
            origin={-22,71})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=165,
        T_AT_B=0.2,
        T_B=10,
        T_E=0.04,
        E_MIN=0,
        E_MAX=5,
        r_cr_fd=0,
        C_SWITCH=true) annotation (Placement(transformation(
            extent={{-27.5,-33.5},{27.5,33.5}},
            rotation=0,
            origin={58.5,-59.5})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.68,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-61,-61},{-18,-36}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-10,-63},{0,-53}})));
      OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(
              extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
                {120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{84,86},{96,98}})));
    equation
      connect(gENROU.p, pwPin) annotation (Line(points={{9.1,9},{66,9},{66,0},{
              110,0}}, color={0,0,255}));
      connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{9.875,
              72.8571},{20,72.8571},{20,46},{-66,46},{-66,25.5},{-55.38,25.5}},
            color={0,0,127}));
      connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{8.48,38.7},
              {24,38.7},{24,88},{-56,88},{-56,78.4286},{-50.5,78.4286}}, color=
              {0,0,127}));
      connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{8.48,-0.9},
              {30,-0.9},{30,92},{-60,92},{-60,65.4286},{-50.5,65.4286}}, color=
              {0,0,127}));
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-16.0455,-48.5},
              {8,-48.5},{8,-39.735},{31.2292,-39.735}}, color={0,0,127}));
      connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{8.48,-7.5},
              {18,-7.5},{18,-32},{-68,-32},{-68,-48.5},{-60.4136,-48.5}}, color
            ={0,0,127}));
      connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{86.9167,-59.165},
              {92,-59.165},{92,-96},{-80,-96},{-80,-7.5},{-55.38,-7.5}}, color=
              {0,0,127}));
      connect(cte.y, sCRX.VUEL) annotation (Line(points={{0.5,-58},{16,-58},{16,
              -56.485},{31.2292,-56.485}}, color={0,0,127}));
      connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.48,-20.7},
              {14,-20.7},{14,-63.855},{30.7708,-63.855}}, color={0,0,127}));
      connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{8.48,25.5},{
              26,25.5},{26,-30.355},{31.2292,-30.355}}, color={0,0,127}));
      connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{8.48,-14.1},{22,
              -14.1},{22,-86.635},{31.2292,-86.635}}, color={0,0,127}));
      connect(sCRX.VOEL, cte.y) annotation (Line(points={{31.2292,-47.775},{10,
              -47.775},{10,-58},{0.5,-58}}, color={0,0,127}));
      annotation (
        Icon(graphics={Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen4_bus_3359;

    model Gen4_bus_8500 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
          Nordic 44 model: Buses 3300, 3359, 8500"

      OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
        Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
        Tpq0=1 "q-axis transient open-circuit time constant s",
        Tppq0=0.05 "q-axis transient open-circuit time constant s",
        D=0 "Damping",
        Xd=2.42 "d-axis reactance",
        Xq=2 "q-axis reactance",
        Xpd=0.23 "d-axis transient reactance",
        Xpq=0.4108 "d-axis transient reactance",
        Tpd0=10,
        H=7,
        Xppd=0.17062,
        Xppq=0.17062,
        Xl=0.14812,
        V_b=420,
        V_0=PSSE_data.voltages.V8500,
        angle_0=PSSE_data.voltages.A8500,
        P_0=PSSE_data.powers.P8500,
        Q_0=PSSE_data.powers.Q8500,
        M_b=1300,
        S10=0.1089,
        S12=0.37795,
        R_a=0) annotation (Placement(transformation(extent={{-54,-16},{4,46}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
        T_1=0.01,
        T_2=0,
        T_3=0.15,
        T_4=0.3,
        T_5=8,
        T_6=0.4,
        K_1=0,
        K_2=0.7,
        K_3=0.43,
        P_MAX=1,
        P_MIN=0) annotation (Placement(transformation(
            extent={{-25.5,-10.5},{25.5,10.5}},
            rotation=0,
            origin={-23.5,69.5})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=10 "K",
        T_AT_B=0,
        T_B=0.04,
        T_E=0.04,
        E_MIN=0,
        E_MAX=5,
        r_cr_fd=0,
        C_SWITCH=true) annotation (Placement(transformation(
            extent={{-27.5,-30.5},{27.5,30.5}},
            rotation=0,
            origin={52.5,-52.5})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-74,-51},{-34,-34}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-21,-61},{-11,-51}})));
      OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(
              extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
                {120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-32.1818,-42.5},
              {-4.0909,-42.5},{-4.0909,-34.505},{25.2292,-34.505}}, color={0,0,
              127}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-10.5,-56},{4,-56},{4,
              -41.825},{25.2292,-41.825}}, color={0,0,127}));
      connect(gENROU.p, pwPin) annotation (Line(points={{6.9,15},{62,15},{62,0},
              {110,0}}, color={0,0,255}));
      connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{3.59375,71},
              {16,71},{16,50},{-68,50},{-68,30.5},{-53.42,30.5}}, color={0,0,
              127}));
      connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{6.32,42.9},
              {20,42.9},{20,82},{-56,82},{-56,75.5},{-47.725,75.5}}, color={0,0,
              127}));
      connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{6.32,5.7},
              {24,5.7},{24,86},{-62,86},{-62,65},{-47.725,65}}, color={0,0,127}));
      connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{6.32,-0.5},
              {18,-0.5},{18,-22},{-80,-22},{-80,-42.5},{-73.4545,-42.5}}, color
            ={0,0,127}));
      connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{6.32,-12.9},
              {12,-12.9},{12,-56.465},{24.7708,-56.465}}, color={0,0,127}));
      connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{6.32,-6.7},{16,
              -6.7},{16,-77.205},{25.2292,-77.205}}, color={0,0,127}));
      connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{6.32,30.5},{
              22,30.5},{22,-25.965},{25.2292,-25.965}}, color={0,0,127}));
      connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{80.9167,-52.195},
              {86,-52.195},{86,-86},{-84,-86},{-84,-0.5},{-53.42,-0.5}}, color=
              {0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{25.2292,-49.755},{14,
              -49.755},{14,-50},{4,-50},{4,-56},{-10.5,-56}}, color={0,0,127}));
      annotation (
        Icon(graphics={Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen4_bus_8500;

    model Gen2_bus_3245 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
          Nordic 44 model: Buses 3245, 3249, 5600"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tpd0=5.0 "T'do (> 0)",
        Tppd0=0.06 "T''do (> 0)",
        Tppq0=0.1 "T''qo (> 0)",
        H=3.3 "Inertia",
        D=0 "Speed Damping",
        Xd=0.75 "d-axis reactance",
        Xq=0.5 "q-axis reactance",
        Xpd=0.25 "d-axis transient reactance",
        Xppd=0.15385,
        Xppq=0.15385,
        Xl=0.11538,
        V_b=420,
        V_0=PSSE_data.voltages.V3245,
        angle_0=PSSE_data.voltages.A3245,
        P_0=PSSE_data.powers.P3245,
        Q_0=PSSE_data.powers.Q3245,
        M_b=950,
        S10=0.10239,
        S12=0.2742,
        R_a=0) annotation (Placement(transformation(extent={{-62,-24},{1,46}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.01,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-58,58},{0,90}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=31,
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{31,-84},{85,-26}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-27,-57},{-17,-47}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{4.15,11},{44,11},{44,0},{
              110,0}}, color={0,0,255}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{85.9,-54.71},{94,
              -54.71},{94,-92},{-74,-92},{-74,-6.5},{-61.37,-6.5}}, color={0,0,
              127}));
      connect(cte.y, sCRX.VOTHSG) annotation (Line(points={{-16.5,-52},{6,-52},
              {6,-37.89},{31.225,-37.89}}, color={0,0,127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{3.52,-20.5},
              {12,-20.5},{12,-58.77},{30.775,-58.77}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{3.52,-13.5},{16,
              -13.5},{16,-78.49},{31.225,-78.49}}, color={0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.45,74},{10,
              74},{10,50},{-72,50},{-72,28.5},{-61.37,28.5}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{3.52,42.5},{
              16,42.5},{16,92},{-64,92},{-64,82},{-57.275,82}}, color={0,0,127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{3.52,0.5},
              {24,0.5},{24,94},{-66,94},{-66,66},{-57.275,66}}, color={0,0,127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{3.52,28.5},{
              26,28.5},{26,-29.77},{31.225,-29.77}}, color={0,0,127}));
      connect(sCRX.VOEL, cte.y) annotation (Line(points={{31.225,-44.85},{6,-44.85},
              {6,-52},{-16.5,-52}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{31.225,-52.39},{
              7.6125,-52.39},{7.6125,-52},{-16.5,-52}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen2_bus_3245;

    model Gen2_bus_3249 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
          Nordic 44 model: Buses 3245, 3249, 5600"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.06 "T''do (> 0)",
        Tppq0=0.1 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=10.13,
        H=4.543,
        Xd=1.036,
        Xq=0.63,
        Xpd=0.28,
        Xppd=0.21,
        Xppq=0.21,
        Xl=0.11538,
        V_b=420,
        V_0=PSSE_data.voltages.V3249,
        angle_0=PSSE_data.voltages.A3249,
        P_0=PSSE_data.powers.P3249,
        Q_0=PSSE_data.powers.Q3249,
        M_b=1357,
        S10=0.10239,
        S12=0.2742,
        R_a=0) annotation (Placement(transformation(extent={{-60,-20},{6,48}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-62,62},{-2,88}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=31,
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{26,-90},{81,-30}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-21,-55},{-11,-45}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-10.5,-50},{8,-50},{8,
              -49.5},{26.2292,-49.5}}, color={0,0,127}));
      connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{26.2292,-42.3},{8,-42.3},
              {8,-50},{-10.5,-50}}, color={0,0,127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.64,-16.6},
              {14,-16.6},{14,-63.9},{25.7708,-63.9}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{8.64,-9.8},{18,
              -9.8},{18,-84.3},{26.2292,-84.3}}, color={0,0,127}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{81.9167,-59.7},{
              86,-59.7},{86,-94},{-72,-94},{-72,-3},{-59.34,-3}}, color={0,0,
              127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-0.5,75},{8,
              75},{8,50},{-70,50},{-70,31},{-59.34,31}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{8.64,44.6},{
              16,44.6},{16,92},{-68,92},{-68,81.5},{-61.25,81.5}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{8.64,3.8},
              {30,3.8},{30,96},{-72,96},{-72,68.5},{-61.25,68.5}}, color={0,0,
              127}));
      connect(gENSAL.p, p) annotation (Line(points={{9.3,14},{54,14},{54,0},{
              110,0}}, color={0,0,255}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{26.2292,-57.3},{8,-57.3},
              {8,-50},{-10.5,-50}}, color={0,0,127}));
      connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(points={{26.2292,-33.9},
              {22,-33.9},{22,31},{8.64,31}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen2_bus_3249;

    model Gen2_bus_5600 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
          Nordic 44 model: Buses 3245, 3249, 5600"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        D=0 "Speed Damping",
        Tpd0=7.85,
        Tppd0=0.05,
        Tppq0=0.15,
        H=3.5,
        Xd=1,
        Xq=0.51325,
        Xpd=0.38,
        Xppd=0.28,
        Xppq=0.28,
        Xl=0.21,
        V_b=300,
        V_0=PSSE_data.voltages.V5600,
        angle_0=PSSE_data.voltages.A5600,
        P_0=PSSE_data.powers.P5600,
        Q_0=PSSE_data.powers.Q5600,
        M_b=1650,
        S10=0.1,
        S12=0.3,
        R_a=0) annotation (Placement(transformation(extent={{-62,-28},{0,34}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.3,
        VELM=0.2,
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-60,48},{2,76}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=61,
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{26,-90},{84,-28}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-17,-53},{-7,-43}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{86,86},{98,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{3.1,3},{54.55,3},{54.55,0},
              {110,0}}, color={0,0,255}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-6.5,-48},{26.2417,-48},
              {26.2417,-48.15}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{2.48,-18.7},{10,
              -18.7},{10,-84.11},{26.2417,-84.11}}, color={0,0,127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{2.48,-24.9},
              {14,-24.9},{14,-63.03},{25.7583,-63.03}}, color={0,0,127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{2.48,18.5},{
              22,18.5},{22,-32.03},{26.2417,-32.03}}, color={0,0,127}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{84.9667,-58.69},{
              92,-58.69},{92,-94},{-72,-94},{-72,-12.5},{-61.38,-12.5}}, color=
              {0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{3.55,62},{8,
              62},{8,60},{8,40},{-68,40},{-68,18.5},{-61.38,18.5}}, color={0,0,
              127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.48,30.9},{
              12,30.9},{12,82},{-66,82},{-66,69},{-59.225,69}}, color={0,0,127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.48,-6.3},
              {18,-6.3},{18,88},{-72,88},{-72,55},{-59.225,55}}, color={0,0,127}));
      connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{26.2417,-40.71},{4,
              -40.71},{4,-48},{-6.5,-48}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{26.2417,-56.21},{4,-56.21},
              {4,-48},{-6.5,-48}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}},
              lineColor={0,0,255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen2_bus_5600;

    model Gen3_bus_3115 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
          Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        D=0 "Speed Damping",
        Tpd0=7.57,
        Tppd0=0.045,
        Tppq0=0.1,
        H=4.741,
        Xd=0.946,
        Xq=0.565,
        Xpd=0.29,
        Xppd=0.23,
        Xppq=0.23,
        Xl=0.11077,
        V_b=420,
        V_0=PSSE_data.voltages.V3115,
        angle_0=PSSE_data.voltages.A3115,
        P_0=PSSE_data.powers.P3115,
        Q_0=PSSE_data.powers.Q3115,
        M_b=1100,
        S10=0.10239,
        S12=0.2742,
        R_a=0)
        annotation (Placement(transformation(extent={{-46,-24},{16,42}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.1,
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.0577,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-44,56},{20,86}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=31,
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{36,-86},{90,-32}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-11,-69},{-1,-59}})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.04,
        K_2=1,
        T_2=4.5,
        K_3=0.87,
        T_3=2,
        K_4=0.087,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-48,-54},{7,-33}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{86,88},{96,98}})));
    equation
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{9.5,-43.5},
              {16.75,-43.5},{16.75,-43.07},{36.225,-43.07}}, color={0,0,127}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-0.5,-64},{16,-64},{
              16,-49.55},{36.225,-49.55}}, color={0,0,127}));
      connect(gENSAL.p, p) annotation (Line(points={{19.1,9},{70,9},{70,0},{110,
              0}}, color={0,0,255}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{90.9,-58.73},{94,
              -58.73},{94,-90},{-68,-90},{-68,-7.5},{-45.38,-7.5}}, color={0,0,
              127}));
      connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{18.48,-7.5},
              {30,-7.5},{30,-30},{-56,-30},{-56,-43.5},{-47.25,-43.5}}, color={
              0,0,127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{18.48,-20.7},
              {22,-20.7},{22,-62.51},{35.775,-62.51}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{18.48,-14.1},{
              28,-14.1},{28,-80.87},{36.225,-80.87}}, color={0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{21.6,71},{28,
              71},{34,71},{34,48},{-58,48},{-58,25.5},{-45.38,25.5}}, color={0,
              0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{18.48,38.7},
              {38,38.7},{38,90},{-52,90},{-52,78.5},{-43.2,78.5}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{18.48,-0.9},
              {42,-0.9},{42,94},{-58,94},{-58,63.5},{-43.2,63.5}}, color={0,0,
              127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{18.48,25.5},{
              32,25.5},{32,-35.51},{36.225,-35.51}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{36.225,-56.57},{16,-56.57},
              {16,-64},{-0.5,-64}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen3_bus_3115;

    model Gen3_bus_5300 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
          Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=6.4,
        H=3.5,
        Xd=1.14,
        Xq=0.84,
        Xpd=0.34,
        Xppd=0.26,
        Xppq=0.26,
        Xl=0.2,
        V_b=300,
        V_0=PSSE_data.voltages.V5300,
        angle_0=PSSE_data.voltages.A5300,
        P_0=PSSE_data.powers.P5300,
        Q_0=PSSE_data.powers.Q5300,
        M_b=1200,
        S10=0.1,
        S12=0.3,
        R_a=0)
        annotation (Placement(transformation(extent={{-64,-24},{-2,40}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-62,62},{10,90}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=61 "K",
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{22,-82},{80,-34}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-22,-70},{-10,-58}})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-66,-54},{-20,-34}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{1.1,8},{82,8},{82,0},{110,
              0}}, color={0,0,255}));
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-17.9091,-44},
              {-17.9091,-43.84},{22.2417,-43.84}}, color={0,0,127}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-9.4,-64},{-6,-64},{-2,
              -64},{-2,-49.6},{22.2417,-49.6}}, color={0,0,127}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{80.9667,-57.76},{
              84,-57.76},{84,-86},{-78,-86},{-78,-8},{-63.38,-8}}, color={0,0,
              127}));
      connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{0.48,-8},{
              10,-8},{10,-30},{-72,-30},{-72,-44},{-65.3727,-44}}, color={0,0,
              127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{0.48,-20.8},
              {8,-20.8},{8,-61.12},{21.7583,-61.12}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{0.48,-14.4},{12,
              -14.4},{12,-77.44},{22.2417,-77.44}}, color={0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{11.8,76},{18,
              76},{18,46},{-76,46},{-76,24},{-63.38,24}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{0.48,36.8},{
              24,36.8},{24,92},{-66,92},{-66,83},{-61.1,83}}, color={0,0,127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{0.48,-1.6},
              {32,-1.6},{32,96},{-78,96},{-78,69},{-61.1,69}}, color={0,0,127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{0.48,24},{16,
              24},{16,-37.12},{22.2417,-37.12}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{22.2417,-55.84},{-2,-55.84},
              {-2,-64},{-9.4,-64}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen3_bus_5300;

    model Gen3_bus_6100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
          Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=9.9,
        H=3,
        Xd=1.2,
        Xq=0.73,
        Xpd=0.37,
        Xppd=0.18,
        Xppq=0.18,
        Xl=0.15,
        V_b=300,
        V_0=PSSE_data.voltages.V6100,
        angle_0=PSSE_data.voltages.A6100,
        P_0=PSSE_data.powers.P6100,
        Q_0=PSSE_data.powers.Q6100,
        M_b=1240,
        S10=0.1,
        S12=0.3,
        R_a=0) annotation (Placement(transformation(extent={{-66,-8},{-2,52}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-58,68},{-8,90}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=61 "K",
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{20,-70},{76,-24}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-29,-61},{-19,-51}})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-60,-46},{-22,-20}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{86,88},{96,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{1.2,22},{30,22},{30,20},{
              64,20},{64,0},{110,0}}, color={0,0,255}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{76.9333,-46.77},{
              82,-46.77},{82,-80},{-76,-80},{-76,7},{-65.36,7}}, color={0,0,127}));
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-20.2727,-33},
              {-0.13635,-33},{-0.13635,-33.43},{20.2333,-33.43}}, color={0,0,
              127}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-18.5,-56},{0,-56},{0,
              -38.95},{20.2333,-38.95}}, color={0,0,127}));
      connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{0.56,7},{12,
              7},{12,-18},{-68,-18},{-68,-33},{-59.4818,-33}}, color={0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-6.75,79},{0,
              79},{0,56},{-76,56},{-76,37},{-65.36,37}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{0.56,49},{10,
              49},{10,92},{-62,92},{-62,84.5},{-57.375,84.5}}, color={0,0,127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{0.56,13},{
              16,13},{16,96},{-66,96},{-66,73.5},{-57.375,73.5}}, color={0,0,
              127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{0.56,-5},{6,
              -5},{6,-49.99},{19.7667,-49.99}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{0.56,1},{10,1},
              {10,-65.63},{20.2333,-65.63}}, color={0,0,127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{0.56,37},{14,
              37},{14,-26.99},{20.2333,-26.99}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{20.2333,-44.93},{0,-44.93},
              {0,-56},{-18.5,-56}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen3_bus_6100;

    model Gen3_bus_6700 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
          Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tpd0=5.24 "T'do (> 0)",
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        H=3.592 "Inertia",
        D=0 "Speed Damping",
        Xd=1.1044 "d-axis reactance",
        Xq=0.66186,
        Xpd=0.25484,
        Xppd=0.17062,
        Xppq=0.17062,
        Xl=0.14737,
        V_b=300,
        V_0=PSSE_data.voltages.V6700,
        angle_0=PSSE_data.voltages.A6700,
        P_0=PSSE_data.powers.P6700,
        Q_0=PSSE_data.powers.Q6700,
        M_b=1200,
        S10=0.1,
        S12=0.3,
        R_a=0)
        annotation (Placement(transformation(extent={{-44,-22},{18,34}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-38,54},{20,80}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=61 "K",
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{34,-82},{92,-34}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-13,-69},{-3,-59}})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-54,-54},{-6,-34}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{21.1,6},{78,6},{78,0},{110,
              0}}, color={0,0,255}));
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-3.81818,-44},
              {-3.81818,-43.84},{34.2417,-43.84}}, color={0,0,127}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{92.9667,-57.76},{
              96,-57.76},{96,-84},{-72,-84},{-72,-8},{-43.38,-8}}, color={0,0,
              127}));
      connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{20.48,-8},{
              26,-8},{26,-32},{-62,-32},{-62,-44},{-53.3455,-44}}, color={0,0,
              127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{21.45,67},{
              28,67},{28,40},{-52,40},{-52,20},{-43.38,20}}, color={0,0,127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{20.48,-2.4},
              {42,-2.4},{42,90},{-50,90},{-50,60.5},{-37.275,60.5}}, color={0,0,
              127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{20.48,31.2},
              {36,31.2},{36,84},{-44,84},{-44,73.5},{-37.275,73.5}}, color={0,0,
              127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{20.48,-19.2},
              {24,-19.2},{24,-61.12},{33.7583,-61.12}}, color={0,0,127}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{-2.5,-64},{14,-64},{
              14,-49.6},{34.2417,-49.6}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{20.48,-13.6},{
              28,-13.6},{28,-77.44},{34.2417,-77.44}}, color={0,0,127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{20.48,20},{30,
              20},{30,-37.12},{34.2417,-37.12}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{34.2417,-55.84},{14,-55.84},
              {14,-64},{-2.5,-64}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen3_bus_6700;

    model Gen3_bus_7100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
          Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        D=0 "Speed Damping",
        Tpd0=5,
        Tppd0=0.06,
        Tppq0=0.1,
        H=3.2,
        Xd=0.75,
        Xq=0.5,
        Xpd=0.25,
        Xppd=0.15385,
        Xppq=0.15385,
        Xl=0.11538,
        V_b=420,
        M_b=1000,
        V_0=PSSE_data.voltages.V7100,
        angle_0=PSSE_data.voltages.A7100,
        P_0=PSSE_data.powers.P7100,
        Q_0=PSSE_data.powers.Q7100,
        S10=0.10239,
        S12=0.2742,
        R_a=0) annotation (Placement(transformation(extent={{-56,-20},{4,32}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.1,
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.01,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-50,50},{0,72}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
        K=61 "K",
        T_AT_B=0.25385,
        T_B=13,
        T_E=0.05,
        E_MIN=0,
        E_MAX=4,
        r_cr_fd=0,
        C_SWITCH=true)
        annotation (Placement(transformation(extent={{30,-80},{86,-34}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-7,-59},{3,-49}})));
      OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
        H_LIM=0.03,
        K_2=1,
        T_2=4.5,
        K_3=0,
        T_3=2,
        K_4=0.55,
        K_5=1,
        T_5=0.01)
        annotation (Placement(transformation(extent={{-58,-50},{-12,-30}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{86,88},{96,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{7,6},{56,6},{56,0},{110,0}},
            color={0,0,255}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.25,61},{10,
              61},{10,36},{-64,36},{-64,19},{-55.4,19}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{6.4,29.4},{
              16,29.4},{16,80},{-58,80},{-58,66.5},{-49.375,66.5}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{6.4,-1.8},
              {22,-1.8},{22,88},{-68,88},{-68,55.5},{-49.375,55.5}}, color={0,0,
              127}));
      connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{86.9333,-56.77},{
              94,-56.77},{94,-86},{-76,-86},{-76,-7},{-55.4,-7}}, color={0,0,
              127}));
      connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{6.4,-7},{12,
              -7},{12,-26},{-64,-26},{-64,-40},{-57.3727,-40}}, color={0,0,127}));
      connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-9.90909,-40},
              {4,-40},{4,-43.43},{30.2333,-43.43}}, color={0,0,127}));
      connect(cte.y, sCRX.VOEL) annotation (Line(points={{3.5,-54},{6,-54},{6,-48.95},
              {30.2333,-48.95}}, color={0,0,127}));
      connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{6.4,-17.4},
              {14,-17.4},{14,-59.99},{29.7667,-59.99}}, color={0,0,127}));
      connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{6.4,-12.2},{18,
              -12.2},{18,-75.63},{30.2333,-75.63}}, color={0,0,127}));
      connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{6.4,19},{24,
              19},{24,-36.99},{30.2333,-36.99}}, color={0,0,127}));
      connect(sCRX.VUEL, cte.y) annotation (Line(points={{30.2333,-54.93},{6,-54.93},
              {6,-54},{3.5,-54}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen3_bus_7100;

    model Gen5_bus_5100 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
          Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tpd0=4.9629 "T'do (> 0)",
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        H=3.9871 "Inertia",
        D=0 "Speed Damping",
        Xd=1.1332 "d-axis reactance",
        Xq=0.68315,
        Xpd=0.24302,
        Xppd=0.15135,
        Xppq=0.15135,
        Xl=0.13405,
        V_b=300,
        V_0=PSSE_data.voltages.V5100,
        angle_0=PSSE_data.voltages.A5100,
        P_0=PSSE_data.powers.P5100,
        Q_0=PSSE_data.powers.Q5100,
        M_b=1200,
        S10=0.1,
        S12=0.3,
        R_a=0)
        annotation (Placement(transformation(extent={{-68,-20},{-6,30}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-62,46},{-10,74}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
        K=200,
        T_AT_B=0.05,
        T_B=100,
        T_E=0.5,
        E_MIN=0,
        E_MAX=4)
        annotation (Placement(transformation(extent={{16,-88},{86,-33}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-33,-65},{-23,-55}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(cte.y, sEXS.VOEL) annotation (Line(points={{-22.5,-60},{38.75,-60},
              {38.75,-88}}, color={0,0,127}));
      connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.75,-57.4444},{
              94,-57.4444},{94,-92},{-78,-92},{-78,-7.5},{-67.38,-7.5}}, color=
              {0,0,127}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-8.7,60},{0,
              60},{0,38},{-76,38},{-76,17.5},{-67.38,17.5}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-3.52,27.5},
              {4,27.5},{4,76},{-70,76},{-70,67},{-61.35,67}}, color={0,0,127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-3.52,-2.5},
              {12,-2.5},{12,84},{-76,84},{-76,53},{-61.35,53}}, color={0,0,127}));
      connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{-3.52,-12.5},{4,
              -12.5},{4,-77.3056},{16,-77.3056}}, color={0,0,127}));
      connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{-3.52,17.5},{
              8,17.5},{8,-57.4444},{16,-57.4444}}, color={0,0,127}));
      connect(gENSAL.p, p) annotation (Line(points={{-2.9,5},{46,5},{46,0},{110,
              0}}, color={0,0,255}));
      connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{16,-43.6944},{-4,-43.6944},
              {-4,-60},{-22.5,-60}}, color={0,0,127}));
      connect(sEXS.VUEL, cte.y) annotation (Line(points={{28.25,-88},{-4,-88},{
              -4,-60},{-22.5,-60}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen5_bus_5100;

    model Gen5_bus_5400 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
          Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=6.5,
        H=4.1,
        Xd=1.02,
        Xq=0.63,
        Xpd=0.25,
        Xppd=0.16,
        Xppq=0.16,
        Xl=0.13,
        V_b=300,
        V_0=PSSE_data.voltages.V5400,
        angle_0=PSSE_data.voltages.A5400,
        P_0=PSSE_data.powers.P5400,
        Q_0=PSSE_data.powers.Q5400,
        M_b=1225,
        S10=0.1,
        S12=0.3,
        R_a=0) annotation (Placement(transformation(extent={{-64,-18},{0,36}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-60,50},{0,76}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
        K=200,
        T_AT_B=0.05,
        T_B=100,
        T_E=0.5,
        E_MIN=0,
        E_MAX=4)
        annotation (Placement(transformation(extent={{14,-76},{86,-29}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-19,-57},{-9,-47}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(gENSAL.p, p) annotation (Line(points={{3.2,9},{54,9},{54,0},{110,
              0}}, color={0,0,255}));
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.5,63},{10,
              63},{10,50},{10,40},{-74,40},{-74,22.5},{-63.36,22.5}}, color={0,
              0,127}));
      connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.8,-49.8889},{
              94,-49.8889},{94,-86},{-74,-86},{-74,-4.5},{-63.36,-4.5}}, color=
              {0,0,127}));
      connect(cte.y, sEXS.VOEL) annotation (Line(points={{-8.5,-52},{37.4,-52},
              {37.4,-76}}, color={0,0,127}));
      connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{2.56,-9.9},{6,-9.9},
              {6,-66.8611},{14,-66.8611}}, color={0,0,127}));
      connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{2.56,22.5},{
              10,22.5},{10,-49.8889},{14,-49.8889}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.56,33.3},{
              16,33.3},{16,80},{-66,80},{-66,69.5},{-59.25,69.5}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.56,0.9},
              {24,0.9},{24,88},{-70,88},{-70,56.5},{-59.25,56.5}}, color={0,0,
              127}));
      connect(sEXS.VUEL, cte.y) annotation (Line(points={{26.6,-76},{-2,-76},{-2,
              -52},{-8.5,-52}}, color={0,0,127}));
      connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{14,-38.1389},{-2,-38.1389},
              {-2,-52},{-8.5,-52}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen5_bus_5400;

    model Gen5_bus_5500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
          Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=7.198,
        H=3,
        Xd=1.2364,
        Xq=0.65567,
        Xpd=0.37415,
        Xppd=0.22825,
        Xppq=0.22825,
        Xl=0.16194,
        V_b=300,
        M_b=1450,
        V_0=PSSE_data.voltages.V5500,
        angle_0=PSSE_data.voltages.A5500,
        P_0=PSSE_data.powers.P5500,
        Q_0=PSSE_data.powers.Q5500,
        S10=0.1,
        S12=0.3,
        R_a=0)
        annotation (Placement(transformation(extent={{-68,-20},{-6,32}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-62,50},{-10,81}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
        K=200,
        T_AT_B=0.05,
        T_B=100,
        T_E=0.5,
        E_MIN=0,
        E_MAX=4)
        annotation (Placement(transformation(extent={{10,-82},{80,-36}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-30,-66},{-16,-52}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-8.7,65.5},{
              -2,65.5},{-2,40},{-76,40},{-76,19},{-67.38,19}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-3.52,29.4},
              {4,29.4},{4,88},{-66,88},{-66,73.25},{-61.35,73.25}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-3.52,-1.8},
              {12,-1.8},{12,92},{-74,92},{-74,57.75},{-61.35,57.75}}, color={0,
              0,127}));
      connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{81.75,-56.4444},{
              90,-56.4444},{90,-92},{90,-90},{-84,-90},{-84,-7},{-67.38,-7}},
            color={0,0,127}));
      connect(cte.y, sEXS.VOEL) annotation (Line(points={{-15.3,-59},{32.75,-59},
              {32.75,-82}}, color={0,0,127}));
      connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{-3.52,-12.2},{0,
              -12.2},{0,-73.0556},{10,-73.0556}}, color={0,0,127}));
      connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{-3.52,19},{6,
              19},{6,-56.4444},{10,-56.4444}}, color={0,0,127}));
      connect(gENSAL.p, p) annotation (Line(points={{-2.9,6},{22,6},{50,6},{50,
              0},{110,0}}, color={0,0,255}));
      connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{10,-44.9444},{-6,-44.9444},
              {-6,-59},{-15.3,-59}}, color={0,0,127}));
      connect(sEXS.VUEL, cte.y) annotation (Line(points={{22.25,-82},{-6,-82},{
              -6,-59},{-15.3,-59}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen5_bus_5500;

    model Gen5_bus_6000 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
          Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=9.7,
        H=3.5,
        Xd=1.28,
        Xq=0.94,
        Xpd=0.37,
        Xppd=0.28,
        Xppq=0.28,
        Xl=0.2,
        V_b=300,
        M_b=680,
        angle_0=PSSE_data.voltages.A6000,
        P_0=PSSE_data.powers.P6000,
        Q_0=PSSE_data.powers.Q6000,
        S10=0.1,
        S12=0.3,
        R_a=0,
        V_0=PSSE_data.voltages.V6000)
        annotation (Placement(transformation(extent={{-58,-16},{0,32}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        r=0.3,
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-58,48},{2,78}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
        K=20,
        T_AT_B=1,
        T_B=0.1,
        T_E=0.1,
        E_MIN=-4,
        E_MAX=4)
        annotation (Placement(transformation(extent={{24,-66},{86,-26}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-23,-51},{-13,-41}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{88,88},{98,98}})));
    equation
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{3.5,63},{8,
              63},{8,36},{-64,36},{-64,20},{-57.42,20}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.32,29.6},{
              14,29.6},{14,82},{-66,82},{-66,70.5},{-57.25,70.5}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.32,0.8},
              {20,0.8},{20,88},{-70,88},{-70,55.5},{-57.25,55.5}}, color={0,0,
              127}));
      connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.55,-43.7778},{
              92,-43.7778},{92,-76},{-70,-76},{-70,-4},{-57.42,-4}}, color={0,0,
              127}));
      connect(cte.y, sEXS.VOEL) annotation (Line(points={{-12.5,-46},{16,-46},{
              16,-66},{44.15,-66}}, color={0,0,127}));
      connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{2.32,-8.8},{10,
              -8.8},{10,-58.2222},{24,-58.2222}}, color={0,0,127}));
      connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{2.32,20},{16,
              20},{16,-43.7778},{24,-43.7778}}, color={0,0,127}));
      connect(gENSAL.p, p) annotation (Line(points={{2.9,8},{62,8},{62,0},{110,
              0}}, color={0,0,255}));
      connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{24,-33.7778},{2,-33.7778},
              {2,-46},{-12.5,-46}}, color={0,0,127}));
      connect(sEXS.VUEL, cte.y) annotation (Line(points={{34.85,-66},{2,-66},{2,
              -46},{-12.5,-46}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen5_bus_6000;

    model Gen5_bus_6500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
          Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

      OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
        Tppd0=0.05 "T''do (> 0)",
        Tppq0=0.15 "T''qo (> 0)",
        D=0 "Speed Damping",
        Tpd0=5.4855,
        H=3.558,
        Xd=1.0679,
        Xq=0.642,
        Xpd=0.23865,
        Xppd=0.15802,
        Xppq=0.15802,
        Xl=0.13514,
        V_b=300,
        M_b=1100,
        V_0=PSSE_data.voltages.V6500,
        angle_0=PSSE_data.voltages.A6500,
        P_0=PSSE_data.powers.P6500,
        Q_0=PSSE_data.powers.Q6500,
        S10=0.1,
        S12=0.3,
        R_a=0)
        annotation (Placement(transformation(extent={{-70,-22},{-10,42}})));
      OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
        R=0.06 "Permanent droop, p.u",
        r=0.4 "Temporary droop, p.u",
        VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
        T_r=5,
        T_f=0.05,
        T_g=0.2,
        G_MAX=1,
        G_MIN=0,
        T_w=1,
        A_t=1.1,
        D_turb=0.5,
        q_NL=0.1)
        annotation (Placement(transformation(extent={{-68,62},{-14,88}})));
      OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
        K=200,
        T_AT_B=0.05,
        T_B=100,
        T_E=0.5,
        E_MIN=0,
        E_MAX=4)
        annotation (Placement(transformation(extent={{6,-78},{80,-30}})));
      Modelica.Blocks.Sources.Constant cte(k=0)
        annotation (Placement(transformation(extent={{-40,-59},{-30,-49}})));
      OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation
              =0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Original.Data.PSSE_data_Original_case PSSE_data
        annotation (Placement(transformation(extent={{86,86},{98,98}})));
    equation
      connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-12.65,75},{
              0,75},{0,46},{-82,46},{-82,26},{-69.4,26}}, color={0,0,127}));
      connect(gENSAL.p, p) annotation (Line(points={{-7,10},{72,10},{72,0},{110,
              0}}, color={0,0,255}));
      connect(cte.y, sEXS.VOEL) annotation (Line(points={{-29.5,-54},{0,-54},{0,
              -78},{30.05,-78}}, color={0,0,127}));
      connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{-7.6,-12.4},{0,
              -12.4},{0,-68.6667},{6,-68.6667}}, color={0,0,127}));
      connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-7.6,38.8},{
              6,38.8},{6,92},{-72,92},{-72,81.5},{-67.325,81.5}}, color={0,0,
              127}));
      connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-7.6,0.4},
              {14,0.4},{14,96},{-78,96},{-78,68.5},{-67.325,68.5}}, color={0,0,
              127}));
      connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{81.85,-51.3333},{
              86,-51.3333},{86,-56},{86,-92},{-82,-92},{-82,-6},{-69.4,-6}},
            color={0,0,127}));
      connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{-7.6,26},{2,
              26},{2,-51.3333},{6,-51.3333}}, color={0,0,127}));
      connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{6,-39.3333},{-18,-39.3333},
              {-18,-54},{-29.5,-54}}, color={0,0,127}));
      connect(sEXS.VUEL, cte.y) annotation (Line(points={{18.95,-78},{-18,-78},
              {-18,-54},{-29.5,-54}}, color={0,0,127}));
      annotation (
        Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
              255}),Line(
                  points={{-76,-26},{-28,52},{27,-52},{74,23}},
                  color={0,0,255},
                  smooth=Smooth.Bezier)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
        Documentation);
    end Gen5_bus_6500;
    annotation (Documentation);
  end Generators;
  annotation (Documentation);
end Original;
