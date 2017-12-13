## Initial ideas for separating music by instrument ##

# Author: Jean Michel Arreola Trapala
# Date: 13/12/2017
# Contact: jean.arreola@yahoo.com.mx


#Initial tests

#Load packages
library(tuneR)
library(fastICA)
library(seewave)

#Load song

song <- readMP3("demo.mp3")


#Start with a small subset of the song

test <- matrix(c(song@left[5000001:6000000], song@right[5000001:6000000]), 1000000,2)


#Apply independent component analysis

result <- fastICA(test,2)

#Create Wave object from matrix

output <- Wave(result$S, bit = 16)

#Save .wav 
savewav(output, filename = "output.wav")


#Create and save .wav with subset of original song (for comparison purpouses)

original <- Wave(test)
savewav(original , filename = "original.wav")
