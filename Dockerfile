FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/HwangSoonHyun/FirstClass.git

WORKDIR /home/FirstClass/

RUN echo "SECRET_KEY=django-insecure-=l6nk%pr!zr=r)ff6f#^ifd_5apuv@wn0^rq=+hwuhm8uwymaz" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "FirstClass.wsgi", "--bind", "0.0.0.0:8000"]