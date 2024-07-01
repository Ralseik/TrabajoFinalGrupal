class Girasol extends GameObject {
  Girasol(float x, float y, PImage img) {
    super(x, y, img);
  }
  
  @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(imagen, posicion.x, posicion.y);
  }
}
