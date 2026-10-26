# FIX-DESIGN-ArithmeticLocallySymmetricSpacesPartII~4

One finding was raised in this review. It is applied.

## F01 (P1) — applied

The old §5.3 covered every σ. Its exact terms were only described in words, and the route relied on an unowned holomorphic Lefschetz count to get m(σ). The new §5.3 assumes σ^ι≃σ, where ι=diag(−1,1), and states the explicit formula −½dim σ^{U_N}+ε_k tr σ(S₄)+μ_k tr σ(S₃)+δ_{k,2}dim σ^{G_N}. The Lefschetz sentence is deleted. The N=3 Check now serves as the negative control. A new N=2 Check was added, and a new entry E10 records the correction.

**Verification.** fgt10 line 1340–1345 (Proposition 4.18, p. 25) states the formula for any σ with σ(−I)=(−1)^k. ε_k and μ_k are defined at fgt10 lines 1276–1286, equation (4.7). Take N=3, k=4 and σ=ω, an order-three character of SL₂(𝔽₃):
- ω(T)≠1, so dim σ^U=0.
- S₄ lies in Q₈, the kernel of ω, so tr σ(S₄)=1.
- μ_4=0 and ε_4=1/4.

The formula then gives 3/12+1/4=½. A multiplicity cannot be ½, so the formula is false for this σ. For ω⊕ω̄ it gives 1, which equals m(ω)+m(ω̄).

The Eichler–Shimura route the source indicates (line 1346–1347) computes only m(σ)+m(σ^ι). So the statement holds when σ^ι≃σ, and the reviewer is right.

Every restriction of a GL₂(ℤ/Nℤ)-representation τ satisfies σ^ι≃σ, because τ(ι) intertwines the two. That is the only case §5.6 uses, since it consumes tensor products of the §5.4 types.

**The same pattern elsewhere.** The same statement and route appear in:
- plan node `WM.5/finite-type-dimension`: statement, `hypotheses` (was empty, now has the two hypotheses), proof step 2, acceptance.
- §5.6 route, README and plan node `WM.5/base-change-linear-count`: now cites §5.3 and says why its hypothesis holds.
- Source corrections: README E10, `sourceIssues` E10 in plan.json, and the fgt10 `cited_for` entry in plan.json and in `sources.toml`.

Nothing else cites Proposition 4.18 for a general σ. Line 117 already says §5.3 owns the formula. The 'Needs' line is unchanged, because the unowned Lefschetz input is gone.

**Where my repair differs from the suggested one.** I did not write "equivalently σ extends to ⟨G_N, ι⟩" into the statement, because the statement does not need it. In E10 I wrote "the formula can fail" for σ that are not ι-stable, not "the formula returns ½(m(σ)+m(σ^ι))". The averaging claim holds only after replacing the traces by their real parts, and I did not want to assert an identity I had not proved.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §5.3 formula, N=1, σ=1 | k=12; k=2 | 11/12−6/12+3/12+4/12=1 (=dim S₁₂); 1/12−6/12−3/12−4/12+1=0 | agrees |
| §5.3 formula, N=2 (G₂≅S₃, ι≡I) | k=6, types 1, sgn, std (U-inv 1,0,1; S₄ traces 1,−1,0; S₃ traces 1,1,−1) | 0, 1, 0 → total 1 = dim S₆(Γ(2)) = 6/2−2 | agrees; new Check |
| same | k=8 | 7/12−6/12+3/12−4/12=0; 7/12−3/12−4/12=0; 14/12−6/12+4/12=1 → total 2 = 8/2−2 | agrees |
| ε_k with the sign reversed (wrong model) | N=1, σ=1, k=6 | 5/12−6/12+3/12+4/12=½ | excluded by the N=2 Check |
| §5.3 without the ι hypothesis | N=3, k=4, σ=ω; σ=ω⊕ω̄ | ½ (not an integer); 1=m(ω)+m(ω̄) | hypothesis needed; negative-control Check |
| Hypothesis holds for §5.6 types | §5.4 types are restrictions from GL₂(ℤ/ℓ^ν); tensor products over ℓ∈R | the intertwiner τ(ι) is a product of the local τ_ℓ(ι) | §5.6 is unchanged |
| Parity condition | k odd, σ(−I)=−1 | ε_k=0 for odd k; the formula still has the μ_k and U-terms | kept as before |

## Checks

Dependency check, verbatim:

```text
candidate: ArithmeticLocallySymmetricSpacesPartII is not in the merge order yet; checked as if placed after CompletedCohomologyPartII (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 636 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. plan.json parses as JSON, sources.toml parses as TOML, and a scan of the README found no LaTeX delimiters.

## Notes for the maintainer

- No Lean names changed. There is no `Suggested.lean` at the design stage, so I did not run a `#check` comparison.
- No supplier was added. The holomorphic Lefschetz input was dropped instead of being given a supplier.
- No new sources were needed. `needs-references.toml` was not written.
- I checked ownership against open pull requests only through the reviewer's `roadmaps grep` results. No new owned object was introduced this round.
- The two `citations.md` leads (`IwasawaHomology.freeTwist`, `vanish_above_dim`) are names from the NoncommutativeAndEquivariantIwasawa roadmap. The reviewer resolved them at that roadmap's head, so they are unchanged.
