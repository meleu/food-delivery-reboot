# meleu notes

> **Don't fret!!** This is, IMO, the hardest coding part of the bootcamp! If you
> feel desperate, keep calm! Things are going to be a little calmer soon...

**Common question**: why are we spreading our software across several different files?

The answer is: software **MUST** be easy to change.

That's what the term **soft** in soft-ware means. As opposed to hard-ware.

So, we are creating all this different files so we can make our software easier to change, even if sacrificing the easiness to write. Of course we want easier ways to write software, but making it easier to change is a priority.

## Recommended flow for coding

- code the model
  - test it in `test.rb`
- code the repository
  - test it in `test.rb`
- code the controller and the view
  - test using the `router`
  - configure the `router` properly in the `app.rb`
