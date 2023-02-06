/* Assignment 3: Novel Visualization

This Processing file will generate a visualization of the relationship 
between word frequency and numbers of words with those frequencies using 
the contents of wordfrequency.txt.

This file, a3_wordfrequency, written by Daniel Ross */


// init the important arrays
int[] freq;
int[] wordct;

// extracts the frequency value and # of words with that freq
// to two arrays
void getFrequencies(String[] arr) {
    // set arrays to appropriate size
    freq = new int[arr.length-1];
    wordct = new int[arr.length-1]; 

    for (int line = 0; line < arr.length-1; line++) {
        // extract the numbers from the current line "[int]: [int]"
        // split on ": "
        String[] splitln = split(arr[line], ": ");

        // parse the two values from the split line and
        // add the parsed ints to the appropriate arrays
        freq[line] = Integer.parseInt(splitln[0]);
        wordct[line] = Integer.parseInt(splitln[1]);
    }
}

void visualize() {
    // calculate how the window size scales to a 360 degree hue scale
    float colorscale = 360.0 / freq.length;
    float huex = 0;

    // mult is the multiplier for the height of a block so that it scales
    // to the current window height
    float mult = (float(height) / max(wordct));
    // blocksize determines the width of a block in scale to the current
    // window width
    float blocksize = (float(width) / freq.length);

    int xpos = int(ceil(blocksize / 2));

    for (int i = 0; i < freq.length; i++) {
        // calculate the height of the current block, representing
        // the number of words that have the current frequency.
        int size = int(round(mult * wordct[i]));
        
        // fill color represents the freq value in addition to the
        // block's x position.
        fill(huex, 100, 100);
        rect(xpos, (height / 2), blocksize, size);

        xpos += blocksize;
        huex += colorscale;
    }
}

void setup() {
    // allow the window to be resized
    surface.setSize(500, 500);
    surface.setResizable(true);

    // set default modes
    rectMode(CENTER);
    colorMode(HSB, 360, 100, 100);
    noStroke();

    // read the txt file into list of strings
    String[] wordfreqtxt = loadStrings("wordfrequency.txt");

    // extract the freq value and # of words with that freq
    // from the list of strings
    getFrequencies(wordfreqtxt);
}

void draw() {
    // track the width and height of this iteration to detect
    // changes in window size so that the image can be redrawn
    int oldwidth = width;
    int oldheight = height;

    // clear screen and draw data
    background(0);
    visualize();

    // wait for window size to change
    while ((oldwidth == width) && (oldheight == height)) {
        noLoop();
    }
    
    // if window size changes, call draw() againS
    loop();
}
