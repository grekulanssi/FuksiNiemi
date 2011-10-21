/*
Apuluokka kuvaamaan piirtopallo
*/

class Piirtopallo {
  
  Maa maa;
  int x, y, sade;
  Pistejoukko pistejoukko;
  PImage kuva;
  
  Piirtopallo(Maa maa, int x, int y, int sade) {
    this.maa = maa;
    this.x = x;
    this.y = y;
    this.sade = sade;
    this.pistejoukko = new Pistejoukko(maa, x+sade, y+sade, sade);
    this.kuva = maa.annaLippu();
    this.kuva.resize(sade*2, sade*2);
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
  
  Maa annaMaa() {
    return maa;
  }
  
  void asetaX(int x) { 
    this.x = x;
    this.pistejoukko = new Pistejoukko(maa, x+sade, y+sade, sade);
  }
  
  void asetaY(int y) {
    this.y = y;
    this.pistejoukko = new Pistejoukko(maa, x+sade, y+sade, sade);
  }
  
  void piirra() {
   fill(0);
   ellipseMode(CENTER);
   image(kuva, x,y);  
  }
  
  Pistejoukko annaPistejoukko() {
    return this.pistejoukko;
  }
  
}

/*
Piirtoluokka piirtää ikkunan jutskat
*/
class Piirto{
  
  //Listat pallojen sateista ja koordinaateista
  List<Piirtopallo> piirtopallot = new ArrayList<Piirtopallo>();
  boolean piirretaanPisteet = true;
  
  PFont fontti = loadFont("BradleyHandITC-20.vlw");
  PImage tausta = loadImage("taustapaperi.png");
  
  final int FACEBOOK = 1;
  final int OLJY = 2;
  final int LIITTYMAT = 3;
  
  final int ELINIKA = 4;
  final int BKT = 5;  
  final int TYOTTOMYYS = 6;
  
  int xMode = BKT;
  int yMode = FACEBOOK;
  
  boolean onkoInforuutu = false;
  
  infoRuutu inforuutu;
    
  //x akseli yAkselinEtaisyys-950
  //y akseli 50-600
  final int xAkselinEtaisyys = 600;
  final int yAkselinEtaisyys = 210;

/* 
 * Kun luodaan Piirto-olio, alustetaan säteet ja xkoordinaatit 
 */
Piirto(List<Maa> maat) {
    
  //Lasketaan maille sijainnit
  for(int i = 0; i <maat.size(); i++) {    
  //Palloilla on tietty minimisade, johon lisataan vakilukuun suhteutettu rengas
   float kerroin = maat.get(i).annaVakiluku()/2000000;
   int sade = (int)(20 + kerroin * 0.5);
   //Luodaan piirtopallo
  this.piirtopallot.add(new Piirtopallo(maat.get(i), 0, 0, sade));
  this.tausta.resize(880, 590);
  
}

  this.sijoittelePallot();
  
}

 
/*
 * Piirto metodi piirtää
 */
void piirto() {
  
  // Piirretään taustakuva
  image(this.tausta, yAkselinEtaisyys-15,25);
  // Piirretään tausta
   stroke(255);
  strokeWeight(1);
  
  for (int a = 2; a < 18; a++){
  // ensin pystyviivat
  line((a*50+yAkselinEtaisyys-100), 600, (a*50+yAkselinEtaisyys-100), 50);
  // sitten vaakaviivat
  line(yAkselinEtaisyys, (a*50), yAkselinEtaisyys+800, (a*50));
  }
  
  //Piirretään maaympyrät
  for(int i = 0; i <piirtopallot.size(); i++) {
   
   Piirtopallo pallo = piirtopallot.get(i);
   pallo.piirra();
   if (piirretaanPisteet == true) {
     pallo.annaPistejoukko().piirra();
   }
   
   
   hiirenTarkistus(pallo.annaX()+pallo.annaSade(), pallo.annaY()+pallo.annaSade(), pallo.annaSade()*2, pallo.annaMaa());

  }
  
  //Piirretään koordinaattiakselit
  stroke(0);
  strokeWeight(2);
  //Piirretaan akseliviivat
  line(yAkselinEtaisyys,xAkselinEtaisyys,1050,xAkselinEtaisyys);
  line(yAkselinEtaisyys,xAkselinEtaisyys,yAkselinEtaisyys,40);
  //Piirretaan nuolet akseleiden paihin
  line(yAkselinEtaisyys,40,yAkselinEtaisyys-10,70);
  line(yAkselinEtaisyys,40,yAkselinEtaisyys+10,70);
  line(1050,xAkselinEtaisyys,1020,xAkselinEtaisyys-10);
  line(1050,xAkselinEtaisyys,1020,xAkselinEtaisyys + 10);
  textFont(fontti,20);
  
  //Piirretään boksit
  
  //y-akselin boksien piirtäminen
  piirraYBoksi("Facebookin\nkäyttäjiä", 300, FACEBOOK);
  piirraYBoksi("Öljynkulutus", 400, OLJY);
  piirraYBoksi("Mobiili-\nliittymiä", 500, LIITTYMAT);
  //image(tahti, this.tahtix2, this.tahtiy2, 30,30);
  
  //x-akselin boksien
  piirraXBoksi("Eliniänodote", yAkselinEtaisyys+50, ELINIKA);
  piirraXBoksi("BKT/asukas", yAkselinEtaisyys+250, BKT);
  piirraXBoksi("Työttömyysaste", yAkselinEtaisyys+450, TYOTTOMYYS);
  //image(tahti,this.tahtix,this.tahtiy,30,30);

  piirraPisteBoksi(145,605);
}

