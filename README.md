# Midhack Web

Signup site for the Mid Sweden University and Mittmedia collaboration called Midhack.



## Installation

    # rvm install ruby-2.2.2      # or rbenv install 2.2.2
    # rvm use 2.2.2               # or rbenv local 2.2.2


    # bundle install
    # rake db:setup
    # foreman start

## Konfiguration

### Miljövariabler

    # Send emails
    export SENDGRID_API_KEY=""

## Kända saknade implementationer:
* Bugg: Användaren måste dubbeltrycka på knappar när man kommer via en facebook delning via på iPhone.
* Feature: Gör om val av kompetens till att ha filler buttons för att tydligare se vilka kompetenser som saknas i vilka lag.
* Feature: Modifiera vy för val av lag så att jag kan byta kompetens eller skriva upp mig på väntelistan när min kompetens är maxad i laget jag ska välja.
* Feature: Stänga anmälan på rätt datum.
