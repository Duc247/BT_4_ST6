package vn.Duc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryModel {

    private Integer categoryId;
    private String categoryName;
    private String categoryCode;
    private String images;
    private Boolean status;

}
