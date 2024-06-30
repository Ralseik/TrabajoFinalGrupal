abstract class GameObject {
  protected PVector posicion;
  protected PImage imagen;
  
  GameObject(float x, float y, PImage img) {
    this.posicion = new PVector(x, y);
    this.imagen = img;
  }
}
