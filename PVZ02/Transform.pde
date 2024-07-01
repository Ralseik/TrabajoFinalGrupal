class Transform {
  private PVector posicion;

  Transform(float x, float y) {
    this.posicion = new PVector(x, y);
  }

  Transform(PVector posicion) {
    this.posicion = posicion;
  }

  public PVector getPosition() {
    return this.posicion;
  }
}
