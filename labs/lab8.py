import requests, re
from bs4 import BeautifulSoup

data  = requests.get("https://www.nintendo.com/us/store/products/super-mario-bros-wonder-118640/").content  
soup = BeautifulSoup(data, 'html.parser')  

span = soup.find("h1", {"class":"Headingstyles__StyledH-sc-s17bth-0 eQifGC"})  
title = span.text 

span = soup.find("span", {"class":"ScreenReaderOnlystyles__StyledReaderText-sc-1gv8hi6-0 lnGtBM Pricestyles__ScreenReaderOnly-sc-1f0n8u6-2 cKRBkt"})  
price = span.text

print("Item %s has price %s" % (title, price)) 
