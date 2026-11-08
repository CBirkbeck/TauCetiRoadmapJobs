# Review of TensorProductCombinatorics (pull request #1107 at 7211781)

**Verdict:** needs changes

Incremental re-review of the 4 lines changed since dd4e4e3 (one import line of `Suggested.lean`, one file path in the `From Tau Ceti` supplier contract of `README.md`; nothing changed outside the roadmap folder, `git diff --stat origin/main...HEAD` excluding the folder is empty). The gate at this head fails (`imports=1 build=3`): the renamed import does not exist at the Tau Ceti the branch pins. One blocking finding, one carried P3.

## R01 (P1) — `Suggested.lean` imports a module that does not exist at the branch's own Tau Ceti pin, and the import is unused

Location: `TauCetiRoadmap/TensorProductCombinatorics/Suggested.lean` line 6 ("import TauCeti.Analysis.Convex.Polyhedron.Basic") and `README.md` lines 260–262 ("`TauCeti.IsConvexPolyhedron` (`TauCeti/Analysis/Convex/Polyhedron/Basic.lean`: finitely many continuous affine inequalities, no boundedness)").

Claim: the head commit adapts the two lines "to the bumped Tau Ceti pin". The branch does not carry that pin. Its `lake-manifest.json` (unchanged against the merge base 350e970c, so unchanged by the pull request) pins Tau Ceti a91d3aa, where the module is `TauCeti/Analysis/Convex/Polyhedron.lean` and no `Polyhedron/` directory exists; main's bump to 2fd255d9 (commit a891cd19, where `Polyhedron/Basic.lean` exists) is not in the branch's history. The gate runs the build against the branch's manifest, so `Suggested.lean` has a bad import and the targeted build exits 1.

Witness: the gate's `imports` rule, "TauCeti module TauCeti.Analysis.Convex.Polyhedron.Basic does not exist at the pinned Tau Ceti", and its `build` block, "bad import 'TauCeti.Analysis.Convex.Polyhedron.Basic'"; `.lake/packages/TauCeti` of the worktree is at a91d3aa and lists `Analysis/Convex/Polyhedron.lean` only. Second witness: no declaration of `Suggested.lean` mentions `IsConvexPolyhedron` or any of the eight declarations of that module (`isConvexPolyhedron_setOf_forall`, `_setOf_le`, `_univ`, `.isClosed`, `.convex`, `.inter`, `.preimage`); the module docstring at lines 30–33 itself says polyhedrality and compactness of fibres are README targets not stated in the file. A scratch copy of `Suggested.lean` with line 6 deleted, elaborated with `lake env lean` from the pull-request worktree at the branch's pin, gives the same 22 `declaration uses sorry` warnings (lines 103–512, each one line above its position in the original) and no other diagnostic, exit 0.

Repair, tested on that instance: delete line 6 of `Suggested.lean`; the file then builds at the pin the branch carries and at main's pin alike (every other import, and all seven `TauCeti.*` declarations the file uses, exist at both a91d3aa and 2fd255d9 with identical text, see Verified sound). Then make the README path agree with the manifest the branch carries: either keep the present manifest and write `TauCeti/Analysis/Convex/Polyhedron.lean` at line 260, or bring the branch up to main (merge origin/main at a891cd19 or later so that `lake-manifest.json` pins 2fd255d9) and keep `Polyhedron/Basic.lean`. The second is the one the head commit intends, and all 29 backticked `TauCeti.*` names of the README exist at 2fd255d9 (table below); the file's elaboration against the Mathlib that pin brings (1b1ccf4b) is not checked here and is the gate's to confirm at the next round.

## R02 (P3) — Fulton's Theorem 12 is in §3 of the survey, not §1 (carried, not repaired)

Location: `README.md` lines 2167–2171 ("Fulton, *Eigenvalues, invariant factors, highest weights, and Schubert calculus*, §1, equations (8)–(9), with the dictionary λ(I) at equation (10) and the identification of T_r^N with the Littlewood–Richardson-positive triples at Theorem 12"), lines 2198–2199 (Layer 7 Dependencies, "§1") and lines 2699–2704 (References).

Claim: the sentence groups Theorem 12 under "§1".

Witness: `fulton2000` (arXiv math/9908012v3) line 70 opens §1 and line 490 opens §2; equations (8)–(10) are at lines 217–251 inside §1, as cited; Theorem 12 (S_r^n = T_r^n for r < n, with S_r^n the Littlewood–Richardson-positive triples under the dictionary of (10)) is at line 789, inside §3 "Highest weights" (line 653), printed page 15; its proof is §10.2 (line 1734). The diff since dd4e4e3 does not touch these lines.

