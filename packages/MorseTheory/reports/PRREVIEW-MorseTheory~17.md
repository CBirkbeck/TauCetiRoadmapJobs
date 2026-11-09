# Review of MorseTheory (pull request #1682 at e20127d)

**Verdict:** needs changes

This is an incremental re-review of the 18 lines changed since 1647f55. Only the module docstring of `TauCetiRoadmap/MorseTheory/Suggested.lean` (lines 28–45) changed. `README.md` and every Lean statement are byte-identical to the previous head.

There is one finding, and it blocks. It is the previous review's R01. The repair added six more names to the docstring's list of declarations "proved at the pinned Tau Ceti", but the branch is still not merged with main. All six names are missing at the head's pin, like the twelve names already listed.

## R01 (P1) — Branch not merged with main: every Tau Ceti declaration that the `Suggested.lean` docstring calls "proved at the pinned Tau Ceti" is missing at this head's pin

Re-raised: H01

**Location:**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:22–45`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated: … (`TauCeti.IsMorse.finrank_singularHomology_le`, … `TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`)."
- The same claim runs through `README.md:38–40` and the Tau Ceti contract (lines 149–400).

**Claim:** The pins have not moved.
- This head's `lake-manifest.json` pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3.
- Main, now f24d841, pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
- The merge base is still ffcc9d31, and `git merge-tree --write-tree origin/main HEAD` still reports CONFLICT in `README.md` and `Suggested.lean`.

The new docstring lines name six declarations. None exists at a91d3aaf; all six exist at 2fd255d:
- `IsMorse.finrank_singularHomology_le` (`Morse/Inequalities.lean:403`);
- `IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le` (414);
- `IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq` (429);
- `IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two` (`Morse/Reeb.lean:148`);
- `exists_tendsto_maximalIntegralCurve_neg_mgradient` (`Morse/GradientFlow.lean:261`);
- `exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient` (`Morse/ExponentialConvergence.lean:303`).

Counting the whole docstring, the 18 distinct Tau Ceti or `ContMDiffMap` names it cites are all missing at a91d3aaf and all present at 2fd255d.

The rest of the previous R01 stands unchanged, because `README.md` has not changed:
- 76 of the README's 88 `TauCeti.` names exist only at 2fd255d.
- The deferred targets of Layers 1–4 and 6 have no owner at the head's pin.
- §3.2's headline, a proper Morse function bounded below, is statable at a91d3aaf but stated nowhere. The docstring defers it to `TauCeti.exists_isMorse_isProperMap_bddBelow`, which is missing at that pin.
- The pull request's title and description still announce Palais–Smale theory and a file `PalaisSmaleTargets.lean`.

**Witness:** I added `#check @TauCeti.IsMorse.finrank_singularHomology_le` and the other five new names to a scratch copy of `Suggested.lean` and elaborated it at this head's pins.
- All six fail with "Unknown constant" or "Unknown identifier".
- A text search of the whole pinned tree finds none of them.
- `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf and 35 at 2fd255d.

**Why H01's reason does not settle it:** H01 is right that a repair job cannot do the merge, because the merge touches `lake-manifest.json` and `lean-toolchain`. But nobody has done the merge. At the pin used by the build and the gate, the docstring is therefore false, now for 18 names, and no edit to the two roadmap files can make it true. The branch also still conflicts with main in both files. The gate passes only because the four imported modules exist at both pins.

**Exact repair (for the worker or a human, not a repair job):**
1. Merge `origin/main` (f24d841) into the branch and resolve `README.md` and `Suggested.lean` to this head's text. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write `x ∈ TauCeti.criticalPoints I f` for the zero set, `(TauCeti.criticalCount I f j).toNat` for the counts, `TauCeti.totalCriticalCount I f = 2` for the two-point hypothesis and `-TauCeti.Manifold.mgradient I f` for the field;
   - delete the sentence at lines 19–20 that explains the zero-set spelling.

   The docstring list of consumed headlines is already done at this head and is correct at 2fd255d (rows 21–26 below).
3. Re-elaborate the file and re-run the gate at the new pins.
4. Update the pull request's title and description to match the roadmap. `README.md` lines 74–79 place Palais–Smale theory outside this roadmap, and the folder has no `PalaisSmaleTargets.lean`.

I tested the repair by reading the 2fd255d sources: every one of the six new names carries the hypotheses that its docstring description states (Verified sound). I cannot run Lean at main's pins from this worktree.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti a91d3aaf and the merge base is still ffcc9d31. `Suggested.lean:22` still says the listed headlines "are proved at the pinned Tau Ceti", and lines 33–45 now add six more names missing at that pin. This is R01 above.

## Verified sound

**Scope of the change.**
- `git diff 1647f55 HEAD --stat` shows only `Suggested.lean` (14 insertions, 4 deletions), and every changed line is in the module docstring.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
- The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`. The last three are identical to main.

