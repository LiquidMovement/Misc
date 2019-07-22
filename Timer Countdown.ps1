
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$FormT = New-Object system.Windows.Forms.Form
$FormT.Width = '400'
$FormT.Height = '200'
$script:Label = New-Object System.Windows.Forms.Label
$script:boom = new-object System.Windows.Forms.Label
$script:boom.Location = '125,100'
$FormT.Controls.Add($boom)
$script:Label.AutoSize = $true
$script:Label.Location = '100,5'
$FormT.Controls.Add($Label)
$Timer = New-Object System.Windows.Forms.Timer
$Timer.Interval = 1000
$script:CountDown = 5
$Timer.add_Tick(
    {
        $script:Label.Text = "Self destruct initiated. 
Pete's System will be wiped in $CountDown seconds"
        $script:CountDown--
        if($script:CountDown -eq -1){
            $script:boom.Text = "BOOM!!"
        }
        if($script:CountDown -eq -2){
                $script:Timer.Stop()
                $FormT.close()
                }
    }
)
$script:Timer.Start()
$script:FormT.ShowDialog()

