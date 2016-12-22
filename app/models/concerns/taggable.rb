module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings
  end

  def add_tags(tag_ids)
    return unless tag_ids

    tags << Tag.where(id: tag_ids)
  end

  module ClassMethods
    def tagged_with(tag_ids)
      taggable_list = []

      Tag.find(tag_ids).each do |tag|
        tag.send(self.model_name.param_key.pluralize.to_sym)
           .each { |taggable| taggable_list << taggable }
      end

      taggable_list.uniq
    end
  end
end
