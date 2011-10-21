
/*
Pistejoukko

*/
class Pistejoukko {
  List<Piste> pisteet = new ArrayList<Piste>();
  int x,y,sade;
  boolean liikutetaanko; // Artti
  
  Pistejoukko(Maa maa, int x, int y, int sade) {
    this.x=x;
    this.y=y;
    this.sade=sade;
    
    float liikenteennopeus = (float)maa.annaTliikenne()/200000;
    int pisteidenLkm = maa.annaNetinKayttajat()/1000000;
    
    for (int i=0; i<pisteidenLkm; i++) {
      //Arvotaan sijainti ympyrässä
      float etaisyysKeskelta = random(sade-Piste.HALKAISIJA/2);
      float kulma = random(100);
      int xDif = (int) (etaisyysKeskelta * Math.cos(kulma));
      int yDif = (int) (etaisyysKeskelta * Math.sin(kulma));
      //Lisätään piste listaan
      pisteet.add(new Piste(x+xDif,y+yDif, this, liikenteennopeus)); 
    }
    
  }
  
  int annaX() {
    return this.x;
  }
  
  int annaY() {
    return this.y;
  }
  
  int annaSade() {
    return this.sade;
  }
  
  void piirra() {
    for (int a=0; a<pisteet.size(); a++) {
       this.pisteet.get(a).piirra();
    } 
  }
}

/*
Piste
*/
class Piste {
  public static final int HALKAISIJA = 6;
  
  int x,y;
  PVector suunta;
  Pistejoukko joukko;
  float nopeus;
  float edellinenaika;
  
  Piste(int x, int y, Pistejoukko joukko, float nopeus) {
    this.x=x;
    this.y=y; 
    this.suunta = new PVector(random(10), random(10)); this.suunta.normalize();
    this.joukko = joukko;
    this.nopeus = nopeus;
    this.edellinenaika = millis();
  }
  
  void piirra() {
    //Sidotaan liike kelloon
    float aikaero = millis()-this.edellinenaika;    
    int xDif = (int)(this.suunta.x*this.nopeus*aikaero);
    int yDif = (int)(this.suunta.y*this.nopeus*aikaero);
    
    //Piirtotyyli
    fill(255);
    stroke(0);
    strokeWeight(1);
    
    //Ei liikuteta jos ei oo liikuteltavaa
    if (xDif == 0 && yDif == 0) {
      ellipse(this.x, this.y, HALKAISIJA, HALKAISIJA); 
      return;
    }    
    this.edellinenaika = millis();
    
    //Liikutetaan
      this.x += xDif;
      this.y += yDif;
    
    //Palautetaan maailmankartalle tarvittaessa
    if ( dist(this.x, this.y, joukko.annaX(), joukko.annaY()) > joukko.annaSade()-HALKAISIJA/2 ) {
     PVector suuntavektori = new PVector(this.x-joukko.annaX(), this.y-joukko.annaY());
     suuntavektori.normalize();
     suuntavektori.mult(joukko.annaSade()-HALKAISIJA/2);
     this.x = (int)(joukko.annaX()+suuntavektori.x);
     this.y = (int)(joukko.annaY()+suuntavektori.y);
     this.kaanna(random(1,4)); 
    }
    
    
    //Piirretään
    ellipse(this.x, this.y, HALKAISIJA, HALKAISIJA); 
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
