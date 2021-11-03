class Todo < ApplicationRecord
    validates :title, presence: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 255 }
    validates :status, presence: true, length: { maximum: 10 }
end
