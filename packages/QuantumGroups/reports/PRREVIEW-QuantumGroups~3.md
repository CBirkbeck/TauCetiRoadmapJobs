# Review of QuantumGroups (pull request #1649 at 968db79)

**Verdict:** accepted

:robot: Independent AI review of the whole folder at `968db7908dab2a377be765795f28095c7f209427` (a full review: 1641 lines changed since the head the previous review read). No file of the pull request was changed. Every finding below is P3; the gate passes; the adversarial table is in **Verified sound**. The Layer 0 ownership move is recorded there and in R03, because a human approver should weigh it.

**Status of the previous review's findings (d7a6c54 → 968db79).**

| Previous | Status at 968db79 |
| --- | --- |
| R01 (P1) admitted coproduct and PBW data | Repaired: `quantumSL2Comul_exists` and `quantumSL2PBW_exists` are existential theorems (`Suggested.lean:178`, `:191`); the gate records `sorry-data=0`. |
| R02 (P1) obsolete TemperleyLiebOperatorAlgebras A1–A6 | Repaired by ownership move: the positive Temperley–Lieb completion is now §0.4 of this roadmap, and the algebraic inputs cite TemperleyLieb Layers 0–7, which exist on main (`TemperleyLieb/README.md:254`–`:767`). |
| R03 (P2) four upward edges and scanner cycle | Repaired: VonNeumannAlgebras, HilbertModules, CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras are no longer cited; the notions moved down into Layer 0; the dependency check reports 0 problems (output below). |
| R04 (P2) missing headlines | Repaired: eleven headline theorems, including `compactType_iff`, `quantumSL2_center`, `quantumSL2_finite_semisimple`, `quantumSL2_simple_classification`, `quantumSL2_locallyFinite_iff` and `weakClosure_eq_bicommutant`; the module docstring names each layer's unstatable headlines and their missing carriers. |
| R05 (P2) re-planned pullback machinery | Repaired: §1.1 specializes CStarAlgebras C1.CommutativeMultiplierMorphisms (`CStarAlgebras/README.md:250` at its open head) and C5. |
| R06 (P3) shape | Repaired: house headings, `*Needs:*` lines, `**Checks.**` blocks, Examples and Dependencies per layer. |
| R07 (P3) Rieffel locator | Partly: the unidentifiable citation is gone, but §1.1 now carries no literature locator at all (R04 below). |
| R08 (P3) import header | Repaired: `import Mathlib` plus two `TauCeti.*` modules. |
| R09 (P3) process links | Repaired: relative roadmap links; AmenableGroups cited by Layers 1, 5, 7. |
| R10 (P3) padding | Repaired: the category helpers and the zigzag theorem are gone; 23 declarations remain, every definition used by a headline. |
| R11 (P3) namespace and names | Repaired: `namespace TauCetiRoadmap.QuantumGroups`, docstrings on every declaration, every Lean name in the README (gate `readme-ids-missing=0`). |

## R01 (P3) — Cite Malacarne by lemmas that exist

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:1058` (“Malacarne Lemmas 1.2,2.1,3.1–3.2 and proof of Theorem 4.1”) and `:1685` (“Lemmas 1.2,2.1,3.1–3.2”).

**Claim:** §6.2's finite-generator construction is located at Malacarne Lemmas 1.2, 2.1, 3.1 and 3.2.

**Witness:** the cited text (arXiv:1602.04807v1) has Lemma 1.2 (`malacarne` line 127), Lemma 2.1 (line 183), Lemma 3.1 (line 235) and then Theorem 4.1 (line 285); no statement numbered 3.2 exists.

**Repair:** cite “Lemmas 1.2, 2.1 and 3.1 and the proof of Theorem 1.1, preprint pp.2–5” in both places. The filtered-union step this roadmap attributes to “3.2” is the uniqueness and general-case paragraph at lines 275–281 and 292–312; cite it as “proof of Theorem 1.1, p.5, and Theorem 4.1, pp.5–6”.

## R02 (P3) — Locate the finite-dimensional bicommutant decomposition and the continuity facts

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:134`–`:137` (“decompose B as an orthogonal sum of matrix algebras acting with multiplicities … (Hiai §1.2, pp.3–4)”) and `:148`–`:150` (“joint strong continuity of multiplication on norm-bounded sets … (Hiai §§1.2–1.3, pp.3–5)”).

**Claim:** Hiai §§1.2–1.3 supports the finite-dimensional structure theorem and the operator-topology continuity facts.

**Witness:** `hiai` lines 93–146 (printed pp.3–5) state the double commutant theorem, Kaplansky density, normal homomorphisms, tensor products and the predual; they contain neither the finite-dimensional decomposition into matrix blocks with multiplicities nor any continuity statement for multiplication or adjoint. The nearest text is the type I_n line at `hiai` line 179 (§1.4, p.5), which is about factors only.

**Repair:** keep Hiai for the double commutant theorem and Kaplansky (pp.3–4), and give the two other claims their own locators (for instance Takesaki I, Chapter I §11 for finite-dimensional C*-algebras and Chapter II §2 for the topologies, or any standard text the author prefers), or mark them as elementary derivations from the stated API, as §0.2 does for its multiplier comparison.

