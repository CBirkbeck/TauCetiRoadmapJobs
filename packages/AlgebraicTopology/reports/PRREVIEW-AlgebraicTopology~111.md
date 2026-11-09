# Review of AlgebraicTopology (pull request #1854 at f9b2a10)

**Verdict:** needs changes

This is an incremental re-review of 81 changed lines since c104061, made in commit b9f2c11b (`README.md` 71+/10−, `Suggested.lean` 5+/2−). The pull request's commits 0ab19827 (ClassifyingSpaces) and df0367fc (CharacteristicClasses) carry the repairs of the previous R01 and R03. The previous R01, R03 and R04 are repaired, and the rewritten Stage 8.8b uniqueness route is correct (computed below). Three P3 findings remain, all about the pull request's scope and description rather than the mathematics:
- the order with DGFloer's revision (the previous R02, partly repaired);
- the two out-of-folder edits (the previous R05);
- the merge order with the other open pull requests that change this folder (the previous R06).

The gate fails only on `outside-folder`.

## R01 (P3) — The DGFloer half of the Serre-machinery move sits in DGFloer's open revision, and neither description states the order

Carried from the previous R02, partly repaired.

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 109–137: "The ordinary Serre and Eilenberg–MacLane machinery is owned here … DGFloer Layer 1 consumes these ordinary targets". Also the description's merge-order paragraph, which names neither DGFloer nor #1798.

**Claim.** AT owns Stages 4.8, 5.0, 5.5, 8.8c and 8.8d, and DGFloer consumes them.

**Witness.**
- DGFloer on main (6aa0bc9c), lines 140–142, still "owns … ordinary homology Serre spectral sequence consumed by AT5.5".
- Only #1798's head 7d8ad27 consumes AT (lines 160–173 and 197).
- #1798's merge order names neither #1807 nor this pull request.

**Repair.**
- Add to this description's merge-order paragraph: "#1798 merges after this pull request (DGFloer then consumes AT Stages 4.8, 5.0, 5.5, 8.8c and 8.8d)".
- Make #1798's paragraph list #1807 and this pull request before it.

If #1798 merged first, DGFloer would cite AT Stage 5.5 while AT on main (README line 112) consumes DGFloer's spectral sequences: each would hand the object to the other. If this pull request merged and #1798 never did, there would be two owners.

## R02 (P3) — Edits outside the pull request's named folders

Carried from the previous R05, not repaired.

**Location.** These two hunks are not in any folder that the brief names as the pull request's own:
- `Completed/ArithmeticDirichletSeries/README.md`, hunk at line 328 (1+/1−);
- `TauCetiRoadmap/SymplecticGeometry/README.md`, hunk at line 73 (3+/3−).

**Witness.** `git diff --stat origin/main...HEAD`, excluding the seventeen named folders, lists exactly these two files. The worker's gate at f9b2a10 reports `outside-folder=2`.

**Repair.** Either name the two folders as the pull request's own (the description already explains both cuts) or drop the two hunks.

## R03 (P3) — No stated order with the open pull requests that change this folder; #1808 gives Proposition 1B.9 to the other owner

Carried from the previous R06, not repaired.

**Location.** The description's merge-order paragraph, unchanged: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Witness.**
- The overlap index lists #1187, #1652, #1797 and #1808 as conflicting with this head in this folder's `README.md`, `Suggested.lean` and `TopologicalGroupFundamentalGroup.lean`.
- At #1808's head (edc8e6a), ClassifyingSpaces `Suggested.lean` line 81 states `exists_continuousMap_mapOfEq_eq_of_isAspherical`. That is Hatcher's Proposition 1B.9, which this pull request gives to AT Stage 8.8b.

**Repair.**
- State which of #1187, #1652, #1797, #1808 and this pull request is rebased on which.
- Whichever of #1808 and this pull request merges second keeps 1B.9 at AT Stage 8.8b and drops the ClassifyingSpaces theorem.
- If #1187 merges first, re-elaborate both Lean files of this folder against its pins.

## Previous findings

