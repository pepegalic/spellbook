{{ config(
        schema = 'tokens_bnb',
        alias = 'balances',
        materialized = 'view'
        )
}}

with balances_raw as (
{{balances_fix_schema(source('tokens_bnb', 'balances_bnb_0001'), 'bnb')}}
)

{{
    balances_enrich(
        balances_raw = 'balances_raw',
    )
}}
