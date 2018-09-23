package com.mbstu.ict.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by fahad on 12/28/17.
 */

@Entity
@Table(name="barber")
public class Barber {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String name;

    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "mother_name")
    private String motherName;

    private String gender;

    @Column(name = "age")
    private Integer age;

    private String email;

    private String mobile;

    private String nid;

    private String workingSpeed;

    @Column(name = "joining_date")
    private Date joiningDate;

    public Barber() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getNid() {
        return nid;
    }

    public void setNid(String nid) {
        this.nid = nid;
    }

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    public String getWorkingSpeed() {
        return workingSpeed;
    }

    public void setWorkingSpeed(String workingSpeed) {
        this.workingSpeed = workingSpeed;
    }

    @Override
    public String toString() {
        return "Barber{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", fatherName='" + fatherName + '\'' +
                ", motherName='" + motherName + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", nid='" + nid + '\'' +
                ", joiningDate=" + joiningDate +
                '}';
    }
}
