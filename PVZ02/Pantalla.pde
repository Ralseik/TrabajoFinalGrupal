class Pantalla {
  private int estadoPantalla;

  Pantalla() {
    estadoPantalla = MaquinaEstadosPantalla.MENU;
  }

  public void actualizarEstado() {
    //Implementación del método dedicado a actualizar la pantalla del juego. 
    background(255);
    float deltaTime = 1.0 / frameRate;

    switch (estadoPantalla) {
      //Encapsulación de los métodos que contienen cada pantalla.
      case MaquinaEstadosPantalla.MENU:
      mostrarMenu();
      break;
        
      case MaquinaEstadosPantalla.JUEGO:
      mostrarJuego(deltaTime);
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
    player.play();
    //Dibujar la pantalla del menú.
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("Menú Principal", width / 2, height / 2);
    textSize(20);
    text("Presiona Enter para comenzar", width / 2, height / 2 + 50);
  }
  
  private void mostrarJuego(float deltaTime) {
    //Reproducir la música del menú.
    player2.play();
      player.close();    
    //Dibujar la pantalla del juego.
    image(fondo, 0, 0, width, height);
    
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
  }
  
  private void mostrarVictoria() {
    //Dibujar la pantalla de victoria.
    fill(0, 255, 0);
    textAlign(CENTER);
    textSize(30);
    text("¡Has ganado!", width / 2, height / 2);
    textSize(20);
    text("Presiona Enter para volver al menú", width / 2, height / 2 + 50);
  } 
  
  private void mostrarDerrota() {
    //Dibujar la pantalla de derrota.
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(30);
    text("¡Has perdido!", width / 2, height / 2);
    textSize(20);
    text("Presiona Enter para volver al menú", width / 2, height / 2 + 50);
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
      
      if (key == 'v' || key == 'V') {
        estadoPantalla = MaquinaEstadosPantalla.VICTORIA; //Mostrar la pantalla de VICTORIA al apretar la tecla "V".
      } else if (key == 'x' || key == 'X') {
        estadoPantalla = MaquinaEstadosPantalla.DERROTA; //Mostrar la pantalla de DERROTA al apretar la tecla "X".
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

  public void keyReleased() {
    //Hacer que el lanzaguisantes se deje de mover al soltar las teclas.
    if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
      lanzaguisante.maquinaEstadosLanzaguisante.cambiarEstado(MaquinaEstadosLanzaguisante.idle);
    }
  }
}
