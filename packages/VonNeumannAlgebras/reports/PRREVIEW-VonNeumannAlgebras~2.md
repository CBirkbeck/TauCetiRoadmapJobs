# Review of VonNeumannAlgebras (pull request #889 at d6a00eb)

**Verdict:** needs changes

The mathematics of the roadmap holds up under the adversarial pass below (every computed row retains its statement). What blocks acceptance is structural and unchanged in substance from the previous round: the roadmap still sits in two explicit two-roadmap supply cycles, it now re-plans four foundational targets that `OperatorTheory` on main already owns, and the same folder is built by two open pull requests.

**Repair status of the previous review (87aeca1 → d6a00eb).**

| Previous | Status at d6a00eb | Evidence |
| --- | --- | --- |
| R01 reciprocal supply (4 rows) | Row 3 (OperatorAlgebraDynamics D1) repaired: V8 now consumes `BanachAlgebras A7.RegularL2` (README:1554) and names D1 only as a consumer (:1554, :1556, :3310). Row 1 (OperatorTheory) replaced by re-planning, see R02. Rows 2 (CStarAlgebras) and 4 (BanachAlgebras A7) not repaired, see R01. | quoted in R01, R02 |
| R02 B1 operator-topology API | Repaired: "The operator-topology adapters on `B(H)` … are not in B1; V1 owns them" (README:46–48, :268–:276). | main `BanachSpaceTheory/README.md:41` has no SOT/WOT block; V1 owns it |
| R03 finite Gleason unowned | Repaired: V12.J.Frame owns the finite frame-function theorem (README:2752–2770) and V12.J.Bloch the type I₂ example (:2840–2850); no `QuantumFoundations` citation remains (grep: 0 hits). | |
| R04 admitted field in `generated` | Repaired: the definition is gone; `sorry-data=0`. | |
| R05 density headlines absent | Repaired: `closure_unitBall_eq_unitBall_double_centralizer` (Suggested:91) and `closure_isStarProjection_eq_positive_contractions` (:102) are in the acceptance module. | |
| R06 diagonal stand-in | Partly: the README now carries the non-diagonal density Check (README:1836–1842); `FiniteComplexModularTargets.lean` is byte-for-byte unchanged and still diagonal-only. See R04 below. | |
| R07 padding | Partly: `symm`, `range_projection_mem_commutant`, `IsTracial`, `IsKMS` are gone from Suggested; the boundary theorem `isClosed_projections_of_finiteDimensional` (ProjectionClosureTargets:41) remains. | |
| R08 imports | Partly: Suggested has the single `import Mathlib`; both companion files still import Mathlib submodules (FiniteComplexModularTargets:1–2, ProjectionClosureTargets:1–3). | |
| R09 blob links | Repaired for roadmap suppliers (`blob=0`; remaining blob links point at the pinned Mathlib/Tau Ceti commits, which is allowed). | |
| R10 TeX subscript, R11 PR numbers, R12 HTML anchors | Repaired (`tex=0`, `prnum=0`, `residue=0`). | |
| R13 roadmap form | Partly: Summary, Scope, Conventions, supplier contracts, build order, per-layer Examples/Dependencies exist; `*Needs:*` lines exist on 4 targets only and `**Checks.**` blocks in 6 places. See R06. | |
| R14 locators | Partly: locators added for V2 (Kadison–Ringrose, Conway), V4.Core (Reed–Simon), V4.PositivePredual (Peterson 4.3.3/4.3.4, verified), V10.ClosedOperators (Rudin 13.19), V12.J (Gleason, Hamhalter 4.3, Bunce–Wright), V13 (Takesaki III, Haagerup). Layers 6, 7, 9 and 13.1 still carry none. See R06. | |
| R15 Lean namespace/docstring | Repaired for Suggested (`TauCetiRoadmap.VonNeumannAlgebras`, inventory of unstatable headlines :17–:53). Companion files unchanged. | |

## R01 (P1) — Two supply cycles remain, and one supplier is not admissible at all

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:159` ("CStarAlgebras C1–C5 as cited in V2 and V13"), `:609`, `:686`, `:2945` ("This layer consumes V13a and CStarAlgebras C5's minimal tensor norm"), `:3304`; `:2471` ("BanachAlgebras A7's early L² regular representation, L¹ convolution and integrated maps"), `:2466–2468`, `:2524`, `:2654`, `:3311`.

**Claim:** `Re-raised: R01` (rows 2 and 4). Both directions of two cycles are still written down explicitly.

| This folder consumes | The supplier consumes back | Witness |
| --- | --- | --- |
| CStarAlgebras C1 (V2.AbelianLocalizable, :609), C2 (:209), C5 (V13b, :2945), C3–C5 (:3304) | V0, V2, V4, V12.J, V13a | pull request 860 head `TauCetiRoadmap/CStarAlgebras/README.md:41`, `:44`, `:70`, `:265`, `:467`, `:499` |
| BanachAlgebras A7.RegularL2, L¹ convolution, C_c approximate identity (:1554, :2471) | V11's closed double-dual embedding | main `TauCetiRoadmap/BanachAlgebras/README.md:55`, `:997`, `:1004`, `:1021–1022`; this README's own `:3311` |

The README tries to settle the second cycle by ordering milestones inside A7 ("Those early A7 items precede its character/Fourier-uniqueness item, which in turn consumes this closed embedding", :2474–2475). Milestone interleaving between two roadmaps is exactly what the previous R01 rejected: the merge order is per roadmap, and no order of the two folders makes both arrows point downward. In addition, `CStarAlgebras` is not an admissible supplier at all: it is not on main, not in `board/merge-order/ORDER.txt` (grep: absent), and is this author's own open pull request, so by the order file's header it may not be consumed. The worker's dependency check reported `depcheck: 200 roadmaps, 1308 edges, 0 problem(s)`; that is a false negative here, because these citations are plain prose ("CStarAlgebras C5's minimal tensor norm", "BanachAlgebras A7's early L² regular representation") rather than link-form citations it parses.

**Witness:** Pull request 860 `CStarAlgebras/README.md:41`: VonNeumannAlgebras "owns positive functionals … tensors (V2), and preduals and normal representations (V4). Its V13a owns …"; main `BanachAlgebras/README.md:1021–1022`: "precedes V11's Fourier inversion …; only V11's earlier closed-embedding stage is consumed."

**Repair:** Make each edge one-directional by moving ownership, not by ordering milestones. (a) C1's commutative Gelfand input is native Mathlib (`gelfandStarTransform`, `gelfandTransform_isometry`, `gelfandTransform_bijective` in `Mathlib/Analysis/CStarAlgebra/GelfandDuality.lean`): cite Mathlib directly and drop C1. (b) C2 is only named as an owner, never consumed: delete the sentence at :209 or keep it in Scope only. (c) V13b needs the minimal tensor norm of two concrete von Neumann algebras: own the spatial (minimal) norm on `M ⊙ M'` here as a V13b target with its representation-independence lemma, or move V13b into a Part II that sits after `CStarAlgebras`; either way delete every `CStarAlgebras C3–C5` supplier citation (:159, :2945, :3304) and the "Downstream consumers" line :3314 stays. (d) For A7: either move the closed double-dual embedding (README:2466–2500) down into `BanachAlgebras` A7 as the previous review asked (it uses only native Gelfand duality, A3 and B5, as the paragraph itself says), after which this roadmap consumes A7 one way; or own here the three A7 items V8/V11 use (the L² left-regular representation with strong continuity, L¹ translation continuity, the normalized C_c approximate identity) and delete the `A7` supplier citations at :1554, :2471, :2654. Test: after the edit, no roadmap cited under `## Exact supplier contracts` or in a `*Needs:*`/"Consume" sentence cites `VonNeumannAlgebras` back, and `CStarAlgebras` appears only under "Downstream consumers".

