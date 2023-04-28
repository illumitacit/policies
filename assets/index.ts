// Bundler imports: these are not used directly in the code, but exist to ensure the bundler includes the relevant
// libraries in the final package.
import "./css/main.css";
// End Bundler imports

import { Application } from "@hotwired/stimulus";
import Dropdown from "stimulus-dropdown";

// Load Stimulus controllers so that they can be used with pure HTML definitions.
const application = Application.start();
// Thirdparty Stimulus controllers
application.register("dropdown", Dropdown);
