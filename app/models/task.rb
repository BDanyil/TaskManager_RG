# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true

  acts_as_list scope: :project
end
