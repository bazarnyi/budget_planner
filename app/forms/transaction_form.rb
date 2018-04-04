class TransactionForm < Reform::Form
  include Reform::Form::ActiveModel
  include Reform::Form::ActiveModel::FormBuilderMethods

  model :transaction

  property :amount
  property :date
  property :comment

  validates :amount, :date, presence: true

  validates :amount, format: {with: /\A\d+(?:\.\d{0,2})?\z/},
            numericality: { other_than: 0 }

  validates :comment, length: {maximum: 160}
end