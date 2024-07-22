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
        //En caso de colisión restar resistencia al zombie y eliminar el proyectil.
        if (dist(proyectil.pos.x, proyectil.pos.y, zombie.transform.getPosition().x + zombie.getImagen().getImagen().width / 2, zombie.transform.getPosition().y + zombie.getImagen().getImagen().height / 2) < zombie.getImagen().getImagen().height / 2) {
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
}
