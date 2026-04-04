package me.manishcodes.connectsphere.repository;


import me.manishcodes.connectsphere.entity.Comment;
import me.manishcodes.connectsphere.entity.ModerationLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ModerationLogRepo extends JpaRepository<ModerationLog,Long> {
}
