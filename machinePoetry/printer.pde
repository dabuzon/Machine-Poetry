int NUM_COLUMNS = 80;

void printer (String poem) {
  String command = ""; 
  //add a line of spaces to make printer work
  for (int i = 0; i < NUM_COLUMNS; i++) {
    command += ' ';
  }
  command += poem;
  command += '\n';

  try {
    Process p = Runtime.getRuntime().exec("lp -d okidata -o raw");
    //Process p = Runtime.getRuntime().exec("grep }");
    InputStream in = p.getInputStream();
    InputStream err = p.getErrorStream();
    OutputStream out = p.getOutputStream();
    out.write(command.getBytes("ASCII"));
    out.close();
    p.waitFor();
    
    //Read from stderr
    byte[] e = new byte[256]; 
    err.read(e, 0, e.length);
    println(new String(e));

    //Read from stdin
    byte[] b = new byte[256]; 
    in.read(b, 0, b.length);
    println(new String(b));
  } 
  catch (IOException e) {
    println(e);
  }
  catch (InterruptedException e) {
    println(e);
  }
}
