within UseCases.IdeasUseCases;
model UseCase_1_1

  IDEAS.Buildings.Components.Zone zone(
    V=52.5,
    nSurf=7,
    corrCV=1,
    linear=true,
    n50=12,
    TOpStart=294.15)
    annotation (Placement(transformation(extent={{82,66},{102,86}})));
  IDEAS.Buildings.Components.InternalWall internalWall(
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    AWall=15,
    inc=IDEAS.Constants.Wall,
    azi=IDEAS.Constants.South,
    insulationThickness=0,
    constructionType(nLay=1, mats={IDEAS.Buildings.Data.Interfaces.Material(
          d=0.24,
          k=0.56,
          c=1050,
          rho=1300,
          epsLw=0.88,
          epsSw=0.55,
          gas=false)})) "Ostseite"    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={13,58})));
  IDEAS.Buildings.Components.Window window(
    A=7,
    frac=0,
    azi=IDEAS.Constants.South,
    redeclare IDEAS.Buildings.Data.Frames.None fraType,
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    glazing(
      nLay=3,
      SwAbs=[0,0.0643,0.0,0.0522; 20,0.0659,0.0,0.0534; 30,0.0679,0.0,0.0548;
          40,0.0708,0.0,0.0566; 48,0.0738,0.0,0.058; 55,0.0769,0.0,0.0587; 57,
          0.0779,0.0,0.0587; 60,0.0796,0.0,0.0585; 63,0.0815,0.0,0.0579; 66,
          0.0837,0.0,0.0568; 68,0.0852,0.0,0.0558; 70,0.0858,0.0,0.0544; 72,
          0.089,0.0,0.0521; 75,0.0911,0.0,0.0495; 77.5,0.0929,0.0,0.0457; 80,
          0.094,0.0,0.0413; 82,0.0937,0.0,0.0372; 83.5,0.0924,0.0,0.0335; 85,
          0.0892,0.0,0.0291; 86,0.0854,0.0,0.0254; 87,0.079,0.0,0.0205; 88,
          0.0671,0.0,0.0128; 89,0.0473,0.0,0.0043; 89.5,0.304,0.0,0.0004; 89.99,
          0.001,0.0,0.0; 90,0.00,0.0,0.0],
      SwTrans=[0,0.747454; 10,0.746824; 20,0.744654; 30,0.739491; 40,0.729832;
          45,0.720922; 50,0.707331; 60,0.652331; 70,0.516754; 80,0.263009; 88.9,
          0.00; 90,0.00],
      SwAbsDif={0.0796,0.0,0.0585},
      SwTransDif=0.652331,
      U_value=2.1,
      g_value=0.75,
      mats={IDEAS.Buildings.Data.Interfaces.Material(
          d=0.003175,
          k=0.96,
          c=750,
          rho=2500,
          epsLw=0.84,
          epsSw=0.67,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.013,
          k=0.0241,
          c=1008,
          rho=1.23,
          epsLw=0,
          epsSw=0,
          gas=true,
          mhu=18.3*10e-6),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.003175,
          k=0.96,
          c=750,
          rho=2500,
          epsLw=0.84,
          epsSw=0.67,
          gas=false)}),
    inc=1.5707963267949) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={65,58})));
  IDEAS.Buildings.Components.InternalWall internalWall1(
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType(
      k=0.06,
      c=840,
      rho=50),
    AWall=17.5,
    inc=IDEAS.Constants.Floor,
    azi=IDEAS.Constants.South,
    insulationThickness=0,
    constructionType(nLay=4, mats={IDEAS.Buildings.Data.Interfaces.Material(
          d=0.002,
          k=0.21,
          c=1470,
          rho=1300,
          epsLw=0.93,
          epsSw=0.94,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.045,
          k=1.4,
          c=1050,
          rho=2200,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.012,
          k=0.06,
          c=840,
          rho=50,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.15,
          k=2.035,
          c=1050,
          rho=2400,
          epsLw=0.88,
          epsSw=0.55,
          gas=false)})) "Fußboden"    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-85,58})));
  IDEAS.Buildings.Components.InternalWall internalWall2(
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    AWall=15,
    inc=IDEAS.Constants.Wall,
    azi=IDEAS.Constants.West,
    insulationThickness=0,
    constructionType(nLay=1, mats={IDEAS.Buildings.Data.Interfaces.Material(
          d=0.24,
          k=0.56,
          c=1050,
          rho=1300,
          epsLw=0.88,
          epsSw=0.55,
          gas=false)})) "Westseite"    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-35,58})));
  IDEAS.Buildings.Components.InternalWall internalWall3(
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    AWall=10.5,
    inc=IDEAS.Constants.Wall,
    azi=IDEAS.Constants.North,
    insulationThickness=0,
    constructionType(nLay=1, mats={IDEAS.Buildings.Data.Interfaces.Material(
          d=0.24,
          k=0.56,
          c=1050,
          rho=1300,
          epsLw=0.88,
          epsSw=0.55,
          gas=false)})) "Nordseite"    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-11,58})));
  IDEAS.Buildings.Components.InternalWall internalWall4(
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType(
      k=0.06,
      c=840,
      rho=50),
    AWall=17.5,
    inc=IDEAS.Constants.Floor,
    azi=IDEAS.Constants.South,
    insulationThickness=0,
    constructionType(nLay=4, mats={IDEAS.Buildings.Data.Interfaces.Material(
          d=0.002,
          k=0.21,
          c=1470,
          rho=1300,
          epsLw=0.93,
          epsSw=0.94,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.045,
          k=1.4,
          c=1050,
          rho=2200,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.012,
          k=0.06,
          c=840,
          rho=50,
          gas=false),IDEAS.Buildings.Data.Interfaces.Material(
          d=0.15,
          k=2.035,
          c=1050,
          rho=2400,
          epsLw=0.88,
          epsSw=0.55,
          gas=false)})) "Decke"    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={-59,58})));
  IDEAS.Buildings.Components.OuterWall      outerWall_Mats(
    redeclare IDEAS.Buildings.Data.Insulation.none insulationType,
    insulationThickness=0,
    AWall=3.5,
    inc=IDEAS.Constants.Wall,
    azi=IDEAS.Constants.South,
    redeclare UseCases.Utilities.IDEAS.Wall constructionType)
                               annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={39,58})));
  IDEAS.Thermal.Components.Emission.Radiator radiator(medium=
        IDEAS.Thermal.Data.Media.Water(),
    QNom=1300,
    fraRad=0.35,
    TInNom=343.15,
    TOutNom=313.15,
    TZoneNom=294.15)
    annotation (Placement(transformation(extent={{90,-62},{114,-46}})));
  IDEAS.Thermal.Components.Production.Boiler boiler(
    QNom=1300,
    medium=IDEAS.Thermal.Data.Media.Water(),
    TInitial=293.15)
    annotation (Placement(transformation(extent={{-80,-72},{-60,-50}})));
  Modelica.Blocks.Sources.Constant Nenntemperatur(k=340)
    annotation (Placement(transformation(extent={{-94,-46},{-74,-26}})));
  Modelica.Blocks.Continuous.LimPID PID(
    yMax=1,
    Td=10.5,
    k=2.5,
    Ti=50,
    yMin=0.00001)
            annotation (Placement(transformation(extent={{-22,16},{-2,36}})));
  IDEAS.Thermal.Components.BaseClasses.Pump Pumpe(
    useInput=true,
    medium=IDEAS.Thermal.Data.Media.Water(),
    m=0.05,
    m_flowNom=0.05)                          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-60})));
  IDEAS.Thermal.Components.BaseClasses.AbsolutePressure absolutePressure(medium=
        IDEAS.Thermal.Data.Media.Water(), p=200000)
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-44})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow konvBelastung
    annotation (Placement(transformation(extent={{146,64},{126,84}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow radBelastung
    annotation (Placement(transformation(extent={{146,48},{126,68}})));
  IDEAS.Thermal.Components.BaseClasses.Pipe_Insulated Rohr_Vorlauf(
    medium=IDEAS.Thermal.Data.Media.Water(),
    m=1.8,
    UA=1.15)
    annotation (Placement(transformation(extent={{36,-56},{56,-64}})));
  Modelica.Blocks.Sources.Pulse pulse1(
    period=86400,
    width=41.66666666666,
    startTime=25200,
    amplitude=3,
    offset=291.15)
    annotation (Placement(transformation(extent={{-60,16},{-40,36}})));
  IDEAS.Thermal.Components.BaseClasses.Pipe_Insulated Rohr_Ruecklauf(
    medium=IDEAS.Thermal.Data.Media.Water(),
    m=1.8,
    UA=1.15)
    annotation (Placement(transformation(extent={{72,-80},{52,-88}})));
  Modelica.Blocks.Math.Sum sum1(nin=2)
    annotation (Placement(transformation(extent={{174,64},{154,84}})));
  inner IDEAS.SimInfoManager      sim(redeclare IDEAS.Climate.Meteo.Files.min60
      detail, redeclare IDEAS.Climate.Meteo.Locations.Koeln city)
    annotation (Placement(transformation(extent={{-94,12},{-74,32}})));
  Modelica.Blocks.Math.Gain pers(k=800/17.5)
    annotation (Placement(transformation(extent={{182,10},{192,20}})));
  Modelica.Blocks.Math.Gain mach(k=200/17.5)
    annotation (Placement(transformation(extent={{182,-10},{192,0}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="InnerLoads",
    columns={2,3,4},
    fileName="D:/workspaces/InnerLoads.txt")
    annotation (Placement(transformation(extent={{140,-4},{158,14}})));
equation

  //Simulationsergebnisgrößen

  connect(window.iSolDir, zone.iSolDir) annotation (Line(
      points={{75,58},{90,58},{90,66}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(window.surfRad_a, zone.surfRad[7]) annotation (Line(
      points={{71,63},{71,70.8571},{82,70.8571}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(window.surfCon_a, zone.surfCon[7]) annotation (Line(
      points={{68,63},{68,73.8571},{82,73.8571}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(window.propsBus_a, zone.propsBus[7]) annotation (Line(
      points={{61,63},{61,78.2857},{82,78.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall.propsBus_a, zone.propsBus[5]) annotation (Line(
      points={{9,63},{9,79.4286},{82,79.4286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall.surfCon_a, zone.surfCon[5]) annotation (Line(
      points={{16,63},{16,73.2857},{82,73.2857}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall.surfRad_a, zone.surfRad[5]) annotation (Line(
      points={{19,63},{19,70.2857},{82,70.2857}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall3.surfRad_a, zone.surfRad[4]) annotation (Line(
      points={{-5,63},{-5,68},{82,68},{82,70}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall3.surfCon_a, zone.surfCon[4]) annotation (Line(
      points={{-8,63},{-8,73},{82,73}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall3.propsBus_a, zone.propsBus[4]) annotation (Line(
      points={{-15,63},{-15,80},{82,80}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall2.surfRad_a, zone.surfRad[3]) annotation (Line(
      points={{-29,63},{-29,69.7143},{82,69.7143}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall2.surfCon_a, zone.surfCon[3]) annotation (Line(
      points={{-32,63},{-32,72.7143},{82,72.7143}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall2.propsBus_a, zone.propsBus[3]) annotation (Line(
      points={{-39,63},{-39,80.5714},{82,80.5714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.propsBus_a, zone.propsBus[1]) annotation (Line(
      points={{-89,63},{-89,81.7143},{82,81.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(internalWall1.surfCon_a, zone.surfCon[1]) annotation (Line(
      points={{-82,63},{-82,72.1429},{82,72.1429}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(outerWall_Mats.propsBus_a, zone.propsBus[6]) annotation (Line(
      points={{35,63},{35,78.8571},{82,78.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(outerWall_Mats.surfCon_a, zone.surfCon[6]) annotation (Line(
      points={{42,63},{42,74},{82,74},{82,73.5714}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(outerWall_Mats.surfRad_a, zone.surfRad[6]) annotation (Line(
      points={{45,63},{45,70.5714},{82,70.5714}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall1.surfRad_a, zone.surfRad[1]) annotation (Line(
      points={{-79,63},{-79,69.1429},{82,69.1429}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall4.surfCon_b, zone.surfCon[2]) annotation (Line(
      points={{-62,63},{-62,72.4286},{82,72.4286}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall4.surfRad_b, zone.surfRad[2]) annotation (Line(
      points={{-65,63},{-65,69.4286},{82,69.4286}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(internalWall4.propsBus_b, zone.propsBus[2]) annotation (Line(
      points={{-55,63},{-55,81.1429},{82,81.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Nenntemperatur.y, boiler.TSet) annotation (Line(
      points={{-73,-36},{-71,-36},{-71,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(zone.gainCon, radiator.heatPortCon) annotation (Line(
      points={{102,73},{106,73},{106,-46},{105,-46}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(PID.y, Pumpe.m_flowSet) annotation (Line(
      points={{-1,26},{10,26},{10,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(boiler.flowPort_b, Pumpe.flowPort_a) annotation (Line(
      points={{-60,-60},{0,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Pumpe.flowPort_a, absolutePressure.flowPort) annotation (Line(
      points={{0,-60},{-40,-60},{-40,-54}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(konvBelastung.port, zone.gainCon) annotation (Line(
      points={{126,74},{120,74},{120,73},{102,73}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(radiator.heatPortRad, zone.gainRad) annotation (Line(
      points={{109,-46},{108,-46},{108,70},{102,70}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(radBelastung.port, zone.gainRad) annotation (Line(
      points={{126,58},{102,58},{102,70}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Pumpe.flowPort_b, Rohr_Vorlauf.flowPort_a) annotation (Line(
      points={{20,-60},{36,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(radiator.flowPort_a, Rohr_Vorlauf.flowPort_b) annotation (Line(
      points={{90,-59},{74,-59},{74,-60},{56,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pulse1.y, PID.u_s) annotation (Line(
      points={{-39,26},{-24,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(boiler.flowPort_a, Rohr_Ruecklauf.flowPort_b) annotation (Line(
      points={{-60,-65.8},{-60,-84},{52,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(radiator.flowPort_b, Rohr_Ruecklauf.flowPort_a) annotation (Line(
      points={{114,-49},{116,-49},{116,-84},{72,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(konvBelastung.Q_flow, sum1.y) annotation (Line(
      points={{146,74},{153,74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(window.iSolDif, zone.iSolDif) annotation (Line(
      points={{75,61},{94,61},{94,66}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(zone.TSensor, PID.u_m) annotation (Line(
      points={{102.6,76},{110,76},{110,-4},{-12,-4},{-12,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[1], pers.u) annotation (Line(
      points={{158.9,5},{170,5},{170,15},{181,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[2], mach.u) annotation (Line(
      points={{158.9,5},{170,5},{170,-5},{181,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pers.y, radBelastung.Q_flow) annotation (Line(
      points={{192.5,15},{202,15},{202,58},{146,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mach.y, sum1.u[1]) annotation (Line(
      points={{192.5,-5},{212,-5},{212,73},{176,73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pers.y, sum1.u[2]) annotation (Line(
      points={{192.5,15},{224,15},{224,75},{176,75}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{220,100}},
          preserveAspectRatio=false), graphics),
    Icon(coordinateSystem(extent={{-100,-100},{220,100}})),
    experiment(StopTime=3.1536e+007, Interval=3600),
    __Dymola_experimentSetupOutput);
end UseCase_1_1;
