# FIX-PKG-CohomologyOfGroups~7

One review, REV-PKG-CohomologyOfGroups~6, with one finding. Its "For the human reviewers" section
(Brown82 and CE56 are settled `uncertified`; Loh19 and MilneCFT are course notes) lists no finding
and changes nothing here.

## F01 (P2) — applied

**Verified.** InductionRestrictionPartII, at the head of its open pull request,
`TauCetiRoadmap/InductionRestrictionPartII/Suggested.lean`, states
`abelian_multiplier_exteriorSquare (A : Type) [CommGroup A]`, with no finiteness hypothesis:
`∃ e : ⋀[ℤ]^2 (Additive A) ≃+ Multiplier A` with `e (a ∧ b) = H2π z` for every 2-cycle
`z = single (a, b) 1 − single (b, a) 1`. Its `Multiplier A` is `groupHomology.H2 (Rep.trivial ℤ A ℤ)`,
and Mathlib's `groupHomology.H2 A` is the abbreviation `groupHomology A 2`
(`Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1059`). So the supplier's
theorem, reversed, is exactly our `nonempty_groupHomology_two_addEquiv_exteriorPower`. Its README,
RS.6.8, proves the general case by directed unions of finitely generated subgroups. It also has a
`ℤ²` Check. InductionRestrictionPartII comes before this roadmap in the merge order. Our README
described RS.6.8 as finite-only and planned the extension a second time. That duplicated an
earlier roadmap's target.

**Changed.**
- `Suggested.lean`: deleted `nonempty_groupHomology_two_addEquiv_exteriorPower` (old: existence of
  `H₂(A, ℤ) ≃+ ⋀[ℤ]^2 (Additive A)`) and the now-empty Layer 5 section comment. The module
  docstring now lists only Hopf's formula among the existence-of-isomorphism headlines.
- Scope and ownership: "for finite abelian `A`, the isomorphism `Λ²A ≅ H₂(A, ℤ)` … 5.4 extends
  RS.6.8's isomorphism to every abelian group" → "for every abelian group `A : Type`, finite or not
  … 5.4 consumes the exterior-square isomorphism and does not prove it: it identifies the
  degree-two part of its `ψ` at `k = ℤ` with RS.6.8's isomorphism".
- Exact supplier contracts, InductionRestrictionPartII RS.6.8: now the isomorphism for every
  abelian `A : Type`, from `⋀[ℤ]^2 (Additive A)` onto `groupHomology.H2 (Rep.trivial ℤ A ℤ)`,
  sending `a ∧ b ↦ ⟨a, b⟩`. It is consumed as the integral degree-two case of 5.4.
- §5.4 route: deleted the finite → `ℤʳ × T` → colimit proof of the integral degree-two isomorphism.
  It is replaced by the identification: `ψ` and RS.6.8's map are additive maps `Λ²A → H₂(A, ℤ)`
  that agree on the generators `a ∧ b`, so they are equal. The torsion-free and rational routes
  stay. *Needs:* "RS.6.8 (finite `A`)" → "RS.6.8 (the integral degree-two isomorphism)".
- §5.4 API: the "Integral comparison" bullet no longer names the deleted Lean theorem or says it
  "extends RS.6.8 from finite to all abelian groups". It now says that the degree-two part of `ψ`
  equals RS.6.8's isomorphism for every abelian `A`, so `ψ` is an isomorphism in degrees `≤ 2`.
  The "Degree-two classes" bullet no longer has its finite-only clause.
- §5.4 Checks: deleted "`ℤ²` and `ℚ` lie outside RS.6.8's finiteness hypothesis", which was false.
  Added an infinite-group orientation Check for `ℤ²`, attributed to the supplier (values below).
- The same pattern elsewhere: in the Layer 5 Dependencies, "RS.6.8 for finite abelian groups in 5.4"
  became "the isomorphism `Λ²A ≅ H₂(A, ℤ)` for every abelian group with which 5.4 identifies `ψ`". In
  the §7.2 Check (normal Sylow subgroup in homology), `H₂(P, ℤ) = Λ²P` was cited as "(5.4)" and now
  cites RS.6.8 and the naturality its formula gives. In the Layer 7 Dependencies, "Layer 5 (5.4) for
  a Check of 7.2" became "InductionRestrictionPartII RS.6.8 for a Check of 7.2". The §5.1 bullet
  comparing with RS.6.8's degree-two Künneth map was already correct and is unchanged.

No supplier gap is needed: the supplier already states the general theorem. `design/plan.json` is
unchanged.

## Checks run

- `lake env lean packages/CohomologyOfGroups/Suggested.lean` (from the content checkout): exit 0.
  The only diagnostics are 13 `declaration uses 'sorry'` warnings, one for each of the 13 remaining
  theorems (14 before; one deleted). There are 7 definitions, so 20 declarations.
- Signature check: I wrote a scratch copy with `#check @name` for all 20 declarations and
  elaborated it once (exit 0). The 20 elaborated types are the same as in the previous
  `signatures.md`. Each was compared with its README statement. No binder was lost and no
  signature changed. The deleted declaration is gone from both files, and the README no longer
  backticks it.
