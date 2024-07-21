import ddf.minim.*;

private Minim minim;
private AudioPlayer musicaMenu;
private AudioPlayer musicaJuego;
private AudioPlayer musicaVictoria;
private AudioPlayer musicaDerrota;

private Lanzaguisante lanzaguisante;
private GestorZombies gestor;
private Pantalla pantalla;

private ArrayList<Proyectil> proyectiles;
private ArrayList<Girasol> girasoles;

private PImage pantallaMenu;
private PImage pantallaJuego;
private PImage pantallaVictoria;
private PImage pantallaDerrota;

import gifAnimation.*;
private Gif gifGirasol;

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

  minim = new Minim (this);
  //Música del menú.
  musicaMenu = minim.loadFile("musicaMenu.mp3");
  //Música del juego.
  musicaJuego = minim.loadFile("musicaJuego.mp3");
  //Música de victoria.
  musicaVictoria = minim.loadFile("musicaVictoria.mp3");
  //Música de derrota.
  musicaDerrota = minim.loadFile("musicaDerrota.mp3");
  
  //Inicialización de la animación para el girasol.
  gifGirasol = new Gif(this, "girasol.gif");
  
  //Inicialización de los componentes de cinco girasoles.
  for (int i = 0; i < 5; i++) {
    Transform girasolPosicion = new Transform(415, 100 + i * 120);
    girasoles.add(new Girasol(gifGirasol, girasolPosicion));
  }
  
  // Inicialización de los componentes del lanzaguisantes.
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
