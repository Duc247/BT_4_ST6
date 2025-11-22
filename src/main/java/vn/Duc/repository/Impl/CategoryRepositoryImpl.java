package vn.Duc.repository.Impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.Duc.config.JPAConfig;
import vn.Duc.entity.Category;
import vn.Duc.repository.CategoryRepository;

public class CategoryRepositoryImpl implements CategoryRepository {

    @Override
    public void create(Category entity) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Category entity) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(int cateId) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            Category entity = em.find(Category.class, cateId);
            if (entity != null) {
                em.remove(entity);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    @Override
    public Category findById(int cateId) {
        EntityManager em = JPAConfig.getEntityManager();
        return em.find(Category.class, cateId);
    }

    @Override
    public List<Category> findAll() {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT c FROM Category c";
        TypedQuery<Category> query = em.createQuery(jpql, Category.class);
        return query.getResultList();
    }

    @Override
    public List<Category> findByUserId(String userId) {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT c FROM Category c WHERE c.user.username = :uid";
        TypedQuery<Category> query = em.createQuery(jpql, Category.class);
        query.setParameter("uid", userId);

        return query.getResultList();
    }
}
