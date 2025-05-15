sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'tablamultiplicar/tablademultiplicar/test/integration/FirstJourney',
		'tablamultiplicar/tablademultiplicar/test/integration/pages/GamesMain'
    ],
    function(JourneyRunner, opaJourney, GamesMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('tablamultiplicar/tablademultiplicar') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGamesMain: GamesMain
                }
            },
            opaJourney.run
        );
    }
);