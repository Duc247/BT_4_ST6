package vn.Duc.service.Impl;

import java.util.List;

import vn.Duc.entity.Videos;
import vn.Duc.repository.VideosRepository;
import vn.Duc.repository.Impl.VideosRepositoryImpl;
import vn.Duc.service.VideosService;

public class VideosServiceImpl implements VideosService {

    private VideosRepository videoRepo;

    public VideosServiceImpl() {
        this.videoRepo = new VideosRepositoryImpl();
    }

    @Override
    public void create(Videos entity) {
        videoRepo.create(entity);
    }

    @Override
    public void update(Videos entity) {
        videoRepo.update(entity);
    }

    @Override
    public void delete(Integer videoId) {
        videoRepo.delete(videoId);
    }

    @Override
    public Videos findById(Integer videoId) {
        return videoRepo.findById(videoId);
    }

    @Override
    public List<Videos> findAll() {
        return videoRepo.findAll();
    }

    @Override
    public List<Videos> findByCategoryId(Integer categoryId) {
        return videoRepo.findByCategoryId(categoryId);
    }

    @Override
    public List<Videos> searchByTitle(String keyword) {
        return videoRepo.searchByTitle(keyword);
    }
}
