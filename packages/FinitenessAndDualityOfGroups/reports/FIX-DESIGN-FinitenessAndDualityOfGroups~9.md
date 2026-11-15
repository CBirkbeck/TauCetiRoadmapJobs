# FIX-DESIGN-FinitenessAndDualityOfGroups~9

Review settled: `REV-DESIGN-FinitenessAndDualityOfGroups~8` (two findings, both P3). Both are right
and both are applied. Files changed: `packages/FinitenessAndDualityOfGroups/design/README.md` and
`packages/FinitenessAndDualityOfGroups/design/plan.json`; `sources.toml` is unchanged.

## F01 (P3) — applied

Old → new: "From Tau Ceti" had no bullet for seven declarations the layers name. New: a bullet for
`TauCeti.groupHomology.transfer` with `transfer_comp_map_subtype_id` (2.3(c)); one for Schanuel's
lemma (8.3); bullets for the torus homology (2.4 Checks), `cwComplexProd` (5.1 Checks), the
coprime Swan case (7.4 Checks); `.of_isNoetherianRing` and `isGorensteinProjective_of_projective`
added to the existing pseudocoherence and Gorenstein bullets.

The repair follows the review's suggestion, with one difference: the seven declarations are not
lumped into one "Checks" bullet. Each goes into the bullet for its family, or gets its own bullet,
and the bullet names where it is used.

Verified at the Tau Ceti pin `2fd255d9` (file, line, signature read):

- `TauCeti.groupHomology.transfer` (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`
  line 79; `{R G : Type u} [CommRing R] [Group G]`, `[S.FiniteIndex]`) and
  `transfer_comp_map_subtype_id` (line 121: transfer then `map S.subtype (𝟙 _)` equals `S.index • 𝟙`).
- `TauCeti.exists_linearEquiv_comp_fst_eq_comp_snd_comp` (`TauCeti/Algebra/Module/Projective/Schanuel.lean`
  line 82; `[Semiring R]`, `A B` additive groups, both projective, `range a = range b`).
- `TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing` (`TauCeti/Algebra/Module/PseudoCoherent/Basic.lean`
  line 391; `[IsNoetherianRing R] [Module.Finite R M]` gives `IsPseudoCoherentOver R M ⊤`).
- `TauCeti.groupHomologyPiMultiplicativeIntExteriorPowerEquiv` (`TauCeti/AlgebraicTopology/ClassifyingSpace/Torus.lean`
  line 243; `k` and finite `ι` in one universe).
- `TauCeti.cwComplexProd` (`TauCeti/Topology/CWComplex/Classical/Product.lean` line 194; section
  hypotheses `[RelCWComplex.Finite C] [RelCWComplex.Finite D]`, line 187).
- `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat_of_not_dvd`
  (`TauCeti/NumberTheory/Padics/GroupAlgebra/Rational.lean` line 134; `¬p ∣ Nat.card G`).
- `CategoryTheory.isGorensteinProjective_of_projective` (`TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean`
  line 263, namespace `CategoryTheory` opened at line 218).

Repairing the pattern. I compared every backticked identifier in the layers (anything with a dot,
a capital letter or camelCase) against the identifiers backticked in Exact supplier contracts. Apart
from the seven Tau Ceti names, eight Mathlib names had no contract bullet: `MonoidAlgebra`
(1.2, 7.1), `Rep.trivial` (2.1), `Representation.ofModule'` (7.2), `ConjClasses` (7.1),
`PiTensorProduct` and `HomologicalComplex` (3.1, 8.1), `QuasiIso` and `IsNoetherianRing` (8.1),
`IsLocalRing` (7.5), and `Sylow` (8.8, 8.9). They now have one "Further carriers the layers name"
bullet under "From Mathlib". Each was checked at the Mathlib pin `1b1ccf4b` with file and line.
Sylow's existence theorem `Sylow.exists_subgroup_card_pow_prime` (`Mathlib/GroupTheory/Sylow.lean`
line 723) is named because 8.9's route uses it.

