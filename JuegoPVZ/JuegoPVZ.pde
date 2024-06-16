Girasol girasol;
LanzaGuisante lanzaGuisante;
Proyectil proyectil;
Zombie zombie;

void setup() {
  girasol = new Girasol(new PVector(0, 0), 100);
  lanzaGuisante = new LanzaGuisante(new PVector(0, 0), 100);
  zombie = new Zombie(new PVector(0, 0), 100);
  proyectil = new Proyectil(new PVector(0, 0));
}

void draw() {
  background(255);
  
  girasol.display();
  lanzaGuisante.display();
  
  proyectil.mover();
  zombie.mover();
}
