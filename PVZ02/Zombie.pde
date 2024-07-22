class Zombie implements IVisualizable {
  private ImageComponent imgComponent;
  private Transform transform;
  private int resistencia;
  private float velocidad;

  Zombie(ImageComponent imgComponent, Transform transform, int resistencia) {
    this.imgComponent = imgComponent;
    this.transform = transform;
    this.resistencia = resistencia;
    this.velocidad = 25;
  }

  @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(imgComponent.getImagen(), transform.getPosition().x, transform.getPosition().y);
  }
  
  private ImageComponent getImagen() {
      return imgComponent;
  }
  
  public void debilitar(int puntos) {
    //Implementación de la pérdida de vida de los zombies.
    this.resistencia -= puntos;
  }

  public void mover(float deltaTime) {
    //Implementación de la lógica de movimiento de los zombies.
    transform.getPosition().x -= velocidad * deltaTime;
  }
}
