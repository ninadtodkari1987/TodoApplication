package com.deloitte.todo.repository;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.deloitte.todo.model.Role;

/**
 * Role JPA Repository
 * 
 * @author Ninad Todkari
 */
@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
	@Cacheable("roles")
	Role findOneByName(String name);
}
