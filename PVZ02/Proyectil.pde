class Proyectil {
  private PVector pos;
  private PImage imagen;

  Proyectil(float x, float y, PImage img) {
    this.pos = new PVector(x, y);
    this.imagen = img;
  }
}
