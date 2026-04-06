package me.manishcodes.connectsphere.config;

import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BloomFilterConfig {

    @Bean
    public RBloomFilter<String> usernameBloomFilter(RedissonClient redissonClient) {

        RBloomFilter<String> bloomFilter = redissonClient.getBloomFilter("usernameFilter");

        bloomFilter.tryInit(
                100000,   // expected users
                0.01      // false positive rate (1%)
        );
        return bloomFilter;
    }
}