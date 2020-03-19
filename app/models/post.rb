class Post < ActiveRecord::Base
    includes ActiveModel::Validations

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validates_with TitleValidator
end
