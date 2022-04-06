class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :no_wrong_title

    def no_wrong_title
        if title == "True Facts"
            errors.add(:title, "Sorry, wrong title")
        end
    end
end
