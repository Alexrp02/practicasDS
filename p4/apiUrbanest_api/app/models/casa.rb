class Casa < ApplicationRecord
    has_many :dormitorios, dependent: :destroy
    accepts_nested_attributes_for :dormitorios, allow_destroy: true
end
