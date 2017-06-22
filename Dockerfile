from debian:7

RUN apt-get update &&\
	apt-get install -y build-essential ccache file g++ gawk gettext git git-core &&\
	apt-get install -y libncurses5-dev libssl-dev mercurial python subversion sudo unzip wget xsltproc zlib1g-dev &&\
	apt-get clean -y &&\
	useradd -m lede &&\
	echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/lede &&\
	sudo -iu lede git clone https://github.com/lede-project/source.git lede &&\
	sudo -iu lede lede/scripts/feeds update -a
	sudo -iu lede lede/scripts/feeds install -a
