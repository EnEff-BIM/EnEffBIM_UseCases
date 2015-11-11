within UseCases.APIExample;
model Storage
  AixLib.Fluid.Storage.Storage storage
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,34})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe1
    annotation (Placement(transformation(extent={{18,-18},{38,2}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe2
    annotation (Placement(transformation(extent={{40,-2},{20,18}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe3 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,-34})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
equation
  connect(storage.port_b_consumer, staticPipe.port_a) annotation (Line(
      points={{-2,10},{-2,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_b_heatGenerator, staticPipe1.port_a) annotation (Line(
      points={{6.4,-8},{18,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_a_heatGenerator, staticPipe2.port_b) annotation (Line(
      points={{6.4,8.8},{14,8.8},{14,8},{20,8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_a_consumer, staticPipe3.port_b) annotation (Line(
      points={{-2,-10},{-2,-24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.heatPort, fixedTemperature.port) annotation (Line(
      points={{-10,0},{-26,0}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end Storage;
