import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;

private Lanzaguisante lanzaguisante;
private GestorZombies gestor;
private Pantalla pantalla;

private ArrayList<Proyectil> proyectiles;
private ArrayList<Girasol> girasoles;

private PImage pantallaMenu;
private PImage pantallaJuego;
private PImage pantallaVictoria;
private PImage pantallaDerrota;

public void setup() {
  size(1280, 720);
  frameRate(60);
  pantallaMenu = loadImage("pantallaMenu.png");
  pantallaJuego = loadImage("pantallaJuego.png");
  pantallaVictoria = loadImage("pantallaVictoria.png");
  pantallaDerrota = loadImage("pantallaDerrota.png");
  
  proyectiles = new ArrayList<Proyectil>();
  girasoles = new ArrayList<Girasol>();

  //Inicialización de la pantalla del juego.
  pantalla = new Pantalla();
  
  //Música del menú.
  minim = new Minim (this);
  player = minim.loadFile("MenuPvz.mp3");
  //Música del juego
  minim = new Minim (this);
  player2 = minim.loadFile("pvzSountrackDay.mp3");
  
  //Inicialización de los componentes de cinco girasoles.
  for (int i = 0; i < 5; i++) {
    ImageComponent girasolImagen = new ImageComponent(loadImage("girasol.png"));
    Transform girasolPosicion = new Transform(415, 100 + i * 120);
    girasoles.add(new Girasol(girasolImagen, girasolPosicion));
  }
  
  //Inicialización de los componentes del lanzaguisantes.
  ImageComponent lanzaguisanteImagen = new ImageComponent(loadImage("lanzaguisantes.png"));
  Transform lanzaguisantePosicion = new Transform(500, height/2-20);
  lanzaguisante = new Lanzaguisante(lanzaguisanteImagen, lanzaguisantePosicion);
  
  //Inicialización del gestor de colisiones entre proyectiles y zombies.
  gestor = new GestorZombies();
  //Inicialización del componente "ImageComponent" de los zombies.
  ImageComponent zombieImagen = new ImageComponent(loadImage("zombie.png"));
  
  //Inicialización del componente "Transform" de los zombies.
  for (int i=0; i<3; i++) {
    Transform zombiePosicion = new Transform(random(width/2+108, width-108), random(66, height-198));
    gestor.agregarZombie(new Zombie(zombieImagen, zombiePosicion, 100));
  }
}

public void draw() {
 pantalla.actualizarEstado();
}

public void keyPressed() {
   pantalla.keyPressed();

}

void keyReleased() {
  pantalla.keyReleased();
}
