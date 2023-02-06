/* Assignment 3: Novel Visualization

This Processing file will generate a visualization of the relationship 
between word frequency and numbers of words with those frequencies using 
the contents of wordfrequency.txt.

This file, a3_wordfrequency, written by Daniel Ross */

int[] freq;
int[] wordct;

void getFrequencies(String[] arr) {
    freq = new int[arr.length-1];
    wordct = new int[arr.length-1]; 

    for (int line = 0; line < arr.length-1; line++) {
        String[] splitln = split(arr[line], ": ");

        freq[line] = Integer.parseInt(splitln[0]);
        wordct[line] = Integer.parseInt(splitln[1]);
    }
}

void visualize() {   
    float colorscale = 360.0 / freq.length;
    float huex = 0;

    float mult = (float(height) / max(wordct));
    float blocksize = (float(width) / freq.length);
    int xpos = int(ceil(blocksize / 2));

    println("\n\n", colorscale, huex, mult, blocksize, xpos, "\n\n");

    for (int i = 0; i < freq.length; i++) {
        int size = int(round(mult * wordct[i]));
        

        fill(huex, 100, 100);

        rect(xpos, (height / 2), blocksize, size);

        xpos += blocksize;
        huex += colorscale;

        println(i, xpos, size, huex);
    }
}

void setup() {
    surface.setSize(500, 500);
    surface.setResizable(true);

    rectMode(CENTER);
    colorMode(HSB, 360, 100, 100);
    noStroke();

    String[] wordfreqtxt = loadStrings("wordfrequency.txt");
    getFrequencies(wordfreqtxt);
}

void draw() {
    int newwidth = width;
    int newheight = height;

    background(0);
    visualize();

    while ((newwidth == width) && (newheight == height)) {
        noLoop();
    }
    
    loop();
}
