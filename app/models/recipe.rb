class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :items, through: :ingredients
  belongs_to :source

  validates_presence_of :name, :permalink
  validates_format_of :permalink, with: /[a-z-]{5,128}/

  scope :vegan,       -> { where(vegan:       true) }
  scope :vegetarian,  -> { where(vegetarian:  true) }
  scope :gluten_free, -> { where(gluten_free: true) }
  scope :paleo,       -> { where(paleo:       true) }

  def to_param
    self.permalink
  end
end