   void hiirenTarkistus(int x, int y, int sade, Maa maa) {
   
   /* Metodi tarkistaa, onko hiiri parametrina annettujen tietojen määräämässä
      ympyrässä. Jos on, niin luodaan inforuutu
   */
   
   int testiX = x - mouseX;
   int testiY = y - mouseY;
   
   if(sqrt(sq(testiX)+sq(testiY)) < sade/2) {
     if(!onkoInforuutu) {
       this.inforuutu = new infoRuutu(maa, 100, 100);
       onkoInforuutu = true;
     } else {
      this.inforuutu.asetaX(this.xMode);
      this.inforuutu.asetaY(this.yMode);
      this.inforuutu.piirra(maa); 
     }
     
   }
   
 }
  


void sijoittelePallot() {

  
 float maxY = 0;
 float maxX = 0;
 
 for (int i=0; i<piirtopallot.size(); i++) {
   Piirtopallo pallero = piirtopallot.get(i);
   Maa themaa = pallero.annaMaa();
   float xLuku = 0;
   switch (xMode) {
      case ELINIKA:
      xLuku = themaa.annaElinIka();
      break;
      case BKT:
      xLuku = themaa.annaBkt();
      break;
      case TYOTTOMYYS:
      xLuku = themaa.annaTyottomyys();
      break;
   }
   if (xLuku > maxX) {
     maxX = xLuku; 
   }
   
   float yLuku = 0;
   switch (yMode) {
      case FACEBOOK:
      yLuku = themaa.annaFacebookProsentti();
      break;
      case OLJY:
      yLuku = themaa.annaOljynKaytto();
      break;
      case LIITTYMAT:
      yLuku = themaa.annaPuhelinLiittymat();
      break;
   }
   if (yLuku > maxY) {
     maxY = yLuku;
   }
 }
 
 
 for (int i=0; i<piirtopallot.size(); i++) {
   Piirtopallo pallero = piirtopallot.get(i);
   Maa themaa = pallero.annaMaa();
   float xLuku = 0;
   switch (xMode) {
      case ELINIKA:
      xLuku = themaa.annaElinIka();
      break;
      case BKT:
      xLuku = themaa.annaBkt();
      break;
      case TYOTTOMYYS:
      xLuku = themaa.annaTyottomyys();
      break;
   }
   
   int uusiX = yAkselinEtaisyys + (int)((xLuku/maxX)*650);
   pallero.asetaX(uusiX);
   
   
   float yLuku = 0;
   switch (yMode) {
      case FACEBOOK:
      yLuku = themaa.annaFacebookProsentti();
      break;
      case OLJY:
      yLuku = themaa.annaOljynKaytto();
      break;
      case LIITTYMAT:
      yLuku = themaa.annaPuhelinLiittymat();
      break;
   }
   
   int uusiY = 500 - (int)((yLuku/maxY)*400);
   pallero.asetaY(uusiY);
   
 }
  
}

void piirraYBoksi(String teksti, int y, int mode) {
  
  int leveys = 150;
  int xx = 28;
  fill(255,239,219);
  if (this.yMode == mode) {
    fill(100,100,100);
  }
  rect(xx,y, leveys, 70);
  fill(0);
  text(teksti,40, y+25);
  
  //tsekataan klikkaus

 if (mousePressed && mouseX >= xx && mouseX <= xx+leveys && mouseY >= y && mouseY < y+70 && this.yMode != mode) {
  
    this.yMode = mode;
    sijoittelePallot();
  }
}

void piirraXBoksi(String teksti, int x, int mode) {
  //x-akselin boksien piirtaminen
  int leveys = 180;
  fill(255,239,219);
  if (this.xMode == mode) {
    fill(100,100,100);
  }
  rect(x,xAkselinEtaisyys+10,leveys,30);
  fill(0);
  text(teksti, x+25, xAkselinEtaisyys+30);
  
  if (mousePressed && mouseX >= x && mouseX <= x+180 && mouseY >= xAkselinEtaisyys+10 && mouseY < xAkselinEtaisyys+10+30 && this.xMode != mode) {
 
    this.xMode = mode;
    sijoittelePallot();
  }
}


void piirraPisteBoksi(int x, int y) {
  //x-akselin boksien piirtaminen
  int leveys = 30;
  int korkeus = 30;
  String teksti = "joo";
  fill(255,239,219);
  if (piirretaanPisteet) {
    fill(100,100,100);
  }
  rect(x,y,leveys,korkeus);
  
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(160, 620, 8, 8); 
  

}

void mouseClicked() {
  int leveys = 30, korkeus = 30;
  int x = 145, y = 605;
  //println(mouseX);
  //Pisteiden piirto
  if (mouseX >= x && mouseX <= x+leveys && mouseY >= y && mouseY < y+korkeus) {
    piirretaanPisteet = !piirretaanPisteet;
  }
}
   
}
