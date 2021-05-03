![img](https://github.com/thevillagehacker/thevillagehacker/blob/master/Do%20Hacks%20to%20Secure.png)

# FileFetcher
Fetches js, json, php, txt file from a list of URLS from waybackurls output.

## prerequisite
- [waybackurls](https://github.com/tomnomnom/waybackurls)

## Usage
## Usage
```sh
chmod +x fetcher.sh
```

### To run fetcher against domain as input 
```sh
./fetcher.sh -d example.com
```

### To fetch endpoints from input file which contains URLs
```sh
./fetcher.sh -f url.txt
```

#### Note
All Output results are stored separately in results folder
