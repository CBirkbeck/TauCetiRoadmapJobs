# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~16

Findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~15` (two findings). Files edited: `packages/QuasicoherentSheavesOnPrestacks/design/README.md` and `design/plan.json`. `sources.toml` is unchanged: no new source is cited.

## F01 (P2) — applied

Verified. Take `S = X = Spec ℤ` and `Γ = ℤ/2`. The prestack `X ×_{[X/G]} X` is `L(Γ) = Spec(ℤ × ℤ)`, which has 4 points at `ℤ × ℤ` (the idempotents). The prestack Γ has 2 there. So the old sentence was false whenever `G ×_S Spec R_i` is not a sheaf.

7.1 bullet, old → new: "the base change of the atlas is the projection `G ×_S Spec R_i → Spec R_i`" → "the base change of `L X → [X/G]` is `L(G ×_S Spec R_i) → Spec R_i` (… `L Spec R_i = Spec R_i`, 3.2) … When X and `G ×_S Spec R_i` are hypercomplete fpqc sheaves, for instance X affine and G affine over S (3.2, 4.1), `L X = X` and it is the projection itself; for the constant group ℤ/2 it is not."

I appended the `L Γ` computation (4 points against 2) to the Check "The hypersheafification is what makes the diagonal affine". plan.json 7.1 `geometric_quotient` and test `realization_diagonal` are updated to match.

The review's own repair says "S and X affine". I wrote "X affine and G affine over S" instead, because affineness of S is not needed for this sentence. `G ×_S Spec R_i` is affine as soon as G is affine over S, by the definition in 4.1. The later sentences on the affine diagonal and on flatness keep their hypotheses unchanged. Both use this base change only when X is affine and G is affine over S, so the repaired sentence covers them.

Pattern search: I looked for every other "base change of the atlas" and every "`L` fixing …" in README and plan. The other two instances are correct. In the 7.1 Check `nonflat_atlas`, S is affine and G is affine. In 7.4, `h_X` and `h_{G ×_k X}` are affine because X is affine.

## F02 (P3) — applied

Verified. 3.1 proves only that fpqc sheaves are fppf sheaves. The 7.4 *Needs* line had no 3.2, and the plan's 7.4 had no `target:3.2`.

Changes, old → new:
- 7.4 route: "fixing the fppf sheaves `h_X` and `h_{G ×_k X}` (3.1)" → "fixing `h_X` and `h_{G ×_k X}`, which are affines, hence fpqc sheaves (3.2) and so fppf sheaves (3.1)".
- 7.4 *Needs*: added "3.2 (affines are fpqc sheaves, for the affine diagonal)". The 3.1 item now also says "fpqc sheaves are fppf sheaves".
- plan 7.4: added `target:3.2` and the same wording in `affine_diagonal`.

Pattern repair. 4.1 ("`Spec B`, a sheaf (3.2)"), its *Needs* line, 7.1 (twice, and its *Needs* line) and now 7.4 all cite 3.2 for "affines are hypercomplete fpqc sheaves". But 3.2 never stated that fact; the review's appeal to "3.2's last API bullet" is about `Mod`, not about `Spec B`. So I added it to 3.2 as an API bullet with a proof route:
- `Spec B` preserves finite products.
- The case `M = A` of the theorem gives `A ≃ lim A_n` on underlying modules.
- The forgetful functors of test rings are conservative and preserve limits (1.1; for `CRing`, the functor to abelian groups).
- So A is the limit among test rings, and `Map_T(B, −)` preserves that limit.

On Čech nerves in `CRing` this is the affine form of Mathlib's `Subcanonical` instance for `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:88; the class is at Mathlib/CategoryTheory/Sites/Canonical.lean:129, namespace `CategoryTheory.GrothendieckTopology`). I added that instance to the "From Mathlib" contract and cited it in the bullet. The hypercomplete, derived, flat-hypercover form is not at the pin.

