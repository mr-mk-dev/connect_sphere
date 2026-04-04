package me.manishcodes.connectsphere.repository;

import me.manishcodes.connectsphere.entity.Follow;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowRepo extends JpaRepository<Follow,Long> {
}
