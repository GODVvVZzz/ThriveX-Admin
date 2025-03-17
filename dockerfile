# 使用 Node.js 作为基础镜像
FROM node:16

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制项目文件
COPY . .

# 增加 Node.js 内存限制
ENV NODE_OPTIONS="--max-old-space-size=2048"

# 构建项目
RUN npm run build

# 暴露 3001 端口
EXPOSE 3001

# 运行 Vite 预览服务器
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]


