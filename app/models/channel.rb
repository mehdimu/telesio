class Channel < ActiveRecord::Base
  has_many :streams


  def next
    n = Channel.where("id > ?", id).first
    return Channel.first if n.nil?
    return n
  end

  def prev
    Channel.where("id < ?", id).first
  end

# Schema
# - id
# - name
# - streams


end