Repair: write "§1, equations (8)–(10) … and §3, Theorem 12" at lines 2167–2171, and "§§1 and 3" in the Layer 7 Dependencies and in the References entry.

## Previous findings

- R01 — not repaired: `README.md` 2167–2171 still read "§1, equations (8)–(9), with the dictionary λ(I) at equation (10) and … Theorem 12", 2198–2199 "§1", 2699–2704 "§1 … Theorem 12 identifies T_r^n". Written again as R02 above.
- R02 — not repaired, settled: the folder still holds `README.md`, `Suggested.lean`, `metadata.toml` only (no `design/plan.json` for the five declared gaps), and the roadmap-level supply loop through ClassicalGroups Layers 3–6 and LieHighestWeight 6F on main is unchanged. Both are outside what this folder can change and were recorded as a human decision three rounds ago; not re-raised.

## Verified sound

**The pins and the gate (reproduced).** The branch's `lake-manifest.json` pins Tau Ceti a91d3aa and Mathlib 6b7abb3c; it is identical to the merge base's (350e970c), so the pull request changes no manifest. Main at a891cd19 pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b. The worker's gate used the lake directory for a91d3aa, where the imports of `Suggested.lean` resolve as follows (module exists at a91d3aa / at 2fd255d9):

| Import | a91d3aa | 2fd255d9 |
|---|---|---|
| `TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight` | yes | yes |
| `TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Basic` | yes | yes |
| `TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Rational` | yes | yes |
| `TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basic` | yes | yes |
| `TauCeti.Analysis.Convex.Polyhedron.Basic` | **no** (`Polyhedron.lean`) | yes |
| `TauCeti.LinearAlgebra.RootSystem.Positive` | yes | yes |
| `TauCeti.LinearAlgebra.RootSystem.KostantPartition.Basic` | yes | yes |

**Elaboration.** `lake env lean` from the pull-request worktree on the file as committed: fails at the import (as the gate reports). On the scratch copy without line 6: 22 `declaration uses sorry` warnings, nothing else, exit 0, 16 s with the object files present. Those 22 are the same declarations as in the previous two reviews (`Suggested.lean` is otherwise byte-for-byte the file of dd4e4e3: `git diff dd4e4e3..HEAD -- Suggested.lean` is the one import line), so the `#check @name` comparison of all 70 declarations with their README statements and the one-tactic padding probe reported at r3 stand unchanged; the elaborated-signatures tool of the brief failed on missing object files in the lake directory of main's pin, not on the file.

**Declarations consumed by `Suggested.lean`, opened at both pins (file:line at a91d3aa / 2fd255d9; text identical).** `TauCeti.DominantWeight.shape` (`RepresentationTheory/ClassicalGroups/DominantWeight.lean` 170 / 168), `TauCeti.dominantWeightOf` (404 / 402, `⟨l ∘ dominantSort l, antitone_comp_dominantSort l⟩`), `TauCeti.GTPattern` (`GelfandTsetlin/Basic.lean` 92 / 89, `entry : ℕ → ℕ → ℤ`; the bump only adds `uniqueTopWeightZero` for `GL 0`), `TauCeti.diagramSchurPoly` (`Schur/Basic.lean` 174 / 176, the sum over `BoundedSSYT N μ`), `TauCeti.posRoots` (`RootSystem/Positive.lean` 114 / 131, `{i | b.IsPos i}` under `[CharZero R]`), `TauCeti.kostantPartition` (`KostantPartition/Basic.lean` 163 / 163, `Nat.card {c // IsKostantPartition P b ν c}`), `TauCeti.rationalWeylFDRep` (`WeylModule/Rational.lean` 172 / 172, `FDRep k (GL (Fin n) k)`). The bump renames `YoungDiagram.diagramOf` to `ofPartition` in `Schur/Basic.lean`; neither file of this roadmap mentions `diagramOf`. `TauCeti.IsConvexPolyhedron` (`Analysis/Convex/Polyhedron.lean` 56 / `Polyhedron/Basic.lean` 56): `∃ n (g : Fin n → (E →ᴬ[ℝ] ℝ)), s = {x | ∀ i, g i x ≤ 0}` over `[AddCommGroup E] [Module ℝ E] [TopologicalSpace E]`; the only addition at 2fd255d9 is `isConvexPolyhedron_iff`. All 29 backticked `TauCeti.*` names of `README.md` have a declaration at both pins (grep of the declaration line by last component, 0 missing at either).

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff adds no supplier, section or Lean name; the worker's citation resolver finds no cross-roadmap citation and no Lean name missing.

