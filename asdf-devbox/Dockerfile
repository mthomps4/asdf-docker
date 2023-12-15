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
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1 && \
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc

RUN /bin/zsh -i -c "asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git"

# ASDF RUBY DEPENDENCIES - https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
RUN apt-get update && \
  apt-get -y install \
  autoconf \
  patch \
  rustc \
  libssl-dev \
  libyaml-dev \
  libreadline6-dev \
  zlib1g-dev \
  libgmp-dev \
  libncurses5-dev \
  libffi-dev \
  libgdbm6 \
  libgdbm-dev \
  libdb-dev \
  uuid-dev \
  vim

RUN /bin/zsh -i -c "asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git"

# PYTHON DEPENDENCIES - https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN apt-get update && \
  apt-get -y install \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev

RUN /bin/zsh -i -c "asdf plugin-add python"

# FOR ERLANG https://github.com/asdf-vm/asdf-erlang?tab=readme-ov-file#ubuntu-2004-lts
RUN apt-get update && \
  apt-get -y install \
  autoconf \
  m4 \
  libncurses5-dev \
  libwxgtk3.0-gtk3-dev \
  libwxgtk-webview3.0-gtk3-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libpng-dev \
  libssh-dev \
  unixodbc-dev \
  xsltproc \
  fop \
  xsltproc \
  libxml2-utils \
  libncurses-dev \
  openjdk-11-jdk

RUN /bin/zsh -i -c "asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git"

# ELIXIR DEPENDENCIES - https://github.com/asdf-vm/asdf-elixir?tab=readme-ov-file#install (unzip)
RUN /bin/zsh -i -c "asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"

COPY ./asdf-devbox/.tool-versions /root/.tool-versions
RUN /bin/zsh -i -c "asdf install"

# Set the working directory
WORKDIR /root/workspace

# Entry point
CMD ["zsh"]