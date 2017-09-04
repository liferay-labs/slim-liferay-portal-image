FROM mdelapenya/liferay-portal:7-ce-ga4-tomcat-hsql
MAINTAINER Cristina González Castellano <cristina.gonzalez@liferay.com>

USER root

RUN apt-get update
RUN apt-get install zip unzip

# Clean Collaboration Suite

RUN mkdir -p /tmp/lpkg/collaboration
RUN unzip /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Collaboration.lpkg -d /tmp/lpkg/collaboration
RUN rm -rf /tmp/lpkg/collaboration/*wiki*
RUN rm -rf /tmp/lpkg/collaboration/*blog*
RUN rm -rf /tmp/lpkg/collaboration/*bookmarks*

COPY marketplace/collaboration-liferay-marketplace.properties /tmp/lpkg/collaboration/liferay-marketplace.properties

RUN cd /tmp/lpkg/collaboration && zip -r /tmp/lpkg/Liferay\ CE\ Collaboration.lpkg .

RUN cp /tmp/lpkg/Liferay\ CE\ Collaboration.lpkg /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Collaboration.lpkg

# Clean Foundation Suite

RUN mkdir -p /tmp/lpkg/foundation
RUN unzip /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Foundation.lpkg -d /tmp/lpkg/foundation
RUN rm -rf /tmp/lpkg/foundation/*product-app-theme*
RUN rm -rf /tmp/lpkg/foundation/*user-dashboard-theme*
RUN rm -rf /tmp/lpkg/foundation/*user-profile-theme*
RUN rm -rf /tmp/lpkg/foundation/*admin-theme*

COPY marketplace/foundation-liferay-marketplace.properties /tmp/lpkg/foundation/liferay-marketplace.properties

RUN cd /tmp/lpkg/foundation && zip -r /tmp/lpkg/Liferay\ CE\ Foundation.lpkg .

RUN cp /tmp/lpkg/Liferay\ CE\ Foundation.lpkg /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Foundation.lpkg

# Clean Forms & Workflow Suite

RUN mkdir -p /tmp/lpkg/formsWorkflow
RUN unzip /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Forms\ and\ Workflow.lpkg -d /tmp/lpkg/formsWorkflow
RUN rm -rf /tmp/lpkg/formsWorkflow/*workflow*
RUN rm -rf /tmp/lpkg/formsWorkflow/*polls*
RUN rm -rf /tmp/lpkg/formsWorkflow/*calendar*

COPY marketplace/formsWorkflow-liferay-marketplace.properties /tmp/lpkg/formsWorkflow/liferay-marketplace.properties

RUN cd /tmp/lpkg/formsWorkflow && zip -r /tmp/lpkg/Liferay\ CE\ Forms\ and\ Workflow.lpkg .

RUN cp /tmp/lpkg/Liferay\ CE\ Forms\ and\ Workflow.lpkg /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Forms\ and\ Workflow.lpkg

# Clean Web Experience Suite

RUN mkdir -p /tmp/lpkg/webExperience
RUN unzip /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Web\ Experience.lpkg -d /tmp/lpkg/webExperience
RUN rm -rf /tmp/lpkg/webExperience/*asset*
RUN rm -rf /tmp/lpkg/webExperience/*journal.content*

COPY marketplace/webExperience-liferay-marketplace.properties /tmp/lpkg/webExperience/liferay-marketplace.properties

RUN cd /tmp/lpkg/webExperience && zip -r /tmp/lpkg/Liferay\ CE\ Web\ Experience.lpkg .

RUN cp /tmp/lpkg/Liferay\ CE\ Web\ Experience.lpkg /usr/local/liferay-ce-portal-7.0-ga4/osgi/marketplace/Liferay\ CE\ Web\ Experience.lpkg

RUN rm -rf  /tmp/lpkg

#Include portal-ext.properties

COPY portal-ext.properties /usr/local/liferay-ce-portal-7.0-ga4/portal-ext.properties