class Post < ActiveRecord::Base
  belongs_to :user

  def to_s
    "#{name} on #{date.strftime('%d/%m/%Y')}, rated #{rating}"
  end
  #TODO: add association to the user model
end

