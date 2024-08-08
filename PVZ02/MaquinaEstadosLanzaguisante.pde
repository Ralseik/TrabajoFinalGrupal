static class MaquinaEstadosLanzaguisante {

  public static final int moveUp = 1;
  public static final int moveDown = 2;
  public static final int idle = 3;
  private int estadoActual;

  MaquinaEstadosLanzaguisante() {
    //Establecer como "quieto" el estado inicial del lanzaguisantes.
    estadoActual = idle;
  }

  public void cambiarEstado(int nuevoEstado) {
    estadoActual = nuevoEstado;
  }

  public int obtenerEstadoActual() {
    return estadoActual;
  }

  public void actualizar(Transform transform) {
    //Actualizar la dirección en la que se mueve el lanzaguisantes.
    switch (estadoActual) {
      case moveUp:
        transform.getPosition().y -= 5;
        break;
      case moveDown:
        transform.getPosition().y += 5;
        break;
    }
  }
}
