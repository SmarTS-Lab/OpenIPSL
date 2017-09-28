within SevenBus;
package Data
  record SevenBus_voltages
    extends Modelica.Icons.Record;
    // Bus number 1
    parameter Real V1=1.069590;
    parameter Real A1=0.017300;
    // Bus number 2
    parameter Real V2=1.069600;
    parameter Real A2=0.093500;
    // Bus number 3
    parameter Real V3=1.069580;
    parameter Real A3=-0.003500;
    // Bus number 4
    parameter Real V4=1.069590;
    parameter Real A4=-0.017400;
    // Bus number 5
    parameter Real V5=1.069570;
    parameter Real A5=0.003400;
    // Bus number 6
    parameter Real V6=1.069600;
    parameter Real A6=0.031100;
    // Bus number 7
    parameter Real V7=1.069600;
    parameter Real A7=0.000000;
    // Bus number 71
    parameter Real V71=0.980300;
    parameter Real A71=-0.001000;
    // Bus number 21
    parameter Real V21=0.989880;
    parameter Real A21=7.309099;
    // Bus number 61
    parameter Real V61=1.005950;
    parameter Real A61=2.553400;
    annotation (Documentation);
  end SevenBus_voltages;

  record SevenBus_loads
    extends Modelica.Icons.Record;
    // Load 3_1
    parameter Real PL3_1=240.000015;
    parameter Real QL3_1=2.400000;
    // Load 5_1
    parameter Real PL5_1=480.000031;
    parameter Real QL5_1=4.800000;
    // Load 4_1
    parameter Real PL4_1=480.000031;
    parameter Real QL4_1=4.800000;
    // Load 1_1
    parameter Real PL1_1=240.000015;
    parameter Real QL1_1=2.400000;
    annotation (Documentation);
  end SevenBus_loads;

  record SevenBus_machines
    extends Modelica.Icons.Record;
    // Machine 21_1
    parameter Real P21_1=962.199951;
    parameter Real Q21_1=124.763000;
    // Machine 71_1
    parameter Real P71_1=0.000000;
    parameter Real Q71_1=7.038000;
    // Machine 61_1
    parameter Real P61_1=480.428040;
    parameter Real Q61_1=27.608999;
    annotation (Documentation);
  end SevenBus_machines;

  record SevenBus_trafos
    extends Modelica.Icons.Record;
    // 2WindingTrafo 1_4
    parameter Real t1_1_4=1.000000;
    parameter Real t2_1_4=1.000000;
    // 2WindingTrafo 7_71
    parameter Real t1_7_71=1.000000;
    parameter Real t2_7_71=1.092110;
    // 2WindingTrafo 6_61
    parameter Real t1_6_61=1.000000;
    parameter Real t2_6_61=1.065790;
    // 2WindingTrafo 2_21
    parameter Real t1_2_21=1.000000;
    parameter Real t2_2_21=1.092110;
    annotation (Documentation);
  end SevenBus_trafos;

  record PF_results
    extends Modelica.Icons.Record;
    replaceable record Voltages = SevenBus.Data.SevenBus_voltages
      constrainedby SevenBus.Data.SevenBus_voltages annotation (
        choicesAllMatching);
    Voltages voltages;
    replaceable record Machines = SevenBus.Data.SevenBus_machines
      constrainedby SevenBus.Data.SevenBus_machines annotation (
        choicesAllMatching);
    Machines machines;
    replaceable record Trafos = SevenBus.Data.SevenBus_trafos constrainedby
      SevenBus.Data.SevenBus_trafos annotation (choicesAllMatching);
    Trafos trafos;
    replaceable record Loads = SevenBus.Data.SevenBus_loads constrainedby
      SevenBus.Data.SevenBus_loads annotation (choicesAllMatching);
    Loads loads;
    annotation (
      defaultComponentName="PF_results",
      defaultAttributes="inner",
      missingInnerMessage="
    No 'PF_results' data is defined.",
      Documentation);
  end PF_results;
  annotation (Documentation);
end Data;
