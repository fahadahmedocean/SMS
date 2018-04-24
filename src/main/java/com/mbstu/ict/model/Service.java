package com.mbstu.ict.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="service")
public class Service {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(insertable=false,updatable=false)
    private Integer id;

    @OneToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="barber_id")
    private Barber barber;

    @OneToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="item_id")
    private Item item;

    @Column(name = "request_time")
    private Date requestTime;

    private String status;

    @Column(name = "service_charger")
    private Double serviceCharger;

    @Column(name = "completed_date")
    private Date completedDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Barber getBarber() {
        return barber;
    }

    public void setBarber(Barber barber) {
        this.barber = barber;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Date getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(Date requestTime) {
        this.requestTime = requestTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getServiceCharger() {
        return serviceCharger;
    }

    public void setServiceCharger(Double serviceCharger) {
        this.serviceCharger = serviceCharger;
    }


    public Date getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(Date completedDate) {
        this.completedDate = completedDate;
    }

    @Override
    public String toString() {
        return "Service{" +
                "id=" + id +
                ", barber=" + barber +
                ", item=" + item +
                ", requestTime=" + requestTime +
                ", status='" + status + '\'' +
                ", serviceCharger=" + serviceCharger +
                '}';
    }
}