class SweetTagRelation < ApplicationRecord
  belongs_to :sweet
  belongs_to :tag
end
