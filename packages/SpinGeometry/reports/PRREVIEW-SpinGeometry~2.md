# Review of SpinGeometry (pull request #1780 at 2d42cdf)

**Verdict:** needs changes

Full review of the folder `TauCetiRoadmap/SpinGeometry/` at `2d42cdf4d5d81d8160a7e52f9dc619f31badbf34`. The pull request adds one 40-line section to the on-main README (lines 293–331) and a new companion file `SourcePauliTargets.lean`; `Suggested.lean` and the rest of the README are main's. Thirteen findings, five blocking (one P1, four P2). The gate fails (`blob=7 tex=2 sorry-data=1 residue=1 imports=1 mathlib-subimports=8 no-import-mathlib=1 build=8`); its `build=8` is only lake's "consider adding `module`" advisory on the eight `Mathlib.<submodule>` imports, and `residue=1` is new in this pull request (the `<a id=…>` anchor at README line 293). The companion file elaborates with no diagnostics. No file outside the folder is changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty).

**Previous findings (review of #1674 at edf4ead), finding by finding.** The brief records no change between the head that review read and this one; in fact the two heads differ only in the extension each pull request adds, and everything inherited from main is identical, so each inherited finding is checked again here.

| Previous | Status at 2d42cdf | Where |
| --- | --- | --- |
| R01 reciprocal supplier edges | not repaired | R01 below |
| R02 sorry'd data `multiplicityEvaluation` | not repaired (`Suggested.lean:140` unchanged) | R02 |
| R03 statable trace headline absent, docstring inventory | not repaired (`Suggested.lean:17–24` unchanged) | R03 |
| R04 new G4.4a belongs in a Part II | not applicable: G4.4a is not in this pull request; the analogous question for this pull request's own section is R04/R05 below | R04, R05 |
| R05 locators at targets | not repaired, and the new section adds a locator into an unidentifiable text | R13 |
| R06 seven commit-pinned links | not repaired (`blob=7`, README lines 61, 64, 71–75) | R07 |
| R07 two TeX fragments | not repaired (`tex=2`, README lines 174, 784) | R08 |
| R08 import header | not repaired (`Suggested.lean:1–15`) | R09 |
| R09 Checks, `*Needs:*`, layer shape | not repaired; the new section has no Checks list and no `*Needs:*` line either | R10 |
| R10 padding in `Suggested.lean` | not repaired (lines 37–59, 78–90, 226–232) | R11 |
| R11 names and docstrings | not repaired | R12 |

## R01 (P1) — Reciprocal supplier edges with three roadmaps on main

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:61` ("GeneralizedCohomology G5.5 specifies … suppliers consumed by G5.0/G6.0"), `:36` (RiemannianGeometry R1,R5,R7), `:522` (C3.5), `:900`.

**Claim:** SpinGeometry consumes GeneralizedCohomology G5.5, RiemannianGeometry R1/R5/R7 and CharacteristicClasses C3.5, and item-level ordering makes the supply graph valid.

**Witness:** On main, `TauCetiRoadmap/GeneralizedCohomology/README.md:42` and `:1908` consume SpinGeometry G1.3's `cliffordScalarTrace`, and `:1772` consumes SpinGeometry G5.0/G6.0; `TauCetiRoadmap/CharacteristicClasses/README.md:911`, `:930` consume SpinGeometry G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117` consumes SpinGeometry G1.2/G2.2/G3.4. Each pair is a two-way roadmap edge. The dependency check prints `depcheck: 205 roadmaps, 1665 edges, 0 problem(s)` because none of the four roadmaps is in the merge order; that is a limit of the check, not evidence of a single direction of supply.

**Repair:** As in the previous review: move the shared early objects (the finite Clifford scalar trace, the topological frame and rank-zero adapters, the finite exterior-module comparison) to one earlier owner that both sides import, or split the foundations (G1–G4.1) from the Dirac and index consumers (G5–G6) into two roadmaps, and repoint both ends. The mathematics of every target is kept. Not repaired by this pull request; a repair touches other folders, which is why it is recorded as a defect of the folder rather than of this diff.

## R02 (P2) — Admitted data definition `multiplicityEvaluation`, with a narrower theorem

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:140–147`: `def multiplicityEvaluation [Nontrivial S] : S ⊗[ℂ] multiplicitySpace Q ρ σ ≃ₗ[ℂ] E := by sorry`.

**Claim:** The admitted equivalence and `multiplicityEvaluation_tmul` test G1.3's evaluation isomorphism for an arbitrary module E.

**Witness:** Gate `sorry-data=1`. My `#check` probe: the elaborated `multiplicityEvaluation` carries no `FiniteDimensional ℂ S` or `FiniteDimensional ℂ E` (0 occurrences), while `multiplicityEvaluation_tmul` carries both (1 each). For S = ℂ, E = ℕ →₀ ℂ the README statement (line 196, "no finite-dimension … hypothesis on E") holds and the Lean theorem does not apply.

**Repair:** Delete the admitted definition and the theorem that mentions it. State one theorem: for finite-dimensional nonzero S with `ρ` an algebra isomorphism onto `End ℂ S` and any E, there is a linear equivalence `S ⊗ multiplicitySpace Q ρ σ ≃ₗ[ℂ] E` whose value on `s ⊗ₜ T` is `T s`, binding `[FiniteDimensional ℂ S] [Nontrivial S]` explicitly and nothing on E. On E = 0 it is the zero equivalence; on S = ℂ, E = ℕ →₀ ℂ it sends `1 ⊗ T` to `T 1`. (At the pin Tau Ceti has no `RingTheory/Morita` directory, so nothing native is duplicated.)

## R03 (P2) — The statable scalar-trace headline is absent and the unstatable headlines are not named

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:17–24` (module docstring), README lines 233–240.

**Claim:** The file states the roadmap's headline theorems statable at the pins and says which are not.

**Witness:** G1.3's normalized faithful trace is statable: `LinearMap.trace ℝ (CliffordAlgebra Q)` and `LinearMap.mulLeft` exist in Mathlib at the pin (`LinearAlgebra/Trace.lean`), and the previous review's scratch statement (a functional τ with τ(a) = 2^(−dim V)·tr(L_a), τ(1) = 1, τ(ab) = τ(ba), τ(reverse(a)a) ≥ 0 with equality only at 0 for positive Q) elaborated. Nothing of the kind is in the file. The docstring names no absent headline (Lichnerowicz, closed-domain self-adjointness, the KO-valued index class, the four-dimensional quaternionic index) and no missing carrier.

**Repair:** Add the trace theorem with `sorry` (witness values: on Cl(0,1) with a = x + ye, L_a = [[x, −y],[y, x]], half its trace is x; τ(reverse(a)a) = x² + y²). List in the docstring each geometric headline and the carrier it lacks (smooth Clifford-module bundle, principal spin lift, Sobolev domain, KO classifier).

## R04 (P2) — The new section pins the conventions of a source nobody can identify, in process language

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:322–326`: "The source's obscured quotient relation, unspecified su(2) convention and unread first Pauli subscript remain unresolved source inputs. … refer to the Rieffel quantum Riemannian notes' physical pages2 and5."; `:293` `<a id="source-ordered-pauli-comparisons"></a>`; `:329–331`.

**Claim:** The section records how a named source orders the Pauli matrices and which of its statements are to be kept separate from the roadmap's dictionary.

**Witness:** The "Rieffel quantum Riemannian notes" appear nowhere else: not in the References (lines 902–920), with no title, year or URL, in no manifest, in no cached source (13171 cache texts; the only Rieffel text mentioning Pauli matrices is unrelated), and not in the one Rieffel text the sources service could fetch for this review (arXiv 0812.2884, `rieffel-coadjoint`, 34 pages, zero occurrences of "Pauli"). Two web searches found no such notes. So "the source order (Z,Y,X)", "the source's statement that the displayed S_j form a basis of su(2)" and "the unread first Pauli subscript" are claims about a text the reader cannot open. The sentences quoted above are process narrative ("unread", "unresolved", "remain required beyond those selected forms"), and the anchor tag is the gate's `residue=1`, both introduced by this pull request.

**Repair:** Identify the text in References (author, title, year, URL or DOI) and record it in the manifest, or drop every sentence about what the source says. Keep the mathematics as Checks under G1.1 (see R05) written timelessly: the standard matrices X, Y, Z; the ordered triple (Z, Y, X) has S_jS_{j+1} = −iS_{j+2} while (X, Y, Z) has XY = iZ; the odd permutation (X,Y,Z) ↦ (Z,Y,X) is realised by no conjugation because XYZ = i·Id and ZYX = −i·Id, whereas with one sign change it is: the Hadamard matrix H = (X+Z)/√2 satisfies HXH = Z, HYH = −Y, HZH = X. Delete the anchor tag and the three narrative sentences.

## R05 (P2) — The new section cites a recurrence G1.1 does not contain and a "model" that is private at the pin

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:318–319`: "In G1.1's positive complex recurrence compare the source new pair `(S₂,S₃)` with the valid old-generator assignment `e_j⊗S₁`"; `:315–316`: "compare the universal map from native `CliffordAlgebra (TauCeti.realCliffordForm 2 0)` with the existing positive-plane model".

**Claim:** G1.1 owns a complex recurrence Cl_{n+2}(ℂ) ≅ Cl_n(ℂ) ⊗ M₂(ℂ), and a positive-plane model Cl(2,0) ≅ M₂(ℝ) exists to compare with.

**Witness:** G1.1 (README lines 138–154) has no recurrence of any kind; the word occurs in the folder only in the new section. Tau Ceti at pin 358314d4 has only real recurrences (`NegativePlane.lean:451`, `:544`, `BottPeriodicity.lean:499`), and SpinRepresentations Layer 7 on main (`README.md:892–894`) consumes those real ones. The only Cl(2,0) ≅ M₂(ℝ) at the pin is `private noncomputable def realCliffordPositiveTwoEquiv` (`LinearAlgebra/CliffordAlgebra/Classification.lean:175`), which no consumer can name; the public route is `TauCeti.realCliffordSignatureSwitchRecurrenceEquiv 0 0 : Cl(2,0) ≃ₐ Cl(0,0) ⊗ M₂(ℝ)` (`BottPeriodicity.lean:499`). The assignment itself is correct: with old generators e_j ↦ e_j ⊗ Z and the new pair ↦ 1 ⊗ Y, 1 ⊗ X, (e_j⊗Z)(e_k⊗Z) + (e_k⊗Z)(e_j⊗Z) = (e_je_k + e_ke_j) ⊗ Z² and ZY + YZ = 0 = ZX + XZ, so the Clifford relations of the positive form hold; the defect is the owner it is attributed to.

**Repair:** Either state the complex recurrence as an owned G1.1 target with this generator assignment and a locator (Lawson–Michelsohn I.4 or Nicolaescu §12.1.2), or delete the sentence. Name the public equivalence (`realCliffordSignatureSwitchRecurrenceEquiv 0 0` composed with Cl(0,0) ≅ ℝ) as the model to compare with; the comparison is sound because `positiveModel` is surjective (Id, X, Z, XZ have coordinate determinant 4 ≠ 0) between algebras of dimension 4, hence an isomorphism, and two isomorphisms Cl(2,0) ≅ M₂(ℝ) differ by an inner automorphism.

## R06 (P3) — The companion file is value-computing padding and lacks docstrings

**Location:** `TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean:26`, `:35`, `:39`, `:49`, `:89` (no docstrings); `:30–33`, `:95–104`.

**Claim:** The file "gives finite matrix, native quaternion and positive-form generator certificates" (README line 328).

**Witness:** Every theorem is a 2×2 matrix identity closed by `fin_cases`/`simp`: these are exactly "examples that compute values" and "declarations that mirror README Checks". `native_quaternion_dictionary` restates the definition it names: `Algebra/Quaternion/ComplexMatrix.lean:155–158` already says i, j, k ↦ `!![I,0;0,-I]`, `!![0,1;-1,0]`, `!![0,I;I,0]`, which are iZ, iY, iX. Five declarations have no docstring. The file does elaborate cleanly (after `lake build TauCeti.Algebra.Quaternion.ComplexMatrix`, `lake env lean` exits 0 with no output).

**Repair:** Delete the file; the README keeps each identity as a Check with its value (S_j² = Id; S₁S₂ = −iS₃; XZ = −iY = [[0,−1],[1,0]]; i,j,k ↦ iZ,iY,iX with (iZ)(iY) = iX). If the project keeps companion files, give every declaration a docstring and remove the restated definition.

## R07 (P3) — Seven commit-pinned links

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:61`, `:64`, `:71–75`.

**Claim:** Links of the form `github.com/…/blob/<sha>/…` are supplier citations.

**Witness:** Gate `blob=7`. GeneralizedCohomology G5.5 is on main at `TauCetiRoadmap/GeneralizedCohomology/README.md:1892–1938`; TopologicalKTheory T7 and PDO P1.0/P4/P5/P6 and ComplexKahlerGeometry K5 resolve on main by section.

**Repair:** Replace each by a repository-relative link to the roadmap and section name, as the other supplier bullets do.

## R08 (P3) — TeX fragments outside code spans

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:174` (`ρ(a^{*Cl_base})`), `:784` (`π_{T^*M}`).

**Witness:** Gate `tex=2`.

**Repair:** Put the whole expression in a code span, as line 116 already does for the same formula.

## R09 (P3) — Import header

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:1–15`.

**Witness:** No `import Mathlib`; eight `Mathlib.<submodule>` lines (gate `imports=1 mathlib-subimports=8 no-import-mathlib=1`), and the eight lake advisories that make `build=8`.

**Repair:** `import Mathlib` first, then only the Tau Ceti modules used (`TauCeti.RepresentationTheory.QuaternionicStructure`, `TauCeti.Geometry.Manifold.Riemannian.Basic`, and whichever of the four Spin/Clifford modules a retained declaration needs). Re-elaborate.

## R10 (P3) — No Checks lists, no `*Needs:*` lines, legacy shape

**Location:** README throughout; the new section lines 295–331 in particular.

**Witness:** `grep -c '\*\*Checks\.\*\*\|\*Needs:\*' README.md` is 0. The new section defines a dictionary and three comparisons with no Checks bullets and no dependency line, and is a `###` heading between G1's numbered items and G2.

**Repair:** The brief's shape (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, layers with `### k.n`, Checks bullets with computed values, `*Needs:*` per target, Examples and Dependencies per layer). For the new material, three Checks under G1.1: the positive plane (e₁ ↦ X, e₂ ↦ Z, e₁e₂ ↦ [[0,−1],[1,0]], (e₁e₂)² = −Id); the negative plane (e₁ ↦ iZ, e₂ ↦ iY, e₁e₂ ↦ iX, each squaring to −Id); the negative control that (X,Y,Z) ↦ (Z,Y,X) is not a conjugation (XYZ = i, ZYX = −i).

## R11 (P3) — Padding in `Suggested.lean`

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:44–59`, `:78–83`, `:226–232`.

**Witness:** `realCliffordPositiveRightVector_square` and `_anticommute` are proved by `simp` in place (they are Checks of G5.0); `cliffordMultiplication_sq` is `CliffordAlgebra.ι_sq_scalar` transported through ρ; `even_finrank_of_quaternionicStructure` is one application of the preceding theorem to `hJ.sq_eq_neg`. The six admitted theorems each resist `rfl`, `simp` and `infer_instance` on a scratch copy (every `first | rfl | simp | infer_instance | …` fell through to "unsolved goals"), so they are not one-tactic padding.

**Repair:** Delete the four from the file; the README keeps them as API bullets and Checks.

## R12 (P3) — README and Lean names out of step; docstrings missing

**Location:** `Suggested.lean:73`, `:93–116`, `:129`, `:173`; README lines 233, 546.

**Witness:** `IsGeometricAction`, `chirality`, `positiveSpinors`, `negativeSpinors`, `isCompl_spinors`, `multiplicitySpace`, `diracInFrame_eq` are declared and not named in the README; the README backticks its own `cliffordScalarTrace` (line 233) and `realCliffordSpinorBundle` (line 546), neither declared. `chirality_sq`, `chirality_anticommutes`, `negativeSpinors`, `isCompl_spinors`, `diracInFrame_eq` have no docstring.

**Repair:** Name each retained declaration in the README at its target; drop the backticks from names the file does not declare; docstring every declaration; use the module-docstring form "<title>: target signatures".

## R13 (P3) — Targets without exact locators

**Location:** README G1–G6 (only three broad references at lines 902–911); the new section's only locator is "physical pages2 and5" of an unidentified text.

**Witness:** No target carries a theorem or page number. For the sampled targets the supporting passages exist and are listed under Verified sound (for example G2.2's identity is Nicolaescu eq. (12.1.1), printed p. 633, `nicolaescu` line 29514; G6.3 is Theorem 12.2.33, printed p. 673, line 31100).

**Repair:** Attach those locators at the claims and record Nicolaescu, Lawson–Michelsohn and Atiyah–Bott–Shapiro in `sources.toml`.

## Verified sound

**Scope of the check.** Both Lean files and the whole README read; the pull-request diff (README +40, new companion +106, nothing else); main's three suppliers named in R01 opened at the cited lines; pins confirmed identical in the worktree and in content (`TauCeti 358314d4`, `mathlib f6090c70`). Commands run: the dependency check (`depcheck: 205 roadmaps, 1665 edges, 0 problem(s)`, no UPWARD or CYCLE line; SpinGeometry is on main and not in the order, which is not a defect); `lake build TauCeti.Algebra.Quaternion.ComplexMatrix TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic` (both exist at the pin); `lake env lean` on `SourcePauliTargets.lean` (exit 0, no output, so no `sorry` and no warning); `lake env lean` on a scratch copy of `Suggested.lean` with each admitted proof replaced by a one-tactic attempt and `#check @name` for all 20 declarations. The `#check` types agree with the worker's `signatures.md`; the three dropped binders are `FiniteDimensional ℂ S/E` on `multiplicityEvaluation` (R02), `FiniteDimensional ℂ S/E` on `multiplicitySpace` (harmless: the submodule needs no finiteness) and `VectorBundle ℝ F W` on `diracInFrame` (harmless: a pointwise sum). No `set_option`, no admitted `example`, no computational algorithm, no copied passage, no edit outside the folder.

**Ownership.** `roadmaps grep -i Pauli` over 440 open pull requests and main: the standard matrices X, Y, Z appear in TemperleyLiebOperatorAlgebras (`README.md:876`, same matrices, same order) and LocalVariationalFieldTheory (`README.md:676–677`, a different source's order (σ₃,σ₁,σ₂)); neither owns a Pauli dictionary for SpinGeometry's planes, and SpinGeometry's new section agrees with TemperleyLieb's matrices. Mathlib at the pin has no Pauli matrices (the only hits for "Pauli" are unrelated identifiers). Tau Ceti at the pin owns `Quaternion.toComplexMatrix` (`Algebra/Quaternion/ComplexMatrix.lean:158`, i,j,k ↦ iZ, iY, iX), `realCliffordZeroTwoEquivQuaternion` (`RealForm/Basic.lean:617`, ι v ↦ ⟨0, v 0, v 1, 0⟩), `realCliffordOneOneEquivMatrix` (`:665`), the real recurrences (R05), and the half-spin, volume-element and periodicity modules `Suggested.lean` imports. The board's package index lists five unrelated packages. The companion's `positiveModel` duplicates no public declaration (the pinned Cl(2,0) ≅ M₂(ℝ) is private).

**Source sample.** The brief names no target ids ("none found by heading") and the README has no manifest, so the sample is reproducible rather than the worker's: Python `random.Random` seeded with the full head string, 15 of the 29 subsections (G1.1–G6.7 with G4.1a/b and the new Pauli section separate): G1.1, G1.3, Pauli, G2.2, G3.1, G3.4, G4.3, G4.4, G5.2, G6.0, G6.1, G6.3, G6.4, G6.6, G6.7. Source: `nicolaescu` = cache `d9ab8c5d…` (author copy, academicweb.nd.edu, 702 PDF pages; printed page = PDF page − 12, checked at Theorem 12.2.33: marker `=== page 685 ===` precedes line 31100, printed p. 673).

| Target | Passage opened | Finding |
| --- | --- | --- |
| G1.1 | Def. 12.1.10, p. 626, line 29261: uv + vu = −2q(u,v) | negative convention matches README line 89–90 |
| G1.3 | Cor. 12.1.22 and Rem. 12.1.23, p. 632, line 29466: every module is S ⊗ W, W arbitrary | supports the arbitrary-E claim at line 196 (R02) |
| Pauli | no identifiable source | Not verifiable; computed instead (table below) |
| G2.2 | eq. (12.1.1), p. 633, line 29514: Γω = i^{k+p(p−1)} ∗ω | matches README line 361 |
| G3.1/G3.3 | Def. 12.1.64 (a2), p. 653, lines 30304–30314 | Leibniz compatibility as README line 422 |
| G3.4/G6.4 | §12.2.1, p. 657, line 30485 | Hodge–de Rham operator as Clifford module |
| G4.3 | Prop. 12.2.25, p. 669, line 30950: spin structure iff w₂ = 0 | iff as README line 526, for manifolds only; the paracompact-base extension is CharacteristicClasses C3.5's |
| G4.4 | Rem. 12.2.28 and Ex. 12.2.35, pp. 669, 673, lines 30957, 31121: H¹(T³;ℤ₂) torsor, eight structures | matches README line 533 |
| G5.2 | ABS paywalled (previous review) | Not verifiable; rank computation below |
| G6.0/G6.3 | Thm. 12.2.33, p. 673, line 31100: D² = ∇*∇ + s/4 | matches README lines 676, 801 |
| G6.1 | Prop. 12.1.66 and its proof, p. 655, lines 30370–30385: formal self-adjointness via skew-Hermitian c(e_i) | matches README line 748 |
| G6.6 | §12.2.3, p. 672, line 31068: symbol of D⁺ is Clifford multiplication | symbol only; the K_c class is TopologicalKTheory's |
| G6.7 | not in Nicolaescu | Not verifiable from an open text; parity computed below |

**Adversarial table.** A = [[0,−1],[1,0]] and B = [[0,i],[i,0]] are the two-plane Fock matrices (A² = B² = −Id, AB + BA = 0), Γ = iAB = diag(1,−1). "Pass" means the instance agrees on both sides.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| S_j² = Id, README 300; `source_squares` | j = 1,2,3 | Z², Y², X² all = Id | Pass |
| pairwise anticommutation, 300; `source_anticommuting` | all 6 ordered pairs | S_jS_k + S_kS_j = 0 (computed) | Pass |
| S₁S₂ = −iS₃ cyclic, 301; `source_cyclic_products` | ZY, YX, XZ | [[0,−i],[−i,0]] = −iX; [[−i,0],[0,i]] = −iZ; [[0,−1],[1,0]] = −iY | Pass; standard order gives XY = iZ, opposite sign |
| real span of S_j = Hermitian traceless, 302 | Y | Y* = Y, tr Y = 0; dim both = 3 | Pass |
| [iS_j, iS_k] = 2iS_l, 303–304 | (1,2),(2,3),(3,1) | [iZ,iY] = −(ZY−YZ) = 2iX; likewise 2iZ, 2iY | Pass |
| Fin 3 wrap in `source_cyclic_products` | i = 2 | i+1 = 0, i+2 = 1: XZ = −iY | Pass (no junk index) |
| e₁ = X, e₂ = Z, e₁e₂ = −iY real, 307–308; `positive_generators` | XZ | [[0,−1],[1,0]] = −iY, square −Id | Pass |
| Id, X, Z, XZ basis of M₂(ℝ), 309 | coordinate matrix | det = 4 ≠ 0; (Id±Z)/2, (X±XZ)/2 give the four matrix units | Pass |
| `positiveVector_square`: v ↦ [[v₁,v₀],[v₀,−v₁]] squares to (v₀²+v₁²)Id | v = (1,0), (0,1), (1,1) | X² = Id, Z² = Id, (X+Z)² = 2Id = (1+1)Id | Pass; `realCliffordForm 2 0 v = v 0² + v 1²` at the pin (`RealForm/Basic.lean:107–113`) |
| `positiveModel` an isomorphism (needed for "compare", R05) | image | spans M₂(ℝ), dim 4 = 2² | Pass |
| quaternion i,j,k ↦ iZ, iY, iX, 311–312; `native_quaternion_dictionary` | `toComplexMatrix_apply` | i ↦ [[i,0],[0,−i]] = iZ; j ↦ [[0,1],[−1,0]] = iY; k ↦ [[0,i],[i,0]] = iX | Pass |
| quaternion products, 312; `quaternion_equations` | (iZ)(iY), (iY)(iX), (iX)(iZ) | iX, iZ, iY; each square −Id | Pass |
| composite Cl(0,2) → ℍ → M₂(ℂ) | e₁, e₂, e₁e₂ | `realCliffordZeroTwoEquivQuaternion_ι`: e₁ ↦ i, e₂ ↦ j; so e₁ ↦ iZ, e₂ ↦ iY, e₁e₂ ↦ iX | Pass; README target, not in the companion |
| recurrence assignment e_j ↦ e_j⊗Z, new pair ↦ 1⊗Y, 1⊗X, 318–319 | j = k; j ≠ k; old/new | (e_je_k+e_ke_j)⊗Z² = 2Q(e_j)⊗1 or 0; e_j⊗(ZY+YZ) = 0 | Pass as mathematics; owner wrong (R05) |
| odd permutation not a conjugation, 321–322 | (X,Y,Z) ↦ (Z,Y,X) | XYZ = i·Id, ZYX = −i·Id; conjugation fixes scalars | Pass |
| "without a sign change", 322 | (X,Y,Z) ↦ (Z,−Y,X) | H = (X+Z)/√2: HXH = Z, HYH = −Y, HZH = X | Pass |
| negative convention c(v)² = −|v|², README 89; `cliffordMultiplication_sq` | unit e; v = 0 | A² = −Id; c(0)² = 0 = −0 | Pass |
| anticommutator, `cliffordMultiplication_anticommutator` | v = w = e₁; e₁ ⊥ e₂ | 2A² = −2Id = (−2·1)Id; AB + BA = 0 = (−2·0)Id | Pass |
| `chirality` Γ = i^ℓ c(e₁)…c(e_{2ℓ}), `chirality_sq` | ℓ = 0, 1 | empty product 1, 1² = 1; (iAB)² = −(AB)² = −(−Id) = Id | Pass |
| `chirality_anticommutes` | ℓ = 1, v = e₁; V = 0 | ΓA = [[0,−1],[−1,0]] = −AΓ; 0 = 0 | Pass |
| `positiveSpinors`/`negativeSpinors`, `isCompl_spinors` | plane; S = 0 | ker(Γ−1) = ⟨e₁⟩, ker(Γ+1) = ⟨e₂⟩, complementary; both 0, IsCompl ⊥ ⊥ holds | Pass |
| `IsGeometricAction` excludes the positive convention | c(e) = 1 on ℂ | 1² = 1 ≠ −1; also 1† = 1 ≠ −1 | Pass (negative control) |
| `multiplicitySpace` | S = ℂ², E = S ⊗ ℂ³ | dim Hom_Cl(S,E) = 3; 2·3 = 6 = dim E | Pass |
| Morita evaluation generality (R02) | S = ℂ, E = ℕ →₀ ℂ | 1 ⊗ T ↦ T(1), an isomorphism; Lean theorem needs finite E | Fail of coverage, R02 |
| `realCliffordPositiveRightVector_square` | Q(e) = −1, s = 1 | involute(1)e = e; involute(e)e = −e² = 1 = (−Q e)·1 | Pass (padding, R11) |
| `realCliffordPositiveRightVector_anticommute` | v = w = e, s = 1 | C(e·1) = involute(e)e = 1; −e·C(1) = −e·e = 1 | Pass |
| `diracInFrame_eq` | frames (e₁,e₂) and (e₂,−e₁); c = 0 | c₁∂₁ + c₂∂₂ = c₂∂₂ + (−c₁)(−∂₁); 0 = 0 | Pass; n is free so n ≠ dim is a vacuous but true instance |
| `even_finrank_of_conjLinear_square_neg` | V = ℂ², J(z₁,z₂) = (−z̄₂, z̄₁); V = ℂ | J² = −Id, dim 2 even; dim 1 needs |a|² = −1, impossible | Pass |
| `even_finrank_of_quaternionicStructure` | trivial group on ℍ = ℂ² | same J, Even 2 | Pass (wrapper, R11) |
| G1.1 bivector sign, README 145 | e₁e₂ positive vs negative form | (e₁e₂)² = −e₁²e₂² = −1 in both; comparison sends e₁e₂ ↦ −e₁e₂ | Pass |
| G1.3 trace, README 233–235 | Cl(0,1), a = x + ye | L_a = [[x,−y],[y,x]]; 2^{−1}·tr = x | Pass |
| G1.3 positivity, 249 | b positive line; b = 0 line | τ(a*a) = x² + y²; e² = 0 so τ = x², null set ℝe = ideal(e) | Pass |
| G2.2 Γω = i^{ℓ+p(p−1)}∗ω, 361 | n = 2, p = 0,1,2 | Γ1 = ie₁₂, Γe₁ = ie₂, Γe₁₂ = −i; phases i, i, −i | Pass |
| G2.2 normalized HS metric 2^{−ℓ}tr(A†B), 369 | Id, A | ordinary HS norms² 2, 2; normalized 1, 1 = exterior norms² | Pass |
| G3.1 isometry gluing, 393–400 | e₁ ↦ −e₁ | (−e₁)² = −1 = e₁²; norm preserved | Pass |
| G3.4 D = d + d*, 429–431 | flat line, f + g dx | D = −g′ + f′dx = df + d*(g dx) | Pass |
| G4.3 iff, 526 | TS²; Euler-class-1 plane on S² | w₂ = 2 mod 2 = 0, lift exists; w₂ = 1, none | Pass both directions |
| G4.4 torsor, 531–533 | point, S¹, T² | 1, 2, 4 classes = |H¹(−;ℤ/2)| | Pass |
| G5.2 virtual product, 593 | two planes | ranks (1,1)×(1,1) → (2,2); virtual rank 0·0 = 0 | Pass as rank check only |
| G6.0 calibrations, 708–716 | signed point; Cl(0,4) | +1/−1; 16 = 8 + 8, a − a = 0 | Pass |
| G6.1 Leibniz and symbol, 748 | flat line c = i, s = 1, f = x | D(x·1) = i = c(dx)·1 + x·0; σ(ξ) = iξ invertible iff ξ ≠ 0 | Pass |
| G6.1 closed domain, 752–753 | periodic circle; open interval | graph norm Σ(1+k²)|ĉ_k|² = H¹; interval has nonzero boundary pairing | Pass with closedness |
| G6.3 Lichnerowicz, 801 | round S² | R^S₁₂ = −AB/2, contraction AB(−AB/2) = Id/2 = Scal/4 with Scal = 2 | Pass |
| G6.4 signature grading, 810 | S² harmonic forms | b₀ = b₂ = 1, b₁ = 0; Γ exchanges degrees 0, 2 with phases i, −i | Pass |
| G6.6 phase homotopy, 835 | t = 0, ½, 1 | multipliers 1, e^{iπ/4}, i of modulus 1 | Pass |
| G6.7 raw volume, 872–875 | n = 4, ω = e₁e₂e₃e₄ | ω² = 1; Γ = i²ω = −ω | Pass |
| G6.7 index 2α, 866–868 | kernels of quaternionic dims r, s | complex dims 2r, 2s; index 2(r − s) | Pass |

**Library declarations opened at the pins** (paths relative to the pinned library): Tau Ceti `Algebra/Quaternion/ComplexMatrix.lean:118–170` (basis and `toComplexMatrix_apply`), `LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:107–117, 603–640, 665` (`realCliffordWeight`, `realCliffordForm`, `realCliffordZeroTwoEquivQuaternion(_ι)`, `realCliffordOneOneEquivMatrix`), `Classification.lean:168–195` (private low-rank models), `BottPeriodicity.lean:495–530` (`realCliffordSignatureSwitchRecurrenceEquiv(_ι)`), `NegativePlane.lean:451–560` (real recurrences); the Tau Ceti directories `RingTheory/Morita`, `LinearAlgebra/CliffordAlgebra/ScalarTrace`, `RepresentationTheory/Spin/Polarization` named in the generated `STATUS.md` do not exist at pin 358314d4, so nothing in G1.2–G1.3 is a duplicate at this pin. Mathlib `LinearAlgebra/CliffordAlgebra/Basic.lean` (`ι_sq_scalar`, `lift`, `lift_ι_apply`), `LinearAlgebra/Trace.lean`. Cross-roadmap citations resolved on main: GeneralizedCohomology G5.5 (`README.md:1892–1938`), CharacteristicClasses C3.5 (`:901–943`), RiemannianGeometry R7 (`:1337–1397`), SpinRepresentations Layer 7 (`:883–900`), TopologicalKTheory T7, DifferentialGeometry L0–L9, SmoothBundlesConnections B1–B6.0, HopfRinow L1 and OrthogonalSpinGroups under `Completed/`; PseudodifferentialOperators P1.0/P4–P6 at the open head of #952.

## Not verifiable

- The "Rieffel quantum Riemannian notes" (README line 326): no title, year or URL; absent from the cache and from the two web searches; the only Rieffel text the sources service fetched (arXiv 0812.2884, cached as `rieffel-coadjoint` in a scratch manifest, 34 pages) contains no Pauli matrices. Recorded in `needs-references.toml`.
- Lawson–Michelsohn, *Spin Geometry*, Chapters I–II, and Atiyah–Bott–Shapiro, *Clifford modules* (DOI 10.1016/0040-9383(64)90003-5): paywalled; cited only by locator, as in the previous review. G5.2's product formula and G6.7's quaternionic structure are checked by computation above, not against these texts.
- The worker's 15-target sample: no target list or seed was supplied; the seeded sample above is this review's own.
- Ownership against open pull requests whose files the brief does not give was not checked beyond `roadmaps grep`.

## Source issues

- none (the nine Nicolaescu issues of the previous review stand and are not repeated; no new source was readable).
