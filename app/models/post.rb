class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: {is: 250}
validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
validates :title
end
