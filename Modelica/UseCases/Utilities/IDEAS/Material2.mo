within UseCases.Utilities.IDEAS;
record Material2
  import IDEAS;
  extends IDEAS.Buildings.Data.Interfaces.Material(
        k=2.035,
        c=920,
        rho=2100,
        epsLw=0.88,
        epsSw=0.55);
end Material2;
