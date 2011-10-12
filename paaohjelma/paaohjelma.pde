
List<Maa> maat = new ArrayList<Maa>();


void setup() {

  Haku hakuolio = new Haku();
  maat = hakuolio.teeHaku();  
}

void draw() {

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

}

