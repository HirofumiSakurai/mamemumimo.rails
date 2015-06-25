class Text < ActiveRecord::Base
  validates :entity, presence: true
  #validates :parent_id, numericality: {greater_than_or_equal_to: -1}
  has_many  :childs, class_name: "Text", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Text"

  def append_entity(new_entity)
    update(entity: entity + "\n" + new_entity)
  end
end
