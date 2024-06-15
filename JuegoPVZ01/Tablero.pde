class Tablero {
  PImage imagen; 

  Tablero(String tablero) {
    imagen = loadImage(tablero); 
  }

  void display() {
    image(imagen, 0, 0); 
  }
}
