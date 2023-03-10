package com.gokhan.bookclub.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gokhan.bookclub.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long>{
//The repository speaks with the Model
//to perform database operations on the entities and
//relationships defined in the Model layer.

  List<Book> findAll();
}
