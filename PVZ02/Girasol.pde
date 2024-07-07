class Girasol implements IVisualizable {
  private Gif gif;
  private Transform transform;

  Girasol(Gif gif, Transform transform) {
    this.gif = gif;
    this.transform = transform;
    this.gif.play();
  }

  @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(gif, transform.getPosition().x, transform.getPosition().y);
  }
}
