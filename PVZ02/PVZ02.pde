private Zombie zombie;
private Lanzaguisante lanzaguisante;
private Girasol girasol;
private ArrayList<Proyectil> proyectiles;

public void setup() {
  size(1280, 720);
  
  //Inicialización de los componentes del girasol.
  ImageComponent girasolImagen = new ImageComponent(loadImage("girasol.png"));
  Transform girasolPosicion = new Transform(100, 100);
  girasol = new Girasol(girasolImagen, girasolPosicion);
  
  //Inicialización de los componentes del lanzaguisantes.
  ImageComponent lanzaguisantesImagen = new ImageComponent(loadImage("lanzaguisantes.png"));
  Transform lanzaguisantesPosicion = new Transform(300, 100);
  lanzaguisante = new Lanzaguisante(lanzaguisantesImagen, lanzaguisantesPosicion);
  
  //Inicialización de los componentes del zombie.
  ImageComponent zombieImagen = new ImageComponent(loadImage("zombie.png"));
  Transform zombiePosicion = new Transform(700, 100);
  zombie = new Zombie(zombieImagen, zombiePosicion);
  
  proyectiles = new ArrayList<Proyectil>();
  frameRate(60);
}

public void draw() {
  background(255);
  float deltaTime = 1.0 / frameRate;
  
  //Hacer que los objetos se dibujen en el lienzo por medio del método display.
  zombie.display();
  lanzaguisante.display();
  girasol.display();
  
  //Hacer que los proyectiles se muestren el lienzo y se eliminen al salir de él.
  for (int i = proyectiles.size()-1; i>=0; i--) {
    Proyectil proyectil = proyectiles.get(i);
    proyectil.mover(deltaTime);
    proyectil.mostrar();
    
    if (proyectil.pos.x > width) {
      proyectiles.remove(i);
    }
  }
}

public void keyPressed() {
  //Disparar proyectiles al presionar la tecla ESPACIO.
  if (key == ' ') {
    proyectiles.add(lanzaguisante.disparar());
  }
}
