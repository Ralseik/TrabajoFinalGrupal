class Girasol extends GameObject implements IVisualizable {
  Girasol(float x, float y, PImage img) {
    super(x, y, img);
  }
  
  @Override
  public void display() {
<<<<<<< HEAD
=======
    //Implementación del método display de la interfaz IVisualizable.
>>>>>>> main
    image(imagen, posicion.x, posicion.y);
  }
}
