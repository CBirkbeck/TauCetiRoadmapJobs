# FIX-PKG-CstConjectureForDaggerVarieties~3

Review resolved: REV-PKG-CstConjectureForDaggerVarieties~2 (two findings, F01 P2 and F02 P3). Both are correct and both are applied. Files changed: `packages/CstConjectureForDaggerVarieties/README.md` and the top-level `gaps` list of `packages/CstConjectureForDaggerVarieties/design/plan.json` (one `needs` string). `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## F01 (P2) — applied

Old → new, `strict-countable-derived-limits` needs sentence in the README contract and the plan `gaps` entry: "the Roos derived limit as the cone of 1−shift on the product" → "Rlim C_n=Cone(1−shift)[−1], the homotopy fibre of 1−shift, (a_n)↦(a_n−τ_n(a_(n+1))), which for V_n in degree zero is [∏V_n→∏V_n] in degrees 0 and 1". Rest kept verbatim. New §4.1 Check: constant Q_p[0] and V in degree 1.

Verification. At the Mathlib pin (`6b7abb3`), `CochainComplex.mappingCone` in `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` has `(mappingCone φ).X i` built from `F.X (i + 1)` and `G.X i` (`isZero_X_iff`, line 65). For δ=1−shift on the constant tower Q_p[0], δ is onto with kernel the diagonal, so the unshifted cone has H⁻¹=Q_p, H⁰=0, contradicting the Milnor sequence 0→R¹lim H^(i−1)→H^i(Rlim)→lim H^i→0 stated in the same contract (at i=−1 it would force H⁻¹=0). The fibre has H⁰=Q_p, H¹=0. The convention agrees with DerivedModuleAlgebra §1.1 on main (`TauCetiRoadmap/DerivedModuleAlgebra/README.md`, "represented by `Cone(δ)[−1]` on product complexes") and with the Roos sequence 0→lim C_n^j→∏C_n^j→∏C_n^j→0 in LocallyAnalyticDistributions §0.2, "Strict countable inverse limits and cohomology". README and plan needs strings were compared mechanically after the edit: all 16 gap slugs have identical supplier and needs text in both files.

Pattern search: every other use of the Roos model in the roadmap (§4.1 *Needs*, §4.2 proof route and *Needs*, §4.3 *Needs*, §4.5 *Needs*) refers to the contract by name and inherits the corrected normalization; the §4.2 Milnor sequences and the constant-disc and tail-tower Checks are already stated in the fibre normalization and were recomputed (table below). The only other cone in the README, §3.5's "associated mapping cones" of the logarithmic and analytic syntomic triangles, cancels isomorphic terms and is independent of the shift; the analytic-syntomic-descent contract already says "fiber triangle". No other occurrence needed repair.

## F02 (P3) — applied

Old → new, README §3.7 tube API, last bullet: "on a chart their complements are {max_j|f_j|>ε} and {min_j|f_j|>ε} respectively" → "{x : |f_j(x)|>ε for some j} and {x : |f_j(x)|>ε for every j} respectively, so for c=0 the first is empty and the second is the whole chart, and for c≥1 they are {max_j|f_j|>ε} and {min_j|f_j|>ε}". The existing empty-index Check is kept unchanged.

Same pattern: the preceding API bullet used the letter c for a rescaling constant while c is the number of equations in the same paragraph; it now reads λ∈K, 0<|λ|<1, radius ε/|λ|. A search for max/min, empty index sets and empty fibre products elsewhere in the README found no other extremum over a possibly empty index set (the exhaustion is indexed by ℕ; the §3.7 prose already treats c=0 by the same ∀/∃ reading).

## Checks run

- `lake env lean packages/CstConjectureForDaggerVarieties/Suggested.lean`, run from the content checkout at the pins of its `lake-manifest.json`: exit 0, no output, no warnings (2.6 s). No `TauCeti.*` import, so no targeted build was needed.
- Binder audit: `Suggested.lean` declares nothing (one module docstring, `namespace TauCetiRoadmap.CstConjectureForDaggerVarieties`, `end`), so a `#check @name` scratch file has zero subjects; nothing changed. The docstring's list of non-statable headlines is unaffected by these repairs (neither the derived-limit model nor the tube complement formula is mentioned in it).
- Dependency direction (`tauceti-roadmap … gate --depcheck … --movable`), complete output:

      depcheck: 56 roadmaps, 637 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line: the order file used for this round lists the roadmap at line 205, right after its last supplier CohomologyComparisons (line 204); LocallyAnalyticDistributions, the supplier of the edited contract, is at line 76.
