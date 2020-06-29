package biz.marius.prometheus.redis.binder;

import io.lettuce.core.api.StatefulRedisConnection;
import io.micrometer.core.instrument.FunctionCounter;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Tags;
import io.micrometer.core.instrument.binder.MeterBinder;
import io.micrometer.core.lang.NonNullApi;
import io.micrometer.core.lang.NonNullFields;

import javax.inject.Singleton;
import java.util.function.DoubleSupplier;

@NonNullApi
@NonNullFields
@Singleton
public class RedisMetrics implements MeterBinder {
    final StatefulRedisConnection connection;
    final Tags tags = Tags.of("redis", "0");
    public RedisMetrics(StatefulRedisConnection connection) {
        this.connection = connection;
    }

    @Override
    public void bindTo(MeterRegistry registry) {
        FunctionCounter.builder("redis.transactions.count", connection,
            dataSource -> resettableFunctionalCounter("redis.transactions.count", this::getTransactionCount))
            .tags(tags)
            .description("Number of transactions read from a Redis Hash")
            .register(registry);
    }

    private Double resettableFunctionalCounter(String functionalCounterKey, DoubleSupplier function) {
        Double result = function.getAsDouble();
        return result;
    }

    private Double getTransactionCount() {
        return queryRedis();
    }

    private Double queryRedis() {
        Object value = connection.sync().hgetall("h1").get("field10");
        System.out.println("redisClient = " + value);
        return Double.valueOf(value.toString());
    }
}
