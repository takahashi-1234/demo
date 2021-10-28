class Task < ApplicationRecord
  belongs_to:user
  has_many:statuses,dependent: :destroy
end
