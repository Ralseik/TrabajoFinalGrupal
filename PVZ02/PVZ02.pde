import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
private Lanzaguisante lanzaguisante;
private Girasol girasol;
private GestorZombies gestor;
private Pantalla pantalla;
private ArrayList<Proyectil> proyectiles;
private int estadoPantalla;
private PImage fondo;

public void setup() {
  size(1280, 720);
   frameRate(60);
  fondo = loadImage("jardin.png");
  //2324224242
   proyectiles = new ArrayList<Proyectil>();

  //****Inicialización de la pantalla del juego.
  pantalla = new Pantalla();
 // Inicialización de la pantalla MENU del juego.
  estadoPantalla = MaquinaEstadosPantalla.MENU;
  //sonido
  minim = new Minim (this);
  player = minim.loadFile("MenuPvz.mp3");
  //sonido2
   minim = new Minim (this);
  player2 = minim.loadFile("pvzSountrackDay.mp3");
  
  
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
