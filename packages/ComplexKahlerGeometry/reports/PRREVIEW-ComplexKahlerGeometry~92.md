# Review of ComplexKahlerGeometry (pull request #1807 at 8d8b243)

**Verdict:** needs changes

## R01 (P3) — The consumer bullet omits that C7.6 now consumes K7.1's restated Riemann-sphere diffeomorphism

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` 3557–3558: "CharacteristicClasses C2.4a consumes K7.1's projective atlas and C7.6 K7.1's comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)`".

**Claim.** This pull request's CharacteristicClasses change makes C7.6 consume K7.1's Riemann-sphere diffeomorphism on Mathlib's topology, which 7.1 (2788–2789) now restates. This bullet still lists only the model comparison, so the bullet names no consumer of the restatement.

**Witness.** `CharacteristicClasses/README.md` 272–275 at this head: "C7.6 uses only K7.1's comparison of the sphere-quotient model … and K7.1's Riemann-sphere diffeomorphism from `OnePoint ℂ` to `Projectivization ℂ (Fin 2 → ℂ)` with Mathlib's topology". The same appears in its table row 181 and at 3305–3307.

**Repair.** At 3557–3558, replace "and C7.6 K7.1's comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)`;" with "and C7.6 K7.1's comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)` and its Riemann-sphere diffeomorphism from `OnePoint ℂ` on Mathlib's topology;".

## Previous findings

- R01 — not repaired: deferred (D01). README 104 and 111–114 are unchanged: "PseudodifferentialOperators P1.0: differential-operator carriers …" and "RealAnalyticGeometry R0–R5 … consumes K1–K4, K5a's local estimates, K5b.0 and K6.0". So are the contracts at 313 and 331.
- R02 — not repaired: deferred (D02). README 2723 is unchanged: "Prove the four on Mathlib's instance by the same arguments, which use the topology only through the open quotient map".
- R03 — repaired. 2779–2780 read "Tau Ceti proves the Riemann-sphere comparison on its own copy of the topology:", and 2788 "As for the affine atlas, restate this diffeomorphism on Mathlib's instance". *Needs:* 2801–2805 lists all three modules "whose proofs 7.1 repeats on Mathlib's instance".
- R04 — repaired: 1821–1824 now read "Prove on ℝⁿ the continuous embeddings … (Demailly, Chapter VI, (2.1)–(2.2), p. 289, states the integer-order forms on a compact manifold, which the patching below recovers; the Euclidean and real-order forms are this roadmap's own)".

## Deferred findings

- D01 — stands. On main, RealAnalyticGeometry line 22 still reads "Consume ComplexKahlerGeometry K3…", and PseudodifferentialOperators line 91 still reads "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies…". This README still consumes R1, R5 and P1.0.
- D02 — stands. AlgebraicTopology §4.6 is unchanged since d524e59. TopologicalKTheory's new T1.5 Hausdorff clause (594–608) is about `TauCeti.finiteGrassmannian`, not Mathlib's `ℙ K V`.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 5.4 embedding on ℝⁿ, `H^s→C^k`, `s>k+n/2` (changed) | n=1, k=0: s=1 vs s=1/2 | `∫_ℝ(1+ξ²)^(−1)dξ=π`, so sup‖u‖ ≤ (2π)^(−1)√π‖u‖_(H¹). `∫(1+ξ²)^(−1/2)dξ` diverges like 2 log R, so the margin is strict | holds |
| 5.4 locator, Demailly VI (2.1)–(2.2), p. 289 (changed) | demailly-agbook lines 14232, 14239–14241 | Setting: (M,g) a compact Riemannian manifold. (2.1): `W^k⊂C^l` for integers `k>l+m/2`. (2.2): `W^(k+1)→W^k` compact | the repaired wording matches |
| 5.4 supported Rellich `H^s→H^r`, r<s (changed) | n=1, s=1, r=0, `u_j=j⁻¹e^(ijx)χ`; r=s | `‖u_j‖₂=‖χ‖₂/j→0`, `‖u_j′‖₂→‖χ‖₂` (bounded in H¹). At r=s the normalized `e^(ijx)χ` has no H¹-convergent subsequence | strict r<s needed; holds |
| 5.4 "Euclidean forms are own" vs PDE §§1.4, 1.6 | PDE main 803–854, 905–995 | PDE states `W^(1,p)` GNS, Morrey and `W^(1,p)` Rellich on domains; it has no `H^s→C^k` and no supported `H^s→H^r`. The contract (304–310) consumes them "for comparison" | no second owner |
| 7.1 Riemann-sphere diffeomorphism restated (changed) | t=2; ∞; wrong model t↦[1:t] | 2↦[2:1]: chart 1 reads 2/1=2=t, chart 0 reads 1/2=t⁻¹. ∞↦[1:0]: chart 0 reads 0. [1:t] gives chart-1 value 1/2≠2, excluded by `affineChart_one_equivProjectivization` (Tau Ceti `:66`) | conventions agree; Lean `example` elaborates |
| 7.1 imports behind "restate … by the same proof" | `import Mathlib` with `OnePoint.Basic`, `Projectivization.AffineChart`, `ComplexProjectiveSpace.Basic`; versus `Topology.Algebra.Projectivization` | Exit 0: the first set elaborates and `CompactSpace (TauCeti.ComplexProjectiveSpace 2)` synthesizes. The second fails: "environment already contains `Projectivization.instTopologicalSpace._aux_1`" | restatement is needed and feasible; the proof (`:83–140`) uses only atlas lemmas that K7.1 restates |
| 7.1 *Needs:* (2800–2805) against Layer 7 Dependencies (3327–3330) and the Tau Ceti contract (256–260), all changed | the item lists | Both list 3.1, 1.1, ComplexManifolds 1–3, Mathlib's instance, the sphere-quotient model and the three Tau Ceti modules (repeated on Mathlib's instance): 6 items each. The contract also says "whose proofs K7.1 repeats" | agree |
| Consumer bullet 3557 (R01) | the C7.6 chain on (z₁,z₂)∈S³ | `(1,0)↦[1:0]↦∞`, `(0,1)↦[0:1]↦0`, `(1,1)/√2↦1`. The step [z₁:z₂]↦z₁/z₂ is the inverse of K7.1's diffeomorphism: CC 272–275 names it, CKG 3557 does not | omission; R01 |

