package entity;

import java.util.ArrayList;

public class Data {
    private ArrayList<Dish> listDish;
    private ArrayList<Integer> pages;
    private Integer currentPage;
    private Integer totalPages;

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public ArrayList<Dish> getListDish() {
        return listDish;
    }

    public void setListDish(ArrayList<Dish> listDish) {
        this.listDish = listDish;
    }

    public ArrayList<Integer> getPages() {
        return pages;
    }

    public void setPages(ArrayList<Integer> pages) {
        this.pages = pages;
    }

    @Override
    public String toString() {
        return "dataReturn{" +
                "listDish=" + listDish +
                ", pages=" + pages +
                ", currentPage=" + currentPage +
                ", totalPages=" + totalPages +
                '}';
    }
}