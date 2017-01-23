# A Web Server handling messages for database 
A Web Server Implementation based upon the specification given in a test.

## Usage

This Web Server powered with Chichago Boss which is written in Erlang. 
Install Erlang with 

```js
//  (Ubuntu / Debian)
sudo apt-get install erlang (Ubuntu / Debian)
//  (Mac)
brew install erlang
```

```js
git clone https://github.com/ebadali/Currency-Fair-Test.git
cd Currency-Fair-Test

// For Development
./init-dev.sh

// For Production
./init.sh start
```


## API

#### 1. `record(payload)`

Add Each Transactions/Trade Messages to the Database, and Render the List Of all the Transactions.
##### Method
POST
##### Url Params
None
##### Data Params

`{"userId": "134256", "currencyFrom": "EUR", "currencyTo": "GBP", "amountSell": 1000, "amountBuy": 747.10, "rate": 0.7471, "timePlaced" : "24-JAN-15 10:27:44", "originatingCountry" : "FR"}`

##### Example

`curl --request POST \
  --url http://localhost:8001/transactions/record \
  --header 'cache-control: no-cache' \
  --header 'content-type: application/json' \
  --header 'postman-token: 3b6ae7eb-722c-1a96-3254-54de50090a6c' \
  --data '{"userId": "21", "currencyFrom": "EUR", "currencyTo": "GBP", "amountSell": 1000, "amountBuy": 747.10, \n"rate": 0.87, "timePlaced" : "24-JAN-15 10:27:44", "originatingCountry" : "FR"}'`

##### Responce:
* Success:
  * code `200`
  * content
  
| UserId  | CurrencyFrom |CurrencyTo | AmountSell |AmountBuy  | Rate |     TimePlaced     | OriginatingCountry|
|---------|--------------|-----------|------------|-----------|------|--------------------|-------------------|
| 134256  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |
| 134257  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |
| 134258  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |
| 134259  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |

* Failure:
  * code `200'  
  * content `{"status":"failure","error":"Invalid {Parameter}"}`

##### 2. `list()`

Extract all the transactions from the databse and Render it on the template.

##### Method
GET
##### Url Params
None
##### Data Params
None
##### Example
curl --request GET \
  --url http://localhost:8001/home/list \
  --header 'cache-control: no-cache' \
  --header 'postman-token: 39352a2e-fc3e-dc97-8125-f9506097aa26'

##### Responce:
* Success:
  * code `200`
  *  content
  
| UserId  | CurrencyFrom |CurrencyTo | AmountSell |AmountBuy  | Rate |     TimePlaced     | OriginatingCountry|
|---------|--------------|-----------|------------|-----------|------|--------------------|-------------------|
| 134256  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |
| 134257  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |
| 134258  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |
| 134259  |     EUR      |     GBP   |    1000    |    747.1  |0.7471| 24-JAN-15 10:27:44 |         FR        |

* Failure:
  * code `200`
  * content `{"status":"failure","error":"Invalid Request 404"}`



