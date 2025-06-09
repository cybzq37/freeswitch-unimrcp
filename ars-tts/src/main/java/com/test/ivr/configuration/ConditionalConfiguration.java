package com.test.ivr.configuration;


import com.test.ivr.service.IArsTtsService;
import com.test.ivr.service.impl.AliArsTtsService;
import org.springframework.context.annotation.*;
import org.springframework.core.type.AnnotatedTypeMetadata;

@Configuration
public class ConditionalConfiguration {

    @Bean
    @Conditional(DevCondition.class)
    public IArsTtsService AhArsTtsService() {
        return new AliArsTtsService();
    }

    static class DevCondition implements Condition {
        @Override
        public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
            String activeProfile = context.getEnvironment().getProperty("spring.profiles.active");
            return activeProfile != null && activeProfile.equals("dev");
        }
    }

    static class ProdCondition implements Condition {
        @Override
        public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
            String activeProfile = context.getEnvironment().getProperty("spring.profiles.active");
            return activeProfile != null && activeProfile.equals("prod");
        }
    }


}
