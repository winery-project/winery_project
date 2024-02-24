class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :latest, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
  
end
