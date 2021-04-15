#!/bin/bash

# version
version=1.0

# banner
echo """
███████╗██╗██╗░░░░░███████╗███████╗███████╗████████╗░█████╗░██╗░░██╗███████╗██████╗░
██╔════╝██║██║░░░░░██╔════╝██╔════╝██╔════╝╚══██╔══╝██╔══██╗██║░░██║██╔════╝██╔══██╗
█████╗░░██║██║░░░░░█████╗░░█████╗░░█████╗░░░░░██║░░░██║░░╚═╝███████║█████╗░░██████╔╝
██╔══╝░░██║██║░░░░░██╔══╝░░██╔══╝░░██╔══╝░░░░░██║░░░██║░░██╗██╔══██║██╔══╝░░██╔══██╗
██║░░░░░██║███████╗███████╗██║░░░░░███████╗░░░██║░░░╚█████╔╝██║░░██║███████╗██║░░██║
╚═╝░░░░░╚═╝╚══════╝╚══════╝╚═╝░░░░░╚══════╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝

                        By

          _|_|_  _   .|| _  _  _ |_  _  _|  _  _
           | | |(/_\/|||(_|(_|(/_| |(_|(_|<(/_|
                            _|
                  ------------------
               ~ |Do Hacks to Secure| ~
                  ------------------
            https://twitter.com/thevillagehackr

              Hey don't miss this version $version
    """

#Date
printf "\033[1;93m"
now="$(date)"
echo -e "\e[45m\033[1;97m Date: "$now" \033[0;37m"
echo -e "   "

# H1 Initiation bar
h1_bar() {  
    for i in {1..60}; do
        echo -ne "\e[41m\033[1;97m \r${bar:0:$i} \033[0;37m" 
        sleep 0.01                 
    done
    space
}

# H2 Initiation bar
h2_bar() {  
    for i in {1..60}; do
        echo -ne "\e[44m\033[1;97m \r${bar:0:$i} \033[0;37m" 
        sleep 0.01                 
    done
    space
}

# space
space(){
	echo " "
}

# waybackurls output
wayback()
{
	bar=" Initiating waybackurls..."
	h1_bar
	waybackurls $tar | uniq | sort >url.txt
}

# js files finder
jsf()
{

	bar=" Checking for JS files..."
	h2_bar	
	cat url.txt | grep "\\.js" | uniq | sort
	space
}

# php files finder
phpf(){

	bar=" Checking for php files... "
	h2_bar
	cat url.txt | grep "\\.php" | uniq | sort
	space
}

# json files finder
jsonf(){

	bar=" Checking for json Files... "
	h2_bar
	cat url.txt | grep "\\.json" | uniq | sort
	space

}

# txt files finder
txtf(){

	bar=" Checking for txt Files... "
	h2_bar	
	cat url.txt | grep "\\.txt" | uniq | sort 
	space
}

# usage
usage(){
	echo -e "\e[41m\033[1;97m Usage \033[0;37m"
    cat << EOF
	No inputs supplied please check the usage as below 👇 
	run: ./ffrun.sh <target>
	Output to files : ./ffrun.sh <target> -o

EOF
   exit 1
}


#main func	
main ()
{
	wayback
	jsf
	phpf
	jsonf
	txtf	
}


# Validate input
if [ $# -eq 0 ]
then
    usage
    exit -1
else
    tar=$1
    main
fi

if [ "$2" = "-o" ]; then
	mkdir ffresults
	cat url.txt | grep "\\.js" | uniq | sort >ffresults/js.txt
  	cat url.txt | grep "\\.php" | uniq | sort >ffresults/php.txt
  	cat url.txt | grep "\\.json" | uniq | sort >ffresults/json.txt
  	cat url.txt | grep "\\.txt" | uniq | sort >ffresults/txt.txt
	fi
