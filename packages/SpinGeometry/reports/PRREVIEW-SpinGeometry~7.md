# Review of SpinGeometry (pull request #1780 at 350d700)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/SpinGeometry/` at `350d700704ff4018cef6ac8a1eb1fa511c2b0557`. Since the head the previous review read (`9db41a5`) only `README.md` changed (+222/−31): `*Needs:*` lines on all 28 targets, `**Checks.**` blocks under G1.2, G1.3, G2.1 and G6.1, a pseudoscalar-square sentence in the scope paragraph, and the two Mathlib pull-request sentences deleted from the references. `Suggested.lean` and `SourcePauliTargets.lean` are byte-identical to `9db41a5` (`git diff 9db41a5..HEAD` on both is empty). No file outside the folder changes. The gate passes every check on my own run; the dependency check prints `depcheck: 205 roadmaps, 1677 edges, 0 problem(s)` with no UPWARD or CYCLE line. Six findings, one blocking: the roadmap-level supply cycle on main that every earlier round raised and this head leaves in place.

**Previous findings (review at 9db41a5), finding by finding.**

| Previous | Status at 350d700 | Where |
| --- | --- | --- |
| R01 (P1) reciprocal supplier edges with four roadmaps on main | not repaired: `README.md:14` (SpinRepresentations L0–L4, L7, L9), `:42` (RiemannianGeometry R1, R5, R7), `:56` (CharacteristicClasses C1, C3.5), `:67` (GeneralizedCohomology G5.5) and `:1131` ("GeneralizedCohomology G5.5 consumes Spin G1.3's trace") are unchanged, and the four reverse citations on main are unchanged | R01 below |
| R02 (P3) companion computes values, no docstrings, unidentifiable notes | not repaired: file unchanged (`SourcePauliTargets.lean:9–11` still "the quantum Riemannian notes' page2 … page5's unclear matrix subscript"; lines 26, 35, 39, 49, 89 still without docstrings) | R02 |
| R03 (P3) Mathlib pull-request numbers and conditional plan in References | repaired: `README.md:1145–1147` ends at "fix the native algebra/exterior vocabulary"; `prnum=0` | — |
| R04 (P3) only G1.1 has Checks and a `*Needs:*` line | partly repaired: 28 of 28 targets now carry `*Needs:*`; Checks blocks under G1.1, G1.2, G1.3, G2.1, G6.1 (five), covering every definition `Suggested.lean` declares; the prose definitions of G1.4, G2.2, G2.3, G3.1–G3.3, G4.2, G5.0, G5.3, G6.0 and G6.7 still have none, and the legacy heading shape is unchanged | R04 |

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the review at 9db41a5 (and of the reviews at 2d42cdf and of pull request #1674). No repair report marks it not actionable.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7 supplies curvature identities"), `:56` ("CharacteristicClasses C1,C3.5 owns mod2 cohomology, universal w₂"), `:67` ("GeneralizedCohomology G5.5 specifies the real Hilbert and finite-Clifford functional-calculus"), `:1131`.

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main, `TauCetiRoadmap/GeneralizedCohomology/README.md:42` lists "SpinGeometry G1.3 | `cliffordScalarTrace` and its ℂ-linear extension" in its supplier table and `:1908`, `:2595` consume it; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930, 1630` consume SpinGeometry G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` consume G1.2/G2.2/G3.4; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:41, 937, 1136` consume G1.1 and G4.1. Each pair is a two-way roadmap edge; `README.md:1131` states the GeneralizedCohomology one itself. The dependency check reports no cycle only because none of the five roadmaps is in the merge order, so "suppliers earlier, consumers later" has no solution for them.

**Repair:** unchanged from the earlier rounds, and not possible inside this diff alone: either split the shared early objects (G1.3's scalar trace and complexification, G1.1's negative-form comparison, G4.1a's frame and rank-zero adapters, G1.2/G2.2's finite exterior-module comparisons) into a foundations roadmap that both sides import, with the Dirac and index layers G5–G6 as its consumer; or repoint the four reverse citations on main to that owner. Every target keeps its mathematics. Until one side is cut, the folder has no single direction of supply. If the project decides that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, say so in a repair report with that reason and the board parks it for a human; this review cannot make that call.

## R02 (P3) — The companion file computes values, lacks docstrings and cites an unidentifiable source

**Location:** `TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean:9–11` ("the order recorded on the quantum Riemannian notes' page2 … its obscured quotient … page5's unclear matrix subscript"), `:26`, `:35`, `:39`, `:49`, `:89` (no docstrings). Unchanged since the previous review.

**Witness:** every theorem is a 2×2 matrix identity closed by `fin_cases`/`simp` (padding class "examples that compute values" and "declarations that mirror README Checks"): `source_cyclic_products` is `README.md:190–191`'s `S_jS_(j+1)=−iS_(j+2)`, `positive_generators` is `:182`'s `XZ=[[0,−1],[1,0]]`, `native_quaternion_dictionary` restates `Quaternion.toComplexMatrix_apply` (Tau Ceti `Algebra/Quaternion/ComplexMatrix.lean:166–169`). The README no longer mentions any notes, so "obscured quotient" and "unclear matrix subscript" point at nothing a reader can open.

**Repair:** delete the file; the G1.1 Checks carry every identity with its value. If a companion is kept, replace lines 8–12 by one sentence naming the matrices and docstring the five bare declarations.

## R03 (P3) — "The source" and "the course" are cited at four places without a reference

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:202` ("Translate the source's g+i g(·,J·)"), `:519` ("the general compact-group course construction"), `:741` ("This is the source's 'complex spinor module'"), `:768` ("The course's unqualified S⁺²=E must be translated").

**Witness:** the References list Lawson–Michelsohn, Nicolaescu, Atiyah–Bott–Shapiro and two Mathlib pages; no course or lecture notes. Nicolaescu's Hermitian convention (`nicolaescu line 29395–29400`) is written with a complex structure J but is not the form cited at line 202, and neither text writes S⁺² = E unqualified. A reader cannot check what is being translated.

**Repair:** at each of the four places either name the text and locator being translated (and add it to the References, recorded in the manifest), or drop the comparison clause and keep the roadmap's own convention, which is already pinned by the Checks (G5.3: S⁺ has weight z⁻¹, so `(S⁺)²≃E*`).

## R04 (P3) — Checks cover five subsections; the other definitions have none, and the shape is the legacy one

**Location:** `TauCetiRoadmap/SpinGeometry/README.md`: G1.4 (`:379–405`, ω_ℂ and the two labels), G2.2 (`:460–485`, c = ε − ι and Λ*V_ℂ ≃ End(S)), G2.3 (`:486–500`, the graded twist), G3.1–G3.3, G4.2 (`:631–658`, spin structure), G5.0 (`:697–730`, realCliffordSpinorBundle and the positive right action), G5.3 (`:758–772`), G6.0 (`:776–913`), G6.7 (`:1063–1115`, J±).

**Witness:** `grep -c '\*\*Checks\.\*\*'` is 5 (G1.1, G1.2, G1.3, G2.1, G6.1). The listed subsections define objects with API prose and no computed Check. The headings are `## G1.`–`## G6.` with no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `### Examples` or `### Dependencies`; the gate accepts this, so it is shape, not a rule failure.

**Repair:** three Checks per definition with computed values; the adversarial table below supplies them: for G1.4, n = 1 gives ω_ℂ = i e₁ with ω_ℂ² = i²·(−1) = 1 and ψ(ω_ℂ) = i e₀e₁ = −Γ_(e₁,e₀); n = 3 gives ψ(e₁e₂e₃) = −e₁e₂e₃e₀ and again ψ(ω_ℂ) = −Γ; for G5.3, ρ(z) = cos θ − i sin θ·Γ acts on S⁺ by e^(−iθ) and on S⁻ by e^(iθ); for G6.7, ω₋² = (−1)^(4·5/2) = 1 and Γ = i²ω₋ = −ω₋; for G2.2, Γe₁ = ie₂ = i^(1+0)∗e₁ and Γe₁₂ = −i = i³∗e₁₂ on the plane. Adopt the upstream heading shape when the file is next restructured.

## R05 (P3) — G6.1 and G6.6 need each other; G1.4 needs the later G2.1

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:975–976` (G6.1 `*Needs:*` ends "TopologicalKTheory T3's compact-support K-theory; G6.6's class") and `:1059–1061` (G6.6 `*Needs:*` "G6.1's symbol"); `:404–405` (G1.4 `*Needs:*` "for the comparison ψ(ω_ℂ)=−Γ_(V⊕ℝ), G2.1's definition of Γ").

**Witness:** G6.1 → G6.6 → G6.1 is a two-way `*Needs:*` edge introduced by this head. The sentence that creates it (`:964–967`, "it corresponds under ♯ to G6.6's respective untwisted or twisted class in K_c(TM)") is the only part of G6.1 that uses G6.6 or T3; the rest of G6.1 (domain, adjoint, symbol triple over T*M) needs neither. One `*Needs:*` line covers theorems with different needs. G1.4 → G2.1 is a forward edge with no return edge (G2.1 needs G1.2 and G1.3 only), so it is not a cycle, but the comparison ψ(ω_ℂ) = −Γ is stated before Γ is defined.

**Repair:** move the T*M/TM comparison sentence into G6.6, which already needs G6.1's symbol and T3, and drop "TopologicalKTheory T3's compact-support K-theory; G6.6's class" from G6.1's `*Needs:*`. For G1.4 either move the ψ(ω_ℂ) = −Γ comparison to the end of G2.1 or leave it and say in G1.4 that it is proved after G2.1.

## R06 (P3) — A second open pull request on this folder declares the same fully qualified names

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 119, 155` (`multiplicitySpace`, `IsGeometricAction`, `positiveSpinors`, …) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean:51, 100, 122` (same author, same folder).

**Witness:** `roadmaps grep --lean-only` lists both pull requests declaring `TauCetiRoadmap.SpinGeometry.multiplicitySpace`, `IsGeometricAction`, `positiveSpinors`, `negativeSpinors`, `chirality`, `isCompl_spinors`; #1674 additionally declares `cliffordScalarTrace_exists`, which this head does not. The README texts differ (G4.4a/G5/G6.0 there, G1.1/G1.3/G2.1/G6.1 here).

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Verified sound

**Scope of the check.** The whole README (1147 lines) and both Lean files read; the full diff against `9db41a5` (253 lines) read line by line, and the diff against `origin/main` restricted to files outside the folder is empty. Pins from `lake-manifest.json`: Tau Ceti `358314d4`, Mathlib `f6090c70`. Commands run from the worktree: the gate (`gate SpinGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0); the dependency check (`depcheck: 205 roadmaps, 1677 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; SpinGeometry and its four reciprocal partners are not in `ORDER.txt`, which is why R01 is invisible to it); `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` (exit 0; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197, nothing else); a scratch copy with every `sorry` replaced by `first | rfl | (simp [the eight definitions]; done) | infer_instance | sorry` (exit 0, the same nine sorry warnings: none of the admitted theorems closes with one tactic, so none is padding); `#check @` of nine declarations in the same scratch file, compared with the worker's `signatures.md` and the README: identical, and the "looks dropped" lead on `diracInFrame` is a false positive (`inst_7 : ∀ x, NormedAddCommGroup (W x)` and `inst_8 : ∀ x, InnerProductSpace ℂ (W x)` are in the elaborated type). No `set_option`, no admitted `example`, no sorry'd data, no computational algorithm, no copied passage, no local path, no pull-request number (the two in References are gone).

**Library names in the new `*Needs:*` lines, resolved at the pins** (file:line). Mathlib: `CliffordAlgebra.ι_sq_scalar` (`LinearAlgebra/CliffordAlgebra/Basic.lean:119`), `QuadraticMap.polar` (`QuadraticForm/Basic.lean:96`), `Module.Basis.ExteriorAlgebra : Basis (Finset I) R (ExteriorAlgebra R M)` (`ExteriorAlgebra/Basis.lean:30`, the finset-indexed wedge basis as `README.md:25` says), `CliffordAlgebra.changeForm_ι_mul_ι : changeForm h (ι m₁ * ι m₂) = ι m₁ * ι m₂ − algebraMap (B m₁ m₂)` (`Contraction.lean:283–284`) with `equivExterior = changeFormEquiv changeForm.associated_neg_proof` (`:351–352`, B = −Q.associated), so uv ↦ u∧v + b(u,v) as `README.md:374` says; `ExteriorAlgebra.algebraMapInv` (`ExteriorAlgebra/Basic.lean:151`), `CliffordAlgebra.equivBaseChange` (`BaseChange.lean:182`), `CliffordAlgebra.star_def/star_ι/star_smul` (`Star.lean`), `TensorProduct.star_tmul` (`Algebra/Star/TensorProduct.lean:32`), `ModuleCat.matrixEquivalence` and `moritaEquivalenceMatrix` (`RingTheory/Morita/Matrix.lean:18, 205`), `LinearMap.toMatrixAlgEquiv` (`Matrix/ToLin.lean:806`), `Matrix.Module.matrixModule` and `Matrix.Module.smul_apply` (`Matrix/Module.lean:16, 56`), `CliffordAlgebra.equivEven` and `EquivEven.Q'` (`EvenEquiv.lean:204`), `CliffordAlgebra.prodEquiv` (`Prod.lean:170`), `CliffordAlgebra.lift` (`Basic.lean:136`), `CovariantDerivative` (`Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:365`), `CFC.sqrt` (`SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean:231`), `fourierBasis` (`Analysis/Fourier/AddCircle.lean:411`), `Quaternion.ofComplex` (`Analysis/Quaternion.lean:138`), `Matrix.linftyOpNormedRing` (`Analysis/Matrix/Normed.lean`), `RiemannianBundle` and `IsContMDiffRiemannianBundle` (`Geometry/Manifold/Riemannian/Basic.lean:36–37`), `ContMDiffVectorBundle` (`VectorBundle/Basic.lean:305`), `equivOfIsometry` (`Basic.lean:379`), `evenOdd` (`Grading.lean:32`). Tau Ceti: `CliffordAlgebra.prod_map_ι_sq_scalar : (l.map ι).prod * (l.map ι).prod = algebraMap ((−1)^(l.length.choose 2) * (l.map Q).prod)` (`LinearAlgebra/CliffordAlgebra/VolumeElement.lean:260–262`, exactly `README.md:22–24`), `prod_map_ι_mem_center_of_odd_length` (`:225`), `prod_map_ι_mul_ι_of_even_length` (`:242`), `reverse_prod_map_ι_of_pairwise_isOrtho` (`:290`), `equivEvenProdOfOddLength` (`OddSplitting.lean:391`), `spinPlus`/`spinMinus` (`RepresentationTheory/Spin/HalfSpin/Basic.lean:117, 123`), `spinAction = CliffordAlgebra.lift Q ⟨P.cliffordOperator, …⟩` (`Polarization/CliffordAction.lean:230`), `SpinPolarizationData` (`Polarization/Basic.lean:82`), `SpinPolarizationData.cliffordEquivEnd` (`Spin/Structure.lean`), `realCliffordForm` (`RealForm/Basic.lean:112`), `realCliffordSignatureSwitchRecurrenceEquiv` (`BottPeriodicity.lean:499`), `realCliffordZeroTwoEquivQuaternion` (`RealForm/Basic.lean:617`), `Quaternion.toComplexMatrix` and `toComplexMatrix_apply` (`Algebra/Quaternion/ComplexMatrix.lean:158, 166–169`: i ↦ [[i,0],[0,−i]] = iZ, j ↦ [[0,1],[−1,0]] = iY, k ↦ [[0,i],[i,0]] = iX), `evenUnitaryGroup` and `range_spinGroup_toUnits` (`Spin/EvenUnitary.lean:55, 585`), `Matrix.linftyOpTopologicalSpace` (`Analysis/Matrix/Normed.lean:33`, Tau Ceti, as SBC `README.md:199` records), `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` (used at `Geometry/Lie/CliffordAlgebra/Spin/Projection.lean:85`), `Representation.IsQuaternionicStructure` (`RepresentationTheory/QuaternionicStructure.lean`). The only `scalarTrace` at the pin is the private matrix helper in `Algebra/Lie/GeneralLinear/Clifford.lean:57`; `multiplicitySpace`, `IsGeometricAction`, `chirality`, `diracInFrame` occur nowhere in Tau Ceti, so nothing in `Suggested.lean` duplicates a pinned declaration.

**Cross-roadmap citations resolved** (main unless marked): HopfRinow `### Layer 1` (`Completed/HopfRinow/README.md:264`); SmoothBundlesConnections B1.0–B1.5 (`:221–498`), B2.1–B2.5 (`:559–802`), B3.1 (`:871`), B5.0–B5.2 (`:1072–1209`), B6.0 (`:1306`); ComplexKahlerGeometry `## K1.` (`:96`), `## K4.` (`:444`), `## K5.` (`:568`), `**K5a.**` (`:570`); DifferentialGeometry Layers 0–9 (`:268–862`); CharacteristicClasses `## C1.` (`:211`), item C3.5 (`:901`, "Identify w₂ with the universal transition-lift cocycle"), zero-frame carrier (`:236`); AlgebraicTopology Stages 2–6 (`:326–946`); TopologicalKTheory T1–T7 (`:163–1148`), T6 item 4 (`:1021`, equivariant descent for free proper actions), `c(a)=2u²`, `c(b)=u⁴` (`:1263`); GeneralizedCohomology `## G5.` (`:1373`), G5.5-ABS/Classifiers/Transfer (`:1767, 1824, 1892`) and the eleven declarations SpinGeometry names (`realHilbertClosedFunctionalCalculus`, `realMixedCliffordCStarModelEquiv`, `realFiniteCliffordAdjointableComparison`, `…CompactComparison`, `…RegularOperatorComparison`, `…ContinuousFunctionalCalculus`, `…ClosedFunctionalCalculus`, `…HilbertModuleStabilization`, `realNegativeCliffordFamilyIndex`, `realMixedCliffordIndexClassification`, `realMixedCliffordBottTransport`), each present at least once; RiemannianGeometry `## R1.` (`:179`), `## R5.` (`:1042`), `## R7.` (`:1293`); SpinRepresentations Layers 0–9 (`:316–1010`); OrthogonalSpinGroups Layers 0–2 (`Completed/…/README.md:331, 408, 610`); PseudodifferentialOperators `### P1.0` and P4–P6 at the open head of #952 (`README.md:12, 151`; ORDER line 9, earlier than any position SpinGeometry could take); TangentialBordism B3.0 at #942 (`README.md:1700`, "Geometric ABS and real Dirac comparison (B3.0)", cited here only as downstream, and its own supplier table `:146` lists SpinGeometry G4, G5.0, G6.0, G6.7 in the same direction); IndexTheory at #1077 exists and is cited only as downstream. No cited section is missing, so no supplier drift beyond R01.

**Ownership.** `roadmaps grep` over the 440 open pull requests (index of 2026-11-03) and main: the six Lean objects are declared only in this folder's two open pull requests (R06); `cliffordScalarTrace` is consumed by TemperleyLiebOperatorAlgebras (#867, `README.md:319`) and GeneralizedCohomology on main. The board's package index lists no competing package.

**Source sample.** The brief names no target ids; the README's fifteen Nicolaescu locators (plus the two section locators) are the sample. All opened in `nicolaescu` (cache of the author's copy; printed page = PDF page − 12, checked at every row).

