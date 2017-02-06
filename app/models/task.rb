class Task < ApplicationRecord
    # content must have value; can't be empty
validates :content, presence: true, length: { minimum: 4, maximum: 300 }

# delete only the task; not the user
belongs_to :user, dependent: :destroy
end
