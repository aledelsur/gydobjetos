class Contact < ActionMailer::Base

  default from: "no-responder@from.com"

  def new_contact(params=nil)
    @content = params[:content]
    @email = params[:email]
    mail(:to => "alealvarez.00@gmail.com", :subject => "#{params[:name]} te hizo una consulta!")
  end   

end 