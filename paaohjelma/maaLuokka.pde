class Maa {
 
 int vakiluku;
 int pinta_ala;
 String nimi;
 int x;
 int y;
 
 Maa(int vakiluku, int pinta_ala, String nimi, int x, int y) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  this.x = x;
  this.y = y;
  
 } 
 
 int annaVakiluku() {
   return this.vakiluku;
 }
 
 int annaPinta_ala() {
   return this.pinta_ala; 
 }
 
 String annaNimi() {
   return this.nimi;
 } 
 
 int annaX() {
   return this.x;
 }
 
 int annaY() {
   return this.y;
 }
 
}
