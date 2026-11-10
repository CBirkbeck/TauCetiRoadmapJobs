# Review of QuantumGroups (pull request #1649 at 5155098)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuantumGroups/` at `5155098`, the head the previous review (`~31`) also read; nothing in the folder has changed since. The gate passes and the dependency check reports no problem. `Suggested.lean` elaborates with only its four `sorry` warnings.

- **One finding (P3), new, actionable in the folder:** the docstrings of the headline `schur_orthogonality` and of `AlgebraicHaar` do not state the mathematics.
- **The two findings of `~31` are settled, not carried.** The repair report on `~29` marked them "not actionable in this package", and on re-checking that reason holds (see "Previous findings"). Their current state is recorded there for the final approver.

Locations are in `TauCetiRoadmap/QuantumGroups/Suggested.lean` unless stated otherwise.

## R01 (P3) — Two `Suggested.lean` docstrings do not state the mathematics

**Location:** `:81–82`, the docstring of the Layer 3 headline: "The matrix Ft is the pre-antipode F̃ in the README, rather than its transpose F. Star preservation of the coproduct is the native `TauCeti.StarCoalgebra`." Also `:69`, the docstring of `AlgebraicHaar`: "Haar invariance on the core is stated by actual slice equations."

**Claim:** the Lean form rule asks for a docstring on every declaration stating the mathematics. The headline's docstring names no hypothesis, no conclusion and no source; it only fixes the name `Ft`. The structure's docstring says how invariance is written, but not that the structure is a normalized positive two-sided invariant integral. The other four declarations comply (`:102`, `:109–110`, `:117–121`, `:127–129`).

**Witness:** read `:81–82` against `:109–110`. The latter states its equivalence and cites a theorem; the former mentions neither orthogonality relation, irreducibility, unitarity nor the normalization `Tr F̃ = Tr F̃⁻¹`.

**Repair:**
- Replace `:81–82` with: "Weighted Schur orthogonality (§3.1). Let `h` be a positive normalized two-sided invariant integral on a Hopf star algebra and `u` the coefficient matrix, in an orthonormal basis, of an irreducible finite-dimensional comodule, assumed unitary. Then there is a positive definite `F̃` (`Ft`) with `Tr F̃ = Tr F̃⁻¹`, `h(u_ij* u_kl) = δ_jl (F̃⁻¹)_ik / Tr F̃⁻¹` and `h(u_ij u_kl*) = δ_ik F̃_jl / Tr F̃`. `F̃` is the transpose of Woronowicz's `F` (Neshveyev–Tuset, Theorem 1.4.2, pp. 9–10, where `F̃ = ρᵗ`). Star preservation of the coproduct is the native `TauCeti.StarCoalgebra`."
- Replace `:69` with: "A positive normalized two-sided invariant integral: a linear functional `h` with `h 1 = 1`, `(id ⊗ h) Δ a = h a • 1`, `(h ⊗ id) Δ a = h a • 1` and `0 ≤ h (a⋆ a)` (§3.1)."
- **Tested on SUq(2) at q=1/2:** with `F̃ = diag(2, 1/2)` the stated formulas give `h(a*a) = (1/2)/(5/2) = 1/5` and `h(aa*) = 2/(5/2) = 4/5`, matching the README Checks at `README.md:663` and `:868`. NT Theorem 1.4.2(i) (`nt` line 450) gives `h(u_ij u_kl*) = δ_ik ρ_lj / dim_q`, which is `F̃_jl` for `F̃ = ρᵗ`.
- **Test of the `AlgebraicHaar` text:** on ℂ[C₂] the counit violates the stated left invariance, since `(id⊗ε)Δu = u ≠ 1 = ε(u)·1`.
- No statement changes, so the six elaborated signatures stay as recorded below.

## Previous findings

Each finding of `~31`, checked against this head and the sibling heads.

