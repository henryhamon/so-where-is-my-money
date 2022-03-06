ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE

USER root

WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}
ENV PIP_TARGET=${ISC_PACKAGE_INSTALLDIR}/mgr/python

RUN pip3 install numpy \
        pandas \
        matplotlib \
        scikit-learn

#COPY  Installer.cls .
COPY  src src
COPY Installer.cls Installer.cls
COPY module.xml module.xml
COPY iris.script iris.script

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly
