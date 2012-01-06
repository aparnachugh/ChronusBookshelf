class Product < ActiveRecord::Base

default_scope :order => 'title'
validates :title, :description, :image, :presence => true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01}  
validates :title, :uniqueness => true
validates :title, :length => {:minimum => 5}
validates :image, :format => {
:with => %r{\.(gif|jpg|png)$}i, :message => ': Only jpg, png and gif images allowed.' }

has_many :line_items
has_many :orders, :through => :line_items
before_destroy :ensure_not_referenced_by_any_line_item

private

def ensure_not_referenced_by_any_line_item
	if line_items.empty?
	   return true
	else
		errors.add(:base, 'Line Items Present')
		return false
	end

end

end

