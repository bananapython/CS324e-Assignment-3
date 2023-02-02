import re 

def main():
    novel = open("the last spaceship.txt", "r")
    allwords = open("allwords.txt", "w")
    uniquewords = open("uniquewords.txt", "w")
    wordfrequency = open("wordfrequency.txt", "w")

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

    for word in word_freq:
        wordfrequency.write(word + ": " + str(word_freq[word]) + "\n")
        
        

    novel.close()
    allwords.close()
    uniquewords.close()
    wordfrequency.close()

main()
