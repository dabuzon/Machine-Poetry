void printer (String poem) {
  String command = poem + char(27) + char(125) + char(0);

  try {
    Process p = Runtime.getRuntime().exec("lp -d okidata -o raw");
    //Process p = Runtime.getRuntime().exec("grep aaa");
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
