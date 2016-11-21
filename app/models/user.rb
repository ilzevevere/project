class User < ActiveRecord::Base
    
    	#has_attached_file :avatar, 
                  #:storage  => :s3, 
                  #:styles => { :medium => "370x370", :thumb => "100x100" },
        #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
        
#this method tries to find a user through the provider and uid fields, if it find one it return it, 
#if not, call a new method named "create_user_from_omniauth(auth)" and again, pass the auth hash as an argument.    
    	
        def self.sign_in_from_facebook(auth)
		    find_by(provider: auth['provider'], uid: auth['uid'] ) || create_user_from_facebook(auth)
	    end

	    def self.create_user_from_facebook(auth)
		    create(

    		avatar: process_uri(auth['info']['image'] + "?width=9999"),
    		email: auth['info']['email'],
    		provider: auth['provider'],
    		uid: auth['uid'],
    		name: auth['info']['name'],
    		gender: auth['extra']['raw_info']['gender'],
    		date_of_birth: auth['extra']['raw_info']['birthday'],
    		location: auth['info']['location'],
    		bio: auth['extra']['raw_info']['bio']


		    )
	    end
end
