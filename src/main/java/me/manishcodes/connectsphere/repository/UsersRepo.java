package me.manishcodes.connectsphere.repository;

import me.manishcodes.connectsphere.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepo extends JpaRepository<Users,Long> {

}
