# FileFetcher
Fetches js, json, php, txt file from a list of URLS from waybackurls output.

## prerequisite
- [waybackurls](https://github.com/tomnomnom/waybackurls)

## Usage
### To run single Target 
```sh
./ffrun.sh <target>
```

### To run urls from file without running [waybackurls](https://github.com/tomnomnom/waybackurls)
```sh
./ffrun.sh urls.txt
```

### To export results to files
```sh
./ffrun.sh <target> -o
./ffrun.sh urls.txt -o
```
