import pytest
from datetime import date, timedelta
from core.domain_error import InvalidExpenseDateError
from core.expense import Expense
from core.domain_error import (
    EmptyTitleError,
    InvalidAmountError,
)


def test_create_valid_expense():
    expense = Expense(
        id=1,
        title="Comida",
        amount=10.5,
        description="Almuerzo",
        expense_date=date.today(),
    )

    assert expense.title == "Comida"
    assert expense.amount == 10.5


def test_empty_title_raises_error():
    with pytest.raises(EmptyTitleError):
        Expense(id=1, title="", amount=10, description="", expense_date=date.today())


def test_negative_amount_raises_error():
    """
    Prueba que crear un objeto Expense con un valor negativo en el campo 'amount' (por ejemplo, -5)
    genera la excepción específica InvalidAmountError definida en domain_error.py.
    """
    invalid_amount = -5
    
    with pytest.raises(InvalidAmountError):
        Expense(id=1, title="Gasto inválido", amount=invalid_amount, description="Prueba de importe negativo", expense_date=date.today())


def test_future_date_raises_error():
    """
    Prueba que al intentar crear un objeto Expense con una fecha futura 
    se lanza InvalidExpenseDateError
    """
    future_date = date.today() + timedelta(days=1)

    with pytest.raises(InvalidExpenseDateError):
        Expense(id=1, title="Gasto con fecha futura", amount=50, description="Prueba de fecha futura no permitida", expense_date=future_date)
    ...
