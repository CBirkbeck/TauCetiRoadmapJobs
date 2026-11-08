# Review of SmoothBanachRepresentations (pull request #1145 at 22e3c68)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

:robot: Incremental AI re-review of the 21 lines changed since b04eb8f: the new scope paragraph on NoncompactQuantumSymmetry M0 and NoncommutativeGeometry N6, the sentence removed from §3.4, the torus material removed from §8.1 and its new star-law Check, and the shortened Downstream consumers section. This round also covers the gate and elaboration after the merge of main, which moved the toolchain to Lean v4.36.0-rc2 and the Mathlib and Tau Ceti pins. Four findings, one of them blocking. The gate fails on a Lake warning that the merged toolchain introduced, not on the mathematics.

## R01 (P2) — M0 is said to build the unitary Gårding space itself, but it consumes Layers 0–4

**Location:** `README.md:11`: “[NoncompactQuantumSymmetry M0] builds the Gårding space, smooth vectors, mixed-word domains and enveloping action of a strongly continuous unitary Hilbert representation directly”. The same commit also drops M0 from Downstream consumers (`README.md:518`, which now names only OperatorKTheory K3).

**Claim:** The sentence makes M0 a second constructor of a carrier that this roadmap builds generically. The next sentence says so: “The generic layers below cover unitary actions as a special case”. That is two owners for one object. It also contradicts M0's own contracts, and the removal at :518 hides a consumer that still exists. The ownership list also leaves out analytic vectors, which M0 claims as its own.

**Witness:** NoncompactQuantumSymmetry at the head of its pull request (70440b4), `README.md:20`: M0 uses “SmoothBanachRepresentations Layers 0–4 for the Gårding space and smooth-vector calculus”; :730 “consume SmoothBanachRepresentations Layers 0–4”; :789 *Needs:* the same.

**Repair:** Replace the first sentence of :11 with: “NoncompactQuantumSymmetry M0 consumes Layers 0–4, read on a complex Hilbert space, for the Gårding space, smooth vectors, mixed-word domains and enveloping action of strongly continuous unitary representations, and owns the Hilbert-adjoint statements on that domain: skew-symmetry of real generators, Nelson's operator, analytic vectors, and the elliptic and central closures.” At :518, restore a sentence such as “NoncompactQuantumSymmetry M0 uses Layers 0–4 in the unitary Hilbert case and owns the adjoint statements listed under Scope and ownership.” I checked both sentences against M0 :20, :94, :730–742 and :789 at 70440b4: every clause matches what M0 consumes and owns. The direction is legal, since M0 is at line 146 of the merge order and this roadmap is at line 64.

## R02 (P3) — The gate's targeted build fails on a Lake module-system warning

**Location:** `Suggested.lean:1`, `import Mathlib`. The merge of main changed `lean-toolchain` from `v4.35.0-rc3` (at b04eb8f) to `v4.36.0-rc2`.

**Claim:** The targeted build may report no warning other than `sorry`. At the new toolchain, Lake warns on a non-module file that imports Mathlib.

**Witness:** I reran the gate with `--build` at this head. It printed `build=2 FAIL` and, twice: “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file”. Every other scanner is at 0.

**Why P3 and not P1:** The build completes, and `lake env lean` shows exactly the seven `sorry` warnings, so nothing fails to elaborate. The gate still counts this warning as a failure, though, so this finding alone prevents acceptance.

**Repair:** Make line 1 `module`, then a blank line, then `import Mathlib`. `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/Suggested.lean:1–3` on main uses the same header, as do 13 other `Suggested.lean` files there. I tested it: a scratch copy of this file with that header elaborates with exactly the seven `sorry` warnings, and the gate's import rule accepts a `module` line before `import Mathlib`.

## R03 (P3) — The new star-law Check depends on a rotation direction it does not state

**Location:** `README.md:506`: “On C(S¹) with rotations and pointwise conjugation as star, f=exp(ix) has Df=i·exp(ix) and D(f*)=−i·exp(−ix)=(Df)*, the star law. The Hilbert skew-adjoint sign −(Df)* would give i·exp(−ix) instead.”

**Claim:** The displayed values hold only for the rotation (α_t f)(x)=f(x+t). The roadmap's own left translation `L_g f(x)=f(g⁻¹x)` (§1.4, :148) gives (α_t f)(x)=f(x−t). Under that rotation, the value the Check calls correct is the value of the wrong law.

