class User < ActiveRecord::Base
  def to_look_pleasant
    "#{id}.   #{name} - #{email}  -  #{password}"
  end
end
