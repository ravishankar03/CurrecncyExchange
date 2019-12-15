Steps:

- The project has the main file viewController.swift

- I have followed MVVM pattern.

- I have designed the UI in such a way that user can see the exhange rates of multiple currencies instead of a 1:1 currency view.

Keypoints

1) An API call is made in viewdidload  which calls a method in the viewmodel.
2) The default values are selected as INR and amount: 1000
3) On click of select Currency button user has the option to change the current currency.
4) An input view is present where the user can change the amount.

5) the currency api used is "https://api.openrates.io/latest?base=\(currency)" which returns a list of currency codes and currency exchange rates.
6) Currencymodel.swift has the model structure.
7) the UI auto refreshes on every key entered.
8) text field accepts only numbers.

