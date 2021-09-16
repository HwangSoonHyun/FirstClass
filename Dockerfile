FROM python:3.9.0

WORKDIR /home/

RUN echo 'reset_1'

RUN git clone https://github.com/HwangSoonHyun/FirstClass.git

WORKDIR /home/FirstClass/

RUN echo "SECRET_KEY=django-insecure-=l6nk%pr!zr=r)ff6f#^ifd_5apuv@wn0^rq=+hwuhm8uwymaz" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=FirstClass.settings.deploy && python manage.py migrate --settings=FirstClass.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=FirstClass.settings.deploy FirstClass.wsgi --bind 0.0.0.0:8000"]