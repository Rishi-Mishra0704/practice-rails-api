class Author < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :rating, presence: true
end
