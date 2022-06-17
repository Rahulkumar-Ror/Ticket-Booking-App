class Comment < ApplicationRecord
  belongs_to :view
  belongs_to :workshop
end
