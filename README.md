# pinboard_search_cli

## Download

Get the latest version of pinboard_search_cli

```shell
$ git clone https://github.com/scottming/pinboard_search_cli.git
```

Decorator package is required for pinboard_search_cli.

```shell
pip install pinboard pandas prettytable
```

## Usage

pinboard_search_cli search Pinboard bookmarks from local data. So, after you install the decorator packages use Python2, do

```shell
$ pinboard api-token # Only the first time
$ ./pb -us 
```
to update your local data.

Other example

```shell
$ ./pb -h
pinboard_search_cli

Usage:
    pb <name> [( , <name>)] [-o <number>...] 
    pb -u

Examples:
    pb linux          # 'linux' is which you search 
    pb linux , git    # Search two tags, note the space before ','
    pb linux -o 0     # Open the first bookmarks

Options:
    -h --help       Show this screen.
    -v --version    Show version
    -u --update     Update the local Pinboard'data
    -o --open       Open bookmarks with ordinal number
```

