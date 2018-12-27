package com.jaee.www.college.dao;

import org.apache.ibatis.annotations.Param;

import com.jaee.www.entity.Book;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-14.
 */
public interface BookDao {

    public void add(Book book);

    public void delete(@Param("bookTitle") String bookTitle, @Param("isbn") String isbn);

    public Book find(@Param("bookTitle") String bookTitle, @Param("isbn") String isbn);
}
