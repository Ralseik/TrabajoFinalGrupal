abstract class GameObject {
  protected PVector posicion;

  public GameObject(PVector posicion) {
    this.posicion = posicion;
  }

  abstract void mover();
}
