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
  /*
  List<Integer> sateet = new ArrayList<Integer>();
  List<Integer> xkoordinaatit = new ArrayList<Integer>();
  List<Integer> ykoordinaatit = new ArrayList<Integer>();
  List<Maa> maat;
  List<Pistejoukko> pistejoukot = new ArrayList<Pistejoukko>();
  */
  
  PFont fontti = loadFont("BradleyHandITC-20.vlw");
  //PImage tahti = loadImage("star.png");
  PImage tausta = loadImage("taustapaperi.png");
  
  final int FACEBOOK = 1;
  final int OLJY = 2;
  final int LIITTYMAT = 3;
  
  final int ELINIKA = 4;
  final int BKT = 5;  
  final int TYOTTOMYYS = 6;
  
  int xMode = ELINIKA;
  int yMode = FACEBOOK;
  
  boolean onkoInforuutu = false; // kertoo onko inforuutu luotuna
    
  //x akseli 150-950
  //y akseli 50-600
  final int xAkselinEtaisyys = 600;
  final int yAkselinEtaisyys = 150;

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
  
}

  this.sijoittelePallot();
  
}

 
/*
 * Piirto metodi piirtää
 */
void piirto() {
  
  // Piirretään taustakuva
  //image(this.tausta, 0,0);
  // Piirretään tausta
   stroke(255);
  strokeWeight(1);
  
  for (int a = 2; a < 18; a++){
  // ensin pystyviivat
  line((a*50+50), 600, (a*50+50), 50);
  // sitten vaakaviivat
  line(150, (a*50), 950, (a*50));
  }
  
  //Piirretään maaympyrät
  for(int i = 0; i <piirtopallot.size(); i++) {
   
   Piirtopallo pallo = piirtopallot.get(i);
   pallo.piirra();
   if (piirretaanPisteet == true) {
     pallo.annaPistejoukko().piirra();
   }
   
   
   //ellipse(xkoordinaatit.get(i),ykoordinaatit.get(i), 2*sade, 2*sade); //nyt pallot rivissa
   
   // Piirretään maiden liput
   //image(((Maa)maat.get(i)).annaLippu(), xkoordinaatit.get(i)-sade, ykoordinaatit.get(i)-sade, 2*sade, 2*sade);

   // Tarkistetaan onko hiiri jonkun maan päällä 
   //hiirenTarkistus(xkoordinaatit.get(i), ykoordinaatit.get(i), sade*2, maat.get(i));
   
   //tarkistaXAkselimode();
   
   //if (!this.onkoInforuutu) {
   
   //}

  }
  
  //Piirretään koordinaattiakselit
  stroke(0);
  strokeWeight(2);
  //Piirretaan akseliviivat
  line(150,xAkselinEtaisyys,1000,xAkselinEtaisyys);
  line(150,xAkselinEtaisyys,150,40);
  //Piirretaan nuolet akseleiden paihin
  line(150,40,140,70);
  line(150,40,160,70);
  line(1000,xAkselinEtaisyys,970,xAkselinEtaisyys-10);
  line(1000,xAkselinEtaisyys,970,xAkselinEtaisyys + 10);
  textFont(fontti,20);
  
  //Piirretään boksit
  
  //y-akselin boksien piirtäminen
  piirraYBoksi("Facebook\n käyt. os.", 100, FACEBOOK);
  piirraYBoksi("Öljynk./\npäivä", 200, OLJY);
  piirraYBoksi("Liittymät/\nasukas", 300, LIITTYMAT);
  //image(tahti, this.tahtix2, this.tahtiy2, 30,30);
  
  //x-akselin boksien
  piirraXBoksi("Eliniänodote", 200, ELINIKA);
  piirraXBoksi("BKT/asukas", 400, BKT);
  piirraXBoksi("Työttömyysaste", 600, TYOTTOMYYS);
  //image(tahti,this.tahtix,this.tahtiy,30,30);

  piirraPisteBoksi(60,400);
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
   
   int uusiX = 200 + (int)((xLuku/maxX)*600);
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
  
  fill(255,239,219);
  if (this.yMode == mode) {
    fill(100,100,100);
  }
  rect(15,y, 110, 70);
  fill(0);
  text(teksti,25, y+25);
  
  //tsekataan klikkaus

 if (mousePressed && mouseX >= 15 && mouseX <= 15+110 && mouseY >= y && mouseY < y+70 && this.yMode != mode) {
    println("HAI"); 
    this.yMode = mode;
    sijoittelePallot();
  }
}

void piirraXBoksi(String teksti, int x, int mode) {
  //x-akselin boksien piirtaminen
  fill(255,239,219);
  if (this.xMode == mode) {
    fill(100,100,100);
  }
  rect(x,xAkselinEtaisyys+10,180,30);
  fill(0);
  text(teksti, x+25, xAkselinEtaisyys+30);
  
  if (mousePressed && mouseX >= x && mouseX <= x+180 && mouseY >= xAkselinEtaisyys+10 && mouseY < xAkselinEtaisyys+10+30 && this.xMode != mode) {
    println("MUI"); 
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
  fill(0);
  //text(teksti, x+25, y+30);
  

}

void mouseClicked() {
  int leveys = 30, korkeus = 30;
  int x = 60, y = 400;
  println(mouseX);
  //Pisteiden piirto
  if (mouseX >= x && mouseX <= x+leveys && mouseY >= y && mouseY < y+korkeus) {
    piirretaanPisteet = !piirretaanPisteet;
  }
}
   
}
