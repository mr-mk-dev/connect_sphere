package me.manishcodes.connectsphere.repository;

import me.manishcodes.connectsphere.entity.Hashtag;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HashtagRepo extends JpaRepository<Hashtag,Long> {
}
