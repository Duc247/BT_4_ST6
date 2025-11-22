package vn.Duc.repository.Impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.Duc.config.JPAConfig;
import vn.Duc.entity.Users;
import vn.Duc.repository.UsersRepository;

public class UsersRepositoryImpl implements UsersRepository {

    @Override
    public void create(Users entity) {
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
    public void update(Users entity) {
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
    public void delete(String username) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();
            Users user = em.find(Users.class, username);
            if (user != null) {
                em.remove(user);
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
    public Users findByUserName(String username) {
        EntityManager em = JPAConfig.getEntityManager();
        return em.find(Users.class, username);
    }

    @Override
    public List<Users> findAll() {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT u FROM Users u";
        TypedQuery<Users> query = em.createQuery(jpql, Users.class);
        System.out.print(query.getResultList());
        return query.getResultList();
    }

    @Override
    public boolean existsUsername(String username) {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT COUNT(u) FROM Users u WHERE u.username = :name";
        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
        query.setParameter("name", username);

        return query.getSingleResult() > 0;
    }

    @Override
    public boolean existsEmail(String email) {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT COUNT(u) FROM Users u WHERE u.email = :email";
        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
        query.setParameter("email", email);

        return query.getSingleResult() > 0;
    }

    @Override
    public boolean existsPhone(String phone) {
        EntityManager em = JPAConfig.getEntityManager();

        String jpql = "SELECT COUNT(u) FROM Users u WHERE u.phone = :phone";
        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
        query.setParameter("phone", phone);

        return query.getSingleResult() > 0;
    }

    @Override
    public Users findByEmail(String email) {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            String jpql = "SELECT u FROM Users u WHERE u.email = :email";
            TypedQuery<Users> query = em.createQuery(jpql, Users.class);
            query.setParameter("email", email);

            List<Users> list = query.getResultList();
            if (list.isEmpty()) return null;
            return list.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean resetMatKhau(String username, String password) {

        EntityManager em = JPAConfig.getEntityManager();

        try {
            em.getTransaction().begin();

            Users user = em.find(Users.class, username);
            if (user == null) {
                return false;
            }

            user.setPassword(password);
            em.merge(user);

            em.getTransaction().commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
            return false;

        } finally {
            em.close();
        }
    }
}
