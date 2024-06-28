import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;


Girasol girasol;
LanzaGuisante lanzaGuisante;
Proyectil proyectil;
Zombie zombie;
VerificadorColisiones verificadorColisiones;
Tablero tablero;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  player = minim.loadFile("pvzSountrackDay.mp3");
  player2 = minim.loadFile("MenuPvz.mp3");
  
  //Instanciación de los objetos que utiliza el juego
  girasol = new Girasol(new PVector(0, 0), 100);
  lanzaGuisante = new LanzaGuisante(new PVector(0, 0), 100);
  zombie = new Zombie(new PVector(0, 0), 100);
  proyectil = new Proyectil(new PVector(0, 0));
  verificadorColisiones = new VerificadorColisiones();
  tablero = new Tablero(500, loadImage("jardin.png"));
}

void draw() {
  tablero.display();
  //reproduce un audio 
     player2.play();

  //Mostrar las diferentes plantas en el tablero
  girasol.display();
  lanzaGuisante.display();
  
  //Hacer que los proyectiles y los zombies se muevan
  proyectil.mover();
  zombie.mover();
  
  if (verificadorColisiones.validarColision(proyectil, zombie)) {
    //Restarle la vida al zombie en caso de haber una colisión con un proyectil
    proyectil.restarVida(zombie);
  }
  
  if (verificadorColisiones.validarColision(zombie, girasol)) {
    //Comer al girasol en caso de haber una colisión con un zombie
    zombie.comer(girasol);
  }
}

void keyPressed() {
         player2.close();
  tablero.keyPressed();
    player.play();
       
}
