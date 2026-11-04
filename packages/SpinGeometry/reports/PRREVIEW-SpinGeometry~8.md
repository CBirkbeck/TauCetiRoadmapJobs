# Review of SpinGeometry (pull request #1780 at 862d263)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/SpinGeometry/` at `862d263a58b68a59c50e5e88a2ddcd23b45995ed`. Since the head the previous review read (`350d700`) only `README.md` changed (+278/−27): fourteen new `**Checks.**` blocks (G1.4, G2.2, G2.3, G3.1–G3.3, G4.1a, G4.2, G4.4, G5.0, G5.1, G5.3, G6.0, G6.7), the four unsourced "the source"/"the course" clauses replaced by Nicolaescu locators or dropped, the ψ(ω_ℂ) = −Γ comparison moved from G1.4 to G2.1, and the `T*M`/`K_c(TM)` comparison moved from G6.1 to G6.6 with both `*Needs:*` lines trimmed accordingly. `Suggested.lean` and `SourcePauliTargets.lean` are byte-identical to `350d700` (`git diff 350d700..HEAD` on both is empty), and `lake-manifest.json` is unchanged (Tau Ceti `358314d4`, Mathlib `f6090c70`). No file outside the folder changes. The gate passes every check on my own run; the dependency check prints `depcheck: 205 roadmaps, 1679 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. Every new Check was recomputed and found correct except one phrase (R03). Five findings, one blocking: the inherited roadmap-level supply cycle on main, re-raised for the reason given under R01; since it is the only blocking finding and cannot be repaired inside this folder, the board's parking rule applies and a human ruling is the next step, not another repair round.

**Previous findings (review at 350d700), finding by finding.**

