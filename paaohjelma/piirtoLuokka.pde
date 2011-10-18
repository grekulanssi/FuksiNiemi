class Piirto{
  
  List<Float> sateet = new ArrayList<Float>();
  List<Float> xkoordinaatit = new ArrayList<Float>();
  List<Float> ykoordinaatit = new ArrayList<Float>();
  List<Maa> maat;
  List<Pistejoukko> pistejoukot = new ArrayList<Pistejoukko>();
  
  int xakselimode = 1;
  
  PFont font;
  
  final int xAkselinEtaisyys = 600;

/* 
 * Kun luodaan Piirto-olio, alustetaan säteet ja xkoordinaatit 
 */
Piirto(List<Maa> maat) {
  this.maat = maat;    
  for(int i = 0; i <maat.size(); i++){
   float kerroin = maat.get(i).annaVakiluku()/2000000; //en tiia onko taa hyva ratkasu, mutta talla saadaan ainaki pahimmat ylilyonnit pois
   float sade = 20 + kerroin * 0.5; //15 "minimisade" ettei tuu minipalloja
   sateet.add(sade);
   //Tiina: pallojen ykoordinaatti tulee elinian mukaan
   float ykoordinaatti = xAkselinEtaisyys+10 - maat.get(i).annaElinIka()*5;
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
  text("Elinikä",10,50);
  fill(255);
  rect(100,xAkselinEtaisyys+10,100,20);
  rect(300,xAkselinEtaisyys+10,100,20);
  fill(0);
  text("BKT/ca", 200, 200);

}


 void hiirenTarkistus(float x, float y, float sade, Maa maa) {
   
   /* Metodi tarkistaa, onko hiiri parametrina annettujen tietojen määräämässä
      ympyrässä. Jos on, niin luodaan inforuutu
   */
   
   float testiX = x - mouseX;
   float testiY = y - mouseY;
   
   if(sqrt(sq(testiX)+sq(testiY)) < sade/2) {
     infoRuutu ruutu = new infoRuutu(maa, 100, 100);
   }
   
 }



 void tarkistaXAkselimode(){
   float xkoordinaatti = 0;
   for(int i = 0; i<maat.size(); i++){
 if(mousePressed && mouseX>100 && mouseX<200 && mouseY>xAkselinEtaisyys+10 && mouseY<xAkselinEtaisyys+30){
   xkoordinaatti = 100 + maat.get(i).annaBkt()/100 * 1.5;
   //pistejoukot.set(i, new Pistejoukko( maat.get(i), xkoordinaatti, ykoordinaatit.get(i), sateet.get(i) ));
 }
 if(mousePressed && mouseX>300 && mouseX<400 && mouseY>xAkselinEtaisyys+10 && mouseY<xAkselinEtaisyys+30){
  xkoordinaatti = maat.get(i).annaSynnytys()*20; 
 }
 if(xkoordinaatti != 0){
 xkoordinaatit.set(i, xkoordinaatti);
 }
 }
 }
 
 
}
