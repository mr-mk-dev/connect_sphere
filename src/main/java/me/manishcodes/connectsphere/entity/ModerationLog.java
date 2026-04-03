package me.manishcodes.connectsphere.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import me.manishcodes.connectsphere.enums.ModerationAction;

import java.time.LocalDateTime;

@Entity
@Table(name = "moderation_logs")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModerationLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "moderation_log_id")
    private Long moderationLogId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "moderator_id", nullable = false)
    private Users moderator;  // who took the action (moderator/admin)

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "report_id")
    private Report report;  // which report triggered this (null for direct admin actions)

    @Enumerated(EnumType.STRING)
    @Column(name = "action", nullable = false, length = 30)
    private ModerationAction action;

    @Column(name = "note", length = 500)
    private String note;  // moderator's reason/notes

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_user_id")
    private Users targetUser;  // the user affected (warned/banned)

    @Column(name = "target_type", length = 20)
    private String targetType;  // POST, COMMENT, USER

    @Column(name = "target_id")
    private Long targetId;  // ID of the content actioned on

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }
}