| Previous | Status at 862d263 | Where |
| --- | --- | --- |
| R01 (P1) reciprocal supplier edges with four roadmaps on main | not repaired: `README.md:14` (SpinRepresentations L0–L4, L7, L9), `:42` (RiemannianGeometry R1, R5, R7), `:56` (CharacteristicClasses C1, C3.5), `:67` (GeneralizedCohomology G5.5), `:1382` ("GeneralizedCohomology G5.5 consumes Spin G1.3's trace") unchanged; the reverse citations on main at `929496d` unchanged (listed under R01) | R01 below |
| R02 (P3) companion file computes values, no docstrings, unidentifiable notes | not repaired: `SourcePauliTargets.lean` unchanged (`:9–11` still "the quantum Riemannian notes' page2 … page5's unclear matrix subscript"; `:26, :35, :39, :49, :89` still without docstrings) | R02 |
| R03 (P3) "the source" and "the course" cited without a reference | repaired: `README.md:202–204` cites Nicolaescu's h(u,v) = g(u,v) + i g(u,Jv) in the proof of Proposition 12.1.19, p. 630 (`nicolaescu line 29406`, PDF 642); `:587` now "the general compact-group construction"; `:924–925` cites Proposition 12.1.30, p. 635 (`line 29562–29565`, PDF 647: S(V) = S⁺(V) ⊕ S⁻(V), "the (odd) spinor module"); `:966–967` drops the course and states the reversed-orientation reading | — |
| R04 (P3) Checks on five subsections only; legacy shape | largely repaired: 19 `**Checks.**` blocks (was 5), covering every subsection that defines an object except G3.4 (`:671–679`), G4.1b (`:727–762`) and G6.6 (`:1282–1295`); the heading shape is unchanged | R04 |
| R05 (P3) G6.1 ↔ G6.6 two-way `*Needs:*`; G1.4 → G2.1 forward edge | repaired: the `K_c(T*M)`/`K_c(TM)` sentence is now in G6.6 (`:1288–1291`) and G6.1's `*Needs:*` (`:1202–1207`) no longer names T3 or G6.6; the ψ(ω_ℂ) = −Γ comparison is now in G2.1 (`:453–458`) with "G1.4's ω_ℂ, its labels and ψ" in G2.1's `*Needs:*` (`:459–460`), and G1.4's `*Needs:*` (`:397–403`) no longer names G2.1 | — |
| R06 (P3) pull request #1674 declares the same fully qualified names | not repaired (outside this diff): #1674 is still open at `60cedda` with the same four `def`s | R05 |

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the review at 350d700 (and of every earlier review of #1780 and #1674). The repair rounds answered it as not repairable inside the two editable files. That reason is true as a fact and is not disputed; it does not remove the defect, because the principle is that every roadmap has a single direction of supply and this folder, as revised here, still names as suppliers four roadmaps whose README on main names SpinGeometry as a supplier.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7 supplies curvature identities"), `:56` ("CharacteristicClasses C1,C3.5 owns mod2 cohomology, universal w₂"), `:67` ("GeneralizedCohomology G5.5 specifies the real Hilbert and finite-Clifford functional-calculus"), `:1382`.

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main at `929496d`, `TauCetiRoadmap/GeneralizedCohomology/README.md:42` lists "SpinGeometry G1.3 | `cliffordScalarTrace` and its ℂ-linear extension τ_ℂ" in its supplier table and `:1908` consumes it; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930, 1630` consume SpinGeometry G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` consume G1.2/G2.2/G3.4; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:41, 937, 1136` consume G1.1 and G4.1. Each pair is a two-way roadmap edge; `README.md:1382` states the GeneralizedCohomology one itself. The dependency check reports no cycle only because none of the five roadmaps is in `ORDER.txt`, so "suppliers earlier, consumers later" has no solution for them.

**Repair:** unchanged from the earlier rounds and not possible inside this diff alone: either split the shared early objects (G1.3's scalar trace and complexification, G1.1's negative-form comparison, G4.1a's frame and rank-zero adapters, G1.2/G2.2's finite exterior-module comparisons) into a foundations roadmap that both sides import, with the Dirac and index layers G5–G6 as its consumer; or repoint the four reverse citations on main to that owner. Every target keeps its mathematics. This is the only blocking finding of this review, so by the board's rule the folder is parked for a human: if the project rules that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, the remaining findings are all P3 and the folder is ready for final approval on that ruling.

## R02 (P3) — The companion file computes values, lacks docstrings and cites an unidentifiable source

Re-raised: R02 of the review at 350d700, unchanged since `9db41a5`.

**Location:** `TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean:9–11` ("the order recorded on the quantum Riemannian notes' page2 … its obscured quotient … page5's unclear matrix subscript"), `:26`, `:35`, `:39`, `:49`, `:89` (no docstrings).

**Witness:** every theorem is a 2×2 matrix identity closed by `fin_cases`/`simp` (padding class "examples that compute values" and "declarations that mirror README Checks"): `source_cyclic_products` (`:44`) is `README.md:190–191`'s S_jS_(j+1) = −iS_(j+2); `positive_generators` (`:95`) is `:182`'s XZ = [[0,−1],[1,0]]; `native_quaternion_dictionary` (`:30`) restates `Quaternion.toComplexMatrix_apply` (Tau Ceti `Algebra/Quaternion/ComplexMatrix.lean:166–169`). The README names no notes, so "obscured quotient" and "unclear matrix subscript" point at nothing a reader can open.

**Repair:** delete the file; the G1.1 Checks (`README.md:181–193`) carry every identity with its value. If a companion is kept, replace lines 8–12 by one sentence naming the matrices and add a docstring to the five bare declarations.

## R03 (P3) — A G4.2 Check misstates the self-adjoint square roots of the identity

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:804–805` ("B=Id has the self-adjoint roots ±Id of which only +Id is positive").

**Claim:** the self-adjoint square roots of Id are ±Id.

**Witness:** H = diag(1,−1) on ℝ² is g-self-adjoint with H² = Id and H ≠ ±Id; every reflection in a line is another. The conclusion the Check wants (only +Id is positive) is true, and the uniqueness in the target (`:776–777`, "the unique positive g-self-adjoint B … its positive square root") is correctly stated; only the classification in the Check is wrong, so a reader using it as the negative control would learn a false fact.

**Repair:** "B=Id has the self-adjoint square roots ±Id and every reflection diag(1,−1) in an orthonormal basis, of which only +Id is positive".

## R04 (P3) — Three constructions still have no Checks; the shape is the legacy one

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:671–679` (G3.4, the induced Levi-Civita connection and c = ε − ι on forms), `:727–762` (G4.1b, the smooth cover refinement and Lie differential), `:1282–1295` (G6.6, the symbol triple on TM and its class).

**Witness:** `grep -c '\*\*Checks\.\*\*'` is 19; the subsection map (G1.1–G1.4, G2.1–G2.3, G3.1–G3.3, G4.1a, G4.2, G4.4, G5.0, G5.1, G5.3, G6.0, G6.1, G6.7) leaves these three constructions and the pure theorems G4.3, G5.2, G6.2–G6.5 without one. The headings are still `## G1.`–`## G6.` with no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `### Examples` or `### Dependencies`; the gate accepts this, so it is shape, not a rule failure.

**Repair:** three Checks per construction with computed values, for instance: G3.4 on flat ℝ² with c = ε − ι: on a function f, Σ c(e_j)∂_j f = ∂₁f e₁ + ∂₂f e₂ = df; on f e₁, c(e₁)∂₁(f e₁) = −∂₁f and c(e₂)∂₂(f e₁) = −∂₂f e₁∧e₂, which is d*(f e₁) + d(f e₁) with d* = −div, so D = d + d*; the choice ε + ι would give d − d*, not symmetric. G4.1b: the differential of z = cos θ + sin θ e₁e₂ ↦ rotation by 2θ at θ = 0 sends e₁e₂ to twice the rotation generator, a bijection so(2) ≃ spin(2); at n = 1 both Lie algebras are 0 and the cover is the discrete {±1} → {1}. G6.6: on the flat plane with c(v) = v₁ iZ + v₂ iY, the restriction S⁺ = ℂ(1,−1) → S⁻ = ℂ(1,1) is v ↦ (−v₂ + i v₁)·(1,1)-coefficient, invertible for v ≠ 0 since c(v)² = −|v|², with winding number 1 on the unit circle, the Bott generator of K_c(ℝ²) ≅ ℤ; for n = 0 the triple is (S, 0, 0) over a point and the class is rank S.

## R05 (P3) — A second open pull request on this folder declares the same fully qualified names

Re-raised: R06 of the review at 350d700.

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 119, 136, 155` (`multiplicitySpace`, `IsGeometricAction`, `chirality`, `positiveSpinors`) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean:51, 100, 106, 122` at `60cedda` (same author, same folder).

**Witness:** `roadmaps grep --lean-only` lists both open pull requests, and main, declaring `TauCetiRoadmap.SpinGeometry.multiplicitySpace`, `IsGeometricAction`, `chirality`, `positiveSpinors` (index of 2026-11-04). Two open pull requests each build the same objects in the same folder.

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Verified sound

**Scope of the check.** The whole README (1398 lines) and both Lean files read; the 305-line diff against `350d700` read line by line, every new Check recomputed (table below); the diff against `origin/main` restricted to files outside the folder is empty. Commands run from the worktree: the gate (`gate SpinGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run additionally reports `build=0`); the dependency check (`depcheck: 205 roadmaps, 1679 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; SpinGeometry and its four reciprocal partners are not in `ORDER.txt`, which is why R01 is invisible to it); `lake env lean` on a scratch copy of `Suggested.lean` with every `sorry` replaced by `first | rfl | (simp [the eight definitions]; done) | infer_instance | sorry` and `#check @name` for all 18 declarations appended (exit 0; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197, so no admitted theorem closes with one tactic and none is padding). The 18 elaborated types agree with the worker's `signatures.md` and with the README statements; the "looks dropped" lead on `diracInFrame` is a false positive (`inst_7 : ∀ x, NormedAddCommGroup (W x)` and `inst_8 : ∀ x, InnerProductSpace ℂ (W x)` are in the elaborated type). No `set_option`, no admitted `example`, no sorry'd data, no computational algorithm, no copied passage, no local path, no pull-request number, no process word in the new text.

**Library declarations.** The pins are the ones the previous review opened (`lake-manifest.json` unchanged since `350d700`), and the new text adds no backticked library name, so its resolution of every `*Needs:*` name (Mathlib `CliffordAlgebra.ι_sq_scalar`, `equivExterior`, `changeForm_ι_mul_ι`, `ExteriorAlgebra.algebraMapInv`, `Module.Basis.ExteriorAlgebra`, `equivBaseChange`, `star_ι`, `TensorProduct.star_tmul`, `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix`, `LinearMap.toMatrixAlgEquiv`, `Matrix.Module.matrixModule`, `equivEven`, `EquivEven.Q'`, `prodEquiv`, `lift`, `CovariantDerivative`, `CFC.sqrt`, `fourierBasis`, `Quaternion.ofComplex`, `RiemannianBundle`, `ContMDiffVectorBundle`, `equivOfIsometry`, `evenOdd`; Tau Ceti `prod_map_ι_sq_scalar`, `prod_map_ι_mem_center_of_odd_length`, `prod_map_ι_mul_ι_of_even_length`, `reverse_prod_map_ι_of_pairwise_isOrtho`, `equivEvenProdOfOddLength`, `spinPlus`/`spinMinus`, `spinAction`, `SpinPolarizationData`, `cliffordEquivEnd`, `realCliffordForm`, `realCliffordSignatureSwitchRecurrenceEquiv`, `realCliffordZeroTwoEquivQuaternion`, `Quaternion.toComplexMatrix`, `evenUnitaryGroup`, `range_spinGroup_toUnits`, the Spin covering/Lie declarations, `Representation.IsQuaternionicStructure`) stands. Re-opened this round for the new rank-zero and rank-one Checks: Mathlib `lipschitzGroup Q = Subgroup.closure ((↑) ⁻¹' Set.range (ι Q))` (`LinearAlgebra/CliffordAlgebra/SpinGroup.lean:61–62`) and `spinGroup Q = pinGroup Q ⊓ even Q` (`:292–293`), so for V = 0 the closure is of the empty set and Spin(0) = {1} as `README.md:718–721` says; Tau Ceti `evenUnitaryGroup : Subgroup (CliffordAlgebra Q)ˣ` (`LinearAlgebra/CliffordAlgebra/Spin/EvenUnitary.lean:55`), whose elements in Cl(0,0) = ℝ are the u with u² = 1, so μ₂ = {±1}; Tau Ceti `Quaternion.toComplexMatrix_apply` (`Algebra/Quaternion/ComplexMatrix.lean:166–169`) for R02. `multiplicitySpace`, `IsGeometricAction`, `chirality`, `diracInFrame` occur nowhere in Tau Ceti at the pin, so nothing in `Suggested.lean` duplicates a pinned declaration.

**Cross-roadmap citations.** The worker's `citations.md` lists none unresolved; the new text cites only this roadmap's own sections (G1.4 ↔ G2.1, G6.1 ↔ G6.6, G5.3, G2.1) and Nicolaescu. The external citations are unchanged from the previous review, which resolved every one on main or at its open head (HopfRinow L1, SmoothBundlesConnections B1–B6.0, ComplexKahlerGeometry K1/K4/K5/K5a, DifferentialGeometry L0–L9, CharacteristicClasses C1/C3.5, AlgebraicTopology Stages 2–6, TopologicalKTheory T1–T7, GeneralizedCohomology G5.5 and its eleven named declarations, RiemannianGeometry R1/R5/R7, SpinRepresentations L0–L9, OrthogonalSpinGroups L0–L2, PseudodifferentialOperators P1.0/P4–P6 at #952, TangentialBordism B3.0 at #942 and IndexTheory I7.5 at #1077 as downstream). Re-checked this round on main at `929496d`: the five reverse citations under R01. Ownership: `roadmaps grep` over the 440 open pull requests (index of 2026-11-04) and main finds the four Lean objects only in this folder's two open pull requests and on main (R05); the board's package index lists no competing package.

**Source sample.** The brief names no target ids; the sample is the four locators this head adds plus thirteen of the README's existing Nicolaescu locators, all opened in `nicolaescu` (cache of the author's copy; printed page = PDF page − 12, checked at every row).

| Target (README line) | Locator | Passage | Finding |
| --- | --- | --- | --- |
| G1.2 (202–204), new | proof of Prop. 12.1.19, p. 630 | `nicolaescu line 29406`, PDF 642: h(u,v) = g(u,v) + i g(u,Jv) | matches; h(Ju,v) = g(Ju,v) + i g(u,v) = i·h(u,v), so linear in the first slot, and conj h_J(u,v) = g(u,v) + i g(u,Jv) = h(u,v), as stated |
| G5.1 (924–925), new | Prop. 12.1.30, p. 635 | `line 29562–29565`, PDF 647: two irreducible modules S⁺(V), S⁻(V) in odd dimension, S(V) = S⁺ ⊕ S⁻ "the (odd) spinor module" | matches |
| G4.2 Check (793–795), new | Exercise 12.2.30, p. 670 | `line 30984`, PDF 682: "the only two spin structures on S¹" | supports the count |
| G2.3 Check (567–568), new | p. 633 | `line 29498–29499`, PDF 645: the chirally graded modules are the subfamily with purely even twisting s-space | matches |
| G1.2 (213) | Def. 12.1.10, p. 626 | `line 29261`, PDF 638 | as before |
| G1.3 (248) | Cor. 12.1.22, p. 632 | `line 29466–29469`, PDF 644 | as before |
| G1.4 (388) | Lemma 12.1.29, p. 634 | `line 29553`, PDF 646: Cl_m ≅ Cl^even_(m+1) | matches |
| G2.2 (492) | eq. (12.1.1), p. 633 | `line 29514`, PDF 645: Γ·ω = i^(k+p(p−1))∗ω | matches |
| G3.3 (642) | Def. 12.1.64 (a2), p. 653 | `line 30304, 30311`, PDF 665 | matches |
| G3.4 (673) | §12.2.1, p. 657 | `line 30485`, PDF 669 | heading as cited |
| G4.3 (816) | Prop. 12.2.25, p. 669 | `line 30950`, PDF 681 | matches |
| G4.4 (827) | Rem. 12.2.28, p. 669 | `line 30957`, PDF 681 | matches |
| G4.4 (828) | Ex. 12.2.35, p. 673 | `line 31121`, PDF 685 | matches |
| G6.1 (1161) | Prop. 12.1.66, p. 655 | `line 30370`, PDF 667 | matches |
| G6.2 (1229) | Thm. 12.1.67, p. 656 | `line 30422`, PDF 668 | matches |
| G6.0/G6.3 (1054, 1240) | Thm. 12.2.33, p. 673 | `line 31100`, PDF 685 | matches |
| G6.4 (1252) | Prop. 12.2.1, p. 657 | `line 30497`, PDF 669 | matches |
| G6.6 (1284) | §12.2.3, p. 672 | `line 31068`, PDF 684 | matches |

**Adversarial table.** Pauli X = [[0,1],[1,0]], Y = [[0,−i],[i,0]], Z = diag(1,−1); the negative plane has c(e₁) = iZ, c(e₂) = iY, so c(e₁)c(e₂) = −ZY = iX and Γ = i·iX = −X; e_j² = −1 throughout. "Pass" means both sides agree on the instance. Rows marked "new" are this head's Checks; the others are the headline theorems and the targets the findings touch, recomputed.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| G1.4 Check 1 (406–410), new | n = 1, ω_ℂ = i e₁ | ω_ℂ² = i²e₁² = (−1)(−1) = 1; c(e₁) = λ, λ = −i gives iλ = 1 (+), λ = i gives −1; ((1+e₁)/2)² = (1 + 2e₁ − 1)/4 = e₁/2, not idempotent | Pass |
| G1.4 Check 2 (411–416), new | n = 3, c = (iZ, iY, iX) | ω acts by i³ZYX; ZY = −iX so ZYX = −i·Id; (−i)(−i) = −1, ω = −Id, ω_ℂ = −ω = +Id; Γ = i(iZ)(iY) = −X; iX = λ(−X) gives λ = −i, and iλ = 1 (+); −iX gives ω = +Id, − factor; e₁ω = e₁e₁e₂e₃ = −e₂e₃ = e₁e₂e₃e₁ | Pass |
| G1.4 Check 3 (417–421), new | E = ℂ²⊕ℂ²⊕ℂ², factors (+,+,−) | multiplicities 2 and 1; an invertible γ with γc(v)γ⁻¹ = −c(v) sends ω to −ω, so it maps the ω = +1 isotypic part (dim 4) onto the ω = −1 part (dim 2), impossible | Pass |
| G1.4 Check 4 (422–426), new | ψ(e_j) = e₀e_j, e₀² = −1 | ψ(e₁)² = e₀e₁e₀e₁ = −e₀²e₁² = −1; ψ(e₁e₂) = e₀e₁e₀e₂ = −e₀²e₁e₂ = e₁e₂; ψ(e₁e₂e₃) = e₁e₂e₀e₃ = −e₁e₂e₃e₀; e_j ↦ e_je₀: e₁(e₀e₂e₀)e₃e₀ = e₁e₂e₃e₀ | Pass |
| G2.1 ψ(ω_ℂ) = −Γ_(V⊕ℝ) (453–458) | n = 2ℓ+1 general; n = 3 | pairs (e₀e_(2j−1))(e₀e_(2j)) = e_(2j−1)e_(2j), last factor e₀e_n, so ψ(e₁⋯e_n) = −e₁⋯e_ne₀; ω_ℂ = i^(ℓ+1)e₁⋯e_n maps to −i^(ℓ+1)e₁⋯e_ne₀ = −Γ; n = 3: ψ(−e₁e₂e₃) = e₁e₂e₃e₀, Γ = i²e₁e₂e₃e₀ | Pass (ω_ℂ = +1 ⟺ Γ = −1 ⟺ S⁻, as the text says) |
| G1.4 label rule (385–386) | general ℓ, c(u) = λΓ | c(e₁)⋯c(e_(2ℓ)) = (−i)^ℓΓ, so ω_ℂ acts by i^(ℓ+1)(−i)^ℓΓ·λΓ = iλ | Pass |
| G2.2 Check 1 (515–519), new | plane, c = ε − ι, ∗ by α∧∗β = ⟨α,β⟩vol | ∗1 = e₁∧e₂, ∗e₁ = e₂, ∗e₂ = −e₁, ∗(e₁∧e₂) = 1; Γ1 = i c(e₁)e₂ = i e₁∧e₂ = i^1∗1; c(e₂)e₁ = −e₁∧e₂, c(e₁)(−e₁∧e₂) = ι(e₁)(e₁∧e₂) = e₂, Γe₁ = ie₂ = i^1∗e₁; c(e₂)(e₁∧e₂) = e₁, c(e₁)e₁ = −1, Γ(e₁∧e₂) = −i = i³·1; Γ²1 = i(−i) = 1 | Pass |
| G2.2 Check 2 (520–524), new | Γ = +1 eigenspace | Γ(1 + ie₁∧e₂) = ie₁∧e₂ + i(−i) = 1 + ie₁∧e₂; Γe₂ = i c(e₁)(−1) = −ie₁, Γ(e₁ + ie₂) = ie₂ + e₁; both mix degrees; dim 2 = dim S⁺⊗S* | Pass |
| G2.2 Check 3 (525–527), new | c(e₁)² on 1 | c(e₁)1 = e₁, c(e₁)e₁ = −ι(e₁)e₁ = −1; (ε + ι)²1 = +1 | Pass |
| G2.2 Check 4 (528–533), new | e_I ↦ c(e_I), reverse | c(e_i) unitary (skew-Hermitian, square −1), so 2^(−ℓ)tr(c(e_I)†c(e_I)) = 2^(−ℓ)·2^ℓ = 1, unnormalized 2^ℓ; reverse(e₁⋯e_(2ℓ)) = (−1)^(ℓ(2ℓ−1))e₁⋯e_(2ℓ) = (−1)^ℓ(…), dual action by reverse gives (−1)^ℓΓ^T; ℓ = 1: e₂e₁ = −e₁e₂ | Pass |
| G2.3 Check 1 (551–556), new | two negative planes | {c_V(v)⊗Id, Γ_V⊗c_W(w)} = (c_VΓ_V + Γ_Vc_V)⊗c_W = 0; (Γ_V⊗c_W(w))² = Id⊗(−|w|²); ungraded cross term 2c_V(v)⊗c_W(w); Γ_(V⊕W) = i²c_V(e₁)c_V(e₂)Γ_V²⊗c_W(f₁)c_W(f₂) = −(…)⊗(…) = (i c_Vc_V)⊗(i c_Wc_W) = Γ_V⊗Γ_W; S⁺⊗S⁺ ⊕ S⁻⊗S⁻ has dim 2 | Pass |
| G2.3 Check 3 (560–563), new | Koszul swap | c(0,w) then swap: (−1)^(|s|)(−1)^(|s|(|t|+1)) c_W(w)t⊗s = (−1)^(|s||t|)c_W(w)t⊗s = swap then c_W(w)⊗Id; unsigned swap differs by (−1)^(|s|); block swap of even blocks has sign (−1)^(2ℓ·2m) = +1 | Pass |
| G2.3 Check 4 (564–568), new | A = ℂ⊕ℂ, ℓ = 1 | even part S⁺⊗A⁺ ⊕ S⁻⊗A⁻ has dim 1+1 = 2; on S⊗A⁻, Γ_S⊗γ_A = −Γ_S⊗Id | Pass |
| G3.1 Check 1 (598–602), new | rank 0, 1; Möbius | Cl(0) = ℝ; Cl(L) = ℝ⊕L with w₁(ℝ⊕L) = w₁(L) ≠ 0 for the Möbius L; fibre Cl(0,1) = ℂ | Pass |
| G3.1 Check 2 (603–606), new | Cl(0,2) = ℍ; Cl(0,3), a = 1+ω | quaternion norm multiplicative; ω² = (−1)^3(−1)^3 = 1, a² = 2 + 2ω = 2a, |a| = √2, |a²| = 2√2 = √2|a|² > |a|² | Pass (not submultiplicative) |
| G3.1 Check 3 (607–614), new | μ(R_θ) = e^(iθ/2)(cos(θ/2) + sin(θ/2)c₁c₂) | at θ = 2π both factors are −1, product +1; conjugation by the spin factor rotates V by 2·θ/2 = θ; ρ(cos φ + sin φ e₁e₂) = cos φ − i sin φ Γ = e^(∓iφ) on S^±, so μ acts by e^(iθ/2)e^(−iθ/2) = 1 on S⁺ and e^(iθ) on S⁻; c(R_(π/2)e₁) = c(e₂) ≠ c(e₁) | Pass |
| G3.2 Check 1–2 (627–634), new | Y Hermitian; ranks | Y² = Id ≠ −Id; irreducible dim 2^⌊n/2⌋ divides the rank, 1 is not a multiple of 2; over ℝ the lines c = ±i are the two G1.4 factors and their sum is faithful | Pass |
| G3.2 Check 3 (635–639), new | restriction to S¹ ⊂ ℝ² | c(∂_θ) = −sin θ iZ + cos θ iY; square = −sin²Z² − cos²Y² − sin θ cos θ·i²(ZY+YZ) = −Id; trace 0; eigenvalues ±i once each | Pass |
| G3.3 Check 2 (658–663), new | ∇^E = d + A, flat ∇^V | compatibility ⟺ [A(X), c(e_j)] = 0 ⟺ A(X) scalar (commutant of Z, Y in M₂(ℂ)); [iY, iZ] = −(YZ − ZY) = −(iX + iX) = −2iX ≠ 0; A = i dx¹ scalar | Pass |
| G3.3 Check 3 (664–666), new | A = e₁e₂ dx¹ | [e₁e₂, e₁] = e₁e₂e₁ − e₁e₁e₂ = e₂ + e₂ = 2e₂ ≠ 0 | Pass |
| G3.3 Check 4 (667–670), new | unit S², K = 1 | R(e₁,e₂)e₁ = −e₂, R(e₁,e₂)e₂ = e₁; R^S = ¼[(−1)c₁c₂ + (+1)c₂c₁] = −½c₁c₂; [−½c₁c₂, c₁] = −½(c₁c₂c₁ − c₁c₁c₂) = −½(c₂ + c₂) = −c₂ = c(R(e₁,e₂)e₁); with ½: −2c₂; consistency with G6.3: Σ_(i<j)c_ic_jR^S_ij = c₁c₂(−½c₁c₂) = ½ = Scal/4 | Pass |
| G4.1a Check 1–2 (715–721), new | Spin(2); ranks 0, 1 | cos θ + sin θ e₁e₂ ↦ rotation by 2θ, i.e. z ↦ z² on U(1), kernel {±1}; Cl(0,1)^even = ℝ, u² = 1 gives {±1}, SO(1) = {1}; Spin(0) = closure of the empty set = {1} at the pin, μ₂ = {u ∈ ℝ : u² = 1} = {±1} | Pass |
| G4.1a Check 3 (722–725), new | e₁ ∈ Cl(0,2), e₁⁻¹ = −e₁ | e₁e₁(−e₁) = e₁; e₁e₂(−e₁) = e₁e₁e₂ = −e₂; determinant −1 | Pass |
| G4.2 Check 1–2 (793–800), new | S¹, S², rank 0 | Fr⁺_SO(1) = S¹, Spin(1) = {±1}: double covers of S¹ are the trivial and the connected one; H²(S¹;ℤ/2) = 0; μ₂-double covers: two over S¹, one over S² | Pass |
| G4.2 Check 3 (801–806), new | B = diag(4,1); B = Id | B^(1/2) = diag(2,1), B^(−1/2)e₁ = e₁/2, g'(e₁/2,e₁/2) = g(2e₁,e₁/2) = 1; B⁻¹e₁ = e₁/4, g'(e₁/4,e₁/4) = 1/4, norm ½; Sylvester eigenvalues √b_i + √b_j ∈ {4, 3, 2}, at B = Id all 2; self-adjoint roots of Id: diag(1,−1) is one, so "the roots ±Id" is false | R03 |
| G4.4 Check 1–3 (844–853), new | S¹, T², Sⁿ; m = n = 1 | |H¹| = 2, 4, 1; ({±1}²)/diag ≅ ℤ/2 ↦ {±1} ⊂ Spin(2) by product; (−1)(−1) = +1 so antiperiodic ⊕ antiperiodic is periodic; twist twice = identity | Pass |
| G5.0 Check 1 (893–898), new | Cl(0,1), e² = −1 | c₋(e)1 = e, c₋(e)e = −1; ⟨c₋(e)1,e⟩ = 1 = −⟨1,c₋(e)e⟩; C₊(e)1 = e, C₊(e)e = (−e)e = 1; ⟨C₊(e)1,e⟩ = 1 = ⟨1,C₊(e)e⟩; C₊(e)²1 = 1; c₋C₊1 + C₊c₋1 = −1 + 1 = 0; without parity 1 ↦ e ↦ −1 | Pass |
| G5.0 Check 3 (902–908), new | Cl(0,2) = ℍ, z = cos θ + sin θ e₁e₂ | z·e₁ = cos θ e₁ + sin θ e₁e₂e₁ = cos θ e₁ + sin θ e₂ (rotation by θ) versus conjugation by 2θ; C₊(e₁)C₊(e₂)s = ε(ε(s)e₂)e₁ = −s e₂e₁ = s e₁e₂ for every s | Pass |
| G5.1 Checks (936–948), new | ranks; S² | 2^⌊n/2⌋ = 1, 2, 2, 4; S⁻ = E^(1/2) of degree 1, S⁺ = (S⁻)* of degree −1, total degree 0; antiperiodic = periodic ⊗ Möbius line | Pass |
| G5.3 Check 1–2 (973–979), new | z = cos θ + sin θ e₁e₂ | ze₁ = cos θ e₁ + sin θ e₂ = e₁(cos θ − sin θ e₁e₂) = e₁z⁻¹, so ze₁z⁻¹ = e₁z⁻² = cos 2θ e₁ + sin 2θ e₂; ρ(z) = cos θ − i sin θ Γ = e^(−iθ) on S⁺, e^(iθ) on S⁻; (S⁻)² weight z² = E, (S⁺)² weight z⁻² = E*, S⁺⊗S⁻ weight 0; frame (e₂,e₁) negates Γ | Pass |
| G5.3 Check 3 (980–984), new | S², T² | c₁(TS²) = 2, one root with c₁ = 1 since H² = ℤ is torsion-free; |H¹(T²;ℤ/2)| = 4; 2/2 = 1 | Pass |
| G6.0 Check 1 (1128–1131), new | A = Cl(0,1) ≅ ℂ | reverse(e) = e, involute(e) = −e, so star = conjugation; ⟨sa,tb⟩ = ∫ ā s̄ t b; τ(∫ s̄t) = Re ∫ s̄t; ‖⟨s,s⟩‖ = ∫|s|² | Pass (norms equal in rank one) |
| G6.0 Check 2 (1132–1136), new | T³, s = 1 + ω | ω² = 1, ω* = reverse(−ω) = −(e₃e₂e₁) = −(−ω) = ω; ⟨s,s⟩ = 2 + 2ω; ω ↦ (1,−1) in ℍ⊕ℍ so ‖2 + 2ω‖ = max(4, 0) = 4; τ(2 + 2ω) = 2 = ‖1‖² + ‖ω‖² | Pass (4 ≠ 2) |
| G6.0 Check 3 (1137–1143), new | circles, T² | D = i d/dθ: e^(ikθ) ↦ −k e^(ikθ); kernel dim 1 (periodic, η by the mod-2 index 1), 0 (antiperiodic); T²: constants Cl(0,2) ≅ ℍ, η² ≠ 0 in KO₂ = ℤ/2; chiral kernels 1 and 1, index 0 = c(η²) | Pass |
| G6.0 Check 4 (1144–1148), new | S³, T³, points | Scal(Sⁿ) = n(n−1) = 6, 6/4 = 3/2; T³ kernel = constants, dim 8 = 2³; points ±1 | Pass |
| G6.7 Check 1 (1352–1354), new | ℂ², ℂ | J²(z₁,z₂) = (−conj(z̄₁), conj(−z̄₂)) = −(z₁,z₂); on ℂ, J²z = a·conj(a z̄) = |a|²z ≠ −z | Pass |
| G6.7 Check 2 (1355–1359), new | ω₋ = e₁e₂e₃e₄ | ω₋² = (−1)^6(−1)^4 = 1; Γ = i²ω₋ = −ω₋; ω₋e_j = (−1)^3e_jω₋; ω₋aω₋ = (−1)^(deg a)a; C₊(e₄)1 = e₄, C₊(e₃)e₄ = −e₄e₃ = e₃e₄, C₊(e₂)(e₃e₄) = e₃e₄e₂ = e₂e₃e₄, C₊(e₁)(e₂e₃e₄) = −e₂e₃e₄e₁ = e₁e₂e₃e₄; on even s, R_(ω₋)s = sω₋ = ω₋s = L_(ω₋)s = −Γs | Pass |
| G6.7 Check 3–4 (1360–1366), new | zJ; S⁴, K3 | (zJ)² = z z̄ J² = −|z|²; Scal(S⁴) = 12 > 0; K3: ker D⁺ = ℂ² (two parallel spinors), ker D⁻ = 0, α = 1, index 2 = Â(K3) | Pass |
| G1.2 h (202–204), new | h = g + i g(·,J·) | h(Ju,v) = g(Ju,v) + i g(Ju,Jv) = g(Ju,v) + i g(u,v) = i(g(u,v) − i g(Ju,v)) = i(g(u,v) + i g(u,Jv)) = i h(u,v); conj h_J = h | Pass |
| `cliffordScalarTrace_mul_two_pow` (Lean 56; Check 368–373) | Cl(0,1); V = 0; Q = 0 | L_(x+ye) = [[x,−y],[y,x]], trace 2x = 2¹τ; τ = Id, 2⁰a = a; Q = 0: L = [[x,0],[y,x]], trace 2x | Pass |
| `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 63, 70) | orthogonal basis, Q > 0; Q = 0; Q(e) = −1 | τ(reverse(e_I)e_I) = Π Q(e_i) > 0, Σ a_I²Π Q(e_i) ≥ 0, = 0 iff a = 0; τ(e²) = 0 with e ≠ 0; τ(e²) = −1 < 0 | Pass (PosDef needed and present) |
| `exists_multiplicityEvaluation` (Lean 100; Check 358–367) | S = ℂ², E = S⊗ℂ³; E = S; S = ℂ²⊕ℂ² diagonal, E = ℂ² | dim Hom = 3, 2·3 = 6; Schur dim 1; dim Hom = 2, 8 ≠ 2 so ρ onto End(S) is needed; S infinite-dimensional: finite-rank ideal, counit fails, so `[FiniteDimensional ℂ S]` is needed and present | Pass |
| `cliffordMultiplication_anticommutator` (Lean 126; Check 227–229) | (e₁,e₁); (e₁,e₂) | 2(iZ)² = −2Id = −2⟨e₁,e₁⟩; −(ZY + YZ) = 0 | Pass |
| `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors` (Lean 142, 148, 163) | ℓ = 1; ℓ = 0; Q = 0 | Γ² = X² = Id; Γ c(e₁) = −X iZ = −iXZ, c(e₁)Γ = −iZX = iXZ; ℓ = 0: Γ = Id, S⁺ = S, S⁻ = 0; Q = 0, c = 0: Γ = 0, both kernels 0, not complementary, excluded by Q(v) ≠ −⟨v,v⟩ | Pass |
| `diracInFrame_eq` (Lean 197; Check 1215–1221) | rotated frame; (2e₁,e₂); n = 0 | cross terms cos θ sin θ(c₁∇₂ + c₂∇₁ − c₁∇₂ − c₂∇₁) = 0; 4c₁∇₁ + c₂∇₂ ≠ D; empty sum 0 | Pass |
| `even_finrank_of_conjLinear_square_neg` (Lean 213, proved) | ℂ²; ℂ | as G6.7 Check 1 | Pass (elaborates) |
| Companion `source_cyclic_products` (`SourcePauliTargets.lean:44`) | i = 2 | i+1 = 0, i+2 = 1 in Fin 3: XZ = −iY | Pass (R02 is about padding, not truth) |

**Headline theorems.** Statable and stated: the normalized scalar trace with its positivity and faithfulness (G1.3), the Morita evaluation (G1.3), the negative-metric Clifford relation (G1.2), chirality square, anticommutation and splitting (G2.1), frame independence of the Dirac contraction (G6.1), the quaternionic parity (G6.7, proved). Not statable and named in the module docstring with the missing carrier (`Suggested.lean:15–28`): Lichnerowicz and Bochner (no Clifford-module bundle with connection), the closed H¹ realization (no bundle Sobolev spaces), spin existence and the H¹ torsor (no principal Spin bundle, no Čech w₂), the KO index class (no real Clifford classifier), ind D⁺ = 2α (no spinor bundle); the pins are unchanged since these were confirmed. No statable headline is absent; nothing is forced through a stand-in; no admitted theorem is one-tactic padding.

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry*, Theorems II.1.7, II.8.2, II.8.8 (G4.3, G4.4, G6.2, G6.3): paywalled, recorded `uncertified` in the manifest; cited by locator only, checked against Nicolaescu and by computation above instead.
- Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, `uncertified`; the graded-product rank facts are in the table.
- The worker's 15-target sample: no target list or seed was supplied; the seventeen Nicolaescu locators above are this review's own sample.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

## Source issues

- none (no new misprint found in `nicolaescu` at the eighteen passages opened; `Theorem 12.1.67 (Bochner-Weitzenböck))` at `line 30422` has a doubled closing parenthesis, a typesetting slip with no mathematical content).
