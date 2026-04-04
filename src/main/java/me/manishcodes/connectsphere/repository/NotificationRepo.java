package me.manishcodes.connectsphere.repository;


import me.manishcodes.connectsphere.entity.Comment;
import me.manishcodes.connectsphere.entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationRepo extends JpaRepository<Notification,Long> {
}
