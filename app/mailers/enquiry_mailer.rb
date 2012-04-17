class EnquiryMailer < ActionMailer::Base
  default :from => "info@kiris.in"

  def enquiry_email(enquiry)
    @enquiry = enquiry
     
    mail(:to => "info@kiris.in, karnatikirankumar@gmail.com", :subject => "#{@enquiry.subject}")
  end
end
