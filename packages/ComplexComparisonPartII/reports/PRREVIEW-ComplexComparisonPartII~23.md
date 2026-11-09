# Review of ComplexComparisonPartII (pull request #848 at d8d530a)

**Verdict:** needs changes

This is an incremental re-review of the 40 README lines changed since `ab134e5` (36 added, 4 removed). The changes are:

- a new scope bullet for RealAlgebraicGeometry (:296–298);
- the paragraph *Further Tau Ceti roadmaps this roadmap builds on*, rewritten (:317–332);
- four new supplier contracts: GeometricCurrents (:766–771), Hyperfunctions (:772–778), DerivedDeRhamCohomology (:836–841) and CrystallineCohomology (:842–849);
- the TauCetiRoadmap line of *References*, rewritten (:5194–5195).

`Suggested.lean` is unchanged (`git diff ab134e5 HEAD -- …/Suggested.lean` is empty). No file outside the folder changed.

Three findings remain:

- R01 (P2) is carried from the previous review.
- R02 (P2) is new and sits in the new GeometricCurrents contract.
- R03 (P3) is new and sits in the rewritten paragraph.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim is at :91 and :5097.

**Claim:** C5.4 is the only owner of these objects, and its consumers take them from C5.4.

**Witness:** ComplexKahlerGeometry #1234 is unchanged at `682823db`. Its README :731–735 still reads "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` … It supplies this segment … to ComplexComparisonPartII C5.4". The claim is repeated at :826.

The other pull requests are also unchanged:

- **K3Surfaces #1285 (`920b5227`):** README :184 still declares `gap:integral-topology` against ComplexKahlerGeometry, and :434 still says no part of that comparison is constructed there.
- **K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da06`):** README :13 still calls `Pic_hol(M)≃H¹(M,O_Mˣ)` "K3Surfaces' contract with ComplexKahlerGeometry".
- **The pull-request description:** still has no ownership paragraph.

The ComplexKahlerGeometry heads #1398, #1807, #1808 and #1854 make no K4.P claim. The commit since `ab134e5` does not address this finding, and no repair report marks it `not actionable in this package`.

**Repair:** unchanged from the previous review. Add the following paragraph to the merge-order block of the pull-request description. It edits no file in the folder.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–735, :826), which hands the segment to C5.4, and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :184, :434) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

**Tested** on the refuting lines: with this paragraph, each of #1234 :731, #1285 :184 and :434, and #1375 :13 is named together with the edit that makes it cite the one owner. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` and give that reason.

## R02 (P2) — The new GeometricCurrents contract gives C5.4 the test-form identification that G1 owns, and "No supplier is re-planned" is then false

**Location:**

- README :769–770 (new): "C5.4's `realComplexCurrentComparison` identifies these tests with K5a's real exterior-dual/density specialization and extends currents to complex coefficients with the grading sign".
- README :330 (changed): "No supplier is re-planned".
- C5.4 :3608–3616 states the duplicated part: "identify GeometricCurrents G1's compactly supported real `q`-form tests with K5a's real `BundleTest(V_q* ⊗ DensityBundle N)` … Prove equality of the LF topologies … and the induced compact-convergence dual equivalence".

**Claim:** G1 supplies the real currents, and C5.4 identifies G1's tests with K5a's bundle tests.

**Witness:** GeometricCurrents on main, :139–163: "Define `TestForm k M` as K5a's compactly supported smooth real bundle tests `BundleTest(V_k* ⊗ D)` … Prove the induced compact-convergence dual equivalence with real `BundleDistribution(V_k)`". :979: "C5.4 later consumes the G1 specialization."

The two sides describe the same object:

- **The bundle:** G1 :42 sets `V_k = A_k* ⊗ D` with `A_k = Λ^k T*M`; C5.4 sets `V_q = (Λ^q T*N)* ⊗ DensityBundle N`.
- **The map:** both use the evaluation and density cancellation `V* ⊗ D ≅ Λ T*`.
- **Orientation:** both need none.
- **The results:** both prove LF-topology equality and the dual equivalence with `BundleDistribution(V)`.