## R03 (P3) — Move down only what §3.4 consumes from the Hilbert-algebra theory

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:358`–`:371` (“Construct the canonical faithful normal semifinite weight … Conversely, from any faithful normal semifinite weight build the Hilbert algebra … Do not impose a faithful state on the general weight construction”).

**Claim:** Layer 0 states only the foundations this programme needs (“needed by this programme”, `README.md:20`–`:23`).

**Witness:** the only consumer of §0.5 is §3.4 (`README.md:751`–`:758`), which identifies the Haar GNS Tomita algebra with a full left Hilbert algebra whose canonical weight is a faithful normal *state*. The semifinite-weight correspondence and the weight-level KMS uniqueness are not used by any target of Layers 1–8; they are the content of VonNeumannAlgebras Layers 10–11 at its open head (`VonNeumannAlgebras/README.md:2247`, `:2785`), which will later have to cite this roadmap for them.

**Repair:** restrict §0.5's second paragraph to the case this roadmap uses: the canonical weight on L(D) for a full left Hilbert algebra, its recovery of the state when the GNS vector is cyclic and separating, and KMS uniqueness for a faithful normal state (Hiai Theorem 2.14, p.18, `hiai` line 737, is stated exactly in that generality). Say in **Scope and ownership** that the general weight correspondence is left to a von Neumann algebra roadmap. The same minimality test passes for §§0.1–0.4: each item there is consumed by a named later target (bicommutant and normal functionals by §§3.4, 6.2; module operators and interior tensors by §§2.1–2.2; standard solutions by §§3.3, 5.2, 7.2; positive Temperley–Lieb by §7.2).

## R04 (P3) — Give §1.1 a literature locator

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:452`–`:507` (§1.1, whose `*Needs:*` line names only CStarAlgebras C1, C5 and Mathlib).

**Claim:** every theorem carries a locator.

**Witness:** §1.1 proves coassociativity, two counit identities, properness of inversion and the two inverse diagrams for an arbitrary locally compact group, with no source; the rest of the README locates every comparable target.

**Repair:** one textbook locator suffices for the standard facts (a standard textbook treatment of the C₀(G) example, such as Timmermann Chapter 4 or Kustermans–Vaes, cited by locator and recorded as `uncertified` if the text is paywalled), with the sentence that the multiplier diagrams are the elementary evaluation computations the section displays. The computed controls below confirm those computations.

## R05 (P3) — Timeless wording in the references

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:1708` (“Integration of that external code requires author coordination; …”).

**Claim:** the README is free of process narrative.

**Witness:** “requires author coordination” describes a future process, not mathematics; the preceding sentences already state what Q8 proves and what the external construction proves.

**Repair:** delete the sentence; keep “Q8 requires general σ-derivations; it extends this mathematical scope and compares the σ=id specialization.”

## R06 (P3) — Unused hypothesis in `quantumSL2Comul_exists`

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:178` (`(hq : q ≠ 0)`).

**Claim:** the coproduct exists under q≠0.

**Witness:** the coproduct exists for every q: the relation check uses only KE=q²EK, KF=q⁻²FK and EF−FE=(q−q⁻¹)⁻¹(K−K⁻¹) with Lean's totalized inverse (computed row “§8.1 coproduct respects relations” below); at q=0 or q=±1 the last relation reads EF=FE and ΔEΔF−ΔFΔE=0 still holds. This is a note, not a defect: the README states the Hopf structure under `[Fact (q≠0)]` and the hypothesis is harmless.

**Repair:** none required; dropping `hq` or keeping it are both acceptable.

## Verified sound

**Gate, build and scope.** Head `968db7908dab2a377be765795f28095c7f209427`; the worker's gate passes every check (`set_option=0`, `sorry-data=0`, `prnum=0`, `blob=0`, `readme-ids-missing=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `build=0`). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The folder's other files (`STATUS.md`, `PROGRESS.md`, `metadata.toml`) are unchanged from main. The revision reflows main's Q1–Q8 into house shape without dropping targets: every removed `Prove`/`Construct`/`Define` line of main's README reappears in a §k.n subsection (42 removed lines checked). The content checkout equals its `origin/main` (fa41b37); Mathlib and Tau Ceti checkouts match `lake-manifest.json`.

**Lean elaboration and signatures.** `lake env lean` on a copy of `Suggested.lean` exits 0 with exactly 11 `declaration uses sorry` warnings and nothing else. A scratch copy with `#check @name` for all 23 declarations inside the namespace elaborated; each type matches its README statement in generality (complex scalars, `Nontrivial A` for compact type, `IsSimpleOrder` on the subcomodule lattice for Schur, `IsScalarTower ℂ (QuantumSL2 q) V` and `FiniteDimensional ℂ V` where the README says finite-dimensional, no finiteness on the locally finite statements). The one binder the worker flagged as dropped, `[StarModule ℂ A]` on `AlgebraicHaar`, is not needed by that structure's fields; `schur_orthogonality` and `compactType_iff` retain it explicitly. **Padding probes:** replacing each of the 11 `sorry` bodies by `simp` closed none (ten “no progress”, one unsolved goal in the classification); `infer_instance` failed on `quantumSL2_domain`, `quantumSL2_finite_semisimple` and `quantumSL2_locallyFinite_semisimple`. Every `def` (`unitaryCoefficientSet`, `quantumSL2Generator`, `quantumSL2KUnit`, `quantumSL2Casimir`, `quantumInteger`, `QuantumSL2LocallyFinite`, `QuantumSL2SignedWeights`) is used by a headline; `quantumSL2KUnit` carries real proofs via `RingQuot.mkAlgHom_rel`.

