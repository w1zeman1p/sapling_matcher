# == Schema Information
#
# Table name: companies
#
#  id                   :integer          not null, primary key
#  current              :boolean
#  title                :string
#  company              :string
#  description          :string
#  start_date           :date
#  end_date             :date
#  linkedin_company_url :string
#  name                 :string
#  linkedin_profile_id  :integer
#  url                  :string
#  website              :string
#  industry             :string
#  headquarters         :string
#  company_size         :string
#  founded              :string
#  address              :string
#

class Company < ActiveRecord::Base
  belongs_to :linkedin_profile
end
