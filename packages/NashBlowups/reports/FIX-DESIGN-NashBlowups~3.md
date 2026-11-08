# FIX-DESIGN-NashBlowups~3: repair of the design review

Review settled: `REV-DESIGN-NashBlowups~2` (two findings: one P2, one P3). Files edited:
`packages/NashBlowups/design/README.md`, `packages/NashBlowups/design/plan.json`,
`packages/NashBlowups/sources.toml`. No `Suggested.lean` exists at the design stage.

## REV-DESIGN-NashBlowups~2/F01 (P2) — applied

Verified. DeformationAndDerivedPatchingAlgebra §3.14 (README lines 832–846 at its head) defines F-finite and
gives the field case `[k : k^p] < ∞` and permanence under quotients, localisation and finite-type extension;
for perfect `k` this gives exactly what §5.1 stated. DerivedDeRhamCohomology §0.24 uses "Frobenius finite" only
as a hypothesis (it owns no permanence API); nothing at the pins (`grep FFinite / F-finite` empty); no other
board package or open head owns it.

Old → new: §5.1 target *frobenius_finite_of_essFiniteType* deleted; F-finiteness cited in "Supplied elsewhere",
a new `From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra` contract, "How to read the build", Layer 5
Dependencies and new §5.3 step 3 and *Needs:*. `F_*R ≅ R^{1/p}` became a sentence of §5.3; §§5.2–5.5 renumbered
§§5.1–5.4.

Details. The three Checks of the deleted §5.1 went into new §5.3 (old §5.4). `k[t]` was merged into the
first Check (basis `1, …, t^{p−1}`) and `R = k` into the `d = 0` Check. The imperfect-field Check became a new
fourth Check. It is sharper than the reviewer's wording: over `k = 𝔽_p(t)`, `R = k[s]_{(s)}` is regular, yet
`ψ` has rank `p` while `F_*R` has rank `p²`, and `t` is not in the image of `ψ`. So perfectness enters the rank
count, not the finiteness, because `[k : k^p] = p` is still finite. Step 3 now also proves that the cokernel is
torsion-free (`f ∈ Frac R`, `f^p ∈ R_Q` and normality give `f ∈ R_Q`); before, this was only asserted.

Pattern: every reference to the renumbered sections was updated: README §5.1 Check 3 (now "§5.3 needs normality"),
§5.3 steps 1–2, §5.4 route and *Needs:*, §6.4 corollary and *Needs:*, and the DerivedDeRhamCohomology contract
("the half §5.2 uses"). In `plan.json`, target 5.1 was removed and 5.2–5.5 became 5.1–5.4. `target:5.1` became
`roadmap:DeformationAndDerivedPatchingAlgebra §3.14`; the prerequisites of 5.3, 5.4 and 6.4 were updated; a
supplier entry was added; the DerivedDeRhamCohomology supplier text now says §5.2; the tests were merged and the
new one added. In `sources.toml`, the `cited_for` of `nashModificationNotes2024`, `duarteNunezBetancourt2020` and
`stacksAlgebra` were renumbered.

Old → new numbering (no roadmap on main, at an open head or in a board package cites NashBlowups, so nothing
outside this package follows it):
- §5.1 Frobenius finiteness → deleted; DeformationAndDerivedPatchingAlgebra §3.14
- §5.2 → §5.1 (*exists_pMonomialOperators*)
- §5.3 → §5.2 (*frobeniusBasis_functionField*)
- §5.4 → §5.3 (*frobeniusPushforward_free_of_kaehler_surjection*)
- §5.5 → §5.4 (*nashBlowupHom_isIso_iff_smooth_of_normal*)

## REV-DESIGN-NashBlowups~2/F02 (P3) — applied differently

Verified: §2.3, §6.3 (base change) and §7.2 had no locator in the README text.

Old → new: §2.3 cites nashModificationNotes2024 Section 1, lines 109–112, and §7.2 cites
castilloDuarteLeytonLiendo2026 Theorem, lines 58–67, as suggested. §6.3 base change cites stacksVarieties Lemma
33.27.5, tag 0C3N, line 2256 (normalisation under separable field extension) instead of the suggested 035Q, which
does not state base change; `plan.json` 6.3 matches.

Why differently. Read at line 6561, 035Q is about components, integrality and factorisation; it says nothing
about base change. 0C3N, read at stacksVarieties lines 2256–2294, gives `Y^ν ≅ X^ν ×_k K` for a locally algebraic
`X` and a separable `K/k`, and a universal homeomorphism in general. That is exactly the statement, and the
inseparable Check of §6.3 shows the second clause: `𝔸¹ → C_{k'}`, `u ↦ (−u² − t^{1/p}, u^p)`, is bijective and
not an isomorphism.

