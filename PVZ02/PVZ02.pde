Zombie zombie;
Lanzaguisantes lanzaguisantes;
Girasol girasol;

void setup() {
  size(1280, 720);
  
 
ImageComponent girasolImagen = new ImageComponent(loadImage("girasol.png"));
Transform girasolPosicion = new Transform(100, 100);
girasol = new Girasol(girasolImagen, girasolPosicion);
  
ImageComponent lanzaguisantesImagen = new ImageComponent(loadImage("lanzaguisantes.png"));
Transform lanzaguisantesPosicion = new Transform(300, 100);
lanzaguisantes = new Lanzaguisantes(lanzaguisantesImagen, lanzaguisantesPosicion);
  
ImageComponent zombieImagen = new ImageComponent(loadImage("zombie.png"));
Transform zombiePosicion = new Transform(700, 100);
zombie = new Zombie(zombieImagen, zombiePosicion);
}

void draw() {
  background(255);
  
zombie.display();
lanzaguisantes.display();
girasol.display();
}
