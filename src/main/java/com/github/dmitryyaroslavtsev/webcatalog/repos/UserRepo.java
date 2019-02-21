package com.github.dmitryyaroslavtsev.webcatalog.repos;

import com.github.dmitryyaroslavtsev.webcatalog.dto.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends MongoRepository<User, String> {

    User findByUsername(String username);
}
