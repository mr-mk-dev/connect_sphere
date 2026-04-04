package me.manishcodes.connectsphere.repository;


import me.manishcodes.connectsphere.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepo extends JpaRepository<Comment,Long> {
}
