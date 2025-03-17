# 使用 Node.js 20 Alpine 作为构建阶段
FROM node:20-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json，利用 Docker 缓存
COPY package.json package-lock.json ./

# 安装依赖
RUN npm install --frozen-lockfile

# 复制项目代码
COPY . .

# 构建 Vite 项目
RUN npm run build

# 使用 Nginx 作为运行环境
FROM nginx:1.25-alpine

# 复制 Nginx 配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 复制构建好的静态文件到 Nginx 目录
COPY --from=builder /app/dist /usr/share/nginx/html

# 暴露 3000 端口
EXPOSE 3000

# 运行 Nginx
CMD ["nginx", "-g", "daemon off;"]
