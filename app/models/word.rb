class Word < ApplicationRecord
    validates :term, presence: true, uniqueness: true
    validates :definition, presence: true
end
