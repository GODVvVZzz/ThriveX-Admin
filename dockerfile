# 使用 Node.js 作为基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制项目文件
COPY . .

# 安装依赖
RUN npm install --frozen-lockfile

# 暴露 3000 端口
EXPOSE 3001

# 运行 Vite 服务器
CMD ["npm", "run", "preview"]


