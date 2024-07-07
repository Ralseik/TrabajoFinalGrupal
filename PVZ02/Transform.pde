class Transform {
  private PVector posicion;

  Transform(float x, float y) {
    this.posicion = new PVector(x, y);
  }

  public PVector getPosition() {
    return this.posicion;
  }
}
