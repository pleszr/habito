param (
    [string]$Action
)

if ($null -eq $Action) {
    Write-Host "Invalid action specified. Please use one of the following options: --docker-up-mysql-keycloak, --docker-up-frontend, --docker-up-backend, --docker-down"
    exit 1
}

switch ($Action) {
    "--docker-up-mysql-keycloak" {
        Write-Host "Starting Docker and Keycloak..."
        docker-compose -f docker-compose.yml up -d mysql motivaa-keycloak
        Write-Host "Waiting for dependencies to start..."
        Start-Sleep -Seconds 60
    }
    "--docker-up-frontend" {
        Write-Host "Starting frontend..."
        docker-compose -f docker-compose.yml up --build -d frontend
        Write-Host "Waiting for frontend to start..."
        Start-Sleep -Seconds 20
        Write-Host "Frontend started: endpoint: http://localhost:3000"
    }
    "--docker-up-backend" {
        Write-Host "Starting backend..."
        docker-compose -f docker-compose.yml up --build -d backend
        Write-Host "Waiting for backend to start..."
        Start-Sleep -Seconds 60
        Write-Host "Backend started: endpoint: http://localhost:8093"
    }
    "--docker-down" {
        Write-Host "Stopping Docker containers..."
        docker-compose -f docker-compose.yml down
    }
    default {
        Write-Host "Invalid action specified. Please use one of the following options: --docker-up-mysql-keycloak, --docker-up-frontend, --docker-up-backend, --docker-down"
    }
}


