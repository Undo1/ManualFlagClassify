class Flag < ApplicationRecord
  belongs_to :flag_class, optional: true
end
