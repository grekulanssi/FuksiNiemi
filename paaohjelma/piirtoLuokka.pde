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
   float sade = 10 + kerroin * 0.7; //10 "minimisade" ettei tuu minipalloja
   sateet.add(sade);
   float ykoordinaatti = 750 - maat.get(i).annaElinIka()*5;
   ykoordinaatit.add(ykoordinaatti);
   //tasta eteenpain: kokeilu miten sain pallot tasaisin valimatkoin (ne kattoo edellisten xt ja sateet)
   float xkoordinaatti;
   if(i == 0){
     xkoordinaatti = 50 + sateet.get(i);
     xkoordinaatit.add(xkoordinaatti);
   }
   else{
     xkoordinaatti = xkoordinaatit.get(i-1) + sateet.get(i-1) + 50 + sateet.get(i);
     xkoordinaatit.add(xkoordinaatti);
   }
   pisteet.add(new Pisteet((int)xkoordinaatti, (int)ykoordinaatti, sade, 10)); //Lisätään pistejoukko
  }

}

/*
 * Piirto metodi piirtää
 */
void piirto() {
  
  for(int i = 0; i <maat.size(); i++) {
   float sade = sateet.get(i);
   fill(0);
   ellipseMode(CENTER);
   ellipse(xkoordinaatit.get(i),ykoordinaatit.get(i), 2*sade, 2*sade); //nyt pallot rivissa
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
