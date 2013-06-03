# A simple script to send phishing emails with unique shortcuts
# Some code blatantly stolen from  http://lindsaar.net/2010/3/15/how_to_use_mail_and_actionmailer_3_with_gmail_smtp
# By Jeff McJunkin (jeff.mcjunkin@gmail.com)

require 'gmail'
require 'base64'

# Note: I'm using environment variables here.
# To use hard-coded variables instead (don't commit them to Github!)
# just change the lines to something like 
# gmail = Gmail.new("username@domain.com", "password")

gmail = Gmail.new(ENV['GMAIL_USERNAME'],ENV['GMAIL_PASSWORD'])

templateBody = File.read('/tmp/ups.txt')

# Build the tracking URL
baseDomain = "www.upsdeliverytracking.com/index.html"
targetEmailAddress = "jeff.mcjunkin@gmail.com"
url = baseDomain + "?id=" + Base64.encode64(targetEmailAddress)

# Search and replace the literal string "__URL__" with the combination of the domain name 
# and the base64'd email address of the recipient (in an ?id=<base64encodedemail> parameter)
emailBody = templateBody.gsub(/__URL__/, url)

gmail.deliver do
  to "jeff.mcjunkin@gmail.com"
  subject "UPS Ship Notification"
  html_part do
    body emailBody
  end
end

gmail.logout
