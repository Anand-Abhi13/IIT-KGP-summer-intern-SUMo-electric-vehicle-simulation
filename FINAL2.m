clear all
close all
clc
import traci.constants
system(['sumo-gui -c ' './FINAL2.sumocfg&']);
traci.init();
emiss = zeros(1,180);
eleconsump = zeros(1,180);
t = 50400:(50580-1);
speed = zeros(1,180);
speed2 = zeros(1,180);
for i = 1:180
    traci.simulationStep();
    eleconsump(i) = traci.vehicle.getElectricityConsumption('Elec');
    speed(i)= traci.vehicle.getSpeed('veh0');
    speed2(i)= traci.vehicle.getSpeed('Elec');
    emiss(i)= traci.vehicle.getCO2Emission('veh0'); 
end
traci.close()
totemiss = sum(emiss)/1000
totalconsump = sum(eleconsump)/1000
plot(t,speed,t,speed2)