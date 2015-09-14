within UseCases.BuildingsUseCases;
model UseCase_4_2

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=Modelica.Utilities.Files.loadResource("modelica://UseCases/Resources/DEU_Koln.105130_IWEC.mos"))
    annotation (Placement(transformation(extent={{60,76},{80,96}})));
  //room1 manuell
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{108,82},{124,98}})));

  Utilities.Buildings.MixedAir_VDI6020                       roo(
    nPorts=3,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated,
    lat=0.88784899048952)
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
    fileName=Modelica.Utilities.Files.loadResource("modelica://UseCases/Resources/InnerLoads.txt"))
    annotation (Placement(transformation(extent={{54,-14},{74,6}})));
  Buildings.Fluid.Sources.Outside_CpLowRise out(
    nPorts=3,
    s=1,
    azi=0,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-146,16},{-126,36}})));
  Buildings.Fluid.Actuators.Dampers.Exponential Damper(
                                              m_flow_nominal=0.018, redeclare
      package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-120,38},{-106,52}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperReturn(
                                                     m_flow_nominal=0.018,
      redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-106,0},{-120,14}})));
  Buildings.Airflow.Multizone.Orifice OrificeReturn(A=0.1,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated,
    m=1)
    annotation (Placement(transformation(extent={{-16,2},{-26,12}})));
  Buildings.Airflow.Multizone.Orifice Orifice(A=0.1,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated,
    m=1)
    annotation (Placement(transformation(extent={{-26,40},{-16,50}})));
  Buildings.Fluid.Movers.FlowMachine_dp Fan(  m_flow_nominal=0.018, redeclare
      package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-50,36},{-30,56}})));
  Buildings.Fluid.Movers.FlowMachine_dp FanReturn(
                                              m_flow_nominal=0.018, redeclare
      package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-32,-2},{-52,18}})));
  Modelica.Blocks.Sources.Constant damper_set(k=1)
    annotation (Placement(transformation(extent={{-146,52},{-136,62}})));
  Modelica.Blocks.Sources.Constant room_temp_set(k=294.15)
    annotation (Placement(transformation(extent={{-150,80},{-140,90}})));
  Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-8,78},{-20,90}})));
  Modelica.Blocks.Continuous.LimPID PID(
    yMax=1,
    yMin=0,
    Ti=360,
    Td=360,
    k=1)    annotation (Placement(transformation(extent={{-114,76},{-106,84}})));
  Modelica.Blocks.Continuous.LimPID PID_dp(
    yMax=400,
    Ti=30,
    Td=30,
    yMin=30,
    k=1)      annotation (Placement(transformation(extent={{-72,76},{-64,84}})));
  Buildings.Fluid.MassExchangers.Humidifier_u         hum(
    m_flow_nominal=0.018,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated,
    dp_nominal=200,
    T=281.15,
    mWat_flow_nominal=0.0005)
    annotation (Placement(transformation(extent={{-88,34},{-68,54}})));
  Modelica.Blocks.Math.Gain gain_set(k=-1)
    annotation (Placement(transformation(extent={{-134,80},{-124,90}})));
  Modelica.Blocks.Math.Gain gain_measure(k=-1)
    annotation (Placement(transformation(extent={{-28,76},{-42,90}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort sen_RelHum_1(
                                                    m_flow_nominal=0.018,
      redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-102,34},{-92,44}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort sen_RelHum_2(
                                                    m_flow_nominal=0.018,
      redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-64,34},{-54,44}})));
  Buildings.Fluid.Sensors.RelativeHumidity sen_RelHum_out(redeclare package
      Medium = Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-147,2},{-137,12}})));
  Modelica.Blocks.Continuous.LimPID PID_hum(
    yMax=1,
    yMin=0,
    Ti=5,
    Td=5,
    k=1)      annotation (Placement(transformation(extent={{-82,58},{-90,66}})));
