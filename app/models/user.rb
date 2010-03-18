module UserDescription
  def to_s
    "#{name}"
  end
end

class User < ActiveRecord::Base
  include UserDescription
  include GuidId
end
