package vn.Duc.repository.Impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.Duc.config.JPAConfig;
import vn.Duc.entity.Videos;
import vn.Duc.repository.VideosRepository;

public class VideosRepositoryImpl implements VideosRepository {

    @Override
    public void create(Videos entity) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Videos entity) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Integer videoId) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            Videos entity = em.find(Videos.class, videoId);
            if (entity != null) {
                em.remove(entity);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public Videos findById(Integer videoId) {
        EntityManager em = JPAConfig.getEntityManager();
        return em.find(Videos.class, videoId);
    }

    @Override
    public List<Videos> findAll() {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT v FROM Videos v";
        TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);

        return query.getResultList();
    }

    @Override
    public List<Videos> findByCategoryId(Integer categoryId) {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT v FROM Videos v WHERE v.category.categoryId = :cid";
        TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
        query.setParameter("cid", categoryId);

        return query.getResultList();
    }

    @Override
    public List<Videos> searchByTitle(String keyword) {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT v FROM Videos v WHERE v.title LIKE :kw";
        TypedQuery<Videos> query = em.createQuery(jpql, Videos.class);
        query.setParameter("kw", "%" + keyword + "%");

        return query.getResultList();
    }
}
