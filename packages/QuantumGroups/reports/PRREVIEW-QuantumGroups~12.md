# Review of QuantumGroups (pull request #1649 at 21777da)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `21777dabaa8b6ed7ea3bb7a2d7e460e1bc9b9905` (a full review: 423 lines changed since `ab56b1d`, the head the previous review read). No file of the pull request was changed. The worker's gate passes every check, including the dependency check (0 problems) and the targeted build. Three of the previous review's four findings are repaired, and the repairs were verified at the pin declaration by declaration. Nothing blocks. Three P3 findings remain: the one Layer 8 statement kept in `Suggested.lean` is proved verbatim at the pin and closes by one `exact`, two native names are cited under the wrong namespace or for work the pin already does, and the second open revision of this folder still has no stated order.

**Status of the previous review's findings (ab56b1d → 21777da).**

| Previous | Status at 21777da |
| --- | --- |
| R01 (P2) Layer 8 of `Suggested.lean` restated the native `TauCeti.UqSl2` | Repaired: the `GenericRankOne` section and `quantumInteger` are deleted (`Suggested.lean` is 126 lines, 5 declarations); the file imports `TauCeti.QuantumGroups.UqSl2.TypeOne` and states one theorem on the native carrier (`:119`–`:124`). Scope (`README.md:48`–`:65`) and `From Tau Ceti` (`:151`–`:156`) name the native modules; §§8.1–8.7 name the native declarations. Every name was checked at the pin (table under Verified sound); two slips are R02. The kept theorem is itself native (R01 below). |
| R02 (P3) `StarCompatibleHopf` duplicated `TauCeti.StarCoalgebra` | Repaired: the class is gone; both theorems take `[TauCeti.StarCoalgebra ℂ A]` (`Suggested.lean:79`, `:108`); `README.md:584`–`:590` cites `counit_star`, `antipode_bijective`, `antipode_star_antipode_star`; `:782`–`:784` cites `comulMulRightEquiv` and `leftMulComulEquiv`. All five exist at the pin (`Algebra/Coalgebra/Star.lean:91`, `Algebra/HopfAlgebra/Star.lean:65`, `:85`, `Algebra/HopfAlgebra/Cancellation.lean:72`, `:149`). The file elaborates with exactly 3 `sorry` warnings. |
| R03 (P3) TemperleyLieb Layer 4 cited for a categorical-trace identification | Repaired: `README.md:259`–`:261` reads "Layer 4's uniqueness of the Markov trace, which identifies Subfactors 3.2's closure trace T_n with the trace tr̂ defining that ideal"; the supplier row `:106` reads "with its uniqueness and its comparison with Tau Ceti's `markovTrace`". TemperleyLieb on main states both (`README.md:590`, `:600`–`:602`). |
| R04 (P3) two open revisions with no stated order | Not repaired: `roadmaps list` shows #1705 (`0d7cbcc`) still open on this folder, the overlap listing still reports conflicts in both files, and the description names neither #1705 nor an order. Carried as R03. |

## R01 (P3) — `uqSl2_locallyFinite_iff` is proved verbatim at the pin and closes by one `exact`

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:113`–`:124` (the Layer 8 section and the theorem), `:14`–`:18` and `:37`–`:46` (the docstring's "characterization of local finiteness … on the native carrier"); `TauCetiRoadmap/QuantumGroups/README.md:60`–`:62` ("Its one headline the library does not state verbatim, the local-finiteness characterization of §8.4, is stated on the native carrier") and `:1408`–`:1410` ("Prove the headline `uqSl2_locallyFinite_iff`").

**Claim:** `Suggested.lean` states headline theorems the finished roadmap will prove; a declaration that follows in one tactic from the library is padding, and every claim that a library "lacks" a statement is checked at the pin.

**Witness:** Tau Ceti at the pin `2fd255d9`, `TauCeti/QuantumGroups/UqSl2/TypeOne.lean:370`–`:378`, proves
`isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule (hq : IsGenericQuantumParameter q) : (IsSignedTypeOne q V ∧ (∀ v, ∃ n, e q ^ n • v = 0) ∧ ∀ v, ∃ n, f q ^ n • v = 0) ↔ IsLocallyFiniteModule ℂ (UqSl2 q) V` under `[Fact (q ≠ 0)]`, the same statement with the two sides swapped. On a scratch copy of `Suggested.lean` the proof

```lean
  exact (@TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule
    q ⟨hq.1⟩ V _ _ _ _ hq).symm
```

elaborates with no error and no `sorry` warning (`lake env lean`, 5 s; the other two theorems of the file fail the same one-tactic probe with "Type mismatch"). So the README's sentence at `:60`–`:62` and the docstring's bullet are false at the pin: Layer 8 has no statable headline the library does not already prove.

**Repair (tested):** delete `Suggested.lean:113`–`:124` and the import at `:9` (nothing else uses it); in the docstring replace `:14`–`:18` by "weighted Schur orthogonality and the algebraic compact-type characterization", and in the Layer 8 bullet say that the local-finiteness characterization of §8.4 is `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` and that the pentagon is the one Layer 8 statement not statable, as now. In the README replace `:60`–`:62` by "The local-finiteness characterization of §8.4 is `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`;" and at `:1408`–`:1410` write "The native `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` says that this condition characterizes unrestricted local finiteness when combined with E,F local nilpotence." The gate's readme-ids check then has no backticked name of this roadmap's own outside `AlgebraicHaar`, `schur_orthogonality`, `unitaryCoefficientSet`, `compactType_iff`.

## R02 (P3) — two native citations do not match the pin: `TauCeti.UqSl2.invariantForm` is in the `LadderModule` namespace, and the pivot's monoidality is already proved

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:1537`–`:1539` ("is `TauCeti.UqSl2.invariantForm`, with its star relations and K positivity (`invariantForm_pos`, `invariantForm_k_pos`)"), `:1501`–`:1503` (`signTensorEquiv`, `tensorSignEquiv`, `contragredientEquiv` after a `TauCeti.UqSl2.`-qualified neighbour), `:1475`–`:1476` ("Construct `PivotalCategory` from it, proving monoidal naturality").

