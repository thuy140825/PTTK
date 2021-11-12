

package dao;

import java.util.List;

import model.Notification;

public interface NotificationDAO {
	
    // them
    Notification addNotification(Notification notification);

    // lay danh sach
    List<Notification> getAllNotifications();
	
}
