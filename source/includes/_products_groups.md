# Products Groups

Products can be organized in group to make easy categorization

### The ProductGroup object

Parameter   | Type     | Description
---------   | ----     | -----------
name        | String   | the group name


## /v1/brand/:vendorId/groups

```shell
########################################################
################## CREATE A NEW GROUP ##################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer tdsw9mqn57oox4lprfieaubjpam" -X POST https://api-ssl2.let.life/v1/brand/56af2be4c8cd9f460ab0316a/groups -d '{ "group": {"name": "Demo stuff"}}'

## HTTP/1.1 201 Created
## {
##   "group": {
##     "_id": "57ff7be7c3dd7e221090a634",
##     "name": "Demo stuff",
##     "vendorId": "56af2be4c8cd9f460ab0316a"
##   }
## }


########################################################
################## LIST GROUPS #########################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer tdsw9sykxswef90185mqn57oox4lprfieaubjpam" -X GET https://api-ssl2.let.life/v1/brand/56af2be4c8cd9f460ab0316a/groups

## HTTP/1.1 200 OK
## {
##   "groups": [
##     {
##       "_id": "57ff7be7c3dd7e221090a634",
##       "name": "Really cool stuff"
##     },
##     {
##       "_id": "57ff7c0ec3dd7e221090a635",
##       "name": "Demo stuff"
##     }
##   ]
## }
```

This endpoint is used for CREATE and LIST products groups.

The LIST is a full list (no pagination, no filters)

### HTTP METHODS

`POST /v1/brand/:vendorId/product`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

#### POST Parameters

Parameter | Type      | Required | Description
--------- | --------- | -------- | -----------
vendorId  |  ObjectId |  yes     | the vendorId
group     |  Object   |  yes     | a valid Group Object


`GET /v1/brand/:vendorId/product`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

#### GET Parameters

Parameter | Type      | Required | Description
--------- | --------- | -------- | -----------
vendorId  |  ObjectId |  yes     | the vendorId


#### Response Code

| Code | Data                         | Description
| ---- | ---------------------------- | -------
|201   | { "group": Group }           | POST Successful reply, Group is the Object created.
|200   | { "groups": [ Groups ] }     | GET Successful reply. [Group] is an array of groups.
|40x   | { "message": string }        | Generic error.
|401   | Unauthorized                 | Token missing/expired/invalid etc.




























## /v1/brand/:vendorId/groups/:groupId

```shell
########################################################
################## UPDATE A NEW GROUP ##################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer tdsw9sykxswef90185mqn57oox4lprfieaubjpam" -X PUT https://api-ssl2.let.life/v1/brand/56af2be4c8cd9f460ab0316a/groups/57ff7be7c3dd7e221090a634 -d '{"group": {"name": "Wonderful stuff"}}'

## HTTP/1.1 200 OK
## {
##   "group": {
##     "_id": "57ff7be7c3dd7e221090a634",
##     "name": "Wonderful stuff",
##   }
## }


#########################################################
################## DELETE GROUP #########################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer tdsw9sykxswef90185mqn57oox4lprfieaubjpam" -X DELETE https://api-ssl2.let.life/v1/brand/56af2be4c8cd9f460ab0316a/groups/57ff7be7c3dd7e221090a634

## HTTP/1.1 204 No Content

```

This endpoint is used for UPDATE and DELETE a single group.


### HTTP METHODS

`PUT /v1/brand/:vendorId/groups/:groupId`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

#### PUT Parameters

Parameter | Type      | Required | Description
--------- | --------- | -------- | -----------
vendorId  |  ObjectId |  yes     | the vendorId
groupId   |  ObjectId |  yes     | the groupId
group     |  Object   |  yes     | a valid Group Object


`DELETE /v1/brand/:vendorId/groups/:groupId`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

#### DELETE Parameters

Parameter | Type      | Required | Description
--------- | --------- | -------- | -----------
vendorId  |  ObjectId |  yes     | the vendorId
groupId   |  ObjectId |  yes     | the groupId


#### Response Code

| Code | Data                         | Description
| ---- | ---------------------------- | -------
|200   | { "group": Group }           | PUT Successful reply, Group is the Object updated.
|205   | empty                        | DELETE Successful reply.
|40x   | { "message": string }        | Generic error.
|401   | Unauthorized                 | Token missing/expired/invalid etc.






















## /v1/brand/:vendorId/groups/:groupId/push


```shell
################################################################
################## INSERT PRODUCTS IN A GROUP ##################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer tdsw9sykxswef90185mqn57oox4lprfieaubjpam" -X PATCH https://api-ssl2.let.life/v1/brand/56af2be4c8cd9f460ab0316a/groups/57ff7c0ec3dd7e221090a635/push -d '{"products": ["56d41afcfafacf191b5c4a30", "56b1def3c49ad4dc55501a58", "56af2ff1c8cd9f460ab03171"]}'

## HTTP/1.1 200 OK
##  {
##    "message":"products added to group",
##    "quantity":3
##  }
```

This endpoint is used for associate products in a group.


### HTTP METHODS

`PATCH /v1/brand/:vendorId/groups/:groupId/push`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

#### PATCH Parameters

Parameter | Type      | Required | Description
--------- | --------- | -------- | -----------
vendorId  |  ObjectId |  yes     | the vendorId
groupId   |  ObjectId |  yes     | the groupId
products  |  [ObjectId]   |  yes     | an array of productIds


#### Response Code

| Code | Data                         | Description
| ---- | ---------------------------- | -------
|200   | { "message": string, "quantity": integer }           | PATCH Successful reply. `message` is a human readable string, quantity rapresent how many products are inserted.
|40x   | { "message": string }        | Generic error.
|401   | Unauthorized                 | Token missing/expired/invalid etc.


















## /v1/brand/:vendorId/groups/:groupId/pull


```shell
################################################################
################## REMOVE PRODUCTS FROM A GROUP ##################
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer tdsw9sykxswef90185mqn57oox4lprfieaubjpam" -X PATCH https://api-ssl2.let.life/v1/brand/56af2be4c8cd9f460ab0316a/groups/57ff7c0ec3dd7e221090a635/pull -d '{"products": ["56d41afcfafacf191b5c4a30", "56b1def3c49ad4dc55501a58"]}'

## HTTP/1.1 200 OK
##  {
##    "message": "products removed from group",
##    "quantity": 2
##  }
```

This endpoint is used for remove products from a group.


### HTTP METHODS

`PATCH /v1/brand/:vendorId/groups/:groupId/pull`

**Auth**: *Token* + *brand.manager* permission

**Content-Type**: *application/json*

#### PATCH Parameters

Parameter | Type      | Required | Description
--------- | --------- | -------- | -----------
vendorId  |  ObjectId |  yes     | the vendorId
groupId   |  ObjectId |  yes     | the groupId
products  |  [ObjectId]   |  yes     | an array of productIds


#### Response Code

| Code | Data                         | Description
| ---- | ---------------------------- | -------
|200   | { "message": string, "quantity": integer }           | PATCH Successful reply. `message` is a human readable string, quantity rapresent how many products are inserted.
|40x   | { "message": string }        | Generic error.
|401   | Unauthorized                 | Token missing/expired/invalid etc.
