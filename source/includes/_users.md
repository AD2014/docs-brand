# Users

A Brand can have many users associated.

Endpoints here are used to manage users in the brand.

## /users

```shell
#!/bin/bash
#########################################################
################ LIST ALL BRAND'S USERS  ################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer w34938e4k1lg7yb5thomtwjkddd5n9nd1mmhlpcc" -X GET https://api.let.life/v1/brand/555c3bfca0dc5b96c3b7acb2/users

## On Success ``HTTP/1.1 200 OK``
## {
##     "data": [
##         {
##             "_id": "54f9e09d3e4be0b72e6f2a67",
##             "email": "user1@email.com",
##             "phoneNumber": "+393878159692",
##             "createdAt": "2015-03-06T17:15:09.043Z",
##             "last": "lastname",
##             "first": "surname",
##             "verified": false
##         },
##         {
##             "_id": "54f9e09d3e4be0b72e6f2a58",
##             "email": "user2@email.com",
##             "phoneNumber": "",
##             "createdAt": "2015-03-07T17:15:09.043Z",
##             "last": "lastname",
##             "first": "surname",
##             "verified": false
##         }
##     ],
##     "total": 2,
##     "page": 1,
##     "per_page": 50
## }


#########################################################
################ LIST ALL BRAND'S USERS  ################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer w34938e4k1lg7yb5thomtwjkddd5n9nd1mmhlpcc" -X POST https://api.let.life/v1/brand/555c3bfca0dc5b96c3b7acb2/users --data '{ "user": {"first": "marlon", "last": "brando", "password": "IWillSurvive", "email": "w.kurtz@army.us"}}'

## On Success ``HTTP/1.1 201 OK``
## {
##    "message": "user created"
## }
```

This endpoint is used to retrieve all brand users in the `:vendorId` brand and create a new one.

### HTTP Request

`GET /v1/brand/:vendorId/users`

`POST /v1/brand/:vendorId/users`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

### GET Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
vendorId | ObjectId | yes | The brand's ID

### GET Response Code

| Code | Data    | Description
| ---- | ------- | -------
|200   |  	{ "data": array of Users Objects, "total": number, "page": number, "per_page": number }  | GET
|401   | Unauthorized | Token missing/expired/invalid etc.


### POST Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
vendorId | ObjectId | yes | The brand's ID
user | Object | yes | A valid [User](#users) object
permission | string | no | the permission, default to `brand.manager`

### POST Response Code

| Code | Data    | Description
| ---- | ------- | -------
|201   |  	{ "message": string }  | The action response
|401   | Unauthorized | Token missing/expired/invalid etc.











## /users/:userId

```shell
#!/bin/bash
####################################################
################ GET A SINGLE USER  ################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer w34938e4k1lg7yb5thomtwjkddd5n9nd1mmhlpcc" -X GET https://api.let.life/v1/brand/555c3bfca0dc5b96c3b7acb2/users/55ed87c83ee8c9482c96e271

## On Success `HTTP/1.1 201 OK`
## {
##     "user": {
##         "first": "Walter",
##         "last": "Kurtz",
##         "email": "w.kurtz@army.us",
##         "avatar": null
##     }
## }



#######################################################
################ UPDATE A SINGLE USER  ################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer w34938e4k1lg7yb5thomtwjkddd5n9nd1mmhlpcc" -X PUT https://api.let.life/v1/brand/555c3bfca0dc5b96c3b7acb2/users/55ed87c83ee8c9482c96e271 --data '{"user": {"first": "Walter", "last": "Kurtz"}}'

## On Success `HTTP/1.1 201 OK`
## {
##     "message":"user updated"
## }
```

This endpoint read/update the :userId user in the brand

Fields updatable:

- 'first'
- 'last'
- 'phoneNumber'
- 'avatar'
- 'gender'
- 'birthDate'
- 'password'
- 'permissions' (just as a single string)

### HTTP Request

`GET /v1/brand/:vendorId/users/:userId`

`PUT /v1/brand/:vendorId/users/:userId`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
vendorId | ObjectId | yes | The brand's ID
userId | ObjectId | yes | The user's ID
user | Object | only for PUT | A valid [User](#users) object

### Response Code

| Code | Data    | Description
| ---- | ------- | -------
|200   |  	{ "user": Object }  | (GET ONLY) The user detail
|200   |  	{ "message": string }  | (PUT ONLY) The action message
|404   | { "message": string }  | User not Found
|401   | Unauthorized | Token missing/expired/invalid etc.










## /users/:email/hire

```shell
#########################################################
################ HIRE A USER ON LETLIFE  ################
curl -v -k -H "Content-Type: application/json" -H "Authorization: Bearer w34938e4k1lg7yb5thomtwjkddd5n9nd1mmhlpcc" -X PATCH https://api.let.life/v1/brand/555c3bfca0dc5b96c3b7acb2/users/stuart@minions.mi/hire

## On Success ``HTTP/1.1 200 OK``
## {
##     "message":"user hired"
## }
```


This endpoint is used hire a user by mail in the `:vendorId` brand.

### HTTP Request

`PATCH /v1/brand/:vendorId/users/:email/hire`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

### Query Parameters

Parameter  | Type | Required | Description
---------  | ---- | -------- | -----------
vendorId   | ObjectId | yes | The brand's ID
email      | string | yes | The user email
permission | string | no | the permission, default to `brand.manager`

### Response Code

| Code | Data    | Description
| ---- | ------- | -------
|200   |  	{ "message": string }  | the message
|404   | { "messages": string }  | usually 'User not Found'
|401   | Unauthorized | Token missing/expired/invalid etc.













## /users/:email/fire

```shell
#############################################################
################ FIRE A USER FROM THE BRAND  ################
curl -v -k -H "Content-Type: application/json" -H "Authorization: Bearer w34938e4k1lg7yb5thomtwjkddd5n9nd1mmhlpcc" -X PATCH https://api.let.life/v1/brand/555c3bfca0dc5b96c3b7acb2/users/stuart@minions.mi/fire

## On Success ``HTTP/1.1 200 OK``
## {
##     "message":"user fired"
## }
```


This endpoint is used remove a user by mail from the `:vendorId` brand.

### HTTP Request

`PATCH /v1/brand/:vendorId/users/:email/fire`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
vendorId | ObjectId | yes | The brand's ID
email | string | yes | The user email
permission | string | no | the permission, default to `brand.manager`

### Response Code

| Code | Data    | Description
| ---- | ------- | -------
|200   |  	{ "message": string }  | the message
|404   | { "messages": string }  | usually 'User not Found'
|401   | Unauthorized | Token missing/expired/invalid etc.
