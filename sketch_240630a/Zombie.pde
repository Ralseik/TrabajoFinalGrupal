class Zombie extends GameObject implements IVisualizable {
  Zombie(float x, float y, PImage img) {
    super(x, y, img);
  }
<<<<<<< HEAD
  
  @Override
  public void display() {
=======
   @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
>>>>>>> main
    image(imagen, posicion.x, posicion.y);
  }
}
