within UseCases.BuildingsUseCases;
model UseCase_4_2

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam="D:/EnEff-BIM/UseCaseEnEffBIM/Utilities/Buildings/DEU_Koln.105130_IWEC.mos")
    annotation (Placement(transformation(extent={{60,76},{80,96}})));
  //room1 manuell
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{108,82},{124,98}})));



  Utilities.Buildings.MixedAir_VDI6020                       roo(
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated,
    lat=0.88784899048952,
    nPorts=3)
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
  Buildings.Fluid.Sources.Outside_CpLowRise out(
    nPorts=2,
    s=1,
    azi=0,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-128,4},{-108,24}})));
  Buildings.Fluid.Actuators.Dampers.Exponential Damper(
                                              m_flow_nominal=0.05, redeclare
      package Medium = Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-102,26},{-88,40}})));
  Buildings.Fluid.Actuators.Dampers.Exponential DamperReturn(
                                                     m_flow_nominal=0.05,
      redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-88,-12},{-102,2}})));
  Buildings.Airflow.Multizone.Orifice OrificeReturn(A=0.1, redeclare package
      Medium = Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{4,-10},{-6,0}})));
  Buildings.Airflow.Multizone.Orifice Orifice(A=0.1, redeclare package Medium
      = Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-6,28},{4,38}})));
  Buildings.Fluid.Movers.FlowMachine_dp Fan(
    dynamicBalance=false,
    m_flow_nominal=0.05,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-30,23},{-10,43}})));
  Buildings.Fluid.Movers.FlowMachine_dp FanReturn(
    dynamicBalance=false,
    m_flow_nominal=0.05,
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-12,-15},{-32,5}})));
  Modelica.Blocks.Sources.Constant damper_set(k=0.7)
    annotation (Placement(transformation(extent={{-128,40},{-118,50}})));
  Modelica.Blocks.Sources.Constant room_temp_set(k=294.15)
    annotation (Placement(transformation(extent={{-123,65},{-113,75}})));
  Buildings.Fluid.Sensors.Temperature senTem(redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{22,70},{10,82}})));
  Modelica.Blocks.Continuous.LimPID PID(
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=2.5,
    Ti=50,
    Td=10.5)
            annotation (Placement(transformation(extent={{-106,66},{-98,74}})));
  Modelica.Blocks.Continuous.LimPID PID_dp(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    yMax=550,
    yMin=18,
    k=100,
    Ti=20,
    Td=4)     annotation (Placement(transformation(extent={{-54,68},{-46,76}})));
  Buildings.Fluid.Sensors.Temperature senTem_vorl(redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated)
    annotation (Placement(transformation(extent={{-30,40},{-42,52}})));
  Modelica.Blocks.Continuous.LimPID PID_hea(
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=0.62,
    Ti=115,
    Td=0.47)
          annotation (Placement(transformation(extent={{-56,44},{-64,52}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{-78,46},{-84,52}})));
  Modelica.Blocks.Sources.Constant max_air_temp(k=318.15)
    annotation (Placement(transformation(extent={{-46,45},{-52,51}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=2, k={1,-1})
    annotation (Placement(transformation(extent={{-86,66},{-78,74}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-70,68},{-62,76}})));
  Buildings.Fluid.HeatExchangers.HeaterCooler_u hea(
    redeclare package Medium =
        Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated,
    m_flow_nominal=0.05,
    dp_nominal=200,
    Q_flow_nominal=1300)
    annotation (Placement(transformation(extent={{-64,18},{-44,38}})));
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
      points={{-108,16},{-108,33},{-102,33}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(out.ports[2],DamperReturn. port_b) annotation (Line(
      points={{-108,12},{-108,-5},{-102,-5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Fan.port_b,Orifice. port_a) annotation (Line(
      points={{-10,33},{-6,33}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(FanReturn.port_a,OrificeReturn. port_b) annotation (Line(
      points={{-12,-5},{-6,-5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(damper_set.y,Damper. y) annotation (Line(
      points={{-117.5,45},{-95,45},{-95,41.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(DamperReturn.y,damper_set. y) annotation (Line(
      points={{-95,3.4},{-95,20},{-106,20},{-106,45},{-117.5,45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaDat.weaBus,out. weaBus) annotation (Line(
      points={{80,86},{64,86},{64,58},{-134,58},{-134,14.2},{-128,14.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(room_temp_set.y,PID. u_s) annotation (Line(
      points={{-112.5,70},{-106.8,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTem.T,PID. u_m) annotation (Line(
      points={{11.8,76},{0,76},{0,62},{-102,62},{-102,65.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_dp.y,Fan. dp_in) annotation (Line(
      points={{-45.6,72},{-20.2,72},{-20.2,45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Damper.port_b, hea.port_a) annotation (Line(
      points={{-88,33},{-74,33},{-74,28},{-64,28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(roo.weaBus,out. weaBus) annotation (Line(
      points={{95.9,55.9},{95.9,58},{-134,58},{-134,14.2},{-128,14.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(FanReturn.dp_in,Fan. dp_in) annotation (Line(
      points={{-21.8,7},{-21.8,12},{-28,12},{-28,50},{-20,50},{-20.2,45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTem_vorl.port,Fan. port_a) annotation (Line(
      points={{-36,40},{-36,33},{-30,33}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PID.y,product. u1) annotation (Line(
      points={{-97.6,70},{-94,70},{-94,60},{-74,60},{-74,50.8},{-77.4,50.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_hea.y,product. u2) annotation (Line(
      points={{-64.4,48},{-70,48},{-70,47.2},{-77.4,47.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_hea.u_m,senTem_vorl. T) annotation (Line(
      points={{-60,43.2},{-60,38},{-44,38},{-44,46},{-40.2,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID_hea.u_s,max_air_temp. y) annotation (Line(
      points={{-55.2,48},{-52.3,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product.y, hea.u) annotation (Line(
      points={{-84.3,49},{-80,49},{-80,34},{-66,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum.u[1],PID. u_s) annotation (Line(
      points={{-86,71.4},{-94,71.4},{-94,78},{-110,78},{-110,70},{-106.8,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum.u[2],PID. u_m) annotation (Line(
      points={{-86,68.6},{-90,68.6},{-90,62},{-102,62},{-102,65.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum.y,PID_dp. u_m) annotation (Line(
      points={{-77.32,70},{-74,70},{-74,64},{-50,64},{-50,67.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y,PID_dp. u_s) annotation (Line(
      points={{-61.6,72},{-54.8,72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hea.port_b,Fan. port_a) annotation (Line(
      points={{-44,28},{-38,28},{-38,33},{-30,33}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DamperReturn.port_a,FanReturn. port_b) annotation (Line(
      points={{-88,-5},{-32,-5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTem.port, roo.ports[1]) annotation (Line(
      points={{16,70},{10,70},{10,86},{63,86},{63,25.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Orifice.port_b, roo.ports[2]) annotation (Line(
      points={{4,33},{34,33},{34,28},{63,28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(OrificeReturn.port_a, roo.ports[3]) annotation (Line(
      points={{4,-5},{34,-5},{34,30.6667},{63,30.6667}},
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
