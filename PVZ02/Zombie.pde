class Zombie implements IVisualizable {
  private Gif gif;
  private Transform transform;
  private int resistencia;
  private float velocidad;

  Zombie(Gif gif, Transform transform, int resistencia) {
    this.gif = gif;
    this.transform = transform;
    this.resistencia = resistencia;
    this.velocidad = 25;
    this.gif.play();
  }

  @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(gif, transform.getPosition().x, transform.getPosition().y);
  }
  
  private Gif getGif() {
      return gif;
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