**Headline coverage.** Statable and stated: bicommutant (Layer 0), weighted Schur orthogonality (3.1), compact-type characterization (4.1), coproduct existence, PBW, domain, center, finite complete reducibility, signed simple classification, local finiteness criterion and local-finiteness semisimplicity (Layer 8). Not statable and named in the docstring with the missing carrier: Haar existence (needs `A⊗_min A`, absent from pinned Mathlib), analytic corepresentations (free Hilbert modules), Hopf core/Plancherel/Tomita, universal and reduced completions, SUq(2) and O_F⁺ (universal C*-algebras), Tannaka–Krein, fusion and coamenability, Layer 8 tensor and compact comparisons (need Δ as data, which is correctly existential here). Mathlib at the pin still lists the double commutant theorem as to do (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:23`), so `weakClosure_eq_bicommutant` duplicates nothing. Kaplansky density (§0.1) is statable on the same carriers; it is a supporting lemma rather than an end theorem, so its absence is noted, not raised.

**Dependency check (unmodified output of the required command):**

```text
depcheck: 205 roadmaps, 1544 edges, 0 problem(s)
```

QuantumGroups is on main and is not listed in the merge order; every `*Needs:*` supplier is either on main (TemperleyLieb, OperatorTheory/OperatorIdeals, OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups, RepresentationTheory/LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups, PivotalSpherical) or the new-folder pull request CStarAlgebras (#860 by the same author, not yet in the merge order, placed after its last supplier by the check). The downstream consumers named in the README cite Layer 8 and do not supply it: QuantumEnvelopingAlgebras QEA1 (`QuantumEnvelopingAlgebras/README.md:105`) and HopfologicalAlgebra §2.1 (`HopfologicalAlgebra/README.md:282`). Note for those consumers: HopfologicalAlgebra line 134 still cites the Lean name `FiniteHopfModuleCat k H`, which this head no longer declares; its citation should become “QuantumGroups §8.5”.

**Ownership move recorded.** Layer 0 states, as this roadmap's own targets, notions that four open new-folder pull requests later in the merge order also build: the bicommutant theorem and normal functionals (VonNeumannAlgebras Layers 1 and 4), full left Hilbert algebras and Tomita theory (VonNeumannAlgebras Layers 10–11), Hilbert-module operators and interior tensors (HilbertModules H1–H3), C*-categories with standard conjugates (CategoricalOperatorAlgebras CA1a/CA2a) and positive Temperley–Lieb completions (TemperleyLiebOperatorAlgebras Layers 1–3). Because QuantumGroups is on main, it cannot cite those roadmaps, and the brief's rule is that the needed notion moves down; the move is minimal except for the weight-level generality of §0.5 (R03). None of the four open heads cites QuantumGroups as a supplier (CategoricalOperatorAlgebras names it only as a consumer, lines 54 and 1624), so no cycle is created. Ownership against open pull requests whose files the brief does not list was not checked.

**Supplier citations resolved (every `*Needs:*` line and table row).**

| Citation | Resolved at |
| --- | --- |
| CStarAlgebras C1.CommutativeMultiplierMorphisms, M(C₀(X))=C_b(X), strict extension | open head #860, `README.md:236`–`:262` (pullbacks, cutoff nondegeneracy, properness, composition) |
| CStarAlgebras C2 state extension; C3 matrix norms; C4 multiplicative domain; C5 C₀(X)⊗_min A ≅ C₀(X,A), slice maps; C8 Toeplitz symbol | `:269`, `:461`–`:488`, `:507`, `:565`–`:569`, `:829` |
| TemperleyLieb Layers 0–7 (trace, path models, negligible ideal, Jones–Wenzl, Karoubi envelope) | main `TemperleyLieb/README.md:254`–`:767` |
| OperatorIdeals OI-B23, OI-B29–OI-B30 (trace-class family, nuclear gauge, completeness) | main `OperatorTheory/OperatorIdeals/README.md:349`–`:352` |
| SelfAdjointSpectralTheory Parts B, C, E | main `README.md:252`, `:781`, `:1186` |
| CompactGroups Layers 0–5, `su2Irrep` | main `README.md:205`–`:318`, `:400`–`:413` |
| LieHighestWeight sl₂ worked example, `IsSl2Triple`, `sl (Fin 2) K` | main `README.md:181`–`:188`, `:323` |
| OperatorAlgebraDynamics D1–D2, Reiter P₁ | main `README.md:75`, `:143`, `:180` |
| FreeProbability F1, F3 (2√3 versus 4), F6 (semicircle) | main `README.md:127`, `:255`/`:307`, `:532` |
| AmenableGroups Layers 1, 5, 7 | main `README.md:98`, `:289`, `:415` |
| PivotalSpherical Layers 0–2, 7; `leftTrace`/`rightTrace`; `FDRep k G` | main `README.md:257`–`:318`, `:477`, `:61` |

**Pinned library declarations opened.** Mathlib: `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:70`, a star subalgebra with `centralizer_centralizer'`; the double commutant theorem is still a to-do at line 23), `ContinuousLinearMapWOT` (`Analysis/InnerProductSpace/WeakOperatorTopology.lean`), `WeakDual.isCompact_closedBall`, `PositiveLinearMap.GNS` and `gnsStarAlgHom`, `orthogonalComplement_iSup_eigenspaces_eq_bot` and `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean`), `HopfAlgebra.antipode_mul_antidistrib`, `IsGroupLikeElem` and `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean`), `Rep.equivalenceModuleMonoidAlgebra`, `ExactPairing`, `SkewPolynomial`, `IsSl2Triple`, `CStarModule`, `WithCStarModule`, `Karoubi`, `ObjectProperty.FullSubcategory`, `WithConv`. Tau Ceti: `Comodule.coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean`), `matrixComodule` (`FromMatrix.lean`), `convolutionAction`, `IsCompletelyReducible`, `fixedSubcomodule`, `Finite/{Monoidal,RightRigid,Rigid,TensorProduct}.lean`, `HopfAlgebra.antipode_antipode` and `antipodeAlgEquiv` (`Algebra/HopfAlgebra/Antipode.lean`), `FDRep.ofShrink` (`RepresentationTheory/FDRep.lean`). The entry convention of Tau Ceti's finite tensor product (`U_13 V_23`) was not re-derived from the file; the roadmap's own Checks pin it.

**Computed adversarial table.** q=1/2 unless stated; the fundamental SUq(2) matrix is u=[[a,−qc*],[c,a*]] with indices 0,1; F=[[0,1],[−2,0]] for O_F⁺; “pass” means both sides agree on the instance. Rows cover the seeded sample (0.1, 0.2, 2.1, 2.3, 3.1, 3.2, 3.3, 4.1, 6.2, 7.1, 7.2, 8.2, 8.4, 8.6, 8.7), the eleven headlines and every passage a finding touches.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 bicommutant / `weakClosure_eq_bicommutant` | M₂(ℂ): diagonal algebra; scalars; H=0 | diag: B′=diag (dim 2), B″=diag=B; scalars: B′=M₂ (dim 4), B″=ℂ (dim 1); H=0: both sides {0} | pass | none |
| 0.1 star closure needed | upper triangular 2×2 (dim 3) | B′=ℂ, B″=M₂ (dim 4) ≠ B; hypothesis `StarSubalgebra` excludes it | pass | none |
| 0.1 GNS coefficients | h=(a+b)/2 on ℂ²; point evaluation at coordinate 1 | ‖Λ(p₁)‖²=h(p₁)=1/2, ⟨Λp₁,Λp₂⟩=h(p₁p₂)=0; evaluation: ‖Λ(p₂)‖²=0 | pass | none |
| 0.1 compact spectral check | T δ_n=δ_n/(n+1) on ℓ²(ℕ); identity | tail norm after N terms 1/(N+1); identity: 1-eigenspace infinite-dimensional, not compact | pass | none |
| 0.1 normal functional norm | Tr(diag(2,1)·) on M₂ | value at I is 3, at e₁₁ is 2, norm Tr ρ=3; zero algebra has no state since 1=0 | pass | none |
| 0.1 locator | Hiai pp.3–5 | contains double commutant, Kaplansky, normality; lacks finite-dimensional decomposition and continuity facts | fail (locator) | R02 |
| 0.2 rank-one operators | ℂ², θ_(e₁,e₂) | matrix e₁₂; adjoint e₂₁; product θ_(e₁,e₂)θ_(e₂,e₁)=e₁₁ | pass | none |
| 0.2 free-module isomorphism formula | θ_(ξ⊗a,η⊗b)(ζ⊗c) | =ξ⊗a⟨η,ζ⟩b*c=(θ_(ξ,η)⊗ab*)(ζ⊗c) | pass | none |
| 0.2 noncomplemented submodule | A=C([0,1]), J={f: f(0)=0} | J^⊥: f̄g=0 for all g∈J forces f=0 on (0,1], hence f=0; J proper | pass | none |
| 0.2 module convergence versus scalar | A=K(ℓ²), a_n=p_n/√(n+1) | ‖Σ_{n≥N} a_n*a_n‖=1/(N+1)→0; Σ‖a_n‖²=Σ1/(n+1) diverges | pass | none |
| 0.2 left unitor needs nondegeneracy | A=ℂ² on ℂ by (a,b)z=az; zero action | first: φ(1)=1, A⊗_A ℂ≅ℂ; zero action: ⟨x⊗u,y⊗v⟩=⟨u,0·v⟩=0, tensor product 0 | pass | none |
| 0.2 right versus left self-module form | A=M₂, x=e₁₁, y=e₁₂ | x*y=e₁₂; yx*=e₁₂e₁₁=0 | pass | none |
| 0.2 locators | Landsman | Cor 3.2.4 straddles pp.59–60 (`landsman` 2787), Thm 3.2.5 p.60 (2801), §3.3 pp.61–63 (2858), Construction 3.5.3 p.66 (3086) | pass | none |
| 0.3 C*-norm identity | T=diag(2,1) | ‖T†T‖=4=‖T‖²; Hilbert–Schmidt gives √17 versus 5 | pass | none |
| 0.3 standard versus rescaled cups | ℂ², R=Σe_i⊗e_i; (2R, R/2) | zigzags identity in both; norms² 2,2 versus 8,1/2; standard requires equality | pass | none |
| 0.3 dimension bound | SUq(2) fundamental | intrinsic 5/2 > Hilbert 2; LR Thm 3.11 (`longo-roberts` 681): ‖R‖²‖R̄‖²≥d² with equality iff standard | pass | none |
| 0.3 antiunitary sign | J(z₁,z₂)=(−z̄₂,z̄₁); conjugation | J²=−I; conjugation²=I | pass | none |
| 0.4 normalized trace values | d=5/2, p=e/d | τ(p)=1/d²=4/25, τ(1−p)=21/25; three-term relation p_i p_(i±1) p_i=(4/25)p_i | pass | none |
| 0.4 trace radical | d=1: f₂=1−e; d=√2: TL₃ | τ(f₂†f₂)=1−1/d²=0, quotient dim 1; TL₃ dim 5, ideal (f₃) dim 1, quotient 4 | pass | none |
| 0.4 negative control | d=1/2 | τ((1−e/d)†(1−e/d))=1−4=−3<0 | pass | none |
| 0.4 signed loop | δ=−5/2 | e=−(5/2)p gives e²=(25/4)p=δe; positive e=(5/2)p likewise | pass | none |
| 0.4 truncated fusion | m=3 (d=1); d=2 | labels 0,1 with 1⊗1=0 (min(2,0)=0); at d=2, 1⊗1=0⊕2 | pass | none |
| 0.4 locators | Penneys | Thm 4.3.17 printed p.150 (`penneys` 368: positivity forces q≥1 or q=e^(πi/n), n≥3), Facts 4.4.14 p.154, Prop 4.5.3 p.158, Facts 4.5.5 p.159, Ex 4.6.12 p.163, Ex 4.6.14 p.164 | pass | none |
| 0.5 KMS sign | h=Tr(ρ·), ρ=diag(2/3,1/3) | σ_(-i)(e₁₂)=ρe₁₂ρ⁻¹=2e₁₂; h(e₁₂e₂₁)=2/3=h(e₂₁·2e₁₂)=2·(1/3); inverse sign gives 1/6 | pass | none |
| 0.5 Hiai convention | `hiai` 743–749 | f(t)=ω(σ_t(x*)y), f(t+i)=ω(yσ_t(x*)), hence ω(xy)=ω(yσ_(-i)(x)) as the README states | pass | none |
| 0.5 canonical weight | finite-rank operators in HS(ℓ²) | rank-n projection has weight n, identity ∞; `hiai` 3081–3084 states the same formula | pass | none |
| 0.5 scope | consumers of §0.5 | only §3.4, a faithful normal state; weights unused | over-general | R03 |
| 1.1 trivial group | f=2+i | Δf=εf=Sf=2+i; r₊Δf=r₋Δf=ηεf=2+i | pass | none |
| 1.1 G=ℤ, f=1[0] | (m,n)=(N,−N) | Δf(m,n)=1[m+n=0] equals 1 at every (N,−N), so not in C₀(ℤ²); norm 1=‖f‖; r₊Δf=r₋Δf≡1 | pass | R04 (locator only) |
| 1.1 S₃ order control | g=(12), h=(23), f=1[(123)] (compose right to left) | gh=(123): Δf(g,h)=1; hg=(132): Δf(h,g)=0 | pass (convention-dependent value, both orders distinguished) | none |
| 1.1 elementary tensors | a=1[1], b=1[−1] on ℤ | d(a⊗b)=ab=0; r₊(a⊗b)=aS(b)=1[1]; r₋(a⊗b)=S(a)b=1[−1]; S²=id | pass | none |
| 1.2 Haar versus evaluation | C(C₂) | h(1[e])=1/2, evaluation gives 1 | pass | none |
| 1.2 cancellation failure | monoid {1,0} absorbing 0 | points (0,1),(0,0) always agree in Δ(A)(A⊗1): dim 3<4; (1,0),(0,0) agree in Δ(A)(1⊗A): dim 3 | pass | none |
| 1.2 Fell absorption | Γ=ℤ | W(δ₁⊗δ₂)=δ₁⊗δ₃; W(λ₁⊗1)W*(δ₁⊗δ₂)=δ₂⊗δ₃=(λ₁⊗λ₁)(δ₁⊗δ₂) | pass | none |
| 2.1 trivial and zero | δξ=ξ⊗1 on ℂ; zero operator | U=1 isometric; zero fails ⟨0,0⟩=0≠1 | pass | none |
| 2.1 sign representation | C₂ | coefficient −1, tensor square (−1)²=1; direct-sum rule gives −2 | pass | none |
| 2.2 unitarization | U(s)=[[1,2],[0,−1]] | U*U=[[1,2],[2,5]]; T=(I+U*U)/2=[[1,1],[1,3]], det 2; U*TU=T recomputed entrywise | pass | none |
| 2.2 noninvertible exclusion | U=0 on ℂ | T=(id⊗h)(0)=0, no inverse | pass | none |
| 2.3 regular multiplicities | C₂; S₃ | 1+1=2; 1²+1²+2²=6 | pass | none |
| 3.1 Schur formulas / `schur_orthogonality` | SUq(2), F̃=diag(2,1/2), Tr=5/2 | h(a*a)=(F̃⁻¹)₀₀/Tr=1/5, h(c*c)=(F̃⁻¹)₁₁/Tr=4/5 agree with Woronowicz h((c*c)ⁿ)=(1−q²)/(1−q^(2n+2)); h(aa*)=F̃₀₀/Tr=4/5=1−q²·4/5; h(u₀₁u₀₁*)=q²h(c*c)=1/5=F̃₁₁/Tr | pass | none |
| 3.1 index shape of the Lean formulas | star on left | (id⊗h)Δ-invariance forces δ on the second indices for h(u_ij*u_kl), first indices for h(u_ij u_kl*); PSD in (i,k) and (j,l) respectively; one matrix Ft serves both formulas via F̃=Fᵀ | pass | none |
| 3.1 normalization uniqueness | one-dimensional character | F̃=1; rescaled 2 violates Tr F̃=Tr F̃⁻¹ (2≠1/2) | pass | none |
| 3.1 nonzero row intertwiner | unitary row i | Σ_j h(u_ij u_ij*)=h(1)=1 | pass | none |
| 3.1 Lean degenerate | H=0 | subcomodule lattice is a singleton, `IsSimpleOrder` false; no vacuous instance admitted | pass | none |
| 3.2 Plancherel norm | a+c | 1/5+4/5=1, mixed term h(a*c)=0 by weight | pass | none |
| 3.2 modular identity | θ(a)=FaF=4a | h(aa*)=4/5=4·h(a*a)=h(a*θ(a)) | pass | none |
| 3.2 characters | f_z(a)=2^z | f₀=1, f₁*f₁(a)=4=f₂(a); f_z(a*)=conj f_(−z̄)(a) consistent with S(a)=a* | pass | none |
| 3.2 Vandermonde | λ=1,2 at z=0,2 | [[1,1],[1,4]], det 3 | pass | none |
| 3.3 pivotal traces | F=I₂; F=diag(2,1/2) | 2=2; 5/2=5/2>2; tr(F diag(1,0))=2, tr(F⁻¹diag(1,0))=1/2 | pass | none |
| 3.3 S² and F | S(c)=−qc, S(c*)=−q⁻¹c* | S²(c)=q²c=c/4=(FuF⁻¹)₁₀ with F=diag(2,1/2) | pass | none |
| 3.3 Kac criterion | AM–GM | Tr F=Tr F⁻¹≥n with equality iff F=I | pass | none |
| 3.4 modular group | σ_t(a)=4^(it)a | σ_(-i)(a)=4a, h(a*σ_(-i)(a))=4/5=h(aa*); τ_(-i)(c)=c/4=S²(c) | pass | none |
| 4.1 `compactType_iff` controls | ℂ; ℂ[C₂]; zero ring; ℂ[x] primitive x | ℂ: both sides; ℂ[C₂]: h((α+βu)*(α+βu))=&#124;α&#124;²+&#124;β&#124;²>0; zero ring excluded by `Nontrivial`; ℂ[x]: invariance forces x=0, and unitarity (1+x̄Nᵀ)(1+xN)=1 forces N=0 so coefficient set {1} | pass both directions | none |
| 4.1 strict positivity route | Cauchy–Schwarz | h(a*a)=0 ⇒ h(b*a)=0 ∀b ⇒ a=0 by integral faithfulness (Timmermann 2.2.4, uncertified; standard co-Frobenius fact) | pass | none |
| 4.2 regular unitary | Γ=ℤ | U(δ₁⊗δ₂)=δ₁⊗δ₃; both pentagon words: (1,2,3)↦(1,3,6) | pass | none |
| 4.2 norms | C₂, 1+u | both C*-norms 2, Haar norm² 2 | pass | none |
| 4.3 criteria | ℤ; F₂ | Følner ratio 2/(2N+1); 2√3<4=ε(adjacency); BMT Thm 2.2 p.6, 2.8 p.10, Cor 2.9 p.11, 3.6 pp.18–19 (`bmt` 257, 461, 478, 858) | pass | none |
| 5.1 relations | (a,c)=(1,0); (0,1) at q=1 and q=1/2 | u=I₂ unitary; q=1: u=[[0,−1],[1,0]] unitary; q=1/2: aa*+q²c*c=1/4≠1 | pass | none |
| 5.1 antipode | q=1/2 | S(c)=−c/2, S(c*)=−2c*, S²(c)=c/4 | pass | none |
| 5.2 O_F⁺ data | F=[[0,1],[−2,0]] | FF̄=−2I; cup −2e₀⊗e₁+e₁⊗e₀ (Banica E=ΣF_ji e_i⊗e_j, `banica` 57), norm² 5, zigzag −2I, normalized −I; bound 5/2≥2; J(e₀)=−√2e₁ not antiunitary; n=1: u*=u, u²=1 | pass | none |
| 5.2 AM–GM | general | Tr(F*F)≥n&#124;det F&#124;^(2/n)=n&#124;c&#124;; equality iff F*F=&#124;c&#124;I | pass | none |
| 6.2 truncations | H=0; H=ℂ | quotient ℂ, not 0; A_(≤1)=ℂ⊕ℂ dim 2, square of degree-one vector has degree 2 | pass | none |
| 6.2 locators | Malacarne | Thm 1.1 p.2 (52), Lemma 1.2 p.2 (127), Lemma 2.1 pp.3–4 (183), Lemma 3.1 p.4 (235), Thm 4.1 pp.5–6 (285); “Lemma 3.2” absent | fail (locator) | R01 |
| 6.3 cancellative semigroup | C₂; {1,0} | translations bijective; 0·1=0·0 with 1≠0 fails cancellation | pass | none |
| 7.1 Haar of c*c | q=1/2; q=±1 | h(c*c)=1/(1+q²)=4/5, h((c*c)²)=1/(1+q²+q⁴)=16/21; endpoints ∫t=1/2, ∫t²=1/3 | pass | none |
| 7.1 q=−1 model | a=√(1−t)zσ₃, c=√t wσ₁ | σ₃σ₁=−σ₁σ₃ gives ac=−ca, ac*=−c*a; a*a+c*c=1; c*c=cc*=t; at t=0,z=1 the (1,1) entry sends a↦1,c↦0 | pass | none |
| 7.1 interior character | a₀=S*D, D=diag(√(1−q^(2n))) | D−1 compact (entries→0), symbol z̄, value 1 at z=1; BMT Thm 2.12 p.13 (`bmt` 614–619) uses the same representation | pass | none |
| 7.1 fusion dimensions | r₁⊗r₁ | 2·2=1+3; (5/2)²=25/4=1+21/4 with [3]_q=21/4 | pass | none |
| 7.2 sign and loop | F=[[0,1],[−2,0]] | c=−2, q=1/2 (c=−q⁻¹), d=q+q⁻¹=5/2, δ=−(q+q⁻¹)=sign(c)d=−5/2; β=c⁻²‖E‖⁴=25/4=d² (Banica (3), `banica` 72) | pass | none |
| 7.2 recurrences | n=2, d=5/2 | Hilbert 1,2,3,4; intrinsic 1,5/2,21/4,85/8 | pass | none |
| 7.2 semicircle versus n=1 | n=3; n=1 | ε(χ)=3∉[−2,2]; Catalan m₂=1,m₄=2; n=1 two-point law m₂=m₄=1; Banica abstract restricts to n≥2 (`banica` 9) | pass | none |
| 8.1 relations and PBW sign | q=1/2 | KF=q⁻²FK=4FK; K^bF^a=q^(−2ab)F^aK^b; [−2],[−1],[0],[1],[2]=−5/2,−1,0,1,5/2 | pass | none |
| 8.1 coproduct respects relations / `quantumSL2Comul_exists` | symbolic | ΔKΔE=KE⊗K+K²⊗KE=q²ΔEΔK; ΔKΔF=KF⊗1+K⊗KF=q⁻²ΔFΔK; ΔEΔF−ΔFΔE=(EF−FE)⊗K⁻¹+K⊗(EF−FE)+(KF⊗EK⁻¹−FK⊗K⁻¹E), last bracket 0 since KF=q⁻²FK and EK⁻¹=q²K⁻¹E, total (K⊗K−K⁻¹⊗K⁻¹)/(q−q⁻¹) | pass for all q | R06 (note) |
| 8.1 antipode | m(S⊗id)Δ | E: −K⁻¹E+K⁻¹E=0; F: −FKK⁻¹+F=0; S²(E)=K⁻¹EK=q⁻²E=4E | pass | none |
| 8.1 Casimir identity | symbolic | FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)²=EF+(q⁻¹K+qK⁻¹)/(q−q⁻¹)² using EF−FE=(K−K⁻¹)/(q−q⁻¹) | pass | none |
| 8.2 ladders / `quantumSL2_simple_classification` | L₂⁺; L₁⁻ | weights 1/4,1,4; F coefficients 1,5/2,0; E coefficients 0,5/2,1; EF−FE diagonal 5/2,0,−5/2=[2−2j]; L₁⁻: EF−FE=diag(−1,1)=(K−K⁻¹)/(q−q⁻¹) at K=−1/2 | pass | none |
| 8.2 relations of the Lean basis | symbolic | (EF−FE)b_j=ε([j+1][m−j]−[j][m−j+1])b_j=ε[m−2j]b_j=(K−K⁻¹)/(q−q⁻¹)b_j; KE b_j=q²EK b_j | pass | none |
| 8.3 Casimir scalars / `quantumSL2_center` | m=0,1,2 | (q^(m+1)+q^(−m−1))/(q−q⁻¹)²: 10/9, 17/9, 65/18; on L₁⁺ FE=diag(0,1), toral term diag(17/9,8/9), sum (17/9)I | pass | none |
| 8.3 commutator formula | r=1; r=m+1 on W | recovers EF−FE; EF^(m+1)w=[m+1]F^m(q^(−m)K−q^mK⁻¹)w/(q−q⁻¹)=0 with F^m injective forces K²=q^(2m) | pass | none |
| 8.3 `quantumSL2_finite_semisimple` degenerate | V=0; L₀⁻⊕L₁⁺ | zero module semisimple; dimensions 1+2=3, blocks −10/9,17/9 | pass | none |
| 8.4 `quantumSL2_locallyFinite_iff` both directions | L₀⁻; Verma λ=1; V=0 | L₀⁻: cyclic dim 1, E=F=0, K=−1=−q⁰ (signed weight, not type 1); Verma: weights 4^j, F^jv≠0 for all j, so F not locally nilpotent and cyclic span infinite; V=0: both sides true | pass | none |
| 8.4 converse route | PBW | for a K-eigenvector v: E^cv=0 for c≥N, F^aE^cv=0 for large a, K scalar; U v finite-dimensional | pass | none |
| 8.5 Clebsch–Gordan recurrence | m=n=j=1, δ=+ | α₁=−q[1]/[1]=−1/2; ΔE(v₀⊗v₁−½v₁⊗v₀)=(q−½)v₀⊗v₀=0 | pass | none |
| 8.5 Δ(E²), Δ(F²) | r=2 | middle coefficients (1+q²)EK⊗E and (1+q²)F⊗FK⁻¹, equal to q[2]_q=5/4; q⁻¹[2]_q would give 5 | pass | none |
| 8.5 pivot and traces | g=K⁻¹ | S²=Ad(K⁻¹): K⁻¹EK=q⁻²E; tr g=tr g⁻¹=5/2 on L₁⁺, −1 on L₀⁻=ε[m+1] | pass | none |
| 8.6 compact form | m=1 | h₁/h₀=[1]/([1]q⁻¹)=q=1/2; adjoint of E in Gram diag(1,1/2) is [[0,0],[2,0]]=KF; orthonormal entries √2 and 1/√2; pairing matrices diag(q,q⁻¹), [[0,q^(−1/2)],[0,0]], [[0,0],[q^(1/2),0]] agree with these | pass | none |
| 8.6 ladder cup | L₁⊗L₁ | v₀⊗v₁−qv₁⊗v₀ annihilated by ΔE (coefficient q−q=0) | pass | none |
| 8.7 classical specialization | v=1, m=1,2 | [E,F]=H=diag(1,−1), [H,E]=2E; m=2: [E,F]=diag(2,0,−2); [2]_v=v+v⁻¹→2 while the totalized quotient gives 0 | pass | none |
| Lean generality | all 23 `#check` types | binders listed above match README hypotheses; `hq` unused in `quantumSL2Comul_exists` | pass | R06 (note) |