Pattern (same defect, other targets). A scan of every `Prove`/`Define` sentence found five more targets without
a locator where a legal source in the manifest supports the claim. Each was read at its line and added:
- §6.3 restrict: stacksNormalization Lemma 29.54.6, tag 035K, line 6332 (normalisation over an open)
- §1.5 restrict: stacksNormalization Lemma 29.6.3(3), tag 01R8, line 421 (the scheme-theoretic image of a
  quasi-compact morphism commutes with restriction to opens; `σ_U` is quasi-compact by §1.2)
- §3.2 *exists_nashBlowup_blowupPresentation*: nobile1975, proof of Theorem 1, lines 107–116
- §5.2 (old §5.3): duarteNunezBetancourt2020 lines 301–302 and nashModificationNotes2024 lines 421–422, where
  the rank `p^d` is used

Four statements are left with internal references only. No manifest source states them; each is derived in the
roadmap from its own located targets: §2.4 *isIso_lift_iff*, the §2.5 corollary, §2.6 *nashBlowup.baseChange*
(route: §0.2 at 01V0 and §1.5 at 081I) and §7.1 *nashIterate_of_smooth*.

`plan.json` locators updated: 1.5, 3.2, 5.2, 6.3, 7.2. `sources.toml` `cited_for` gained these entries:
nobile1975 §3.2; nashModificationNotes2024 §2.3 and §5.2; stacksNormalization §1.5 (01R8) and §6.3 (035K), with
§6.2 kept on 035Q; stacksVarieties §6.3 (0C3N).

## Adversarial pass on added or changed statements

| statement | instances tried | values computed | result / change |
|---|---|---|---|
| DeformationAndDerivedPatchingAlgebra §3.14 contract, field case | `𝔽_2`; `𝔽_p(t)`; `𝔽_p(t_1, t_2, …)` | `[k:k²] = 1`; `[k:k^p] = p`; infinite | F-finite, F-finite, not F-finite: the "exactly when" form is right |
| contract permanence, used for `R_Q` | `R = k[x,y]_{(x,y)}`, `Q = (x)`, `k` perfect; zero ring | `F_*k[x,y]` free on `x^i y^j`, `0 ≤ i,j < p` (`p²` elements), localising to a basis of `F_*R_Q`, rank `p² = p^d`, `d = 2`; `F_*0 = 0` finite | sound; the supplier needs no perfectness (the deleted §5.1 was narrower than the supplier) |
| §5.3 sentence `F_*R ≅ R^{1/p}` | `R = k[t]_{(t)}`; `k[ε]/ε²` | basis `1, …, t^{p−1}` ↔ `1, t^{1/p}, …, t^{(p−1)/p}`, structure map `r ↦ r^p ↦ r`; `F(ε) = 0`, so Frobenius is not injective and there is no embedding | the domain hypothesis is needed; it holds because `O_{X,x}` is a normal local ring |
| §5.3 step 3, torsion-free cokernel | DVR `k[t]_{(t)}`; cusp `k[t², t³]` at the origin, `p = 2` | `R^{1/p}/R` free on `t^{i/p}`, `1 ≤ i < p`; `f = t ∈ R^{1/2}` (`t² ∈ R`), `s = t²`, `s·f = t³ ∈ R`, `f ∉ R`: torsion | normality is needed, matching Check 2 |
| §5.3 Check 4 (new), imperfect `k` | `k = 𝔽_p(t)`, `R = k[s]_{(s)}`, `q(ds) = 1`; `p = 2` | `[K:K^p] = p²` (basis `t^i s^j`); image of `ψ` is `Σ R^p s^α`; for `p = 2`, `K²`-basis `1, t, s, ts` and image `R² + R² s`, so `t ∉` image | `ψ` is not surjective although `R` is regular: perfectness is needed, finiteness is not the issue |
| §5.3 Check 3 (merged), `d = 0` | `k` perfect; `k = 𝔽_p(t)` | `r ↦ r^p` bijective, rank `1 = p^0`; `t ∉ k^p`, rank `p` | consistent with Check 4 |
| §5.3 Check 1 (merged), `d = 1` | `k[t]` | `t^n = (t^q)^p t^r`, `n = pq + r`, `0 ≤ r < p`: `F_*k[t]` free on `1, …, t^{p−1}` | sound |
| §5.2 locator (rank `p^d`) | `K = k(x_1, …, x_d)`; `d = 0` | `[K:K^p] = p^d`; `1` | matches duarteNunezBetancourt2020 lines 301–302 and nashModificationNotes2024 lines 421–422 |
| §2.3 locator | cusp, characteristic `0` | `X* = 𝔸¹`, `ν` an isomorphism over `X ∖ {0}`, birational, proper | matches lines 109–112 (proper, birational, isomorphism over `X_reg`) |
| §6.3 base change via 0C3N | cusp over `ℚ`, `k' = ℚ(i)`; `C : x^p + y² + t` over `𝔽_p(t)`, `k' = k(t^{1/p})` | both sides `𝔸¹_{ℚ(i)}`; `(C̄*)_{k'} = C_{k'}` (non-normal), `(C_{k'})̄* = 𝔸¹`, comparison `u ↦ (−u² − t^{1/p}, u^p)` bijective, not an isomorphism | separable: isomorphism; inseparable: universal homeomorphism only, as 0C3N says |
| §6.3 restrict via 035K | `V = X_sm`; `V = X` | generic points of `ν⁻¹(X_sm)` are all the generic points of `X*`, and the normalisation of the smooth open is itself; identity | sound |
| §1.5 restrict via 01R8 | `V = U`; `X` locally Noetherian | `π_N⁻¹(U) ≅ U = N(U, F|_U, r, U)` (first Check of §1.2); `σ_U` is a section over `U` followed by an open immersion into the locally Noetherian `Gr_r(F)`, hence quasi-compact | sound within §1.2's hypotheses |
| §3.2 locator | cusp, characteristic `0` | minors `(−3x², 2y)`, `I = (y, x²)`, `x²` a nonzerodivisor in the domain `k[x,y]/(y² − x³)` | matches §3.3 Check 1 |
| §7.2 locator | cusp, characteristic `2`, `m = 1` | `X^{(1)} ≅ X`, so `X^{(j)} ⊇ X` for all `j` | the consequence at lines 66–67 uses the same propagation |

