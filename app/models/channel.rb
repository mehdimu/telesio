class Channel < ActiveRecord::Base
  has_many :streams
  scope :active, -> { where(deleted: false)}

  def next
    n = Channel.where("id > ?", id).first
    return Channel.first if n.nil?
    return n
  end

  def prev
    Channel.where("id < ?", id).first
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