**Sources read (legal copies, cached by the service; locators as `<id> line N`).**

- `hiai` (arXiv:2004.02383v1): §1.2 pp.3–4 lines 93–138 (double commutant theorem for unital *-subalgebras, Kaplansky density, normal homomorphisms); §1.3 pp.4–5 lines 139–146 (predual, normal positive functionals); Theorem 2.2 p.11 line 436 (Tomita, cyclic separating vector); Theorem 2.14 p.18 line 737 (KMS at β=−1 and uniqueness); §7.1 (A)–(E) pp.64–65 lines 3076–3111 (canonical weight formula, Tomita's theorem for weights, Tomita algebra). The convention matches the README's KMS sign (row “0.5 Hiai convention”).
- `landsman` (arXiv:math-ph/9807030v1): lines 2787–2812, 2858–2878, 3086–3100 as in the table.
- `longo-roberts` (arXiv:funct-an/9604008v1): §2 begins p.4 (line 123), §3 begins p.10 (line 365; the README says p.9), Lemma 3.3 p.10 (389), Definition 3.4 p.11 (408), Theorem 3.8 p.15 (621), Theorem 3.11 p.17 (681), Appendix p.48 (2000).
- `penneys` (author page, Chapter 4): printed pages confirmed from the page footers (lines 365, 551, 754, 790, 959, 1016).
- `bmt` (arXiv:math/0010248v1): lines 257, 461, 478, 592–624, 614, 645, 858–865; the interior SUq(2) theorem is for 0<&#124;q&#124;<1, as the README states.
- `malacarne` (arXiv:1602.04807v1): lines 52, 127, 183, 235, 275–281, 285–312.
- `banica` (arXiv:math/9806063v5): lines 9–11, 42–46, 54–57, 65–72, 75.
- `virelizier` (author page): Lemma 2.3 p.6 (265), Proposition 2.4 p.8 (358, S²=Ad(K⁻¹) and the F^mK^nE^p spanning set), Example 3.3 p.11 (552, nonsymmetric ladder normalization, as the README notes), Proposition 3.7 and Corollary 3.8 p.12 (585, 594), Theorem 3.13 and Corollary 3.14 p.13 (625, 635), Proposition 4.1 pp.13–14 (644).
- `egno` (author page): §§5.1–5.3 at lines 4753–4835, cited only as background.

## Not verifiable

- **Timmermann, *An Invitation to Quantum Groups and Duality*** (Definitions 5.1.1, 5.1.4, Theorem 5.1.6, Theorem 5.3.3, Propositions 5.3.7–5.3.8, Theorems 5.4.1, 5.4.3, 5.4.5, Propositions 2.2.4, 3.2.9, 3.2.17, Theorem 3.2.12, Theorem 3.2.19, Remark 2.2.2(iv)(c), Chapter 6 §2): the publisher page for DOI 10.4171/043 states that a subscription is required; the sources service found no legal text and recorded the request in `needs-references.toml`. These locators, which carry the seeded targets 2.1, 2.3, 3.1, 3.2, 3.3, 4.1 and part of 7.1, 8.6, remain uncertified. The mathematics of those targets was checked independently in the table above and against BMT, Virelizier and the standard SUq(2) Haar values.
- **Takesaki, *Theory of Operator Algebras II*** (VI.1, VII.1–VII.2, Theorems VII.2.5–VII.2.6): paywalled; recorded as uncertified by the service. Hiai §7.1 (A)–(C) states the same canonical-weight and KMS-uniqueness results without proof, which is what the review relied on.
- **Tau Ceti's finite tensor-product entry convention** (`Comodule/Finite/TensorProduct.lean`): the file exists at the pin, but its entry formula was not re-derived; the README's own `U_13 V_23` Checks are consistent with its claimed convention.
- **Generality beyond the computed instances**: the table does not prove the nonseparable Peter–Weyl theorem, Tannaka reconstruction, the finite-dimensional complete-reducibility argument with generalized weights, or the Biedenharn–Elliott pentagon; those were assessed through their stated hypotheses, routes, owned inputs and the source readings above.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type classification holds for every n; it should be restricted to n≥2 as in its abstract, since n=1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says all displayed quantum numbers are units; it should exclude the zero-index number, which is zero; affects nothing.
