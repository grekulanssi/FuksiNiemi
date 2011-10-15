class Maa {
 
 int vakiluku;
 float pinta_ala;
 String nimi;
 String kuvanNimi;
 float elinIka;
 
 Maa(int vakiluku, float pinta_ala, String nimi, String kuvanNimi, float elinIka) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  this.kuvanNimi = kuvanNimi;
  this.elinIka = elinIka;
  
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
 
}