The rows for untouched statements and headline theorems stand as in the previous review, of `d524e59`.

- Gate and dependency check:
  - The worker's gate at 8d8b243 passed: every check 0, build 0.
  - My rerun without the pull request's folder list: every scanner is 0 except `outside-folder`=24, exactly the files of the 12 folders the brief names. `git diff --stat` excluding them is empty.
  - `depcheck: 206 roadmaps, 1919 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean` took 11 s and gave 27 warnings, all `declaration uses sorry`. The file is unchanged since d524e59, so the 36 elaborated signatures and the binder check stand.
- Source locators checked against the text: 2 (Demailly VI (2.1) and (2.2), p. 289, with the section's standing hypothesis). No target of the seeded sample lies in a changed passage.
- Library declarations opened at the pins:
  - Mathlib `Topology/Compactification/OnePoint/ProjectiveLine.lean:84` (`equivProjectivization`).
  - Tau Ceti `Geometry/Manifold/Instances/OnePoint/Projectivization.lean:7–10, 66, 73, 83, 140`, `OnePoint/Basic.lean:8–11, 207`, `LinearAlgebra/Projectivization/AffineChart.lean:8–11`, `Topology/ComplexProjectiveSpace/Basic.lean:8–12` and `Topology/Algebra/Projectivization.lean:90`.
  - The two "found nowhere" names (README 246, 491) are module paths, and both exist at the pin.
- Cross-roadmap citations resolved: CharacteristicClasses 181, 272–275, 3305–3307 and 3357–3358 at this head; ComplexManifolds main 103–104 and 232 (Milestone 3.4 relates formulas only and places no second projective-line topology); PDE main §§1.3–1.4, 1.6.
- Overlap check: searched ComplexManifolds, GeometricQuantization, DeRhamCohomologyAndDuality, CalibratedGeometry, GlobalHolomorphicFunctions and DifferentialGeometry for the changed objects, and every open head for `diffeomorphProjectivization` and `equivProjectivization`.
  - The diffeomorphism from `OnePoint ℂ` to `ℙ ℂ (Fin 2 → ℂ)` on Mathlib's topology is owned by K7.1, and C7.6 consumes it.
  - The Euclidean Hilbert-scale embedding and supported Rellich are owned by K5a.
  - ComplexComparisonPartII, SmoothBundlesConnections and RiemannianGeometry were not checked, because no checkout was given for them.
- Pull-request text matches the head:
  - The ComplexKahlerGeometry bullet ("K7.1 reproves on Mathlib's topology the instances Tau Ceti states on its own copy") and the CharacteristicClasses sentence ("takes ComplexKahlerGeometry K7.1's Riemann-sphere diffeomorphism on Mathlib's topology (C7.6)") hold.
  - "ComplexKahlerGeometry's changes only in comments" holds: against main, `Suggested.lean` changes only two docstrings.
- Remark (untouched clause): the 7.1 *Needs:* names only `TauCeti.Topology.ComplexProjectiveSpace.Basic` for the sphere-quotient model, although the body also uses its `Charts` module and the manifold instance `TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace`.

## Not verifiable

- webster-nn, hormander-alpdo1, wells-dacm, griffiths-harris, koszul-malgrange, nomizu-nilmanifolds and raghunathan-discrete-subgroups are uncertified in the manifest. No changed passage cites them.

## Source issues

- **Misprint** in demailly-agbook at Chapter VI, §2, p. 289: the source defines `W^k(M,F)` only for positive integers k; it should say nonnegative integers, since (2.3) uses `W^0` and (2.2) is stated for every integer k; affects nothing.
