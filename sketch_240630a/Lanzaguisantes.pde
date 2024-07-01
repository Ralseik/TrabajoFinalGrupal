class Lanzaguisantes extends GameObject {
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
}
