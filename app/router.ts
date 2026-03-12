import EmberRouter from '@embroider/router';
import config from 'glint-dynamic-import-extensions-bug/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  // Add route declarations here
});
