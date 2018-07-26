Import-Module Microsoft.ADAL.PowerShell

function Set-LogAnalyticsWorkspaceConnection -AADAppID -AADAppkey
{
    param(
        [parameter(mandatory=$true)][string]$AADAppID
        [parameter(mandatory=$true)][string]$AADAppkey
    )
    $Token = Get-ADALAccessToken -AuthorityName contoso.onmicrosoft.com `
    -ClientId $AADAppID `
    -ResourceId https://api.loganalytics.io `
    -RedirectUri "http://yourredirecturi.local"

    return $Token
####Pythonコードだと以下########
#authority_url = "https://login.microsoftonline.com/microsoft.onmicrosoft.com"
#clientId = $AADAppID
#clientSecret = $AADAppkey
#redirect_uri = "http://localhost:3000/login"
#resource = "https://api.loganalytics.io"
#auth_context = adal.AuthenticationContext(authority_url)
#token = auth_context.acquire_token_with_client_credentials(resource, clientId , clientSecret)

}

function Get-LogAnalyticsQueryResult
{
    param(
        [parameter(mandatory=$true)][string]$Query
    )    
    #クエリを実行する。Pythonだと以下
    #api_endpoint = "https://api.loganalytics.io/v1/workspaces/0c97e69f-17c3-494c-a336-7bf6dbc338c7/query"
    #payload = {'query': 'Perf | take 10',
    #           'timespan': 'PT12H'}
    #headers = {'Content-Type': 'application/json',
    #          'Authorization': "Bearer " + token['accessToken']}
    #          SESSION = requests.Session()
    #SESSION.headers.update(headers)
    #SESSION.post(api_endpoint, data=json.dumps(payload)).json()
}

function Create-AADApplicationForLogAnalytics
{
    ##Azure AD Application を登録するコマンド。AAD への接続情報を引数として使用する必要がある。
    ##作ったAAD Application の APP GUID と APP Client Key を返すように作る。
}

Export-ModuleMember -Function Set-LogAnalyticsWorkspaceConnection, Get-LogAnalyticsQueryResult, Create-AADApplicationForLogAnalytics
