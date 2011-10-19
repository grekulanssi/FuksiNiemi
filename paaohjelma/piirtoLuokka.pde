class Piirto{
  
  List<Integer> sateet = new ArrayList<Integer>();
  List<Integer> xkoordinaatit = new ArrayList<Integer>();
  List<Integer> ykoordinaatit = new ArrayList<Integer>();
  List<Maa> maat;
  List<Pistejoukko> pistejoukot = new ArrayList<Pistejoukko>();
  PFont fontti = loadFont("AgencyFB-Reg-48.vlw");
  PImage tahti = loadImage("star.png");
  
  int xakselimode = 1;
  
  boolean bktmode = true;
  boolean synnytysmode = false;
  
  float tahtix;
  float tahtiy;
  
  
  final int xAkselinEtaisyys = 600;

/* 
 * Kun luodaan Piirto-olio, alustetaan säteet ja xkoordinaatit 
 */
Piirto(List<Maa> maat) {
  this.maat = maat; 
  this.tahtix = 190;
  this.tahtiy = xAkselinEtaisyys + 5;
  for(int i = 0; i <maat.size(); i++){
   float kerroin = maat.get(i).annaVakiluku()/2000000; //en tiia onko taa hyva ratkasu, mutta talla saadaan ainaki pahimmat ylilyonnit pois
   float sade = 20 + kerroin * 0.5; //15 "minimisade" ettei tuu minipalloja
   sateet.add((int)sade);
   //Tiina: pallojen ykoordinaatti tulee elinian mukaan
   int ykoordinaatti =(int)(xAkselinEtaisyys+10 - maat.get(i).annaElinIka()*5);
   ykoordinaatit.add(ykoordinaatti);
   //Tiina: pallojen xkoordinaatti tulee BKT/ca mukaan
   int xkoordinaatti = 0;
   if(this.xakselimode == 1){
   xkoordinaatti = (int)(100 + maat.get(i).annaBkt()/100 * 1.5);
   }
   else{
   xkoordinaatti = (int)(100 + maat.get(i).annaSynnytys());
   }

   xkoordinaatit.add(xkoordinaatti);
   pistejoukot.add(new Pistejoukko(maat.get(i), (int)xkoordinaatti, (int)ykoordinaatti, (int)sade)); //Lisätään pistejoukko
  }

}

/*
 * Piirto metodi piirtää
 */
void piirto() {
  
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
  line(50,xAkselinEtaisyys,950,xAkselinEtaisyys);
  line(50,xAkselinEtaisyys,50,50);
  textFont(fontti,20);
  text("Elinikä",10,50);

  rect(100,xAkselinEtaisyys+10,100,30);
  fill(255);

  rect(300,xAkselinEtaisyys+10,100,30);
  fill(0);
  text("BKT/ca", 125, xAkselinEtaisyys+30);
  text("Birth rate", 325, xAkselinEtaisyys+30);
  image(tahti,this.tahtix,this.tahtiy,30,30);

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
 if(mousePressed && mouseX>100 && mouseX<200 && mouseY>xAkselinEtaisyys+10 && mouseY<xAkselinEtaisyys+40){
   xkoordinaatti = (int)(100 + maat.get(i).annaBkt()/100 * 1.5);
   pistejoukot.set(i, new Pistejoukko( maat.get(i), xkoordinaatti, ykoordinaatit.get(i), (int)sateet.get(i) ));
   this.bktmode = true;
   this.synnytysmode = false;
   this.tahtix = 190;
 }
 //Synnytys-mode
 if(mousePressed && mouseX>300 && mouseX<400 && mouseY>xAkselinEtaisyys+10 && mouseY<xAkselinEtaisyys+40){
  xkoordinaatti = (int)(maat.get(i).annaSynnytys()*20); 
  pistejoukot.set(i, new Pistejoukko( maat.get(i), xkoordinaatti, ykoordinaatit.get(i), (int)sateet.get(i) ));
  this.synnytysmode = true;
  this.bktmode = false;
  this.tahtix = 390;
 }
 if(xkoordinaatti != 0){
 xkoordinaatit.set(i, xkoordinaatti);
 }
 }
 }
 
 
}
