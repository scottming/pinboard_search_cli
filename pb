#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""pinboard_search_cli

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
    -u --update     Update the local Pinboard'data
    -o --open       Open bookmarks with ordinal number
"""

from docopt import docopt
import io
import os
import pandas as pd
import prettytable

if __name__ == '__main__':
    arguments = docopt(__doc__, version='pinboard_search_cli 0.2')

if arguments['--update'] == True:
    a = os.system('pinboard bookmarks > ~/.pinboard_data.json')
    print('Update Done!')

else:
    df = pd.read_json('~/.pinboard_data.json')
    df1 = df.loc[:,['description','href','tags','time']]

    # Select the first 20 characters
    df1['description'] = df1.description.str.wrap(20)
    df1['description'] = df1.description.apply(lambda x: x[:20])
    df1['tags'] = df.tags.apply(lambda x: str(x.encode('utf-8')))
    df1['tags'] = df1.tags.apply(str.lower) #  Make the tags to lower
    
    pattern = '|'.join(arguments['<name>'])
    df2 = df1[df1.tags.str.contains(pattern, na=False)|
              df1.href.str.contains(pattern, na=False)]

    # Change the index
    count = df2.iloc[:,0].count()
    df2.index = range(count)
    
    # Print a pretty table
    output = io.BytesIO()
    df2.loc[:,['description','tags']].to_csv(output, 
                encoding='utf-8', header=['站名','标签'])
    output.seek(0)
    pt = prettytable.from_csv(output)

    if arguments['--open'] == False:
        print(pt)
    else:
        n = [int(i) for i in arguments['<number>']]
        href = df2['href'].iloc[n]
        for i in list(href.values):
            os.system('open %s' % i)
