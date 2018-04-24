package com.mbstu.ict.dao;

import com.mbstu.ict.model.Barber;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BarberRepository extends JpaRepository<Barber, Integer> {

    @Query("select p from Barber p where p.id = ?")
    Barber getBarberById(Integer barberId);
}