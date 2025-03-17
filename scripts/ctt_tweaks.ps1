function CTTTweaks {
    # run ctt with config
    Invoke-Expression "& { $(Invoke-RestMethod https://christitus.com/win) } -Config ./config/tweaks.json -Run"
}