- **R01 (P2, Layer 0 has two claimed owners): not repaired; settled.**
  - **State at the open heads.** Both are unchanged since `~31`. CategoricalOperatorAlgebras at `b9c0a6f`, `README.md:44–46`, still says CA1a and CA2a "have their single home here; QuantumGroups consumes CA1a and CA2a"; `:2625` repeats it. TemperleyLiebOperatorAlgebras at `ba43cc7`, `README.md:72–76`, still makes "the sign isomorphism 2.1 … the single home" of the trace-radical identification, and builds `s` at `:1152–1158`. This head still assigns them to §§0.1–0.2 (`README.md:29–46`, `:1741–1746`).
  - **Why it is settled.** The repair report on `~29` (H02) answered that no edit in this folder repairs it, and that reason is right. Under the ownership rule, a roadmap on main is earlier than every open one, and the open roadmap cites it. QuantumGroups is on main and cannot consume either open roadmap, so this head's allocation is the admissible one, and the citations must come from #888 and #867.
  - **Not re-raised.** No folder edit would change the outcome. The final approver should know that both sibling heads still claim these objects.
- **R02 (P3, stale description, unordered conflict with #1705): partly repaired; the rest settled.**
  - **Repaired:** the description's merge-order block now reads "`QuantumGroups`: **this pull request** → #1705", which states the order of the two conflicting heads.
  - **Still stale:** the description still opens "Current head `d7a6c540…`" and says "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged". `git diff --stat origin/main...HEAD` shows 1306 insertions and 524 deletions across `README.md` and `Suggested.lean`.
  - **Why it is settled.** The repair report on `~29` (H03) answered that a repair does not edit pull-request text, which is right. The author can correct the description before final approval.

## Verified sound

**Gate.** Rerun on this head: every scanner reports 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the same as main's `lake-manifest.json`.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 235 roadmaps, 2269 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. Every supplier is on main: CStarAlgebras, VonNeumannAlgebras, HilbertModules, TemperleyLieb, Subfactors, OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups, RepresentationTheory/LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups and PivotalSpherical. No forbidden roadmap is cited.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`) and nothing else.

**Elaborated signatures.** I put `#check @name` for all six declarations in a scratch copy and elaborated it. The types match `scratch/signatures.md` and the README statements. The flagged `[StarModule ℂ A]` is absent only from `AlgebraicHaar`, none of whose fields uses it. `schur_orthogonality` keeps it with every binder it needs (`IsSimpleOrder (Subcomodule ℂ A H)`, `OrthonormalBasis ι ℂ H`, the unitarity hypothesis). `compactType_iff` carries `[Nontrivial A]`. I changed nothing.

**Padding probe.** I made six scratch copies, each trying one tactic on every theorem before falling back to `sorry`: `rfl`, `simp`, `infer_instance`, `trivial`, `aesop` and `exact ⟨_, rfl⟩`. All 24 probes left every theorem with its `sorry` warning, so nothing closes in one tactic. `unitaryCoefficientSet` and `AlgebraicHaar` are the two definitions the headlines need; neither restates a library notion. A grep of both pins for a Hopf integral, a minimal C*-tensor product and dagger or C*-categories finds none.

**Headline theorems.** The README's headlines and how each is handled:

| Headline (README) | Handling |
| --- | --- |
| Weighted Schur orthogonality (§3.1) | stated, `schur_orthogonality` |
| Compact-type characterization (§4.1) | stated, `compactType_iff` |
| Unique modular automorphism of the Haar integral (§§3.2, 4.1) | stated, `haar_modular_automorphism` |
| Kac equivalence: Haar is a trace iff S²=id (§§3.3, 4.1) | stated, `haar_trace_iff_antipode_involutive` |
| Layer 0: standard solutions, fiber functors and the TL comparison; Layer 1: Haar existence on C*-bialgebras; Layer 2: analytic Peter–Weyl; Layer 4: completions and coamenability; Layers 5–7: SUq(2), O_F^+, Tannaka–Krein, Banica fusion | named in the module docstring as not statable. Missing carriers: C*-categories, ⊗min and universal C*-algebras (absent at both pins, checked by grep) |
| Layer 8 classification, complete reducibility, local finiteness and Clebsch–Gordan | proved at the Tau Ceti pin, as the docstring says; all 103 `TauCeti.*` names in the README match a declaration at the pin |
| Layer 8 Biedenharn–Elliott pentagon and the §8.6 compact comparison | named as not statable (recoupling exists only for triple products; analytic SUq(2) is missing) |

**Seeded sample.** Every locator was checked at its text: theorem number, printed page, hypotheses, and that the source supports the statement as written. The README flags no locator as unverified.

- **0.1:**
  - Longo–Roberts, `longoroberts`: §2 at line 123 (p.4), C*-property at line 132; Lemma 3.3 at line 389 (p.10); Theorem 3.8 at line 621 (p.15); Theorem 3.11 at line 681 (p.17), where equality holds iff a multiple of R is standard, matching `README.md:221–223`; Appendix at lines 2000–2050 (pp.48–49).
  - Neshveyev–Tuset, `nt`: §2.2 at lines 1283–1617 (pp.29–36); §2.5 at line 2431 (p.52), whose normalization R̄=−τR gives τ=−ε as `README.md:232–233` says.
- **1.2, 2.1, 3.1, 3.2, 3.3:** these cite Timmermann, recorded uncertified (see Not verifiable). Cross-checked against `nt`:
  - Theorem 1.2.1 at line 218 (p.4) builds the Haar state from Cesàro means with no separability assumption, as §1.2 plans.
  - Theorem 1.4.2 at line 447 (pp.9–10) gives both §3.1 orthogonality forms, with `F̃ = ρᵗ`.
  - Definition 1.7.1 and Proposition 1.7.2 at lines 941–959 (p.21) give the §3.2 character laws, including `f̄_z = f_{−z̄}`.
  - Proposition 1.7.5 at line 1014 gives `S²(U) = ρUρ⁻¹`.
- **4.1:** `nt` Theorem 1.6.6 at line 810 (p.18), Theorem 1.7.3 at line 977 (p.22) and Proposition 1.7.7 (ii)⇔(iii) at line 1036 (p.23) support `compactType_iff`, `haar_modular_automorphism` and `haar_trace_iff_antipode_involutive` as stated.
- **4.3:** Bédos–Murphy–Tuset, `bmt`: Theorem 2.2 at line 257 (p.6), Theorem 2.8 at line 461 (p.10), Corollary 2.9 at line 478 (p.11), Theorem 2.12 at line 614 (p.13, for `0<|q|<1`), Corollary 2.13 at line 645 (p.14) and Theorem 3.6 at line 858 (pp.18–19).
- **6.3:** Malacarne, `malacarne`, Theorem 4.1 at line 285 (pp.5–6), including uniqueness of the Hopf *-algebra. Also Theorem 1.1, Lemma 1.2 (p.2), Lemma 2.1 (p.3) and Lemma 3.1 (p.4), the latter three cited by §6.2.
- **7.2:** Banica, `banica`, Theorem 1 at line 42 (p.2), Proposition 1 and Lemma 1 at lines 54 and 65, Proposition 2 at line 75 (pp.2–3), with `β = c⁻²‖E(1)‖⁴` at line 72.
- **8.1:** Virelizier, `virelizier`, §2.3 and Proposition 2.4 at lines 348–359 (p.8): the coproduct, `S(E) = −K⁻¹E` and `S² = Ad(K⁻¹)` match `README.md:1362–1363`.
- **8.3:** `virelizier` Theorem 3.13 and Corollary 3.14 at lines 625 and 635 (p.13).
- **8.4:** `virelizier` §3.2 at line 529 (p.11): type 1 means a direct sum of the qⁿ-eigenspaces.
- **8.5:** `virelizier` Lemma 2.3 at line 265 (p.6) and Proposition 4.1 at line 644 (pp.13–14).
- **8.7:** `virelizier` Example 3.3 at line 552 (p.11). Its E-coefficient simplifies to [i][n−i+1], so it has no misprint.
- **Also checked:** Kustermans–Vaes, `kustermansvaes`, Definition 2.1 at line 743 (p.853), for §1.1.
- **External repository:** the formalization cited at `README.md:1803` was read at its pinned commit. It declares `rightMul_assoc_of_ring` and `oreLift` over a noncommutative `Ring B`, with a derivation and no σ, as the README says.

**Library declarations opened (file:line at the pin), 38 in all.**

Tau Ceti `2fd255d`:
- **Comodules:**
  - `Comodule.coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:69`), with `coact_basis_eq_sum_coefficientMatrix` (`:110`, column convention) and `comul_coefficientMatrix_eq_sum` (`:118`, `Δu_ij = Σ u_ik ⊗ u_kj`).
  - `tensorCombine_tmul_tmul` (`Comodule/TensorProduct.lean:99`; coefficient `c*d`, so `(u⊠v)_((i,k),(j,l)) = u_ij v_kl`).
  - `StarCoalgebra` (`Algebra/Coalgebra/Star.lean:46`) with `counit_star` (`:91`); `Subcomodule` (`Subcomodule/Basic.lean:73`).
  - `HopfAlgebra.antipode_antipode` (`Algebra/HopfAlgebra/Antipode.lean:91`, commutative only) and `antipodeAlgEquiv` (`:100`).
  - `FGComoduleCat.instRightRigidCategory` (`Comodule/Finite/RightRigid.lean:246`) and `instRigidCategory` (`Finite/Rigid.lean:47`, commutative H), which leave §3.3's S⁻¹ left duals unduplicated.
  - `Coalgebra.IsLinearlyReductive` (`Comodule/LinearlyReductive.lean:249`), `iSup_matrixCoefficientSubmodule_eq_top` (`LinearlyReductive/Cosemisimple.lean:47`), `Comodule.matrixCoefficientTensor_injective` (`MatrixCoefficient/Simple.lean:44`) and `finrank_matrixCoefficientSubcoalgebra` (`:82`). These give spanning for linearly reductive coalgebras and independence within a single simple block. Both are weaker than the §§3.1/4.1 targets, which need independence across inequivalent irreducibles and unitarity, so they are not duplicated.
