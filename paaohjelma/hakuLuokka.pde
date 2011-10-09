class Haku {
  
  String tiedostonNimi;
  BufferedReader lukija;
  String rivi;
  
  void setup() {
   lukija = createReader("testi.txt"); 
  }
  
  void draw() {
    
   try {
     rivi = lukija.readLine();
   } catch (IOException e) {
     e.printStackTrace();
     rivi = null;
   }
   if (rivi==null) {
     noLoop();
   } else {
     String[] pieces = split(rivi,"&");
     println(pieces[0]);
     println(pieces[1]);
     println(pieces[2]);
   }
     
  }
  
}  

