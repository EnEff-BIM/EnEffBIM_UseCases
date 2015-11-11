within UseCases.APIExample;
model JustPipes
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
  Modelica.Blocks.Sources.Constant const(k=360)
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
  connect(const.y, pump.Nrpm) annotation (Line(
      points={{-79,50},{-10,50},{-10,38},{-10,38},{-10,22},{-10,22}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=60),
    __Dymola_experimentSetupOutput);
end JustPipes;
