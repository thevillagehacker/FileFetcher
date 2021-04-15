# FileFetcher
Fetches js, json, php, txt file from a list of URLS from waybackurls output.

## prerequisite
- [waybackurls]()

## Usage
### To run single Target 
```sh
./ffrun.sh <target>
```

### To run urls from file without running waybackurls
```sh
./ffrun.sh urls.txt
```

### To export results to files
```sh
./ffrun.sh <target> -o
./ffrun.sh urls.txt -o
```
