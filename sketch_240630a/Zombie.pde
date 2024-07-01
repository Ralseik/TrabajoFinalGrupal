class Zombie extends GameObject implements IVisualizable {
  Zombie(float x, float y, PImage img) {
    super(x, y, img);
  }
  
  @Override
  public void display() {
    image(imagen, posicion.x, posicion.y);
  }
}
