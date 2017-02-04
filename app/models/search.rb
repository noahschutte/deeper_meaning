class Search < ApplicationRecord
  validates_presence_of :word, :message => "must be entered."
end
