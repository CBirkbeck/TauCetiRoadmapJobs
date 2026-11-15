# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at 3b084ef)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `3b084ef`. The folder is unchanged; all five findings are about the pull request's description, which describes an earlier head. None asks for a change to `README.md` or `Suggested.lean`.

## R01 (P3) — The description says the successive-minima core and Minkowski's theorems are owned here

**Location:** pull request description, prose: "successive minima and both halves of Minkowski's second theorem with the linear-forms theorem" and "The successive-minima core (…) is owned here and is general enough for ArithmeticHeights to import"; summary block: "the upper half of Minkowski's second theorem".

**Claim:** The head owns none of these. They are consumed from SuccessiveMinima and Tau Ceti.

**Witness:** `README.md` line 27: "The successive-minima calculus and Minkowski's theorems are consumed from SuccessiveMinima … the upper half of Minkowski's second theorem are pinned Tau Ceti theorems". `ArithmeticHeights` occurs 0 times in the README.

**Repair:** Replace the two prose passages with: "covolumes of projections and primitive intersections, adapted integral bases and the comparison of real with squared-norm successive minima; the successive-minima calculus, the lower half of Minkowski's second theorem and the linear-forms theorem are imported from SuccessiveMinima (Layers 0–2), and the upper half from Tau Ceti (`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`)." In the summary block, replace "the upper half of Minkowski's second theorem" with "the comparison of real and squared-norm successive minima".

## R02 (P3) — Henk, Davenport and Howe–Moore are listed as built here; the head imports them

**Location:** description, prose: "Henk's lattice-point bounds, Davenport's estimate, transference, …" and "(Howe–Moore, Kleinbock–Margulis nondivergence, …)"; summary block: "Its top layers reach … Henk's lattice-point bound".

**Claim:** At the head these three results belong to suppliers; §4.1 is an index into the supplier's targets.

**Witness:** `README.md` line 1256: "SieveMethodsAndPrimePatterns §0.11a owns Henk's lattice-point bounds and Davenport's estimate". Line 43 leaves "the Howe–Moore theorem and Moore ergodicity (ProbabilisticAndMetricNumberTheory §4.9a)" to that roadmap.

**Repair:** Delete "Henk's lattice-point bounds, Davenport's estimate," and "Howe–Moore," from the list of what is built, and "Henk's lattice-point bound," from the summary block. Add: "Henk's bounds and Davenport's estimate are imported from SieveMethodsAndPrimePatterns §0.11a; Howe–Moore, Moore ergodicity and Mahler's compactness criterion from ProbabilisticAndMetricNumberTheory §§4.9a–4.9b."

## R03 (P3) — The supplier list names two roadmaps the head does not consume and omits eight it does

**Location:** description, prose: "and on the QuadraticFormInvariants, GlobalQuadraticForms, IntegralLattices, OrthogonalSpinGroups and GrothendieckEulerCharacteristic roadmaps", and the paragraph "Dependencies (…)".

**Claim:** OrthogonalSpinGroups is not a supplier at the head, no roadmap is called GrothendieckEulerCharacteristic, and eight roadmaps with their own contract sections in the README are not named.

**Witness:** `README.md` line 41: "this roadmap cites no section of that roadmap" (OrthogonalSpinGroups). `GrothendieckEulerCharacteristic` occurs 0 times; line 150 is "From TauCetiRoadmap.GrothendieckEulerForms". Unnamed contract headings: lines 126, 160, 194, 216, 220, 224, 228, 232.

**Repair:** Write "… and on the SuccessiveMinima, QuadraticFormInvariants, GlobalQuadraticForms, IntegralLattices and GrothendieckEulerForms roadmaps." Add to the dependencies paragraph: "SuccessiveMinima (Layers 0–2), AlgebraicKTheory (A0–A2, A5, A6), StableHomotopyKTheory (§§3.15, 3.25, 3.28, 4.14), ProbabilisticAndMetricNumberTheory (§§4.9a, 4.9b, 5.1a), AnalyticNumberTheoryPartI (§2.7), AnalyticNumberTheoryPartII (§§5.3g–5.3h), SieveMethodsAndPrimePatterns (§0.11a) and GeometricTopology (Layer 4.3.1, under gap:finite-quadratic-arf)." Change "ArithmeticGaloisDuality (R02.3, …)" to "(R02.3.1 and R02.4.1–R02.4.4)".

## R04 (P3) — PointProcesses, HomotopySpheres and AlgebraicTopology are named as suppliers and consumers; the README names none of them

**Location:** description, prose: "PointProcesses (the Poisson law) and HomotopySpheres with AlgebraicTopology (the real Bott chain, …)" and "The configuration constructors exported to PointProcesses precede its Poisson law …"; summary block: "The roadmap also feeds PointProcesses, the surgery obstruction groups of HomotopySpheres and Hecke's lemma in LFunctions".

**Claim:** The head has no edge to or from these three roadmaps, and LFunctions is a supplier of §3.3, not a consumer.

**Witness:** `PointProcesses`, `HomotopySpheres` and `AlgebraicTopology` each occur 0 times in `README.md`. Line 1346: "The needed finite Poisson law is `finitePoissonConfiguration`", a target of this roadmap. Line 190 is "From TauCetiRoadmap.LFunctions"; "Downstream consumers" (line 3128) names none of the three.

