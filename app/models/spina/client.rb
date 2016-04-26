module Spina
  class Client < ActiveRecord::Base
    mount_uploader :logo, PhotoUploader
    has_many :case_studies
    validates :name, :employee_name, :employee_title, presence: true
  end
end