**Form, in the changed lines.** No `lemma`, `set_option`, `#eval`, sorry'd data, process word, pull-request number or machine path; `metadata.toml` unchanged; no file in the folder that is not a roadmap file; nothing outside the folder.

**Adversarial table.** Rows for every statement the diff leaves untouched carry forward from the previous reports (r3: the hive Littlewood–Richardson headlines, Steinberg, PRV, vertical Pieri, stretching, unimodularity, chamber counts, slack and chirality, the rank-5 certificates, Schubert classes, the GL₃ crystal, §7.4 witnesses, the Lean degenerate cases; r4: the §7.5 Horn rows for N = 2..5, the §7.5 dictionary, the §9.2 Yang–Baxter arrays, the §1.2 parallelogram inequality and vertex bounds on 3 987 hives, the horizontal Pieri instance, the §6.1 quotient-rank rows; all computed there, 0 failures). New rows for the changed statement, the supplier contract of `TauCeti.IsConvexPolyhedron` at `README.md` 260–262 and its consumers §1.2, §1.3, §1.5, §2.6:

| Statement | Instances | Values each side | Result |
|---|---|---|---|
| "finitely many continuous affine inequalities": the predicate's family is `Fin n → (E →ᴬ[ℝ] ℝ)` | n = 0; n = 1 with g = const 1; n = 1 with g = const (−1) | `{x ∣ ∀ i : Fin 0, …}` = univ (`isConvexPolyhedron_univ`); `{x ∣ 1 ≤ 0}` = ∅; `{x ∣ −1 ≤ 0}` = univ: both ∅ and the whole space are polyhedra; `→ᴬ[ℝ]` is Mathlib's continuous affine map | sound |
| "no boundedness": the predicate does not imply compactness | E = ℝ, g = (x ↦ −x) | the half-line `[0, ∞)` is a polyhedron (n = 1) and is not compact; so §1.2's "closed bounded … hence compact" rightly proves boundedness itself (the parallelogram bounds) rather than reading it off the predicate | sound |
| §1.2 real fibre is a polyhedron in this sense | rank 2 fibre with boundary λ = μ = (1,0), γ = (1,1) | the fibre is cut out by the 3 rhombus inequalities and 6 boundary equalities (each equality two inequalities) in the 6 edge values with the origin fixed to 0: 12 affine inequalities in a finite-dimensional ℝ-space, which is a `Fin 12` family of continuous affine maps; the single hive of the Check (values 0,1,1,2,2,1, slacks 0,1,0) is its only point | sound |
| the file path in the contract versus the manifest | pin a91d3aa (the branch's); pin 2fd255d9 (main's) | `Polyhedron.lean` exists, `Polyhedron/Basic.lean` does not; the reverse | path false at the branch's pin (R01) |
| the import is needed by some declaration | every declaration of `Suggested.lean` against the 8 declarations of the module | 0 occurrences; elaboration without the import: 22 warnings, 0 errors | unused (R01) |

**Sources sample.** Of the seeded targets, only 1.2 and 1.3 fall in the changed passage (through the `TauCeti.IsConvexPolyhedron` citation); their locators (`ktw2` §4 Lemma 1 lines 257–262; `ktw` §5 Lemma 9 lines 1522–1528; Knutson–Tao I Appendix 2) were verified at r4 and r3 and the lines are untouched. The remaining sampled targets (2.1, 2.2, 2.5, 2.6, 2.7, 4.4, 5.3, 6.2, 6.3, 6.5, 7.2, 7.5, 8.1) are untouched by the diff and were verified in the previous rounds.

**Ownership.** The diff creates no construction; the only object it touches is a library citation (`TauCeti.IsConvexPolyhedron`), which is Tau Ceti's at both pins. Ownership against open pull requests was not rerun this round.

## Not verifiable

- `Suggested.lean` at main's pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b): the lake directory for that manifest has no object files for six of the seven Tau Ceti imports and the brief authorises Lean commands in the pull-request worktree only, so the file was elaborated only at the branch's pin (a91d3aa). The seven Tau Ceti declarations it consumes are textually identical at both pins; its Mathlib carriers were not re-checked against 1b1ccf4b.
- Fulton 2000, Littelmann 1995, Fulton's *Young Tableaux*, Knutson's handout and the course notebooks: as in the previous review; none is touched by the diff.

## Source issues

- none