- **Quantum integers and U_q(sl₂):**
  - `IsGenericQuantumParameter` (`QuantumGroups/QuantumInteger/Basic.lean:33`, nonzero and no positive power equal to 1) and `quantumInteger` (`:150`).
  - `UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` (`QuantumGroups/UqSl2/TypeOne.lean:370`) and `LadderModule.not_isTypeOne` (`:253`).
  - `instIsDomain` (`UqSl2/OreTower.lean:350`), `instHopfAlgebra` (`UqSl2/Hopf.lean:167`), `instStarRing` and `instStarCoalgebra` (`UqSl2/Star.lean:156`, `:202`), and `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (`UqSl2/QuantumTrace.lean:41`).
- **Hopf-module category:**
  - `FiniteHopfModuleCat.instMonoidalCategory` (`Algebra/Category/FiniteHopfModuleCat/Monoidal.lean:220`) and `instRightRigidCategory` (`RightRigid.lean:123`).
  - `unitEvalNatIso` (`Pivotal.lean:119`) and `unitEvalNatIso_isMonoidal` (`:221`).
  - `ofShrink` and `ofShrinkEquiv` (`Basic.lean:227`, `:234`); `FDRep.ofShrink` (`RepresentationTheory/FDRep/Basic.lean:314`).
  - `HopfAlgebra.antipode_bijective_of_antipode_antipode` (`Algebra/HopfAlgebra/InverseAntipode.lean:36`).
- **Temperley–Lieb:** `TemperleyLieb.jonesWenzl` (`Algebra/TemperleyLieb/JonesWenzl.lean:122`).

Mathlib `1b1ccf4`:
- **Spectral theory:** `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` (`Analysis/InnerProductSpace/Spectrum.lean:436`, in the namespace opened at `:422`) and `finite_dimensional_eigenspace` (`:456`, with `μ ≠ 0`, as the README says).
- **Operator algebras:** `PositiveLinearMap.GNS` and `gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`); `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:70`).
- **Hopf algebras and modules:** `HopfAlgebra.antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean:63`); `IsSemisimpleModule.extension_property` and `lifting_property` (`RingTheory/SimpleModule/Basic.lean:255`, `:261`); `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`).
- **Categories:** `CategoryTheory.Idempotents.Karoubi` (`CategoryTheory/Idempotents/Karoubi.lean:43`); `ExactPairing` (`CategoryTheory/Monoidal/Rigid/Basic.lean:78`).
- **Other:** `WithConv` (`Algebra/WithConv.lean`).

**Cross-roadmap citations resolved on main (`f8836c4`), 12 suppliers and 2 consumers.**
- **CStarAlgebras:** §1.8 C1.CommutativeMultiplierMorphisms (`:497–521`: pullbacks, compact-cutoff nondegeneracy, properness, composition); §5.2 (`:1143–1166`: `C₀(X)⊗min A ≅ C₀(X,A)` for locally compact X, and `C(X×Y)` only for compact X, Y, exactly as `README.md:18–22` says); C2.1 (`:544`), C4.1 (`:986`), C8.4 Toeplitz (`:1676`).
- **VonNeumannAlgebras:** Layers 0, 1, 3, 4 (`:275`, `:392`, `:905`, `:970`); V4.Core, PositivePredual and Normality (`:244`); V10.ModularTheory (`:2364`); V10.KMS with uniqueness for faithful normal states (`:2459–2463`); Layer 11's full left Hilbert algebras, Tomita theorem and canonical weight (`:2794–2806`).
- **HilbertModules:** H1 (`:126`), H2 (`:179`; `L_A(E)≅M(K_A(E))` at `:203`, `K_A(H⊗A)≅K(H)⊗min A` at `:209`), H3 (`:262`).
- **TemperleyLieb:** `TLCat.lift` with `ExactPairing V V` and `TLCat.lift_unique` (`:459–473`); `presentedTLEquiv` (`:564`); Layer 6 Jones–Wenzl with `existsUnique_jonesWenzl` (`:682–708`).
- **Subfactors:** 3.1 (`:676`); 3.2 with `markovTrace_nonneg_iff` (`:729`), `jonesLoopParameters` (`:731`) and the pullback criterion, where injectivity is not needed (`:752–754`); 3.3 (`:774`).
- **Spectral, compact-group and Lie suppliers:** OperatorTheory/SelfAdjointSpectralTheory Part B (`:252`); CompactGroups `su2Irrep` (`:190`) and coefficient `π_{v,w}(g)=⟨π g v,w⟩` (`:170`), the conjugate of this roadmap's `u_ij`, as `README.md:474–475` says; LieHighestWeight `IsSl2Triple` (`:4–19`).
- **Group-algebra and amenability suppliers:** OperatorAlgebraDynamics D1 and D2 (`:148`, `:221`, Reiter P₁/P₂ at `:258–261`); FreeProbability F1, F3 and F6 (`:127`, `:255`, `:532`; norm `2sqrt3` against 4 at `:303–307`); AmenableGroups Layers 1, 5, 7 (`:98`, `:289`, `:415`); PivotalSpherical Layers 0–2 and 7 (`:257`, `:283`, `:318`, `:477`).
- **Consumers:** QuantumEnvelopingAlgebras QEA1 (`:323`) cites "QuantumGroups Q8" with the same coproduct (`:88`); HopfologicalAlgebra §2.1 (`:317`) cites "Q8 item 5" (`:40`, `:165`). Both resolve under the map in `README.md:195–198`.

**Overlap and ownership.**
- `scratch/overlaps.md`: no dropped id in either direction, no id defined only by an open revision. #1705 conflicts, with its order now stated.
- `scratch/citations.md`: nothing unresolved.
- `roadmaps grep` for the six declaration names: none is declared in another open roadmap. NoncompactQuantumSymmetry (#1015) owns no locally compact quantum group or `C₀(G)` coproduct, and CompactGroups (#1047) only cites classical `ContRepresentation.schur_orthogonality`. The Layer 0 overlap with #888 and #867 is recorded under Previous findings.

**Adversarial table** (all values computed in this review):

| # | Statement (README line or Lean decl) | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.1 minimal norm product; rescaling not standard (`:219–223`, `:253–254`) | R=2e₀⊗e₀+e₁⊗e₁, R̄=½e₀⊗e₀+e₁⊗e₁; standard pair rescaled by 2, ½ | zigzags ½·2=1, 1·1=1; ‖R‖‖R̄‖=√5·√(5/4)=5/2>2; rescaled squared norms 8 and ½, product 2, traces scale 4 and ¼ | pass | none |
| 2 | §0.1 signed self-duality (`:229–233`, `:256–257`) | SU(2) cup; symmetric cup; J | R=[[0,1],[−1,0]] gives R̄R=−I, so ε=−1; I gives +1; J²(z₁,z₂)=(−z₁,−z₂); NT τ=−ε | pass | none |
| 3 | §0.1 C*-identity Checks (`:251–252`) | diag(2,1); [[1,1],[0,0]] | ‖T†T‖=4=‖T‖²; HS √17 against 5; ‖[[1,1],[0,0]]‖=√2 | pass | none |
| 4 | §0.2 closure formula and signed loop (`:274–280`, `:347`) | X=ℂ², ε=−1, d=2 | e=−RR*, e²=R(R*R)R*=2RR*=−2e; n=1: ε·T₁(1)=(−1)(−2)=2=R*R; Φ(cup)†=R*=ε(εR*) | pass | none |
| 5 | §0.2 tr_n(sx)=(−1)ⁿtr′_n(x) (`:294–300`) | strand step; Markov step; n=2 | (−1)^{n+2}(−δ)=δ(−1)^{n+1}; s⁻¹(incl x·e_last)=−incl(s⁻¹x)e_last gives (−1)^{n+1}tr′_{n+1}; T₂(se)=−d=T₂^{(−d)}(e) | pass | none |
| 6 | §0.2 pullback criterion applied (`:315–316`) | ρ=Φ_R∘s⁻¹, σ_n=d⁻ⁿR_n*(·⊗1)R_n on the image | σ_n∘ρ_n(y)=d⁻ⁿ(−1)ⁿT_n^{(−d)}(s⁻¹y)=d⁻ⁿT_n^{(d)}(y); tracial on the image; Subfactors `:752–754` needs no injectivity | pass | none |
| 7 | §0.2 Checks d=3/2 and full Φ_R (`:324–330`, `:350`) | d=3/2; X=sign of C₂ at d=1 | [3]=5/4, [4]=3/8, [5]=−11/16; at d=1, X≇1 gives Hom(X,1)=0 and full Φ_R, f₂ in the radical | pass | none |
| 8 | §1.1 C₀ identification and diagrams (`:377–437`) | ℤ; S₃ | {\|F(x)(y)\|≥ε}⊆K×⋃L_i; Δ1[0](N,−N)=1∉C₀; r₊(1[1]⊗1[−1])=1[1]; (12)(23)=(123), (23)(12)=(132) | pass | none |
| 9 | §1.2 cancellation, Haar, Fell absorption (`:443–498`) | monoid {1,0}; C(C₂); ℤ | span of Δ(A)(A⊗1) has dim 2+1=3<4; h(1[e])=½≠1=ε(1[e]); W(λ_s⊗1)W*(δ_g⊗δ_k)=δ_{sg}⊗δ_{sk} | pass | none |
| 10 | §2.1 column convention (`:549`) | S₃ permutation representation | u₁₃(σ)=1 iff σ(3)=1: (123)(3)=1, (132)(3)=2 | pass | none |
| 11 | §2.2 averaging (`:555–558`, `:576`) | C₂, U(s)=[[1,2],[0,−1]] | U(s)²=I; U*U=[[1,2],[2,5]]; T=[[1,1],[1,3]], det 2; U*TU=T; identity by right invariance on legs 1,3 | pass | none |
| 12 | `schur_orthogonality` (Lean `:83`, §3.1) | SUq(2) at q=½; u=I₂ reducible; ℂ trivial | F̃=diag(2,½): (½)/(5/2)=1/5=h(a*a), 2/(5/2)=4/5=h(c*c) and h(aa*); h(u₁₂u₁₂*)=q²·4/5=1/5=(½)/(5/2); NT 1.4.2 gives F̃=ρᵗ; I₂: h(u₁₁*u₂₂)=1 against δ_jl=0, excluded by `IsSimpleOrder`; ℂ: Ft=1 | pass | R01 (docstring) |
| 13 | `AlgebraicHaar` (Lean `:70`) | ℂ[C₂]; counit; zero functional | h((1+u)*(1+u))=2, h(u)=0; (id⊗ε)Δu=u≠ε(u)1=1; zero gives h(1)=0≠1 | pass | R01 (docstring) |
| 14 | `unitaryCoefficientSet` (Lean `:103`) | ℂ[C₂]; n=0; zero ring | v↦v⊗u gives [u], unitary; Fin 0 gives nothing; over 0 no comodule on ℂⁿ for n≥1 | pass | none |
| 15 | `compactType_iff` (Lean `:111`, §4.1) | ℂ; zero ring; ℂ[x] primitive | ℂ: both true; zero ring: RHS true, LHS false, excluded by `[Nontrivial A]`; ℂ[x]: (id⊗h)Δx=x+h(x)≠h(x)1, both false; NT 1.6.6 | pass | none |
| 16 | `haar_modular_automorphism` (Lean `:122`) | SUq(2) q=½; ℂ[S₃] | σ_{−i}(U)=ρUρ (NT 1.7.3): θ(a)=4a, h(aa*)=4/5=h(a*·4a); θ⁻¹ gives 1/20; ℂ[S₃] θ=id; uniqueness from faithfulness | pass | none |
| 17 | `haar_trace_iff_antipode_involutive` (Lean `:130`) | ℂ[S₃]; SUq(2) | δ_{gk,e}=δ_{kg,e} and S²u_g=u_g; h(aa*)=4/5≠1/5=h(a*a) and S²(c)=c/4≠c | pass | none |
| 18 | §3.2 characters, θ multiplicative, Vandermonde (`:675–700`) | SUq(2) q=½; λ=1,2 | f₁*f₁(a)=4+f₁(−qc*)f₁(c)=4=f₂(a); h(cθ(ab))=h(abc)=h(cθ(a)θ(b)); [[1,1],[1,4]] det 3 | pass | none |
| 19 | §3.3 traces and intrinsic dimension (`:731–744`, `:758`) | F=diag(2,½) | tr(F·diag(1,0))=2, tr(F⁻¹·diag(1,0))=½; d=5/2; metric on V** F⁻² makes j unitary; Tr F=Tr F⁻¹ forces Tr F≥n | pass | none |
| 20 | §3.4 KMS sign (`:771`, `:794–795`) | ρ-model φ=Tr(ρ·) | φ(xσ_{−i}(y))=Tr(ρxρyρ⁻¹)=φ(yx) for σ_t=ρ^{it}·ρ^{−it}; σ_t(c)=c, τ_{−i}(c)=c/4 | pass | none |
| 21 | §4.2 regular unitary (`:885–892`, `:913`) | Γ=ℤ | inner product (h⊗h)((1⊗b*)Δ(a*c)(1⊗d))=h(a*c)h(b*d); both pentagon words send (1,2,3) to (1,3,6) | pass | none |
| 22 | §4.3 criteria (`:921–948`, `:961–963`) | ℤ; F₂ | BMT 2.2, 2.8, 2.9, 3.6 as stated; Følner 2/(2N+1); Kesten 2√(2·2−1)=2√3<4 | pass | none |
| 23 | §5.2 cup and AM–GM (`:1024–1036`, `:1049–1051`) | F=[[0,1],[−2,0]] | F²=−2I; E=−2e₀⊗e₁+e₁⊗e₀, ‖E‖²=5; J(e₀)=−√2e₁; Tr F*F=5≥2·2; \|det F\|²=4=c² | pass | none |
| 24 | §6.3 uniqueness and commutative case (`:1149–1168`, `:1177–1179`) | {e}→C₂; {1,0}; C(C₂) | (a,b)↦a; 0·1=0·0 with 1≠0; Haar ½,½; Malacarne 4.1 uniqueness of the Hopf *-algebra | pass | none |
| 25 | §7.1 Haar and the q=−1 model (`:1199–1232`, `:1242–1244`) | q=½; q=−1 | 1/(1+q²)=4/5; (1−q²)/(1−q⁶)=16/21; endpoint ½, ⅓; ac=−ca and a*a+c*c=1 in the σ-model; multiplicative-domain step φ(a*a)=χ(a₀*a₀)=1 | pass | none |
| 26 | §7.2 Banica, n=2 normal form (`:1250–1290`, `:1300–1302`) | F=[[0,1],[−q⁻¹,0]]; F=I₂ | F²=−q⁻¹I, d=\|q\|+\|q\|⁻¹; FūF⁻¹=[[a,−qc*],[c,a*]]; I₂ gives q=−1, VVᵗ=[[0,1],[1,0]] for V=(1/√2)[[1,i],[1,−i]]; dims 1, 5/2, 21/4, 85/8 | pass | none |
| 27 | §8.1 relations and Hopf convention (`:1325–1363`, `:1383–1386`) | q=½; q=0, ±1 | L₁⁺: EF−FE=diag(1,−1)=(K−K⁻¹)/(−3/2); S²(E)=K⁻¹EK=Ad(K⁻¹)E; q=0: KE=0 forces E=0 | pass | none |
| 28 | §8.3 Casimir separation (`:1441–1449`, `:1488–1490`) | q=½; signs ε≠ε′ | 10/9, 17/9, 65/18; ε=−ε′ needs q^{m−m′}=−1 or q^{m+m′+2}=−1, impossible at a generic q | pass | none |
| 29 | §8.4 type 1 (`:1504–1518`, `:1528–1530`) | L₀⁻; Verma of weight 1 | \|q^k\|=2^{−k}=1 only at k=0 and q⁰≠−1; F^jv₀ has weight 4^j | pass | none |
| 30 | §8.5 CG coefficients and Δ(E^r) (`:1602–1615`, `:1647–1650`) | m=n=j=1, q=½; r=2 | coefficient of v_i⊗v_{j−i−1}: α_{i+1}ε[m−i]+α_iεq^{m−2i}δ[n−j+i+1]=0; α₁=−½; middle term (1+q²)EK⊗E=q[2] | pass | none |
| 31 | §8.6 pairing (`:1671–1677`, `:1688–1690`) | q=½ | ⟨K,·⟩ multiplicative (a*a+c*c↦1); ⟨E,ac*⟩=−q^{−1/2}=q⟨E,c*a⟩; h₁=q; E*=KF | pass | none |
| 32 | §8.7 specialization (`:1696–1707`, `:1723–1725`) | v=1, m=2 | F coefficients 1, 2, 0; E coefficients 0, 2, 1; [E,F]=diag(2,0,−2) | pass | none |
| 33 | Docstrings `:69`, `:81–82` against the Lean form rule | read against `:109–110` | no hypothesis, conclusion or source at `:81–82` | fail | R01 |
| 34 | Layer 0 ownership (`README.md:29–46`) | #888 `:44–46`; #867 `:72–76` | both heads claim the single home; QuantumGroups is on main | settled | none |

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), is recorded `uncertified` in the manifest and is cited by locator only:
  - Theorem 5.1.6 (§1.2); Definitions 5.1.1 and 5.1.4, §5.3, Theorem 5.3.3 and Propositions 5.3.7–5.3.8 (§§2.1–2.3).
  - Propositions 3.2.9 and 3.2.17, Theorems 3.2.19, 5.4.1, 5.4.3 and 5.4.5 (§§3.1–3.4).
  - Proposition 2.2.4, Remark 2.2.2(iv)(c) and Theorem 3.2.12 (§4.1); Chapter 6 §2 (§§5.1, 7.1, 8.6).

  No legal copy was sought, per the manifest. The mathematics of the sampled targets 1.2, 2.1, 3.1, 3.2 and 3.3 was checked against `nt` instead, as listed above.
- The head of #1705 was not read; its overlap with this folder was taken from `scratch/overlaps.md`. The descriptions of #888, #867 and #1705 were not read; the README texts of #888 and #867 were.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2) fusion rules hold for every n ∈ ℕ with F F̄ = c ∈ ℝ, although at n=1 A_o(F)=C*(ℤ/2) has two irreducibles with u⊗u=1; it should be stated for n ≥ 2, as the abstract does; affects a stated result.
- **Error** in longoroberts at Theorem 3.11, proof, printed p.17: the source says equality forces every μ_i=1, hence X*X=1 and R′ standard; it should be that all μ_i are equal, so R′ is a multiple of a standard solution (X=2·1 attains equality); affects the proof.
