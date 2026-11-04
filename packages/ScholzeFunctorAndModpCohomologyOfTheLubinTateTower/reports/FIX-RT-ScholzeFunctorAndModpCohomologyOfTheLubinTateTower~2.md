# FIX-RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2

## RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2a/F01 (P2) — applied

Verified. STR08 line 391: M_m over F̆ is connected. STR08 line 337: it has (q−1)q^{m−1} components only after base change to an extension that contains the Lubin–Tate extension. §0.2 now fixes C/F̆ and makes every count geometric. It adds that the space over F̆ is connected for all m≥0, cites STR08 line 391, and gains the Check r=1, ℚ₃, m=1 (count 1 over F̆, 2 over C). Other component statements (§0.2 m=0 and ℚ₂ Checks, §5.4 n=0 Check, §6.4 Check) were already geometric or descent statements.

## RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2a/F02 (P1) — applied

Verified. LUD17 lines 925–934: B′ is the kernel of val∘det, B(ℚ_p)≅B′⋊ℤ, M_∞≅⊔_ℤ M_∞⁽⁰⁾ and M_∞/B(ℚ_p)≅M_∞⁽⁰⁾/B′. In §3.1, "intermediate and final quotient maps respect height" becomes four claims: M_∞⁽⁰⁾→M_B stays in height zero, the final quotient identifies all heights, M_∞⁽⁰⁾/B′≃M_∞/B, and no integer height descends. M_B is the limit of the finite-level Borel quotients. Added the Check h(x)=0, h(x·diag(p,1))=1, q(x)=q(x·diag(p,1)).

## RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2a/F03 (P3) — applied

Verified: q:M_∞→M_∞/B, so maps out of the quotient are tested by precomposition. "Postcomposing a descended map with q detects its equality" → "Precomposing maps out of M_∞/B with q detects their equality: f∘q=g∘q forces f=g, and f=π̄ recovers π̄∘q=π_GH". No other occurrence: the "postcomposition" in §2.1 correctly refers to coefficient maps.

## RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2b/F01 (P3) — applied differently

Verified: CDN23 line 1565 (Theorem 4.1) and line 1567 (Remark 4.2) cover constant coefficients only. §5.4 now says the μ_p case is not in CDN23 and proves it by descent from K′=K(ζ_p). The reviewer's sequence keeps a term H¹(Γ,H⁰), but that term vanishes because |Γ| divides p−1. So H¹(M_K,μ_p)=(H¹(M_{K′},𝔽_p)⊗μ_p)^Γ is a G-direct summand. Added a Check for K=ℚ₅, Γ≅ℤ/4.

## Checks run

- `lake env lean packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean`, run from the content checkout: exit 0. The only output is three `declaration uses sorry` warnings (lines 69, 96, 115). The one change to `Suggested.lean` is a `module` header line above `import Mathlib`. It answers the worker's warning that Mathlib is designed for the module system. The imports are unchanged and no Lean name was added or removed. `#check @name` for all four declarations was elaborated in one scratch file. The types match the signatures record exactly.
- Dependency check: `depcheck: 201 roadmaps, 1438 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Geometric height-zero components at K_m are (O_F/ϖᵐ)ˣ; connected over F̆ | r=1, ℚ₃, m=1; m=0; ℚ₂, m=1,2 | over F̆: 1; over C: 2 = (q−1)q⁰. m=0: 1 and 1. ℚ₂: 1 and 2, transition 2→1 | agrees with STR08 lines 337, 391 |
| Final quotient identifies heights; M_∞⁽⁰⁾/B′≃M_∞/B | b=diag(p,1), diag(p,p⁻¹), b∈B(ℤ_p) | height shifts 1, 0, 0; all lie in one q-fibre | agrees with LUD17 line 927 |
| M_B is the limit of the finite-level Borel quotients | level-zero quotient by B(ℤ_p) | the limit is M_∞⁽⁰⁾/B(ℤ_p) (LUD17 line 917) | agrees |
| Precomposition with q detects equality | f=g=π̄ | π̄∘q=π_GH, typed M_∞→ℙ¹_C | typed and consistent |
| μ_p descent | K=ℚ₅, Γ=ℤ/4; K∋ζ_p, Γ=1 | Hⁱ(Γ,V)=0 for i≥1 because 4∈𝔽₅ˣ; with Γ=1, μ_p≃𝔽_p and there is nothing to descend | the error term vanishes, so the result is a direct summand |

## Notes for the maintainer

- No name that another roadmap cites changed.
- `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. `Suggested.lean` changed only by the `module` header line, and its statements are as before. No new source, supplier or gap was needed.
- No new construction was added, so ownership did not need re-examining.
- I started from the earlier unsubmitted attempt and kept its edits. I added one change: the §3.1 API bullet now says M_B is the limit of the finite-level Borel quotients. The earlier text claimed that the final quotient "commutes with level transitions", which is not well typed.
