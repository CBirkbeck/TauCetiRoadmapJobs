# Review of ToeplitzOperators (pull request #1684 at 2bb6259)
Folder: `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/`

**Verdict:** accepted

No P1 or P2 finding. The gate passes at this head (`build=0`, `sorry-data=0`, `imports=0`, `depcheck=0`, every counter zero). The five findings below are P3 notes the author may take or leave before a human's final approval; R01 is the one I would not merge without.

**Repair status of the previous review (67492e4 → 2bb6259).**

| Previous finding | Status at 2bb6259 | Evidence |
| --- | --- | --- |
| R01 (P1) build diagnostics, forbidden imports | Repaired for `Suggested.lean`; partly for the folder | `Suggested.lean:1–4` is now `module` / `public import Mathlib` / `public import TauCeti.Topology.Circle.Degree`; gate `build=0`. `StableInverseTargets.lean:1` still imports `TauCetiRoadmap.OperatorTheory.ToeplitzOperators.Suggested` (see R01 below). |
| R02 (P2) six admitted data constructions | Repaired | `hardyBasis`, `blockCoordinateCutoff`, `blockSectionReflection`, `sectionReflection` deleted; `coordinateCutoff` (line 186) built from `lp.evalCLM` and `PiLp.continuousLinearEquiv`; `symbolLoop` (line 132) has a real `Path` body with proved endpoints. Gate `sorry-data=0`. |
| R03 (P2) statable headlines absent | Repaired | `toeplitz_brownHalmos` (98), `toeplitz_fredholm_iff` (151), `toeplitz_coburn` (162) stated on the real `hardySubspace`/`toeplitz`; the three inverse-convergence headlines are in `Suggested.lean:205–232`; the module docstring (lines 16–23) names each unstatable headline and the carrier it lacks. |
| R04 (P3) padding | Repaired | `symbolMultiplier_apply`, `norm_finiteSection_le`, the `_apply` equations and both `infer_instance` examples are gone; 14 sorried theorems remain and none closes by one tactic (probe below). |
| R05 (P3) locators and editions | Repaired, with one misattribution | Every target now carries a theorem/page locator; both Böttcher–Silbermann books have editions and are marked uncertified. No roadmap on main carries a `sources.toml` (0 of 124), so I do not re-raise the manifest. The §2.1 Böttcher locators are wrong (R02 below). |
| R06 (P3) README shape | Repaired | Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers with `### k.n` prose, `**Checks.**` (3–7 per subsection), `*Needs:*` lines, `### Examples`/`### Dependencies` per layer, Downstream consumers, References. |
| R07 (P3) binary Fredholm-product API | Repaired | `README.md:111–115` and `522–525` cite `ContinuousLinearMap.IsFredholm.prodMap` and `ContinuousLinearMap.index_prodMap` at `TauCeti/Analysis/Fredholm/Prod.lean`, and keep the finite PiLp transport and converse as new targets. |

## R01 (P3) — Delete the companion file `StableInverseTargets.lean`

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/StableInverseTargets.lean:1–56`.

**Claim:** The file is a second acceptance file for the same three headlines. It imports the roadmap's own `Suggested` module (the brief allows only `import Mathlib` and `TauCeti.*` modules in a reviewed Lean file), declares `sectionProjection` and `extendedSectionInverse` with bodies identical to `coordinateProjection` and `finiteInverseExtension` in `Suggested.lean:195–201`, and restates `finiteSections_inverse_convergence`, `finiteSections_inverse_norm_le` and `finiteSections_solution_error` under the names `stableSections_isUnit_and_inverse_tendsto`, `stableSections_inverse_norm_le`, `stableSections_solution_error`. None of its five names occurs in the README, and its header docstring (lines 3–7) refers to "T4", a section label the README no longer has.

**Witness:** `StableInverseTargets.lean:22` and `Suggested.lean:201` are the same term `(coordinateCutoff n).adjoint ∘L Ring.inverse (finiteSection T n) ∘L coordinateCutoff n`. `grep` of the five names over `README.md` returns nothing. The file elaborates (`lake env lean`: three `declaration uses sorry` warnings, exit 0), so this is a duplication and form defect, not a build defect.

**Repair:** `git rm` the file. `Suggested.lean` already carries the three headlines with the README's names, so nothing else changes; rerun the gate (the library glob build includes every `.lean` under the folder).

## R02 (P3) — §2.1 attributes Brown–Halmos and the norm equality to the wrong Böttcher results

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:291–295`: "Brown–Halmos … with a unique symbol (Böttcher, Theorem 4.1, p.67, boettcher-survey line 445; norm equality in Proposition 4.2, p.68, boettcher-survey line 501)".

**Claim:** Böttcher's Theorem 4.1 (Toeplitz 1911) is the criterion "the matrix (a_{j−k}) is bounded on ℓ² iff the a_n are the Fourier coefficients of an L∞ function"; it does not state the `S†TS = T` characterization. Proposition 4.2 states that T(a) is compact iff a = 0 and self-adjoint iff a is real; it does not state ‖T(a)‖ = ‖a‖∞.

