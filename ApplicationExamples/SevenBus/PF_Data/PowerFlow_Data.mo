within SevenBus_Base_Case.PF_Data;
record PowerFlow_Data
extends Modelica.Icons.Record;

replaceable record Bus = SevenBus_Base_Case.PF_Data.Bus_Template constrainedby
PF_Data.Bus_Template
annotation(choicesAllMatching);
Bus bus;

replaceable record Loads = SevenBus_Base_Case.PF_Data.Loads_Template constrainedby
PF_Data.Loads_Template
annotation(choicesAllMatching);
Loads loads;

replaceable record Trafos = SevenBus_Base_Case.PF_Data.Trafos_Template constrainedby
PF_Data.Trafos_Template
annotation(choicesAllMatching);
Trafos trafos;

replaceable record Machines = SevenBus_Base_Case.PF_Data.Machines_Template constrainedby
PF_Data.Machines_Template
annotation(choicesAllMatching);
Loads loads;

end PowerFlow_Data;