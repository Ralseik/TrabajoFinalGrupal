class Tablero {
  private int totalSoles;
  private PImage jardin;
  private int estado; //0 = pantalla de inicio, 1 = pantalla de juego
  
  Tablero(int totalSoles, PImage jardin) {
    this.totalSoles = totalSoles;
    this.jardin = jardin;
    this.estado = 0; //Hacer que el juego comience en la pantalla de inicio
  }
  
  void display() {
    if (estado == 0) {
      // Pantalla de inicio
      background(0);
      textSize(50);
      fill(255);
      textAlign(CENTER);
      text("Plantas vs. Zombies", width/2, height/2-50);
      textSize(20);
      text("Presiona ENTER para comenzar", width/2, height/2);
    } else if (estado == 1) {
      // Pantalla de juego
      image(jardin, 0, 0, width, height);
    }
  }
  
  void keyPressed() {
    if (key == ENTER && estado == 0) {
      estado = 1; //Cambia a la pantalla de juego solo si estamos en la pantalla de inicio y se presiona ENTER
    }
  }
}