**Witness:** `boettcher-survey line 445–450` (Theorem 4.1, boundedness iff Fourier coefficients of an L∞ function); `line 452–453` (uniqueness of the symbol); `line 501–504` (Proposition 4.2: compactness and self-adjointness). No line of the survey states the norm equality or the shift-invariance criterion.

**Repair:** Move "Theorem 4.1, p.67" to the matrix-boundedness sentence (lines 281–283, where it is correct, as §6.1 line 870 already uses it) and cite the symbol's uniqueness to p.67. Give the `S†TS = T` criterion and the norm equality their own locators: Brown–Halmos, *Algebraic properties of Toeplitz operators*, J. reine angew. Math. 213 (1963/64), Theorem 6 and its corollary, or Böttcher–Silbermann, *Analysis of Toeplitz Operators*, 2nd ed., §2.7 (both uncertified unless a legal copy is found); the mathematics is unchanged. Check on the instance T = E₀₀: the shift criterion fails (S†E₀₀S = 0 ≠ E₀₀) while the boundedness criterion is not even applicable (E₀₀ is not a Toeplitz matrix), which shows the two theorems are different statements.

## R03 (P3) — Process narrative, a discussion link and cache line numbers in the README

**Location:** `README.md:16–17` ("It extends the existing finite-section target by its ambient-invertibility and inverse-convergence consequences"); `README.md:33–37` (the Zulip "Hardy-space design discussion" link and "adopting a matching Mathlib carrier when available"); `README.md:156, 222–223, 230, 233, 294–295, 325, 374, 414–415, 446–447, 476, 483, 539, 595, 630, 685, 780–781, 825` ("park line 20", "boettcher-survey line 445", …).

**Claim:** The first sentence describes the pull request's history, not the mathematics. The Zulip link is a process reference whose page the previous review could not read, and "when available" is a time-dependent clause. The "`<key> line N`" numbers are positions in the worker's extracted text cache; a reader with the cited PDF cannot resolve them, and they add nothing to the theorem/page locators that precede them.

**Witness:** `README.md:16` contains "existing"; the Zulip URL at line 34 resolves to an application shell without the message text; `park line 20` is the 20th line of the cache extraction, not a line of Park's PDF.

**Repair:** Delete the sentence at lines 16–17 (Scope already says what the roadmap owns). Replace lines 33–37 by the one mathematical sentence the paragraph needs: the analytic model is the unit-disk p = 2 Hardy space defined by harmonic majorants, built in Tau Ceti; general domains are outside this roadmap. Keep theorem/section/page locators and drop every "`<key> line N`".

## R04 (P3) — Renaming T1–T6 to Layers 1–6 strands the consumers' labels

**Location:** `README.md:146, 273, 400, 567, 713, 854` (the six layer headings) against the roadmap on main (`## T1` … `## T6`).

**Claim:** Roadmaps that cite this one use the old labels: `TauCetiRoadmap/BanachAlgebras/README.md:685` ("ToeplitzOperators T3") and `:688` ("ToeplitzOperators T5") on main, and `TauCetiRoadmap/OperatorKTheory/README.md:683` ("ToeplitzOperators T1's projection onto nonnegative Fourier modes") at its open head. After this change no section of the README is called T1, T3 or T5. The numbering coincides (T_k is Layer k), so the citations are recoverable but no longer literal.

**Witness:** `git show origin/main:TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md` has headings `## T1.` … `## T6.`; the current README has `## Layer 1:` … `## Layer 6:` with the same six topics in the same order.

**Repair:** Add one sentence to Scope and ownership: consumers cite these layers as T1–T6, Layer k being T_k. The consumers' own edits are theirs to make.

## R05 (P3) — The matrix determinant-index headline is statable and absent

**Location:** `Suggested.lean:17–19` ("The block Brown–Halmos, determinant-index and block stability statements lack the constructed block multiplier/compression"); `README.md:504–506`.

**Claim:** For a continuous matrix symbol `A : Fin r → Fin r → C(UnitAddCircle, ℂ)` the block Toeplitz operator is the r×r matrix of scalar `toeplitz (continuousSymbol (A i j))` on `PiLp 2 (fun _ : Fin r => HardySpace)`, a real-bodied definition from `ContinuousLinearMap.pi`, `PiLp.proj` and finite sums; `Matrix.det (fun i j => A i j x)` is continuous in x, so `symbolWinding` of the determinant is available. The theorem "Fredholm iff `∀ x, det (A x) ≠ 0`, and then index = −winding of det" (Park, Theorem 3.1, p.5) is therefore statable at the pins. The docstring's reason is a design choice (which of the three block models to pin), not a missing carrier.

**Witness:** `PiLp.continuousLinearEquiv` and `ContinuousLinearMap.pi` exist at the pin (`Mathlib/Analysis/Normed/Lp/PiLp.lean`, `Mathlib/Topology/Algebra/Module/...`); `symbolWinding` and `toeplitz` are already in the file. On `diag(z, z⁻¹)` the statement gives Fredholm with index −1 + 1 = 0 = −wind(1).

