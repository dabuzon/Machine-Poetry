ProcessBuilder pb = new ProcessBuilder();     

void printer (String poem) {
    String command = poem;
    command += char(27) + char(125) + char(0);

    String printCmd = "echo \"" + command + "\" | lp -d okidata -o raw";

    //Process proc = pb.command(printCmd);
}
