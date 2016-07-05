class Stream < ActiveRecord::Base
  validates :url, presence: true
  validates :source, presence: true

  belongs_to :channel

#   Schema
#   - id
#   - url
end
