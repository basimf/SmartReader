FROM mcr.microsoft.com/dotnet/core/sdk:3.1

COPY . /app/

WORKDIR /app

RUN ["dotnet", "build", "src/SmartReader/SmartReader.csproj"]
RUN ["dotnet", "build", "src/SmartReader.WebDemo/SmartReader.WebDemo.csproj"]

EXPOSE 5000/tcp

ENTRYPOINT [ "dotnet", "run", "--project", "src/SmartReader.WebDemo/SmartReader.WebDemo.csproj", "--no-restore", "--urls", "http://0.0.0.0:5000"]