| Target (README line) | Locator | Passage | Finding |
| --- | --- | --- | --- |
| G1.2 (212) | Def. 12.1.10, p. 626 | `nicolaescu line 29261–29265`, PDF 638: uv + vu = −2q(u,v)·1 | matches the anticommutator with q = ⟨·,·⟩ |
| G1.3 (238) | Prop. 12.1.19, p. 630 | `line 29392–29397`, PDF 642: Cl(V) ≅ End_ℂ(S), not natural, V even-dimensional | matches ρ : Cl ≃ₐ End ℂ S |
| G1.3 (248) | Cor. 12.1.22 and Rem. 12.1.23, p. 632 | `line 29466–29472`, PDF 644: every Cl_{2k}-module is S ⊗ W, W = Hom_Cl(S,E) | matches `exists_multiplicityEvaluation`, nothing assumed on E |
| G1.3 (307) | §12.1.2, pp. 626–629 | `line 29249`, PDF 638 (heading) and `line 29358–29362`, PDF 641 (monomials form a basis) | supports the basis step; the normalized trace is not in the source and is computed below |
| G1.4 (387) | Lemma 12.1.29, p. 634 | `line 29553–29557`, PDF 646: Ψ(x⁰ + x¹) = x⁰ + e₀x¹ | matches lines 388–389 |
| G2.2 (465) | eq. (12.1.1), p. 633 | `line 29514`, PDF 645: Γω = i^{k+p(p−1)}∗ω | matches |
| G3.3 (540) | Def. 12.1.64 (a2), p. 653 | `line 30311–30312`, PDF 665: ∇_X(c(α)u) = c(∇^M_X α)u + c(α)∇_X u | matches (α a 1-form, musical to the README's vector) |
| G3.4 (554) | §12.2.1, p. 657 | `line 30485`, PDF 669 | heading as cited |
| G4.3 (668) | Prop. 12.2.25, p. 669 | `line 30950–30951`, PDF 681: spin structure iff w₂ = 0 | matches; the README's paracompact extension is C3.5's |
| G4.4 (679) | Rem. 12.2.28, p. 669; Ex. 12.2.35, p. 673 | `line 30957`, PDF 681; `line 31121–31126`, PDF 685: H¹(T³;ℤ₂) acts freely and transitively | matches |
| G6.1 (926) | Prop. 12.1.66, p. 655 | `line 30370–30374`, PDF 667: geometric Dirac operators are formally self-adjoint, normal coordinates | matches |
| G6.2 (997) | Thm. 12.1.67, p. 656 | `line 30418–30424`, PDF 668: D² = ∇*∇ + c(F), c(F) = Σ_{i<j} c(eⁱ)c(eʲ)F_ij | matches the Σ_{i<j} form |
| G6.0/G6.3 (842, 1009) | Thm. 12.2.33, p. 673 | `line 31100–31101`, PDF 685: D² = ∇*∇ + s/4 | matches |
| G6.4 (1021) | Prop. 12.2.1, p. 657 | `line 30497–30498`, PDF 669: (g,∇^g) is a Dirac structure, d + d* its operator | matches |
| G6.6 (1052) | §12.2.3, p. 672 | `line 31068–31069`, PDF 684: D̸ : C^∞(S⁺) → C^∞(S⁻) has symbol Clifford multiplication | matches |

**Adversarial table.** Pauli X = [[0,1],[1,0]], Y = [[0,−i],[i,0]], Z = diag(1,−1); A = iZ and B = iY are the negative-plane generators (A² = B² = −Id, AB + BA = 0); Γ = iAB. "Pass" means both sides agree on the instance.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Pseudoscalar squares (`README.md:21–24`) | n = 2 positive; n = 2 negative; n = 3 negative | (e₁e₂)² = −e₁²e₂² = −1 = (−1)^1; = −(−1)(−1) = −1 = (−1)^{2·3/2}; (e₁e₂e₃)² = (−1)^3·(−1)^3 = 1 = (−1)^{3·4/2} | Pass (matches `prod_map_ι_sq_scalar` with choose 2) |
| G1.1 Pauli products (164–166) | XY, YZ, ZX; [X,Y] | iZ, iX, iY; 2iZ | Pass |
| G1.1 positive plane (182–185) | XZ; (XZ)²; det of coordinates of (Id,X,Z,XZ) | [[0,−1],[1,0]] = −iY; −Id; rows (1,0,0,1),(0,1,1,0),(1,0,0,−1),(0,−1,1,0): Laplace on rows {1,3} × cols {1,4} gives (−1)·(−2)·2 = 4 | Pass |
| G1.1 negative plane (186–187) | i, j, k under `toComplexMatrix_apply` | iZ, iY, iX; (iZ)(iY) = −ZY = iX = image of k | Pass |
| G1.1 negative control (188–193) | XYZ, ZYX; ZY, YX, XZ; H = (X+Z)/√2 | i·Id, −i·Id; −iX, −iZ, −iY; H² = Id, HXH = Z, HZH = X, HYH = −Y | Pass |
| G1.2 h_J and h_ℂ (199–202) | v, w unit, g(v,Jw) | h_ℂ(v^(1,0), w^(1,0)) = ¼[2g(v,w) − 2i g(v,Jw)] = ½h_J(v,w); |v^(1,0)|² = ½ | Pass |
| G1.2 native action squares to −g (197) | (ε(a) − 2ι(b))², a = v^(1,0), b = v^(0,1) | −2g_ℂ(b,a) = −2·g(v,v)/2 = −g(v,v) = Q(v) | Pass |
| G1.2 Check 1 (222–225) | c(e) = i on ℂ; c(e) = 1; c(e) = Z | i² = −1 = Q(e), ⟨is,t⟩ = −i⟨s,t⟩ = −⟨s,it⟩; 1² = 1 ≠ −1 and 1† = 1; Z² = Id ≠ −Id | Pass (two negative controls) |
| G1.2 Check 2 (226–228) | (e₁,e₁); (e₁,e₂) | 2(iZ)² = −2Id; −(ZY+YZ) = 0; positive convention +2Id | Pass |
| G1.2 Check 3 (229–234) | w = (e₁ − ie₂)/2 | g_ℂ(w̄,w) = ¼(1+1) = ½; c(e₁)1 = √2w; c(e₁)²1 = −2·½ = −1; ⟨√2w,w⟩ = √2·½ = 1/√2 = −⟨1, −√2·½⟩; native: 1 ↦ w, w ↦ −1, ⟨w,w⟩ = ½ ≠ 1 | Pass |
| G1.3 Check 1 (357–360) | S = ℂ², E = S⊗ℂ³; E = S | dim Hom_{M₂}(ℂ², ℂ²⊗ℂ³) = 3, 2·3 = 6; Schur: ℂ·Id, 1 vs 4 | Pass |
| G1.3 Check 2 (361–366) | E = 0; V = 0, E = ℕ→₀ℂ; S = ℂ²⊕ℂ² diagonal, E = ℂ² | 0; Hom = E, 1⊗T ↦ T(1) bijective; dim Hom = 2, 4·2 = 8 ≠ 2 | Pass (shows ρ onto End(S) is needed) |
| `cliffordScalarTrace_mul_two_pow` (Lean 56; Check 367–369) | Cl(0,1), a = x + ye; V = 0 | L_a·1 = (x,y), L_a·e = (−y,x): [[x,−y],[y,x]], tr 2x = 2¹x; τ = Id, 2⁰a = a | Pass |
| same, degenerate Q (Check 370–373) | Q = 0 on ℝ | L_{x+ye} = [[x,0],[y,x]], tr 2x = 2τ; τ(e²) = 0 with e ≠ 0; Q(e) = −1: τ(e²) = −1 < 0 | Pass (PosDef needed for lines 63, 70) |
| `cliffordScalarTrace` is the degree-0 coefficient (Lean 48; Check 374–378) | e₁ ⊥ e₂ | uv ↦ u∧v − (−b(u,v)) = u∧v + b(u,v); τ(e₁e₂) = 0, τ(e₁e₁) = Q(e₁), τ(e₁(e₁+e₂)) = Q(e₁), τ(e₂e₁e₁e₂) = Q(e₁)Q(e₂) | Pass |
| `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 63, 70) | a = Σ a_I e_I, orthogonal basis, Q > 0 | reverse(e_I)e_I = Π Q(e_i) > 0, cross terms degree > 0; Σ a_I² Π Q(e_i) ≥ 0, = 0 iff all a_I = 0 | Pass |
| G1.3 null set of τ(a*a) for semidefinite b (323–324) | rad b spanned by basis vectors r, b(r,e_i) = 0 | re_i = −e_ir; ideal(rad) = span of monomials containing a radical generator = {a : a_I = 0 unless Π b = 0} | Pass |
| `exists_multiplicityEvaluation` (Lean 100) | S infinite-dimensional (why the hypothesis) | End(S)·e·End(S) is the finite-rank ideal, S not a generator, counit fails | hypothesis present and needed |
| G1.4 ω_ℂ² = 1 (381) | n = 2ℓ+1, negative form | (e₁⋯e_n)² = (−1)^{n(n+1)/2} = (−1)^{ℓ+1}; i^{2(ℓ+1)} = (−1)^{ℓ+1}; product 1 | Pass |
| G1.4 labels (384–385) | c(u) = λ·parity, Γ = parity on Fock | ω_ℂ = i^{ℓ+1}c(e₁)⋯c(e_{2ℓ})c(u) = iΓc(u) = iλ; λ = −i gives +1, λ = i gives −1; λ² = −1 = −|u|² | Pass |
| G1.4 ψ(ω_ℂ) = −Γ_{V⊕ℝ} (393) | n = 1; n = 3 | ψ(ie₁) = ie₀e₁, Γ_{(e₁,e₀)} = ie₁e₀ = −ie₀e₁; ψ(e₁e₂e₃) = e₀e₁e₀e₂e₀e₃ = −e₁e₂e₃e₀, ω_ℂ = −e₁e₂e₃, Γ = i²e₁e₂e₃e₀ | Pass both |
| `chirality` ℓ = 0 (Lean 136; Check 442–444) | empty frame | i⁰·1 = Id; S⁺ = S, S⁻ = 0 | Pass |
| G2.1 Check 2 (445–449) | ℓ = 1, c(e₁) = iZ, c(e₂) = iY | (iZ)(iY) = −ZY = iX; Γ = i·iX = −X; X² = Id; ker(−X−Id) = ℂ(1,−1), ker(−X+Id) = ℂ(1,1); iZ(1,−1) = i(1,1); (iX)² = −Id; swapped frame −Γ | Pass |
| G2.1 Check 3 rotation (450–452) | e₁' = cos e₁ + sin e₂, e₂' = −sin e₁ + cos e₂ | (cos²+sin²)c₁c₂ + cos sin(c₂² − c₁²) = c₁c₂ since c_j² = −Id | Pass |
| G2.1 Check 4 Fock witness (453–456) | e₂ = Je₁ | e₂^(1,0) = iw, e₂^(0,1) = −iw̄, c(e₂) = i√2(ε(w)+ι(w̄)); c(e₂)c(e₁)1 = 2i·½ = i; c(e₁)c(e₂)1 = −i; Γ1 = i(−i) = 1 | Pass |
| G2.1 Check 5 negative control (457–459) | Q = 0, c(e_j) = 0, S ≠ 0 | lift exists (0² = 0 = Q); Γ = 0; ker(−Id) = ker(Id) = 0, not complementary; Q(v) = 0 ≠ −⟨v,v⟩ | Pass |
| `chirality_sq`, `chirality_anticommutes` (Lean 142, 148) | general ℓ; ℓ = 1, v = e₁ | (c₁⋯c_{2ℓ})² = (−1)^{ℓ(2ℓ−1)}(−1)^{2ℓ} = (−1)^ℓ, times i^{2ℓ} gives 1; ΓA = −XiZ = −iXZ, AΓ = −iZX = iXZ | Pass |
| `isCompl_spinors` (Lean 163) | Γ² = 1, 2 invertible | projections (1±Γ)/2 sum to 1, product 0 | Pass |
| G2.2 Γω = i^{ℓ+p(p−1)}∗ω (465) | n = 2, c = ε − ι, p = 0,1,2 | Γ1 = ie₁₂, Γe₁ = ie₂, Γe₁₂ = −i; phases i, i, −i = i^1, i^1, i^3 | Pass |
| G5.3 weights (759–765) | z = cos θ + sin θ e₁e₂, (e₁e₂)² = −1 | ze₁z⁻¹ = cos 2θ e₁ + sin 2θ e₂; ρ(z) = cos θ − i sin θ Γ: e^{−iθ} on S⁺, e^{iθ} on S⁻; (S⁺)² = E*, (S⁻)² = E | Pass |
| G6.1 Check 1 flat ℝ² (979–983) | c(∂₁) = iZ, c(∂₂) = iY | D² = −∂₁² − ∂₂² − (ZY+YZ)∂₁∂₂ = −Δ; positive convention +Δ | Pass |
| `diracInFrame_eq` (Lean 197; Check 984–990) | rotated frame; (2e₁,e₂); n = 0; n ≠ dim | cross terms cos sin(c₁∇₂ + c₂∇₁ − c₁∇₂ − c₂∇₁) = 0; 4c₁∇₁ + c₂∇₂; empty sum 0; no basis, vacuous | Pass |
| G6.1 Check 3 circle (991–996) | c(∂_θ) = i | i·d/dθ e^{ikθ} = −k e^{ikθ}; kernel dim 1 (k ∈ ℤ), 0 (k ∈ ℤ+½); c = 1 gives d/dθ, skew | Pass |
| G6.2 curvature term (997) | Nicolaescu c(F) | Σ_{i<j} c(eⁱ)c(eʲ)F_ij = ½Σ_{i,j} | Pass |
| G6.3 Lichnerowicz (1009) | round S², Scal = 2 | R^S₁₂ = −AB/2, contraction Id/2 = Scal/4 | Pass |
| G6.7 raw volume (1097–1101) | n = 4 | ω₋² = (−1)^{4·5/2}·(−1)^4 = 1; Γ = i²ω₋ = −ω₋ | Pass |
| `even_finrank_of_conjLinear_square_neg` (Lean 213, proved) | V = ℂ², J(z₁,z₂) = (−z̄₂, z̄₁); V = ℂ | J² = −Id, dim 2; dim 1 needs a·ā = −1, impossible | Pass (elaborates) |
| Companion `source_cyclic_products` wrap (`SourcePauliTargets.lean:44`) | i = 2 | i+1 = 0, i+2 = 1 in Fin 3: XZ = −iY | Pass |

**Headline theorems.** Statable and stated: the normalized scalar trace with its positivity and faithfulness (G1.3), the Morita evaluation (G1.3), the negative-metric Clifford relation (G1.2), chirality square, anticommutation and splitting (G2.1), frame independence of the Dirac contraction (G6.1), the quaternionic parity (G6.7, proved). Not statable and named in the module docstring with the missing carrier (`Suggested.lean:15–28`): Lichnerowicz and Bochner (no Clifford-module bundle with connection), the closed H¹ realization (no bundle Sobolev spaces), spin existence and the H¹ torsor (no principal Spin bundle, no Čech w₂), the KO index class (no real Clifford classifier), ind D⁺ = 2α (no spinor bundle); these claims were confirmed at the pins by the previous review and the pins are unchanged. No statable headline is absent; nothing is forced through a stand-in; no admitted theorem is one-tactic padding.

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry*, Theorems II.1.7, II.8.2, II.8.8 (G4.3, G4.4, G6.2, G6.3): paywalled, recorded `uncertified` in the manifest; cited by locator only, checked against Nicolaescu and by computation above instead.
- Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, `uncertified`; the graded-product rank facts are in the table.
- The worker's 15-target sample: no target list or seed was supplied; the fifteen Nicolaescu locators above are this review's own sample.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

## Source issues

- none (no new misprint found in `nicolaescu` at the seventeen passages opened; `Theorem 12.1.67 (Bochner-Weitzenböck))` at `line 30422` has a doubled closing parenthesis, a typesetting slip with no mathematical content).
