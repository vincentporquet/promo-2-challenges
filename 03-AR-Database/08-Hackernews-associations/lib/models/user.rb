class User < ActiveRecord::Base
  has_many :posts
  #TODO: add associations to the Post model
end
