user = User.find_or_create_by_email(
	email: "v4p0r3d@gmail.com",
	admin: true,
	password: "password",
	password_confirmation: "password",
	name: "Master"
	)