G1 :78 also says "G1 owns the real form specialization". So the first paragraph of `realComplexCurrentComparison` plans again what G1 supplies. The new contract writes this into the supplier boundary, and the sentence at :330, widened from "None of these" (the roadmaps listed there) to every supplier, becomes false.

**Repair:**

1. At :769–770, replace the quoted sentence with: "G1 also supplies the identification of these tests with K5a's `BundleTest(V_q* ⊗ DensityBundle N)`, the equality of their LF topologies and the compact-convergence dual equivalence of `Current q N` with `BundleDistribution(V_q)`. C5.4's `realComplexCurrentComparison` extends currents to complex coefficients with the grading sign and compares masses."
2. At :3608–3616, replace the text from "identify GeometricCurrents G1's …" through "These are specializations of K5a's general foundation." with: "consume GeometricCurrents G1's identification of its real `q`-form tests with K5a's `BundleTest(V_q* ⊗ DensityBundle N)`, `V_q = (Λ^q T*N)* ⊗ DensityBundle N`, with its LF topology and the dual equivalence of `Current q N` with `BundleDistribution(V_q)`, retaining evaluation, support, restriction, gluing and G1's boundary."
3. In the ownership row :154 and the scope bullet :260–262, change "C5.4 identifies G1's tests with its real exterior-dual/density specialization" to "G1 identifies its tests with K5a's real exterior-dual/density specialization; C5.4 supplies the complex extension with the grading sign".

**Tested** against G1 :139–163, :78 and :979: after these edits G1 is the only roadmap that states the identification, which matches "C5.4 later consumes the G1 specialization". C5.4 keeps the complex extension `J_q`, the sign `d J_q(T) = (−1)^(2n−q+1) J_(q−1)(∂T)` and the comass/trace mass comparison. G1 states none of these, because its specialization is real and uses no complex structure (G1 :49). With the duplicate gone, :330 is true again. The first Check of C5.4 (`ℝP²`, `q = 0`, dual-density tests are scalar functions) still holds, because it is a consequence of G1's identification.

## R03 (P3) — The rewritten paragraph says the scope list cites suppliers by section, but the UniversalCovers bullet cites none

**Location:**

- README :317–318 (changed): "The ownership table and the list above cite suppliers by section".
- README :299: "*UniversalCovers.* Fundamental-groupoid transport, covering classification, lifting and deck transformations".
- The contract at :921 likewise names no section.

**Claim:** every supplier in the list is cited by section.

**Witness:** `Completed/UniversalCovers/README.md` on main is divided into Stages 0–4 (:63, :89, :98, :126, :139). The bullet at :299, the contract at :921 and the *Needs:* mentions at :4630, :4673 and :4687 name no stage. It is the only supplier in the list without a locator.

**Repair:** write "*UniversalCovers, Stages 0–2.*" at :299 and "**UniversalCovers** Stages 0–2" at :921. These stages cover:

- **Stage 0, items 2–4:** the universal cover, the `π₁` action and `Deck p`.
- **Stage 1:** `Deck(proj) ≃* π₁`.
- **Stage 2, items 6–8:** the lifting criterion, the cover attached to a subgroup with its conjugacy under change of basepoint, and the Galois correspondence with its fundamental-groupoid monodromy lens.

Add the same stage range to the three *Needs:* mentions.

**Tested:** Stage 2 item 7 holds the "basepoint-change transport" of :923, and item 8 holds the classification with deck group `N(H)/H` and its local path-connectedness hypothesis, which is the domain stated at :921–922. Nothing the README consumes lies in Stage 3 (higher homotopy) or Stage 4.

## Previous findings