**Repair:** Either state the block determinant-index theorem with that entrywise definition, or leave the docstring as it stands; a P3 the author may take or leave.

## Verified sound

**Scope.** Read all 942 README lines, all 251 lines of `Suggested.lean`, all 56 lines of `StableInverseTargets.lean`, the family index `TauCetiRoadmap/OperatorTheory/README.md`, `STATUS.md` and `PROGRESS.md` (unchanged by the pull request), the previous review and the change set. `git diff --stat origin/main...HEAD` outside the folder and the family index: empty. The three principles checks: no route-specific shortcut (every statement is over general L∞ or continuous symbols and arbitrary bounded operators on ℓ²), no re-planned roadmap (the folder is the roadmap's own on main; CStarAlgebras C8, OperatorKTheory K4 and BanachSpaceTheory B5 are consumed, not restated), no `set_option`, no sorried data, no copied passage, no algorithm (the §6.1 computations are finite identities stated as Checks).

**Gate (worker, at 2bb6259).** Every counter zero, `OK`. My own targeted elaboration: `lake env lean` on `StableInverseTargets.lean` exits 0 with three `sorry` warnings only (10 s against the built `Suggested` olean).

**Dependency check.** Output, verbatim:

```text
depcheck: 205 roadmaps, 1548 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ToeplitzOperators is on main and is not a line of the merge order; its suppliers are BanachSpaceTheory (main), CStarAlgebras (open new-folder pull request #860) and OperatorKTheory (open new-folder pull request #866). Both supplier pull requests are by the same author as this one; the dependency check accepts them and the same edges already exist in the folder on main and in the family table (`TauCetiRoadmap/OperatorTheory/README.md:83`), so I record this rather than raise it.

**Pins.** `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Every declaration below was opened in these checkouts.

| Declaration | File and line at the pin | What I confirmed |
| --- | --- | --- |
| `Circle.degree`, `sub_eq_degree_mul`, `degree_eq_of_homotopy` | `TauCeti/Topology/Circle/Degree.lean:77, 82, 100` | Takes a `Path x x` in `Circle`; `θ 1 − θ 0 = degree γ · 2π` for any continuous angle lift, so counterclockwise is positive; homotopy may move the basepoint. Hence `symbolWinding (fourier 1) = 1`. |
| `ContinuousLinearMap.IsFredholm` | `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123` | Fields: strict map, closed range, finite-dimensional kernel, `range.CoFG`, closed-complemented kernel. All hold for a Fredholm operator on a Hilbert space, so `toeplitz_fredholm_iff` is the classical statement. |
| `LinearMap.index` | `Mathlib/Algebra/Module/LinearMap/Index.lean:38` | `finrank ker − finrank coker`; the forward shift has index 0 − 1 = −1, matching `toeplitz_index` with `−symbolWinding`. |
| `isFredholm_iff_exists_isQuasiInverse`, `IsFredholm.index_comp`, `index_continuousOn_isFredholm` | `Fredholm/Basic.lean`, `Fredholm/Open.lean` | Present as named in the contracts. |
| `HSMul (Lp 𝕜 p μ) (Lp E q μ) (Lp E r μ)` and `smul_def`, `coeFn_lpSMul` | `Mathlib/MeasureTheory/Function/Holder.lean:183, 186, 190` | `a • b` is the a.e. pointwise product, so `toeplitz (a • b)` in `toeplitz_hankel_product` is `T_(ab)`. `holderL` at line 132. |
| `ContinuousMap.toLp` | `Mathlib/MeasureTheory/Function/LpSpace/ContinuousFunctions.lean` | Present; `continuousSymbol` is its ∞-instance. |
| `fourier`, `fourierCoeff`, `fourierBasis`, `span_fourierLp_closure_eq_top` | `Mathlib/Analysis/Fourier/AddCircle.lean` | Present; `fourierCoeff f n = ∫ fourier (−n) t • f t`, so entry (i, j) = â(i − j) as the README states. |
| `Submodule.orthogonalProjectionOnto` | `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean` | Codomain is the submodule; used for both `toeplitz` and `hankel`. |
| `lp.evalCLM`, `lp.inftyCStarRing` | `Mathlib/Analysis/Normed/Lp/lpSpace.lean` | Present. |
| `PiLp.continuousLinearEquiv` | `Mathlib/Analysis/Normed/Lp/PiLp.lean` | Present; `.symm` carries functions to `EuclideanSpace`. |
| `DiffContOnCl.circleAverage_poissonKernel_smul`, `HarmonicOnNhd.circleAverage_poissonKernel_smul`, `HarmonicOnNhd.circleAverage_eq`, `AnalyticOnNhd.circleAverage_log_norm` | `Mathlib/Analysis/Complex/Poisson.lean`, `Harmonic/Poisson.lean`, `Harmonic/MeanValue.lean`, `JensenFormula.lean` | Present. |
| `Matrix.exists_mulVec_eq_zero_iff`, `LinearMap.finrank_range_of_inj`, `Submodule.smithNormalFormOfRankEq`, `Module.Basis.toMatrix` | `ToLinearEquiv.lean`, `Dimension/Finrank.lean:127`, `FreeModule/PID.lean:554`, `Matrix/Basis.lean` | Present; Smith form needs a `Fintype` index and full rank, as the README says. |
| `IsFredholm.add_of_isCompactOperator`, `index_add_of_isCompactOperator` | `TauCeti/Analysis/Fredholm/CompactPerturbation.lean:137` | Present. |
| `IsFredholm.prodMap`, `index_prodMap` | `TauCeti/Analysis/Fredholm/Prod.lean:98` | Present; binary, over a nontrivially normed field. |
| `TauCeti.Contour.windingNumber` | `TauCeti/Analysis/Contour/Winding/Number/Basic.lean` | Present. |
| `AddCircle.toCircle` | `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean:380` | Present (§3.1 transport). |

**Elaborated signatures.** The worker's 37 signatures were compared with the README statements one by one; none drops a binder. My scratch copy (14 theorems, with each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done)`, plus `#check @name` for 20 declarations) elaborated: all 14 attempts fail with unsolved goals, so no sorried theorem is one-tactic padding; the `#check` types agree with the README's generality (L∞ symbols where the README says L∞, continuous where it says continuous, arbitrary bounded `T` on ℓ² in Layer 4). `#synth Star Symbol` resolves to the native `Lp` star.

**Cross-roadmap citations resolved (this round).**

| Citation | Where read | Result |
| --- | --- | --- |
| CStarAlgebras C1 | pull request #860 head, `README.md:85–263` (line 151: spectral permanence; 61–66: quotient C*-norm, isometric iff injective) | Supplies what §3.1/§4.1/§5.2 consume. Anchor `#c1-ideals-hereditary-subalgebras-and-multipliers` matches the heading. |
| CStarAlgebras C5 | same head, lines 546–637 (604–609: bounded product `lp (fun i => A_i) ∞`, c₀ ideal) | Norm-null ideal of the bounded product. Anchor matches. |
| CStarAlgebras C8 | same head, lines 824–831 | Exact sequence `0→K(ℓ²)→T→C(𝕋)→0`, shift `Sx(0)=0, Sx(n+1)=x(n)`, symbol z; names ToeplitzOperators as the consumer. Anchor matches. |
| OperatorKTheory K4 | pull request #866 head, lines 374–477 | Calkin algebra, Atkinson, comparison with `IsFredholm` and its index. Anchor `#k4-fredholm-indices-and-extensions` matches. |
| BanachSpaceTheory B5 | main, `README.md:255` ff. (lines 336–346) | Hölder product at ∞,∞,∞, unit, commutative C*-laws on `Lp ℂ ∞`. Anchor matches. |
| Family index | `TauCetiRoadmap/OperatorTheory/README.md:62–69, 83` | Same ownership and supplier list. |

Ownership by object: `roadmaps grep` for Brown–Halmos, Coburn, Widom, Hankel operator, finite-section method, Toeplitz operator and Hardy space over the open pull requests and main returns only this roadmap, its family index and unrelated hits (Tracy–Widom in RandomMatrices, Berezin–Toeplitz in GeometricQuantization). No board package competes. No other `Suggested.lean` declares a `TauCetiRoadmap.ToeplitzOperators.*` name.

**Source sample (the worker's fifteen targets).** Cache ids: `park` = `59d7d62c…` (printed page = PDF page), `boettcher-survey` = `71a3eae8…` (printed page = PDF page + 56), `jerison-fejer` = `f575a029…`, `xia-hardy` = `9b4ecffd…` (image-only scan, OCR).

| Target | Locator in the README | Read at | Result |
| --- | --- | --- | --- |
| 1.1 Boundary Hardy space and multipliers | Park §1, pp.1–2 | `park` lines 19–34 | L², orthonormal basis, M_φ laws, H² as the closed span of nonnegative modes, P. Supports. |
| 1.2 Analytic model, least majorants, uniqueness | Xia Thm I.2.1 p.24; Park Lemma 2.6 p.4; Jerison Thm 1 pp.2–3, Cor 1 p.3 | `xia-hardy` lines 708–720 (printed 24, "Theorem I.2.1", harmonic-majorant norm and boundary values); `park` line 156; `jerison-fejer` lines 56–60, 90–93 | All four at the stated numbers and pages. Xia's OCR is garbled but theorem number, page and subject are legible. Supports. |
| 2.1 Scalar symbols and Brown–Halmos | Böttcher Thm 4.1 p.67, Prop 4.2 p.68 | `boettcher-survey` lines 445–455, 501–513 | Theorem 4.1 supports the matrix-boundedness criterion and uniqueness, not Brown–Halmos; Prop 4.2 is not the norm equality. R02. |
| 2.2 Hankel products | Böttcher (18) p.78, Prop 6.1 p.78; Park Prop 2.2 p.3 | lines 873, 876–880; `park` line 105 | Product formula, compactness of continuous Hankel operators, compact semicommutators. Supports. |
| 2.3 Finite block symbols | Park §3 p.5; Böttcher–Silbermann *Large Truncated* §6.1 | `park` lines 184–197 | Block multiplier/compression and matrix exact sequence. Supports; the book locator is uncertified. |
| 3.1 Scalar shift-algebra comparison | Park Thm 2.3, Cor 2.4 p.4; Böttcher Thm 6.2 p.79 | `park` lines 134–140; `boettcher-survey` line 905 | Exact sequence, symbol map, Gelfand transform of A(C)/K. Supports. |
| 3.2 Winding, Fredholmness, index | Park Cor 2.4, Thm 2.5 p.4; Böttcher Thm 4.4 p.69 | `park` lines 139–152; `boettcher-survey` line 548 | Fredholm iff nowhere zero, index = −wind (counterclockwise). Supports. |
| 3.3 Coburn and scalar invertibility | Park Prop 2.7 pp.4–5; Böttcher Thm 4.3 p.69 | `park` line 158; `boettcher-survey` line 536 | Park states the continuous nowhere-zero case; the README says so and gives the L∞ extension; Böttcher 4.3 is for a ∈ L∞. Supports as written. |
| 3.4 Matrix symbols and finite products | Park Thm 3.1 p.5 | `park` lines 198–200 | Fredholm iff pointwise invertible, index = −wind det; the remark that index 0 does not give invertibility matches §6.1. Supports. |
| 4.1 Bounded families and quotient stability | Böttcher §7 p.82 | lines 1037–1050 | Bounded sequences with sup norm as a C*-algebra. Supports. |
| 4.2 Coordinate compressions and condition numbers | Böttcher §1 pp.58–61, eq. (5), κ | lines 115, 126, 190–195 | P_n, A_n = P_nAP_n, κ(A_n). Supports. |
| 4.3 Stable inverse limits and error | Böttcher Props 1.1–1.3 pp.60–61 | lines 159–207 | Prop 1.2's proof uses both A_n and A_n* bounds, exactly the roadmap's adjoint-limit route; Prop 1.3 gives ‖A⁻¹‖ ≤ liminf. Supports. |
| 5.1 Reflection, classical Hankel, section algebra | Böttcher (31) p.83, (32) p.84, Thm 8.1 pp.84–85, Thm 8.3 p.86 | lines 1105, 1122, 1137, 1193 | Widom identity (the README's rearrangement is equivalent), W_n, boundary ideals, representation. Supports. |
| 5.2 Compatible pairs and stability | Böttcher (45)–(46) p.89, Thm 9.2 pp.90–92 | lines 1391–1392, 1424–1426 | Two strong-limit homomorphisms and the two-operator invertibility criterion for B = C. Supports. |
| 6.1 Symbols and coefficient examples | Böttcher Thm 4.1 p.67 | line 445 | Boundedness iff L∞ symbol, the criterion the examples test. Supports. |

Every other locator in the README (`park` 20, 105, 134–140, 139–152, 156, 158, 184, 198; `boettcher-survey` 159–207, 190, 445, 501, 536, 905, 1037, 1105, 1193, 1390, 1424; `jerison-fejer` 56, 90; `xia-hardy` 714) was opened and found at the stated line.

**Computed adversarial pass.** S is the forward shift T_z, E_ij sends e_j to e_i, P_n the projection onto coordinates 0…n, J_n the inclusion, Q_n = J_n†.

| ID | Statement (file:line) | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A01 | Matrix entry (i,j) = â(i−j); reflection (README 52–53, 59) | a = 2+3z | (0,0),(1,0),(0,1) = 2,3,0; reflected 2,0,3 | Pass |
| A02 | Haar mass one (60) | e₀, e₁ | ‖e₀‖² = ‖e₁‖² = 1, ⟨e₀,e₁⟩ = 0; mass 2π would give 2π | Pass |
| A03 | Degree/index of 2z, 2z⁻¹ (61; Lean `symbolWinding`) | loops exp(±2πit) | angle lift changes by ±2π, degree ±1; index ∓1 | Pass |
| A04 | `hardySubspace` membership (169, 180) | e₀, e₁, e₋₁ | negative coefficients 0,0 vs â(−1) = 1; projections e₀, e₁, 0 | Pass |
| A05 | Hardy Fourier unitary (181) | e₀+2e₁ | (1,2,0,…), ‖·‖² = 5 both sides | Pass |
| A06 | `symbolMultiplier` (182–183) | M₀, M₂, M_z on e₀; M₂ on e₋₁ | 0, 2e₀, e₁; 2e₋₁ with Hardy projection 0 | Pass |
| A07 | continuous-symbol norms (186) | 0, 2, z | 0, 2, 1 as sup and essential sup | Pass |
| A08 | Power-series bound (196) | x with coefficients 2⁻ⁿ, w = 1/2 | F_x(1/2) = 4/3; ‖x‖/√(1−1/4) = (2/√3)(2/√3) = 4/3 | Pass, sharp |
| A09 | Least majorant (245–247) | x = 0, e₀, e₀+e₁ | 0, 1, 2 at 0; |1+w|² − (2+2Re w) = |w|²−1 ≤ 0 | Pass |
| A10 | Kernel norms (248–251) | w = 0, 1/2, i/2 | 1, 2/√3, 2/√3; normalized constant coefficients 1, √3/2, √3/2 | Pass |
| A11 | Radial means (252) | x = e₁ | r² ↑ 1 = ‖e₁‖² | Pass |
| A12 | Fejér means (219–220, 254) | e₀, e₁ at N = 1, 2 | e₀, e₀; 0, e₁/2 | Pass |
| A13 | Product coefficients (224–225, 255–256) | f = e₁, g = e₋₁; f = g = e₁ | coefficient at 0: 1; 0 at 0 and 1 at 2 | Pass |
| A14 | `hardy_boundary_unique` (Lean 75) | 1−z, 0 | zero set measure 0; zero function excluded by hx | Pass |
| A15 | `toeplitz_matrix_coefficient` (Lean 87) | a = z, (i,j) = (1,0), (0,1) | ⟨e₁, Pz·e₀⟩ = 1 = â(1); ⟨e₀, Pz·e₁⟩ = 0 = â(−1) | Pass |
| A16 | `norm_toeplitz` (Lean 93) | a = 0, 2, 2z | 0, 2, 2 on both sides; 2z attains on e₀ | Pass |
| A17 | `toeplitz_brownHalmos` (Lean 98) | T = S, T = E₀₀, T = 0 | S†SS = S, symbol z unique; S†E₀₀S = 0 ≠ E₀₀, not Toeplitz; 0 ↔ a = 0 | Pass |
| A18 | `toeplitz_hankel_product` sign and star (Lean 109) | a = z, b = z⁻¹ | LHS SS†−I = −E₀₀; H_(z⁻¹)e₀ = e₋₁, H†H = E₀₀, RHS −E₀₀ | Pass |
| A19 | same, non-symmetric instance | a = z, b = z⁻² | LHS −E₀₁; H_(z⁻²)e₁ = e₋₁, H_(z⁻¹)†e₋₁ = e₀, RHS −E₀₁ | Pass |
| A20 | same, analytic/coanalytic vanishing | a = z⁻¹, b = z⁻¹; a = z⁻¹, b = z | both sides 0 (H_z = 0) | Pass |
| A21 | `toeplitz_semicommutator_compact` (Lean 115) | a = z², b = z⁻³ | rank-2 difference (e₁ ↦ −e₀, e₂ ↦ −e₁) | Pass |
| A22 | Hankel Checks (331–333) | H_z, H_(z⁻¹)e₀, H_(z⁻²)e₁; T_zT_(z⁻¹)−I, T_(z⁻¹)T_z−I | 0, e₋₁, e₋₁; −E₀₀, 0 | Pass |
| A23 | Block ordered products (382–383) | E₁₂, E₂₁ constant | E₁₂E₂₁ = E₁₁, E₂₁E₁₂ = E₂₂; Hankel parts 0 | Pass |
| A24 | Block norms (380–381) | diag(2,1); e₀⊗(1,0)+e₁⊗(0,1) | 2 (not √5); √2 | Pass |
| A25 | Essential norms/spectra (419–421) | I, E₀₀, S, I−E₀₀ | symbols 1, 0, z, 1; essential norms 1, 0, 1, 1; ker(I−E₀₀) dimension 1 | Pass |
| A26 | `symbolLoop` endpoints and values (452–453) | a = 2z | normalized exp(2πit): 1, −1, 1 at t = 0, 1/2, 1 | Pass |
| A27 | `normalizedSymbolPoint` denominator (Lean 123) | a = 0, a = z−1 | ‖a x‖ = 0 at some x: excluded by `ha` | Pass |
| A28 | Contour normalization (456–457) | γ = 2exp(2πit) | γ′/γ = 2πi; (2πi)⁻¹∫ = 1; without i: i | Pass |
| A29 | `toeplitz_fredholm_iff` (Lean 151) | z, z⁻¹, 0, z−1 | defects (0,1),(1,0),(∞,∞),(∞-codimensional range): Fredholm iff nowhere zero | Pass |
| A30 | `toeplitz_index` (Lean 156) | z², z⁻², 1 | index −2, +2, 0; −winding −2, +2, 0 | Pass |
| A31 | `toeplitz_coburn` (Lean 162) | z, z⁻¹, semicircle indicator, 0 | kernels (0, span e₀), (span e₀, 0), (0, ?); 0 has both kernels H², excluded by `ha` | Pass |
| A32 | semicircle indicator injectivity (488–490) | T_a f = 0 | ⟨f, T_a f⟩ = ∫_E |f|² = 0 forces f = 0 a.e. on E, hence f = 0 by boundary uniqueness | Pass |
| A33 | `toeplitz_isUnit_iff` (Lean 168) | 2, z, 0, I−E₀₀ | true/(nowhere zero, wind 0); false/(wind 1); false/(no ha); I−E₀₀ is not a scalar T_a | Pass |
| A34 | Determinant index (546–549) | S⊕S†; diag(z²,1); z⁻¹I₂ | defects (1,1), index 0 = −wind 1; (0,2), −2 = −wind z²; index 2 | Pass |
| A35 | Unimodular inverse (550–551) | [[1,z],[0,1]] | inverse [[1,−z],[0,1]], det 1 | Pass |
| A36 | Smith route bookkeeping (509–533) | A = z⁻ᵐQ | index T_A = mr + index T_Q; wind det A = −mr + wind det Q; sum −wind det A | Pass |
| A37 | Empty product (544–545) | r = 0 | unique operator on 0, index 0 = empty sum | Pass |
| A38 | `StableSections` (Lean 180; 606–609) | I; A₀ = 0, A_n = I (n ≥ 1); (n+1)⁻¹I; 0 | stable C = 1; stable from n₀ = 1; inverse norms n+1 unbounded; 0 not a unit | Pass |
| A39 | Finite carriers (611–613) | 2×2 ones matrix; dimensions | operator norm 2, entry max 1; (n+1)r = 1,2,3 and 2,4,6 | Pass |
| A40 | `coordinateCutoff` and adjoint (Lean 186; 643–650) | n = 0,1 on e₀, e₁, e₀+2e₁+3e₂ | Q₀e₀ = (1), Q₀e₁ = 0, Q₀†(1) = e₀; P₁x = e₀+2e₁; doubled cutoff gives 4I and inverse norm 1/4 | Pass |
| A41 | κ (651–652) | 2I, diag(2,1), 0 | 1, 2; 0 excluded (totalized inverse would give 0) | Pass |
| A42 | `finiteSections_inverse_norm_le` (Lean 216) | T = 2I, C = 1/2; T = S | ‖A_n⁻¹‖ = 1/2 ≤ C, ‖T⁻¹‖ = 1/2; S: det A_n = 0 for every n, hypothesis false | Pass |
| A43 | Adjoint bound needed (660–664) | T = S | ‖Sx‖ ≥ ‖x‖ but S†e₀ = 0; without the adjoint limit one would wrongly conclude invertibility | Pass |
| A44 | `finiteSections_inverse_convergence` (Lean 205) | T = 2I; T = iI | B_n = P_n/2 → I/2 strongly; B_n† = −iP_n → (T⁻¹)† = −iI (unstarred limit would be +iI) | Pass |
| A45 | Strong not norm convergence (675–676, 690) | T = I | ‖P_n − I‖ = 1 on e_{n+1}; pointwise error 0 eventually | Pass |
| A46 | `finiteSections_solution_error` (Lean 224; 690–693) | T = I, b = e_{n+1}; T = 2I, C = 1/2, b = e_{n+1} | error 1 ≤ (1+1)·1 = 2; error 1/2 ≤ (1+1)·(1/2) = 1 | Pass |
| A47 | Exact identity x_n − P_n y = B_nT(1−P_n)y (668) | T = I+E₀₁, n = 0, b = e₀+e₁ | y = e₁, x₀ = e₀, P₀y = 0; both sides e₀ | Pass |
| A48 | Approximate right-hand side (697–698) | T = I, J_nb_n = P_nb + εe₀ | added error |ε| = C·|ε| with C = 1 | Pass |
| A49 | Pair-swap unitary (679–680, 694–696) | sizes 1, 2, 3 | determinants 0, −1, 0; U² = I, ‖U‖ = 1 | Pass |
| A50 | `hardyCutoff`, `toeplitzSection` (Lean 237, 242; 728–733) | n = 0,1,2; T_z, T_(z⁻¹) at n = 1 | (1), (0); (1,2) norm √5; (1,2,3); [[0,0],[1,0]], [[0,1],[0,0]]; constant 2 ↦ 2I | Pass |
| A51 | `continuousToeplitzSections_stable` (Lean 246; 831–832) | a = 2, z, z⁻¹ | stable/invertible: true; false (det sections 0, wind 1); false | Pass |
| A52 | W_n (787–788) | n = 0, 1 | W₀e₀ = e₀, W₀e₁ = 0; W₁e₀ = e₁, W₁e₁ = e₀, W₁e₂ = 0; W₁² = P₁ ≠ I | Pass |
| A53 | Classical Hankel (789) | C_z, C_(z⁻¹), C_(z²)e₀ | E₀₀, 0, e₁ (entries â(i+j+1)) | Pass |
| A54 | Widom identity, both orders (748, 790–791) | a = z, b = z⁻¹; reversed | I = (I−E₀₀) + E₀₀ + 0; I = (I−E_nn) + 0 + E_nn | Pass |
| A55 | Boundary ideals independent (792–793) | P_nE₀₀P_n; W_nE₀₀W_n | limits (E₀₀, 0) and (0, E₀₀); norms 1 | Pass |
| A56 | Norm bounds (760–761) | a = 1, K = E₀₀, L = 2E₀₀ | R = 3; ‖a‖ = 1 ≤ 3; ‖K‖ = 1, ‖L‖ = 2 ≤ 6 | Pass |
| A57 | Two-limit criterion (833–834) | pair (I, I−E₀₀) | A_n = I − E_nn singular for every n; second limit not invertible | Pass |
| A58 | Block stability vs determinant (835–836, 859–861) | diag(z, z⁻¹) | det 1, wind 0, index 0; limits S⊕S† and S†⊕S each with a defect; all sections singular | Pass |
| A59 | Even coefficients unbounded (862–865, 873–874, 880) | c_k = 1/(k+1), N = 1,2,3 | 1 + 2Σ_{k<N}(1−k/N)/(k+1) = 1, 3/2, 17/9 → ∞ like 2 log N | Pass |
| A60 | Odd coefficients bounded (866–868, 875, 881–883) | c_n = sgn(n)/(|n|+1) | Σ_{n≠0}|c_n − 1/n| = 2Σ 1/(n(n+1)) = 2 (partial 1, 4/3); multiplier i(π−θ) has sup π; bound π+2; 2×2 matrix [[0,1/2],[−1/2,0]] norm 1/2 | Pass |
| A61 | Sine series (872) | θ = π | Σ sin(nπ)/n = 0 = (π−π)/2 | Pass |
| A62 | `StableSections` generality (Lean 180) | trivial normed ring | vacuously stable (0 is a unit); README 582 restricts to nonzero spaces; `FiniteOperator n` is nontrivial | Pass, no change |
| A63 | Companion duplicates (`StableInverseTargets.lean:15–54`) | `sectionProjection 1`, `extendedSectionInverse (2I) n` | same terms as `coordinateProjection 1`, `finiteInverseExtension (2I) n` = P₁, P_n/2 | Duplicate, R01 |

**Headline inventory.** README headlines: disk-boundary Hardy isometry and least-majorant norm (unstatable: no analytic Hardy carrier; named in the docstring); boundary uniqueness (`hardy_boundary_unique`); Brown–Halmos and symbol isometry (`toeplitz_brownHalmos`, `norm_toeplitz`, `toeplitz_matrix_coefficient`); Hankel product and continuous compactness (`toeplitz_hankel_product`, `toeplitz_semicommutator_compact`); scalar Fredholm, index, Coburn, invertibility (`toeplitz_fredholm_iff`, `toeplitz_index`, `toeplitz_coburn`, `toeplitz_isUnit_iff`); matrix determinant-index (absent, docstring; R05 says it is statable); bounded-product quotient stability (unstatable without C5's quotient; docstring); stable-compression invertibility, inverse convergence and solution error (`finiteSections_inverse_convergence`, `finiteSections_inverse_norm_le`, `finiteSections_solution_error`); finite-section algebra representation and compatible-pair quotient (unstatable; docstring); scalar two-limit stability (`continuousToeplitzSections_stable`); block stability (unstatable; docstring). Fourteen headlines stated, five named as unstatable with the missing carrier, one (R05) arguably statable.

## Not verifiable

- **Böttcher–Silbermann, *Analysis of Toeplitz Operators* (2nd ed.) and *Introduction to Large Truncated Toeplitz Matrices*.** Both are publisher-paywalled; the README marks their chapter and section locators uncertified, and the previous review's service lookups returned paywalled. Not re-requested; §2.3 and §5.2's block statements were checked mathematically (rows A23–A24, A58), not against these texts.
- **Conway, *A Course in Functional Analysis*, Chapter I.** Paywalled; cited only as Hilbert-space background and marked uncertified.
- **The Brown–Halmos primary paper** (J. reine angew. Math. 213). Not in the README's reference list and not fetched; R02 asks for a locator, which may be uncertified.
- **Xia's thesis statement text.** The scan is image-only and the OCR of Theorem I.2.1 is partly garbled; the theorem number, printed page 24 and subject (harmonic-majorant Hardy space, boundary values, norm as infimum of majorants at the base point) are legible and were used; the exact wording was not.
- **The Zulip design discussion** linked at `README.md:34`: the page is an application shell; R03 asks for its removal.

## Source issues

- **Misprint** in park at Theorem 2.5, printed p.4 (`park` line 142): the source says the index is minus the normalized integral of dσ/σ with factor 1/(2π); it should be 1/(2πi); affects a stated result.
- **Misprint** in park at Proposition 2.7, proof, printed p.4 (`park` lines 160–161): the source says both f and g are annihilated by T_φ; it should be T_φ f = 0 and T_φ* g = 0, as the next line (conj(φ)g ∈ H²) requires; affects the proof.
- **Error** in park at Lemma 4.3, printed p.7 (`park` line 281): the source says every operator of the form identity plus trace class is an exponential; it should say every invertible one; I − E₀₀ is a counterexample; affects a stated result.
- **Misprint** in park at §4 after Lemma 4.3, printed p.7 (`park` line 286): the source says nonvanishing symbols of winding number 1 give invertible Toeplitz operators; it should be winding number 0 (the shift has winding 1 and is not onto); affects a stated result.
