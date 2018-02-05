ActionMailer::Base.delivery_method = :smpt
ActionMailer::Base.smpt_settings = {
	:address              => 'smpt.sendgrid.net',
	:port                 => '587',
	:authentication       => 'plain',
	:user_name            => 'kethianuradha@gmail.com',
	:pasword              => 'Spanning-tree42',
	:domain               => 'heroku.com',
	:enable_starttls_auto => true 
}