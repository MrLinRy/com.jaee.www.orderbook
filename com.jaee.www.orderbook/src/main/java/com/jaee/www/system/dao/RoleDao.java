package com.jaee.www.system.dao;


import java.util.List;

import com.jaee.www.entity.Role;


public interface RoleDao {

    public void createRole(Role role);

    public void updateRole(Role role);

    public void deleteRole(Long roleId);

    public Role findOne(Long roleId);

    public Role findByDescription(String description);

    public List<Role> findAll();
}
