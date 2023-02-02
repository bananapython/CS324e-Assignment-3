/* Assignment 3: Novel Visualization

This Processing file will generate a visualization of the relationship 
between word frequency and numbers of words with those frequencies using 
the contents of wordfrequency.txt.

This file, a3_wordfrequency, written by Daniel Ross */

int[][] getFrequencies(String[] arr) {
    int[] freq = new int[arr.length];
    int[] wordct = new int[arr.length]; 
    int[][] mult_ret = {freq, wordct};

    for (int line = 0; line < arr.length; line++) {
        String[] splitln = split(arr[line], ": ");

        freq[line] = Integer.parseInt(splitln[0]);
        wordct[line] = Integer.parseInt(splitln[1]);
    }
    return mult_ret;
}

void visualize(int[] freq, int[] wordct) {
    rectMode(CENTER);
    
    float mult = (500.0 / max(wordct));
    int blocksize = int(round(500.0 / freq.length));
    int ypos = 500 - int(blocksize/2);
    for (int i = 0; i < freq.length; i++) {
        int size = int(round(mult * wordct[i]));

        rect(250, ypos, size, blocksize);

        ypos -= blocksize;
    }
}

void setup() {
    surface.setSize(500, 500);
}

void draw() {
    noLoop();

    String[] wordfreqtxt = loadStrings("wordfrequency.txt");

    int[][] loadFreqs = getFrequencies(wordfreqtxt);
    int[] freq = loadFreqs[0];
    int[] wordct = loadFreqs[1];

    visualize(freq, wordct);
}