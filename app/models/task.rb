# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }

  acts_as_list scope: :project
end
