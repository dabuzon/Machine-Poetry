PFont reg;
PFont italic;

StringList inputPoems;
StringList inputMiddle;

int pageIndex = 1;
int r;
int rTwo;
int rIn;
int rInter;

String[] standAlones;
String[] inserts;

String[] interject = {
  "Interesting.",
  "Very well.",
  "I see.",
  "Is that your word?",
  "This is new",
  "Is that so?"
};

Boolean noMatch = false;

// VARIABLES FOR TYPING
String typing = "";
String saved = "";

// VARIABLES FOR TIMER
int start;
int startAgain;
