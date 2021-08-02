import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.logging.Logger;

/**
 * @program: flowerShop
 * @description: redis连接测试
 * @author: hjc
 * @create: 2021-08-02 10:04
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:applicationContext.xml")
public class RedisTest {

    @Resource
    private RedisTemplate redisTemplate;

    @Test
    public void setValue(){
        redisTemplate.boundValueOps("name").set("ningning"); }
    @Test
    public void getValue(){
        String str = (String) redisTemplate.boundValueOps("name").get();
        System.out.println(str);
    }
    @Test
    public void deleteValue(){
        redisTemplate.delete("name");;
    }
}