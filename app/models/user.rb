# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :carts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true,  on: :create, length: { minimum: 8, al_blowlank: true }
end