**Repair:** Delete the three passages. In the summary block write instead: "Its Grothendieck–Witt groups are the input to a later computation of hermitian K-theory of the integers" (already there) and nothing about PointProcesses, HomotopySpheres or Hecke's lemma. In the dependencies paragraph write: "The finite Poisson samples used in §4.2 are this roadmap's own (`finitePoissonConfiguration`); LFunctions (Layers 0, 3 and 5) supplies the Dedekind zeta function, its completion and the finite-order Hecke L-functions."

## R05 (P3) — Two sentences about "Local restatement" declarations and supplier ordering have nothing behind them at the head

**Location:** description, prose: "The temporary local spellings are the "Local restatement" declarations listed in that table, each to be replaced by the supplier's import" and "so there is no whole-roadmap supplier-first ordering requirement".

**Claim:** The README has no "Local restatement" declarations, and the second sentence contradicts the description's own merge-order block.

**Witness:** `Local restatement` occurs 0 times in `README.md`. The description's block reads "**Depends on** (suppliers still open; they merge first)"; the dependency check places this roadmap after its last supplier, ProbabilisticAndMetricNumberTheory.

**Repair:** Delete both sentences. Keep "The open pull requests that must merge first are in the merge order below."

## Previous findings

The previous report (of `3b084ef`) had no findings.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (the "upper half" R01's repair cites; `MinkowskiSecond.lean` line 626) | `L = ℤ²`, `K = [−1,1]²`; `K = [−2,2]×[−½,½]`; `E = 0` | λ = (1,1), μK = 4: 4 ≤ 4. λ = (½,2), μK = 4: 4 ≤ 4. Dimension 0: `1·c ≤ 2⁰·c` | holds with equality; the name and file in line 27 of the README exist at the pin |
| `lll_short_vector_factor` (headline the description names; `Suggested.lean` line 440) | n = 1, `x = k·b₀`; n = 2, `b = ((1,0),(½,1/√2))`, `x = b₁` | n = 1: `‖b₀‖² ≤ 2⁰·k²‖b₀‖²`, k ≠ 0. n = 2: μ = ½, Lovász `(¾−¼)·1 = ½ ≤ ½`; `1 ≤ 2·¾ = 1.5` | holds; the extremal Lovász case leaves slack 0.5 |
| Description against the README, by name | occurrences in `README.md` | PointProcesses 0, HomotopySpheres 0, AlgebraicTopology 0, ArithmeticHeights 0, GrothendieckEulerCharacteristic 0, "Local restatement" 0, OrthogonalSpinGroups 1 line (41, as a non-supplier) | R01–R05 |

The rows for every statement of the folder stand as in the previous review, of `3b084ef`: the folder has not changed.

- Description sentences confirmed against the head: the folder's three files; the Cho–Yamauchi formula, mass of a definite genus, Siegel's mean value theorem, Margulis, Duke, the LLL factor and the hermitian delooping as end theorems (README line 5); the motivic comparison and integer Grothendieck–Witt tables outside the roadmap (line 45); §3.3 supplying OrthogonalTamagawaAndLatticeMass (line 41); ReductiveGroupsPartII RG2.3 (line 180); AdelicAlgebraicGroups AA.1–AA.3 (line 43).
- Folder change since the previous review: 0 lines. Changes outside the folder against `origin/main`: none. Seeded sample: no changed passage, so no sampled target falls in the change; the README flags no locator as unverified.
- Gate: the worker's run at this head passes every check, `build=0 OK`. A rerun of the plain gate command prints `depcheck=3` with UPWARD lines to ArithmeticGaloisDuality, ProbabilisticAndMetricNumberTheory and SieveMethodsAndPrimePatterns against the unmoved order (this roadmap at #55); the three are the suppliers the moved order places before it, so this is the `moved:` case and not a finding.
- Dependency check with the moved order, verbatim: `depcheck: 245 roadmaps, 2224 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 21 `declaration uses sorry` warnings, no error, no other warning, 9 s.
- Library declarations opened at the pin: 1 (`TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean` line 626).
- Cross-roadmap names resolved: SuccessiveMinima (on main; Layer 2 has 2.1 lower inequality and 2.2 linear forms), GrothendieckEulerForms (on main), OrthogonalSpinGroups (Completed, on main), OrthogonalTamagawaAndLatticeMass (open, later in the order, a consumer). No roadmap named GrothendieckEulerCharacteristic, ArithmeticHeights or PointProcesses is on main or among the open heads listed.
- Overlap check: `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy; of the closest roadmaps only SuccessiveMinima's layer headings were read this round (owner of the successive-minima calculus, cited at README line 27); the others were not re-read because the folder is unchanged.
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The not-verifiable items of the previous reports are unchanged (Weil 1964, Siegel 1945, Banaszczyk 1993, Siegel 1935, Iwaniec 1987, Wall §13A, Kervaire–Milnor, Axler–Bourdon–Ramey and the unsampled sources); nothing in this round depends on them.
- The description is quoted to this review up to its closing attribution line; the generated `depends-on` and `merge-order` blocks were not checked.

## Source issues

- none

## For the human reviewers

- none
