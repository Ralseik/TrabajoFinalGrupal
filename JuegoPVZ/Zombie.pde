class Zombie extends GameObject {
  private int vida;
  
  Zombie(PVector posicion, int vida) {
    super(posicion);
    this.vida = vida;
  }
  
  void mover() {
    //Implementación para hacer que el zombie se mueva
  }
  
  void comer(Planta planta) {
    //Implementación para hacer que el zombie se coma a una planta
  }
}
