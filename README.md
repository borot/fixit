# Fixit, a simple fixture for rspec

## What is it?

####It

* is a very simple and lightweight fixture easy to use
* can be used under various situations
* requires no other libraries

## Installation

    gem install fixit

## How to use
####write fixture

in \#spec/fixits.rb

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
	
or you can put separated files in spec/fixit/* . Files are automatically loaded.
	
####load fixture

\#spec/spec_helper.rb

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
 