## R02 (P1) — Four foundations are re-planned instead of imported from OperatorTheory on main

**Location:** `README.md:28–39` ("OperatorTheory is a consumer of this roadmap … so nothing here is taken from it. The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … Hilbert–Schmidt class and the canonical trace (V4.Core), and closed operators, Cayley transforms and the multiplier-form unbounded spectral theorem (V10.ClosedOperators)"); targets at `:400–408`, `:409–426`, `:736–742`, `:1698–1726`.

**Claim:** `Re-raised: R01` (row 1). What another roadmap plans is imported, never planned again. All four targets are planned, with target ids, by `OperatorTheory` on main:

| This README | Main OperatorTheory |
| --- | --- |
| V2.PolarDecomposition: `|x|=(x*x)^(1/2)`, `x=v|x|`, uniqueness with `ker v=ker x`, `|x*|=v|x|v*` | `OperatorTheory/PolarDecomposition/README.md:115–445`: Part A positive square root and modulus (PD-A19, A28, A40, A42), Part B polar decomposition and partial isometries (PD-B01 ff.) |
| V2.BorelCalculus: `μ_ξ` by `rieszMeasure`, `f(a)` by polarised pairing, unital star homomorphism, strong countable additivity of `1_B(a)`, a.e. invariance, cyclic multiplication model | `OperatorTheory/SelfAdjointSpectralTheory/README.md:252–346`: SA-B03 diagonal Riesz identification, SA-B04 polarised pairing, SA-B05 Borel calculus, SA-B08 multiplicativity, SA-B09 star, SA-B13 a.e. invariance, SA-B14 projection-valued measure; `:676` SA-B85 cyclic multiplication models |
| V4.Core: trace class as nuclear operators, `‖x‖₁=Σ⟨|x|e_i,e_i⟩`, Hilbert–Schmidt class, canonical trace | `OperatorTheory/OperatorIdeals/README.md:349–354` (OI-B29 nuclear gauge, OI-B30 trace-class family), `:479` (OI-B83), `:530–586` Part C Hilbert–Schmidt operators |
| V10.ClosedOperators: `T±i` bijective, resolvent bound, Cayley transform and its inverse, polar decomposition of closed operators, multiplier-form spectral theorem | `SelfAdjointSpectralTheory/README.md:781–1333`: Part C closed operators on `LinearPMap`, Part D resolvents and `:1121` Cayley transform, Part E spectral measure and packaged spectral theorems; the author's open `OperatorTheory/UnboundedOperators` UO-B01 also plans the polar decomposition of closed normal operators |

The sentence at :28–29 is the cycle of the previous R01 row 1, now resolved in the wrong direction: because main `SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1391` consume "VonNeumannAlgebras V4.0.Fields", the author avoided citing OperatorTheory by re-planning its content. That trades a cycle for a duplication, and leaves two owners of the modulus, the Borel calculus, the trace class and the Cayley transform.

**Witness:** `SelfAdjointSpectralTheory/README.md:690` links V4.0.Fields at commit `4831498`, which is the head of branch `roadmap/vna-fields-foundations-20261017` ("Specify von Neumann foundations and measurable fields"), i.e. the foundations-only folder of pull request 1041 (R03). Main therefore already fixes the order: VNA foundations (V0–V4) → OperatorTheory → everything that needs the Borel calculus.

**Repair:** Split in the direction main already records. Keep the foundations prefix (V0–V4 with V4.0.Fields, exactly the scope of the folder main OperatorTheory consumes) as the supplier, and make this pull request the Part II that starts at V5 (or at the first target needing the Borel calculus) and consumes `OperatorTheory/PolarDecomposition` Part B, `SelfAdjointSpectralTheory` SA-B05–B14 and SA-B85, `OperatorIdeals` OI-B30 and Part C, and `SelfAdjointSpectralTheory` Parts C–E by those ids; delete V2.PolarDecomposition, V2.BorelCalculus, the trace-class/Hilbert–Schmidt paragraph of V4.Core and V10.ClosedOperators, keeping only the algebra-membership adapters (`f(a)∈W*(a)`, `v∈M`, affiliation) this roadmap adds, as :37–38 already describes. Control: after the edit the only mentions of polar decomposition, Borel calculus, trace class and Cayley transform in this README are citations of OperatorTheory ids, and `OperatorTheory` appears under `## Exact supplier contracts`, not as a consumer at :28.

## R03 (P2) — Two open pull requests build the same folder and the same V0–V4 targets

