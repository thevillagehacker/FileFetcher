#!/bin/bash

# version
version=2.0

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

# space
space(){
	echo " "
}

# H1 Initiation bar
h1_bar() {  
    for i in {1..60}; do
        echo -ne "\e[41m\033[1;97m \r${bar:0:$i} \033[0;97m" 
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


# waybackurls 
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
	cat url.txt | grep "\\.js" | uniq | sort | tee results/js.txt
	space
}

# php files finder
phpf(){

	bar=" Checking for php files... "
	h2_bar
	cat url.txt | grep "\\.php" | uniq | sort | tee results/php.txt
	space
}

# json files finder
jsonf(){

	bar=" Checking for json Files... "
	h2_bar
	cat url.txt | grep "\\.json" | uniq | sort | tee results/json.txt
	space

}

# txt files finder
txtf(){

	bar=" Checking for txt Files... "
	h2_bar	
	cat url.txt | grep "\\.txt" | uniq | sort | tee results/text.txt
	space
}

# other sensitive files 
pdf(){

	bar=" Checking for other sensitive Files... "
	h2_bar	
	cat url.txt | grep -E "\\.pdf|\\.xlsx|\\.csv|\\.docx" | uniq | sort | tee results/other_sensitive.txt
	space
}


# usage
usage(){
	echo -e "\e[41m\033[1;97m Usage \033[0;37m"
    cat << EOF
	No inputs supplied please check the usage as below 👇 
	Target as domain: ./fetcher.sh -d <target_domain>
	Target as file  : ./fetcher.sh -f <input_url_file>
	

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
	pdf
	echo -e "\e[5m\e[42m\033[1;97m Completed \033[0;37m"	
}

# validate inputs
if [ "$1" = "-d" ]; then
	tar=$2
	main
elif [ "$1" = "-f" ]; then
	tar=$2	
	cat $2 | grep "\\.js" | uniq | sort >results/js.txt
	cat $2 | grep "\\.json" | uniq | sort >results/json.txt
	cat $2 | grep "\\.php" | uniq | sort >results/php.txt
	cat $2 | grep "\\.txt" | uniq | sort >results/text.txt
	cat url.txt | grep -E "\\.pdf|\\.xlsx|\\.csv|\\.docx" | uniq | sort | tee results/other_sensitive.txt
	echo -e "\e[5m\e[42m\033[1;97m Completed \033[0;37m"
	else
		usage

fi
