package vn.Duc.service;

import java.util.List;

import vn.Duc.entity.Videos;

public interface VideosService {

    void create(Videos entity);

    void update(Videos entity);

    void delete(Integer videoId);

    Videos findById(Integer videoId);

    List<Videos> findAll();

    List<Videos> findByCategoryId(Integer categoryId);

    List<Videos> searchByTitle(String keyword);
}
