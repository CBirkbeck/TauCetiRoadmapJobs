# FIX-RT-SchemeKTheoryOperationsPartII~2

## RT-SchemeKTheoryOperationsPartII~2a/F01 (P3) — applied

Verified: in the group of bounded strict complexes with only degreewise exact-sequence relations, the degree-zero Euler sequence O(−1) → O² → O(1) already gives [O(1)] = 2[O] − [O(−1)]; no quasi-isomorphism relation is used. So the §1.4 P¹ Check's claim that a model forgetting quasi-isomorphisms fails the relation was false.
Old: "a model forgetting quasi-isomorphisms or exact sequences would not satisfy this relation." → New: "This tests the exact-sequence relation; the acyclic complex [O →id O] in the preceding Check separately tests the quasi-isomorphism relation." Recomputed: degreewise group gives [O →id O] = (1,1) ≠ 0; K₀ gives 1 − 1 = 0.

## RT-SchemeKTheoryOperationsPartII~2a/F02 (P3) — applied

Verified that each named bullet restates an API law of its own block or repeats a neighbouring instance: §0.7 "Tor_j(𝒪_X, G)" (API: locally free input ⇒ vanishing, Tor₀ = tensor); §1.6 Koszul class (API bullet 4 verbatim); §1.8 "[𝒪_X] pairs to [G]" (API unit law); §2.2 "F⁰ = ⊤, F^{d+1} = ⊥, Y = ∅" (API bullet 2; the empty case remains in the "empty X" Check); §4.5 "χ = r[k(x):k]" (same instance as the next Check, which gives values 0, 2, 4). All five deleted. Remaining Check counts: 4, 5, 4, 5, 3.

## RT-SchemeKTheoryOperationsPartII~2b/F01 (P3) — applied

Verified on main: AdicSpacesPartIII §F0.6 *associated-formal-module* (TauCetiRoadmap/AdicSpacesPartIII/README.md lines 2806–2810) owns `FormalScheme.Spf.completedTilde.pullbackIso` ((Spf.map φ)^*(N^Δ) ≅ (A ⊗_B N)^Δ, EGA I 10.10.8) and `FormalScheme.Spf.completedTilde.ideal_map` (image of the pulled-back 𝔟^Δ is (𝔟A)^Δ, EGA I 10.10.9), with the same direction (φ : B → A) as §0.6. Changes: §0.6 statement now cites `ideal_map` for the affine formula instead of "Prove that"; proof route cites both supplied declarations instead of re-deriving them; F0.6 supplier contract and §0.6 *Needs* name both. Retest: A = ℤ_p → ℤ_p⟦t⟧, J = (p²) gives g⁻¹V(p²) = Spf (ℤ/p²)⟦t⟧; i : Spec 𝔽_p → Spf ℤ_p, J = (p) gives image (p𝔽_p) = 0, i⁻¹V(p) = Spec 𝔽_p — both §0.6 Checks unchanged. Pattern search: the only other use of affine pullback of associated modules (§1.3 proof route, restriction to D(f)) consumes the supplier's `basicOpenIso` content and states no new target.

## Adversarial pass on changed text

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.4 P¹ Check, revised clause | degreewise-exact group vs K₀ on P¹_k and Spf k | Euler: 2 − L both groups; [O →id O]: (1,1) vs 0 | true; separation now attributed correctly |
| §0.6 affine inverse image via `ideal_map` | ℤ_p → ℤ_p⟦t⟧, J=(p²); ℤ_p → 𝔽_p, J=(p); J = 0; J = A | Spf(ℤ/p²)⟦t⟧; Spec 𝔽_p (image 0); V(0)=whole; V(A′)=∅ | true; direction φ : B → A matches the supplier |
| deleted Checks | counts per block after deletion | §0.7 4, §1.6 5, §1.8 4, §2.2 5, §4.5 3 | each block keeps ≥ 3 discriminating Checks; empty case kept in §2.2 |

## Checks

- Elaboration: `lake env lean packages/SchemeKTheoryOperationsPartII/Suggested.lean` from the content checkout: no output, no errors. The file contains no named declaration, so no `#check @name` comparison applies.
- Dependency check: `depcheck: 188 roadmaps, 1233 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.

## Gate failures

- warning: `Suggested.lean` imports `Mathlib`, which is designed for the module system → added a `module` header line before `import Mathlib`. Nothing else in the file changed: still a single `import Mathlib`, no `TauCeti.*` imports. Since the file states no declarations, the private import is enough. The file elaborates with no output, and the worker's import, missing-import and residue scanners all return no hits.

## Notes for the maintainer

No names changed; no other roadmap is affected. The only new citations are two declarations already planned by AdicSpacesPartIII §F0.6 on main, a supplier already in this roadmap's contracts. No gaps added; `plan.json`, `metadata.toml`, `sources.toml` unchanged. No suspicious instructions found in the reviews.
