# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  MAX_TITLE_LENGTH = 140
end