**Witness:** With (α_t f)(x)=f(x−t): Df=−i·exp(ix) and D(f*)=d/dt exp(−i(x−t))|₀=i·exp(−ix)=(Df)*. The Check's “correct” value, −i·exp(−ix), is then −(Df)*.

**Repair:** Write “On C(S¹) with the rotations (α_t f)(x)=f(x+t)” and keep the values. Alternatively, use f(x−t) and display Df=−i·exp(ix), D(f*)=i·exp(−ix)=(Df)*, with −i·exp(−ix) as the wrong value. I recomputed both versions for f=exp(ix): the star law holds in each, and the wrong law is excluded in each.

## R04 (P3) — The family index still has no entry, and the companion pull request has no stated order

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11–` (“## The roadmaps”). The family index belongs to this pull request together with the folder.

**Claim:** The family index lists every roadmap of the family. Carried from the previous report's R01.

**Witness:** At this head, 14 of the 15 subfolders have an index link and `SmoothBanachRepresentations` has none. The open RepresentationTheory pull request #1146 (head e5e8364) adds that bullet at its :55. This pull request's description never mentions #1146.

**Repair:** Do one of the following. Either move #1146's bullet (and its :120 sentence) into this pull request and close #1146. Or add a line to this pull request's description saying that #1146 adds the family-index entry and merges after this one, because its link points into this folder.

## Previous findings

- R01 — not repaired: the pull request leaves `TauCetiRoadmap/RepresentationTheory/README.md` untouched since b04eb8f, apart from main's ArtinAlgebras entry; the index still has no entry for this roadmap. The entry now exists in #1146, so this report's R04 carries the finding with a repair about ordering.

## Verified sound

Head `22e3c68074c91185643ea5bd211406c5dcede396`, worktree clean; main is `eaf17b1`. The brief's outside-folder diff against `origin/main` is empty: only `README.md` and `Suggested.lean` of the folder differ from main. `Suggested.lean` is byte-identical to b04eb8f. The pins moved with the merge: Mathlib from 6b7abb3 to 1b1ccf4, Tau Ceti from a91d3aa to 2fd255d. This review changed no file in the worktree.

### Gate, dependency direction and Lean

- The gate rerun by this review with the candidate order and `--build` gives `depcheck=0` and every text scanner at 0, but `build=2 FAIL` (R02). Without `--order` it adds only `NOT IN ORDER: SmoothBanachRepresentations`, which is not a defect.
- The movable dependency check printed exactly:

```text
depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The diff adds no `*Needs:*` edge and removes one: NoncommutativeGeometry N6, from §8.1's *Needs:* (:494) and from Layer 8's Dependencies (:512).
- `lake env lean` on `Suggested.lean` at the new pins: seven “declaration uses `sorry`” warnings and nothing else.
- A scratch file with `#check @name` for all 12 declarations elaborated, and the 12 types match the worker's signature file. The six defs keep only the binders their bodies use, as before. All seven theorems carry the full section context. `smooth_inverse` has `CompleteSpace A`, `h1` and `hmul`, and no orbit-continuity hypothesis, as the README states.
- One-tactic probe at the new pins, with `first | rfl | infer_instance | fun_prop | simp` substituted for each `sorry`: all 7 theorems fail (“simp made no progress” ×4, “unsolved goals” ×3). No padding.
- No `set_option`, no sorry'd data, one `import Mathlib`, no `lemma`.

