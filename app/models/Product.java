package models;

import javax.persistence.*;

/**
 * Created by Olga on 07.02.2016.
 */

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    public String name;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "measure_unit_id")
    public MeasureUnit measureUnit;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "storage_type_id")
    public StorageType storageType;

    public Boolean deleted;

}