**Location:** `README.md:191–1010` (Layers 0–4) against pull request 1041, folder `TauCetiRoadmap/VonNeumannAlgebras/` ("Von Neumann algebras: operator foundations and measurable fields", layers V0–V4 with V4.Core, V4.PositivePredual, V4.Normality, V4.0.Fields).

**Claim:** Two open pull requests by the same author each add `TauCetiRoadmap/VonNeumannAlgebras/` and each plan V0–V4 (bicommutant, Kaplansky, corners, tensors, type I, preduals, normality, measurable fields) with Lean definitions of the same objects (`IsFactor`, `ProjectionEquivalent`, `ProjectionSubequivalent`, `equivalent_of_subequivalent`, `double_commutant_iff_isClosed_image_ofCLM`, `IsCyclic`, `IsSeparating`, `isCyclic_iff_isSeparating_commutant` appear in both `Suggested.lean` files, under namespaces `VonNeumannAlgebra` and `TauCetiRoadmap.VonNeumannAlgebras`). One object has two owners, and main `OperatorTheory` already cites the other one (R02).

**Witness:** `roadmaps list` shows `#889 VonNeumannAlgebras (new)` and `#1041 VonNeumannAlgebras (new)`; `roadmaps show VonNeumannAlgebras --pr 1041 --file Suggested.lean` lines 24–83; this pull request's description calls 1041 "the earlier foundations snapshot".

**Repair:** One owner per object. Together with R02: let pull request 1041 be the foundations roadmap and this one its Part II (introduction says where the base stops, V0–V4 deleted here and cited by section), or close 1041 and split this folder yourself into the same two pieces. Control: exactly one open pull request declares `IsFactor` on `VonNeumannAlgebra H`, and `SelfAdjointSpectralTheory`'s V4.0.Fields citation resolves into the surviving foundations folder.

## R04 (P3) — The two companion Lean files are not in roadmap form and duplicate or pad the acceptance module

**Location:** `FiniteComplexModularTargets.lean:1–2`, `:4–9`, `:11`, `:26`, `:34`; `ProjectionClosureTargets.lean:1–3`, `:5–13`, `:17`, `:34`, `:41`. Both files are unchanged since 87aeca1.

**Claim:** Each file imports Mathlib submodules instead of the single `import Mathlib` (R08 not repaired there); each opens with "**This file is not the roadmap and is not exhaustive.** These are suggested forms" instead of the "target signatures" docstring, and uses namespaces `…JonesFiniteModular`, `…ProjectionClosure` (R15); `wot_closure_projections` (ProjectionClosureTargets:34) states, verbatim, the same theorem as `closure_isStarProjection_eq_positive_contractions` (Suggested:102), so one statement has two declarations; `isClosed_projections_of_finiteDimensional` (:41) is the boundary case the README keeps as a Check (R07); `diagonalModularPower_preserves_star_iff` (FiniteComplexModularTargets:34) is the diagonal special case of V10.FiniteComplexPowers, whose README form now admits a non-diagonal density (README:1836–1842) that this signature cannot take (R06). `diagonalModularPower_star` at :26 has no docstring. Neither file is part of the targeted build.

**Witness:** Both files elaborate at the pin (`lake env lean`: 2 and 3 `sorry` warnings, nothing else). The non-diagonal density `h=[[1/2,1/6],[1/6,1/2]]` of the README Check has `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]` (recomputed below) and is not a `Fin 2 → ℝ`.

**Repair:** Delete both companion files; the README keeps every statement (the projection-closure headline is already in Suggested, the finite-dimensional boundary case and the diagonal/non-diagonal densities are Checks of V1 and V10). Do not prove anything in place. If the finite complex-power criterion is meant as a headline, state it once in `Suggested.lean` on `Matrix (Fin n) (Fin n) ℂ` with a positive-definite `h` and the hermitian functional calculus, or name it in the module docstring as not statable.

## R05 (P3) — Library citations that do not resolve at the pins or are attributed to the wrong supplier

**Location:** `README.md:71–72` ("Analytic crossed products use `VonNeumannAlgebra.CrossedProduct`"); `:1881–1882` ("Consume ModularForms Layer2's convolution, including its native `DoubleCoset.multiplicity` and `HeckeCosetModule.single_mul_single`"); `:1945–1946` ("Consume native `HeckeAntiInvolution.ofAmbient` and `HeckeCosetModule.mul_comm_of_antiInvolution`"); `## Exact supplier contracts`, "From Tau Ceti" (:131–137).

