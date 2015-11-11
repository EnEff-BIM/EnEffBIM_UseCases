within UseCases.APIExample;
model JustPipes_Control
  BuildingSystems.Fluid.Sources.Boundary_pT bou_b(redeclare package Medium =
        BuildingSystems.Media.Specialized.Water.TemperatureDependentDensity,
      nPorts=1) annotation (Placement(transformation(extent={{102,0},{82,20}})));
  BuildingSystems.Fluid.Sources.Boundary_pT bou_a(redeclare package Medium =
        BuildingSystems.Media.Specialized.Water.TemperatureDependentDensity,
      nPorts=1)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  BuildingSystems.Fluid.FixedResistances.LosslessPipe pip(redeclare package
      Medium =
        BuildingSystems.Media.Specialized.Water.TemperatureDependentDensity,
      m_flow_nominal=5)
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Sources.Constant const(k=8)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  BuildingSystems.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium
      = BuildingSystems.Media.Specialized.Water.TemperatureDependentDensity)
    annotation (Placement(transformation(extent={{48,0},{68,20}})));
  BuildingSystems.Fluid.Movers.SpeedControlled_Nrpm pump(redeclare package
      Medium =
        BuildingSystems.Media.Specialized.Water.TemperatureDependentDensity,
      redeclare
      BuildingSystems.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per) annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  BuildingSystems.Controls.Continuous.LimPID conPID(yMax=600)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
equation
  connect(pip.port_b, senMasFlo.port_a) annotation (Line(
      points={{40,10},{48,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senMasFlo.port_b, bou_b.ports[1]) annotation (Line(
      points={{68,10},{82,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.port_b, pip.port_a) annotation (Line(
      points={{0,10},{20,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.port_a, bou_a.ports[1]) annotation (Line(
      points={{-20,10},{-80,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPID.y, pump.Nrpm) annotation (Line(
      points={{-39,50},{-10,50},{-10,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senMasFlo.m_flow, conPID.u_m) annotation (Line(
      points={{58,21},{58,30},{-50,30},{-50,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, conPID.u_s) annotation (Line(
      points={{-79,50},{-62,50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=60),
    __Dymola_experimentSetupOutput);
end JustPipes_Control;
