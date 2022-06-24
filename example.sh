#!/bin/bash

# if you want to try just add this block code in your code 
source ./lib/shloader.sh

# you can chose (see more in lib/loader.sh):
# ball, arrow, cym, x_plus, line, ball_wave, npm and old.
# you can specify message to display during loading
# and message to display after your code finished

# eg with npm style
# notice end message -e use unicode emoji to display
# this is for better terminal support
# \u2728 == ✨ but you can use emoji if your settings support it !
shloader -l dots8 -m "Testing" -e "\u2728 finishing !" 
  sleep 2   # remove it in your code

  # … your logic goes here
  # if you want to hide some output from loader
  # don't forget to redirect your STD*
  #
  # eg :
  # STDOUT
  # my_cmd 1> /dev/null
  # STDERR
  # my_cmd 2> /dev/null
  # BOTH
  # my_cmd &> /dev/null

# stop loader
end_shloader
