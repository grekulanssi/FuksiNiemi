class Maa {
 
 int vakiluku;
 float pinta_ala;
 String nimi;
 String kuvanNimi;
 float elinIka;
 int bkt;
 PImage lippu;
 int tliikenne;
 float synnytys;
 int tlkm; //netinkäyttäjiä
 
 Maa(int vakiluku, float pinta_ala, String nimi, String kuvanNimi, float elinIka, int bkt, int tliikenne, float synnytys, int tlkm) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  this.kuvanNimi = kuvanNimi;
  this.elinIka = elinIka;
  this.bkt = bkt;
  this.lippu = loadImage(kuvanNimi);
  this.tliikenne = tliikenne;
  this.synnytys = synnytys;
  this.tlkm = tlkm;
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

 PImage annaLippu() {
  return this.lippu;
 } 
  
 int annaBkt(){
   return this.bkt;
 } 
  
 //Anna keskimääräinen nettiyhteyden nopeus 
 int annaTliikenne() {
   return this.tliikenne; 
 }
 //Anna netinkäyttäjien määrä
 int annaNetinKayttajat() {
   return this.tlkm;
 }
 
 float annaSynnytys(){
 return this.synnytys;
 }
 
}