**Claim:** a cited supplier declaration exists where it is cited, and what the pin proves is cited, not re-planned.

**Witness:** `#check @TauCeti.UqSl2.invariantForm` fails ("Unknown constant") with `TauCeti.QuantumGroups.UqSl2.LadderModule.InnerProduct` imported; the declaration is `TauCeti.UqSl2.LadderModule.invariantForm (q : ℝ) (m : ℕ)` (`LadderModule/InnerProduct.lean:41`, `:78`), with `invariantForm_pos` `:115` and `invariantForm_k_pos` `:265` in the same namespace. `signTensorEquiv`, `tensorSignEquiv` (`LadderModule/SignTensor.lean:66`, `:121`, `:194`) and `contragredientEquiv` (`Dual/LadderModule.lean:33`, `:135`) are likewise `TauCeti.UqSl2.LadderModule.*`, while the neighbouring names the paragraph qualifies (`clebschGordanRecouplingEquiv`, `formalCharacter`) are `TauCeti.UqSl2.*`. For the pivot, `Algebra/Category/FiniteHopfModuleCat/Pivotal.lean:221` proves `unitEvalNatIso_isMonoidal (hg₁ : IsGroupLikeElem k g) : NatTrans.IsMonoidal (unitEvalNatIso g hg).hom`, so monoidal naturality is native; only the bundling into `PivotalCategory` (absent from `FiniteHopfModuleCat/`, grep finds it only in a docstring at `Pivotal.lean:24`) remains.

**Repair:** at `:1538` write `TauCeti.UqSl2.LadderModule.invariantForm`; at `:1501` and `:1503` prefix `TauCeti.UqSl2.LadderModule.` on the first of the three names (or say "in the `LadderModule` namespace"); at `:1475`–`:1476` write "H-linear, natural in V and monoidal (`TauCeti.FiniteHopfModuleCat.unitEvalNatIso`, `unitEvalNatIso_isMonoidal`). Bundle it as the `PivotalCategory` instance."

## R03 (P3) — Two open revisions of this folder with no stated order; the description describes an earlier head

**Location:** the pull request description (`scratch/pull-request.md`, data) and the folder as a whole.

**Claim:** when two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which; a description reflects the head under review.

**Witness:** `roadmaps list` shows `#1705 QuantumGroups @kim-em 0d7cbcc` open beside `#1649 … 21777da`; the overlap listing reports "#1649 and #1705 conflict in `TauCetiRoadmap/QuantumGroups/README.md`, `TauCetiRoadmap/QuantumGroups/Suggested.lean`". The description still says "Current head `d7a6c540…`", "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged" and "No Lean elaboration was repeated because no Lean files change", while this head rewrites `Suggested.lean` (190 changed lines since `ab56b1d`, 306 since main) and 1,362 README lines. Re-raised from the previous review's R04 (its R07 before that); reason unchanged.

**Repair:** state in the description which of #1649 and #1705 is rebased on the other (or close one) and rebase so that one head carries one Layer 0, one Layer 8 and one `Suggested.lean`; update the head line and the "unchanged" sentences to this head (the `Suggested.lean` rewrite, R01 and R02 applied).

## Verified sound

**Gate, build, scope, pins.** Head `21777dabaa8b6ed7ea3bb7a2d7e460e1bc9b9905`; the worker's gate reports all 25 checks at 0 (`depcheck=0`, `set_option=0`, `sorry-data=0`, `prnum=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `build=0`) and `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, identical to main's. `PROGRESS.md`, `STATUS.md`, `metadata.toml` unchanged. Grep of the README for `StarCompatibleHopf`, `quantumSL2`, `QuantumSL2`, `SL2Generator`, process words, LaTeX delimiters and pull-request numbers: none.

**Lean elaboration, signatures, padding.** `lake env lean` on a copy of `Suggested.lean` with `#check @name` for all 5 declarations: exit 0, exactly 3 `declaration uses sorry` warnings. Each elaborated type agrees with `scratch/signatures.md` and its README statement: `AlgebraicHaar` over `[Ring A] [HopfAlgebra ℂ A] [StarRing A]` (the `[StarModule ℂ A]` the worker flagged as dropped is not needed by any field; both theorems that use it carry it); `schur_orthogonality` with `[TauCeti.StarCoalgebra ℂ A]`, `[IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]` (§3.1 "finite irreducible") and the two forms `δ_jl (F̃⁻¹)_ik/Tr F̃⁻¹`, `δ_ik F̃_jl/Tr F̃`; `compactType_iff` with `[Nontrivial A]` (§4.1 "nonzero"); `uqSl2_locallyFinite_iff` with `IsGenericQuantumParameter q` (= `q ≠ 0 ∧ ∀ n > 0, q^n ≠ 1`, printed at the pin) and no finiteness on `V` (§8.4 "arbitrary"). `IsSignedTypeOne q V` unfolds at the pin to `IsWeightModule q V (Set.range fun p : ℤˣ × ℤ => ↑↑p.1 * q ^ p.2)`, i.e. `⨆ weightSpace = ⊤` over `±q^n`, the README's "algebraic spanning by K eigenvectors with eigenvalues in {±q^k}"; `IsLocallyFiniteModule k A M` has the single field `∀ v, Module.Finite k (span A {v})`, the README's cyclic local finiteness. **Padding probe:** `first | rfl | simp | infer_instance | exact trivial` fails on `schur_orthogonality` and `compactType_iff` ("Type mismatch"); the Layer 8 theorem closes (R01).

