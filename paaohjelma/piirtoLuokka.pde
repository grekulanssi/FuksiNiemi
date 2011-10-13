class Piirto{
  
  List<Float> sateet = new ArrayList<Float>();
  List<Float> xkoordinaatit = new ArrayList<Float>();

void piirto(List<Maa> maat) {
  for(int i = 0; i <maat.size(); i++){
   float kerroin = maat.get(i).annaPinta_ala()/50000; //en tiia onko taa hyva ratkasu, mutta talla saadaan ainaki pahimmat ylilyonnit pois
   float sade = 10 + kerroin * 0.7; //10 "minimisade" ettei tuu minipalloja
   sateet.add(sade);
   //tasta eteenpain: kokeilu miten sain pallot tasaisin valimatkoin (ne kattoo edellisten xt ja sateet)
   if(i == 0){
   float xkoordinaatti = 50 + sateet.get(i);
   xkoordinaatit.add(xkoordinaatti);
   }
   else{
   float xkoordinaatti2 = xkoordinaatit.get(i-1) + sateet.get(i-1) + 50 + sateet.get(i);
   xkoordinaatit.add(xkoordinaatti2);
   }
   ellipseMode(CENTER);
   ellipse(xkoordinaatit.get(i),200, 2*sade, 2*sade); //nyt pallot rivissa
  }
}
}
