// creating globals
String[] uniqueWords;
PFont font;
int lengthOfWord;

//size, load text, add font, no loop so doest repeat
void setup() {
  size(700, 600);
  String novel = "uniquewords.txt";
  uniqueWords = loadStrings(novel);
  font = createFont("Courier", 28);  
  noLoop();
}
//create background and run novel viz
void draw() {
  background(#FFFFFF);
  novelVisualization();
}

void novelVisualization() {
  // variables for font, height & width of canvas, length of lines
  textFont(font);
  int canvasHeight = 28;
  int canvasWidth = 10;
  int lengthOfLine = 0;
  // loop for fitting words on canvas
  while(canvasHeight < 600) {
    // random to get words
    int i = int(random(uniqueWords.length));
    // get length of the word
    int lengthOfWord = uniqueWords[i].length();
    colorText(lengthOfWord);
    // adding spacing
    lengthOfLine = canvasWidth + (int)textWidth(uniqueWords[i] + " "); 
    // making sure words don't overlap
    if (lengthOfLine > 700){
      if(canvasHeight < 600) {
        // add to height and set width
        canvasHeight += 30;
        canvasWidth = 6;
        // fit screen with the unique words
        text(uniqueWords[i], canvasWidth, canvasHeight);
        // resets width of the word and adds space
        canvasWidth = (int)textWidth(uniqueWords[i] + " ");  
      }
    } else { 
      // print the word
      text(uniqueWords[i], canvasWidth, canvasHeight);
      // reset width of canvas
      canvasWidth = lengthOfLine;
    }
  }
}

void colorText(int lengthOfWord) {
    // give short, medium, and long words different colors to distinguish
    if (lengthOfWord >= 9){
      fill (#2D93AD);
    } 
    // small
    else if (lengthOfWord <= 5) {
      fill(#DE8F6E);
    } 
    // medium
    else {
      fill(#DBD56E);
    }
}
void mousePressed() {
  // reset canvas
  redraw();
}
