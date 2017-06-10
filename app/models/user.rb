class User < ActiveRecord::Base
     validates :user_name, uniqueness: {message: "already exist!" }
     validates :user_pass, presence: true
end
