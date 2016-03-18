# Fixture, a simple fixture for rspec and others

## What is it?

####It

* is a very simple and lightweight fixture easy to use
* can be used under various situations
* requires no other libraries

## Installation

    gem install fixture

## How to use
####write fixture

    #spec/fixtures.rb

	Fixture.manage User do
	  assign :user1 do
	    name 'Taro Yamada'
		email { #this is a block }
		created_at Time.now
	  end
	
	  assign :user2 do
	    name { Faker::Name.name + 's' }
	    email Faker::Internet.email
	    deleted true
	  end
	end
	
	Fixture.manage Post do
	  assign :post1 do
	    title 'title1'
		body '....'
		user_id { Fixture.get(:user1).id }
	  end
	end
	
Of cource, you can add many records at once by like this.

    Fixture.manage User do
      1000.times do |i|
        assign "user#{i+1}".to_sym do
          name  Faker::Name.name
          email Faker::Internet.email   
        end
      end
    end

And you can put it as separate files in other directory.

Fixture automatically loads

 * spec/fixtures.rb
 * spec/fixture/*.rb
 * test/fixtures.rb
 * test/fixture/*.rb



	
####load fixture

    #spec/spec_helper.rb
	require 'fixture'	
	Fixture.load
	
if you don't want to insert records but use model's instances, 

    Fixture.prepare

instead of Fixture.load.


####use fixture

\#spec/models/user_spec.rb

	describe User do
	  let (:user) { Fixture.get(:user2) }
	.....

   
##Assumption

 Fixture assumes that model classes

 * have accessor methods to each attributes(i.e; columns of record)
 * have save! or save method to insert new record
 
