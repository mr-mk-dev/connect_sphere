package me.manishcodes.connectsphere.mapper;

import lombok.RequiredArgsConstructor;
import me.manishcodes.connectsphere.dto.request.SignUpRequest;
import me.manishcodes.connectsphere.entity.User;
import me.manishcodes.connectsphere.enums.AccountStatus;
import me.manishcodes.connectsphere.enums.UserRole;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
public class UserMapper {
    private  final PasswordEncoder passwordEncoder;

    public User toEntity(SignUpRequest request){
        return User.builder()
                .email(request.getEmail())
                .userName(request.getUserName())
                .password(passwordEncoder.encode(request.getPassword()))
                .fullName(request.getFullName())
                .bio(request.getBio())
                .profilePic(null)
                .location(request.getLocation())
                .website(request.getWebsite())
                .role(UserRole.USER)
                .status(AccountStatus.ACTIVE)
                .postCount(0)
                .followerCount(0)
                .followingCount(0)
                .emailVerified(false)
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();
    }
}
