class User < ApplicationRecord
  has_many :kids, dependent: :destroy
end
