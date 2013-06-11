# Fixit, a simple fixture for rspec and may be others

## What is it?

####It

* is a very simple and lightweight fixture easy to use
* can be used under various situations
* requires no other libraries

## Installation

    gem install fixit

## How to use
####write fixture

    #spec/fixits.rb

	Fixit.manage User do
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
	
	Fixit.manage Post do
	  assign :post1 do
	    title 'title1'
		body '....'
		user_id { Fixit.get(:user1).id }
	  end
	end
	
Of cource, you can add many records at once by like this.

    Fixit.manage User do
      1000.times do |i|
        assign "user#{i+1}".to_sym do
          name  Faker::Name.name
          email Faker::Internet.email   
        end
      end
    end

And you can put it as separate files in other directory.

Fixit automatically loads

 * spec/fixits.rb
 * spec/fixit/*.rb
 * test/fixits.rb
 * test/fixit/*.rb



	
####load fixture

    #spec/spec_helper.rb
	require 'fixit'	
	Fixit.load
	
if you don't want to insert records but use model's instances, 

    Fixit.prepare

instead of Fixit.load.


####use fixture

\#spec/models/user_spec.rb

	describe User do
	  let (:user) { Fixit.get(:user2) }
	.....

   
##Assumption

 Fixit assumes that model classes

 * have accessor methods to each attributes(i.e; columns of record)
 * have save! or save method to insert new record
 
