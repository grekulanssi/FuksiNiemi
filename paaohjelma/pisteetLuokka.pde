/* Luokka joka kuvaa Pistejoukkoa */
class Pisteet {

//Lista pisteistä
List<Piste> pistesuma = new ArrayList<Piste>();
int pisteenhalkaisija = 2;
  
Pisteet(int x, int y, float sade, int montako) {  
  //Arvotaan tarvittava määrä pisteitä pistejoukkoon
  for (int i=0; i<montako; i++) {
    float etaisyysKeskelta = random(sade);
    float kulma = random(100);
    int xDif = (int) (etaisyysKeskelta * Math.cos(kulma));
    int yDif = (int) (etaisyysKeskelta * Math.sin(kulma));
    this.pistesuma.add(new Piste(x+xDif, y+yDif)); 
    println( (x+xDif)  + " " + (y+yDif) );
  }
}

//Piirretään pisteet
void piirra() {
   fill(0);
   ellipseMode(CENTER);
   strokeWeight(0);
   fill(255);
   
   for (int i=0; i<this.pistesuma.size(); i++) {
     ellipse(pistesuma.get(i).annaX(),pistesuma.get(i).annaY(),pisteenhalkaisija,pisteenhalkaisija);  
   }
   
}

}


class Piste {
  
  int x, y;
  
Piste(int x, int y) {
  this.x = x;
  this.y = y;
}

int annaX() {
  return this.x;
}

int annaY() {
  return this.y;
}
  
}
