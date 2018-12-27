package com.jaee.www.system.service;


import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Set;

import com.jaee.www.entity.User;
import com.jaee.www.entity.custom.UserVo;


public interface UserBiz {
    public List<UserVo> findAll() throws InvocationTargetException, IllegalAccessException;

    public User findById(String id);

    public void update(User user);

    public void add(User user);

    public void delete(String id);

    public void changePassword(String userId, String newPassword);


    public User findByUsername(String username);

    public Set<String> findRoles(String username);

    public Set<String> findPermissions(String username);
}
