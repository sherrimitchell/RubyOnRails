# API

## Overview

All access is over HTTPS, and access from the "WHATEVER URL" domain. All data is sent and received as JSON.

## Access Token

Every request requires an authentication token to be provided in the header.

To do this make sure you set 'Access-Token' equal to the user's access token in every request except for SIGNUP and LOGIN.

```
['Access-Token'] = 'f16395873f4bcee7ef5d46e531b9f659'
```

## Sign up and Login

### New user registration

Path:

`POST '/users/register'`

Parameters:

| name       | type   | description                              |
|------------|--------|------------------------------------------|
| user_name   | string | username for user to be created          |
| password   | string | password has to be at least 8 characters |
| first_name | string | first name of user to be created         |
| last_name  | string | last name of user to be created          |
| email      | string | email of user to be created              |


Example data successful response:

```json
Response Status Code: 201

{
  "user_name": "whatever",
  "access_token": "f16395873f4bcee7ef5d46e531b9f659f16395873f4bcee7ef5d46e531b9f659",
  "first_name": "John",
  "last_name": "Doe",
  "email": "johndoe@gmail.com"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### User login

Path:

`POST '/users/login'`

Parameters:

| name     | type   | description                                                 |
|----------|--------|-------------------------------------------------------------|
| user_name | string | username for the user you want get authentication key for   |
| password | string | password for the user you want get authentication token for |

Example data successful response:

```json
Response Status Code: 200 (TBD)

{
  "user_name": "whatever",
  "access_token": "102931afffksdfjklss"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

## Posts

### Create post

Path: 

`POST '/posts'`

Parameters

| name      | type   | description                            |
|-----------|--------|----------------------------------------|
| image_url | string | url for the image of the post          |
| answer    | string | answer for the post                    |

Example data successful response:

```json
Response Status Code: 201

{
	"image_url": "http://whatever.com/image.jpg",
	"user_name": "whatever",
	"answer": "This is the answer"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### Show a specific post of the current user

Path:

`GET '/posts/:id'`

Example data successful response:

```json
Response Status Code: 200

{
  "post_id": 33,
  "user_name": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/33"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### List all of posts from current user

Path: 

`GET '/posts'`

Example data successful response:

```json
Response Status Code: 200

[
{
  "post_id": 33,
  "user_name": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/33"
}
{
  "post_id": 34,
  "user_name": "whatever",
  "image_url": "http://whatever.com/image2.jpg",
  "post_url": "/posts/34"
}
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### Lists of posts from all users

Path:

`GET '/posts/all'`

Parameters:

| name | type    | description             |
|------|---------|-------------------------|
| page | integer | NOT CURRENTLY SUPPORTED |

Example data successful response:

```json
Response Status Code: 200

[
{
  "post_id": 1,
  "user_name": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/1",
  "guessed": true,
  "guessed_by": "heynowbrowncow"
}
{
  "post_id": 55,
  "user_name": "bestusernamever",
  "image_url": "http://whatever.com/image11.jpg",
  "post_url": "/posts/55",
  "guessed": false,
  "guessed_by": null
}
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

## Guesses

### User can guess

Path: 

`POST '/posts/:post_id'`

Parameters:

| name  | type   | description                            |
|-------|--------|----------------------------------------|
| guess | string | guess on the post                      |

Example data successful response:

```json
Response Status Code: 201

{
  "user_name": "whatever",
  "link_id": 22,
  "guesses_left": 3,
  "won": false
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

## Scoreboard

### Get top 10 users for all time

Path: 

`GET '/topscores'`

Example data successful response:

```json
Response Status Code: 200

[
{
  "user_name": "whatever",
  "score": 20
}
{
  "user_name": "anotheruser",
  "score": 40
}
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```