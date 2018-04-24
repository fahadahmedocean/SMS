package com.mbstu.ict.dao;

import com.mbstu.ict.model.Barber;
import com.mbstu.ict.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Integer> {

    @Query("select p from Service p where p.id = ?")
    Service getServiceById(Integer serviceId);

    @Query("select p from Service p where p.barber.id = ? AND p.status = 'PENDING' OR p.status = 'APPROVED'")
    List<Service> getServiceByBarberId(Integer barberId);
}