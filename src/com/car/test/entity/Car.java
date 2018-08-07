package com.car.test.entity;

public class Car {

    private int id;
    private String type;
    private String brand;
    private String information;
    private int price;
    private int status;
    private int years;
    private String pic;


    public Car() {
    }

    public Car(int id, String type, String brand, String information, int price, int status, int years, String pic) {
        this.id = id;
        this.type = type;
        this.brand = brand;
        this.information = information;
        this.price = price;
        this.status = status;
        this.years = years;
        this.pic = pic;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", brand='" + brand + '\'' +
                ", information='" + information + '\'' +
                ", price=" + price +
                ", status=" + status +
                ", years=" + years +
                ", pic='" + pic + '\'' +
                '}';
    }
}
