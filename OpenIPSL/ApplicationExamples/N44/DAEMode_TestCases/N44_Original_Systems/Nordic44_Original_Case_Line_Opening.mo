within N44.DAEMode_TestCases.N44_Original_Systems;
model Nordic44_Original_Case_Line_Opening
    "Line opening test case, no state events triggered."
    extends N44.Original.Nordic44_Original_Case(line_5103_5304_1(t1=2));
    annotation (
        experiment(
        StopTime=10,
        Tolerance=1e-06,
        __Dymola_fixedstepsize=0.01),
        __Dymola_experimentFlags(
        Advanced(Define(DAEsolver=true))));
end Nordic44_Original_Case_Line_Opening;
