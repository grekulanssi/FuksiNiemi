/* Luokka joka kuvaa Pistejoukkoa */
class Pisteet {

//Lista pisteistä
List<Piste> pistesuma = new ArrayList<Piste>();
int pisteenhalkaisija = 3;
int x,y;
float sade;
  
Pisteet(int x, int y, float sade, int montako) {  
  this.x = x;
  this.y = y;
  this.sade = sade;
  
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
     Piste piste = pistesuma.get(i);
     ellipse(piste.annaX(),piste.annaY(),pisteenhalkaisija,pisteenhalkaisija);  
     piste.liikuta();
     if ( Math.sqrt( Math.pow(piste.annaX() - this.x, 2) + Math.pow(piste.annaY() - this.y, 2) ) >= this.sade ) {
       piste.kaanna();
     }
   
  }

}

}

class Piste {
  
  int x, y;
  int erotus = 1;
  
  
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

void liikuta() {
  this.x = this.x + this.erotus;
  this.y = this.y + this.erotus;
}

void kaanna() {
  this.erotus = this.erotus * -1; 
}

  
}
