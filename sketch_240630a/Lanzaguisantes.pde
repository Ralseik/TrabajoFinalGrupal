class Lanzaguisantes extends GameObject implements IVisualizable {
  Lanzaguisantes(float x, float y, PImage img) {
    super(x, y, img);
  }

  public void disparar() {
     //Implementación de la lógica de disparo del lanzaguisantes.
  }
  @Override
 void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(imagen, posicion.x, posicion.y);
  }
  
  @Override
  void display() {
    image(imagen, posicion.x, posicion.y);
  }
}
