class Piirto{
  
  List<Float> sateet = new ArrayList<Float>();
  List<Float> xkoordinaatit = new ArrayList<Float>();
  List<Float> ykoordinaatit = new ArrayList<Float>();
  List<Maa> maat;
  List<Pistejoukko> pistejoukot = new ArrayList<Pistejoukko>();
  
  int xakselimode = 1;
  
  PFont font;

/* 
 * Kun luodaan Piirto-olio, alustetaan säteet ja xkoordinaatit 
 */
Piirto(List<Maa> maat) {
  this.maat = maat;    
  for(int i = 0; i <maat.size(); i++){
   float kerroin = maat.get(i).annaPinta_ala()/50000; //en tiia onko taa hyva ratkasu, mutta talla saadaan ainaki pahimmat ylilyonnit pois
   float sade = 15 + kerroin * 0.5; //15 "minimisade" ettei tuu minipalloja
   sateet.add(sade);
   //Tiina: pallojen ykoordinaatti tulee elinian mukaan
   float ykoordinaatti = 750 - maat.get(i).annaElinIka()*5;
   ykoordinaatit.add(ykoordinaatti);
   //Tiina: pallojen xkoordinaatti tulee BKT/ca mukaan
   float xkoordinaatti = 0;
   if(this.xakselimode == 1){
   xkoordinaatti = 100 + maat.get(i).annaBkt()/100 * 1.5;
   }
   else{
   xkoordinaatti = 100 + maat.get(i).annaSynnytys();
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
   float sade = sateet.get(i);
   fill(0);
   //Toim.huom! olis parempi jos voitais kayttaa CORNER-modea, nyt esim y-akseli ei kuvaa tilannetta hyvin
   ellipseMode(CENTER);
   ellipse(xkoordinaatit.get(i),ykoordinaatit.get(i), 2*sade, 2*sade); //nyt pallot rivissa
   
   image(((Maa)maat.get(i)).annaLippu(), xkoordinaatit.get(i)-sade, ykoordinaatit.get(i)-sade, 2*sade, 2*sade);

<<<<<<< HEAD
   pistejoukot.get(i).piirra();
=======
   pisteet.get(i).piirra();
   
   hiirenTarkistus(xkoordinaatit.get(i), ykoordinaatit.get(i), sade*2, maat.get(i));
>>>>>>> 277ffddf0d4b4b870fa4447b34e7a7e4678bd170
  }
  strokeWeight(3);
  line(50,750,950,750);
  line(50,750,50,50);
  text("Elinikä",10,50);
  if(this.xakselimode == 1){
  text("BKT/ca", 200,780);
  }
  else{
  text("Synnytys", 200, 780);
  }

}
<<<<<<< HEAD

 void hiirenTarkistus(float x, float y, float sade, Maa maa) {
   
   float testiX = x - mouseX;
   float testiY = y - mouseY;
   
   if(sqrt(sq(testiX)+sq(testiY)) < sade/2) {
     infoRuutu ruutu = new infoRuutu(maa,0,0);
   }
   
 }



=======
 void tarkistaXAkselimode(){
 if(keyPressed){
   if(this.xakselimode == 1){
   this.xakselimode = 2;
   }
   else{
   this.xakselimode = 1;
   }
 }
 }
>>>>>>> 3a34d3a00da121c0e06283cf9533067cda2004bb
}
