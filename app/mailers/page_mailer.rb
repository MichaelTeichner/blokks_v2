class PageMailer < ActionMailer::Base

	def page_created(user)
		mail(to: user.email,
			 from: "services@blokks.com",
			 subject: "Page Created",
			 body: "This is my first Mailer!"
		)
	end

end