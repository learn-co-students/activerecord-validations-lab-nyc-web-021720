class Post < ActiveRecord::Base
  # checks if a post is created with a title
  validates :title, presence: true
  # checks if the content has a minimum length of 250 characters 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  # uses the #inclusion validator
  # checks if the category attribute has either Fiction or Non-Fiction
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # custom validator
  # uses #validate helper method for custom validator
  validate :title_has_to_be_clickbait

  # class constant variable 
  CLICKBAIT_PATTERNS = [
    # each element is a pattern match value
    /Won't Believe/,
    /Secret/,
    # pattern match for number between 0-9, following the word Top, that can repeat 0 or more times (*)
    /Top [0-9]*/,
    /Guess/
  ]

  def title_has_to_be_clickbait
    # none? enumerable returns true only if none of the elements return true for the block code
    # will pattern match each element against the title
    # if at the end of the iteration, the #none? enumerable returns true:
    # title did not match "none" of the elements in the CLICKBAIT_PATTERNS
    # will add a custom error to that title
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end

