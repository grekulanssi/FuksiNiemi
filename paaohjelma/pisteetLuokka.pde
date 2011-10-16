/* Luokka joka kuvaa Pistejoukkoa */
class Pisteet {

//Lista pisteistä
List<Piste> pistesuma = new ArrayList<Piste>();
int pisteenhalkaisija = 3;
int x,y;
float sade;
  
Pisteet(int x, int y, float sade, int montako, Maa maa) {  
  this.x = x;
  this.y = y;
  this.sade = sade;
  
  //Arvotaan tarvittava määrä pisteitä pistejoukkoon
  for (int i=0; i<montako; i++) {
    float etaisyysKeskelta = random(sade);
    float kulma = random(100);
    int xDif = (int) (etaisyysKeskelta * Math.cos(kulma));
    int yDif = (int) (etaisyysKeskelta * Math.sin(kulma));
    this.pistesuma.add(new Piste(x+xDif, y+yDif, maa.annaTliikenne())); 
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
       piste.kaanna(1.8);
     }
   
  }

}

}

class Piste {
  
  int x, y;
  int erotus = 1;
  PVector suunta;
  float kerroin;
  float m;
  
Piste(int x, int y, int kerroin) {
  this.x = x;
  this.y = y;
  this.kerroin = kerroin;
  this.suunta = new PVector(random(10), random(10));
  this.suunta.normalize();
  this.m = millis();
}

int annaX() {
  return this.x;
}

int annaY() {
  return this.y;
}

void liikuta() {
  float aikaero = millis() - this.m;
  float korjain = 80000;

  int xDif = (int)(aikaero*this.kerroin*this.suunta.x/korjain);
  int yDif = (int)(aikaero*this.kerroin*this.suunta.y/korjain);
  
  if (xDif == 0 && yDif == 0)
    return;
    
  this.x = this.x+xDif;
  this.y = this.y+yDif;
  this.m = millis();
}

// Rotate a vector in 2D
void kaanna(float theta) {
  // What's the magnitude?
  float m = this.suunta.mag();
  // What's the angle?
  float a = this.suunta.heading2D();
 
  // Change the angle
  a += theta;
 
  // Polar to cartesian for the new xy components
  this.suunta.x = m * cos(a);
  this.suunta.y = m * sin(a);
}

  
}
