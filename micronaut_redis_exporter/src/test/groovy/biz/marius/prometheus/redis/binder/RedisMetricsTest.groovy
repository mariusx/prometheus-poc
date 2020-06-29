package biz.marius.prometheus.redis.binder


import io.lettuce.core.api.StatefulRedisConnection
import io.micrometer.core.instrument.MeterRegistry
import io.micrometer.core.instrument.simple.SimpleMeterRegistry
import spock.lang.Specification

class RedisMetricsTest extends Specification {
    MeterRegistry registry = new SimpleMeterRegistry();
    StatefulRedisConnection connection = Mock(StatefulRedisConnection)

    def "should_register_redis_metrics"() {
        given:
            RedisMetrics metrics = new RedisMetrics(connection)
            metrics.bindTo(registry)
        when:
            def fc = registry.get("redis.transactions.count").tag("redis", "0").functionCounter()
        then:
            fc != null

    }
}
