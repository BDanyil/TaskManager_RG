# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
end