- Citation resolver (`roadmaps resolve` on the README, main `a8132fb` and 366 open heads): no cross-roadmap citation and no Lean name found nowhere. LocallyAnalyticDistributions §0.0 "Nonarchimedean topology, exact categories and completed tensors" and §0.2 "Strict sequences and three-space properties" were opened at its open head and resolve.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Contract: Rlim C_n=Cone(1−shift)[−1] | Constant Q_p[0] | δ(a)_n=a_n−a_(n+1) onto (section a₀=0, a_n=−Σ_(k<n)b_k: then a_n−a_(n+1)=b_n), ker = diagonal Q_p. Fibre: (H⁰,H¹)=(Q_p,0). Mathlib cone: (H⁻¹,H⁰)=(Q_p,0). | Unshifted model wrong, fibre right | F01 |
| Same | Constant V in degree 1 (V[−1]) | Fibre has ∏V in degrees 1,2 with δ onto: H¹=V, H²=0. Milnor at i=1: R¹lim H⁰=0, lim H¹=V. Agrees. Unshifted cone would give H⁰=V. | Fibre agrees with Milnor | F01 |
| Same | Tail tower V_n=⊕_(j≥n)Q_p in degree 0, inclusions | From 0→V_n→V_0→V_0/V_n→0: lim V_n=0, lim¹ V_n=lim(V_0/V_n)/V_0=∏Q_p/⊕Q_p ∋ [(1,1,…)]≠0. Fibre: H⁰=0, H¹=∏Q_p/⊕Q_p = R¹lim H⁰ (Milnor i=1). Cone: class lands in H⁰, but Milnor at i=0 gives H⁰=lim H⁰=0. | Fibre consistent; §4.2 tail Check unchanged | None beyond F01 |
| Same | Tower (Q_p,0,0,…) (n=0 only nonzero); zero tower | First: δ is an isomorphism (δ(a)_0=a_0, δ(a)_n=a_n), H⁰=H¹=0, and lim=0 since a_0=τ(a_1)=0. Zero tower: 0 in all degrees. | Degenerate cases pass | None |
| Same, direction of 1−shift | Transition τ_n:C_(n+1)→C_n | ker(a↦a_n−τ_n(a_(n+1))) = compatible sequences = lim. The reverse a_(n+1)−τ_n(a_n) is ill-typed (τ_n goes down). | Direction pinned | Stated in contract |
| §4.1 new Check | As rows 1–2 | Values as computed above, including the empty sum a₀=0 at n=0. | Correct | Added |
| §4.2 constant-disc Check (unchanged) | F_n=O(D)/C constant, degree 0 | Same section; H⁰=O(D)/C, H¹=0 under the fibre model. | Consistent | None |
| §4.2 Milnor sequences (unchanged) | Degree i=0 and i=1 for the three towers above | Negative-degree terms zero at i=0; values match the fibre model in every row. | Consistent | None |
| §3.7 complements | c=0 on a nonempty chart | ∃ over ∅ false → intersection complement ∅; ∀ over ∅ true → union complement = chart. Matches the empty-index Check and §3.7 prose (c=0: intersection X, union ∅). | Correct | F02 |
| Same | c=1, f=T, ε=|π| | Both complements {|T|>|π|}; T=1: 1>|π| in complement (outside the tube, as in the unit-rescaling Check); T=π: |π|>|π| false, in tube. max=min=|T|. | Agrees with extrema for c≥1 | F02 |
| Same | c=2, f₁=T, f₂=S, ε=|π|, point (1,π) | Intersection complement (∃): 1>|π| true; max(1,|π|)=1>|π| true. Union complement (∀): |π|>|π| false; min(1,|π|)=|π|, not >|π|. Point lies in Z₂(ε), hence in the union tube. | Both directions agree | F02 |
| §3.7 rescaling bullet | λ=π, f=T, ε=|π|; λ unit; λ=0 | {|πT|≤|π|}={|T|≤1}, radius ε/|λ|=1 (matches non-unit Check); unit λ gives radius ε (excluded by 0<|λ|<1, consistent with the unit bullet clause); λ=0 excluded, so no division by zero. | Correct | Renamed c→λ |

## For the maintainer

- No Lean names changed (the file declares none); no other roadmap cites a changed name.
- The edited contract is owned by LocallyAnalyticDistributions; only its normalization was made precise, so its implementer should use the homotopy fibre Cone(1−shift)[−1], in agreement with DerivedModuleAlgebra §1.1. No new supplier, gap or target was introduced, and nothing moved between roadmaps.
- Ownership: no new construction was added in this round, so no new ownership search was needed; a `roadmaps grep -i roos` across main and the open heads finds the Roos model only in LocallyAnalyticDistributions (the named supplier) and in an unrelated SolidAnalyticRings citation.
- No new source was cited and no `needs-references.toml` request was made.