**Gate, dependencies, elaboration, signatures, padding.**
- I re-ran the gate on this head. Every check is 0 and it prints `OK`, matching `scratch/gate.md`.
- Dependency check output: `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` prints only 7 `declaration uses sorry` warnings, at lines 78, 104, 119, 134, 155, 169 and 183. These are the previous lines shifted by the 10 added docstring lines.
- I put `#check @name` for all 8 declarations in one scratch file, with `pp.universes`. Each elaborated type matches `scratch/signatures.md` and its README statement:
  - the five manifold theorems carry finite-dimensional E, boundaryless I, `T2Space M`, `IsManifold I ∞ M` and `SecondCountableTopology M`;
  - Brown's theorem and the two-open-cell lemma take no manifold binders;
  - `bettiNumber` has one universe for k and X.
  Nothing changed after the check.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide | exact ⟨_, rfl⟩ | omega`. All 7 theorems fail (errors at lines 85, 113, 126, 146, 162, 174 and 194), so nothing is padding.

**The changed docstring, checked against main's pin 2fd255d** (read from the package's git objects).
- `Morse/Inequalities.lean:73–76` and `354`: section binders are finite-dimensional E, boundaryless I, `IsManifold I ∞ M`, `T2Space M`, `CompactSpace M`, a division ring k and a finite k-module V.
  - Line 403 is the weak inequality `finrank Hₙ(M;V) ≤ cₙ·dim V`.
  - Line 414 is the alternating inequality `Σ(−1)^(n−i) bᵢ ≤ dim V·Σ(−1)^(n−i) cᵢ`, in the same direction as Cohen–Iga–Norbury Corollary 5.11 (cohen-iga-norbury lines 1569–1576).
  - Line 429 is Euler's equality for `finrank ℝ E ≤ n`.

  So "the weak Morse inequalities, the strong Morse inequalities in alternating form and Euler's equality on a compact manifold" is exact.
- `Morse/Reeb.lean:55–58` and `148`: compact, T2, boundaryless, `IsManifold I ∞`, `IsMorse I f` and `totalCriticalCount I f = 2` give `M ≃ₜ S^(finrank E)`. The docstring says the same, and `README.md:355–360` and `1106–1117` agree. It is cited as Cohen–Iga–Norbury Application 5.13 (cohen-iga-norbury lines 1617–1619, PDF page 56, printed p. 43).
- `Morse/GradientFlow.lean:80–86`, `200–203` and `261`. The hypotheses are:
  - `T2Space`, `IsManifold I 2`, `BoundarylessManifold` and a C¹ Riemannian metric;
  - a C² function f;
  - a compact K that holds the forward part of the maximal curve;
  - `(criticalPoints I f ∩ K).Finite`.

  The conclusion is convergence to a critical point in K. This is exactly "a maximal negative-gradient trajectory trapped in a compact set with finitely many critical points".
- `Morse/ExponentialConvergence.lean:303`: if the maximal curve exists on `[0,∞)` and converges to a nondegenerate critical point, then `∀ᶠ t in atTop`, `riemannianEDist ≤ C·e^(−μt)` with μ, C > 0. This is the docstring's "exponential decay of the Riemannian distance to a nondegenerate limit".
- None of these theorems states convergence for an arbitrary curve on `[0,∞)`: the files contain no theorem about an `IsMIntegralCurveOn` curve of `-mgradient`. So `exists_compactTrapped_gradient_limit` restates nothing, as `README.md:1455–1485` argues.
- Lines 10–21 still list as unproved at the pin only theorems that the newly listed ones do not imply:
  - the ℕ[t] identity, whose nonnegative coefficients need the alternating inequalities plus partial sums;
  - the degenerate two-critical-point sphere theorem, which is stronger than Reeb's.

**Citations and overlaps.**
- The changed passage cites no roadmap, and `scratch/citations.md` lists nothing unresolved.
- `scratch/overlaps.md` lists two ids dropped by this pull request, `#m2-…` and `#m5-…`. HeegaardFloer on main (f24d841) cites them at lines 647 and 1064, and `README.md:462–468` maps each old id to its new heading.
- No other pull request changes this roadmap.

