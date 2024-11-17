package model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Product implements Serializable {
    
    private int id;
    private String name;
    private int price;
    private String imgPath;
    private String description;
    private int status;
    private int categoryId;
    
}
