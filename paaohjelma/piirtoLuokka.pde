class Piirto{
  
  List<Integer> sateet = new ArrayList<Integer>();
  List<Integer> xkoordinaatit = new ArrayList<Integer>();
  List<Integer> ykoordinaatit = new ArrayList<Integer>();
  List<Maa> maat;
  List<Pistejoukko> pistejoukot = new ArrayList<Pistejoukko>();
  
  PFont fontti = loadFont("BradleyHandITC-20.vlw");
  PImage tahti = loadImage("star.png");
  //PImage tausta = loadImage("taustapaperi.png");
  
  
  boolean bktmode = true;
  boolean synnytysmode = false;
  
  float tahtix;
  float tahtiy;
  float tahtix2;
  float tahtiy2;
  
  
  final int xAkselinEtaisyys = 600;

/* 
 * Kun luodaan Piirto-olio, alustetaan säteet ja xkoordinaatit 
 */
Piirto(List<Maa> maat) {
  
  this.maat = maat; 
  this.tahtix = 290;
  this.tahtiy = xAkselinEtaisyys + 5;
  this.tahtix2 = 115;
  this.tahtiy2 = xAkselinEtaisyys - 505;
  
  //Lasketaan maille sijainnit
  for(int i = 0; i <maat.size(); i++){
   float kerroin = maat.get(i).annaVakiluku()/2000000; //en tiia onko taa hyva ratkasu, mutta talla saadaan ainaki pahimmat ylilyonnit pois
   float sade = 20 + kerroin * 0.5; //15 "minimisade" ettei tuu minipalloja
   sateet.add((int)sade);
   //Tiina: pallojen ykoordinaatti tulee elinian mukaan
   int ykoordinaatti =(int)(xAkselinEtaisyys+10 - maat.get(i).annaElinIka()*5);
   ykoordinaatit.add(ykoordinaatti);
   //Tiina: pallojen xkoordinaatti tulee BKT/ca mukaan
   int xkoordinaatti = 0;
   xkoordinaatti = (int)(200 + maat.get(i).annaBkt()/100 * 1.5);

   xkoordinaatit.add(xkoordinaatti);
   //Luodaan ympyrää vastaava pistejoukko
   pistejoukot.add(new Pistejoukko(maat.get(i), (int)xkoordinaatti, (int)ykoordinaatti, (int)sade)); //Lisätään pistejoukko
  }

}

/*
 * Piirto metodi piirtää
 */
void piirto() {
  
  // Piirretään taustakuva
  //image(this.tausta, 35, 33, 930, 735);
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
  for(int i = 0; i <maat.size(); i++) {
   int sade = sateet.get(i);
   fill(0);
   //Toim.huom! olis parempi jos voitais kayttaa CORNER-modea, nyt esim y-akseli ei kuvaa tilannetta hyvin
   ellipseMode(CENTER);
   ellipse(xkoordinaatit.get(i),ykoordinaatit.get(i), 2*sade, 2*sade); //nyt pallot rivissa
   
   // Piirretään maiden liput
   image(((Maa)maat.get(i)).annaLippu(), xkoordinaatit.get(i)-sade, ykoordinaatit.get(i)-sade, 2*sade, 2*sade);


   pistejoukot.get(i).piirra();

   // Tarkistetaan onko hiiri jonkun maan päällä 
   hiirenTarkistus(xkoordinaatit.get(i), ykoordinaatit.get(i), sade*2, maat.get(i));
   
   tarkistaXAkselimode();
   

  }
  println(screen.height);
  strokeWeight(3);
  //Piirretaan akseliviivat
  line(150,xAkselinEtaisyys,950,xAkselinEtaisyys);
  line(150,xAkselinEtaisyys,150,50);
  textFont(fontti,20);
  
  //y-akselin boksien piirtäminen
  piirraYBoksi("Facebook", 100);
  piirraYBoksi("Öljynkulutus/päivä", 200);
  piirraYBoksi("Liittymät/asukas", 300);
  image(tahti, this.tahtix2, this.tahtiy2, 30,30);
  
  //x-akselin boksien
  piirraXBoksi("Eliniän odote", 200);
  piirraXBoksi("BKT/asukas", 400);
  piirraXBoksi("Työttömyysaste", 600);
  image(tahti,this.tahtix,this.tahtiy,30,30);

}

void piirraYBoksi(String teksti, int y) {
  fill(255);
  rect(25,y, 100, 30);
  fill(0);
  text(teksti,50, y+20);
}

void piirraXBoksi(String teksti, int x) {
  //x-akselin boksien piirtaminen
  fill(255);
  rect(x,xAkselinEtaisyys+10,180,30);
  fill(0);
  text(teksti, x+25, xAkselinEtaisyys+30);
}

 void hiirenTarkistus(int x, int y, int sade, Maa maa) {
   
   /* Metodi tarkistaa, onko hiiri parametrina annettujen tietojen määräämässä
      ympyrässä. Jos on, niin luodaan inforuutu
   */
   
   int testiX = x - mouseX;
   int testiY = y - mouseY;
   
   if(sqrt(sq(testiX)+sq(testiY)) < sade/2) {
     infoRuutu ruutu = new infoRuutu(maa, 100, 100);
   }
   
 }



 void tarkistaXAkselimode(){
   int xkoordinaatti = 0;
   for(int i = 0; i<maat.size(); i++){
 //Bkt-mode
 if(mousePressed && mouseX>200 && mouseX<300 && mouseY>xAkselinEtaisyys+10 && mouseY<xAkselinEtaisyys+40){
   xkoordinaatti = (int)(200 + maat.get(i).annaBkt()/100 * 1.5);
   pistejoukot.set(i, new Pistejoukko( maat.get(i), xkoordinaatti, ykoordinaatit.get(i), (int)sateet.get(i) ));
   this.bktmode = true;
   this.synnytysmode = false;
   this.tahtix = 290;
 }
 //Synnytys-mode
 if(mousePressed && mouseX>400 && mouseX<500 && mouseY>xAkselinEtaisyys+10 && mouseY<xAkselinEtaisyys+40){
  xkoordinaatti = (int)(100 + maat.get(i).annaSynnytys()*20); 
  pistejoukot.set(i, new Pistejoukko( maat.get(i), xkoordinaatti, ykoordinaatit.get(i), (int)sateet.get(i) ));
  this.synnytysmode = true;
  this.bktmode = false;
  this.tahtix = 490;
 }
 if(xkoordinaatti != 0){
 xkoordinaatit.set(i, xkoordinaatti);
 }
 }
 }
 
 
}
