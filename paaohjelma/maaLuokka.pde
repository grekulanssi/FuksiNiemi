class Maa {
 
 int vakiluku;
 float pinta_ala;
 String nimi;
 String kuvanNimi;
 float elinIka;
 int bkt;
<<<<<<< HEAD
 PImage lippu;
=======
 int tliikenne;
>>>>>>> 7fb3d8a2df232e29b5d19202d2b78dfcc5e4e4df
 
 Maa(int vakiluku, float pinta_ala, String nimi, String kuvanNimi, float elinIka, int bkt, int tliikenne) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  this.kuvanNimi = kuvanNimi;
  this.elinIka = elinIka;
  this.bkt = bkt;
<<<<<<< HEAD
  this.lippu = loadImage(kuvanNimi);
=======
  this.tliikenne = tliikenne;
>>>>>>> 7fb3d8a2df232e29b5d19202d2b78dfcc5e4e4df
  
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
<<<<<<< HEAD
 }
 
 float annaElinIka() {
  return this.elinIka;
 }
 
 int annaBkt(){
  return this.bkt;
 }

 PImage annaLippu() {
  return this.lippu;
 } 
=======
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
>>>>>>> 7fb3d8a2df232e29b5d19202d2b78dfcc5e4e4df
 
}
