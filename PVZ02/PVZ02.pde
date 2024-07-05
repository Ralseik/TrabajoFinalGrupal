import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
private Lanzaguisante lanzaguisante;
private Girasol girasol;
private GestorZombies gestor;
private ArrayList<Proyectil> proyectiles;
private int estadoPantalla;
private PImage fondo;

public void setup() {
  size(1280, 720);
  fondo = loadImage("jardin.png");
  
  //Inicialización de la pantalla MENU del juego.
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
  
  proyectiles = new ArrayList<Proyectil>();
  frameRate(60);
}

public void draw() {
  background(255);

  float deltaTime = 1.0 / frameRate;
  
  //Actualizar y mostrar cada pantalla según su estado.
  switch (estadoPantalla) {
    case MaquinaEstadosPantalla.MENU:
    //Dibujar la pantalla del menú.
      player.play();
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("Menú Principal", width/2, height/2);
    textSize(20);
    text("Presiona Enter para comenzar", width/2, height/2 + 50);
    break;
      
    case MaquinaEstadosPantalla.JUEGO:
    //Dibujar la pantalla del juego.
    image(fondo, 0, 0, width, height);
      player2.play();
        player.close();
      // Lógica y dibujo del juego
      //Hacer que los objetos se dibujen en el lienzo por medio del método display.
      lanzaguisante.display();
      girasol.display();
      
      // Actualizar la posición del lanzaguisante según su estado actual.
      lanzaguisante.maquinaEstadosLanzaguisante.actualizar(lanzaguisante.transform);
      
      //Hacer que el gestor dibuje los zombies en el lienzo. 
      gestor.mostrarZombies();
      //Hacer que el gestor habilite la colisión entre zombies y proyectiles.
      gestor.verificarColision(proyectiles);
      
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
    break; 
    
    case MaquinaEstadosPantalla.DERROTA:
      //Dibujar la pantalla de derrota.
      fill(255, 0, 0);
      textAlign(CENTER);
      textSize(30);
      text("¡Has perdido!", width/2, height/2);
      textSize(20);
      text("Presiona Enter para volver al menú", width/2, height/2 + 50);
      break;
      
    case MaquinaEstadosPantalla.VICTORIA:
      //Dibujar la pantalla de victoria.
      fill(0, 255, 0);
      textAlign(CENTER);
      textSize(30);
      text("¡Has ganado!", width/2, height/2);
      textSize(20);
      text("Presiona Enter para volver al menú", width/2, height/2 + 50);
      break;
  }
}

public void keyPressed() {
  //Manejo de teclas según el estado de la pantalla actual
  switch (estadoPantalla) {
    case MaquinaEstadosPantalla.MENU:
      // Lógica de manejo de teclas para el menú
      if (keyCode == ENTER) {
        estadoPantalla = MaquinaEstadosPantalla.JUEGO;
      }
      break;
      
    case MaquinaEstadosPantalla.JUEGO:
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
    break;
      
    case MaquinaEstadosPantalla.DERROTA:
    case MaquinaEstadosPantalla.VICTORIA:
      if (keyCode == ENTER) {
        estadoPantalla = MaquinaEstadosPantalla.MENU;
      }
      break;
  }
}

void keyReleased() {
  //Hacer que el lanzaguisantes se deje de mover al soltar las teclas.
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    lanzaguisante.maquinaEstadosLanzaguisante.cambiarEstado(MaquinaEstadosLanzaguisante.idle);
  }
}
