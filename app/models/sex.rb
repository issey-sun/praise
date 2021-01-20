class Sex < ActiveHash::Base
  self.data = [
    {id: 1, name: '--' },
    {id: 2, name: 'Not known'}, 
    {id: 3, name: 'Female'}, 
    {id: 4, name: 'Male'},
    {id: 5, name: 'Non-binary'}
  ]

  include ActiveHash::Associations
  has_many :users
end
