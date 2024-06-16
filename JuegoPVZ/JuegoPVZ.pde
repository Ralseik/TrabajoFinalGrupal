int estado = 0; // 0 = pantalla de inicio, 1 = pantalla de juego
PImage tablero;

Girasol girasol;
LanzaGuisante lanzaGuisante;
Proyectil proyectil;
Zombie zombie;

void setup() {
   size(800, 600);
  tablero = loadImage("tablero.png");  

  girasol = new Girasol(new PVector(0, 0), 100);
  lanzaGuisante = new LanzaGuisante(new PVector(0, 0), 100);
  zombie = new Zombie(new PVector(0, 0), 100);
  proyectil = new Proyectil(new PVector(0, 0));
}

void draw() {
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
    image(tablero, 0, 0, width, height);
  }
  //background(255);
  
  girasol.display();
  lanzaGuisante.display();
  
  proyectil.mover();
  zombie.mover();
}
void keyPressed() {
  if (key == ENTER) {
    estado = 1; // Cambia a la pantalla de juego
  }
}
