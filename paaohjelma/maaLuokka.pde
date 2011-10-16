class Maa {
 
 int vakiluku;
 float pinta_ala;
 String nimi;
 String kuvanNimi;
 float elinIka;
 int bkt;
 int tliikenne;
 
 Maa(int vakiluku, float pinta_ala, String nimi, String kuvanNimi, float elinIka, int bkt, int tliikenne) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  this.kuvanNimi = kuvanNimi;
  this.elinIka = elinIka;
  this.bkt = bkt;
  this.tliikenne = tliikenne;
  
 } 
 
 int annaVakiluku() {
   return this.vakiluku;
 }
 
 float annaPinta_ala() {
   return this.pinta_ala; 
 }
 
 String annaNimi() {
   return this.nimi;
 }

  String annaKuvanNimi() {
   return this.kuvanNimi;
  } 
  float annaElinIka() {
   return this.elinIka;
  }
   int annaBkt(){
   return this.bkt;
   } 
   
   int annaTliikenne() {
    return this.tliikenne; 
   }
 
}
