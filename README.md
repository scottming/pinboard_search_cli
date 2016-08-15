# pinboard_search_cli

## Download

Get the latest version of pinboard_search_cli

```shell
$ git clone https://github.com/scottming/pinboard_search_cli.git
```

Decorator packages are required for pinboard_search_cli.

```shell
$ pip install pinboard pandas prettytable docopt
```

## Usage

pinboard_search_cli searches Pinboard bookmarks from local data. After installing the decorator packages, use

```shell
$ pinboard api-token # Only the first time
$ ./pb -u
```
to update your local data.

Other examples

```shell
$ ./pb -h
pinboard_search_cli

Usage:
    pb <name> [( , <name>)] [-o <number>...] 
    pb -u

Examples:
    pb linux          # 'linux' is what you search 
    pb linux , git    # Search two tags, notice the space before ','
    pb linux -o 0     # Open the first bookmark

Options:
    -h --help       Show this screen.
    -v --version    Show version
    -u --update     Update the local Pinboard's data
    -o --open       Open bookmarks with ordinal number
```

