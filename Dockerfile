FROM openresty/openresty:alpine-fat

# Install dependencies
RUN apk add --no-cache luarocks \
    && luarocks install lua-resty-jwt

# Set Lua path to include luarocks modules
ENV LUA_PATH "/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;;"
ENV LUA_CPATH "/usr/local/lib/lua/5.1/?.so;;"

# Expose HTTP and HTTPS ports
EXPOSE 80 443

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