The 2.3 *Needs:* line also gains `TauCeti.groupHomology.transfer_comp_map_subtype_id`, the identity
2.3(c) actually uses for `hd_R`. This matches its cohomological twin
`map_subtype_id_comp_corestriction`, which is already named there. The plan's 2.3 prerequisites gain
`tauceti:TauCeti.groupHomology.transfer_comp_map_subtype_id`.

After the edit the comparison returns only notation (`Coind_H`, `Ind_H`, `Ind_K`, `Hom_A`) and
`leastENatBound`, the short form of the contracted `TauCeti.leastENatBound`.

## F02 (P3) — applied

Old → new: "CohomologyOfGroups excludes them by name in its Scope and names this roadmap among its
downstream consumers" → "… and describes a roadmap on finiteness conditions and duality groups
among its downstream consumers."

Evidence:
- `packages/CohomologyOfGroups/design/README.md` lines 74–76 exclude finiteness conditions, `cd`,
  `vcd`, duality groups, Euler characteristics and Farrell cohomology.
- Its line 2126 describes "a roadmap on finiteness conditions and duality groups" as a consumer.
- The string `FinitenessAndDualityOfGroups` occurs 0 times in that README.

Same pattern elsewhere: I searched the README and `plan.json` for other claims that a roadmap
"names" or "excludes" this one or its objects. The only other such claim is in Downstream consumers:
PosetHomotopyAndSubgroupComplexes, at the head of its open pull request, README line 104–107, places
outside its scope Brown's theorem on the `p`-fractional part of the Euler characteristic of a group
of finite virtual cohomological dimension. That claim is accurate as written and is unchanged.
`plan.json` has no counterpart sentence.

## Adversarial pass on the added text

