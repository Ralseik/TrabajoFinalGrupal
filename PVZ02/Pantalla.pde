class Pantalla {
  private int estadoPantalla;

  Pantalla() {
    estadoPantalla = MaquinaEstadosPantalla.MENU;
  }

  public void actualizarEstado() {
    //Implementación del método dedicado a actualizar la pantalla del juego. 
    background(255);

    switch (estadoPantalla) {
      //Encapsulación de los métodos que contienen cada pantalla.
      case MaquinaEstadosPantalla.MENU:
      mostrarMenu();
      break;
        
      case MaquinaEstadosPantalla.JUEGO:
      mostrarJuego();
      break;

      case MaquinaEstadosPantalla.DERROTA:
      mostrarDerrota();
      break;

      case MaquinaEstadosPantalla.VICTORIA:
      mostrarVictoria();
      break;
    }
  }
  
  private void mostrarMenu() {
    //Reproducir la música del menú.
    musicaMenu.play();
    
    //Pausar y rebobinar la música de las pantallas de derrota y victoria para su reutilización.
    musicaVictoria.pause();
    musicaVictoria.rewind();
    musicaDerrota.pause();
    musicaDerrota.rewind();
    
    //Dibujar la pantalla del menú.
    image(pantallaMenu, 0, 0, width, height);
  }
  
  private void mostrarJuego() {
    //Reproducir la música del juego.
    musicaJuego.play();
    
    //Dibujar la pantalla del juego.
    image(pantallaJuego, 0, 0, width, height);
 
    //Hacer que el lanzaguisante se dibuje por medio del método display.
    lanzaguisante.display();
 
    //Hacer que los girasoles se dibujen por medio del método display.
    for (Girasol girasol : girasoles) {
      girasol.display();
    }
    
    //Actualizar la posición del lanzaguisante según su estado actual.
    lanzaguisante.maquinaEstadosLanzaguisante.actualizar(lanzaguisante.transform);
    
    //Hacer que el gestor dibuje los zombies en el lienzo.
    gestor.mostrarZombies();
    //Hacer que el gestor habilite la colisión entre zombies y proyectiles.
    gestor.verificarColision(proyectiles);
    //Hacer que el gestor habilite la colision entre zombies y proyectiles.
    gestor.verificarEncontronazo(lanzaguisante);
    //Hacer que el gestor habilite la colision entre zombies y girasoles.
    gestor.verificarPlanticidio();
    //Hacer que el gestor detecte cuando se hayan matado todos los zombies.
    gestor.verificarZombicidio();
    
    //Hacer que los proyectiles se muestren el lienzo.
    for (int i = proyectiles.size()-1; i>=0; i--) {
      Proyectil proyectil = proyectiles.get(i);
      proyectil.mover(time.getDeltaTime()); // Usar deltaTime desde la clase Time
      proyectil.mostrar();
      //Hacer que los proyectiles se eliminen al salir del lienzo.
      if (proyectil.pos.x > width) {
        proyectiles.remove(i);
      }
    }
  }
  
  private void mostrarVictoria() {
    //Pausar momentáneamente la música de la pantalla del juego.
    musicaJuego.pause();
    
    //Reproducir la musica de la pantalla de victoria.
    musicaVictoria.play();
    
    //Dibujar la pantalla de victoria.
    image(pantallaVictoria, 0, 0, width, height);
  } 
  
  private void mostrarDerrota() {
    //Pausar momentáneamente la música de la pantalla del juego.
    musicaJuego.pause();
    
    //Reproducir la musica de la pantalla de derrota.
    musicaDerrota.play();
    
    //Dibujar la pantalla de derrota.
    image(pantallaDerrota, 0, 0, width, height);
  }
  
  public void perderJuego() {
    estadoPantalla = MaquinaEstadosPantalla.DERROTA;
    reiniciarJuego();
  }
  
  public void ganarJuego() {
    estadoPantalla = MaquinaEstadosPantalla.VICTORIA;
    reiniciarJuego();
  }
  
  private void reiniciarJuego() {
    //Eliminar todos los elementos de los arraylists previamente iniciados.
    proyectiles.clear();
    girasoles.clear();
    
    //Inicializar nuevamente todos los objetos y componentes del juego.
    gestor = new GestorZombies();
    
    //Lanzaguisante.
    lanzaguisante = new Lanzaguisante(new ImageComponent(loadImage("lanzaguisantes.png")), new Transform(500, height/2-20));
  
    //Girasoles.
    for (int i = 0; i < 5; i++) {
      Transform girasolPosicion = new Transform(415, 100 + i * 120);
      girasoles.add(new Girasol(gifGirasol, girasolPosicion));
    }
  
    //Zombies.
    for (int i=0; i<5; i++) {
      Transform zombiePosicion = new Transform(random(width/2+108, width-108), random(66, height-198));
      gestor.agregarZombie(new Zombie(gifZombie, zombiePosicion, 100));
    }
  }
  
  public void keyPressed() {
    //Manejo de teclas según el estado de la pantalla actual
    switch (estadoPantalla) {
      case MaquinaEstadosPantalla.MENU:
        // Lógica de manejo de teclas para el menú
        if (keyCode == ENTER) {
          estadoPantalla = MaquinaEstadosPantalla.JUEGO;
          
          //Reproducir nuevamente la música de la pantalla del juego.
          musicaMenu.pause();
          musicaJuego.play();
          musicaJuego.rewind();
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
        if (keyCode == ENTER) {
          estadoPantalla = MaquinaEstadosPantalla.MENU;
          
          //Reproducir nuevamente la música de la pantalla del menú. 
          musicaMenu.play();
          musicaMenu.rewind();
        }
      break;
      
      case MaquinaEstadosPantalla.VICTORIA:
        if (keyCode == ENTER) {
          estadoPantalla = MaquinaEstadosPantalla.MENU;
          
          //Reproducir nuevamente la música de la pantalla del menú. 
          musicaMenu.play();
          musicaMenu.rewind();
        }
      break;
    }
  }

  public void keyReleased() {
    //Hacer que el lanzaguisantes se deje de mover al soltar las teclas.
    if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
      lanzaguisante.maquinaEstadosLanzaguisante.cambiarEstado(MaquinaEstadosLanzaguisante.idle);
    }
  }
}
