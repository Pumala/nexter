class Task < ApplicationRecord
    # content must have value; can't be empty
validates :content, presence: true, length: { minimum: 4, maximum: 300 }
end