FROM odoo:16

# Switch to root user
USER root

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Install additional dependencies
RUN rm -f /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    build-essential \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to the Odoo user
USER odoo

# Copy requirements and install Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Copy custom Odoo addons (if any)
COPY ./addons /mnt/extra-addons
RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons

# Expose necessary port
EXPOSE 8069

# Default command
CMD ["/entrypoint.sh"]