- Dependency direction:

  ```text
  depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
  `groupHomology.H2` was checked by hand at the pin (above), because the resolver does not check
  names outside TauCetiRoadmap on this host. The supplier target name is written without backticks
  in the contract, the README's existing style for other roadmaps' declarations.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Supplier contract: `Λ²A ≅ H₂(A, ℤ)` for every abelian `A : Type`, `a ∧ b ↦ ⟨a, b⟩` | `A = 1`, `ℤ/n`, `ℤ/2 × ℤ/2`, `ℤ/3 × ℤ/3`, `ℤ²`, `ℚ` | `Λ²` gives `0, 0, ℤ/2, ℤ/3, ℤ, 0`. `H₂` gives `0`, `0` (`groupHomologyIsoEven`: `ker N / im(ρ(g)−1)` with trivial action is `ker(n) = 0` on `ℤ`), then `H₁ ⊗ H₁ = ℤ/2`, `ℤ/3`, `ℤ`, and `0` (5.1 and the colimit). `ℚ`: `p/q ∧ r/s = (ps)(rq)(c ∧ c) = 0` with `c = 1/(qs)` | true for all; matches the supplier's statement |
| 5.4 identification: degree-two part of `ψ` at `k = ℤ` equals RS.6.8's map | generators `a ∧ b`; `A = ℤ/3 × ℤ/3` with `a = (1,0)`, `b = (0,1)`; `A = ℤ²` | `ψ(a ∧ b) = μ_*([a] × [b]) = μ_*([(a,1)|(1,b)] − [(1,b)|(a,1)]) = [a|b] − [b|a] = ⟨a, b⟩`. Both maps are additive and `Λ²A` is generated by the `a ∧ b`, so they are equal. Reversing the orientation gives `−⟨a,b⟩ = 2⟨a,b⟩ ≠ ⟨a,b⟩` in `ℤ/3` | true; the opposite convention is excluded by the `ℤ/3²` Check and the new `ℤ²` Check |
| 5.4: `ψ` is an isomorphism in degrees `≤ 2` for `k = ℤ` | degrees 0, 1, 2, 3; `A = ℤ/2` | degree 0: `ℤ = H₀`; degree 1: `A ≅ A^ab ⊗ ℤ = H₁`; degree 2: RS.6.8. Degree 3: `Λ³(ℤ/2) = 0` but `H₃(ℤ/2, ℤ) = ℤ/2` (existing Check) | true; the bound `≤ 2` is needed |
| New Check: orientation on `ℤ²` | `d[a|b] = [b] − [a+b] + [a]` (trivial coefficients) | `d([e₁|e₂] − [e₂|e₁]) = [e₂] − [e₁+e₂] + [e₁] − [e₁] + [e₁+e₂] − [e₂] = 0`. By 5.1, `H₂(ℤ×ℤ) = H₁ ⊗ H₁ = ℤ`, generated by the cross product of the generators. Reversing gives `−1` times it | true |
| §7.2 Check re-cited to RS.6.8: `G = (ℤ/3)² ⋊ ℤ/2`, `P = (ℤ/3)²` | inversion `φ = −1` on `P` | Naturality from the formula: `φ_*⟨a,b⟩ = ⟨φa, φb⟩`, so `φ` acts on `Λ²P = ℤ/3` by `(−1)(−1) = 1`. Invariants are `ℤ/3` and `H₂(G, ℤ) = ℤ/3`. The wrong model (action `−1`) gives `0` | true; value unchanged |
| Scope: torsion-free and rational comparisons stay with 5.4 | `A = ℚ`, `k = ℤ`; `A = ℤ/2`, `k = ℚ` | `H₁(ℚ, ℤ) = colim ℤ = ℚ = Λ¹ℚ` and `H₂ = Λ²ℚ = 0` (existing Check). `H₁(ℤ/2, ℚ) = 0 = (ℤ/2) ⊗ ℚ` | true; not owned by RS.6.8, which is integral degree two only |

## Ownership

The integral exterior-square isomorphism is now owned only by InductionRestrictionPartII (RS.6.8),
which is earlier in the merge order, and is cited here. This roadmap keeps the Pontryagin product,
`ψ`, its algebra laws, its identification with RS.6.8 in degree two, and the torsion-free and
rational comparisons in all degrees. No other roadmap among the open ones, those on main, or the
board packages plans these (the overlap check found no other owner). Ownership against the other
open pull requests was checked by object for this one change only (the exterior square and the
Pontryagin ring).

## For the maintainer

- `TauCetiRoadmap.CohomologyOfGroups.nonempty_groupHomology_two_addEquiv_exteriorPower` is deleted.
  This package is not on main, so no roadmap on main cites it. Any consumer should cite
  InductionRestrictionPartII's `abelian_multiplier_exteriorSquare` (RS.6.8).
- The citation of InductionRestrictionPartII RS.6.8 depends on its statement at the head of its
  open pull request: for every abelian `A : Type`, not only finite ones. If a revision of that pull
  request narrows RS.6.8 back to finite groups, 5.4 must take the extension back as a target.
- No `needs-references.toml` was written. No new source was needed.
