package com.car.test.entity;

import java.util.Date;

public class order {

    private int oid;
    private String brand;
    private String car_type;
    private String service;
    private Date retday;


    @Override
    public String toString() {
        return "order{" +
                "oid=" + oid +
                ", brand='" + brand + '\'' +
                ", car_type='" + car_type + '\'' +
                ", service='" + service + '\'' +
                ", retday=" + retday +
                '}';
    }

    public order() {
    }

    public int getOid() {

        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCar_type() {
        return car_type;
    }

    public void setCar_type(String car_type) {
        this.car_type = car_type;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public Date getRetday() {
        return retday;
    }

    public void setRetday(Date retday) {
        this.retday = retday;
    }

    public order(int oid, String brand, String car_type, String service, Date retday) {

        this.oid = oid;
        this.brand = brand;
        this.car_type = car_type;
        this.service = service;
        this.retday = retday;
    }
}
