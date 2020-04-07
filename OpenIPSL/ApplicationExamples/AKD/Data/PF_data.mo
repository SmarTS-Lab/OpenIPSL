within AKD.Data;
record PF_data "PSSE complete data record"
  extends Modelica.Icons.Record;
  /* PSSE voltages from power flow solution */
  replaceable record Voltages = Data.AKD_PF_voltages constrainedby
    Data.AKD_PF_voltages annotation (choicesAllMatching);
  Voltages voltages;
  /* PSSE powers from power flow solution */
  replaceable record Powers = Data.AKD_PF_powers constrainedby
    Data.AKD_PF_powers annotation (choicesAllMatching);
  Powers powers;
  annotation (Documentation);
end PF_data;
