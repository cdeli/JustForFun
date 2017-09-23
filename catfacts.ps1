#Run this every 1/2 hour and in an 8 hour work day there will be approximately 3 times per day that your victim hears a cat fact
if ((Get-Random -Maximum 10000) -lt 1875) {
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
#This API only supports TLS 1.2, which is not loaded by default in newer .NET installs
    [Net.ServicePointManager]::SecurityProtocol = 'Tls12'
    $CatFact = (ConvertFrom-Json (Invoke-WebRequest -Uri 'https://catfact.ninja/fact')).fact
    $SpeechSynth.Speak("did you know" + $CatFact)
}
