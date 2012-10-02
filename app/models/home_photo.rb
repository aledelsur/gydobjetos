class HomePhoto < ActiveRecord::Base
  attr_accessible :text, :position, :photo

  has_attached_file :photo,
    :styles => { 
      :home => "959x430#",
      }

end
