# Repair report: red-team round 2 of GeometryOfNumbersAndQuadraticArithmeticPartII

Two findings in total: pass a F01 and pass b F01. They do not overlap. Only `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Review r2a, finding F01 (transfer functional Checks).

§5.3 Checks: the old last Check only restated λ(1)=0, λ(s)=1. It is replaced by three Checks: (i) λ((1+s)²)=2, where −λ gives −2 and λ/2 gives 1; (ii) the transfer of ⟨1⟩ is [[0,1],[1,0]], class 0, while the ordinary trace gives diag(2,−6), signed determinant 12 ≡ 3, nonzero; (iii) the transfer of ⟨s⟩ is diag(1,−3)=2u+c, while −λ gives 6u+c, a difference of 4u≠0. The target text is unchanged.

Verification. With λ(a+bs)=b and s²=−3, s³=−3s:
- ⟨1⟩ ↦ [[0,1],[1,0]].
- ⟨s⟩ ↦ diag(λ(s),λ(s³))=diag(1,−3), with off-diagonal entry λ(s²)=0.
- Comparing ⟨1,−3⟩ with 2u+c=⟨1,1,1,3⟩: stabilise to ⟨1,−3,1,−1⟩. Both forms have determinant 3. Both have Hasse invariant +1, because the only nontrivial pair (−3,−1)₂ is +1 (ε(−3)=0).
- Along −λ the transfer is −(2u+c)=6u+c, since 2c=0. The difference is 4u, which is nonzero by the §4.1 Check (Hasse invariant of ⟨1,−1,1,−1⟩ is −1).
- Trace: Tr(1)=2, Tr(s)=0, Tr(s²)=−6. Signed determinant −(−12)=12=4·3, and 3≢1 mod 8, so it is a nonsquare.
- The claim that t cannot fix the sign holds: the §5.4 worked example gives λ_*(t)=c, and (−λ)_*(t)=−c=c.

## F01 (P3) — applied

Review r2b, finding F01 (scope wording on field Witt theory).

Scope bullet: "owns odd-characteristic field Witt theory" → "owns field Witt theory in characteristic different from two".

Evidence: QuadraticFormInvariants README on main, Conventions line 85: "`K` is a field with `[Invertible (2 : K)]`". The pinned `TauCeti.WittRing` has the same hypothesis. ℚ₂ has characteristic 0, so §4.1's use is in scope.

Pattern repair: the same wording appeared in the Layer 1 Examples, "without assuming an odd-characteristic Hasse–Minkowski theorem". It now reads "a characteristic-not-two Hasse–Minkowski theorem", because Hasse–Minkowski holds for all global fields of characteristic ≠ 2, number fields included. A grep finds no other occurrence of "odd-characteristic" or "odd characteristic" in the README, `Suggested.lean` or `metadata.toml`.

## Adversarial pass on changed text

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| λ((1+s)²) | λ, −λ, λ/2 | 2, −2, 1 | true; separates the normalizations |
| λ_*⟨1⟩ | λ vs Tr | [[0,1],[1,0]] (class 0) vs diag(2,−6), signed det 12 ≡ 3 nonsquare | true |
| λ_*⟨s⟩ | λ vs −λ | ⟨1,−3⟩=2u+c (det 3, Hasse +1 after stabilising) vs ⟨−1,3⟩=6u+c; difference 4u (Hasse −1 ≠ +1) | true |
| λ_*(t) sign-blind | λ, −λ | c, −c=c | true, as stated |
| Scope: char ≠ 2 | ℚ₂ (char 0), 𝔽₃(t) (char 3), 𝔽₂ (excluded) | supplier hypothesis `Invertible 2` holds, holds, fails | wording matches the supplier |

## Checks

- `lake env lean packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean`: elaborates. The only output is three `declaration uses 'sorry'` warnings, at lines 51, 82 and 95. The file is unchanged, so the elaborated signatures in the supplied `signatures.md` still hold. No `#check` re-comparison was needed.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 56 roadmaps, 646 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.

## Notes for the maintainer

No Lean names changed and no cross-roadmap citations changed. No new sources and no new supplier gaps were needed.
