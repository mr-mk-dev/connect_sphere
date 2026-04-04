package me.manishcodes.connectsphere.repository;

import me.manishcodes.connectsphere.entity.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RefreshTokenRepo extends JpaRepository<RefreshToken,Long> {
}
