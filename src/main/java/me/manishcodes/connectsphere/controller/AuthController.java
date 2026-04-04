package me.manishcodes.connectsphere.controller;

import me.manishcodes.connectsphere.config.AuthUtil;
import me.manishcodes.connectsphere.dto.request.LoginRequest;
import me.manishcodes.connectsphere.dto.request.SignUpRequest;
import me.manishcodes.connectsphere.dto.respose.ApiResponse;
import me.manishcodes.connectsphere.dto.respose.LoginResponse;
import me.manishcodes.connectsphere.entity.User;
import me.manishcodes.connectsphere.mapper.UserMapper;
import me.manishcodes.connectsphere.repository.UserRepo;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final UserRepo userRepo;
    private final UserMapper userMapper;
    private final AuthUtil authUtil;

    public AuthController(AuthenticationManager authenticationManager, UserRepo userRepo, UserMapper userMapper, AuthUtil authUtil) {
        this.authenticationManager = authenticationManager;
        this.userRepo = userRepo;
        this.userMapper = userMapper;
        this.authUtil = authUtil;
    }

    @PostMapping("/login")
    public ResponseEntity<ApiResponse<LoginResponse>> login(
            @RequestBody LoginRequest loginRequest){

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                    loginRequest.getUserName(),
                    loginRequest.getPassword()
                )
        );
        if(authentication.isAuthenticated()){
            User user = (User) authentication.getPrincipal();
            String token = authUtil.getToken(user);

            LoginResponse loginResponse = LoginResponse.builder()
                    .accessToken(token)
                    .tokenType("Bearer")
                    .expiresIn(3600)
                    .userName(user.getUsername())
                    .role(user.getRole().name())
                    .build();

            return ResponseEntity.ok(ApiResponse.success(loginResponse, "Login successful"));
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(ApiResponse.success("Invalid Credential"));
    }

    @PostMapping("/signup")
    public ResponseEntity<ApiResponse<String>> signup(
            @RequestBody SignUpRequest signUpRequest){
        User newSignUpUser = userMapper.toEntity(signUpRequest);
        userRepo.save(newSignUpUser);
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("User Successfully Registered"));
    }
}
