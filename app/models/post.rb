class Post < ApplicationRecord
    has_one_attached :featured_image
    validates :title, presence: true
    validates :body, presence: true
    has_many :comments, dependent: :destroy
end  