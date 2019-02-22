Strategy using spread between near and far futures with one asset in the basis

==============================================================================

INSTALLATION
------------

Just run .Rmd file.
In scripn needs specify the directory where you work 


REQUIREMENTS
------------

R 3.5 and hidher
RStudio 1.1.463 and hidher

Packeges:
RCurl - Download data from web
zoo - Correct NA data
ggplot2 - Plots
tseries - Statistical test
formattable - Correct data
dplyr - data manipulation

DESCRIPTION
------------
This strategy used futures contracts presented on the Moscow exchange.
All data will download from Moscow exchange site: moex.com
There are regular queries on the url.
The url may change in the future. 
If they change and you need to get them, email me and I will fix script everything soon.
This strategy did not take into account:
1) Commissions;
2) Bid/Ask Spread;
3) The discount rate of the Central Bank of Russia;
4) Possibility to use other financial instruments and opportunity costs.


Any comments and suggestions are welcome auriliano@live.com.
