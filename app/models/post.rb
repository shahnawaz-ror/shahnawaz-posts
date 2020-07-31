class Post < ApplicationRecord
  belongs_to :user
  has_many :images, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(',')
  end

  def self.search(search)
    if search
      where('title LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end
end
