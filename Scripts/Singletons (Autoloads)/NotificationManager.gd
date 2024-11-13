extends Node

@export var notificationQueue: Array[String] = []
@export var isNotificationActive: bool = false

func addNotification(message: String) -> void:
	notificationQueue.append(message)
	if not isNotificationActive:
		showNextNotification()

func showNextNotification() -> void:
	if notificationQueue.size() > 0:
		var message: String = notificationQueue.pop_front()
		isNotificationActive = true
		# Display notification message
		# After the display duration, call `_notification_displayed`
	else:
		isNotificationActive = false