- R01 — not repaired. README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection". #1234 at `682823db` :731 still says "K4.P owns … It supplies this segment … to ComplexComparisonPartII C5.4". The description has no ownership paragraph.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `d8d530a` exited 0, and the worker's `gate.md` records the same result, including `build=0`.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line. This roadmap is at `ORDER.txt:39`.

  ```text
  depcheck: 238 roadmaps, 2348 edges, 0 problem(s)
  ```

  Of the newly contracted suppliers:
  - GeometricCurrents, Hyperfunctions and RealAlgebraicGeometry are on main (RealAlgebraicGeometry under `Completed/`).
  - DerivedDeRhamCohomology and CrystallineCohomology are earlier in the merge order. Neither cites ComplexComparisonPartII as a supplier: CrystallineCohomology names it only as a consumer (:130, :1271, :11534), and DerivedDeRhamCohomology does not mention it.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at :116, :127, :154 and :172.
- **Signatures.** I elaborated `#check @` for all four declarations in one scratch file (exit 0). The types are identical to the worker's signature file and to the previous review. No binder is lost:
  - `[FiniteDimensional ℂ E]` in `montelTheorem`;
  - `[CompleteSpace F]` and the rest of the Fréchet structure in `schwartzFiniteness`;
  - `IsManifold 𝓘(ℂ,E) ⊤ M` in `holomorphicPoincare`;
  - `LocallyContractibleSpace ↑T` in `nonempty_sheafSingularComparison`.

  Since the file is unchanged, the account of earlier reviews carries: 4 of the 67 headline targets are stated, the other 63 are named in the docstring with the carrier each lacks, and the one-tactic probes close none of the four.
- **Diff scope and hygiene.** The 40 changed lines contain no process word, pull-request number, LaTeX or copied passage. Outside the folder, `git diff --stat origin/main...HEAD` is empty.

### The changed passages against their suppliers

