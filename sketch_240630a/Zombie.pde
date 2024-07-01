class Zombie extends GameObject {
  Zombie(float x, float y, PImage img) {
    super(x, y, img);
  }
   @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(imagen, posicion.x, posicion.y);
  }
}
