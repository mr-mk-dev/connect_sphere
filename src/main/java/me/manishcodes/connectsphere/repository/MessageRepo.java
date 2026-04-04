package me.manishcodes.connectsphere.repository;

import me.manishcodes.connectsphere.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepo extends JpaRepository<Message,Long> {
}