- **RealAlgebraicGeometry (:296–298).** On main (`Completed/RealAlgebraicGeometry/README.md`):
  - Layer 3 (:298) defines semialgebraic subsets of `ℝⁿ` by finite Boolean combinations of polynomial equations and strict inequalities.
  - Layer 6 (:437) builds CADs with projection closure and Tarski–Seidenberg.
  - Both are done according to STATUS.md.

  At the Tau Ceti pin the matching declarations are:
  - `TauCeti.IsSemialgebraic` (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75`);
  - `TauCeti.IsSemialgebraicOn` (`…/Semialgebraic/Function.lean:49`);
  - `TauCeti.IsCAD` (`…/CAD/Basic.lean:147`);
  - `TauCeti.exists_isCAD_signInvariant` (`…/CAD/Existence.lean:63`), with Tarski–Seidenberg at `…/CAD/Existence.lean:98`.

  C6.0 (:4502–4504, :4533) consumes exactly "cell and projection theory", and the contract at :923 agrees. #1187, the only open pull request that touches RealAlgebraicGeometry, keeps both layer headings (:299, :438).
- **GeometricCurrents (:766–771).** The first sentence matches G1 on main (:137–239):
  - test forms transported from K5a's `BundleTest(V_k* ⊗ D)`;
  - currents as continuous real-linear functionals;
  - `∂T(ω) = T(dω)` with `∂² = 0`;
  - support;
  - extended mass as the supremum over comass ≤ 1.

  The claim that rectifiability, integral currents and minimizers stay with the supplier matches G2–G5 (:240, :406, :521, :583). The second sentence is R02. `CurrentCalculus` (:3521–3545) is not a duplicate of G1: it uses the complex complementary-degree pairing, which needs the complex orientation, while G1 is real and orientation-free.
- **Hyperfunctions (:772–778).** HF3a's paragraph "Conic sheaves and geometric derived functors" (main :851–871) covers every item listed, on "locally compact Hausdorff finite-dimensional spaces" with complex modules:
  - open extension by zero and closed-inclusion direct image;
  - `f_!` derived through c-soft resolutions, with acyclicity and resolution independence;
  - the support localization triangle;
  - proper base change and the projection formula.

  C6.1 (:4603–4608) states the arbitrary-ring variant without finite-dimensionality, proves agreement on the common domain, and lists HF3a in its *Needs:* (:4635). This matches the contract and the scope bullet (:275–281, :124–128).
- **DerivedDeRhamCohomology (:836–841)**, at #868 (`2f774a9`):
  - Layer 2 §§2.1–2.19 are :3071–3383.
  - `DeRham.complex A B` is at :3252–3258, with `[CommRing A] [CommRing B] [Algebra A B]`, so there is no characteristic hypothesis.
  - `DeRham.d_squared` is at :3238, `DeRham.d_leibniz` at :3248, `DeRham.pullback` at :3288–3294 and `DeRham.complexMap` at :3365.

  This resolves the citation tool's lead for `DeRham.d_leibniz` (README :184), which searched only the pins. C5.1 (:2798, :2810), C5.2 (:3088) and the C5.2 *Needs:* line at :3369 consume exactly these.
- **CrystallineCohomology (:842–849)**, at #857 (`5231bad`):
  - CR.1.3 is at :1121, with the paragraph "Modules with integrable connection and their de Rham complexes" at :1248 (ring map `A → B`, Leibniz, integrability, de Rham complex, base change).
  - CR.1.3's ownership statement (:128–130) adds tensor and Hom.
  - :1267–1269 confirm that no integrability or quasi-nilpotence condition enters the carrier.
  - The log sections are at CR.5:log-algebra.1–.4 (:7608, :7832, :7962, :8058) and CR.5.1 (:8467). Their paragraphs "Prelog rings", "Étale log structures", "Fine monoids", "Saturated monoids", "Log charts", "Log fiber products", "Log smooth morphisms", "Kato chart criterion", "Divisorial log structures", "Logarithmic differentials" and "Log de Rham complexes" are at :7610–8508.
  - The consumer list (:11534–11535) names this roadmap for exactly CR.1.3, CR.5:log-algebra.1–.4 and CR.5.1.

  `logAnalytification` is C5.5's target (:3935, :3986).
- **"*Exact supplier contracts* states what is consumed from every supplier" (:318–319) and *References* (:5194).** I grepped every roadmap name on main, under `Completed/` and in `ORDER.txt` against the README and its contracts section (:487–927):
  - **27 suppliers are named, and all 27 have a contract entry.** They are AffineMorseLefschetz, AlgebraicCurves, AlgebraicModuliForArithmeticGeometry, AlgebraicTopology, AlgebraicVectorBundles, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds, CrystallineCohomology, DerivedDeRhamCohomology, DerivedModuleAlgebra, DifferentialGeometry, EnhancedDerivedSheaves, EtaleCohomologyFoundations, GeometricCurrents, HodgeStructures, Hyperfunctions, JacobianChallenge, ModularCurves, PDE, RealAlgebraicGeometry, RealAnalyticGeometry, ResolutionOfSingularitiesCharacteristicZero, SchemeAndStackFoundations, SmoothBundlesConnections, StableReduction and UniversalCovers.
  - **The 18 names without a contract are not suppliers.** They are consumers, exclusions or the worked-example carrier at :5044. Examples are FormalConnectionsOpers (:149–150), AdicSpacesPartII (:371), ModularCurvesPartII (:372) and DiamondsAndVStacks (:430).
  - The remark of the previous review, that the paragraph read as a complete list, is therefore settled. R02 and R03 concern the paragraph's two other claims.
- **Overlaps and ownership.** `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap.
  - I read ComplexKahlerGeometry at #1234 and #1398, and at #1807, #1808 and #1854 through `roadmaps show --pr`. None of them states G1's form specialization.
  - No open pull request changes GeometricCurrents or Hyperfunctions.
  - The citation tool's "cross-roadmap citations found nowhere" is "None". None of its 39 Lean-name leads comes from a changed line, except `DeRham.d_leibniz`, which is resolved above.

### Seeded sample

Five seeded targets fall in or next to the changed passages:

- `realComplexCurrentComparison` is touched by R02. Its Demailly locators (I (2.1)–(2.7), pp. 13–15; III (1.14)–(1.24), pp. 133–136) were verified in r14, r15 and r20, and the edit does not touch them.
- `complexAlgebraicTopology` (C6.0) is where the RealAlgebraicGeometry bullet applies. Its source locators are unchanged; Hironaka and Bochnak–Coste–Roy remain under *Not verifiable*.
- `topologicalCoefficientComparison` (C6.1) is where the Hyperfunctions contract applies. It is consistent, as shown above; Dimca remains under *Not verifiable*.
- `CurrentCalculus` and `IsDifferentialOperator` are untouched. C5.1's use of DerivedDeRhamCohomology Layer 2 is consistent.

The other seeded targets lie outside the changed lines, and their verification in r20 and r21 carries (`sga1` XII 3.1 and 5.1; `sga4` XVI 4.1 and XVII 5.3.5; `adicArtinComparison`).

### Adversarial table

New rows, computed this round for each changed statement:

| # | Statement (changed) | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| N19 | :296–298, RealAlgebraicGeometry Layers 3 and 6 | `{0 < x} ⊂ ℝ`; CAD of `ℝ` for `{X² − 1}`; the projection of the circle; C6.0's map `x ↦ x/√(1+x²)` | `{0 < x}` is semialgebraic via `p = X`. The CAD has 5 cells `(−∞,−1), {−1}, (−1,1), {1}, (1,∞)` with signs `+,0,−,0,+`. The projection of `x²+y²=1` is `[−1,1]`, the complement of `{0 < x²−1}`. The image `(−1,1)` of the map needs projection closure (Layer 3 excludes images), so Layer 6 is needed too | Holds; both layers are needed |
| N20 | :766–771, GeometricCurrents G1 | `N = ℝP²`, `q = 0`; `q = 2`; `δ_a` | `q = 0`: `V_0 = D`, so `V_0*⊗D ≅ ℝ` and the tests are functions; G1's `c_0` and C5.4's first Check give the same object. `q = 2`: `V_2*⊗D ≅ Λ²T*`. `∂∂T(ω) = T(ddω) = 0`. Mass of `δ_a` is `sup_{‖f‖≤1}|f(a)| = 1` | Contract true of G1; the C5.4 sentence duplicates G1 (R02) |
| N21 | :772–778, Hyperfunctions HF3a and the C6.1 variant | `ℝ → pt`; `Λ = 𝔽₃`; `[0,1]` with `U = (0,1)`, `Z = {0,1}`; Hilbert cube | `RΓ_c(ℝ,ℂ) = ℂ[−1]`, and `H¹_c(ℝ,𝔽₃) = 𝔽₃` for C6.1. The exact sequence `0 → Λ → Λ² → Λ → 0` has alternating ranks `1 − 2 + 1 = 0`. The Hilbert cube is compact, contractible and infinite-dimensional: outside HF3a, inside C6.1, with `H⁰ = Λ` | The variant's domain is strictly larger; on `ℂ`, finite dimension, they agree |
| N22 | :836–841, DerivedDeRhamCohomology §§2.1–2.19 | `ℤ → ℤ[x]`; pullback along `x ↦ y²`; `𝔽_p[x]` | `d(x²) = 2x dx`, and Leibniz gives `x dx + x dx`. `d² = 0` since `Ω² = 0`. `f*(dx) = 2y dy = d(f x)`. `d(x^p) = 0` over `𝔽_p`, and the carrier has no characteristic hypothesis | Holds |
| N23 | :842–849, CrystallineCohomology CR.1.3, CR.5 | `∇ = d + λ dx` on `ℂ[x]`; `∇ = d + x dy` on `ℂ[x,y]`; standard log point; `ℕ →×2 ℕ` | The first is integrable (`Ω² = 0`). The second has curvature `dx∧dy ≠ 0`, so it is not integrable. `ω¹_log(pt) = ℂ·dlog t` has rank 1, while ordinary `Ω¹ = 0`. The gp map `ℤ →×2 ℤ` has cokernel `ℤ/2`, and `2` is invertible in `ℂ`, so the map is log étale | Holds |
| N24 | :317–332, :5194 | grep of every roadmap name against :487–927 | 27 of 27 suppliers have a contract entry. "No supplier is re-planned" fails at G1 (R02). "Cite suppliers by section" fails at UniversalCovers :299 (R03) | R02, R03 |

Rows carried from `PRREVIEW-ComplexComparisonPartII~22.md` for statements this diff leaves untouched (values computed there or in the review it cites):

| Row | Statement | Key values |
| --- | --- | --- |
| N16 (r22) | ModularCurves §0B, `((ℤ/n)_S)ᴰ ≅ μ_n` | `Rⁿ` dual to `R[t]/(tⁿ−1)`; over `𝔽₂`, `ℤ/2` is étale and `μ₂` infinitesimal, both of rank 2 |
| N17 (r22) | contravariance and base change | `ℤ/2 → ℤ/4` dualizes to `μ₄ → μ₂`, `ζ ↦ ζ²` |
| N18 (r22) | algebraic-space extension in C3.2d.5 | the étale-chart descent datum is that of `μ_n`; `D(0) = 0` |
| N1–N2 (r21) | Tau Ceti IFT contracts | `2z + z²` has `f′(0) = 2`; `z²` excluded; `C^0` excluded by `1 ≤ n` |
| N3–N4 (r21) | Cartier contracts, C3.2d.5 | `R^{ℤ/n}` dual to `R[t]/(tⁿ−1)`; 4 names resolve |
| N5–N8 (r21) | C-1 Examples | `ℂ[ε]/(ε²)`: 1 point, 2 endomorphisms; node `m/m²` of dimension 2 |
| N9 (r21) | C1 Picard example | `h⁰(O(1)) = 2`, `h⁰(O(−1)) = 0` |
| N11–N13 (r21) | C6 Examples | `H¹(ℂ*, ℤ/n) = ℤ/n`; `H⁰_c(A¹) = 0`; `Tor_i(ℤ/2,ℤ/2) = ℤ/2` over `ℤ/4` |
| 1 (r20) | `montelTheorem` | on `ℓ²`, `‖f_n − f_m‖ = r` at `r e_n`, so `FiniteDimensional` is needed |
| 2 (r20) | `schwartzFiniteness` | `h = −id` on `ℓ²`: infinite codimension |
| 3 (r20) | `holomorphicPoincare` | on `ℂ²`, the `∂̄`-closed `(2,0)`-form `dz₁∧dz₂` has the `(1,0)` primitive `(z₁dz₂ − z₂dz₁)/2` |
| 4 (r20) | `nonempty_sheafSingularComparison` | Warsaw circle: sheaf `H¹ = ℤ`, singular `H¹ = 0` |
| 11 (r20) | `realComplexCurrentComparison` | `dJ₂[D] = −J₁[∂D]`; `dJ₁[a,b] = J₀(δ_b − δ_a)`; mass of `½δ_a` is `½` |
| 20 (r20) | C5.4 bijection | `δ[O(1)] = +1`; Enriques `δ[K]` is nonzero 2-torsion (ownership: R01) |
| 5–19, 23–29 (r20) | seeded and C1–C5 targets | as tabulated in r20 |

### Remarks on untouched text (no change requested in this round)

- Worked example 2 (:5044) calls an elliptic curve "the carrier of the Tau Ceti EllipticCurves roadmap", but no target consumes that roadmap. The phrase is illustrative and does not make EllipticCurves a supplier.

## Not verifiable

These are carried from r20–r22. No changed line cites a source.

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
