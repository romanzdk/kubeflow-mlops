#!/bin/bash

# Úvodní proměnné
account_name=sawetestzydr00 # Název storage accountu
rg=rg-diplomka              # Název resource group
location=westeurope         # Název geolokace

# Přihlášení do Azure
# třeba přihlásit v prohlížeči
# možno přidat username a password jako parametry
az login

echo "Nastavuji subskripci..."
az account set \
    -s "Azure for Students"

echo "Vytvářím resource group..."
az group create \
    --name $rg \
    --location $location

echo "Vytvářím storage account..."
az storage account create \
    --name $account_name \
    --resource-group $rg \
    --location $location

echo "Vytvářím kontejner..."
az storage container create \
    --name artifact-store \
    --account-name $account_name \
    --resource-group $rg

# Získání connection stringu
az storage account show-connection-string \
    --name $account_name \
    --resource-group $rg