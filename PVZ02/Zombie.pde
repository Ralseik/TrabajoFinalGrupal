class Zombie implements IVisualizable {
  private ImageComponent imgComponent;
  private Transform transform;

  Zombie(ImageComponent imgComponent, Transform transform) {
    this.imgComponent = imgComponent;
    this.transform = transform;
  }

  @Override
  public void display() {
    image(imgComponent.getImagen(), transform.getPosition().x, transform.getPosition().y);
  }
}
