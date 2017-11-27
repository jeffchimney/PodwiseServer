require 'houston'
require 'sqlite3'

# Environment variables are automatically read, or can be overridden by any specified options. You can also
# conveniently use `Houston::Client.development` or `Houston::Client.production`.
APN = Houston::Client.development
APN.certificate = File.read("apnsServer.pem")

# An example of the token sent back when a device registers for notifications
token = "1e15791c15003f3e14cf410cba677fcb52ef4e31d51cc684fce249271df5dee0"

# Create a notification that alerts a message to the user, plays a sound, and sets the badge on the app
notification = Houston::Notification.new(device: token)
notification.alert = "New podcast available!"

# Notifications can also change the badge count, have a custom sound, have a category identifier, indicate available Newsstand content, or pass along arbitrary data.
# notification.badge = 57
notification.sound = "sosumi.aiff"
notification.category = "INVITE_CATEGORY"
notification.content_available = true
notification.mutable_content = true
notification.custom_data = { foo: "bar" }

# And... sent! That's all it takes.
APN.push(notification)