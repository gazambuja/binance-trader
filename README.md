# Binance Trader [MZ Fork by Mark & FitzZZ]

This is an experimental bot for auto trading the binance.com exchange. 

Visit us on Discord [here](https://discord.gg/zQZNmbB)!

![Screenshot](https://github.com/yasinkuyu/binance-trader/blob/master/img/screenshot.png)

## Configuration

1. Signup for Binance ([here](https://www.binance.com/?ref=16671900))
2. Enable Two-factor Authentication    
3. Go [API Center](https://www.binance.com/userCenter/createApi.html)
4. Create New Key

        [✓] Read Info [✓] Enable Trading [X] Enable Withdrawals 
5. Rename config.sample.py to config.py AND orders.sample.db to orders.db
6. Get an API and Secret Key, insert into config.py. Don't touch the orders.db.

        API key for account access
        api_key = ''
        Secret key for account access
        api_secret = ''

7. Optional: run as an excutable application in Docker containers
8. Send a small tip to the creators if it works for you :-)

## Requirements

    sudo easy_install -U requests
    or 
    sudo pip install requests
    
    Python 2.7
        import os
        import sys
        import time
        import datetime
        import config
        import argparse
        import threading
        import sqlite3

    Reportedly also works with Python 3.X.

## Usage

    python trader.py --symbol XVGBTC
    
    Example parameters
    
    # Profit mode (default)
    python trader.py --symbol XVGBTC --quantity 300 --profit 1.3
    or by amount
    python trader.py --symbol XVGBTC --amount 0.0022 --profit 3
    
    # Range mode
    python trader.py --symbol XVGBTC --mode range --quantity 300 --buyprice 0.00000780 --sellprice 0.00000790
    or by amount
    python trader.py --symbol XVGBTC --mode range --amount 0.0022 --buyprice 0.00000780 --sellprice 0.00000790
    
    --quantity     Buy/Sell Quantity (default 0)
    --amount       Buy/Sell BTC Amount (default 0.0022)
    --max_amount   Buy/Sell using max BTC amount (default False)
    --symbol       Market Symbol (Ex. XVGBTC or TRXETH)
    --profit       Target Profit Percentage (default 2)
    --stop_loss    Decrease sell price at loss Percentage (default 0)
    --orderid      Target Order Id (default 0)
    --wait_time    Wait Time (seconds) (default 0.7)
    --increasing   Buy Price Increasing Percentage  +(default 0.2)
    --decreasing   Sell Price Decreasing Percentage -(default 0.2)
    --prints       Scanning Profit Screen Print (default True)
    --loop         Loop (default 0 unlimited)
    
    --mode         Working modes profit or range (default profit)
                   profit: Profit Hunter. Find defined profit, buy and sell. (Ex: 1.3% profit)
                   range: Between target two price, buy and sell. (Ex: <= 0.00000780 buy - >= 0.00000790 sell )
    --buyprice     Buy price (Ex: 0.00000780)
    --sellprice    Buy price (Ex: 0.00000790)

    Symbol structure;
        XXXBTC  (Bitcoin)
        XXXETH  (Ethereum)
        XXXBNB  (Binance Coin)
        XXXUSDT (Tether)

    All binance symbols are supported.

    Every coin can be different in --profit and --quantity.

    If quantity is empty --quantity is automatically calculated to the minimum qty.
    If --stop_loss is 0. It will hold the coin until it's sold with the desired amount.

    Set --max_amount True to use all BTC amount upon setting buy order

    Variations;
        trader.py --symbol TBNBTC --quantity 50 --profit 3
        trader.py --symbol NEOBTC --amount 0.1 --profit 1.1
        trader.py --symbol ETHUSDT --quantity 0.3 --profit 1.5
        ...
    
## Run in a Docker container

    docker build -t trader .

    docker run trader
 
## Tip the fork maintainers

#### Mark:
To be added...
#### FitzZZ:
If you want to support my work or just leave a little thanks, I'd appreciate a small donation towards my coffee fund :-) 

  - BTC: 1KtsAMGCkJPv3R8fa2zCxznB3PhdSPDf9d
  - ETH: 0x4c336e3ea18756bef54d9d022a5788352304dbed
  - LTC: LZaWAVX35qsiYyG7VVvpwg7n9browvm3Kw

Wanna get into crypto:
- [Coinbase](https://www.coinbase.com/join/5a383d1dada1050742ff705a) to buy cypto with fiat.
- [Binance](https://www.binance.com/?ref=16671900) is my preferred exchange to trade coins.

## DISCLAIMER

    I am not responsible for anything done with this bot. 
    You use it at your own risk. 
    There are no warranties or guarantees expressed or implied. 
    You assume all responsibility and liability.
     
## Contributing

    Fork this Repo
    Commit your changes (git commit -m 'Add some feature')
    Push to the changes (git push)
    Create a new Pull Request
    
    Thanks all for your contributions...
    
## Failure

    Filter failure: MIN_NOTIONAL
    https://support.binance.com/hc/en-us/articles/115000594711-Trading-Rule

    Filter failure: PRICE_FILTER
    https://github.com/binance-exchange/binance-official-api-docs/blob/master/rest-api.md
    
    Timestamp for this request was 1000ms ahead of the server's time.
    https://github.com/yasinkuyu/binance-trader/issues/63#issuecomment-355857901
    
## Roadmap

    - MACD indicator (buy/sell)
    - Stop-Loss implementation
    - Working modes
      - profit: Find defined profit, buy and sell. (Ex: 1.3% profit)
      - range:  Between target two price, buy and sell. (Ex: <= 0.00100 buy - >= 0.00150 sell )
    - Binance/Bittrex/HitBTC Arbitrage  
    
    ...
    
    - October 7, 2017 Beta
    - January 6, 2018 RC
    - January 15, 2018 RC 1
    - January 20, 2018 RC 2
     
## License

    Code released under the MIT License.

## Credits to original repo dudes
Original idea & code by [@yasinkuyu](https://twitter.com/yasinkuyu)

Tip him: [Yasin](http://yasinkuyu.net/wallet) 

Early Enhancements by [@wespeakcrypto]
Tip him:

BTC wallet: 182Ew6JK9Mspw4BszdBP7RgpdWf6STe46G / LTC wallet: LXgNmMPied4AiGKAsE1kY2M9BRaV3yxDC1 / ETH wallet: 0xed8100b70e15d9fcd53f1d989c67775bf55e4475
