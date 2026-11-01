FROM node:20-alpine

WORKDIR /app

# Install pnpm (cheki uses pnpm for dependency management)
RUN npm install -g pnpm

# Copy all project files into the container
COPY . .

# Install dependencies
RUN pnpm install --frozen-lockfile || pnpm install

# Build the Next.js application
RUN pnpm build

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["pnpm", "start"]
