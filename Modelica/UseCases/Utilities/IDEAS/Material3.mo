within UseCases.Utilities.IDEAS;
record Material3
  import IDEAS;
  extends IDEAS.Buildings.Data.Interfaces.Material(
        d=0.025,
        k=0.45,
        c=1050,
        rho=1300);
end Material3;
