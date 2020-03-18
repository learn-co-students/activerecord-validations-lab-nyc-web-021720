class Author < ActiveRecord::Base
    validates :name, presence: true #preventing the object from being saved if its name attribute is empty.
    validates :name, uniqueness: true
    validates :phone_number, length: { is: 10 }
    validates :phone_number, uniqueness: true
end
