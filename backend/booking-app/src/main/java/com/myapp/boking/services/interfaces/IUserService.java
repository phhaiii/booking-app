package com.myapp.boking.services.interfaces;

import com.myapp.boking.dtos.requests.UserCreateRequest;
import com.myapp.boking.models.User;

public interface IUserService {
    User createUser(UserCreateRequest userCreateRequest) throws Exception;
    //String login(String phoneNumber, String password, Long roleId) throws Exception;
}
