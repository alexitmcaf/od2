FROM odoo:16

USER root

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Ensure odoo user exists
RUN id odoo || useradd -m -d /var/lib/odoo -s /bin/bash odoo

# Install additional dependencies
RUN apt-get update && apt-get install -y --allow-downgrades --no-install-recommends \
    python3-pip \
    build-essential \
    libpq5=13.18-0+deb11u1 \
    libpq-dev=13.18-0+deb11u1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Copy custom Odoo addons (if any)
COPY ./addons /mnt/extra-addons
RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons

# Switch to odoo user
USER odoo

# Expose necessary port
EXPOSE 8069

# Default command
CMD ["/entrypoint.sh"]
