class Zombie extends GameObject {
  private int vida;
  
  Zombie(PVector posicion, int vida) {
    super(posicion);
    this.vida = vida;
  }
  
  void mover() {
  }
  
  void comer(Planta planta) {
  }
}
