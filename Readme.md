# Laravel 4x AWS OpsWoks Recipes

These recipes will set-up Laravel 4x on Laravel OpsWorks

### Version
0.1
### Installation

You will need Larvel in a public/private repo added as an application in OpsWorks and to enable custom cookbooks in your stack.

Create a new PHP layer and click on Recipes link on the layer and then EDIT. 

Under Custom Chef Recipes use the following:

```sh
Setup: laravel::packages
```
```sh
Deploy: laravel::permissions laravel::database laravel::migrate
```
Then click Save to complete the set-up. 

Note: Migrations happen on each deploy and during set-up so if this isn't suitable then please remove the laravel::migrate recipe.