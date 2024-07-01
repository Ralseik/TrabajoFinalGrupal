class Girasol extends GameObject implements IVisualizable {
  Girasol(float x, float y, PImage img) {
    super(x, y, img);
  }
  
  @Override
  public void display() {
    image(imagen, posicion.x, posicion.y);
  }
}
