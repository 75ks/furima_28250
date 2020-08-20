class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :comment
    validates :user
    validates :item
  end
end
