Zombie zombie;
Lanzaguisantes lanzaguisantes;
Girasol girasol;
<<<<<<< HEAD

public void setup() {
  size(1280, 720);
  
=======
public void setup() {
  size(1280, 720);
    //Inicialización de los objetos junto a su posición e imagen.
>>>>>>> main
  girasol = new Girasol(100, 100, loadImage("girasol.png"));
  lanzaguisantes = new Lanzaguisantes(300, 100, loadImage("lanzaguisantes.png"));
  zombie = new Zombie(700, 100, loadImage("zombie.png"));
}

public void draw() {
  background(255);
  
<<<<<<< HEAD
  zombie.display();
  lanzaguisantes.display();
  girasol.display();
=======
 /* //Hacer que los objetos se dibujen en el lienzo por medio del método display.
  zombie.display();
  lanzaguisantes.display();
  girasol.display();
*/
}


public void keyPressed() {
>>>>>>> main
}
