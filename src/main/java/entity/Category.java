
package entity;

import annotation.Column;
import annotation.Entity;
import annotation.Id;

@Entity(tableName = "category")
public class Category {
    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = "int")
    private int id;

    @Column(columnName = "name", columnType = "varchar(255)")
    private String name;

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
}