| Statement added or changed | Instances tried and values computed | Result |
|---|---|---|
| `transfer_comp_map_subtype_id`: transfer then corestriction is `[G : S]·id` | `G = ℤ/2`, `S = 1`, `n = 0`, `M = ℤ`: transfer on `H₀ = ℤ` is `m ↦ 2m`, corestriction `H₀(1, ℤ) → H₀(G, ℤ)` is the identity, composite `×2 = [G : S]`. `S = G`: index 1, composite `id`. Infinite index would give `index = 0` and the zero map, excluded by `[S.FiniteIndex]` | correct as stated |
| 2.3(c) for `hd` through it | `G = ℤ/2 × ℤ ⊇ S = 0 × ℤ`. Over `ℚ` (2 a unit): `Hₖ(G, M)` is a retract of `Hₖ(S, M)`, so `hd_ℚ G ≤ 1`, and `H₁(G, ℚ) = ℚ` gives 1. Over `ℤ` (2 not a unit): `hd_ℤ G = ⊤` (`H_{2j+1}(ℤ/2, ℤ) = ℤ/2` survives) while `hd_ℤ S = 1`, so the unit hypothesis is needed | consistent with 2.3 Checks |
| Schanuel, automorphism form | `R = ℤ`, `A = B = E = ℤ`, `a = b = id`: `e = swap` gives `x = snd(e(x, y))`. `a = pr₁ : ℤ² → ℤ`, `b = id`: `ker a × B ≅ ℤ²`, `A × ker b = ℤ² × 0 ≅ ℤ²`, ranks 2 = 2. Projectivity used: `A = ℤ/2` (`a = id`), `B = ℤ` (`b` the reduction) gives kernels `0 × ℤ ≅ ℤ` against `ℤ/2 × 2ℤ`, not isomorphic | correct; hypothesis needed |
| 8.3 via generalized Schanuel | `G = 1`: `P = (ℤ)` against `P' = (ℤ ← ℤ² ← ℤ)`, `ℤ² → ℤ` the projection. Alternating ranks `1` and `2 − 1 = 1` agree, so `χ̃(1) = 1` | consistent with the 8.3 Check `χ̃(1) = 1` |
| torus homology `⋀ⁿ H₁(ℤ^ι, k) ≃ Hₙ(ℤ^ι, k)` | `ι = Fin 2`: `n = 0, 1, 2, 3` give `k, k², k, 0` on both sides (torus). `ι` empty: `ℤ^ι = 1`, `⋀ⁿ 0 = 0` for `n ≥ 1` and `k` for `n = 0`, equal to `Hₙ(1, k)` | correct; 2.4 Check `Hₙ(ℤⁿ, R) ≅ R` recomputed |
| `cwComplexProd` | `S¹ × S¹` with cells `(1, 1)` each: product cells `(1, 2, 1)` by `p + q = n`, the torus; `n`-fold product has top cell in dimension `n`; iterating needs finiteness of the product, which is the instance `finite_cwComplexProd` (line 211) | 5.1 Check `gd ℤⁿ = n` unchanged |
| `of_isNoetherianRing` | `ℤ` and `ℤ/2`: `0 → ℤ →×2 ℤ → ℤ/2`, pseudocoherent in every degree. Non-example: `R = ℚ[x₁, x₂, …]`, `M = R/(x₁, x₂, …)` is finitely generated but not finitely presented (not noetherian). `ℤG` for `G` finite is finite over `ℤ`, hence left noetherian | 1.2 Check unchanged |
| coprime Swan | `G = ℤ/3`, `p = 2`: `ℤ₂G ≅ ℤ₂ × ℤ₂[ζ₃]`; projectives are sums of the two factors, and the factors are told apart rationally (`ℚ₂` against `ℚ₂(ζ₃)`) | special case of `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`; the 7.4 Check is unchanged |
| `isGorensteinProjective_of_projective` | `Q = RG`: the disk `Q →𝟙 Q` is acyclic, and maps to projectives are null-homotopic. Non-example: trivial `R` over `R[ℤ]`, `R ≠ 0`, has projective dimension 1 and is not projective, so it is not Gorenstein projective | 9.1 Checks unchanged |
| `Sylow.exists_subgroup_card_pow_prime` | `S₃`: `2 ∣ 6` gives `⟨(12)⟩`; `3 ∣ 6` gives `A₃`; `n = 0` gives `⊥`; `4 ∤ 6`, hypothesis fails | matches its use in 8.9 |
| `QuasiIso`, `Rep.trivial`, `Representation.ofModule'`, `ConjClasses`, `MonoidAlgebra` | Read at the pin. `QuasiIso` means `QuasiIsoAt` in every degree (docstring: `homologyMap` is an isomorphism). `Rep.trivial k G V = Rep.of (Representation.trivial k G V)`. `ofModule'` needs `[IsScalarTower k k[G] M]`. `ConjClasses` is the quotient by `IsConj` | the descriptions match the pinned definitions |
| F02 sentence | Checked against CohomologyOfGroups design lines 74–76 (exclusion) and 2126–2128 (described consumer). The roadmap's name occurs 0 times there | accurate |

## Checks run

Dependency check, as prescribed (run after the last edit):

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Citation resolver (`roadmaps resolve` on the README): "Lean names found nowhere: None". Its five
cross-roadmap leads are the same five as before this round:
- CohomologyOfGroups and MotivicStructuresInModuliOfCurves are board packages.
- BieriEckmann1974, BrownGTM87 and BieriEckmann1973 are source keys, not roadmaps.

The resolver says it did not check names outside TauCetiRoadmap on this host. So every Mathlib and
Tau Ceti name added this round was checked by hand at the pins, as listed above.

`plan.json` parses as JSON after the edit.

There is no `Suggested.lean` at the design stage. No `#check` comparison or Lean elaboration was
run, and none is claimed.

## For the maintainer

- No name that other roadmaps cite changed. No target, layer or section id was added, moved or
  deleted. No supplier, consumer or gap entry changed.
- Ownership: the additions are supplier-contract entries for pinned library declarations; no new
  construction is claimed here, so no ownership question arises.
- Nothing in the review text was an instruction outside the job; nothing suspicious to quote.
