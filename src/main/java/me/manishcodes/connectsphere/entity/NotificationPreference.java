package me.manishcodes.connectsphere.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "notification_preferences")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotificationPreference {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notification_pref_id")
    private Long notificationPrefId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;  // one preference row per user

    @Column(name = "like_notification", nullable = false)
    private boolean likeNotification = true;

    @Column(name = "comment_notification", nullable = false)
    private boolean commentNotification = true;

    @Column(name = "follow_notification", nullable = false)
    private boolean followNotification = true;

    @Column(name = "mention_notification", nullable = false)
    private boolean mentionNotification = true;

    @Column(name = "email_on_comment", nullable = false)
    private boolean emailOnComment = true;

    @Column(name = "email_on_follow", nullable = false)
    private boolean emailOnFollow = true;

    @Column(name = "email_on_mention", nullable = false)
    private boolean emailOnMention = true;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        this.updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }
}
