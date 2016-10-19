#!/bin/sh
#
#This is an example script example.sh
#
#These commands set up the Grid Environment for your job:
#PBS -N ExampleJob
#PBS -l nodes=2:ppn=16
#PBS -e sleep.err
#PBS -o sleep.out
#PBS -q computequeue
#print the time and date
date
#wait 10 seconds
sleep 1000
#print the time and date again
date