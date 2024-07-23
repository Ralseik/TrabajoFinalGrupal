class Time {
  private float deltaTime;

  public void actualizarTiempo(float frameRate) {
    deltaTime = 1.0 / frameRate;
  }

  public float getDeltaTime() {
    return deltaTime;
  }
}
