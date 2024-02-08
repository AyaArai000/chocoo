class Like < ApplicationRecord
  belongs_to :sweet
  belongs_to :user
  validates_uniqueness_of :sweet_id, scope: :user_id
end
