class UserForm < Reform::Form

  properties :first_name, :last_name, :email, :phone, :role_id

  validates :first_name, :last_name, :email, :phone, :presence => true
  validates_uniqueness_of :email

end
