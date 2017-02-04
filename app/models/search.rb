class Search < ApplicationRecord
  validates_presence_of :word, :message => "must be entered."
  validates_format_of :word, :with => /\A[a-z]+\Z/i, :on => :create, :message => "must only use letters."
  validates :word, length: {
    maximum: 1,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_long: "can only be one word. Duh..."
  }
end
