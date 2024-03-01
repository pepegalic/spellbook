{{ config(
        schema = 'tokens_arbitrum',
        alias = 'balances',
        materialized = 'view'
        )
}}

with balances_raw as (
{{balances_fix_schema(source('tokens_arbitrum', 'balances_arbitrum_0001'),'arbitrum')}}
)

{{
    balances_enrich(
        balances_raw = 'balances_raw',
    )
}}
