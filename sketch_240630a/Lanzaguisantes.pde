class Lanzaguisantes extends GameObject implements IVisualizable {
  Lanzaguisantes(float x, float y, PImage img) {
    super(x, y, img);
  }

  public void disparar() {
  }
  
  @Override
  void display() {
    image(imagen, posicion.x, posicion.y);
  }
}
