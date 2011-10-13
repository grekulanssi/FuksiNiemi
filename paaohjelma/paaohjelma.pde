
List<Maa> maat;
Piirto piirto_olio;


void setup() {

  smooth();
  size(1200,400);
  Haku hakuolio = new Haku();
  maat = hakuolio.teeHaku(); 
  piirto_olio = new Piirto(maat);
  
}

void draw() {
  background(200);
  piirto_olio.piirto();
 
}

/*void draw() {
  for(int i = 0; i <maat.size(); i++){
   float sade = maat.get(i).annaPinta_ala()/50000;
   ellipse((i+1)*50,(i+1)*50, 2*sade, 2*sade);
  }

/*  for (int a=0; a < maat.size(); a++) {

    Maa maa = (Maa)maat.get(a);
    //Piirretään maa ruudulle pallona
    int korkeus = (int)log(maa.annaPinta_ala())* 20;
    int leveys = (int)log(maa.annaPinta_ala()) * 20;
    ellipse(maa.annaX(), maa.annaY(), korkeus, leveys);
    //Piirrä pallon päälle väkiluvun mukainen määrä pisteitä
    int vakiluku = (maa.annaVakiluku() / 500000);
    for (int b = 0; b < vakiluku; b++){
        fill(150);
        int aks = maa.annaX + random((-korkeus1), korkeus-1);
        int yy = maa.annaY + random((-leveys-1), leveys-1);
        ellipse(aks, yy, 3, 3);
    }
  } */
  
//}