I also added one 3.2 Check (an affine line and a non-flat counterexample, values below). The 3.2 *Needs* line gains "1.1" and the Mathlib `fpqcTopology`, and the plan gains `target:1.1`, the Mathlib prerequisite, API `affines_sheaves` and test `affine_line`. No new target was created.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 7.1: base change of `L X → [X/G]` along a lift is `L(G ×_S Spec R_i)` | `S = X = Spec ℤ`, `Γ = ℤ/2` | `L(Γ × Spec ℤ) = Spec(ℤ × ℤ)`, 4 points at `ℤ × ℤ`; prestack Γ there: 2 | the new sentence holds; the old one failed | applied |
| same | `G = G_m`, `X = S = Spec ℤ` | `G_m × Spec R_i = Spec R_i[t, t⁻¹]`, affine, fixed by L: the projection | sheaf clause applies | — |
| same | `G = 1`, X any prestack | `L(1 ×_S Spec R_i) = Spec R_i`; `L X ×_{L X} Spec R_i = Spec R_i` | holds, X need not be a sheaf | — |
| same | `G = 1`, `X = ∅` | `[∅/1] = Spec 0`; points only at `R = 0`, lifted along the empty cover | vacuous | — |
| same | translation, `X = G` | `L G ×_{L S} Spec R_i = L(G ×_S Spec R_i)`, by left exactness directly | agrees | — |
| 7.1 flatness and affine-atlas sentences (consumers) | `O(G) = ℤ × 𝔽_ℓ` (affine, not flat); `G_m` | base change `G → S`, not flat; `Spec ℤ[t^{±1}] → Spec ℤ`, free | only the sheaf case is used | — |
| 7.1 Check, `L Γ` | idempotents of `ℤ × ℤ` | `(0,0), (1,0), (0,1), (1,1)`: 4 ring maps `ℤ × ℤ → ℤ × ℤ` | holds | appended |
| 7.4(a): `h_X ×_{[X/G]^♮} h_X ≃ h_{G ×_k X}` | `X = Spec k`, `G = GL_n`; `G = 1` | `h_X = Spec k` and `h_{G×X} = Spec O(GL_n)`, affine, so fpqc sheaves (3.2) and fppf sheaves (3.1); for `G = 1` the diagonal of `h_X`, closed | holds | citations |
| 3.2: affines are hypercomplete fpqc sheaves | identity cover; `R = 0`; product `A × A′` | constant nerve: `Map(B, A)`; `Map(B, 0)` is a point; `Map(B, A × A′) = Map(B, A) × Map(B, A′)` | holds | new bullet |
| same, Čech, classical | `ℤ → ℤ[1/2] × ℤ[1/3]`, `B = ℤ[t]` | the tensor square is `ℤ[1/2] × ℤ[1/6] × ℤ[1/6] × ℤ[1/3]`; equalizer `{(a, b) : a = b in ℤ[1/6]} = ℤ[1/2] ∩ ℤ[1/3] = ℤ` | holds | new Check |
| same, non-flat negative control | `ℤ → 𝔽_p × ℤ[1/p]` (surjective on spectra) | tensor square `𝔽_p × 0 × 0 × ℤ[1/p]`; both cofaces send `(a, b)` to `(a, b)`; equalizer `𝔽_p × ℤ[1/p] ∋ (1, 0)`, not in the image of `n ↦ (n̄, n)` | flatness needed | new Check |
| same, derived contexts | `A → A_•` flat hypercover in `CAlg^cn` | `U(lim_T A_n) = τ_{≥0} lim_{D(ℤ)} A_n = A` (connective), and conservativity of `U` | holds | — |
| same, `CRing` | cosemisimplicial sets | the limit over `Δ_s` of discrete spaces is the set of `x ∈ A_0` with equal images under the two cofaces; `H⁰` of the alternating complex is A | holds | — |

## Checks

Dependency gate, run after the last edit:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2231 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No new supplier roadmap is named; the only new external citation is the Mathlib declaration above, checked at the pin.

Other checks:
- `plan.json` parses, and its formatting (one-space indent, UTF-8) round-trips unchanged.
- A scan of the added README lines finds no LaTeX delimiters, process words or machine paths.
- There is no `Suggested.lean` at the design stage, so no `#check` elaboration was run.
- No gate failures were listed for this round.

## For the maintainer

- No name that other roadmaps cite was renamed or removed.
- 3.2 now states explicitly that affines are hypercomplete fpqc sheaves. 4.1, 7.1 and 7.4 cite this from 3.2, and AnalyticStacks, the named consumer, may do the same.
- Ownership: the classical, set-valued Čech case belongs to Mathlib and is cited there. A grep for `subcanonical` across the open heads and main found no roadmap that owns the hypercomplete fpqc statement on test rings. This roadmap defines that topology in 3.1, so it owns the statement.
- No suspicious text was found in the review.
