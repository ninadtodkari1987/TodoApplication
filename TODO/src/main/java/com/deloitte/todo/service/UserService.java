package com.deloitte.todo.service;

import com.deloitte.todo.model.User;

/**
 * User Service Interface
 * 
 * @author Ninad Todkari
 */
public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
