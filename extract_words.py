import re
import os

def main():
    abs_path = os.path.dirname(__file__)

    novel = open(os.path.join(abs_path, "thelastspaceship.txt"), "r")
    allwords = open(os.path.join(abs_path, "allwords.txt"), "w")
    uniquewords = open(os.path.join(abs_path, "a3_novelvisualization/uniquewords.txt"), "w")
    wordfrequency = open(os.path.join(abs_path, "a3_wordfrequency/wordfrequency.txt"), "w")

    words = []
    for line in novel:
        line_words = re.findall("[a-z]+", line.lower())
        words += line_words



    word_freq = dict()
    
    for word in words:
        if word not in word_freq:
            word_freq[word] = 1
            uniquewords.write(word + "\n")
        else:
            word_freq[word] += 1

        allwords.write(word + "\n")

    num_freq = dict()
    for word in word_freq:
        freq = word_freq[word]
        if freq not in num_freq:
           num_freq[freq] = 1
        else:
            num_freq[freq] += 1

    num_freq_sorted = dict(sorted(num_freq.items()))

    for num in num_freq_sorted:
        wordfrequency.write(str(num) + ": " + str(num_freq_sorted[num]) + "\n")
        
        

    novel.close()
    allwords.close()
    uniquewords.close()
    wordfrequency.close()

main()

