echo Hello
echo Hi
echo -e "Hello\nHi\nBye"
echo -e Hello"\n"Hi"\n"Bye
echo -e Name"\t\t"Class"\t\t"Section"\n"Kavitha"\t\t"5"\t\t"A"\n"Srilakshmi"\t"6"\t\t"B
## Name         Class   Section
## Kavitha      5       A
## Srilakshmi   6       A


##Colors--RGYBMC
##Color-Name    FG-Code BG-Code
##  Red             31      41
##  Green           32      42      
##  Yellow          33      43
##  Blue            34      44
##  Magenta         35      45  
##  Cyan            36      46

echo -e "\e[31m Red Font Color"
echo Text with no Color
echo testing color

echo -e "\e[33m Yellow Font Color\e[0m"
echo tetsing color
echo -e "\e[32m Green Font Color\e[0m"
echo tetsing color
echo -e "\e[34m Blue Font Color\e[0m"
echo tetsing color
echo -e "\e[35m Magenta Font Color\e[0m"
echo tetsing color
echo -e "\e[36m Cyan Font Color\e[0m"
echo tetsing color

echo -e "\e[43;31m Yellow on Red \e[0m"