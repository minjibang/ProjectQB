package socket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		//TODO 테스트 이후"*" -> "corin.site"로 변경
	
		registry.addHandler(new LoginSocketHandler(), "/count.do").setAllowedOrigins("*");
	}
	
	@Bean
	public WebSocketHandler MultiHandler() {
		return new LoginSocketHandler();
	}


}