### Adversarial computations on the changed statements

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 1 | :11, M0 builds the unitary Gårding space “directly” | M0 at 70440b4: :20 consumes SBR Layers 0–4 and specializes them to unitary representations; :730–733 consume π(f), the Gårding space, smooth vectors with their Fréchet topology, mixed-word domains, and the derived Lie and enveloping actions; :789 and :1084 list SBR Layers 0–4. M0 passages that build these objects without SBR: 0. | False; R01 |
| 2 | :11, M0 owns skew-symmetry, Nelson's operator, and the elliptic and central closures | M0 :738–740: differentiating `⟨π(e^{tX})v,π(e^{tX})w⟩=⟨v,w⟩` at 0 gives `⟨dπ(X)v,w⟩+⟨v,dπ(X)w⟩=0`. Translation on L²(ℝ), (π(t)f)(x)=f(x−t): dπ(∂)=−d/dx, and `⟨−f′,g⟩=⟨f,g′⟩=−⟨f,−g′⟩`, so the generator is skew. N=1−Σdπ(X_i)² at :741; closures at :762–786. M0 :20 and :743 also own analytic vectors, which :11 omits. | Ownership correct; list completed in R01's repair |
| 3 | :11, “the generic layers cover unitary actions as a special case” | A strongly continuous unitary representation on a complex Hilbert space H is a `ContRepresentation ℂ G H` with `HasContinuousOrbits` and ‖π(g)‖=1. The Conventions require only strong continuity, and `IsScalarTower ℝ ℂ H` holds. | True |
| 4 | :11, N6 owns the identification with gauge smooth vectors, the two-sided finite-order comparison, and inverse closure at every matrix level | Main N6 :488–490 states the identification and the all-matrix spectral invariance. The comparison is absent on main (no `Q_k`); the NoncommutativeGeometry revision head (3452a95) states `Q_k≤C_kP_k` and `P_m≤D_mQ_(m+3)` at :891–905. Removed values rechecked there: θ=0, a=1+U₁ gives Q₀=1 and P₀=sup_z|1+z|=2. Σ(1+|r|+|s|)^(−3)=1+Σ_n 4n(1+n)^(−3)<∞, while exponent 2 gives Σ4n(1+n)^(−2)=∞. | True at the revision head, which the description lists as merging first; recorded as a revision dependency, not a finding |
| 5 | §3.4 :261, the unitary skew-symmetry comparison removed | Passages of this README that still use skew-symmetry: 0 (`skew` occurs only at :11, :38 and :506). QuantitativeOrbitMethod (open, its :123 and :328) cites §3.4 only for integration by parts of π(f). The formula `π(f)dπ(X)v=π(q_X f−L_X f)v` is unchanged. | No dangling use |
| 6 | §8.1 Check 5 (:506) | With f(x+t): Df=i e^{ix}, D(f*)=−i e^{−ix}=(Df)*, and −(Df)*=i e^{−ix}. With f(x−t): Df=−i e^{ix}, D(f*)=i e^{−ix}=(Df)*, and −(Df)*=−i e^{−ix}, which is the Check's displayed “correct” value. | Law holds; the displayed values need the direction stated; R03 |
| 7 | §8.1 Examples (:510) against Checks 2 and 4 | Check 2: −(I−E₁₂)E₁₂(I−E₁₂)=−E₁₂+E₁₂²=−E₁₂. Check 4: D²(e^{2ix}) at 0 is (2i)²=−4; the derivation rule gives D²f·h+f·D²h=−1−1=−2. Examples now name inversion, the Leibniz rule and the star law, matching Checks 2, 4 and 5. | Consistent |
| 8 | §8.1 *Needs:* (:494) and Dependencies (:512) | Both now read “Layers 0–4; BanachAlgebras A1–A2; Layer 6 only for exact Gårding identification”. Mentions of N6 or the torus left in Layer 8: 0. The body uses A1–A2 (inversion, resolvent contours) and the E∞ carrier of Layers 2–4. | Consistent |
| 9 | Downstream consumers (:518) | Roadmaps citing this one at open heads: M0 (:20, :94, :730, :789), CompactQuantumMetricSpaces (§§2.1, 3.1, 8.1, its :1106), QuantitativeOrbitMethod (§§2.1, 3.1, 3.4, 6.1) and OperatorKTheory K3 (its :356). Listed: 1. The diff removed M0. | R01 |
| 10 | Headlines in `Suggested.lean` (unchanged) at the new pins | 12 types re-elaborated (above); one-tactic probe fails on 7 of 7. | Stand |

All other rows stand as recorded in the previous report (rows 14–19) and in the reports before it (rows 1–70): the diff leaves those statements untouched, and the new pins change none of their declarations (below).

### Library declarations at the new pins

