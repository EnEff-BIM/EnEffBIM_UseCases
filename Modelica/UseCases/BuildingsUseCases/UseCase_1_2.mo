within UseCases.BuildingsUseCases;
model UseCase_1_2

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam="D:/EnEff-BIM/UseCaseEnEffBIM/Utilities/Buildings/DEU_Koln.105130_IWEC.mos")
    annotation (Placement(transformation(extent={{60,76},{80,96}})));
  //room1 manuell
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{108,82},{124,98}})));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor Sen_Room_Temp
    annotation (Placement(transformation(extent={{72,62},{60,74}})));
  Buildings.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 Radiator(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    Q_flow_nominal=1300,
    nEle=10,
    m_flow_nominal=0.05,
    p_start=200000,
    T_start=313.15,
    T_a_nominal=343.15,
    T_b_nominal=313.15,
    TAir_nominal=294.15,
    TRad_nominal=294.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={36,36})));

  Buildings.Fluid.Boilers.BoilerPolynomial Boiler(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    Q_flow_nominal=1300,
    fue=Buildings.Fluid.Data.Fuels.NaturalGasHigherHeatingValue(),
    dp_nominal=0,
    a={1},
    m_flow_nominal=0.05,
    p_start=200000,
    T_start=313.15,
    T_nominal=343.15)
    annotation (Placement(transformation(extent={{-86,42},{-66,62}})));

  Buildings.Fluid.Movers.FlowMachine_dp Pump(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p_start=200000,
    T_start=313.15,
    m_flow_nominal=0.05)
    annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
  Buildings.Fluid.Storage.ExpansionVessel Vessel(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    V_start=0.01,
    p_start=200000,
    T_start=313.15,
    p=200000)
    annotation (Placement(transformation(extent={{-66,16},{-46,36}})));

  Buildings.Fluid.FixedResistances.Pipe Pipe(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    thicknessIns=0.03,
    lambdaIns=0.035,
    length=10,
    diameter=0.015,
    p_start=200000,
    T_start=313.15,
    m_flow_nominal=0.05)
    annotation (Placement(transformation(extent={{-10,44},{10,64}})));
  Buildings.Fluid.FixedResistances.Pipe PipeReturn(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    thicknessIns=0.03,
    lambdaIns=0.035,
    length=10,
    diameter=0.015,
    p_start=200000,
    T_start=313.15,
    m_flow_nominal=0.05)
    annotation (Placement(transformation(extent={{-12,6},{8,26}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear Valve(redeclare package Medium
      = Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=0.05,
    dpValve_nominal=1000)
    annotation (Placement(transformation(extent={{14,44},{34,64}})));
  Modelica.Blocks.Sources.Constant pump_dp_set(k=5000)
    annotation (Placement(transformation(extent={{-30,72},{-42,84}})));
  Utilities.Buildings.MixedAir_VDI6020                       roo(redeclare
      package Medium = Buildings.Media.IdealGases.SimpleAir, lat=0.88784899048952)
    annotation (Placement(transformation(extent={{58,18},{98,58}})));
  Modelica.Blocks.Math.Gain          pers_rad(k=80/17.5)
    annotation (Placement(transformation(extent={{96,10},{106,20}})));
  Modelica.Blocks.Math.Sum sum1(nin=2)
    annotation (Placement(transformation(extent={{132,-12},{142,-2}})));
  Modelica.Blocks.Sources.Constant lat_he_input(k=0)
    annotation (Placement(transformation(extent={{132,-30},{142,-20}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_2
    annotation (Placement(transformation(extent={{148,-12},{158,-2}})));
  Modelica.Blocks.Math.Gain          pers_conv(k=80/17.5)
    annotation (Placement(transformation(extent={{98,-8},{108,2}})));
  Modelica.Blocks.Math.Gain          mach_conv(k=200/17.5)
    annotation (Placement(transformation(extent={{96,-28},{106,-18}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="InnerLoads",
    columns={2,3,4},
    fileName="InnerLoads.txt")
    annotation (Placement(transformation(extent={{54,-14},{74,6}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex Tank(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=0.01036,
    VTan=0.4,
    hTan=1,
    dIns=0.2,
    redeclare package MediumHex =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    hHex_a=0.95,
    hHex_b=0.05,
    hexSegMult=2,
    nSeg=6,
    Q_flow_nominal=1300,
    mHex_flow_nominal=0.05,
    T_start=360,
    TTan_nominal=353.15,
    THex_nominal=313.15)
    annotation (Placement(transformation(extent={{-66,-62},{-96,-34}})));
  Buildings.Fluid.Sources.Boundary_pT water_supply(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=400000,
    T=281.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-78,-98},{-98,-78}})));
  Buildings.Fluid.Sources.Boundary_pT water_sink(nPorts=1, redeclare package
      Medium =         Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-74,-98},{-54,-78}})));
  Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage Nutzwasser_Ventil(
    dpValve_nominal=300000,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=0.1)                                   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-36,-68})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTemp_Tank
    annotation (Placement(transformation(extent={{-82,-10},{-96,4}})));
  Modelica.Blocks.Sources.BooleanPulse Wateruse_Active(
    period=86400,
    startTime=36000,
    width=(1/48)*100)
    annotation (Placement(transformation(extent={{10,-72},{2,-64}})));
  Modelica.Blocks.Math.BooleanToReal Nutzwasser_Ventil_Set(realTrue=1,
      realFalse=0)
    annotation (Placement(transformation(extent={{-8,-73},{-16,-64}})));
  Buildings.Fluid.FixedResistances.Pipe Pipe_Tank(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    thicknessIns=0.03,
    lambdaIns=0.035,
    p_start=200000,
    T_start=313.15,
    m_flow_nominal=0.05,
    diameter=0.015,
    length=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-62,-22})));
  Buildings.Fluid.FixedResistances.Pipe PipeReturn_Tank(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    thicknessIns=0.03,
    lambdaIns=0.035,
    m_flow_nominal=0.05,
    diameter=0.015,
    length=1,
    p_start=200000,
    T_start=313.15) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-50,-38})));
  Buildings.Fluid.Actuators.Valves.ThreeWayEqualPercentageLinear val(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    m_flow_nominal=0.1,
    dpValve_nominal=0)
    annotation (Placement(transformation(extent={{-32,42},{-12,62}})));
  Modelica.Blocks.Continuous.LimPID PID_boiler(
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=0.62,
    Td=0.47,
    Ti=10)
    annotation (Placement(transformation(extent={{-88,81},{-78,91}})));
  Modelica.Blocks.Logical.Hysteresis tank_warm_hysteresis(uLow=355, uHigh=360)
    annotation (Placement(transformation(extent={{-150,41},{-140,51}})));
  Modelica.Blocks.Logical.Not tank_not_warm
    annotation (Placement(transformation(extent={{-134,41},{-124,51}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{-120,41},{-110,51}})));
  Modelica.Blocks.Math.BooleanToReal DHW_valve_set(realTrue=0, realFalse=1)
    annotation (Placement(transformation(extent={{-40,91},{-30,100}})));
  Modelica.Blocks.Logical.Hysteresis room_too_cold(uLow=0.1, uHigh=0.3)
    annotation (Placement(transformation(extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-131,16})));
  Modelica.Blocks.Logical.Not room_warm_enough annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-115,16})));
  Buildings.Controls.Continuous.LimPID conPID(
    k=10,
    Ti=360,
    Td=200)
    annotation (Placement(transformation(extent={{12,75},{22,85}})));
  Modelica.Blocks.Math.BooleanToReal room_temp_set(realTrue=21, realFalse=18)
    annotation (Placement(transformation(extent={{-8,74},{4,86}})));
  Modelica.Blocks.Sources.BooleanPulse nightSignal(
    width=45.8,
    period=86400,
    startTime=64800)
    annotation (Placement(transformation(extent={{-20,89},{-12,98}})));
  Modelica.Blocks.Sources.Constant max_vorl_temp(k=340)
    annotation (Placement(transformation(extent={{-110,80},{-96,93}})));