**Sources checked in the changed passage's sections.** These are cohen-iga-norbury Corollary 5.11 (lines 1569–1596, printed p. 42), Application 5.13 (lines 1617–1619, p. 43) and Theorem 4.6 (lines 1022–1032, PDF page 40, printed pp. 27–29). Each matches its use; the misprints recorded under Source issues in PRREVIEW-MorseTheory~16 (Cor 5.11, Application 5.13) are unchanged and not repeated here. The rest of the seeded sample (1.1–3.2, 4.2, 4.4, 5.1) is untouched and was verified in PRREVIEW-MorseTheory~16 (its sample table).

**Adversarial table.** Rows 1–20 are carried from PRREVIEW-MorseTheory~16 (same row numbers), because the statements are untouched. Rows 21–27 are new, with values computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line | df=(1,0)↦(1,0); range [0,∞)≠ℝ | carried (~16 row 1) | R01 |
| 2 | §1.2 Hessians, counts | −x²+y²; f=0, x² on ℝ; constant on S¹ | diag(−2,2), λ=1; 0+0≠1, 0+1=1; encard ⊤ | carried (~16 row 2) | R01 |
| 3 | §1.3 normal form, seminorms | x³−tx; τ(y)=y/2 on [−2,2] | f′=3x²−t: roots ±√(t/3) for t>0; sup (1,1,1/2) vs (1,2,2) | carried (~16 row 3) | none |
| 4 | §2.1 levels, faces | f=x on ℝ², on [a,b] | range span e₂=ker(1,0); df(outward)=±1 | carried (~16 row 4) | R01 |
| 5 | §2.2 restriction, adapted fields | band [1,4] for x²; −u²+v² | df(X)=−1, arrival t=3; df=z₁²−z₂²>0 at z₂=0 | carried (~16 row 5) | none |
| 6 | §2.3 chart change | (x²−1)², ε=1/2 | α(1)=±0.5412; two components; AᵀJA=J ⇒ P≥I | carried (~16 row 6) | none |
| 7 | `exists_morseCWModel` | S² height; f=x on ℝ; ∅; ℕ | cells (1,0,1); X=∅≄ℝ, so `BddBelow` needed; ℵ₀ 0-cells | carried (~16 row 7) | none |
| 8 | §3.1 strong topology | e^(−x²) vs 0.01 | crossover \|x\|=2.146 | carried (~16 row 8) | none |
| 9 | §3.2 exhaustion | x², \|g−f\|<1; ℕ constant | g≥−1, {g≤b}⊆{x²<b+1}; fibre ℕ noncompact | carried (~16 row 9) | R01 |
| 10 | `strong_morse_inequalities` | RP² over ℚ, 𝔽₂ | ℚ: C−B=t+t²=(1+t)t, Q=t; 𝔽₂: Q=0 | carried (~16 row 10) | none |
| 11 | `bettiNumber` | point; RP², j=1; ℕ | (1,0,…); 0 over ℚ, 1 over 𝔽₂; junk 0 | carried (~16 row 11) | none |
| 12 | §4.2 LS bound | S¹, T², RP², ∅ | 2≥2≥1+1; 4≥3≥2+1; ∅: 0+1≤0 fails | carried (~16 row 12) | none |
| 13 | §4.3 applications | h−h³/3 on S²; odd m | Hessian 0 at poles; χ=0 | carried (~16 row 13) | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h² on S^m; m=0; one point | count ⊤ or 4; S⁰={±1}; 1≠2 | carried (~16 row 14) | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | round S¹, f=h | η=√3/2, (b−a)/η²=8/3 | carried (~16 row 15) | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; m=1 | S^(−1)=∅, closures ≃{0}; latitude ±π/4 | carried (~16 row 16) | none |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | S¹ arcs; m=0; ℝ^m | glued ≃S¹; 1 vs #S⁰=2, so `0<m` needed; noncompact | carried (~16 row 17) | none |
| 18 | §5.1 Morse–Bott | y² vs y⁴; RP² | ker Hess=TC vs ℝ²; E²=(ℤ,ℤ/2,0) | carried (~16 row 18) | none |
| 19 | `exists_compactTrapped_gradient_limit` | x²; metric 4dx²; e^(−x) | γ=x₀e^(−2t); distance 2\|x₀\|e^(−t/2); e^(−x) not trapped | carried (~16 row 19) | none |
| 20 | R01, README names | README `TauCeti.` names at a91d3aaf vs 2fd255d | 76 only at 2fd255d, 12 at both, 0 only at a91d3aaf | carried (~16 row 20) | R01 |
| 21 | docstring: weak inequality (`Inequalities.lean:403`) | standard RP² function c=(1,1,1); V=ℚ, 𝔽₂, ℚ²; f=x on ℝ | ℚ: b=(1,0,0)≤(1,1,1); 𝔽₂: (1,1,1)≤(1,1,1); ℚ²: b₀=2≤1·2; ℝ (noncompact): 1≤0 fails | compactness needed and in the section binders; description exact | none |
| 22 | docstring: alternating inequality (line 414) | RP² over ℚ; T² c=b=(1,2,1) | n=0: 1≤1; n=1: b₁−b₀=0−1=−1 ≤ c₁−c₀=0; T² n=1: 2−1=1≤2−1=1 | direction agrees with CIN Cor 5.11 | none |
| 23 | docstring: Euler equality (line 429) | RP² over ℚ, 𝔽₂; n=1,2,3 | n=2: ℚ 1−0+0=1=1−1+1; 𝔽₂ 1−1+1=1; n=3 adds 0; n=1<dim: ℚ 1≠0 | `finrank ℝ E ≤ n` needed and present | none |
| 24 | docstring: Reeb (`Reeb.lean:148`) | S² height; two-point 0-manifold; point; T²; h−h³/3 on S² | indices (0,2), S²; every point critical, count 2, S⁰; 1≠2; 4≠2; not Morse, so it falls under row 14 | "Morse" in the docstring separates it from the degenerate theorem | none |
| 25 | docstring: trapped convergence (`GradientFlow.lean:261`) | x² with dx²; x⁴; f=0 on K=[0,1] | γ=x₀e^(−2t)→0, critical set {0} finite; x⁴ converges with no nondegeneracy; f=0: critical set in K infinite, hypothesis fails | "finitely many critical points" is the pinned hypothesis | none |
| 26 | docstring: exponential decay (`ExponentialConvergence.lean:303`) | x²; x⁴ | x²: distance \|x₀\|e^(−2t), μ=2, C=\|x₀\|; x⁴: γ′=−4γ³, γ²=x₀²/(1+8x₀²t), decay t^(−1/2), no bound C·e^(−μt) | "nondegenerate limit" needed and stated | none |
| 27 | R01, docstring names | the 18 docstring names at a91d3aaf vs 2fd255d; `#check` of the 6 new ones at the head's pins | 0 vs 18 present; 6 of 6 unknown; Morse directory 4 vs 35 entries | docstring false at the head's pin | R01 |

## Not verifiable

- **`hirsch-differential-topology`, `lee-smooth-manifolds` and `milnor-1963`:** uncertified and settled; cited by locator. The locators fall in untouched text, which PRREVIEW-MorseTheory~16 checked.
- **Elaboration at main's pins:** I may run Lean only from this worktree, at the head's pins. I checked the six names at 2fd255d by reading their sources in the Tau Ceti package's git objects.
- **Ownership against the open pull requests the brief names without files**, among them ManifoldOptimization (#1506), which `scratch/overlaps.md` lists as close in vocabulary: not checked. The change adds no owned object.

## Source issues

- none
