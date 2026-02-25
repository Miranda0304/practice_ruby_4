# syntax=docker/dockerfile:1
FROM ruby:4.0.1

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client  

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy rest of app
COPY . .


# Start the Rails server
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]