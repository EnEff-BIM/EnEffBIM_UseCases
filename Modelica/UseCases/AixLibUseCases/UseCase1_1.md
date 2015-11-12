Real Connections/Signal connections  
---  
connect(PID.u_s, setTemp.y)  
connect(PID.y, valve.opening)    
connect(temperatureSensor.T, PID.u_m)  
connect(flowTemp.y, boiler.T_set)  
connect(infiltrationRate.y, thermalZone.infiltrationRate)  
connect(weather.WeatherDataVector[1], thermalZone.infiltrationTemperature)  
connect(weather.WeatherDataVector, thermalZone.weather) 

Boolean connections/Signal connections
---
connect(nightSignal.y, pump.IsNight)  


Heat port connections
---
connect(internalLoads.y, thermalZone.internalGains)  
connect(radiator.convPort, thermalZone.internalGainsConv)  
connect(thermalZone.internalGainsConv, temperatureSensor.port)  


AixLib Weather connection
---
connect(weather.SolarRadiation_OrientedSurfaces, thermalZone.solarRad_in)  


AixLib heat transfer radiation port
---
*connect(thermalZone.internalGainsRad, radiator.radPort)*


Annex FluidPorts
---
connect(pump.port_b, boiler.port_a)  
connect(boiler.port_b, flowPipe.port_a)  
connect(valve.port_a, flowPipe.port_b)   
connect(valve.port_b, radiator.port_a)  
connect(radiator.port_b, returnPipe.port_a)  
connect(pump.port_a, returnPipe.port_b)   
connect(expansionVessel.ports[1], pump.port_a)  