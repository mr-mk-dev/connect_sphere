package me.manishcodes.connectsphere.entity;

import lombok.Builder;
import me.manishcodes.connectsphere.enums.AccountStatus;
import me.manishcodes.connectsphere.enums.UserRole;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(columnNames = "email"),
        @UniqueConstraint(columnNames = "user_name")
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "users_id")
    private Long usersId;

    @Column(name = "email", nullable = false, unique = true, length = 255)
    private String email;

    @Column(name = "user_name", nullable = false, unique = true, length = 20)
    private String userName;

    @Column(name = "password", nullable = true, length = 255)
    private String password;

    @Column(name = "full_name", nullable = false, length = 50)
    private String fullName;

    @Column(name = "bio", length = 255)
    private String bio;

    @Column(name = "profile_pic", length = 500)
    private String profilePic;

    @Column(name = "location", length = 100)
    private String location;

    @Column(name = "website", length = 255)
    private String website;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false, length = 20)
    private UserRole role;

    @Column(name = "status", nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private AccountStatus status;

    @Column(name = "post_count", nullable = false)
    private long postCount;

    @Column(name = "follower_count", nullable = false)
    private long followerCount;

    @Column(name = "following_count", nullable = false)
    private long followingCount;

    @Column(name = "email_verified", nullable = false)
    private boolean emailVerified=false;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        role = UserRole.USER;
        status = AccountStatus.ACTIVE;
        postCount = 0;
        followerCount = 0;
        followingCount = 0 ;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + role.name()));
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.status == AccountStatus.ACTIVE;
    }
}
