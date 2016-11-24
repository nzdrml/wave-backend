# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  phone      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :integer
#  email      :string           not null
#

class User < ApplicationRecord

  belongs_to :role, :optional => true


  scope :drivers, -> do
    joins(:role).where :roles => { :id => Role.find_by_name('driver').try(:id) }
  end

end