- R01 — repaired: ClassifyingSpaces `Suggested.lean` lines 26–29 now say 1B.9 "is a headline of the algebraic-topology roadmap, Stage 8 item 8b, and is not restated"; README lines 78 and 107 map item 11 to Stage 8 item 8b.
- R02 — partly repaired: DGFloer's revision 7d8ad27 (lines 160–173 and 197) consumes AT 4.8/5.0/5.5/8.8c/8.8d. DGFloer on main still owns them, and neither description states the order (this report's R01).
- R03 — repaired: CharacteristicClasses line 876 now reads "S0–S4 consume AlgebraicTopology's supported-cellular supplement … which owns the compactly supported local-coefficient cochains". S0 (line 883) consumes the colimit, and S5 and the comparison stay with C1.2a.
- R04 — repaired: README lines 2495–2537 give the skeletal route with 0-cell tracks (g∘τ_v)⁻¹·(f∘τ_v), the native `homotopicRel_skeletonLT_one_of_forall_homotopicRel`, the single-0-cell native theorem and the reduction from a non-0-cell base point. The Inventory, at lines 396–398 and 455–463, cites all of them.
- R05 — not repaired: the gate still lists `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` (this report's R02).
- R06 — not repaired: the description still reads "#1808 is independent of this pull request" and names no order with #1187, #1652, #1797 or #1808 (this report's R03).

## Verified sound

**Gate.**
- The worker's `gate.md` at f9b2a10 shows `outside-folder=2` (R02). Every other scanner is 0, including `build=0`, `dropped=0`, `readme-ids-missing=0`, `statement-hygiene=0`, `sorry-data=0`, `set_option=0`, `stray-files=0` and `depcheck=0`.
- The brief's gate command, run today, prints `outside-folder=31`: 29 files of the sixteen folders the brief names as the pull request's own, plus R02's two. Every other scanner it prints is 0.

**Dependency check.** The brief's `--depcheck … --movable` command prints `depcheck: 236 roadmaps, 2277 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exits 0 in 15 s.
- It gives 21 `declaration uses 'sorry'` warnings, at lines 278, 286, 309, 315, 325, 351, 451, 467, 484, 514, 528, 541, 567, 580, 598, 623, 639, 685, 745, 756 and 765, plus the output of the file's `#check` pins.
- There is no error. The headline moved from line 636 to 639 because of the three added docstring lines.

**One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (trivial; done) | sorry`. The copy elaborates with exit 0 and all 21 `sorry` warnings remain, so nothing is padding.

**Signatures.** `#check @…` on a scratch copy:
- `exists_mapOfEq_eq_of_isAspherical_cwComplex` keeps `[T2Space X] [CWComplex univ] [PathConnectedSpace X]`, `IsAspherical Y y`, independent universes, and the conclusion `f.HomotopicRel g {x}`. This matches the README at lines 2487–2497 and the new docstring. Only the docstring changed.
- `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`, flagged in `signatures.md`, mention no `T2Space`. This was settled earlier: the theorems about them carry `[T2Space Y] [T2Space Z]` explicitly.

**Pinned declarations opened and elaborated (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).**
- `TauCeti.hasHomotopyExtensionProperty_skeletonLT` (`Topology/Homotopy/Extension/CWComplex.lean` 128): the skeleton `skeletonLT C k` for every `k`. With `k = 1` this is the 0-skeleton.
- `TauCeti.hasHomotopyExtensionProperty_base` (same file, 142): the base `D`.
- `TauCeti.IsAspherical.of_basepoint` (`EilenbergMacLane/Basic.lean` 90): `IsAspherical X x → ∀ x', IsAspherical X x'`.
- `TauCeti.homotopicRel_skeletonLT_one_of_forall_homotopicRel` (`EilenbergMacLane/Homotopic.lean` 138). The hypotheses are `hY : ∀ y n, Subsingleton (π_(n+2) Y y)` and endpoint-relative agreement on every path between points of `skeletonLT C 1`. The conclusion is a homotopy relative to the 0-skeleton.
- `TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` (same file, 220). The hypothesis is `skeletonLT univ 1 = {x₀}`; the conclusion is `f.HomotopicRel g {x₀}`.
- `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel` (`Extension/HomotopyEquivRel.lean` 166). The hypotheses are the HEP of `{x₀}` and of `{y₀}`, and `h x₀ = y₀`. It gives `g` with `g y₀ = x₀`, both composites homotopic to the identity relative to the points.
- The pinned proof of line 138 matches the README's account. It matches `f` with `g` on the 1-cells relative to the 0-skeleton, then compresses relative to `skeletonLT C 2`, whose cells `e×(0,1)` have dimension at least 3.

**The 8.8b route, step by step.**
- The track at `x` is constant, so the deformation of `g` is relative to `x`. `g′∘γ ≃ (f∘τ_v)⁻¹·g∘(τ_v·γ·τ_w⁻¹)·(f∘τ_w) ≃ f∘γ` relative to the endpoints, by `f_* = g_*` on the loop `τ_v·γ·τ_w⁻¹` at `x`.
- The HEP of `{x}` for `x` in an open `n`-cell has three steps:
  1. a homeomorphism of `Dⁿ` rel `Sⁿ⁻¹`;
  2. the CW pair `(Dⁿ, {0}∪Sⁿ⁻¹)`, descending along the closed map `Φ×id`;
  3. pasting on the closed sets `ē×I` and `(Xⁿ∖e)×I`, with the open cell open in `Xⁿ`, followed by the native skeleton HEP.
- `k∘h ≃ id` relative to `x` alone gives both the existence step (`(f₀∘h)_* = φ∘(k∘h)_* = φ`) and the uniqueness chain.
- The Stage 4.5 0-cell lemma resolves (README lines 974–977).
- Hatcher Proposition 0.19 with a one-point `A` embedded as `x` in X and `v` in Y is exactly the based case, so the locator supports the step.

**Adversarial table.** The rows for changed statements were computed this round. Rows for untouched statements are carried from the previous report (r95) and the reports it cites.

| statement | instances | values each side | result | round |
| --- | --- | --- | --- | --- |
| 8.8b uniqueness route, several 0-cells (README 2503–2521) | `X = S¹`, 0-cells `x=1`, `v=−1`; `Y = S¹`; `f = z^k`, `g = z^k·e^{iπ(1−Re z)/2}` | `f(1)=g(1)=1`; `f(−1)=(−1)^k`, `g(−1)=−(−1)^k`; `deg g = k + 0` (the factor lifts through `[−1,1]`). Route track at `v`, lifted angle/π: `k+1 → 0 → k`, net `−1`. Deformation `z^k e^{itπ(1−Re z)/2}`, t 1→0: `k+1 → k`, net `−1`. Equal, so homotopic rel endpoints. Cell `v×(0,1)` has dim 1 and is handled by the 0-skeleton HEP; `eᵢ×(0,1)` (dim 2) are handled by the 1-cell matching. | Route correct; the new Check's values agree | r111 |
| 8.8b, base point inside a cell (README 2522–2537) | `X = S¹`, one 0-cell `v=1`, `x=−1` in the open 1-cell; `φ = ×k` | `h` = rotation by π: `h ≃ id`, `h(x)=v`. `k` = rotation by −π: `k(v)=x`, `k∘h = id`. `f₀ = z^k` at `v`; `f₀∘h(z) = (−z)^k` sends `−1 ↦ 1` and has degree `k` | Pointed classes `[(S¹,−1),(S¹,1)]` ↔ ℤ, as the Check says | r111 |
| 8.8b degenerate sources | `X = pt`; `X = [0,1]` with 0-cells `0,1`, `x=0`, `Y = S¹` | `pt`: `skeletonLT univ 1 = {x}`, so the native singleton theorem applies; `f = const`. `[0,1]`: `τ_v·γ·τ_w⁻¹` is a null loop, so `g′∘γ ≃ f∘γ`; `f ≃ g` rel 0, as `[0,1]` contracts to 0 rel 0 | Holds | r111 |
| Hypothesis transfer `IsAspherical Y y` ⇒ native `hY` | `Y = S¹`; `Y = S¹ ⊔ S²`, `y ∈ S¹` | `S¹`: `π_{n+2} = 0` at every point via `of_basepoint`. `S¹ ⊔ S²`: `π₂(S²)=ℤ` at points of `S²`, but `IsAspherical` fails (not path connected), so `of_basepoint` is not applicable | Path-connectedness inside `IsAspherical` is what makes `of_basepoint` valid; correct as stated | r111 |
| Docstring: "when `{x}` is the whole 0-skeleton" (Lean 634–635) | `S¹` with one 0-cell; `S¹` with two 0-cells | `skeletonLT univ 1 = {x}`, so the native theorem applies; `= {x, v} ≠ {x}`, so it does not | Restriction stated correctly | r111 |
| Inventory HEP indices (README 396–398) | `k = 0`, `k = 1` for an absolute CW complex | `skeletonLT univ 0 = ∅` (= base), `skeletonLT univ 1` = 0-skeleton (discrete) | "every skeleton … and its base" correct | r111 |
| `exists_mapOfEq_eq_of_isAspherical_cwComplex` | `X = pt`; `S¹ → S¹`, `φ = ×k`; Warsaw circle → `S¹`; `X = Y = S²`; `X = S¹ ⊔ pt` | As in r83: `CWComplex`, `IsAspherical` and `PathConnectedSpace` are each needed and present | Statement unchanged | r83 |
| `relHurewicz_bijective_of_simplyConnected_subspace`, 8.8c tower bounds | As in r83 | Values as in r83 | Unchanged | r83 |
| `hurewicz_isCIso`, `IsCIso`, `IsCEpi`, `SatisfiesSerreAxioms` | `C` = torsion, `C = 0` | Values as in r71 | Unchanged | r71 |
| `exists_cwApproximation`, `ordinaryPairQuotientComparison`, `relativeCWPushout_*`, `homotopyInversePairExtension_left`, `compactManifoldFiniteCWType`, `OrdinaryEMModel`, `basedLoopCWType` | As in r63 | Values as in r63 | Unchanged | r63 |
| `compactSupportTopClass_unique`/`_exists`, `poincareDuality_zmodTwo`, `lsCupLength_add_one_le_categoryCount`, `homologicalWhitehead`, `groupClassifyingSpace_isEMOne`, `ordinaryEMRepresentability` | As in r52/r63 | Values as in r52/r63 | Unchanged | r52, r63 |
| 8.8b normalisation; 5.3 transfer; 5.0, 5.5, 4.6, 2.5, 6.3, 6.5, 7, 1.6 conventions | As in r31/r42/r63 | Values as there | Unchanged | r31–r63 |

**Cross-roadmap citations resolved today.**
- ClassifyingSpaces at this head: `Suggested.lean` 26–29; README 53–58, 78, 107, 243–277, 393–417 and 461. Each cites Stage 8 item 8b in the sense 8.8b now states: arbitrary base points (line 276), the existence half (277) and the uniqueness half (417).
- CharacteristicClasses at this head: lines 293–302 and 876–1000 consume the supplement after Stage 6.2. This agrees with AT lines 160–166, 1687–1703 and 1753.
- DGFloer on main (6aa0bc9c): lines 140–143 and 226–232. #1798 (7d8ad27): lines 150–173, 197 and 1004–1061 (R01).
- #1807's head (cabeb14) states both AT's headline (line 656) and ClassifyingSpaces' 1B.9 (line 85). The stated order #1807 → this pull request resolves that.
- The citation resolver and the overlap index find no dropped id and no id defined only by an open revision.

**Sources.** The brief's seeded sample names no target ("none found by heading"), and the README flags no locator as unverified. The locators in the changed passages were read:
- Hatcher Proposition 1B.9 at hatcher lines 3905–3907 (printed p. 90, header at line 3884). The single-0-cell proof and the maximal-tree case are at lines 3912–3950.
- Hatcher Proposition 0.19 at hatcher lines 867–869 (printed p. 16, header at line 838).

**Remarks on untouched text (no change requested).** Lines 94–99 and 2481–2482 say ClassifyingSpaces "owns the Milnor and presentation models". The Inventory (lines 447–466) and ClassifyingSpaces at this head (lines 45–52) treat those models as pinned. ClassifyingSpaces' owned comparison is with the cellular model.

## Not verifiable

- Serre 1953, Chapter III, Theorem 1 (Stage 8.8d): settled as uncertified, and in no changed passage.
- tom Dieck 9.5.1, Weibel 5.5.1(2) and 5.5.10, Milnor *Morse Theory* 3.6–3.7, Freedman–Quinn §7.7, Lee and Thom 1954: settled as uncertified; none is in a changed passage.
- May 1967 (Stages 4.7 and 8.2): only an image scan exists and this worker has no OCR. It stays listed in `needs-references.toml`; the passages citing it are unchanged.
- Ownership against open pull requests was checked through `roadmaps show`/`overlaps` and the sibling checkouts the brief lists. #1808's and #1807's heads were read through `roadmaps show`.

## Source issues

- none
