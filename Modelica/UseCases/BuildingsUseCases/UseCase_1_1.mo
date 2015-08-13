within UseCases.BuildingsUseCases;
model UseCase_1_1

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam="D:/EnEff-BIM/UseCaseEnEffBIM/Utilities/Buildings/DEU_Koln.105130_IWEC.mos")
    annotation (Placement(transformation(extent={{60,76},{80,96}})));
  //room1 manuell
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-98,-98},{-82,-82}})));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor Sen_Room_Temp
    annotation (Placement(transformation(extent={{48,80},{36,92}})));
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
    annotation (Placement(transformation(extent={{-54,42},{-34,62}})));
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
    annotation (Placement(transformation(extent={{-24,42},{-4,62}})));
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
    annotation (Placement(transformation(extent={{2,42},{22,62}})));
  Buildings.Controls.Continuous.LimPID conPID(Ti=300, Td=300)
    annotation (Placement(transformation(extent={{-70,84},{-60,94}})));
  Modelica.Blocks.Sources.Constant pump_dp_set(k=5000)
    annotation (Placement(transformation(extent={{-30,72},{-42,84}})));
  Utilities.Buildings.MixedAir_VDI6020                       roo(redeclare
      package Medium = Buildings.Media.IdealGases.SimpleAir, lat=0.88784899048952)
    annotation (Placement(transformation(extent={{58,18},{98,58}})));
  Buildings.Fluid.Sensors.Temperature senTem_vorl(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-54,62},{-66,74}})));
  Modelica.Blocks.Sources.Constant max_vorl_temp(k=340)
    annotation (Placement(transformation(extent={{-70,69},{-76,75}})));
  Modelica.Blocks.Continuous.LimPID PID_boiler(
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=0.62,
    Td=0.47,
    Ti=10)
    annotation (Placement(transformation(extent={{-80,68},{-88,76}})));
  Modelica.Blocks.Sources.Constant max_vorl_temp1(
                                                 k=340)
    annotation (Placement(transformation(extent={{-100,84},{-90,93}})));
  Modelica.Blocks.Math.Gain          pers_rad(k=80/17.5)
    annotation (Placement(transformation(extent={{-32,-36},{-22,-26}})));
  Modelica.Blocks.Math.Sum sum1(nin=2)
    annotation (Placement(transformation(extent={{4,-58},{14,-48}})));
  Modelica.Blocks.Sources.Constant lat_he_input(k=0)
    annotation (Placement(transformation(extent={{4,-76},{14,-66}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_2
    annotation (Placement(transformation(extent={{20,-58},{30,-48}})));
  Modelica.Blocks.Math.Gain          pers_conv(k=80/17.5)
    annotation (Placement(transformation(extent={{-30,-54},{-20,-44}})));
  Modelica.Blocks.Math.Gain          mach_conv(k=200/17.5)
    annotation (Placement(transformation(extent={{-32,-74},{-22,-64}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="InnerLoads",
    columns={2,3,4},
    fileName="InnerLoads.txt")
    annotation (Placement(transformation(extent={{-74,-60},{-54,-40}})));
equation

  // eigener Code

  //eigener Code Ende
  connect(Boiler.port_a, Vessel.port_a) annotation (Line(
      points={{-86,52},{-86,16},{-56,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pump.port_b, Pipe.port_a) annotation (Line(
      points={{-34,52},{-24,52}},
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
      points={{-4,52},{2,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Valve.port_b, Radiator.port_a) annotation (Line(
      points={{22,52},{36,52},{36,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPID.u_m, Sen_Room_Temp.T) annotation (Line(
      points={{-65,83},{-65,80},{-54,80},{-54,94},{30,94},{30,86},{36,86}},
      color={0,0,127},
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
      points={{48,86},{48,70},{68,70},{68,48},{77,48},{77,38}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(weaDat.weaBus, roo.weaBus) annotation (Line(
      points={{80,86},{95.9,86},{95.9,55.9}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Pump.dp_in, pump_dp_set.y) annotation (Line(
      points={{-44.2,64},{-44.2,78},{-42.6,78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_boiler.u_s, max_vorl_temp.y) annotation (Line(
      points={{-79.2,72},{-76.3,72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTem_vorl.T, PID_boiler.u_m) annotation (Line(
      points={{-64.2,68},{-68,68},{-68,64},{-84,64},{-84,67.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_boiler.y, Boiler.y) annotation (Line(
      points={{-88.4,72},{-92,72},{-92,60},{-88,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Boiler.port_b, Pump.port_a) annotation (Line(
      points={{-66,52},{-54,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTem_vorl.port, Boiler.port_b) annotation (Line(
      points={{-60,62},{-60,52},{-66,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(max_vorl_temp1.y, conPID.u_s) annotation (Line(
      points={{-89.5,88.5},{-80.75,88.5},{-80.75,89},{-71,89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.y, Valve.y) annotation (Line(
      points={{-59.5,89},{12,89},{12,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sum1.y,multiplex3_2. u2[1]) annotation (Line(
      points={{14.5,-53},{19,-53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex3_2.u3[1],lat_he_input. y) annotation (Line(
      points={{19,-56.5},{16,-56.5},{16,-71},{14.5,-71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pers_conv.y,sum1. u[1]) annotation (Line(
      points={{-19.5,-49},{-8.65,-49},{-8.65,-53.5},{3,-53.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mach_conv.y,sum1. u[2]) annotation (Line(
      points={{-21.5,-69},{-8,-69},{-8,-52.5},{3,-52.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pers_rad.y,multiplex3_2. u1[1]) annotation (Line(
      points={{-21.5,-31},{19,-31},{19,-49.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex3_2.y, roo.qGai_flow) annotation (Line(
      points={{30.5,-53},{42,-53},{42,48},{50,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[3], pers_rad.u) annotation (Line(
      points={{-53,-50},{-42,-50},{-42,-31},{-33,-31}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[1], pers_conv.u) annotation (Line(
      points={{-53,-50},{-42,-50},{-42,-49},{-31,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y[2], mach_conv.u) annotation (Line(
      points={{-53,-50},{-42,-50},{-42,-69},{-33,-69}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),     graphics),
    experiment(StopTime=3.1536e+007, Interval=60),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
</html>"));
end UseCase_1_1;
