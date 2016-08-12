#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pandas as pd
import webbrowser as wb
from io import StringIO
import argparse
import prettytable

parser = argparse.ArgumentParser()
parser.add_argument("tag", 
                    help="print the name and tag")
parser.add_argument('-o', '--open', action='store',dest='open',
                    type=int, help="open the url")
args = parser.parse_args()
n = args.open

df = pd.read_json('.pinboard_data.json')
df1 = df.loc[:,['description','href','tags','time']]
df1['description'] = df1.description.str.wrap(20)
df1['description'] = df1.description.apply(lambda x: x[:20])
df1['tags'] = df1.tags.apply(str.lower)

if len(args.tag) <= 2:
	df2 = df1[df1.tags.str.contains(args.tag, na=False)]
else:
	df2 = df1[df1.tags.str.contains(args.tag, na=False)|
		  	  df1.href.str.contains(args.tag, na=False)]

count = df2.iloc[:,0].count()
df2.index = range(count)


output = StringIO()
df2.loc[:,['description','tags']].to_csv(output, header=['站名','标签'])
output.seek(0)
pt = prettytable.from_csv(output)

if args.open == None:
	print(pt)
else:
	href = df2['href'].iloc[n]
	wb.open_new_tab(href)


