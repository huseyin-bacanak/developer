FROM rave/java8:2.0

ENV GRADLE_VERSION 2.11
	
RUN mkdir -p /development/workspace \
	&& mkdir -p /development/tool
WORKDIR /development/tool

RUN curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip && \
  unzip gradle-${GRADLE_VERSION}-all.zip && \
  ln -s gradle-${GRADLE_VERSION} gradle && \
  rm gradle-${GRADLE_VERSION}-all.zip

ENV GRADLE_HOME /development/tool/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

WORKDIR /development/workspace

CMD ["/bin/bash"]