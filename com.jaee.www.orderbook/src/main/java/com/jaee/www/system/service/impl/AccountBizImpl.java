package com.jaee.www.system.service.impl;

import com.jaee.www.entity.User;
import com.jaee.www.system.dao.UserDao;
import com.jaee.www.system.service.AccountBiz;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class AccountBizImpl implements AccountBiz {

    @Resource
    UserDao userDao;

    @Override
    public User findByIdAndPassword(String username, String password) {
        return userDao.findByIdAndPassword(username, password);
    }


    @Override
    public void updatePassword(String id, String password) {
        userDao.updatePassword(id, password);
    }
}
