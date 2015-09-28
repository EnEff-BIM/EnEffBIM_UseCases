within UseCases.APIExample;
model ThreeWayValve
  AixLib.Fluid.Actuators.Valves.ThreeWayLinear val
    annotation (Placement(transformation(extent={{-10,8},{10,28}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe
    annotation (Placement(transformation(extent={{-48,8},{-28,28}})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-20})));
  AixLib.Fluid.FixedResistances.StaticPipe staticPipe2
    annotation (Placement(transformation(extent={{28,8},{48,28}})));
equation
  connect(val.port_1, staticPipe.port_b) annotation (Line(
      points={{-10,18},{-28,18}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(val.port_3, staticPipe1.port_b) annotation (Line(
      points={{0,8},{0,-10},{4.44089e-016,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(val.port_2, staticPipe2.port_a) annotation (Line(
      points={{10,18},{28,18}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end ThreeWayValve;
