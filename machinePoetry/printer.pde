void printer (String poem) {
  String command = poem + char(27) + char(125) + char(0);
  String printCmd = "echo \"" + command + "\" | lp -d okidata -o raw";

  try {
    Runtime.getRuntime().exec(printCmd);
  } 
  catch (IOException e) {
  }
}
