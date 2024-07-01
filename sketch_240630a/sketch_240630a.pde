Zombie zombie;
Lanzaguisantes lanzaguisantes;
Girasol girasol;

public void setup() {
  size(1280, 720);
  
  girasol = new Girasol(100, 100, loadImage("girasol.png"));
  lanzaguisantes = new Lanzaguisantes(300, 100, loadImage("lanzaguisantes.png"));
  zombie = new Zombie(700, 100, loadImage("zombie.png"));
}

public void draw() {
  background(255);
  
  zombie.display();
  lanzaguisantes.display();
  girasol.display();
}
