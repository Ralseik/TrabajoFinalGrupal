abstract class Planta extends GameObject {
  protected int vida;

  public Planta(PVector posicion, int vida) {
    super(posicion);
    this.vida = vida;
  }
}