equation

  // eigener Code

  //eigener Code Ende

  connect(weaDat.weaBus, roo.weaBus) annotation (Line(
      points={{80,86},{95.9,86},{95.9,55.9}},
      color={255,204,51},
      thickness=0.5,
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
  connect(out.ports[1],Damper. port_a) annotation (Line(
      points={{-126,28.6667},{-126,45},{-120,45}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(out.ports[2],DamperReturn. port_b) annotation (Line(
      points={{-126,26},{-126,7},{-120,7}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Fan.port_b,Orifice. port_a) annotation (Line(
      points={{-30,46},{-30,45},{-26,45}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DamperReturn.port_a,FanReturn. port_b) annotation (Line(
      points={{-106,7},{-96,7},{-96,8},{-52,8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(FanReturn.port_a,OrificeReturn. port_b) annotation (Line(
      points={{-32,8},{-32,7},{-26,7}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(damper_set.y,Damper. y) annotation (Line(
      points={{-135.5,57},{-113,57},{-113,53.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DamperReturn.y,damper_set. y) annotation (Line(
      points={{-113,15.4},{-113,32},{-124,32},{-124,57},{-135.5,57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaDat.weaBus,out. weaBus) annotation (Line(
      points={{80,86},{40,86},{40,70},{-152,70},{-152,26.2},{-146,26.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(FanReturn.dp_in,Fan. dp_in) annotation (Line(
      points={{-41.8,20},{-41.8,26},{-48,26},{-48,64},{-40.2,64},{-40.2,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_dp.y,Fan. dp_in) annotation (Line(
      points={{-63.6,80},{-40.2,80},{-40.2,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain_measure.u,senTem. T) annotation (Line(
      points={{-26.6,83},{-22.3,83},{-22.3,84},{-18.2,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(room_temp_set.y,gain_set. u) annotation (Line(
      points={{-139.5,85},{-135,85}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain_set.y,PID. u_s) annotation (Line(
      points={{-123.5,85},{-123.5,80},{-114.8,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID.u_m,PID_dp. u_m) annotation (Line(
      points={{-110,75.2},{-110,72},{-68,72},{-68,75.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sen_RelHum_1.port_b,hum. port_a) annotation (Line(
      points={{-92,39},{-90,39},{-90,44},{-88,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Damper.port_b,sen_RelHum_1. port_a) annotation (Line(
      points={{-106,45},{-104,45},{-104,39},{-102,39}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hum.port_b,sen_RelHum_2. port_a) annotation (Line(
      points={{-68,44},{-66,44},{-66,39},{-64,39}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Fan.port_a,sen_RelHum_2. port_b) annotation (Line(
      points={{-50,46},{-52,46},{-52,39},{-54,39}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sen_RelHum_out.port,out. ports[3]) annotation (Line(
      points={{-142,2},{-142,-2},{-126,-2},{-126,23.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PID_hum.u_m,sen_RelHum_2. phi) annotation (Line(
      points={{-86,57.2},{-86,56},{-58.95,56},{-58.95,44.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_dp.u_s,gain_set. y) annotation (Line(
      points={{-72.8,80},{-76,80},{-76,90},{-120,90},{-120,85},{-123.5,85}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain_measure.y,PID_dp. u_m) annotation (Line(
      points={{-42.7,83},{-58,83},{-58,72},{-68,72},{-68,75.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_hum.y,hum. u) annotation (Line(
      points={{-90.4,62},{-96,62},{-96,50},{-90,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID.y,PID_hum. u_s) annotation (Line(
      points={{-105.6,80},{-98,80},{-98,74},{-78,74},{-78,62},{-81.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(roo.ports[1], senTem.port) annotation (Line(
      points={{63,25.3333},{-14,25.3333},{-14,78}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Orifice.port_b, roo.ports[2]) annotation (Line(
      points={{-16,45},{24,45},{24,28},{63,28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(OrificeReturn.port_a, roo.ports[3]) annotation (Line(
      points={{-16,7},{24,7},{24,30.6667},{63,30.6667}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=3.1536e+007, Interval=60),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
</html>"));
end UseCase_4_2;
