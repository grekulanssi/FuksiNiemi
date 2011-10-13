class Piirto{

void piirto(List<Maa> maat) {
  for(int i = 0; i <maat.size(); i++){
   float sade = maat.get(i).annaPinta_ala()/50000;
   ellipse((i+1)*50,(i+1)*50, 2*sade, 2*sade);
  }
}
}
