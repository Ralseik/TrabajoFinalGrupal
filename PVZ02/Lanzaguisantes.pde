class Lanzaguisantes implements IVisualizable {
  private ImageComponent imgComponent;
  private Transform transform;

  Lanzaguisantes(ImageComponent imgComponent, Transform transform) {
    this.imgComponent = imgComponent;
    this.transform = transform;
  }

  void disparar() {
  }

  @Override
  public void display() {
    image(imgComponent.getImagen(), transform.getPosition().x, transform.getPosition().y);
  }
}
