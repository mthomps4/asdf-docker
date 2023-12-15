# Use the official Ubuntu as the base image
FROM ubuntu:latest

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive
USER root

# Install necessary tools and dependencies
RUN apt-get update && \
  apt-get install -y \
  build-essential \
  git \
  curl \
  zsh \
  fonts-powerline \
  sudo \
  && \
  rm -rf /var/lib/apt/lists/*

# Create a non-root user and switch to it
# RUN adduser --disabled-password --gecos '' devuser
# RUN adduser devuser sudo
# RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# RUN apt-get update && \
#   apt-get install -y \
#   fonts-powerline

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN chsh -s $(which zsh)

# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Zsh plugins
RUN git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy Zsh configuration
COPY .zshrc /root/.zshrc
COPY .p10k.zsh /root/.p10k.zsh

# Install FZF
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

# Set the working directory
WORKDIR /root/workspace

# Entry point
CMD ["zsh"]