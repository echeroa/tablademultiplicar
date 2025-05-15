using { tabla_multiplicar as my } from '../db/schema.cds';

@path: '/service/tabla_multiplicar'
@requires: 'authenticated-user'
service tabla_multiplicarSrv {
  @odata.draft.enabled
  entity Players as projection on my.Players;
  @odata.draft.enabled
  entity Games as projection on my.Games;
  @odata.draft.enabled
  entity Results as projection on my.Results;
}