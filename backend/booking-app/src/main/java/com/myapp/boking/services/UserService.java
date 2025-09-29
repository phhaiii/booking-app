package com.myapp.boking.services;

import com.myapp.boking.dtos.requests.UserCreateRequest;
import com.myapp.boking.models.Role;
import com.myapp.boking.models.User;
import com.myapp.boking.repositories.RoleRepository;
import com.myapp.boking.repositories.UserRepository;
import com.myapp.boking.services.interfaces.IUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    @Override
    @Transactional
    public User createUser(UserCreateRequest userCreateRequest) throws Exception {
        if (userRepository.existsByPhone(userCreateRequest.getPhone())) {
            throw new DataIntegrityViolationException("Phone number already exists");
        }
        if (userRepository.existsByUsername(userCreateRequest.getUsername())) {
            throw new DataIntegrityViolationException("Username already exists");
        }
        if (userRepository.existsByEmail(userCreateRequest.getEmail())) {
            throw new DataIntegrityViolationException("Email already exists");
        }

        User newUser = User.builder()
                .username(userCreateRequest.getUsername())
                .email(userCreateRequest.getEmail())
                .password(userCreateRequest.getPassword())
                .fullName(userCreateRequest.getFullName())
                .phone(userCreateRequest.getPhone())
                .address(userCreateRequest.getAddress())
                .isActive(1)
                .avatarUrl(null)
                .build();

        return userRepository.save(newUser);
    }

}
