within N44.DAEMode_TestCases.N44_Base_Case_Systems;
model Nordic44_Base_Case_StateEvents3
    "Bus 5603 bus fault experiments. The start values were given by simulating
  Nordic44_Base_Case_StateEvents2 from t = 0s to t = 60s. These start values 
  have been stored in this model."

    extends
    N44.DAEMode_TestCases.N44_Base_Case_Systems.Nordic44_Base_Case_StateEvents(
      G1_bus3115(hYGOV(Velocity_Limiter(u(start=0.0005312208465522299)))),
      G1_bus3245(hYGOV(Velocity_Limiter(u(start=0.00023619631218909983)))),
      G1_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695655389)))),
      G1_bus5100(hYGOV(Velocity_Limiter(u(start=-0.0008018933989671031)))),
      G1_bus5300(hYGOV(Velocity_Limiter(u(start=-0.0015123720523207958)))),
      G1_bus5400(hYGOV(Velocity_Limiter(u(start=-0.0012486551676530325)))),
      G1_bus5500(hYGOV(Velocity_Limiter(u(start=-0.0010816002362036023)))),
      G1_bus5600(hYGOV(Velocity_Limiter(u(start=-0.0016883834981127964)))),
      G1_bus6000(hYGOV(Velocity_Limiter(u(start=-0.0016449825645790163)))),
      G1_bus6100(hYGOV(Velocity_Limiter(u(start=-0.0015980072537599929)))),
      G1_bus6500(hYGOV(Velocity_Limiter(u(start=0.00016668294090484075)))),
      G1_bus6700(hYGOV(Velocity_Limiter(u(start=0.000504086327566259)))),
      G1_bus7100(hYGOV(Velocity_Limiter(u(start=0.0007152658070590094)))),
      G2_add_bus5100(hYGOV(Velocity_Limiter(u(start=-0.0008018933989772468)))),
      G2_add_bus5500(hYGOV(Velocity_Limiter(u(start=-0.0010816002299153988)))),
      G2_add_bus6000(hYGOV(Velocity_Limiter(u(start=-0.0016449825644178169)))),
      G2_bus3115(hYGOV(Velocity_Limiter(u(start=0.0005312208464817732)))),
      G2_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695130071)))),
      G2_bus5300(hYGOV(Velocity_Limiter(u(start=-0.0015123720520013955)))),
      G2_bus5400(hYGOV(Velocity_Limiter(u(start=-0.0012486551677300466)))),
      G2_bus5600(hYGOV(Velocity_Limiter(u(start=-0.0016883834927178961)))),
      G2_bus6100(hYGOV(Velocity_Limiter(u(start=-0.001598007253763648)))),
      G2_bus6500(hYGOV(Velocity_Limiter(u(start=0.00016668294091949686)))),
      G2_bus6700(hYGOV(Velocity_Limiter(u(start=0.0005040863275810395)))),
      G2_bus7100(hYGOV(Velocity_Limiter(u(start=0.0007152658070558476)))),
      G3_add_bus5300(hYGOV(Velocity_Limiter(u(start=-0.0015123720522493055)))),
      G3_add_bus5600(hYGOV(Velocity_Limiter(u(start=-0.0016883834953765665)))),
      G3_add_bus6000(hYGOV(Velocity_Limiter(u(start=-0.0016449825641647146)))),
      G3_add_bus6700(hYGOV(Velocity_Limiter(u(start=0.0005040863275711683)))),
      G3_bus3115(hYGOV(Velocity_Limiter(u(start=0.0005312208464515669)))),
      G3_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695397652)))),
      G3_bus6100(hYGOV(Velocity_Limiter(u(start=-0.0015980072539691628)))),
      G3_bus6500(hYGOV(Velocity_Limiter(u(start=0.0001666829409049036)))),
      G3_bus7100(hYGOV(Velocity_Limiter(u(start=0.0007152658071046766)))),
      G4_add_bus3115(hYGOV(Velocity_Limiter(u(start=0.0005312208462698383)))),
      G4_add_bus5300(hYGOV(Velocity_Limiter(u(start=-0.0015123720519500808)))),
      G4_add_bus5600(hYGOV(Velocity_Limiter(u(start=-0.0016883834993191003)))),
      G4_add_bus6000(hYGOV(Velocity_Limiter(u(start=-0.001644982564348362)))),
      G4_add_bus6700(hYGOV(Velocity_Limiter(u(start=0.0005040863274922784)))),
      G4_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695458576)))),
      G4_bus6100(hYGOV(Velocity_Limiter(u(start=-0.001598007253967698)))),
      G4_bus6500(hYGOV(Velocity_Limiter(u(start=0.00016668294089469644)))),
      G5_add_bus3115(hYGOV(Velocity_Limiter(u(start=0.0005312208465311431)))),
      G5_add_bus5300(hYGOV(Velocity_Limiter(u(start=-0.0015123720519907911)))),
      G5_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695668722)))),
      G5_bus6100(hYGOV(Velocity_Limiter(u(start=-0.001598007253918212)))),
      G6_add_bus5300(hYGOV(Velocity_Limiter(u(start=-0.0015123720523788414)))),
      G6_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695688293)))),
      G7_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695324103)))),
      G8_add_bus3249(hYGOV(Velocity_Limiter(u(start=0.0006355900695595287)))),
      bus_3000(p(ii(start={-0.2693936393905713,0.029456930382282052,
                0.06997772561306684,-0.18414222917714698,-0.23961844485704492}),
            ir(start={0.047234492857855595,-0.15353731593774056,-0.2473863890798076,
                0.5188109717163915,0.6462827086753241}))),
      bus_3100(p(ii(start={0.05909287128062528,-0.04080004635727941}), ir(start={
                -0.1400291136223178,-0.0868292431287831}))),
      bus_3115(n(ii(start={-0.04718036087892516,0.612251849174828,-0.01786777432015292,
                -0.01786777431939336,-0.01786777431994094,-0.19877676993839774,-0.017867774320412245,
                -0.01786777430930449}), ir(start={0.26571285803034217,-0.8935699433979276,
                0.3104155599899781,0.3104155599897869,0.3104155599907181,-0.21991215773299816,
                0.31041555999085746,0.3104155599926615})), p(ii(start={
                0.02629703438406473,0.03859147898749054,-0.10134447674671677,-0.24049988339313963}),
            ir(start={-0.3473122517243556,-0.4131159342059829,0.354203147281046,-0.298083518204126}))),
      bus_3200(n(ii(start={-0.14446506404138065,-0.14446506404138068,-0.14446506404138068,
                0.14427503342964218,0.1803980732769198}), ir(start={
                0.10146702187195825,0.10146702187195822,0.10146702187195822,
                0.0033067254111847637,-0.36473765864269647})), p(
          ii(start={0.10872208541758002}),
          ir(start={0.057029867615637025}),
          vi(start={-0.3668229143752392}),
          vr(start={0.9684662940992795}))),
      bus_3244(p(
          ii(start={0.40635080473195684}),
          ir(start={-0.8299617888020406}),
          vi(start={-0.4536122509831159}),
          vr(start={0.8867897749750641}))),
      bus_3300(p(ii(start={-0.28247914505693184,-0.2824791450551368,-0.20135162378978866,
                -0.039667266041739126,-0.03161584755260358}), ir(start={
                0.6497978049066686,0.6497978049078661,-0.025126234383292888,-0.256740970481896,
                -0.29036735448945006}))),
      bus_3359(n(ii(start={-0.29022031015220134,-0.19995770246727856,
                1.0450235736588012,1.0450235736588012,1.0450235736588012,
                1.0450235736588012,-0.17554085119891877,-0.017256859043226082,-0.024991907242092475}),
            ir(start={0.05758973606704572,0.0009548915087085827,-1.256190810561499,
                -1.256190810561499,-1.256190810561499,-1.256190810561499,-0.0821684744925735,
                -0.2908945014385467,-0.24666849185920908})), p(ii(start={-0.18317943395523983,
                -0.203622002043441,-0.5054563060744737,-0.5054563060757435,-0.5054563060739766,
                -0.5054563060766843,-0.5054563060769688,-0.5054563060869061,-0.05258739206805391}),
            ir(start={1.1986222713693502,1.0053312646818369,0.5527133666497892,
                0.552713366649645,0.5527133666499524,0.5527133666489807,
                0.5527133666489912,0.5527133666461028,0.06571634651592177}))),
      bus_3701(p(
          ii(start={0.0028857663448373125}),
          ir(start={-0.10141707885069338}),
          vi(start={-0.2578950147450024}),
          vr(start={0.975178261575165}))),
      bus_5100(p(ii(start={-0.05678536660230101,0.7316988700436455}), ir(start={
                0.3266032765151363,0.29221241034368334}))),
      bus_5101(n(ii(start={0.12499271971251447,0.11634193067935301}), ir(start={-1.2118201385256682,
                -1.025128065416314})), p(
          ii(start={0.5270025075745515,-0.04690868321699974,0.0010586840199171407,
                -0.7224871587693364}),
          ir(start={0.5636962293233404,1.0801627173010486,0.8816228641738589,-0.28853360685626595}),
          vi(start={-0.08850590881622747,-0.08850590881622748,-0.08850590881622748,
                -0.08850590881622748}),
          vr(start={0.9989158417709212,0.9989158417709212,0.9989158417709212,
                0.9989158417709212}))),
      bus_5103(p(ii(start={-0.070108130631899,0.0639441340207633,
                0.0472970892959648}), ir(start={-0.2175600897257583,
                0.6119782989464477,0.488267183555067}))),
      bus_5300(p(ii(start={0.33733917339794334,0.13784190527553974,
                0.1378419052733051,0.13784190527320533,0.13784190527488183,
                0.13784190519292766}), ir(start={0.48143738776353084,
                0.7060741620165174,0.706074162016528,0.7060741620176263,
                0.706074162016679,0.7060741620519235}))),
      bus_5301(n(ii(start={-0.3068125190808042,-0.2017891470049817,-0.35137462029078753}),
            ir(start={-0.6775009149803022,-0.6622230901549789,-0.9555699776322784}))),
      bus_5304(p(ii(start={0.14298893692957979,0.28638177062274733,-0.05519153637761093}),
            ir(start={0.6758284821573396,0.8495446246370221,0.12845691053696867}))),
      bus_5305(n(ii(start={-0.32625485230011697,0.005350184280898877}), ir(start=
                {-0.842825791152239,-0.12005836868099004})), p(
          ii(start={0.3209046680192181}),
          ir(start={0.9628841598332291}),
          vi(start={0.17715566506788788}),
          vr(start={0.9997252268572041}))),
      bus_5400(n(ii(start={-0.18742034417967784,-0.15014124872982731,
                0.09896808060693235,-0.08835671736185054}), ir(start={-1.3438017962737456,
                0.31335728380054273,-1.236992473064607,0.2669018078661441})), p(
            ii(start={-0.1501412487284411,0.031202256570134458,0.4458892218227304}),
            ir(start={0.3133572837996303,0.171337133450978,1.5158407604210564}))),
      bus_5401(p(ii(start={-0.13793156551685357,0.13531353868240248,
                0.08892220035296637}), ir(start={0.7826135555753558,
                0.06436797539099759,-0.2686099794364874}))),
      bus_5500(n(ii(start={0.4893247782124461,0.4893247782124461,
                0.012021571463041038,-1.0959916093611821}), ir(start={-1.1096373793676257,
                -1.1096373793676257,-0.3290066037524722,0.06659248918664636})), p(
            ii(start={-0.04038568875434725,0.004761626491075734,0.136182917253797,
                0.00476162648272354}), ir(start={0.6318749055806842,
                0.251714329200464,1.3463853093110443,0.2517143292088844}))),
      bus_5501(p(ii(start={0.003967212580443325}), ir(start={0.5837825395247213}))),
      bus_5600(n(ii(start={-0.014305043493802572,0.2512197202368074,
                0.2512197202368074,0.1438356013812574}), ir(start={
                1.5387543335343243,-1.3914399524754468,-1.3914399524754466,
                0.7340222160922527})), p(ii(start={0.2283373904843854,-0.23109982829437106,
                -0.23109982829690023,-0.23109982829581682,-0.23109982829536604,
                0.06409192433699915}), ir(start={-0.7262709540445899,
                0.2194479954700213,0.21944799545590557,0.21944799546486976,
                0.2194479954527064,0.358582327525403}))),
      bus_5601(p(
          ii(start={-0.08463269374572462}),
          ir(start={-0.35677982913525996}),
          vi(start={0.15215267656300957}),
          vr(start={1.0197590231774145}))),
      bus_5603(p(ii(start={-0.025327559918678588,-0.006697725633979499}), ir(
              start={2.9188641694701216,-1.5348085412619612}))),
      bus_6000(n(ii(start={-0.05665442552959199,0.0830141005349444,-0.5093376422126075}),
            ir(start={-0.1676621481253749,0.39287559921197274,-1.5174862739923447})),
          p(ii(start={-0.21549072569119695,0.44942639129318723,
                0.08301410053516001,0.0830141005352768,0.08301410053482772}), ir(
              start={-0.7267981173028669,0.8404441425718475,0.39287559921223825,
                0.39287559921265464,0.3928755992118729}))),
      bus_6001(p(ii(start={-0.4489354625129793,-0.08508971029195153,
                0.5125464693585469}), ir(start={-1.5154017287435864,-0.3587064402125904,
                1.5270464375184964}))),
      bus_6100(n(ii(start={-0.47731568215913195,0.2308693572938842,-0.16545151050610893,
                -0.16545151050610893,-0.34612808323412225}), ir(start={-0.8295800678650732,
                0.5584281405471503,-0.7430099050823329,-0.7430099050823329,-0.476540824747041}))),
      bus_6500(n(ii(start={-0.45671555821619175,0.7261734293536088,
                0.7261734293536088,0.7261734293536088,-0.1324948243359056,-0.09920661114102831}),
            ir(start={0.7979768195648126,-0.4910191162688539,-0.4910191162688539,
                -0.49101911626885386,0.09589041097490375,0.06607913705097229})),
          p(ii(start={-0.3195816912469025,-0.3195816912469349,-0.3195816912468305,
                -0.3195816912469239,-0.21177652938010905}), ir(start={-0.014546194572329613,
                -0.01454619457227857,-0.014546194572289561,-0.014546194572305882,
                0.5712957595050765}))),
      bus_6700(n(ii(start={-0.36732949303603246,1.6256978360959053,-0.031249903532927503,
                -0.16897344444788787}), ir(start={0.3603742923546326,-1.6665030580947287,
                0.09081944420046434,0.4128844012334247})), p(ii(start={
                0.030026850808088416,0.013816633201180676,-0.3673294930355991,-0.36732949303811563,
                -0.3673294930146118}), ir(start={-0.15956045210658795,-0.11913750466070912,
                0.3603742923548217,0.360374292353735,0.3603742923649471}))),
      bus_7000(n(ii(start={-0.18733064060681226,-0.18733064060681903,-0.18733064060668242,
                -0.1873306406069039,-0.18733064060633275,-0.18733064060669846,-0.18733064060670274,
                -0.1873306406067876,-0.18733064060431914,0.5480187858685467,
                0.5480187858685466,0.5480187858685467,0.5480187858685467,
                0.5480187858685467,0.37748959167888224,-0.5088412010130995}), ir(
              start={0.6879399101005981,0.6879399101004342,0.6879399101006509,
                0.6879399101005081,0.6879399101005124,0.6879399101002805,
                0.6879399101003962,0.6879399101005396,0.6879399100997289,-1.2901622148976797,
                -1.2901622148976797,-1.2901622148976797,-1.2901622148976797,-1.2901622148976797,
                -0.6580308728085009,0.9235170348974555})), p(ii(start={-0.08422758433718008,
                -0.1037985392403095,-0.10379853924030952,-0.6309418917326584}),
            ir(start={-0.3425567255831658,-0.39101490863504923,-0.39101490863504923,
                1.1184522643490602}))),
      bus_7100(n(ii(start={-0.0425377762922216,-0.022966821389092208,-0.022966821389092222,
                1.0912373224052776,1.0912373224052776,-0.6682516189784006,-0.6682516189776572,
                -0.6682516189430872}), ir(start={0.31416995813346343,
                0.36262814118534675,0.3626281411853467,-0.9985253739265135,-0.9985253739265135,
                0.2796433275857845,0.2796433275859309,0.2796433275945826})), p(ii(
              start={-0.031131120530807656,-0.07830477739799603,
                0.02018752908779823}), ir(start={0.45035635049490846,-0.2995933487816285,
                -0.032068477130707}))),
      bus_8500(n(ii(start={-0.0535031755450502,-0.024286417399469944,-0.20716521533232618,
                -0.2071652153315628,0.6757461370052615,0.6757461370052615,
                0.6757461370052615,2.035359028066825E-24,-0.2804898072220658}),
            ir(start={0.2174731179708017,0.26680664298279344,0.09000545044076796,
                0.09000545044115273,-0.7298887553778477,-0.7298887553778476,-0.7298887553778477,
                4.429867084768198E-25,0.3029629125176588})), p(ii(start={-0.23733172551480372,
                -0.0762413116309458,-0.05915644636466222,-0.2071652153315068,-0.20716521533242296,
                -0.20716521533241944,-0.20716521533210092,-0.05323823534644763}),
            ir(start={0.34098708124563376,0.2520802016758188,0.21173562207275395,
                0.09000545044115266,0.09000545044084468,0.09000545044092732,
                0.09000545044076172,0.057587985022475426}))),
      genEventTest(hYGOV(Velocity_Limiter(u(start=0.0008487203078045438)))),
      line_3000_3115(p(ii(start=0.2693936393905713), ir(start=-0.04723449285785558))),
      line_3000_3245_1(n(ii(start=0.11525681667334899), ir(start=-0.22612690365659835))),
      line_3000_3300_1(p(ii(start=-0.21192568845249726), ir(start=
                0.6578601391612141))),
      line_3100_3115(p(ii(start=-0.045899354806988535), ir(start=-0.23658873536721034))),
      line_3100_3200_1(n(ii(start=0.05092363446286805), ir(start=
                0.1717064949661043))),
      line_3100_3200_2(n(ii(start=0.050923634462868045), ir(start=
                0.1717064949661043))),
      line_3100_3200_3(n(ii(start=0.05092363446286805), ir(start=
                0.1717064949661043))),
      line_3100_3249(n(ii(start=0.1706469374762958), ir(start=0.6125192845856392))),
      line_3115_3245(n(ii(start=0.1564726180293059), ir(start=-0.2970227970519987))),
      line_3115_3249(p(ii(start=-0.023775113497000757), ir(start=
                0.37366795537902553))),
      line_3300_8500_1(p(ii(start=0.024286417399470017), ir(start=-0.26680664298279355))),
      line_3359_8500_1(n(ii(start=0.017256859043226134), ir(start=
                0.2908945014385467))),
      line_3359_8500_2(n(ii(start=0.024991907242092527), ir(start=
                0.2466684918592091))),
      line_5101_5102(p(
          ii(start=0.04339284353285225),
          ir(start=1.0832502991094406),
          vi(start=0.01989297974085196),
          vr(start=1.0077847526702344))),
      line_5101_5103(p(
          ii(start=0.04113309268482909),
          ir(start=0.8826853927757564),
          vi(start=0.035379478721351575),
          vr(start=1.0048045914746762))),
      line_5101_5501(n(ii(start=0.448314770413636), ir(start=-0.4997318950442999))),
      line_5102_5103(p(ii(start=-0.03991929046972535), ir(start=-0.21838917660269133))),
      line_5102_6001(n(ii(start=0.05938198723320608), ir(start=-0.29260163400455014))),
      line_5103_5304_1(p(ii(start=0.1172527599929732), ir(start=
                0.48147139147882567))),
      line_5103_5304_2(p(
          ii(start=0.12390613747534192),
          ir(start=0.6061533343096694),
          vi(start=0.15878600917125807),
          vr(start=0.9939288570112779))),
      line_5301_5304(p(ii(start=0.2017891470049816), ir(start=0.6622230901549788))),
      line_5301_6001(n(ii(start=-0.2573178914331931), ir(start=-0.6887210577181403))),
      line_5400_6000(n(ii(start=-0.031202256570133865), ir(start=-0.171337133450978))),
      line_5401_6001(n(ii(start=-0.13477004469824005), ir(start=-0.06423578332653493)),
          p(ii(start=0.16335709962536316), ir(start=0.06002199701174136))),
      line_5500_5603(n(ii(start=0.039055211166527125), ir(start=-0.6321988524910486)),
          p(ii(start=0.013251136425091853), ir(start=0.623345616982764))),
      line_5600_5603(p(
          ii(start=0.006697725633979191),
          ir(start=1.5348085412619614),
          vi(start=0.36648206478511014),
          vr(start=1.0659589950830346))),
      line_6000_6100(n(ii(start=-0.4494263912931875), ir(start=-0.8404441425718477))));

    annotation (
        experiment(
        StartTime=60,
        StopTime=65,
        Interval=0.001,
        Tolerance=5e-05,
        __Dymola_fixedstepsize=0.01),
        __Dymola_experimentFlags(
        Advanced(Define(DAEsolver=true))));
end Nordic44_Base_Case_StateEvents3;
