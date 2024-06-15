int estado = 0;
Tablero tablero;

void setup() {
  size(800, 600);
  tablero = new Tablero("tablero.png");
  Girasol girasol = new Girasol(new PVector(100, 200), 100);
  LanzaGuisante lanzaGuisante = new LanzaGuisante(new PVector(100, 200), 150);
  Proyectil proyectil = new Proyectil(new PVector(50, 100));

  girasol.generarSoles();
  lanzaGuisante.disparar(proyectil);
}

void draw() {
  if (estado == 0) {
    // Pantalla de inicio
    background(0);
    textSize(50);
    fill(255);
    textAlign(CENTER);
    text("Plantas vs. Zombies", width / 2, height / 2 - 50);
    textSize(20);
    text("Presiona ENTER para comenzar", width / 2, height / 2 + 20);
  } else if (estado == 1) {
    // Pantalla de juego
    background(50, 100, 200);
    tablero.display();
  }
}

void keyPressed() {
  if (key == ENTER) {
    estado = 1; 
  }
}