equation

  // eigener Code

  //eigener Code Ende
  connect(Boiler.port_a, Vessel.port_a) annotation (Line(
      points={{-86,52},{-86,16},{-56,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Radiator.port_b, PipeReturn.port_b) annotation (Line(
      points={{36,26},{36,16},{8,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PipeReturn.port_a, Vessel.port_a) annotation (Line(
      points={{-12,16},{-56,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe.port_b, Valve.port_a) annotation (Line(
      points={{10,54},{14,54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Valve.port_b, Radiator.port_a) annotation (Line(
      points={{34,54},{36,54},{36,46}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(Radiator.heatPortRad, roo.heaPorRad) annotation (Line(
      points={{43.2,34},{60,34},{60,34.2},{77,34.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Radiator.heatPortCon, roo.heaPorAir) annotation (Line(
      points={{43.2,38},{77,38}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(Sen_Room_Temp.port, roo.heaPorAir) annotation (Line(
      points={{72,68},{68,68},{68,48},{77,48},{77,38}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(weaDat.weaBus, roo.weaBus) annotation (Line(
      points={{80,86},{95.9,86},{95.9,55.9}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Pump.dp_in, pump_dp_set.y) annotation (Line(
      points={{-46.2,64},{-46.2,78},{-42.6,78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Boiler.port_b, Pump.port_a) annotation (Line(
      points={{-66,52},{-56,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sum1.y,multiplex3_2. u2[1]) annotation (Line(
      points={{142.5,-7},{147,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex3_2.u3[1],lat_he_input. y) annotation (Line(
      points={{147,-10.5},{144,-10.5},{144,-25},{142.5,-25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pers_conv.y,sum1. u[1]) annotation (Line(
      points={{108.5,-3},{119.35,-3},{119.35,-7.5},{131,-7.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mach_conv.y,sum1. u[2]) annotation (Line(
      points={{106.5,-23},{120,-23},{120,-6.5},{131,-6.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pers_rad.y,multiplex3_2. u1[1]) annotation (Line(
      points={{106.5,15},{147,15},{147,-3.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex3_2.y, roo.qGai_flow) annotation (Line(
      points={{158.5,-7},{170,-7},{170,48},{50,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[3], pers_rad.u) annotation (Line(
      points={{75,-4},{86,-4},{86,15},{95,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[1], pers_conv.u) annotation (Line(
      points={{75,-4},{86,-4},{86,-3},{97,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[2], mach_conv.u) annotation (Line(
      points={{75,-4},{86,-4},{86,-23},{95,-23}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Nutzwasser_Ventil.port_b,water_sink. ports[1]) annotation (Line(
      points={{-36,-78},{-36,-88},{-54,-88}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Nutzwasser_Ventil_Set.y,Nutzwasser_Ventil. y) annotation (Line(
      points={{-16.4,-68.5},{-20.2,-68.5},{-20.2,-68},{-24,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Wateruse_Active.y,Nutzwasser_Ventil_Set. u) annotation (Line(
      points={{1.6,-68},{0,-68},{0,-68.5},{-7.2,-68.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Tank.port_a,Nutzwasser_Ventil. port_a) annotation (Line(
      points={{-66,-48},{-36,-48},{-36,-58}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank.port_b,water_supply. ports[1]) annotation (Line(
      points={{-96,-48},{-102,-48},{-102,-88},{-98,-88}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemp_Tank.port,Tank. heaPorVol[1]) annotation (Line(
      points={{-82,-3},{-81,-3},{-81,-48.7}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Tank.portHex_b,PipeReturn_Tank. port_b) annotation (Line(
      points={{-66,-59.2},{-64,-59.2},{-64,-60},{-56,-60},{-56,-52},{-50,-52},{
          -50,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PipeReturn_Tank.port_a, Vessel.port_a) annotation (Line(
      points={{-50,-32},{-50,-14},{-56,-14},{-56,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Tank.portHex_a,Pipe_Tank. port_b) annotation (Line(
      points={{-66,-53.32},{-62,-53.32},{-62,-28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe.port_a, val.port_2) annotation (Line(
      points={{-10,54},{-12,54},{-12,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pump.port_b, val.port_1) annotation (Line(
      points={{-36,52},{-32,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe_Tank.port_a, val.port_3) annotation (Line(
      points={{-62,-16},{-64,-16},{-64,-2},{-22,-2},{-22,42}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Boiler.T, PID_boiler.u_m) annotation (Line(
      points={{-65,60},{-60,60},{-60,66},{-83,66},{-83,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_boiler.y, Boiler.y) annotation (Line(
      points={{-77.5,86},{-64,86},{-64,78},{-62,78},{-62,70},{-94,70},{-94,60},
          {-88,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tank_warm_hysteresis.y,tank_not_warm. u) annotation (Line(
      points={{-139.5,46},{-135,46}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(tank_not_warm.y,and1. u1) annotation (Line(
      points={{-123.5,46},{-121,46}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(senTemp_Tank.T, tank_warm_hysteresis.u) annotation (Line(
      points={{-96,-3},{-132,-3},{-132,-34},{-158,-34},{-158,46},{-151,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DHW_valve_set.y, val.y) annotation (Line(
      points={{-29.5,95.5},{-22,95.5},{-22,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(and1.y, DHW_valve_set.u) annotation (Line(
      points={{-109.5,46},{-98,46},{-98,95.5},{-41,95.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(room_too_cold.y,room_warm_enough. u) annotation (Line(
      points={{-125.5,16},{-121,16}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(room_warm_enough.y, and1.u2) annotation (Line(
      points={{-109.5,16},{-100,16},{-100,30},{-121,30},{-121,42}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(conPID.y, Valve.y) annotation (Line(
      points={{22.5,80},{24,80},{24,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.u_s, room_temp_set.y) annotation (Line(
      points={{11,80},{4.6,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.u_m, Sen_Room_Temp.T) annotation (Line(
      points={{17,74},{18,74},{18,68},{60,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Sen_Room_Temp.T, room_too_cold.u) annotation (Line(
      points={{60,68},{-162,68},{-162,16},{-137,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(room_temp_set.u, nightSignal.y) annotation (Line(
      points={{-9.2,80},{-8,80},{-8,93.5},{-11.6,93.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(PID_boiler.u_s, max_vorl_temp.y) annotation (Line(
      points={{-89,86},{-92,86},{-92,86.5},{-95.3,86.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3.1536e+007, Interval=60),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
</html>"));
end UseCase_1_2;
