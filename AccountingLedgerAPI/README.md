# API EndPoints
When the application is running it will start listening for HTTP requests at the base url `http://localhost:8080`. Here is a list that briefly describes each endpoint:
- [Login In As an Existing User](#login-in-as-an-existing-user)
- [Register As a New User](#register-as-a-new-user)
- [Getting a Users Profile](#getting-a-users-profile)
- [Editing a Users Profile](#editing-a-users-profile)
- [Adding a Transaction](#adding-a-transaction)
- [Viewing the Ledger](#viewing-the-ledger)
- [Searching a Transaction](#searching-a-transaction)
- [Getting Deposits](#getting-deposits)
- [Getting Payments](#getting-payments)
- [Month To Date Report](#month-to-date-report)
- [Previous Month Report](#previous-month-report)
- [Year To Date Report](#year-to-date-report)
- [Previous Year Report](#previous-year-report)
- [Search By Vendor Report](#search-by-vendor-report)

---
### Login In As An Existing User
Request
```
URL  : http://localhost:8080/login
TYPE : POST
BODY :
{
  "username" : "[users username]",
  "password" : "[users password]"
}
```
Response
```
CODE : 200 OK
BODY :
{
  "token" : "[generated token]",
  "user": {
        "id": [users id],
        "username": "[users username]",
        "authorities": [
            {
                "name": "[users role]"
            }
        ]
    }
}
```
---
### Register As A New User
Request
```
URL  : http://localhost:8080/register
TYPE : POST
BODY :
{
  "username" : "[users username]",
  "password" : "[users password]",
  "confirmPassword" : "[users password]",
  "role" : "[users role]" (USER/ADMIN)
}
```
Response
```
CODE : 201 CREATED
BODY :
{
  "id" : [users id],
  "username" : "[users username]",
  "authorities" : [
        {
          "name" : "[users role]" (ROLE_USER/ROLE_ADMIN)
        }
  ]
}
```
---
### Getting A Users Profile
Request
```
URL  : http://localhost:8080/profile
TYPE : GET
BODY : NULL
```
Response
```
CODE : 200 OK
BODY :
{
    "userId": [users id],
    "firstName": "",
    "lastName": "",
    "email": ""
}
```
---
### Editing A Users Profile
Request
```
URL  : http://localhost:8080/profile
TYPE : PUT
BODY :
{
    "userId": [users id],
    "firstName": "[users new fist name]",
    "lastName": "[users new last name]",
    "email": "[users new email]",
}
```
Response
```
CODE : 200 OK
BODY :
{
    "userId": [users id],
    "firstName": "[users new fist name]",
    "lastName": "[users new last name]",
    "email": "[users new email]",
}
```
---
### Adding a Transaction
Request
```
URL  : http://localhost:8080/transaction
TYPE : POST
BODY :
{
  "date" : "[date when transaction was processed in YYYY/MM/SS format]",
  "time" : "[time when transaction was processed in HH:mm:ss format]",
  "description" : "[description of transaction]",
  "vendor" : "[vendor of transaction]"
  "amount" : [amount being added/taken out]
}
```
Response
```
CODE : 201 CREATED
BODY :
{
  "id" : "[transaction id]",
  "userId" : "[user id]",
  "date" : "[date when transaction was processed in YYYY/MM/SS format]",
  "time" : "[time when transaction was processed in HH:mm:ss format]",
  "description" : "[description of the transaction]",
  "vendor" : "[where the money the money is going/coming from]"
  "amount" : [amount being added/taken out] 
}
```
---
### Viewing the Ledger
Request
```
URL  : http://localhost:8080/ledger
TYPE : GET
BODY : NULL
```
Response
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount being added/taken out] 
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount being added/taken out] 
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount being added/taken out] 
    },
...
 ]
```
---
### Searching a Transaction
Request
Notes: the start and end dates are strings
```
URL  : http://localhost:8080/transaction?start=[YYYY-MM-DD]&end=[YYYY-MM-DD]&description=[string]&vendor=[string]&min=[number]&max=[number]
TYPE : GET
BODY : null
```
Response
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount being added/taken out] 
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount being added/taken out] 
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount being added/taken out] 
    },
...
 ]
```
---
### Getting Deposits
Request
```
URL  : http://localhost:8080/transaction/deposits
TYPE : GET
BODY : NULL
```
Response
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount] 
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount] 
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount] 
    },
...
```
---
### Getting Payments
Request
Note: Payment amounts will be positive
```
URL  : http://localhost:8080/transaction/payments
TYPE : GET
BODY : NULL
```
Response
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
...
```
---
### Month To Date Report
Request
```
URL  : http://localhost:8080/reports/month-to-date
TYPE : GET
BODY : NULL
```
Report
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
...
```
---
### Previous Month Report
Request
```
URL  : http://localhost:8080/reports/previous-month
TYPE : GET
BODY : NULL
```
Report
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
...
```
---
### Year To Date Report
Request
```
URL  : http://localhost:8080/reports/year-to-date
TYPE : GET
BODY : NULL
```
Report
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
...
```
---
### Previous Year Report
Request
```
URL  : http://localhost:8080/reports/previous-year
TYPE : GET
BODY : NULL
```
Report
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
...
```
---
### Search By Vendor Report
Request
NOTE: String is not optional, it is required to search by vendor
```
URL  : http://localhost:8080/reports?vendor=[string]
TYPE : GET
BODY : NULL
```
Report
```
CODE : 200 OK
BODY :
 [
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
    {
      "id" : "[transaction id]",
      "userId" : "[user id]",
      "date" : "[date when transaction was processed in YYYY/MM/SS format]",
      "time" : "[time when transaction was processed in HH:mm:ss format]",
      "description" : "[description of the transaction]",
      "vendor" : "[where the money the money is going/coming from]"
      "amount" : [amount (positive)]
    },
...
```
