package com.websocket.stream;

import java.net.InetSocketAddress;
import com.infopublic.util.Const;
import com.infopublic.util.Tools;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import org.springframework.web.socket.WebSocketSession;
public class NettyClient {

	private final String host;
	     private final int port;
	     public WebSocketSession conn;
	     public String message;
	     public NettyClient(WebSocketSession connection,String message) {
	    	 this.host = Tools.GetValueByKey(Const.CONFIG, "SERVERIP");
	    	 this.port = Integer.parseInt(Tools.GetValueByKey(Const.CONFIG, "SERVERPORT"));
	    	 this.message = message;
	    	 this.conn = connection;
	     }
	 
	     public void start() throws Exception {
	         EventLoopGroup group = new NioEventLoopGroup();
	         try {
	             Bootstrap b = new Bootstrap();
	             b.group(group) // 注册线程池
	                     .channel(NioSocketChannel.class) // 使用NioSocketChannel来作为连接用的channel类
	                     .remoteAddress(new InetSocketAddress(this.host, this.port)) // 绑定连接端口和host信息
	                     .handler(new ChannelInitializer<SocketChannel>() { // 绑定连接初始化器
	                                 @Override
	                                 protected void initChannel(SocketChannel ch) throws Exception {
//	                                     System.out.println(" connected...");
	                                     ch.pipeline().addLast(new NettyClientHandler(conn,message));
	                                 }
	                             });
//	             System.out.println(" created..");
	 
	             ChannelFuture cf = b.connect().sync(); // 异步连接服务器
//	             System.out.println(" connected..."); // 连接完成
	 
	             cf.channel().closeFuture().sync(); // 异步等待关闭连接channel
//	             System.out.println(" closed.."); // 关闭完成
	         } finally {
	             group.shutdownGracefully().sync(); // 释放线程池资源
	         }
	     }
	 

}
