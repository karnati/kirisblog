class EnquiryMailer < ActionMailer::Base
  default :from => "info@kiris.in"

  def enquiry_email(enquiry)
    @enquiry = enquiry
     
    mail(:to => "info@kiris.in, karnatikirankumar@gmail.com", :subject => "Enquiry Mail from Kirisin")
  end
end
