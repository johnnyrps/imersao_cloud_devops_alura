FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o arquivo de dependências para o container
# Isso é feito primeiro para aproveitar o cache do Docker.
# Se o requirements.txt não mudar, o Docker não reinstalará as dependências.
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação usará (padrão 8000 para FastAPI)
EXPOSE 8000

# Comando para iniciar a aplicação quando o container for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

 