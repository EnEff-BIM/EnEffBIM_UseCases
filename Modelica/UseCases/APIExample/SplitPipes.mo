within UseCases.APIExample;
model SplitPipes
  AixLib.Fluid.HeatExchangers.Radiators.Radiator radiator
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe
    annotation (Placement(transformation(extent={{-44,4},{-24,24}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe1
    annotation (Placement(transformation(extent={{26,4},{46,24}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe2
    annotation (Placement(transformation(extent={{-8,4},{12,24}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature
    annotation (Placement(transformation(extent={{-36,64},{-16,84}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1
    annotation (Placement(transformation(extent={{38,64},{18,84}})));
equation
  connect(radiator.port_a, staticPipe.port_b) annotation (Line(
      points={{-10,40},{-16,40},{-16,14},{-24,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(radiator.port_b, staticPipe1.port_a) annotation (Line(
      points={{10,40},{16,40},{16,14},{26,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(staticPipe.port_b, staticPipe2.port_a) annotation (Line(
      points={{-24,14},{-8,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(staticPipe1.port_a, staticPipe2.port_b) annotation (Line(
      points={{26,14},{12,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(radiator.convPort, fixedTemperature.port) annotation (Line(
      points={{-4.2,47.6},{-5,47.6},{-5,74},{-16,74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(radiator.radPort, fixedTemperature1.port)
    annotation (Line(points={{4,47.8},{4,74},{18,74}}, smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SplitPipes;
