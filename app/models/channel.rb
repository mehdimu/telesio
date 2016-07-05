class Channel < ActiveRecord::Base
  has_many :streams
  scope :active, -> { where(deleted: false)}
  validates :name, presence: true

  def next
    n = Channel.active.where("id > ?", id).first
    return Channel.first if n.nil?
    return n
  end

  def live_streams
    self.streams.where(:live => true)
  end

  def prev
    Channel.active.where("id < ?", id).first
  end

  def mark_as_deleted
    self.deleted = true
    self.save
  end

# Schema
# - id
# - name
# - streams
# - deleted

end
