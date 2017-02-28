# URLockBox

## About

URL Lockbox is a place to users to login, create links, and keep track of which are read.

## Setup

To run locally:
```
git clone git@github.com:meganft/final-url-lockbox.git
cd final-hot-reads
rake db:create
rake db:migrate
rails s
visit http://localhost:3000/
```

To run the tests:
```
rspec
```

To see it in production, click here:
* [Hot Reads](http://url-lockbox-final.herokuapp.com/)


## Info

This app is written in Rails v5.0.0.1. The database is postgresql. Tests written
in rspec-rails. Coverage provided by simplecov.

## Licensing

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING B
