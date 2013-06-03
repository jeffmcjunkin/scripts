# A simple script to send phishing emails with unique shortcuts
# Some code blatantly stolen from  http://lindsaar.net/2010/3/15/how_to_use_mail_and_actionmailer_3_with_gmail_smtp
# By Jeff McJunkin (jeff.mcjunkin@gmail.com)

require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => ENV['GMAIL_DOMAIN'],
            :user_name            => ENV['GMAIL_USERNAME'],
            :password             => ENV['GMAIL_PASSWORD'],
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

# Note: I'm using environment variables here.
# To use hard-coded variables instead (don't commit them to Github!)
# just change the lines to something like 
#           :password             => '<password>',


Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
       to 'target@companyname.com'
     from ENV['GMAIL_USERNAME']
  subject 'testing sendmail'
     body 'testing sendmail'
end
