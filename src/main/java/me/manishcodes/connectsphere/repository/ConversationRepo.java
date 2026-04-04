package me.manishcodes.connectsphere.repository;


import me.manishcodes.connectsphere.entity.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConversationRepo  extends JpaRepository<Conversation,Long> {

}
