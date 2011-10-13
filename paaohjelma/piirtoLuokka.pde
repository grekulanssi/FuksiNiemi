class Piirto{
  
  List<Float> sateet = new ArrayList<Float>();
  List<Float> xkoordinaatit = new ArrayList<Float>();
  List<Maa> maat;
  List<Pisteet> pisteet = new ArrayList<Pisteet>();

/* 
 * Kun luodaan Piirto-olio, alustetaan säteet ja xkoordinaatit 
 */
Piirto(List<Maa> maat) {
  this.maat = maat;    
  for(int i = 0; i <maat.size(); i++){
   float kerroin = maat.get(i).annaPinta_ala()/50000; //en tiia onko taa hyva ratkasu, mutta talla saadaan ainaki pahimmat ylilyonnit pois
   float sade = 10 + kerroin * 0.7; //10 "minimisade" ettei tuu minipalloja
   sateet.add(sade);
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
   pisteet.add(new Pisteet((int)xkoordinaatti, 200, sade, 10)); //Lisätään pistejoukko
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
   ellipse(xkoordinaatit.get(i),200, 2*sade, 2*sade); //nyt pallot rivissa
   pisteet.get(i).piirra();
  }
}
}
