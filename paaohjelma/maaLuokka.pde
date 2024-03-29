class Maa {
  
  /* Maa-oliot varastoivat tietoa maista */
 
 int vakiluku;
 float pinta_ala;
 String nimi;
 String kuvanNimi;
 float elinIka;
 int bkt;
 PImage lippu;
 int tliikenne;
 float synnytys; // birth rate poistettiin akseleista eikä ole käytössä oikeastaan
 int tlkm;
 float puhelinLiittymat;
 float tyottomyysAste;
 int oljynKaytto;
 float facebookProsentti;
 
 Maa(int vakiluku, float pinta_ala, String nimi, String kuvanNimi, float elinIka, int bkt, int tliikenne, float synnytys,
 int tlkm, float puhelinLiittymat, float tyottomyysAste, int oljynKaytto, float facebookProsentti) {
  this.vakiluku = vakiluku;
  this.pinta_ala = pinta_ala;
  this.nimi = nimi;
  this.kuvanNimi = kuvanNimi;
  this.elinIka = elinIka;
  this.bkt = bkt;
  this.lippu = loadImage(kuvanNimi);
  this.tliikenne = tliikenne;
  this.tlkm = tlkm;
  this.puhelinLiittymat = puhelinLiittymat;
  this.tyottomyysAste = tyottomyysAste;
  this.oljynKaytto = oljynKaytto;
  this.facebookProsentti = facebookProsentti;
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
  
 int annaTliikenne() {
   return this.tliikenne; 
 }
 
 int annaNetinKayttajat() {
   return this.tlkm;
 }
 
 float annaPuhelinLiittymat() {
   return this.puhelinLiittymat;
 }
 
 float annaTyottomyys() {
   return this.tyottomyysAste;
 }
 
 int annaOljynKaytto() {
  return this.oljynKaytto; 
 }
 
 float annaFacebookProsentti() {
  return this. facebookProsentti; 
 }
 
}
