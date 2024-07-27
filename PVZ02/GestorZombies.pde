class GestorZombies {
  private ArrayList<Zombie> zombies;

  GestorZombies() {
    zombies = new ArrayList<Zombie>();
  }

  public void agregarZombie(Zombie zombie) {
    zombies.add(zombie);
  }

  //Implementación del método display para dibujar los zombies.
  public void mostrarZombies() {
    for (Zombie zombie : zombies) {
      zombie.mover(time.getDeltaTime());
      zombie.display();
    }
  }

  public void verificarColision(ArrayList<Proyectil> proyectiles) {
    //Recorridos de las listas de proyectiles y zombies.
    for (int i = proyectiles.size() - 1; i >= 0; i--) {
      Proyectil proyectil = proyectiles.get(i);
      for (int j = zombies.size() - 1; j >= 0; j--) {
        Zombie zombie = zombies.get(j);
        //Verificar si existe una colisión entre un zombie y un proyectil.
        if (dist(proyectil.pos.x, 
                 proyectil.pos.y, 
                 zombie.transform.getPosition().x + zombie.getGif().width / 2,
                 zombie.transform.getPosition().y + zombie.getGif().height / 2) 
                 < zombie.getGif().height / 2) {
          //En caso de existir una colision restar resistencia al zombie y eliminar el proyectil.
          zombie.debilitar(10);
          proyectiles.remove(i);
          //Eliminar al zombie cuando su resistencia llegue a 0.
          if (zombie.resistencia <= 0) {
            zombies.remove(j);
          }
          break;
        }
      }
    }
  }
  
  public void verificarEncontronazo(Lanzaguisante lanzaguisante) {
    //Recorrido de la lista de zombies.
    for (Zombie zombie : zombies) {
      //Verificar si existe una colisión entre un zombie y el lanzaguisantes.
      if (dist(lanzaguisante.transform.getPosition().x, 
               lanzaguisante.transform.getPosition().y, 
               zombie.transform.getPosition().x + lanzaguisante.imgComponent.getImagen().width / 2+25, 
               zombie.transform.getPosition().y + lanzaguisante.imgComponent.getImagen().height / 2) 
               < (zombie.getGif().width / 2 + lanzaguisante.imgComponent.getImagen().width / 2)) {
        //En caso de existir una colision mostrar la pantalla de derrota.
        pantalla.perderJuego();
        break;
      }
    }
  }
  
  public void verificarPlanticidio() {
    for (Zombie zombie : zombies) {
      //Verificar si un zombie ha llegado a la linea de los girasoles.
      if (zombie.transform.getPosition().x <= 450) {
        //En caso de haber llegado a la línea mostrar la pantalla de derrota
        pantalla.perderJuego();
        break;
      }
    }
  }
  
  public void verificarZombicidio() {
    if (zombies.isEmpty()) {
      pantalla.ganarJuego();
    }
  }
}
