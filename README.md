## Xamarin Component Store Shim Package Builder

This repo automates building of NuGet packages that automate the creation of
packages that "wrap" Xamarin Store components. When a project adds one of
these packages, the end result is as if they went to the Components folder and
added the referenced Component.

This allows NuGet packages to depend on Xamarin components (most notably, the
Google Support Library), without actually repackaging these components into
NuGet packages.

### YOU SHOULD PROBABLY NOT USE THESE (unless you're a library author)

If you're writing an *App*, you should ignore these packages, and just
directly add the Component to your app. This is for library authors who depend
on Xamarin Components in a NuGet package.

### How does it work?

```sh
vim package.list   ### Edit list of packages to generate
make
open ./target
```
