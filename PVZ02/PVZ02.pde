private Lanzaguisante lanzaguisante;
private Girasol girasol;
private GestorZombies gestor;
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
  
  gestor = new GestorZombies();
  //Inicialización del componente "ImageComponent" de los zombies.
  ImageComponent zombieImagen = new ImageComponent(loadImage("zombie.png"));
  
  //Inicialización del componente "Transform" de los zombies.
  for (int i=0; i<3; i++) {
    Transform zombiePosicion = new Transform(random(width/2, width), random(0, height));
    gestor.agregarZombie(new Zombie(zombieImagen, zombiePosicion, 100));
  }
  
  proyectiles = new ArrayList<Proyectil>();
  frameRate(60);
}

public void draw() {
  background(255);
  float deltaTime = 1.0 / frameRate;
  
  //Hacer que los objetos se dibujen en el lienzo por medio del método display.
  lanzaguisante.display();
  girasol.display();
  
  // Actualizar la posición del lanzaguisante según su estado actual.
  lanzaguisante.maquinaEstadosLanzaguisante.actualizar(lanzaguisante.transform);
  
  //Hacer que los proyectiles se muestren el lienzo.
  for (int i = proyectiles.size()-1; i>=0; i--) {
    Proyectil proyectil = proyectiles.get(i);
    proyectil.mover(deltaTime);
    proyectil.mostrar();
    //Hacer que los proyectiles se eliminen al salir del lienzo.
    if (proyectil.pos.x > width) {
      proyectiles.remove(i);
    }
  }
  
  //Hacer que el gestor dibuje los zombies en el lienzo. 
  gestor.mostrarZombies();
  //Hacer que el gestor habilite la colisión entre zombies y proyectiles.
  gestor.verificarColision(proyectiles);
}

public void keyPressed() {
  //Disparar proyectiles al presionar la tecla ESPACIO.
  if (key == ' ') {
    proyectiles.add(lanzaguisante.disparar());
  }
  //Mover al lanzaguisantes al apretar las teclas "w/W" y "s/S".
  if (key == 'w' || key == 'W') {
    lanzaguisante.maquinaEstadosLanzaguisante.cambiarEstado(MaquinaEstadosLanzaguisante.moveUp);
  } else if (key == 's' || key == 'S') {
    lanzaguisante.maquinaEstadosLanzaguisante.cambiarEstado(MaquinaEstadosLanzaguisante.moveDown);
  }
}

void keyReleased() {
  //Hacer que el lanzaguisantes se deje de mover al soltar las teclas.
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    lanzaguisante.maquinaEstadosLanzaguisante.cambiarEstado(MaquinaEstadosLanzaguisante.idle);
  }
}
