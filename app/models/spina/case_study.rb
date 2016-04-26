module Spina
  class CaseStudy < ActiveRecord::Base
    belongs_to :client
    validates :title, :subtitle, :description, presence: true
  end
end
