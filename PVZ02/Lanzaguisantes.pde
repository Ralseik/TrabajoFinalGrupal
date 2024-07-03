class Lanzaguisante implements IVisualizable {
  private ImageComponent imgComponent;
  private Transform transform;

  Lanzaguisante(ImageComponent imgComponent, Transform transform) {
    this.imgComponent = imgComponent;
    this.transform = transform;
  }

  @Override
  public void display() {
    //Implementación del método display de la interfaz IVisualizable.
    image(imgComponent.getImagen(), transform.getPosition().x, transform.getPosition().y);
  }
  
  public Proyectil disparar() {
    //Implementación de la lógica de disparo del lanzaguisantes.
    return new Proyectil(loadImage("proyectil.png"), transform.getPosition().x + imgComponent.getImagen().width/2+28, transform.getPosition().y+7);
  }
}
