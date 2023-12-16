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
  vim \
  postgresql \
  postgresql-contrib \
  unzip \
  && \
  rm -rf /var/lib/apt/lists/*

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN chsh -s $(which zsh)

# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Zsh plugins
RUN git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy Zsh configuration
COPY ./dotfiles/.zshrc /root/.zshrc
COPY ./dotfiles/.p10k.zsh /root/.p10k.zsh

# Install FZF
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

# Install ASDF
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# -e wasn't working here...??
RUN echo "\n. \$HOME/.asdf/asdf.sh" >> ~/.zshrc

# Install ASDF NodeJS
RUN /bin/zsh -i -c "asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git"

COPY ./asdf-node/.tool-versions /root/.tool-versions

# ASDF Install All
RUN /bin/zsh -i -c "asdf install"

# Set the working directory
WORKDIR /root/workspace

# Entry point
CMD ["zsh"]
