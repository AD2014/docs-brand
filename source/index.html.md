---
title: LetLife Brand API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='http://let.life' target='_blank'>LetLife website</a>
  - <a href='https://github.com/AD2014/' target='_blank'>LetLife github</a>

includes:

  - users
  - products
  - notes
  - lifecodes
  - notifications
  - stats
  - errors

search: true
---

# Introduction

Welcome to the **LetLife Brand API Reference**. Here you can find the APIs a brand can use to manage its products, notifications, analytics and so on.

<aside class="notice">
    Those docs are intended for Brand Users, in order to consume those endpoints you need to have a
    user with valid permissions.
</aside>

# Conventions And Notes

Docs template has on the left column the section title, on the center the explanation and in the right the example.

Explanation is structured with API endpoints description, the methods allowed, request and reply description.

Example show valid request and reply.

https://api.let.life is a HTTP REST platform where each endpoints communicate in JSON.

# Authentication

```shell
#!/bin/bash
#none
curl -X GET https://api.let.life/RESOURCE_WITHOUT_AUTH

#Client Basic
curl -X GET https://api.let.life/RESOURCE_WITH_BASICAUTH -H "Authorization: Basic _XYZ_"
curl -X GET https://api.let.life/RESOURCE_WITH_BASICAUTH -u _clientId_:_clientSecret_

#Token
curl -k -v -X GET https://api.let.life/RESOURCE_WITH_OAUTH2 -H "Authorization: Bearer _ACCESSTOKEN_"

```


We have different kind of authorization:

- **none:** no authentication

- **Client Basic:** Basic Authentication [RFC2617](https://www.ietf.org/rfc/rfc2617.txt) on client credentials

<aside class="notice">
    HTTP header "Authorization: Basic _XYZ_"

    with _XYZ_ = base64("_clientId_:_clientSecret_")
</aside>

- **Token:**  OAuth2 Bearer Token Authentication [RFC6749](https://www.ietf.org/rfc/rfc6749.txt)

<aside class="notice">
    HTTP header "Authorization: Bearer _ACCESSTOKEN_"

    with _ACCESSTOKEN_ = access_token from login
</aside>


# Authorization

In order to consume some endpoints your _ACCESSTOKEN_'s user need some special permission.

- brand.manager: The brand administrator


## /auth/token

```shell
#!/bin/bash
#######################################################
################ GET A TOKEN ##########################

curl -v https://api.let.life/auth/token -H "Content-Type: application/json" -u test-oauth-client:test-oauth-client --data '{"grant_type": "password", "username": "p.nicorelli@gmail.com", "password": "cansacchi12"}'

## On Success `HTTP/1.1 200 OK`
## {
##   "access_token": "wswcjildf5hujhasqrulf4vwusan6qb546umqg2b",
##   "refresh_token": "ecdme19kiqje9qj9ho2qjp0uogp880hhsrsb9y8n",
##   "token_type": "Bearer"
## }

###########################################################
################ REFRESH A TOKEN ##########################
curl -k https://api.let.life/auth/token -H "Content-Type: application/json" -u test-oauth-client:test-oauth-client --data '{"grant_type": "refresh_token", "refresh_token": "ecdme19kiqje9qj9ho2qjp0uogp880hhsrsb9y8n"}'

## On Success `HTTP/1.1 200 OK`
## {
##   "access_token": "gihldjp6g7fs1vpkj7c6rgqlhghcgy8j5isi7a5g",
##   "refresh_token": "ecdme19kiqje9qj9ho2qjp0uogp880hhsrsb9y8n",
##   "token_type": "Bearer"
## }
```

OAuth2 endpoint. It can serve access token  and refresh an access_token


### HTTP Request

`POST /auth/token`

*Auth: Client Basic*

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
grant_type | yes | String, must be *password* for user login or *refresh_token* for refresh token request
username| only for `password` grant_type | the user email
password| only for `password` grant_type | the user password
refresh_token| only for `refresh_token` grant_type | the token used for refresh the access token when expire

### Response Code

| Code | Meaning |
| ---- | ------- |
| 200  | Success|
| 401  | Unauthorized|
| 500  | Something goes wrong, better explain in param *message*|
