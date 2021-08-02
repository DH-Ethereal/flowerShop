import com.jc.dao.CartDao;
import com.jc.pojo.Cart;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @program: flowerShop
 * @description:
 * @author: hjc
 * @create: 2021-06-19 17:29
 **/
public class UserTest {

    @Test
    public void cart(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring-dao.xml");
        SqlSessionFactory factory = (SqlSessionFactory) ac.getBean("sqlSessionFactory");
        SqlSession sqlSession = factory.openSession();
        CartDao cartDao = sqlSession.getMapper(CartDao.class);
        List<Cart> carts = cartDao.getSelfCart(1);
//        System.out.println(carts);
        sqlSession.close();
    }
}
