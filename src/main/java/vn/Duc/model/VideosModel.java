package vn.Duc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VideosModel {

    private Integer videoId;
    private String title;
    private String poster;
    private Integer views;
    private String description;
    private Boolean active;

}
