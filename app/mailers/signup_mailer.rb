class SignupMailer < ActionMailer::Base
  default from: "jagadish.d.one@gmail.com"
  
  def signup_email(email,signUpLink)
    @email = email
    @signUpLink = signUpLink
    mail(:to => @email, :subject => "Signup to My Awesome Site")
  end
end
