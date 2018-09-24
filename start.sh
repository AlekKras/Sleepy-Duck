#!/bin/bash


# Ask the user for the target
intro()
{
echo -n "What is your target?"
read target
echo "$target" > target.txt #use  >> if you would like to append instead of overwriting
}

