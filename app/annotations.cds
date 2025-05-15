using { tabla_multiplicarSrv } from '../srv/service.cds';

annotate tabla_multiplicarSrv.Players with @UI.HeaderInfo: { TypeName: 'Player', TypeNamePlural: 'Players', Title: { Value: name } };
annotate tabla_multiplicarSrv.Players with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate tabla_multiplicarSrv.Players with @UI.Identification: [{ Value: name }];
annotate tabla_multiplicarSrv.Players with {
  name @title: 'Name'
};

annotate tabla_multiplicarSrv.Players with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: name }
];

annotate tabla_multiplicarSrv.Players with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: name }
  ]
};

annotate tabla_multiplicarSrv.Players with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate tabla_multiplicarSrv.Players with @UI.SelectionFields: [
  name
];

annotate tabla_multiplicarSrv.Games with @UI.HeaderInfo: { TypeName: 'Game', TypeNamePlural: 'Games' };
annotate tabla_multiplicarSrv.Games with {
  playerId @title: 'Player ID';
  lives @title: 'Lives';
  score @title: 'Score'
};

annotate tabla_multiplicarSrv.Games with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: playerId },
 { $Type: 'UI.DataField', Value: lives },
 { $Type: 'UI.DataField', Value: score }
];

annotate tabla_multiplicarSrv.Games with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: playerId },
 { $Type: 'UI.DataField', Value: lives },
 { $Type: 'UI.DataField', Value: score }
  ]
};

annotate tabla_multiplicarSrv.Games with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate tabla_multiplicarSrv.Results with @UI.HeaderInfo: { TypeName: 'Result', TypeNamePlural: 'Results' };
annotate tabla_multiplicarSrv.Results with {
  playerId @title: 'Player ID';
  score @title: 'Score';
  registrationDate @title: 'Registration Date'
};

annotate tabla_multiplicarSrv.Results with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: playerId },
 { $Type: 'UI.DataField', Value: score },
 { $Type: 'UI.DataField', Value: registrationDate }
];

annotate tabla_multiplicarSrv.Results with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: playerId },
 { $Type: 'UI.DataField', Value: score },
 { $Type: 'UI.DataField', Value: registrationDate }
  ]
};

annotate tabla_multiplicarSrv.Results with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

