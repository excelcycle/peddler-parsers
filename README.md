# Peddler Parsers

[![Build Status](https://travis-ci.org/bpuklich/peddler-parsers.svg)](https://travis-ci.org/bpuklich/peddler-parsers)

This code is strongly based off the [MWS Orders](https://github.com/hakanensari/mws-orders) example code.
Lots of credit belongs to the author.

**WARNING!** This code is not ready for production by any means. Use at your own risk.

**Peddler Parsers** is a collection of parsers to be used with the [Peddler Ruby gem](https://github.com/hakanensari/peddler). 
Refer to the [Amazon Marketplace Web Service (MWS) Products API](http://docs.developer.amazonservices.com/en_US/products/index.html) for
more information on the API itself.

Of course, to use the Amazon MWS API, you must have an eligible seller account.

## Usage

Create a client:

```ruby
require "mws-products"

client = MWS.products(
  primary_marketplace_id: "Your Marketplace ID",
  merchant_id: "Your Merchant or Seller ID",
  aws_access_key_id: "Your AWS Access Key ID",
  aws_secret_access_key: "Your AWS Secret Access Key",
)
```

Credentials can be set up [when instantiating or with environment variables](https://github.com/hakanensari/peddler#user-content-usage).

Please refer to the Peddler [MWS::Products::Client](http://www.rubydoc.info/gems/peddler/MWS/Products/Client) class for 
documentation on how to use the Products API. One example follows.

### GetLowestOfferListingsForSKU

Get pricing information for the lowest price active listings of a list of up to 20 products based on SellerSKU:

```ruby
products = client.get_lowest_offer_listings_for_sku('SKU001', 'SKU002', 'SKU005', exclude_me: true)
products = response.parse
puts products.count # => 3
puts products.first # => #<MWS::Products::Listing ...
```
