import type Owner from '@ember/owner';
import Component from '@glimmer/component';
import type { ComponentLike } from '@glint/template';
import { tracked } from '@glimmer/tracking';

interface ExampleSignature {
  Args: {
    name: string;
  }
}

export default class Example extends Component<ExampleSignature> {

  @tracked component: ComponentLike | undefined;

  constructor(owner: Owner, args: ExampleSignature['Args']){
    super(owner, args);
    void this.getComponent();
  }

  getComponent = async () => {
    const component = await import('./dynamic'); // This works fine
    // const component = await import('./dynamic.gts'); // This throws @typescript-eslint/no-unsafe-assignment but it does work
    this.component = component.default;
  }

  <template>
    {{#if this.component}}
      <this.component />
    {{else}}
      Loading...
    {{/if}}
  </template>
}