**Headline coverage.** Statable and stated: weighted Schur orthogonality (§3.1) and the compact-type characterization (§4.1). Not statable and named in the docstring with the missing carrier: Haar existence and uniqueness, analytic corepresentations and Peter–Weyl, Hopf core, Plancherel and Tomita, completions and coamenability, SUq(2), O_F^+, Tannaka–Krein and commutative reconstruction, fusion and Haar laws (grep of `TauCeti/` for compact-quantum-group, Haar-state, corepresentation, SUq(2) and free-orthogonal declarations finds only docstring mentions). Layer 8: every statement of §§8.1–8.7 except the pentagon, the `PivotalCategory` bundling, the compact comparison of §8.6 and the LieHighestWeight comparison of §8.7 is proved at the pin (table below); the pentagon on `L_a⊗L_b⊗L_c⊗L_d` needs coordinates on quadruple products, and `clebschGordanRecouplingEquiv : ClebschGordanLeft q m n p ε δ ζ ≃ₗ ClebschGordanRight …` (`ClebschGordan/Recoupling.lean:135`) is defined for triple products only, so the docstring's "not statable" claim for it is right.

**Dependency check (unmodified output of the required command):**

```text
depcheck: 238 roadmaps, 2324 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. QuantumGroups is on main and absent from `ORDER.txt`; the check places it before the later open roadmaps. A scratch copy citing "CategoricalOperatorAlgebras CA2a; TemperleyLiebOperatorAlgebras 2.1" in §0.1's `*Needs:*` line prints `UPWARD: QuantumGroups (on main) -> CategoricalOperatorAlgebras (#227)` and `… -> TemperleyLiebOperatorAlgebras (#243)`, which confirms that the head's direction (nothing imported from either) is the only admissible one.

**Ownership against open work, and the recorded move-down.** §0.1 states standard conjugate solutions, intrinsic dimension and signed self-dualities, and §0.2 the signed Temperley–Lieb comparison; CategoricalOperatorAlgebras at `#888` (`README.md:39`–`:46`, `:2057`) and TemperleyLiebOperatorAlgebras at `#867` (`README.md:137`, `:1777`–`:1787`) call those objects their "single home" and name QuantumGroups as consumer. Both are later in the merge order (lines 227 and 243) than this on-main roadmap, so citing them is UPWARD (above). Under the brief's rule the notions move down into this roadmap and the citation runs from the later owner: the repair belongs to #888 and #867 (re-point CA1a/CA2a and TLOA 2.1/3.3 to QuantumGroups §§0.1–0.2), not to this folder, whose Scope (`:28`–`:36`, `:40`–`:44`) names them as later owners with nothing imported. Recorded, not a finding, as in the previous review. NoncompactQuantumSymmetry (#1015, order line 155) owns projective and induced representations of locally compact groups and names no bi-C*-algebra, coproduct on `C₀(G)` or compact quantum group (grep of its README for `C₀(G)`, "bi-C*", "quantum group": none); CompactQuantumMetricSpaces (#1155) names none either. Downstream on main: QuantumEnvelopingAlgebras cites "QuantumGroups Q8" (`README.md:19`, `:27`, `:56`) and HopfologicalAlgebra cites "Q8 item 5" (`README.md:40`, `:165`, `:319`–`:337`); both ids survive (§8.5 keeps its number; the overlap listing reports no dropped id). Ownership against open pull requests whose files the brief does not list was not checked beyond #1705 (R03).

**Supplier citations resolved on main (content checkout `39d3d60`).**

| Citation | Where it resolves |
| --- | --- |
| CStarAlgebras C1.CommutativeMultiplierMorphisms, C5.2, C2–C4, C8 | `CStarAlgebras/README.md:497`–`:499` (heading "1.8 Commutative multiplier morphisms (C1.CommutativeMultiplierMorphisms)"), `:1957` names QuantumGroups as consumer |
| VonNeumannAlgebras Layers 0, 1, 3, V4.Core, V4.PositivePredual, V4.Normality, V10.ModularTheory, V10.KMS, Layer 11 | `VonNeumannAlgebras/README.md:275`, `:392`, `:905`, `:972`, `:1051`–`:1052`, `:244`–`:265` |
| HilbertModules H1–H3, `L_A(E)≅M(K_A(E))`, `K_A(H⊗A)≅K(H)⊗min A` | `HilbertModules/README.md:126`, `:179`, `:203`, `:209`, `:262` |
| TemperleyLieb Layer 2 `TLCat.lift`/`lift_unique`, Layer 4 `IsMarkovTrace`/`markovTrace`, Layer 6 negligible ideal, Layer 7 envelope | `TemperleyLieb/README.md:459`–`:474`, `:590`–`:602`, `:708`–`:723`, `:890`–`:901` |
| Subfactors 3.1–3.3, `markovTrace_nonneg_iff`, `jonesLoopParameters`, pullback criterion | `Subfactors/README.md:676`, `:697`, `:729`–`:732`, `:774`, `:862` |
| OperatorTheory/SelfAdjointSpectralTheory Part B spectral projections | `…/README.md:348`–`:369` (SA-B26) |
| RepresentationTheory/CompactGroups `su2Irrep`, `matrixCoeff π v w = ⟪π g v, w⟫` | `CompactGroups/README.md:190`, `:273` (so §1.2's conjugation crosswalk is right) |
| RepresentationTheory/LieHighestWeight sl₂ worked example, `IsSl2Triple` | `LieHighestWeight/README.md:5`, `:181`–`:184` |
| OperatorAlgebraDynamics D1–D2, Reiter | `OperatorAlgebraDynamics/README.md:148`, `:221`, `:258` |
| FreeProbability F1, F3 (`2sqrt3` versus 4), F6 | `FreeProbability/README.md:127`, `:255`, `:307`, `:532` |
| AmenableGroups Layers 1, 5, 7 | `AmenableGroups/README.md:98`, `:289`, `:415` |
| PivotalSpherical Layers 0–2, 7, `rightTrace`/`leftTrace`, `RigidCategory (FDRep k G)` | `PivotalSpherical/README.md:61`, `:198`–`:207`, `:238` |

**Native declarations the README names, checked at the pin by `#check` (after `lake build` of the 24 modules involved, 7679 jobs, 6 s cached).** All of the following exist with the stated role; the two corrections are R02.

| README | Pin (`TauCeti/…`) | Agrees with the README |
| --- | --- | --- |
| `TauCeti.UqSl2`, `UqSl2.Rel`, `e`, `f`, `k`, `kInv`, `kUnit`, `lift` | `QuantumGroups/UqSl2/Basic.lean:69`–`:86`, `:112`–`:121`, `:163`, `:310` | relations `KK⁻¹=K⁻¹K=1`, `KE=q²EK`, `KF=q⁻²FK`, `EF−FE=(q−q⁻¹)⁻¹(K−K⁻¹)` |
| `pbwBasis`, `triangularEquiv`, `instIsDomain`, `oreTowerEquiv` | `PBW.lean:184` (`[Fact (q ≠ 0)]`), `Triangular.lean:123`, `OreTower.lean:350`, `:283` | yes |
| `TauCeti.OreExtension`, `SigmaDerivation`, `ofMatrix`, `monomialBasis`, `liftAlgHom`, `skewPolynomialEquiv` | `Algebra/OreExtension/Basic.lean:67`, `:120`, `:205`, `:646`; `Triangular.lean:43` (`Φ r 0 0 = σ r`, `Φ r 1 1 = r`, δ = entry (0,1)); `SkewPolynomial.lean:148` | yes |
| `instHopfAlgebra`, `comul_e`, `comul_f`, `comul_k`, `antipode_e/f/k` | `Hopf.lean:167`, `:180`–`:222` | `ΔE=E⊗1+K⊗E`, `ΔF=F⊗K⁻¹+1⊗F`, `ΔK=K⊗K`, `S(E)=−K⁻¹E`, `S(F)=−FK`, `S(K)=K⁻¹` |
| `antipodeEquiv`, `antipode_antipode` | `Antipode.lean:79`, `:59` (`S²x = K⁻¹xK`) | yes (Virelizier Prop. 2.4) |
| `rescale`, `inverseParameterEquiv` | `Rescale.lean:83`, `:97`–`:101` (`E↦tE`, `F↦t⁻¹F`); `InverseParameter/Basic.lean:94`–`:117` (`E,F` fixed, `K↦K⁻¹`); `Coproduct.lean:57` | yes |
| `TauCeti.quantumInteger`, `IsGenericQuantumParameter` | `QuantumInteger/Basic.lean:150`, `:33` | yes |
| `TauCeti.IsLocallyFiniteModule`, `VermaModule`, `LadderModule`, `e_smul_vec`, `f_smul_vec`, `k_smul_vec` | `RingTheory/Finiteness/LocallyFinite.lean:59`; `UqSl2/Verma/Basic.lean:88` (quotient by the left ideal of `E`, `K−μ`); `LadderModule/Basic.lean:86`, `:287`–`:303` | `Kv_j=εq^(m−2j)v_j`, `Fv_j=[j+1]v_(j+1)`, `Ev_j=ε[m−j+1]v_(j−1)` |
| `existsUnique_linearEquiv_ladderModule` | `SimpleClassification.lean:62` (`[FiniteDimensional ℂ V] [IsSimpleModule …]`) | yes |
| `casimir`, `casimir_mem_center`, `polynomialAlgEquivCenter` | `Casimir/Basic.lean:65` (`FE+((q−q⁻¹)²)⁻¹(qK+q⁻¹K⁻¹)`), `:138`; `Center.lean:187`, `:195` (evaluation at the Casimir) | yes |
| `isSemisimpleModule_of_finiteDimensional`, `isSemisimpleModule_of_isLocallyFiniteModule`, `isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`, `ladderModuleTensorHomEquiv`, `IsTypeOne`, `IsSignedTypeOne` | `CompleteReducibility.lean:300`; `LocallyFinite.lean:63`, `:104`, `:115`; `TypeOne.lean:178`, `:184`, `:253` (`L_0^-` not type 1) | yes |
| `FiniteHopfModuleCat`, `ofShrink`, `ofShrinkEquiv`, `instRightRigidCategory`, `leftDual`, `rigidCategory`, `unitEvalNatIso` | `Algebra/Category/FiniteHopfModuleCat/Basic.lean:227`, `:234`; `RightRigid.lean:123`; `Rigid.lean:69`, `:146`; `Pivotal.lean:119`, `:221` | yes; monoidality native (R02) |
| `clebschGordanVector`, `clebschGordanEquiv`, `clebschGordanProjection`, `clebschGordanRecouplingEquiv`, `comul_e_pow`, `comul_f_pow` | `ClebschGordan/Basic.lean:96`–`:112`, `:326`; `Projection.lean:43`; `Recoupling.lean:135`; `ComulPow.lean:48`, `:59` | recurrence `[m−i]α_(i+1) = −δq^(m−2i)[n−j+i+1]α_i`; `Δ(E^r)=Σ q^(s(r−s))[r choose s] E^sK^(r−s)⊗E^(r−s)` |
| `signTensorEquiv`, `tensorSignEquiv`, `contragredientEquiv`, `invariantForm`, `_pos`, `_k_pos` | `LadderModule/SignTensor.lean:121`, `:194`; `Dual/LadderModule.lean:135`; `LadderModule/InnerProduct.lean:78`, `:115`, `:265` — all in namespace `TauCeti.UqSl2.LadderModule` (R02) | `L_0^-⊗L_m^ε≃L_m^(−ε)`; `innerWeight (j+1) = innerWeight j · [m−j]/([j+1] q^(m−2(j+1)))` = the README's `h_j/h_(j−1)` |
| `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`, `formalCharacter` | `QuantumTrace.lean:41` (`q−q⁻¹≠0`, φ `UqSl2`-linear); `Character.lean:92` | yes |
| `instStarRing`, `instStarCoalgebra` | `Star.lean:156` (`[Fact (IsSelfAdjoint q)]`), `:202` (adds `[Fact (q ≠ 0)]`), `star_e : E* = KF`, `star_f : F* = EK⁻¹`, `star_k` | yes |
| `ladderMatrixE/F/K/H`, `ClassicalLadder`, `equivSl2Std` | `ClassicalSpecialization.lean:98`–`:115`, `:275`, `:664` (to `TauCeti.Sl2Std K m`, `Algebra/Lie/Sl2/Standard.lean:151`) | yes |
| `TauCeti.StarCoalgebra`, `counit_star`, `HopfAlgebra.antipode_bijective`, `antipode_star_antipode_star`, `comulMulRightEquiv`, `leftMulComulEquiv`, `span_comul_mul_one_tmul`, `antipode_antipode` (commutative), `antipodeAlgEquiv` | `Algebra/Coalgebra/Star.lean:46`, `:91`; `Algebra/HopfAlgebra/Star.lean:65`, `:85` (variables `[StarRing A] [HopfAlgebra R A] [StarModule R A] [StarCoalgebra R A]`); `Cancellation.lean:72`, `:97`, `:149`; `Antipode.lean:91`, `:100` | yes |
| Mathlib at the pin: `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `orthogonalComplement_iSup_eigenspaces_eq_bot`, `finite_dimensional_eigenspace`, `VonNeumannAlgebra`, `WithConv`, `SkewPolynomial`, `IsGroupLikeElem`, `GroupLike.toUnits`, `ModuleCat.restrictScalars`, `Rep.equivalenceModuleMonoidAlgebra`, `HopfAlgebra.antipode_mul_antidistrib`, `ExactPairing`, `IsSl2Triple`, `ObjectProperty.FullSubcategory`, `det_vandermonde` | unchanged since the previous review (same Mathlib pin) | present |

**Sources read (legal copies in the cache; locators as `<id> line N`).** `longoroberts` §2 from 123 (p.4), §3 from 365 (p.10), Lemma 3.3 389–391, Theorem 3.8 621–625, Theorem 3.11 681–699 (`R*R·R̄*R̄ ≥ d(ρ)²`, equality iff a multiple of `R` is standard, p.17), Appendix 2000 (p.48): §0.1's minimum and "need not be standard" are exactly 3.11. `nt` §2.2 from 1293 (printed p.29), §2.5 at 2426–2438 (printed pp.52–53): `R̄=−τR`, `−τ(R*⊗ι)(ι⊗R)=ι`, so ε = −τ as the README says. `bmt` Theorem 2.2 257 (p.6, faithful Haar and bounded counit), Theorem 2.8 461 (p.10, needs faithful Haar), Corollary 2.9 478 (p.11, arbitrary CQG: character on `A_r`), SUq(2) 592–605 (p.13: real `0<|q|<1`, `U=[[α,−qγ*],[γ,α*]]`, basis `α^(k)γ^mγ*^n`), Theorem 2.12 614–621 (`ϕ(α)e_nk = c_n e_(n−1,k)`, `c_n=(1−q^(2n))^(1/2)`, so `D−1` is compact as §7.1 says), Corollary 2.13 645 (p.14), Theorem 3.6 858–865 (pp.18–19). `malacarne` Theorem 1.1 52 (p.2), Lemma 1.2 127 (p.2), Lemma 2.1 183 (p.3), Lemma 3.1 235 (p.4), Theorem 4.1 285–291 (p.5: essentially small C*-tensor category with conjugates, closed under finite sums and subobjects, unitary fiber functor; Hopf *-algebra unique up to isomorphism), proof continuing on p.6. `virelizier` Lemma 2.3 265 (p.6), §2.3 348–357 (p.8: relations, coproduct, antipode as §8.1), Proposition 2.4 358, §3.2 529–537 (p.11, type 1), Example 3.3 552–555, Proposition 3.7 585 and Corollary 3.8 594 (p.12), Theorem 3.13 625 and Corollary 3.14 635 (p.13), §4.1 basis 639–642 and Proposition 4.1 644 (pp.13–14). Virelizier's `(t)_q=(q^(2t)−1)/(q²−1)` equals `q^(t−1)[t]_q`, so his §4.1 ladder `Fw_i=(i+1)_q w_(i+1)`, `Ew_i=q^(1−n)(n−i+1)_q w_(i−1)` is the README's after the rescaling the README announces. `kustermansvaes` Definition 2.1 at 743 (p.853), unchanged.

**Computed adversarial table.** `q = 1/2` unless stated; `u = [[a, −qc*],[c, a*]]` with indices 0, 1; `F = diag(2, 1/2)` so `F̃ = Fᵗ = F`; `F_o = [[0,1],[−2,0]]` for O_F^+; "pass" means both sides agree on the instance. Rows cover the seeded sample (0.1, 2.3, 3.1, 3.3, 4.1, 4.2, 4.3, 5.1, 6.1, 6.2, 7.1, 8.3, 8.5, 8.6, 8.7), the headlines, and every passage a finding or a repair touches (1.1, 8.1, 8.2, 8.4).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 C*-norm identity | `T = diag(2,1)`; Hilbert–Schmidt instead | `‖T†T‖ = 4 = ‖T‖²`; HS gives `√17 ≠ 5` | pass | none |
| 0.1 idempotent vs projection | `[[1,1],[0,0]]` | `A*A = [[1,1],[1,1]]`, eigenvalues 2, 0, norm √2, not self-adjoint; range projection `diag(1,0)` | pass | none |
| 0.1 minimal norm product (LR 3.11) | ℂ², `(2R, R/2)`, `R = Σ e_i⊗e_i` | zigzags identity; squared norms 8, 1/2; product 2 = d; not standard | pass | none |
| 0.1 non-minimal pair | `R = 2e₀⊗e₀+e₁⊗e₁`, `R̄ = ½e₀⊗e₀+e₁⊗e₁` | `r_j s_j = 1`; `‖R‖² = 5`, `‖R̄‖² = 5/4`, product 5/2 > 2; invariant under rescaling | pass | none |
| 0.1 fiber functor and standardness | SUq(2) fundamental | `d = q+q⁻¹ = 5/2`, Hilbert dimension 2; forgotten product 5/2 > 2 | pass | none |
| 0.1 sign of the SU(2) cup | `e₀⊗e₁−e₁⊗e₀` | `(R*⊗1)(1⊗R)e₀ = −e₀`: ε = −1; symmetric cup ε = +1; `J² = −I` vs conjugation `I` | pass | none |
| 0.1 NT sign parameter | `R̄ = −τR` | conjugate equation gives `(R*⊗ι)(ι⊗R) = −τ ι`, so ε = −τ | pass (nt 2426–2438) | none |
| 0.2 d = 1 kernel | `X = ℂ`, `R = 1` | `Φ_R(e) = 1`, `Φ_R(f₂) = 0`, `T₂(f₂) = δ²−1 = 0`; `Q₂ = ℂ`; not full (`Hom(X,1) = ℂ`) | pass | none |
| 0.2 SU(2) loop | δ = −2 | `Φ_R(e) = −RR*`, `e² = 2RR* = −2e = δe`; `p = RR*/2` | pass | none |
| 0.2 sign map and traces | 1 and 2 strands; δ = −5/2 | `T₁^(d)(1) = d = −T₁^(−d)(1)`; `T₂^(d)(se) = −d = T₂^(−d)(e)`; `T₂(1) = d²`; normalized trace of `p` = 4/25 both signs | pass | none |
| 0.2 d = 3/2 excluded | Chebyshev `[n+1] = d[n]−[n−1]` | `[2] = 3/2`, `[3] = 5/4`, `[4] = 3/8`, `[5] = −11/16 < 0`; `√2 < 3/2 < (1+√5)/2` | pass | none |
| 0.2 Rep(SU(2)) traces vs dimensions | `r = 0,1,2`, δ = −2 | `T_r(f_r) = 1, −2, 3`; `ε^r T_r = 1, 2, 3` = dimensions | pass | none |
| 1.1 trivial group | `f = 2+i` | `Δf = εf = Sf = 2+i`; inverse composites `2+i`; zero map gives 0 ≠ 2+i | pass | none |
| 1.1 ℤ, `f = 1[0]` | `(m,n)` | `Δf = 1[m+n=0]`, value 1 at every `(N,−N)`, not in `C₀(ℤ²)`; `r₊(Δf)(g) = Δf(g,−g) = 1 = η(ε(f))`; slices `(id⊗ε)Δf = f` | pass | none |
| 1.1 S₃ order of multiplication | `g = (12)`, `h = (23)`, `f = 1[(123)]` | `gh = (123)`, `hg = (132)`: `Δf(g,h) = 1`, `Δf(h,g) = 0` | pass | none |
| 1.1 tube-lemma identification | `H = 1[m+n=0]` on ℤ×ℤ | slices `H(m,·) = 1[−m]` of norm 1 for every m: not in `C₀(ℤ, C₀(ℤ))`, consistent with the previous row | pass | none |
| 1.2 Haar on C(C₂) | `h = (a+b)/2` | `h(1) = 1`, `h(1[e]) = 1/2`, evaluation gives 1 | pass | none |
| 1.2 absorbing monoid fails cancellation | `{1,0}` | `Δδ₁ = δ₁⊗δ₁`, `Δδ₀ = 1⊗1−δ₁⊗δ₁`; span of `Δ(A)(A⊗1)` = `⟨δ₁⊗δ₁, δ₀⊗1, δ₁⊗δ₀⟩`, dimension 3 < 4 | pass | none |
| 1.2 Fell absorption on ℤ | `W(δ_g⊗δ_h) = δ_g⊗δ_(gh)` | `W(δ₁⊗δ₂) = δ₁⊗δ₃`; `W(λ₁⊗1)W*(δ₁⊗δ₂) = W(λ₁⊗1)(δ₁⊗δ₁) = W(δ₂⊗δ₁) = δ₂⊗δ₃` | pass | none |
| 2.1 sign representation tensor square | C₂ | `(−1)(−1) = 1`; direct-sum rule `−2` | pass | none |
| 2.2 Haar averaging | `U(s) = [[1,2],[0,−1]]` | `U² = I`; `U*U = [[1,2],[2,5]]`; `T = (I+U*U)/2 = [[1,1],[1,3]]`, det 2; `U*TU = T` | pass | none |
| 2.2 noninvertible solution | `U = 0` on ℂ | `T = 0`, no inverse | pass | none |
| 2.3 regular multiplicities | C₂, S₃, trivial group | `1+1 = 2`; `1·1+1·1+2·2 = 6`; `δ_hΛ(2) = 2⊗1` | pass | none |
| 3.1 `schur_orthogonality` (headline) | one-dimensional character; SUq(2) | `F̃ = 1`, `h(u*u) = h(uu*) = 1`; `F̃ = 2` needs `2 = 1/2`; SUq(2): `Tr F̃ = 5/2`, weights `(1/2)/(5/2) = 1/5`, `2/(5/2) = 4/5`, so `h(a*a) = 1/5`, `h(c*c) = 4/5`; `a*a+c*c = 1` gives `1/5+4/5 = 1` | pass | none |
| 3.1 adjoint vs entrywise conjugate | `[[0,i],[1,0]]` | adjoint `[[0,1],[−i,0]]`, entrywise `[[0,−i],[1,0]]` | pass | none |
| 3.2 modular character | `a = u₀₀` | `φ*u = uF_φ`, `u*φ = F_φ u`; `θ(u) = FuF`, `θ(a) = 4a`; `f_z(a) = 2^z`, `f₁*f₁(a) = 4 = f₂(a)` | pass | none |
| 3.2 Vandermonde | `λ = 1, 2`, `m = 0, 1` | matrix `[[1,1],[1,4]]`, det 3 | pass | none |
| 3.3 pivotal traces | `F = diag(2,1/2)`, `P = diag(1,0)` | `tr F = tr F⁻¹ = 5/2 > 2`; `tr(FP) = 2`, `tr(F⁻¹P) = 1/2` | pass | none |
| 3.4 modular group | `a`, `c` | `σ_t(a) = F₀₀^(it)F₀₀^(it) a = 4^(it)a`, `σ_(−i)(a) = 4a`, `h(aa*) = 4/5 = 4·h(a*a)`; inverse convention `1/20`; `S²(c) = F₁₁ c F₀₀⁻¹ = c/4 = q²c`; `τ_(−i)(c) = F₁₁^(it)F₀₀^(−it)c` at `t = −i` = `c/4`; `σ_t(c) = c` | pass | none |
| 4.1 `compactType_iff` (headline) | ℂ; ℂ[C₂]; zero ring; primitive x | `h(z) = z`, span of `{1}` = ℂ; `h((a+bu)*(a+bu)) = |a|²+|b|²`; zero ring: `h(1) = h(0) = 0 ≠ 1` so `[Nontrivial A]` is needed and present; `(id⊗h)Δx = x+h(x)` vs `h(x)1` forces `x = 0` | pass | none |
| 4.2 regular unitary and pentagon | ℤ | `U(δ₁⊗δ₂) = δ₁⊗δ₃`; `U₁₂U₁₃U₂₃(δ₁,δ₂,δ₃) = (δ₁,δ₃,δ₆) = U₂₃U₁₂(δ₁,δ₂,δ₃)` | pass | none |
| 4.2 norms on C₂ | `1+u` | C*-norm 2 (eigenvalues 2, 0), Haar square norm `h(2+2u) = 2`; equality would give √2 | pass | none |
| 4.3 Følner on ℤ; free group | `[−N,N]`; adjacency sum | boundary ratio `2/(2N+1) → 0`; reduced norm `2√3 ≈ 3.46 < 4 = ε(sum)` | pass (FreeProbability F3) | none |
| 5.1 SUq(2) relations | `a = 1, c = 0`; `a = 0, c = 1` | `u = I₂`; at `q = 1` `u = [[0,−1],[1,0]]` unitary; at `q = 1/2` `aa*+q²c*c = 1/4 ≠ 1` | pass (bmt 598–605) | none |
| 5.1 antipode square | `c` | `S(c) = −c/2`, `S(c*) = −2c*`, `S²(c) = (−q)²c = c/4` | pass | none |
| 5.2 free orthogonal cup | `F_o` | `F_oF̄_o = −2I`, `c = −2`; cup `−2e₀⊗e₁+e₁⊗e₀`, `‖E‖² = 5`, normalized zigzag `−I`; bound `5/2 > 2`; `J(e₀) = F_oe₀/√2 = −√2 e₁`, squared norm 2 | pass | none |
| 5.2 n = 1 | `F = 1` | `u* = u`, `u² = 1`: `C*(C₂)` | pass | none |
| 6.1 reconstruction sizes | Hilb_f; Rep(C₂); Rep(S₃) | ℂ only; dimension 2 (collapse → 1); `1²+1²+2² = 6` vs `1+1+2 = 4` | pass (malacarne 285–291) | none |
| 6.2 H = 0 and H = ℂ | truncations | degree-0 part ℂ, positive degrees 0, quotient ℂ ≠ 0; degree ≤ 1 space of dimension 2, the square of the degree-one vector leaves it | pass | none |
| 6.3 absorbing monoid | `0·1 = 0·0`, `1 ≠ 0` | cancellation fails | pass | none |
| 7.1 Haar moments | `c*c` | `h(c*c) = (1−q²)Σ q^(4j) = 1/(1+q²) = 4/5` (= 1 − h(a*a) of §3.1); `h((c*c)²) = (1−q²)/(1−q⁶) = (3/4)(64/63) = 16/21`; endpoints `∫₀¹t = 1/2`, `∫₀¹t² = 1/3` | pass (bmt 614–621) | none |
| 7.1 fusion dimensions | `r₁⊗r₁` | `2·2 = 1+3`; `(5/2)² = 25/4 = 1+21/4` | pass | none |
| 7.1 `D − 1` compact | `c_n = (1−q^(2n))^(1/2)` | `c_n → 1`, so `diag(c_n)−1` is compact | pass | none |
| 7.2 free orthogonal recurrences | `n = 2`, `d = 5/2` | Hilbert `1,2,3,4`; intrinsic `1, 5/2, 21/4, 85/8`; `β = d² = 25/4`; `n = 3`: `ε(χ) = 3 ∉ [−2,2]` | pass | none |
| 8.1 quantum integers and PBW | `q = 1/2` | `[−2] = (4−1/4)/(−3/2) = −5/2`, `[2] = 5/2`, `q−q⁻¹ = −3/2`; `KF = q⁻²FK = 4FK`, `q^(−2ab) = 4` at `a = b = 1` | pass (`QuantumInteger/Basic.lean:150`, `Basic.lean:69`) | none |
| 8.1 `L₁⁺` relation | pin `k_smul_vec`, `e_smul_vec`, `f_smul_vec` | `K = diag(1/2, 2)`, `E = [[0,1],[0,0]]`, `F = [[0,0],[1,0]]`; `EF−FE = diag(1,−1) = diag(1/2−2, 2−1/2)/(−3/2)` | pass | none |
| 8.1 coproduct power | `r = 2`, `s = 1` | `q[2] = 5/4 = 1+q²`; `q⁻¹[2] = 5` | pass (`ComulPow.lean:48`) | none |
| 8.2 `L₂⁺`, `L₁⁻` | pin action formulas | weights `1/4, 1, 4`; `F`: `1, 5/2, 0`; `E`: `0, 5/2, 1`; `EF−FE = diag(5/2, 0, −5/2) = [2−2j]`; `L₁⁻`: `K = diag(−1/2,−2)`, `E = [[0,−1],[0,0]]`, `EF−FE = diag(−1,1)` | pass | none |
| 8.3 Casimir scalars | `(q−q⁻¹)² = 9/4` | `L₀⁺: (5/2)(4/9) = 10/9`; `L₁⁺: (17/4)(4/9) = 17/9`; `L₂⁺: (65/8)(4/9) = 65/18`; negatives on `L_m^-`; on `L₁⁺` `FE = diag(0,1)`, toral `diag(17/9, 8/9)`, sum `(17/9)I` | pass (`Casimir/Basic.lean:65`, `:143`) | none |
| 8.4 `uqSl2_locallyFinite_iff` (headline) | `L₀⁻`; `⊕ℕ L₀⁺`; Verma weight 1; zero module | `L₀⁻`: cyclic dimension 1, `E = F = 0`, `K = −1 ∉ {q^z}`: locally finite, signed type 1, not type 1 (`TypeOne.lean:253`); countable sum: each cyclic span dimension 1, total infinite; Verma: `F^jv₀ ≠ 0` with weights `4^j`, highest cyclic span infinite, `F` not locally nilpotent; zero module: both sides hold | pass; proved at the pin | R01 |
| 8.5 Clebsch–Gordan recurrence | `m = n = j = 1`, δ = +1 | `α₁ = −δ q^(1)[1]/[1] = −1/2`; `ΔE(v₀⊗v₁ − ½v₁⊗v₀)`: `(E⊗1)` gives `−½v₀⊗v₀`, `(K⊗E)` gives `q·[1] v₀⊗v₀ = ½v₀⊗v₀`; sum 0 | pass (`ClebschGordan/Basic.lean:96`–`:104`) | none |
| 8.5 pivot and dimensions | `g = K⁻¹` on `L₁⁺`, `L₀⁻` | `S² = Ad(K⁻¹)` (`Antipode.lean:59`); `tr K⁻¹ = 2+1/2 = 5/2 = tr K`; on `L₀⁻` both `−1`; `L₁⊗L₁`: `4 = 3+1`; `L₀⁻⊗L₀⁻`: sign `(−1)(−1) = +`, dimension 1 | pass | none |
| 8.6 invariant metric | `m = 1` | `h₁/h₀ = [1]/([1]q^(1−2)) = q = 1/2`; `⟨Ev₁,v₀⟩ = 1 = ⟨v₁, KFv₀⟩ = 2h₁`; with `h₁ = 1` the adjoint would be `F`; orthonormal `e_j = v_j/√h_j`: `Ee₁ = √2 e₀`, `Fe₀ = e₁/√2`, `EF−FE = diag(1,−1)` | pass (`InnerProduct.lean:44`–`:62`) | none |
| 8.6 star form | pin `star_e`, `star_f`, `star_k` | `E* = KF`, `F* = EK⁻¹`, `K* = K`, instance needs `IsSelfAdjoint q` (and `q ≠ 0` for the coalgebra) | pass | none |
| 8.7 classical specialization | `v = 1`, `m = 1, 2, 0` | `[E,F] = diag(1,−1)`, `[H,E] = 2E`; `m = 2`: `F: 1,2,0`, `E: 0,2,1`, `[E,F] = diag(2,0,−2) = [2−2j]₁`; `m = 0`: all zero; `[2]_v = v+v⁻¹ → 2` while the totalized quotient gives `0/0 = 0` | pass | none |

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008, DOI 10.4171/043): recorded `uncertified` in the manifest (paywalled; cited by locator). Cited for §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1, 7.1, 8.6 (Definitions 5.1.1, 5.1.4, Theorem 5.1.6, Theorem 5.3.3, Propositions 5.3.7–5.3.8, Theorem 5.4.1, 5.4.3, 5.4.5, Proposition 2.2.4, Remark 2.2.2(iv)(c), Theorem 3.2.12, Propositions 3.2.9, 3.2.17, Theorem 3.2.19, Chapter 6 §2). Not read; the mathematics at those targets was checked against the cache texts and by computation instead (rows 2.2, 2.3, 3.1–3.4, 4.1, 5.1, 7.1 above).

## Source issues

- none
