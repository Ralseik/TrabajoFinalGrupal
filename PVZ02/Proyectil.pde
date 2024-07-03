class Proyectil {
  private PVector pos;
  private PImage imagen;
  private float velocidad;
  
  Proyectil(PImage imagen, float x, float y) {
    this.imagen = imagen;
    this.pos = new PVector(x, y);
    this.velocidad = 200;
  }
  
  public void mover(float deltaTime) {
    //Implementación de la lógica de movimiento del proyectil.
    pos.x += velocidad * deltaTime;
  }
  
  public void mostrar() {
    //Implementación de la lógica de visualización del proyectil.
    image(imagen, pos.x, pos.y);
  }
}
