within UseCases.Utilities.IDEAS;
model Wall
  import IDEAS;
  extends IDEAS.Buildings.Data.Interfaces.Construction(
    final nLay=3,
    final locGain=1,
    final mats={Material1(d=0.24),Material2(0.062), Material3(d=0.025)});
end Wall;
