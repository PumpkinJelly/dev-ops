FROM python:3.11-slim

WORKDIR /app

COPY Fomin_Klim_info.txt .

RUN echo '#!/usr/bin/env python3' > /app/app.py && \
    echo 'import os, socket, datetime' >> /app/app.py && \
    echo 'print("=" * 50)' >> /app/app.py && \
    echo 'print("     DevOps Student Application")' >> /app/app.py && \
    echo 'print("=" * 50)' >> /app/app.py && \
    echo 'print(f"Name:        {os.getenv(\"STUDENT_NAME\", \"Klim\")}")' >> /app/app.py && \
    echo 'print(f"Surname:     {os.getenv(\"STUDENT_SURNAME\", \"Fomin\")}")' >> /app/app.py && \
    echo 'print(f"Group:       {os.getenv(\"STUDENT_GROUP\", \"IT2-2312\")}")' >> /app/app.py && \
    echo 'print(f"Student ID:  {os.getenv(\"STUDENT_ID\", \"37073\")}")' >> /app/app.py && \
    echo '-' * 50 >> /app/app.py && \
    echo 'print(f"Hostname:    {socket.gethostname()}")' >> /app/app.py && \
    echo 'print(f"Started at:  {datetime.datetime.now().strftime(\"%Y-%m-%d %H:%M:%S\")}")' >> /app/app.py && \
    echo 'print("=" * 50)' >> /app/app.py && \
    echo 'print("Application is running successfully!")' >> /app/app.py && \
    echo 'print("=" * 50)' >> /app/app.py && \
    chmod +x /app/app.py

EXPOSE 8080
CMD ["python3", "/app/app.py"]
