package com.myapp.boking.repositories;

import com.myapp.boking.models.User;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByPhone(String phone);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
}
