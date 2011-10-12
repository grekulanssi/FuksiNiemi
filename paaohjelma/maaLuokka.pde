class Maa {
 
 int vakiluku;
 float pinta_ala;
 String nimi;
 
 Maa(int vakiluku, float pinta_ala, String nimi) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  
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
 
}