Each was opened at the pin. Mathlib:
- `ContRepresentation` at `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`: a structure wrapping `G →* V →L[R] V`, with no continuity in g. `ContIntertwiningMap` at :81.
- `exists_extension_of_le_sublinear` at `Mathlib/Analysis/Convex/Cone/Extension.lean:159`.
- `contDiffAt_ringInverse` at `Mathlib/Analysis/Calculus/ContDiff/Operations.lean:779`, under `[HasSummableGeomSeries R]`, which complete normed rings get from the instance at `Mathlib/Analysis/SpecificLimits/Normed.lean:305`.
- `ContDiffAt.comp_contMDiffAt` at `Mathlib/Geometry/Manifold/ContMDiff/NormedSpace.lean:84`.
- `Continuous.integrable_of_hasCompactSupport` at `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean:617`.
- `UniformSpace.Completion` at `Mathlib/Topology/UniformSpace/Completion.lean:291`.
- `banach_steinhaus` at `Mathlib/Analysis/Normed/Operator/BanachSteinhaus.lean:40`.

Tau Ceti:
- `oneParameterSubgroup` and `contMDiff_oneParameterSubgroup` at `TauCeti/Geometry/Lie/Exponential/Basic.lean:187` and :214.
- `StronglyContinuousSemigroup` at `TauCeti/Analysis/Semigroups/Basic.lean:43`. `Generator/Basic.lean`, `Closed.lean` and `SmoothVectors.lean` are present.
- `Complexification` :82, `reCLM` :276, `ofRealLI` :290 and `complexify` :409 in `TauCeti/Analysis/Normed/Module/Complexification.lean`.
- `chartVolumeDensity` :48, `chartVolumeDensity_pos` :61 and `contMDiffOn_chartVolumeDensity` :74 in `VolumeDensity/Basic.lean`.
- `Homeomorph.measurePreserving_riemannianVolume` at `VolumeDensity/Isometry.lean:173`.

All 17 resolve at the pins this head builds against.

### Cross-roadmap citations resolved this round

| Citation | Resolved passage | Result |
|---|---|---|
| NoncompactQuantumSymmetry M0 and its anchor (:11) | Head 70440b4, heading :648 “Layer 3: M0 — Smooth vectors, compact types and semisimple representation bridges”; the slug matches. Not on main: it is a new roadmap, placed after this one in the merge order. | Resolves at that head; content mismatch is R01 |
| NoncommutativeGeometry N6 and its anchor (:11) | Main :475, slug matches; content at main :488–490 and at the revision head :891–905 | Resolves (row 4) |
| OperatorKTheory K3 (:490, :518) | Open head d1b2465, :236 heading and :356 “topological K-theory of dense inverse-closed Fréchet subalgebras” | Resolves |
| BanachAlgebras A1–A2 (§8.1) | Main :181 (“A1–A8 denote these same layers”), Layer 1 :183, Layer 2 :440 | Resolves |

The NoncommutativeGeometry revision head (its :58–60 and :1108–1110) still says SmoothBanachRepresentations Layer 8 consumes N6's seminorm comparison. At this head Layer 8 consumes nothing from N6. That line belongs to the revision's own review, and it is not a second owner: both roadmaps assign the comparison to N6. The pull-request description still describes the torus comparison as this roadmap's. Neither point is a finding here.

### Seeded source sample

Of the sampled targets (0.2, 0.3, 1.1, 1.2, 1.3, 2.1, 3.2, 4.1, 5.1, 6.1, 7.2, 7.2a, 7.3, 7.4, 8.1), only 8.1 falls in the diff. Its changed text cites no external source. Its library inputs (`contDiffAt_ringInverse` and `ContDiffAt.comp_contMDiffAt`, with the hypotheses above) and its supplier labels (BanachAlgebras A1–A2, OperatorKTheory K3) were checked above. The other targets lie outside the diff and were not re-read this round. Their locator checks stand as earlier rounds recorded them.

### Ownership against open work

The overlap tool, rerun, reports no other pull request changing this roadmap, no dropped or revision-only ids, and the same five closest roadmaps. `roadmaps grep SmoothBanachRepresentations` over the 466 open heads and main gave the consumer list of row 9 and found #1146 (R04). The new scope paragraph creates no second owner, apart from the M0 sentence in R01.

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables* (1978): no legal readable copy, as in earlier rounds. The README labels its locators uncertified, and nothing in the diff depends on it.
- The repaired header of R02 was tested by elaborating a scratch copy, not by rerunning the gate's Lake build on it. That would mean changing the worktree, which this review does not do.
- The five board packages listed in the brief are arithmetic and logic packages; their contents were not fetched.

## Source issues

- none
