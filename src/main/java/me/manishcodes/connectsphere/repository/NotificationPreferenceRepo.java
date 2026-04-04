package me.manishcodes.connectsphere.repository;

import me.manishcodes.connectsphere.entity.NotificationPreference;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationPreferenceRepo extends JpaRepository<NotificationPreference,Long> {
}
