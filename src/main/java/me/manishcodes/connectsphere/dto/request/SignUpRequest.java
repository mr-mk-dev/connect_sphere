package me.manishcodes.connectsphere.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignUpRequest {
    private String email;
    private String userName;
    private String password;
    private String fullName;
    private String bio;
    private String location;
    private String website;
}