**Claim:** `VonNeumannAlgebra.CrossedProduct` does not exist in Mathlib at the pin (grep of `Mathlib/` for `CrossedProduct`: no hit), so the convention names a carrier this roadmap must define. The four Hecke declarations are not Mathlib and not ModularForms targets: they are Tau Ceti declarations (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean:79` `structure HeckeAntiInvolution`, `:135` `def ofAmbient`, `:459` `theorem mul_comm_of_antiInvolution`; `HeckeRing/Multiplication.lean:124` `lemma single_mul_single`; `HeckeRing/Multiplicity/Basic.lean:70` `def multiplicity`), and none of these modules is listed under "From Tau Ceti".

**Witness:** Mathlib's `NumberTheory/HeckeRing/Defs.lean` defines only `HeckeCosetModule`, `HeckeRing` and `IsHeckeTriple` (lines 183–195); the convolution product is Tau Ceti's, as main `ModularForms/README.md:200–202` itself says.

**Repair:** Replace :71–72 by the carrier this roadmap defines (`M ⋊_α G` as the generated von Neumann algebra of V8), and move the five Hecke-ring declarations to "From Tau Ceti" with their modules (`TauCeti.NumberTheory.HeckeRing.{Multiplication,Commutativity,Multiplicity.Basic}`), keeping ModularForms Layer 2 only for what it still supplies.

## R06 (P3) — Form: most targets have no `*Needs:*` line, most definitions no Checks, three layers and 13.1 no locator, and two sources are cited without a reference entry

**Location:** `README.md` throughout; `:473` ("Preserve Grundling 5.13(ii)'s unpinned product notation as source text"), `:895` ("as required by Jones's handwritten notes (p. 22)"), `:3337` (Jones typed notes URL), `:2922–2941` (13.1).

**Claim:** `*Needs:*` lines exist on four targets only (V2.PolarDecomposition :407, V2.BorelCalculus :426, V12.J.Frame :2769, V12.J.Bloch :2849); every other target's inputs are buried in prose ("Consume …"). `**Checks.**` blocks exist in Layers 1, 4, 5, 7, 10 and 12.J only; definitions with no Checks at all include the state space (V0), `M ⊗̄ N` and `ITP(H,ξ)` (V2), minimal/abelian/properly infinite projections (V3), normal semifinite traces and type II∞ (V6), group von Neumann algebra, crossed product and proper outerness (V8), formal degree (V9), weights, `S(M)`, `T(M)` and the core (V11), central sequences, property Γ and `M^ω` (V12), injectivity, semidiscreteness and hyperfiniteness (V13). Layers 6, 7 and 9 carry no source locator at any theorem, and 13.1 states Arveson's extension theorem and Tomiyama's theorem with no locator. "Grundling" and "Jones's handwritten notes" are cited but absent from `## References`; the Jones typed-notes URL returns HTTP 404 (both rounds), so that reference has no readable legal locator and should be marked as such or replaced.

**Witness:** `grep -c '\*Needs:\*' README.md` = 4; `grep -c '\*\*Checks\.\*\*' README.md` = 8 blocks; `grep -n -i grundling README.md` = line 473 only.

**Repair:** Give each target its `*Needs:*` line (statement and route inputs, item by item), each definition three discriminating Checks (the computed values in the table below are ready-made for most of them), add locators to Layers 6, 7, 9 (Takesaki I V.2 for the trace/type decomposition, Jones or Peterson for coupling constants, Goodman–de la Harpe–Jones 3.3 for the discrete-series dimension) and to 13.1 (Arveson, *Subalgebras of C*-algebras*, Acta Math. 123 (1969), Theorem 1.2.3; Tomiyama, Proc. Japan Acad. 33 (1957), Theorem 1), add Grundling and the handwritten notes to the references or delete the sentences, and record the Jones notes as uncertified.

## Verified sound

**Scope.** All 3,404 README lines and all three Lean files (200 + 43 + 45 lines) were read; the normative README and CONTRIBUTING; main `OperatorTheory` (five sub-roadmaps), `BanachAlgebras`, `BanachSpaceTheory`, `AmenableGroups`, `RepresentationTheory/{CompactGroups,SemisimpleAlgebras,LieHighestWeight}`, `ModularForms`, `GlobalNumberFields`, `OptimalTransport`, `TypeAHeckeAlgebras`, `OperatorAlgebraDynamics`, `Completed/ArithmeticDirichletSeries`; the open heads of `CStarAlgebras`, `NoncommutativeIntegration`, `Subfactors`, `OperatorTheory/UnboundedOperators` and `VonNeumannAlgebras` (1041). No file of the worktree was changed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. No algorithm target, `set_option`, admitted example, stray file, `lemma`, sorried data or copied source passage was found; no pull-request number, process word or machine path in the folder.

**Gate** (worker, at d6a00eb): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Every previously failing rule now passes; the gate does not look at the companion files' imports (R04).

**Dependency check** (verbatim):

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists this roadmap third (after KacMoody and LefschetzPencilsAndVanishingCyclesPartII); the cycles of R01 are in prose citations the check does not parse, so the 0 is not evidence against R01.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree: exit 0, exactly 10 `declaration uses sorry` warnings (lines 71, 82, 91, 102, 119, 139, 168, 176, 183, 192), nothing else. A scratch copy with `#check @name` for all 18 declarations elaborated; every elaborated type keeps its section binders (`[CompleteSpace H]` on all 17 `H`-declarations; `[μ.IsHaarMeasure] [μ.Regular] [Countable ↥Γ]` and `Dense ↑Γ` on `ergodicSMul_dense_subgroup`; `[Nontrivial A] [SeparableSpace A]` on the ℓ² theorem), and each agrees with its README statement (bicommutant :345–347, Kaplansky :358–360, projection closure :341–343, cyclic/separating :880–882, Schröder–Bernstein :1015–1017, trace uniqueness/existence :1043–1053, simplicity :1079, dense translations :1588). **18 signatures checked, no dropped binder, nothing changed.** One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp` with the file's definitions unfolded) on the same copy: all 10 theorems still report `sorry`; none closes, no padding by that test. Companion files: 2 and 3 `sorry` warnings, no other diagnostic.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; paths library-relative): `Analysis/VonNeumannAlgebra/Basic.lean` (`VonNeumannAlgebra`, `commutant`, `centralizer_centralizer`, `WStarAlgebra`); `Analysis/InnerProductSpace/WeakOperatorTopology.lean:38` `ext_inner`, `:71` `continuous_iff`, `tendsto_iff_forall_inner_apply_tendsto`; `Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:155` `toPointwiseConvergenceCLM`, `tendsto_iff_forall_tendsto`; `Analysis/Normed/Operator/BanachSteinhaus.lean` `banach_steinhaus`; `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` (`PreGNS` :57, `GNS` completion, `gnsStarAlgHom`, `gnsNonUnitalStarAlgHom`); `Analysis/CStarAlgebra/PositiveLinearMap.lean` `exists_norm_apply_le`; `Analysis/LocallyConvex/WeakDual.lean` (`dualEmbedding_surjective`, `rightDualEquiv`); `Analysis/LocallyConvex/SeparatingDual.lean` `eq_zero_of_forall_dual_eq_zero`; `Analysis/InnerProductSpace/TensorProduct.lean:145` `instInnerProductSpace`, `mapL`, `commIsometry`, `assocIsometry`; `MeasureTheory/Constructions/Pi.lean` (`pi_caratheodory`, `measurePreserving_piFinTwo`); `MeasureTheory/Measure/Prod.lean` `prod_eq`; `MeasureTheory/Function/SimpleFuncDenseLp.lean:693` `simpleFunc.denseRange`; `MeasureTheory/Function/LpSpace/DomAct/Continuous.lean` `instContinuousSMulDomMulAct`; `Probability/ProductMeasure.lean` (`infinitePi`, `:401` `infinitePi_pi`, `eq_infinitePi`, `infinitePi_map_piCongrLeft`); `Probability/Independence/InfinitePi.lean` `iIndepFun_infinitePi`; `Dynamics/Ergodic/Action/Basic.lean:43` `ErgodicSMul` (extends `SMulInvariantMeasure`; a left Haar measure is left-invariant under a subgroup acting by left multiplication, so the Lean hypothesis set is complete); `Dynamics/Ergodic/Action/OfMinimal.lean:89,148` (finite-measure dense-stabiliser theorems; they do not cover the noncompact Haar case, as the README says at :1590–1592); `NumberTheory/HeckeRing/Defs.lean:183–195`; `RingTheory/DedekindDomain/FiniteAdeleRing.lean`; `NumberTheory/LSeries/PrimesInAP.lean` (`vonMangoldt.residueClass`, `continuousOn_LFunctionResidueClassAux`, `eqOn_LFunctionResidueClassAux`); `Algebra/Algebra/Unitization.lean` `starLift`; `Analysis/CStarAlgebra/ApproximateUnit.lean`; `Algebra/Star/UnitaryStarAlgAut.lean` `conjStarAlgAut`; `Algebra/Group/Invertible/Defs.lean:190` `Invertible.copy` (an `abbrev`), `Invertible.map`; `Algebra/Symmetrized.lean` `sym_mul_sym`, `Algebra/Jordan/Basic.lean` `IsCommJordan`; `Analysis/CStarAlgebra/GelfandDuality.lean` (`gelfandTransform_isometry`, `gelfandTransform_bijective`, `gelfandStarTransform`); `MeasureTheory/Integral/RieszMarkovKakutani/Real.lean` (`rieszMeasure`, `integral_rieszMeasure`); `Analysis/InnerProductSpace/LinearPMap.lean` (`adjoint_isClosed`, `isSelfAdjoint_def`); `Algebra/Star/StarProjection.lean` `IsStarProjection`. Missing at the pin: `VonNeumannAlgebra.CrossedProduct` (R05). Tau Ceti: all eleven modules named under "From Tau Ceti" and in V10.AffineAP exist, and `aestronglyMeasurable_of_measure_ne_top`, `AEFinStronglyMeasurable.aestronglyMeasurable_smul`, `ContRepresentation.integratedOperatorL1`, `wienerIkehara`, `higherPrimePowerTheta_isBigO`, `primePowerSummatory_isLittleO_of_le_higherPrimePowerWeight`, `primeCount_sub_mul_logIntegral_isLittleO`, `primeCount_asymptotic_of_primeTheta`, `logIntegral_isEquivalent_div_log` are declared in the named files; the Hecke declarations are in `HeckeRing/{Commutativity,Multiplication,Multiplicity/Basic}.lean` (R05).

**Cross-roadmap citations resolved** (each opened at main or at the named head): BanachSpaceTheory B1 `:41`, B2 `:74` (James `:85`, Krein–Šmulian `:91`), B4 `:167` (nuclear operators `:210–226`, Schmidt series `:226–244`), B5 `:255`; BanachAlgebras A3 `:407`, A7 `:875`, A7.RegularL2 `:935`; AmenableGroups Layers 5–7 `:289`, `:391`, `:415`; CompactGroups (Peter–Weyl, README:1–18), SemisimpleAlgebras Layer 3 double centralizer `:288`, LieHighestWeight Clebsch–Gordan `:348`; ModularForms Layer 2 Hecke convolution `:200–221`; GlobalNumberFields Layer 4 finite adeles `:412`; OptimalTransport Layer 2 `:444` (analytic-set completion measurability `:459`) and Layer 8 `:974` (Jankov–von Neumann `:1004`); Completed/ArithmeticDirichletSeries Layer 9 Wiener–Ikehara `:105`; Completed/OneParameterSemigroups exists. Consumers named under "Downstream consumers" resolve: SelfAdjointSpectralTheory `:255,:690,:1391`; OperatorAlgebraDynamics `:46,:316`; BanachAlgebras `:55,:997`; TypeAHeckeAlgebras H3 `:366`; CStarAlgebras head `:41,:467,:499`. Open-head consumers: NoncommutativeIntegration consumes V4–V7 and identifies its tracial Lp with this roadmap's (`:34`, `:302`), Subfactors consumes the index `[M:N]=dim_N L²(M)` (`:48–53`, `:97`), UnboundedOperators UO-A07 consumes V10.ClosedOperators (`:31`). Ownership search by object (`roadmaps grep` for bicommutant, Kaplansky density, Tomita, continuous core, property Γ, injective factor): no roadmap other than pull requests 889 and 1041 plans them; the other hits are consumers. Ownership against open pull requests whose files the brief did not supply was not checked.

**Seeded sample (13.1, 13.2) and sampled locators.**

| Target | Text, locator, outcome |
| --- | --- |
| 13.1 Arveson extension, Tomiyama | No locator in the README (R06). Arveson 1969 resolves only to a paywalled page (uncertified); Tomiyama's Project Euclid page yielded a landing page without text. The statements as written (CP extension from concrete operator systems to `B(K)`; norm-one projection onto a C*-subalgebra is a CP bimodule map) are the standard theorems; checked on the instances in the table. |
| 13.2 min-norm criterion | Takesaki III XV.3 Theorem 3.1/Definition 3.5: uncertified (paywalled). The statement is Effros–Lance/Choi–Effros; checked on `M₂` and `ℂI`. |
| 13.2 Haagerup 1985 §§2–5 | Uncertified (paywalled DOI). |
| 13.2 Haagerup 1987 §§1–2 | Uncertified (paywalled DOI). |
| 13.2 Haagerup 2016 (arXiv 1606.03156v1) | Theorem 1.1 (`haagerup2016 line 49`), 1.2 (line 52), 2.4 Connes–Størmer transitivity with separable predual (line 222), 2.8 δ-related tuples (line 284), 3.1 injective III₁, separable predual, ucp `T:M_m→N`, `‖σ_t^φ∘T−T∘σ_t^ψ‖≤δ|t|` (line 313), 4.2 Q-stable state exists (line 635), Lemma 4.4 expected `R_∞` subfactor (line 669), Theorem 5.1 (line 868), Lemmas 5.4–5.6 (lines 1109, 1347, 1540). Definition 4.1 of Q-stability (lines 628–634) is exactly the README's `Σu_iu_i*=1`, `φu_i=m⁻¹u_iφ` (:3252–3254). All hypotheses (injective, III₁, separable predual) match the README. Supports the statements as written. |
| 13.2 Haagerup 1989 (PJM 137) §2 | Theorem 2.3 (`haagerup1989 line 183`): uniform δ-related-tuple theorem over all von Neumann algebras and normal bimodules; its proof uses a Hilbert ultraproduct (line 427). Supports README:3257–3269. |
| 13.2 Connes 1985 (JOT 14) | OCR text; bicentralizer triviality for injective III₁ is the paper's subject (lines 13, 19, 62). Supports the statement-level citation. |
| 13.2 Connes–Feldman–Weiss | The IHES link returns a catalogue page (102 lines, no theorem text); Definitions 5–6 … Theorem 10 not verifiable. |
| 13.2 Connes–Woods §7, Runde 6.4 | Not readable (Cambridge landing page; paywalled book). |
| 13.2 Connes 1975 (periodic automorphisms, OCR) | Theorem 5.1 (`connesperiodic1975 line 647`) and Theorem 6.2 (line 784): outer-conjugacy classification by outer period and obstruction. Supports README:3166–3167. |
| V4.PositivePredual | Peterson Theorem 4.3.3, printed p. 62 (`peterson2013 line 2436`): Jordan decomposition `φ=φ₊−φ₋`, `‖φ‖=‖φ₊‖+‖φ₋‖` for normal Hermitian functionals, no finiteness hypothesis; Corollary 4.3.4 p. 63 (line 2462). Supports the target. |
| V12.J.Dye | Hamhalter Theorem 4.3, preprint p. 14 (`hamhalter2014 line 627`): orthoisomorphism `P(A)→P(B)` with no type I₂ summand of `A` only. Matches README:2809–2813 including "the target N need not be assumed separately free of type I₂". |
| V12.J.Scalar | Bunce–Wright Theorem A/B (`bunce-wright1992 lines 53–59`); the bound `‖β‖≤4 sup|β(p)|` (line 86) is the README's `‖φ‖≤4C`. |
| V11 property L_μ, ratio set | Connes 1973 Théorème 3.5.4 for `λ∈]0,1/2[` (`connes1973 line 2676`) and Théorème 3.6.1 (line 2770, extraction page 72 = printed p. 204). Supports README:2438–2440 and the §3.6.1 citation. |

**Computed adversarial pass** (values on both sides; "retain" means the instance confirms the statement; no row changed a statement).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | ℂ acting by scalars on ℓ²: injective, span of orbits = ℓ² (dense); A=0: zero representation has span {0}, not dense in ℓ²≠0, excluded by `Nontrivial` | retain |
| V0.SeparableFaithful series | A=ℂ, φ_n=id | `Σ2^(−n−1)=1=‖ψ‖`, `ψ(a*a)=|a|²>0` | retain |
| V0 functional norms | `∫6t²=2`, `∫3t²=1`; `Tr(I_n)=n` | norms 2, 1, n as stated | retain |
| V0 amplification cyclicity | B(ℂ²) on ℂ²⊕ℂ², ξ=(e₁,e₂) vs (e₁,e₁) | independent: orbit {(Te₁,Te₂)}=ℂ⁴; dependent: orbit ⊆{(v,v)}, codimension 2 | retain |
| `double_commutant_iff_isClosed_image_ofCLM` | A=ℂI, A=M₂, H=0 | (ℂI)″=ℂI, M₂″=M₂, both WOT-closed; H=0 trivial | retain |
| Generation Check (Layer 1) | S={e₁₂} | S′={aI+be₁₂}, S″=span{I,e₁₂} (dim 2) ≠ M₂; with e₂₁ adjoined, e₁₂e₂₁=e₁₁ and all of M₂ | Check correct |
| Kaplansky (`closure_unitBall…`) | A=ℂI; A=finite rank+ℂ on ℓ² | balls {cI:|c|≤1} equal; P_n→1 SOT with ‖P_n‖=1 shows 1∈SOT-closure of A's ball | retain |
| Projection closure dilation | C=1/4 on a line | P=[[1/4,√3/4],[√3/4,3/4]]: P²=P, P*=P, P₁₁=1/4 | retain |
| Projection closure hypothesis | H=ℂ; H=0 | projections {0,1} closed, 1/2 outside; H=0 both sets {0} | ¬FiniteDimensional necessary, retain |
| SOT-closed projections | P_n→P SOT | P²=P by bounded joint continuity, P*=P as WOT limit of self-adjoints | retain |
| Ultrastrong ≠ strong (T_F) | F ranging over all finite-dimensional subspaces | ξ∈F eventually ⇒ T_Fξ=0; φ(T_F)=φ(P_η)/φ(P_η)=1 | retain |
| Non-metrisability (`e_m+m e_n`) | square-summable family ξ_i | seminorm² `Σ_i|ξ_i(m)|²+m²Σ_i|ξ_i(n)|²`→0 choosing m then n; a sequence with m_k→∞ and ξ(n_k)=m_k^(−1/2) gives ⟨ξ,T_kξ⟩≥1 | retain |
| `T_n e₀=n^(−1/2)Σ_(k≤n)e_k` | η∈ℓ² | ‖T_ne₀‖=1; `n^(−1/2)|Σ_(k≤n)η_k| ≤ n^(−1/2)Σ_(k≤N)|η_k| + (Σ_(k>N)|η_k|²)^(1/2)`→0 | retain |
| V2.PolarDecomposition | shift S; x=0; unitary | |S|=1, v=S; |S*|=SS*=1−e₀e₀*; v=0; v=x,|x|=1 | retain (re-planned, R02) |
| V2.BorelCalculus | a=mult. by t on L²[0,1]; diagonal on ℓ² | 1_[0,1/2](a) infinite-rank projection, 1_{t₀}(a)=0; atomic μ | retain (R02) |
| Support projection | a=diag(1,1/2,0) | (a/‖a‖)^(1/n)=diag(1,2^(−1/n),0)→diag(1,1,0) | retain |
| V2.RectangularL2 rectangles | μ(A)=2,ν(B)=3; μ(A)=∞,ν(B)=0 | κ(A×B)=6; 0 (cover by itself has cost ∞·0=0) | retain |
| Two product conventions | μ=ν=∞·Lebesgue on [0,1], diagonal D | bind product ∫ν({x})dμ=0; any rectangle cover of D with one null side projects to a null cover of [0,1], so κ(D)=∞ | retain |
| ITP raw prefixes | ζ_n=−η_n | ⟨Ω_m,Ω_l⟩=∏_(m<j≤l)⟨η_j,ζ_j⟩=(−1)^(l−m): not Cauchy; `Σ(1−|⟨ζ,η⟩|)=0` | retain |
| ITP equivalence criterion | phases c_n with c_n⟨ζ_n,η_n⟩≥0 | `Σ|1−c_n⟨ζ_n,η_n⟩|=Σ(1−|⟨ζ_n,η_n⟩|)`; `‖ζ_n−c_nη_n‖²=2(1−|⟨ζ_n,η_n⟩|)` | three conditions equivalent, retain |
| V2.NonmodularProjectionLattice | D(x)_n=x_n/(n+1), y_n=1/(n+1) | y∈ℓ²; Dx=y forces x_n=1∉ℓ²; B∧C: Dx=cy ⇒ x=c·(1,1,…) ⇒ c=0; A∨B⊇ℓ²⊕ran D dense; A∨(B∧C)=A≠C=(A∨B)∧C | retain |
| Layer 3 dimension-3 algebras | C³ in M₂? | three orthogonal nonzero projections need rank ≥3>2 | retain |
| V4.Core predual norm | h=diag(2,−1) | ‖φ_h‖=3=‖h‖₁; h₊=diag(2,0), h₋=diag(0,1), 2+1=3 | retain |
| V4.PositivePredual complex spanning | density i·e₁₁ | φ=iψ, ψ a state; real differences alone miss φ | retain |
| `IsCyclic`/`IsSeparating`/iff | M₂ on ℂ², ξ=e₁; diagonal algebra; H=0 | e₁ cyclic (M₂e₁=ℂ²) not separating (e₁₂e₁=0), separating for ℂI; (1,1) cyclic and separating, (1,0) neither; H=0: both true | both directions, retain |
| Faithful C*-state counterexample | A=C([0,1],M₂) | φ(a*a)=0 ⇒ each column vanishes on a dense set ⇒ a=0; projection at coordinate 0 onto v₀^⊥ is nonzero and kills Ω | retain |
| `ProjectionEquivalent` orientation | v=e₂₁ | v*v=e₁₁, vv*=e₂₂: e₁₁∼e₂₂ as the Conventions say | retain |
| `ProjectionSubequivalent` | M₂: e₁₁≼1 (v=e₁₁); 1≼e₁₁? | rank 2 > 1, impossible | order direction, retain |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, q=1−e₀e₀* | S*S=1, SS*=q: 1≼q; q≼1 trivially; conclusion 1∼q true, 1≠q | equivalence not equality, retain |
| `IsFactor` | M₂; diag(ℂ²); H=0 | true; diag(1,0) central non-scalar; 1=0 | retain |
| `IsFinite` | M_n; B(ℓ²) | true; S*S=1, SS*≠1 | retain |
| `IsTypeIIOne` | M_n; B(ℓ²); R | rank-one projections minimal; not finite; true | retain |
| `IsTracialState` | tr/n; x↦x₁₁ on M₂ | τ(e₁₂e₂₁)=τ(e₁₁)=1 ≠ 0=τ(e₂₂)=τ(e₂₁e₁₂) | discriminates, retain |
| `tracialState_unique` | ℂ⊕ℂ; B(ℓ²) | t·pr₁+(1−t)·pr₂ tracial for all t (factor needed); 1=SS*+e₀e₀* with both summands ∼1 ⇒ τ(1)=2τ(1)=0, none | retain |
| `isSimpleRing_of_isTypeIIOne` extraction | a=diag(1,1/2), ε=1/2 | f_ε(a)=diag(1,2), a·f_ε(a)=I=1_[1/2,∞)(a)≠0 | retain |
| V6.LatticeTypes central formulas | R⊕B(ℓ²)⊕M_III | z_I=(0,1,0), z_sf=(1,1,0), z_fin=(1,0,0): z_III=(0,0,1), z_II1=(1,0,0), z_IIinf=(0,0,0) (B(ℓ²) is I∞) | retain |
| V7 dimension normalisation | N=M₂: L²(N), ℂ²; corner p=e₁₁ | dim 1 and 1/2 (unnormalised trace would give 2, 1); dim_(pNp)(pℂ²)=1=(1/2)/(1/2) | retain |
| V8.SubgroupCosets | S₃⊃⟨(12)⟩ (index 3); ℤ⊃{1} | finite expansion with 3 coset unitaries; `Σ_(n≥1)2^(−n)zⁿ` has infinitely many nonzero coefficients | retain |
| V8.Bernoulli stabiliser/freeness | finite support F, f∈F; g of order 2, fair coin | g↦gf injects Stab(F) into F f^(−1): |Stab|≤|F|; k disjoint 2-cycles equal-coordinate probability 2^(−k)→0 | retain |
| `ergodicSMul_dense_subgroup` | Γ=ℚ⊂ℝ, Lebesgue | ℝ=⋃_(q∈ℚ)(q+(−1,1)) σ-compact; invariant L∞ classes constant, [0,1] not invariant | retain |
| V9 covolume ratios | G=ℝ, H=ℤ, K=θℤ, K′=(1+θ)ℤ | dimensions θ, 1/θ; K′ gives 1+θ≠θ | retain |
| V10.ClosedOperators spectra | Tf=f′ on L²[0,1] | f(0)=0 domain: Volterra inverse ⇒ spectrum ∅; periodic: e^(2πikx) ⇒ 2πiℤ | retain (R02) |
| V10.FiniteComplexPowers diagonal | h=diag(2/3,1/3) | β₁(e₁₂)=2e₁₂, β₁(e₂₁)=e₂₁/2, β₁(e₁₂)*=2e₂₁≠e₂₁/2 | not star-preserving, retain |
| V10.FiniteComplexPowers non-diagonal | h=[[1/2,1/6],[1/6,1/2]] | det=2/9, h^(−1)=[[9/4,−3/4],[−3/4,9/4]], β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]], adjoint [[9/8,3/8],[−3/8,−1/8]]=h^(−1)e₁₁h=β_(−1)(e₁₁) | Check correct; signature of companion cannot take h (R04) |
| Star locus | h^(2Re z) central | β_z(x)*=β_z(x*) ∀x ⇔ h^(2Re z) commutes with all x; h=I/2: every z; noncentral h: Re z=0 | retain |
| V10.KMS entire F | x=e₁₂, y=e₂₁, h=diag(2/3,1/3) | F(0)=Tr(he₁₁)=2/3=φ(xy); F(i)=Tr(xhy)=1/3=φ(yx) | boundary equations hold, retain |
| V10.Hecke L,R | g=(m/n,b), H={(1,k)} | gHg⁻¹={(1,αk)}, H∩gHg⁻¹=(1,mℤ): L=m, R=n; T-ratio R/L=α⁻¹ | retain |
| Hecke `‖w_g‖²=R(g)` | w_g=λ(1_(HgH))δ_H | w_g(Hg′)=1_(HgH)(g′), supported on [H:H∩g⁻¹Hg]=R(g) right cosets | retain |
| V10.AffineHecke state | n=2 | s₂*s₂=1, φ(s₂s₂*)=1/2; m(2Ẑ)=1/2=q⁻¹ | retain |
| V11 core trace scaling | θ_s(u_t)=e^(ist)u_t, h^(it)=u_t | θ_s(h)=e^s h; Tr(θ_s(x))=φ̂(θ_(−s)(h⁻¹)x)=e^sTr(x) | retain |
| V11 cocycle normalisation | φ=2ψ | (Dφ:Dψ)_t=2^(it)·1 | retain |
| V11 invariants | R_λ | T=(2π/log λ)ℤ, S={0}∪λ^ℤ; L_μ for 0<μ<1/2 (Connes 3.5.4) | retain |
| V12 two projections | p=e₁₁, q=½[[1,1],[1,1]] | (p−q)²=I/2 central; pqp=p/2 | retain |
| V12 R⊕ℂ regression | τ=(1/4)τ_R+(3/4)·, u_n=diag(1,−1) at site n | (u_n,0) central, τ=0, not unitary; dist² to centre ≥1/4; unitary (v,z): |τ|≥3/4−1/4=1/2 | not a Γ witness, retain |
| V12.J.Frame dim 2 | f=1/2+sgn(n₃)/4 | antipodal sum 1; axis values 3/4,1/4,1/2 force induced 1/2+n₃/4, at (1/√2,0,1/√2) 0.677≠3/4 | retain |
| Signed reduction | f=|v₁|²−1/2 on ℂ³ | weight −1/2; +1/2 ⇒ |v₁|², T=diag(1,0,0); −I/2 ⇒ diag(1/2,−1/2,−1/2), trace −1/2 | retain |
| V12.J.Bloch | n=(1/√2,0,1/√2) | image (1,0,2)/√5; pulled-back (1+2/√5)/2≈0.947 vs Born 0.854; images of ±-pair have inner product −3/5 | retain |
| V12.J.Maps transpose | x=e₁₂, y=e₂₁ | (xy)ᵀ=e₁₁, xᵀyᵀ=e₂₂; Jordan products both I/2 | not multiplicative, Jordan, retain |
| 13.1 CP vs positive, expectation | transpose on M₂; diagonal E:M₂→ℂ² | Choi matrix of transpose has eigenvalue −1; E(I)=I, E(e₁₂)=0, ‖E‖=1 | retain |
| 13.2 Q-stability | Definition 4.1, Haagerup 2016 | `Σ_(i≤m)u_iu_i*=1`, `φu_i=(1/m)u_iφ` — identical to README:3252–3254 | retain |
| 13.2 Powers–Størmer | h=diag(1,0), k=diag(1/4,0) | ‖h^(1/2)−k^(1/2)‖₂²=1/4 ≤ ‖h−k‖₁=3/4 | retain |
| 13.2 semidiscreteness of M₂, ℂI | identity factorisations | exact factorisation through M₂ (error 0); through ℂ | nets allow exact finite case, retain |
| V10.AffineAP | d=4,a₀=1; d=3 pair | residue 1/2, π_(4,1)(20)=3; p=103,q=211 ≡1 mod 3, |q/p−2|=5/103<1/10 | retain |

**Source issues**: see the section below (none found this round).

## Not verifiable

- **Takesaki I–III, Runde 2002, Haagerup 1985 (JFA), Haagerup 1987 (Acta), Arveson 1969 (Acta), Connes–Woods 1985, Connes–Størmer 1978, Gleason 1957, Høegh-Krohn–Landstad–Størmer 1981:** the service resolved each only to a paywalled page or landing page (`needs-references.toml` lists those it could not settle). Their locators are cited by number and were not read.
- **Connes–Feldman–Weiss:** the IHES archive address returns a catalogue page without the text (102 lines); Definitions 5–6, Proposition 7, Lemmas 8–9, Theorem 10 unread.
- **Tomiyama 1957:** the Project Euclid page returned a landing page without the article text.
- **Jones, typed 2015 notes and handwritten notes:** the Vanderbilt URL returns HTTP 404 (also in the previous round); "p. 13" and "p. 22" are unverifiable, and the handwritten notes have no reference entry (R06).
- **Kadison–Ringrose, Conway, Reed–Simon, Rudin, Arveson's *Invitation*, Goodman–de la Harpe–Jones, Wassermann, Connes–Takesaki, Araki–Woods, Haagerup 1979:** textbook or paywalled journal locators cited by number, not fetched this round.
- **Takesaki III XV.3.1/3.5 for the min-norm criterion of 13.2:** the statement is the Effros–Lance/Choi–Effros theorem and passes the finite instances above; the book locator itself is unread.

## Source issues

- none
