package com.mbstu.ict.dao;

import com.mbstu.ict.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends JpaRepository<Item, Integer> {

    @Query("select p from Item p where p.name = ?")
    Item getItemByItemName(String itemName);

    @Query("select p from Item p where p.id = ?")
    Item getItemById(Integer itemId);
}