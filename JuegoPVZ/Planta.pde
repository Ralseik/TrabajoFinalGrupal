abstract class Planta {
  protected PVector posicion;
  protected int vida;
  
  Planta(PVector posicion, int vida) {
    this.posicion = posicion;
    this.vida = vida;
  }
  
  abstract void display();
}
