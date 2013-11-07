for i in {1..50}; do

    wget -O men${i}.jpg http://api.randomuser.me/0.2/portraits/men/${i}.jpg
    wget -O women${i}.jpg http://api.randomuser.me/0.2/portraits/women/${i}.jpg

done
