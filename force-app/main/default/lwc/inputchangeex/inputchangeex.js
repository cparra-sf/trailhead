import { LightningElement, track } from 'lwc';

export default class Inputchangeex extends LightningElement {
    @track myValue = "initial value";
    handleChange(evt) {
        this.myValue = evt.target.value;
        window.console.log('Current value of the input: ' + evt.target.value);
    }
}