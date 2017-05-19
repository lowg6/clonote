class NoteMagazine < ApplicationRecord
  belongs_to :note
  belongs_to :magazine
end
