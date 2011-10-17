class Piirto{
  
  List<Float> sateet = new ArrayList<Float>();
  List<Float> xkoordinaatit = new ArrayList<Float>();
  List<Float> ykoordinaatit = new ArrayList<Float>();
  List<Maa> maat;
  List<Pisteet> pisteet = new ArrayList<Pisteet>();
  
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
   float xkoordinaatti = 100 + maat.get(i).annaBkt()/100 * 1.5;
   //tasta eteenpain: kokeilu miten sain pallot tasaisin valimatkoin (ne kattoo edellisten xt ja sateet)
   /*if(i == 0){
     xkoordinaatti = 50 + sateet.get(i);
     xkoordinaatit.add(xkoordinaatti);
   }
   else{
     xkoordinaatti = xkoordinaatit.get(i-1) + sateet.get(i-1) + 50 + sateet.get(i);
     xkoordinaatit.add(xkoordinaatti);
   }*/
   xkoordinaatit.add(xkoordinaatti);
   pisteet.add(new Pisteet((int)xkoordinaatti, (int)ykoordinaatti, sade, 10, maat.get(i))); //Lisätään pistejoukko
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

   pisteet.get(i).piirra();
  }
  strokeWeight(3);
  line(50,750,950,750);
  line(50,750,50,50);
  /*font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font, 30);
  text("Elinikä",200,200);
  //Jos yrittaa lisata tekstit kuvaamaan akseleita, koko ohjelma hidastuu... PALJON!
  */
}
}
