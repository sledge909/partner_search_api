# Welcome to the Partner Search API

## Setup

    $ git clone https://github.com/sledge909/partner_search_api.git
    $ cd partner_search_api/

## Starting the application

    $ bundle install
    $ rake db:setup

## Then to run the app

    $ bundle exec puma

## Testing

This application uses `RSpec` to test.

    $ bundle exec rspec

## Endpoints and Example Requests

rake db:setup will add five Partners to the database. Four of these are within close proximity of the address in the example request, one of them is far away.

#### Flooring Partners Search - `/api/v1/flooring_partners`

Requesting partners with wood experience:
```
http://www.localhost:3000/api/v1/flooring_partners?material[]=wood&address=53.4395239881789,%20-2.279771257076178&square_meters=100&phone_number=07494451935
```
Requesting partners with wood and carpet experience:
```
http://www.localhost:3000/api/v1/flooring_partners?material[]=wood&material[]=carpet&address=53.4395239881789,%20-2.279771257076178&square_meters=100&phone_number=07494451935
```
Requesting partners with carpet experience:
```
http://www.localhost:3000/api/v1/flooring_partners?material[]=carpet&address=53.4395239881789,%20-2.279771257076178&square_meters=100&phone_number=07494451935
```

#### Flooring Partners Show - `/api/v1/flooring_partners/<id>`
```
http://www.localhost:3000/api/v1/flooring_partners/3
```

## Notes

I specifically used as few gems as possible. The ones I did use are factorybot and simple cov for testing, geocoder and lastly structural, which is a super convenient gem that was developed by some of my colleagues to convert the params hash into an object with methods.

With reusability in mind, I made the code in the PartnersSearchService and everything behind that reusable. I approached this like I was building a new app and without knowing anything about the future of the app, I wanted the PartnersSearchService to be reused by any other future endpoint.

I would usually add some HTTP authorisation to the controller, something like Rail’s `ActionController::HttpAuthentication` as a minimum. But for your convenience and ease of testing the app, I decided not to.

I made an assumption on this statement: `'The customer should be able to get the details of each partner that is suggested'`
I wasn't sure if this meant that the client should be able to view the details of each partner in the main search response, or if it meant that another request can be made to get the details of a specific partner. So I added a show endpoint.

I really enjoyed this coding challenge and I look forward to the possible opportunity to discuss it with you. Any feedback will be greatly received.