## Checks run

Dependency gate:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2393 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The placement moves from after AlgebraicModuliForArithmeticGeometry to after
DeformationAndDerivedPatchingAlgebra (merge order line 59), the new last supplier. DeformationAndDerivedPatchingAlgebra
is on the list of roadmaps this one may consume, and it is a new-roadmap pull request, not a revision.

Citations (`roadmaps resolve` on the README after the edits): no cross-roadmap citation and no Lean name found
nowhere. DeformationAndDerivedPatchingAlgebra §3.14 and DerivedDeRhamCohomology §§0.23–0.24 were re-read at
their heads. The following were re-checked: EnhancedDerivedSheaves `isRegular_of_frobenius_flat` (main README
line 800); SchemeAndStackFoundations §§0.7, 0.11, 0.17, 0.23, 0.30, 4.11, 4.13 (main headings);
DiophantineApproximationAndTranscendence `exists_lieDerivativeOneForm` (main `Suggested.lean` line 3586);
AlgebraicModuliForArithmeticGeometry §1.3 and `DMNormalization.finite` (head README lines 601, 8918).

Lean: there is no `Suggested.lean` at the design stage, so no `#check` scratch elaboration was run and no
binder comparison applies.

Sources: no new fetch. Every added locator is in a text the manifest already records, read at the cited line.
No `needs-references.toml` was written.

Ownership against open pull requests: checked through `roadmaps grep` on main and the 476 indexed heads (index
of 2026-11-08T01:17:41Z) and in the board packages. Searched for "F-finite"; only DeformationAndDerivedPatchingAlgebra
§3.14 owns the permanence API. Searched for "NashBlowups": no citer.

Untrusted text: nothing in the review, the sibling roadmaps or the sources asked for any action; none taken.

## Notes for the maintainer

- New supplier: DeformationAndDerivedPatchingAlgebra §3.14. It is not on main yet, so NashBlowups now merges
  after it (merge order line 59). This is a `moved:`-type placement, not a defect.
- Layer 5 is renumbered as listed under F01. No other roadmap cites NashBlowups.
- Targets: 38 → 37 in `plan.json`. Tests: 109 → 107 (three §5.1 tests: two merged, one replaced by the
  sharper Check 4).
- §6.3 base change is stated for finite separable `k'/k`, the case Mathlib's `normalizationPullback` covers.
  0C3N proves it for every separable extension. Widening it would need a normality-under-separable-extension
  input that no supplier states, so the statement was kept as it is.
