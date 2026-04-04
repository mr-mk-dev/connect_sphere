package me.manishcodes.connectsphere.repository;


import me.manishcodes.connectsphere.entity.Comment;
import me.manishcodes.connectsphere.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepo extends JpaRepository<Post,Long> {
}
