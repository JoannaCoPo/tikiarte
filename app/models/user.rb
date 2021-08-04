class User < ApplicationRecord
  has_many :kids, dependent: :destroy
  has_many :images, dependent: :destroy
end
