
# Write-Output returns a string.
$theWrite = Write-Output -InputObject "test"

Write-Output $theWrite.GetType()

# New-Item -Path . -Name "testfile1.txt" -ItemType "file" -Value "This is a text string."
New-Item -Path "testfile1.txt" -ItemType "file" -Value "This is a text string."

# to get content of a file
Get-Content -Path "testfile1.txt"

Set-Item -Path ENV:A_WOTO_TEST -Value 1

class LanguageDetectorClient {
    LanguageDetectorClient(<#OptionalParameters#>) {
        <# Initialize the class. Use $this to reference the properties of the instance you are creating #>
        $this.Equals()
    }

    [string]GetLanguageCode() {

        return ""
    }
}
