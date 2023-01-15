import sys
try:
    File = open('myfile.txt')
except IOError as e:
    print("Error opening file!\r\n" +
        "Error Number: {0}\r\n".format(e.errno) +
        "Error Text: {0}".format(e.strerror))
else:
    print("File opened as expected.")
    File.close();
