# Review of DiamondEtaleCohomology (pull request #922 at 3c67283)

**Verdict:** needs changes

## R01 (P2) — Correct the order of composition in both comparison squares

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md:449`, repeated at line 641: “`f_v ∘ λ_{Y′} = λ_Y ∘ f_qproét`”.

**Claim:** These are commuting squares of morphisms of topoi. Both displayed equations compose arrows whose source and target do not match. The pullback equations in the API have the correct order.

**Witness:** `λ_Y′ : Y′_v → Y′_qproét`, whereas `f_v : Y′_v → Y_v`; the output of the first is not the input of the second. ECD line 3762 gives the corresponding diagram.

**Repair:** At both locations write `λ_Y ∘ f_v ≅ f_qproét ∘ λ_Y′` and `ν_Y ∘ f_qproét ≅ f_ét ∘ ν_Y′`. For the fold `P ⊔ P → P`, both corrected paths have source `(P ⊔ P)_v` and target `P_qproét` (respectively source `(P ⊔ P)_qproét` and target `P_ét`); their inverse images send `M` to `(M,M)`. Keep the already correctly directed mate transformations.

## R02 (P2) — Resolve the failed pro-p supplier edge against completed work

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md:108`, also lines 2554, 2607, 2615, 2623 and 2658: “`ProfiniteProPGroups`, Layers `2, 3` and `6`”.

**Claim:** The required dependency gate fails on these citations. The movable check cannot move this roadmap past the named supplier without crossing ClassicalAdicEtaleCohomologyPartII.

**Witness:** The supplied check reports `UPWARD: DiamondEtaleCohomology (#83) -> ProfiniteProPGroups (#245)`. However, `Completed/ProfiniteProPGroups/README.md:89` already records the Sylow dimension theorem; its implementation is present at the Tau Ceti pin.

**Repair:** Cite the completed main-branch supplier unambiguously, preferably by the exact pinned declarations in its ProP, Sylow and cohomological-dimension modules, rather than a dependency on its open revision. In particular use `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq` and `TauCeti.IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp` for C8.28, and pin the generic Sylow inputs of C8.33–C8.39 similarly. Re-run the unchanged dependency gate. The replacement is valid on `S₃` at prime 2: its Sylow subgroup is `C₂`, and both dimensions are infinity; at prime 5 both dimensions are zero.

This is a **false positive as a claim of an actual mathematical supply cycle**: completed work on main is an allowed supplier. It remains a reported gate failure under this job's acceptance rule. Do not move the roadmap after an open revision or duplicate the completed theory to satisfy the checker.

## R03 (P3) — Remove the ten HTML anchors rejected by the gate

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md:300`: “`<a id="c0"></a>`”; also lines 631, 767, 972, 1194, 1444, 1589, 1667, 2095 and 2869.

**Claim:** All ten anchors fail the `residue` rule.

**Witness:** Both the supplied gate and the independent rerun report `residue=10`; these are the ten matching lines, one before each layer.

**Repair:** Delete those elements and use the Markdown heading anchors for links. Each layer still has its `## Layer Ck` heading after deletion, so no content or ordering is lost. Re-run the gate.

## R04 (P3) — Keep unstated API names and Check names out of the README

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md:315`: “`etaleSite.mem_iff_surjective_points`”; lines 790–795 similarly name `Det` declarations absent from Lean.

**Claim:** The README presents an API catalogue of its own backticked declaration names, including named Checks, while the acceptance file declares only eleven names. Under the required form, an own API name in backticks claims a declaration in `Suggested.lean`; Checks must be prose.

**Witness:** `Suggested.lean:44–189` contains six theorems and five definitions, with no `etaleSite` or `Det` declarations. The locator resolver independently identifies these missing names.

**Repair:** Preserve the mathematical API and tests, but describe undeclared operations and Checks in prose. Keep backticked own declaration names only for the eleven actual declarations. For example, retain the equivalence between a covering family and coverage of underlying points without inventing its Lean name. Do not add the missing API catalogue to `Suggested.lean`. The empty-family test still distinguishes the empty target from a nonempty point.

## R05 (P3) — Use the roadmap namespace and layer markers in Lean

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/Suggested.lean:37`: “`namespace TauCeti.DiamondEtale`”.

**Claim:** This is a roadmap acceptance file, but its declarations occupy the library namespace and its sections omit the required README-order layer comments.

**Witness:** The signature probe prints `TauCeti.DiamondEtale.zariskiRiemannAcyclicity`, rather than `TauCetiRoadmap.DiamondEtaleCohomology.zariskiRiemannAcyclicity`; all eleven names share this prefix.

**Repair:** Rename the namespace and matching `end` to `TauCetiRoadmap.DiamondEtaleCohomology`; add the C5, C7, C8 and C9 module-section comments in order. Use the required “target signatures” module title and describe these as headline acceptance statements. A probe copy with this namespace change elaborates with only the six `sorry` warnings; all eleven `#check @name` results have the required prefix and unchanged mathematical binders. The layer comments do not alter those types.

## R06 (P3) — Delete target blocks that only re-export the properness supplier

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md:1240`: “Re-export D4.11's theorem that every closed immersion of `v`-sheaves is proper.” Also the imported portion of C4.1, C4.4 and C4.7.

**Claim:** These are imported results, not new targets. The scope already identifies DiamondsAndVStacks D4.11 as their sole owner, but the layer repeats its predicate and theorem API.

**Witness:** `TauCetiRoadmap/DiamondsAndVStacks/README.md:6728`, D4.11, supplies the properness predicate, closed-immersion theorem, composition, base change and perfectoid-field valuative criterion together.

**Repair:** Put those imports in the scope and exact supplier contract, delete C4.2 and the duplicate API portions, and repoint their consumers to D4.11. Retain the new partially proper theory and C4.4's stronger perfectoid-ring test. On the rank-two open-point inclusion, both the supplier and the retained theory give “not proper” and zero lifts of the identity square; no new properness predicate is needed.

## R07 (P3) — Give bibliographic identities for the three additional texts

**Location:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md:281`, “Temkin 2010, Lemma 6.3.2”; line 284 cites Scheiderer, and C8.11a (line 2358) cites Huber (1996). None has an entry in `## References` at lines 290–298.

**Claim:** The supplied section/theorem locators lack a full bibliographic identity in the references, despite being proof inputs.

**Witness:** Temkin's Lemma 6.3.2 is in *Stable modification of relative curves* (2010), not the listed *Topological transcendence degree*. Its fetched preprint has the statement at Temkin2010 line 2347.

**Repair:** Add distinct full references for Temkin's *Stable modification of relative curves*, Scheiderer's *Quasi-augmented simplicial spaces, with an application to cohomological dimension* (1992), and Huber's *Étale cohomology of rigid analytic varieties and adic spaces* (1996), with legal links or publication identifiers and version-sensitive locators. The primitive perturbation input then resolves to Lemma 6.3.2, whose radius inequality is exactly the one used in C8.4a. Unreadable texts remain uncertified, not guessed.

## Verified sound

The worktree was inspected at the specified head, without edits. Its diff outside this roadmap is empty. There is no earlier review to reconcile. I read all 189 numbered targets, their API/Check blocks and dependencies, the eleven Lean declarations, the repository writing rules, and three main-branch roadmap examples. No route restricted to convenient primes, algorithmic construction, sorry-valued data, `set_option`, or alternate group-cohomology carrier was found. Prime-to-characteristic restrictions in the geometric theorems are mathematical hypotheses, with negative controls retained.

The prescribed Lean elaboration succeeds after building the two explicitly imported Tau Ceti modules, with exactly six `sorry` warnings. An eleven-declaration `#check @name` copy confirms that no required completeness, algebraic-closedness, spectrality, noetherianity, characteristic, action-continuity or faithfulness binder disappeared. No signature was changed. One-tactic `simp`, `rfl` and `infer_instance` probes fail for all six theorem holes, and the object searches found no matching pinned theorem that closes one by a single `exact`. No padding finding is raised.

The six statable headlines are C5.7 (relative valuation-space acyclicity), C7.5 (constructibility/finitely-presentable objects and generation), C8.5 (finite generating/independent degree equality), C8.34 (wild kernel), C8.44 (spectral cohomological bound), and the topological version of C9.8 (compact generators and thick closure). All six occur in Lean. The geometric endpoints—site comparison, base change, enhanced descent/coreflection, four operations, compactification, proper base change, field invariance, diamond constructibility/descent, geometric dimension bounds and compact/perfect-constructible equivalence—are named in the docstring with missing carriers. The native adic-space foundation is not itself the analytic-residue-field interface needed by C8.49–C8.51. I found no statable headline replaced by a free predicate.

The full gate rerun still fails only `residue=10` and `depcheck=1`; the worker's targeted module build passed, and the direct elaboration independently passed. The requested movable dependency check produced:

```text
not movable: DiamondEtaleCohomology consumes ProfiniteProPGroups (#245) and is consumed by ClassicalAdicEtaleCohomologyPartII (#199), which comes first: moving DiamondEtaleCohomology after ProfiniteProPGroups would put a supplier after a consumer, a cycle through DiamondEtaleCohomology
UPWARD: DiamondEtaleCohomology (#83) -> ProfiniteProPGroups (#245) at README lines [108, 2554, 2607, 2615, 2623, 2658]
depcheck: 163 roadmaps, 1163 edges, 1 problem(s)
```

The subsequent full-gate run numbered the same ProfiniteProPGroups entry #246; the edge and six source lines were unchanged. R02 explains the false-positive interpretation. Separately, extracting explicit numbered-target references from every `*Needs:*` block gives 189 vertices and 550 distinct directed edges, no missing referenced target and no directed cycle. Forward references to the independent C8 point-presentation targets do not create a cycle. C7.24's algebraic coefficient-descent input should be proved before applying its sheaf conclusion; it is distinct from that conclusion.

**Seeded source check.** “Perfectoid field-test reduction”, README lines 2810–2835, is a synthesis of the cited ingredients, not a theorem falsely attributed wholesale to one number:

- CS17 Remark 4.2.20, printed p. 712, is the arbitrary complete-field/open-bounded-plus-ring criterion: CS17 lines 2544–2550. Its surrounding rank-one closure argument is at lines 2551–2556.
- ECD Definition 15.5 and Lemma 15.6, printed p. 91, give marked untilts and the analytic diamondification/site comparison: ECD lines 3735–3756. Both mixed and equal characteristic are retained.
- Conrad Theorem 1.1, printed p. 1, with its proof on pp. 2–3, proves algebraic closedness of the completion without a characteristic-zero restriction: Conrad lines 7–9, 43 and 56–70.
- Stacks Tag 00IA is the valuation domination ingredient: Stacks00IA lines 5504–5505. Apply it to the residue-field extension; domination of the original valuation ring forces the contracted valuation ring to equal it. Pulling back to the integer ring gives `C⁺ ∩ T = T⁺`.
- PerfectoidSpaces P3.7 and DiamondsAndVStacks D6.1/D6.4 supply the perfectoid-field and marked-untilt interfaces. They do not supply the unrestricted analytic field-pair predicate: C8.48a owns that extension.

The rank-two negative control matters: maximal-plus-ring tests alone give a lift on the generic point, whereas the identity square for the rank-two pair has zero lifts. For `T=ℚ_p`, the contraction is `O_ℂ_p ∩ ℚ_p=ℤ_p`. The reduction also works for residue characteristic 2 or 3 and kills nilpotents in a thickened source's field-valued points; it does not assume reducedness of every analytic test space. No README locator was explicitly marked unverified. ECD Lemma 19.4 at lines 4534–4539 matches C5.7, including torsion and vanishing on the entire special fibre. ECD Lemma 20.4 at lines 4660–4663 matches both conclusions of C7.5. I also inspected the explicitly questioned replacement step in ECD Proposition 20.13 (lines 4869–4877): a rank-two strictly disconnected field point over a rank-one point has a two-point chain, whereas an affinoid pro-étale cover of that base has a profinite underlying space. The proposed separated-hull comparison in C7.18 is substantive extra work; the bare underlying-space replacement does not establish it.

**Pinned declarations opened (14 file/declaration entries).** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to the corresponding library root.

| Library file and line | Declaration/body checked | Consequence |
| --- | --- | --- |
| Mathlib `Topology/Spectral/Basic.lean:38` | `SpectralSpace` extends T0, compact, quasi-sober, quasi-separated and prespectral | It permits the empty space and non-Hausdorff spectral spaces; it is not a nonempty/Hausdorff assumption. |
| Mathlib `Topology/Constructible.lean:175` | `Topology.IsConstructible`, Boolean closure of open retrocompact subsets | On spectral spaces this is the intended finite Boolean algebra of qc opens. |
| Mathlib `Topology/Sheaves/Over.lean:82` | `TopologicalSpace.Opens.sheafEquivOver` | The actual slice equivalence used by `extendByZero`. |
| Mathlib `RingTheory/Valuation/ValuationSubring.lean:436` | `Valuation.valuationSubring` | The special fibre tests contracted valuation rings, not equality of arbitrarily normalized valuations. |
| Mathlib `Analysis/Normed/Field/Dense.lean:45` | `IsAlgClosed.of_denseRange` has `[CharZero L]` | It cannot discharge arbitrary-characteristic completion in C8.6. |
| Mathlib `CategoryTheory/Triangulated/Generators.lean:132` | `ObjectProperty.triangEnvelope`, with retract closure at line 152 | C9.8 uses a thick envelope, not an extension closure missing summands. |
| Tau Ceti `AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101` | `ValuationSpectrum.spa`: continuous valuations bounded on the given subring | The body adds neither a Huber-pair requirement nor nonemptiness; discrete fields in C5.7 fit. |
| Tau Ceti `Topology/Algebra/Group/Profinite/ProP/Basic.lean:68` | `IsProP`, open normal quotient p-group condition; API at 75, 102, 146, 162 | Compactness is not part of this predicate; the Lean wild-kernel theorem carries it separately. |
| Tau Ceti `Topology/Algebra/Group/Profinite/Sylow/CohomologicalDimension.lean:81` | `IsProPSylow.cohomologicalDimensionAt_eq` | The completed supplier already provides the equality needed by C8.28. |
| Tau Ceti `Topology/Algebra/Group/Profinite/ProP/CohomologicalDimension.lean:133` | `IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp` | The constant-module pro-p test is also pinned. |
| Tau Ceti `RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:131` | `CohomologicalDimensionLE` | All discrete primary-torsion coefficients, not one bounded exponent. |
| Tau Ceti `Topology/Spectral/ProConstructible.lean:112` | `IsProConstructible`, comparison with constructible closed sets at 118 | C0's hull topology is using an existing carrier. |
| Tau Ceti `CategoryTheory/Sites/ExtensionByZero.lean:121` | Presheaf extension, adjunction at 254; sheaf finite-limit instance at 315 | The sheaf instance at 315 is for abelian groups. The module-valued adapter is additional work, not already this instance. |
| Tau Ceti `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272` | `IsSmoothDiscrete`; `DiscreteRep` at 631 | Discreteness and open stabilizers/joint action continuity are explicit; a bare `TopRep` does not provide the latter. |

**Ownership and citation resolution (15 contracts below).** Object searches covered the pinned libraries, main roadmaps, board packages and the supplied open-head corpus using the roadmap search service and local searches. The resolver's 70 leads contain no unresolved roadmap citation; most own-name leads are R04, while `AdicSpace.relDim`, valuation amalgamation and `VanishingCycles.properBaseChange` are planned supplier declarations, not missing pinned declarations. The following contracts were opened, rather than inferred from their names:

| Supplier | Resolved section/target | Outcome |
| --- | --- | --- |
| Completed AdicSpaces on main | Layers 0–5 | Native Huber/adic foundations; does not own diamond cohomology. |
| AdicSpacesPartII | R0.7, R0.11, R0.19.10 | Valuation amalgamation, completed residues, coherent-topos framework. |
| PerfectoidSpaces | P1, P3.7, P6 | Tilts, algebraically closed perfectoid fields, pro-étale/cutoff inputs. |
| DiamondsAndVStacks | D0.23, D1–D5, D4.11, D6.1, D6.4, D6.8 | Geometry/cutoffs and diamondification; duplicate properness targets are R06. |
| EnhancedDerivedSheaves on main | §§0.1–0.4, E2.3–E2.4, E3.4 | Coherent diagrams, Postnikov tools and mates; `cutoffRightAdjoint_compat` retains its essential-image condition. |
| ClassicalAdicEtaleCohomology | §§2.1–2.5, 3.1, 6.1–6.3, 7.1–7.3, 10.1–10.4, 11.2 | Classical field invariance, annuli and field transcendence bound; C6's geometric upgrade is distinct. |
| SchemeAndStackFoundations on main | §§2.11, 2.15 | Artin–Schreier, field/Galois comparison, henselian proper base change and limits. |
| EtaleCohomologyFoundations | F.2.1 | `VanishingCycles.properBaseChange` supplies scheme torsion proper base change. |
| DGAInfinity on main | Layers 5–6 | Perfect module complexes and compact/thick-envelope theorem, not the diamond statements. |
| ProfiniteCohomology on main / pinned dictionary | Layers 0, 10–11 | Discrete continuous modules, all-degree cohomology and primary-torsion dimension. |
| Completed ProfiniteProPGroups on main | Layers 2, 3, 6 | Allowed completed supplier; see R02. |
| ArithmeticGaloisDuality | R02.1–R02.2, particularly R02.2.1 | Continuous Hochschild–Serre with the stated closed normal subgroup and discrete coefficients. |
| LocalFieldsRamification on main | Layer 4 | Discrete-field wild/tame theory; C8 keeps the general value-group extension. |
| TopologicalSheafCohomology open head | README lines 9, 72–74, TS3.1 | Same native open-extension model, but TS3 assumes locally compact Hausdorff spaces. This earlier roadmap owns the extension to arbitrary spaces/rings needed for non-Hausdorff spectral spaces; the common-domain adapter must stay the same. No upward supplier edge is needed. |
| LocalFieldsRamificationPartII package | Design scope, line 5 | Owns the algebraic Abhyankar input and explicitly leaves the stronger analytic modified-degree comparison here. |

Other object-search hits—arithmetic K-theory “wild kernels”, nearby-cycle specialization chains in GlobalShtukasAndFunctionFieldLanglands, and finite valuation-chain schemes in ArcTopologyAndDescent—are different objects. No collision with the eleven fully qualified Lean declarations was found. No generality is narrowed to avoid the geometric prerequisites. No declared supplier gaps were supplied by the package.

**Adversarial calculations.** These are diagnostic computations, not proofs of general theorems. Each of the 189 numbered targets has a row below, including every sampled/headline target; further rows record the common adapters and conventions. “Retain” means the displayed instance does not refute the statement. A row mentioning an intentionally excluded instance tests the hypothesis rather than asserting the theorem there.

Notation: `P=Spa(C,O_C)` with C algebraically closed and perfectoid; `M=𝔽_ℓ`, with ℓ≠p when required. `S={η,s}` is a two-point spectral chain, η generalizing s. Its module sheaves are diagrams `A=F_s → B=F_η`. Write `j:{η}→S`, so `j!M=(0→M)` and `j*M=(M→M)`. On S, `Γ(F)=A` and higher cohomology is zero. `D₂=P⊔P`. Unless a row specifies otherwise, all maps/coefficients satisfy the target's hypotheses. The examples `C(t)^a∧` and `C(t,u)^a∧` use independent Gauss variables, so their residue transcendence degrees are respectively 1 and 2. In the table, `H>0=0` includes every positive degree, not merely H¹.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result; change |
| --- | --- | --- | --- |
| C0.1 étale site | P; empty target; D₂→P | Empty family covers ∅ but not P; the fold has two sheets and image {P}. Slice over one sheet has one terminal sheet. | Retain. |
| C0.2 quasi-pro-étale site | Profinite Z_p over P | Finite quotients have pⁿ points; the limit has Z_p points, and maps to a finite discrete set factor through one quotient. | Retain. |
| C0.3 v-site | P, ∅, and a cover of P by P | Identity cover has image {P}; empty family has image ∅; representable sections at id contain id. | Retain. |
| C0.4 cutoff derived category | M[1], zero complex | H⁻¹(M[1])=M at both cutoffs, all other Hⁱ=0; Hom(0,0) has one element at both. | Retain; only specified countable limits claimed. |
| C0.5 algebraic topoi | Finite discrete D₂; infinite discrete union of P | D₂ has finite cover size 2; the infinite component cover has no finite subcover. Geometric and topos qc tests agree. | Retain. |
| C0.6 geometric stalks | S, j!M | Stalks are F_s=0, F_η=M; Γ(S,F)=0. Using only the maximal-plus point gives M, not the closed stalk 0. | Retain higher-rank points. |
| C0.7 enough points | Map 0→j!M on S | Closed stalk map 0→0 is an iso; generic stalk 0→M is not. The sheaf map is not an iso. | Retain all points. |
| C0.8 comparison squares | Fold D₂→P | Original compositions are undefined; corrected pullback paths both give (M,M). | R01; reverse the written composition order. |
| C0.9 coherent bases | D₂ and its two components | Fibre product of distinct components is ∅, same component is P; cover reduces to 2 members. | Retain. |
| C0.10 separated hull | Identity P→P; D₂→P | Hulls have respectively 1 and 2 points; maps to a two-point separated pro-étale target number 2 and 4, unchanged by factoring. | Retain; a constant one-point hull fails the second test. |
| C0.11 hull/fibre product | D₂×_P D₂ | Four components on both sides; a one-component replacement would give 1. | Retain. |
| C0.12 hull evaluation | D₂→P, constant M | Both values are M², not M. | Retain. |
| C0.13 small limits | Product of two copies of M on P | Both inverse-image/product constructions give M²; equalizer of id and zero is 0 on both sides. | Retain. |
| C0.14 full faithfulness of λ* | M on P | Unit on sections sends a↦a; kernel and cokernel 0. | Retain. |
| C0.15 higher λ images | Étale M; constant group S₃ on P | Abelian Hⁱ=0 for i>0; nonabelian H¹ is the singleton trivial torsor. | Retain; no H² assertion for nonabelian groups. |
| C0.16 pro-étale basis | Z_p=lim Z/pⁿ over P | Pulled-back finite M has sections colim M^(pⁿ)=locally constant maps Z_p→M, equal on both constructions. | Retain. |
| C0.17 ν comparison | M and S₃ on P | Degree-zero unit is id_M/id_S₃; higher abelian groups 0 and pointed H¹ singleton. | Retain. |
| C0.18 cofiltered continuity | Z/pⁿ tower, constant finite M | H⁰ is the union of functions through finite quotients on both sides; all H>0=0. | Retain. |
| C0.19 strictly disconnected topos | S, diagram A→B | Sections A and H>0=0 in both topological and étale descriptions. | Retain. |
| C0.20 quasi-pro-étale repleteness | Surjections Z/pⁿ⁺¹→Z/pⁿ | Limit Z_p→Z/p is onto; 1 maps to 1. | Retain. |
| C0.21 v-repleteness | Same constant tower | Limit-to-first map again sends each residue class to itself via a lift; fibre of 0 contains 0. | Retain. |
| C0.22 left completeness | A=⊕_{r≥0}M[r] on P | H⁻ʳ(A)=M; H⁻ʳ(τ≥−n A)=M iff r≤n; inverse limit recovers M for every r. | Retain. |
| C0.23 bounded comparison | M[0] on P | Hom(M,M)=𝔽_ℓ in all three categories; higher Ext of M over 𝔽_ℓ is 0. | Retain. |
| C0.24 unbounded comparison | ⊕_{r≥0}M[r] on P | Every H⁻ʳ=M before and after both pullbacks, H>0=0. | Retain. |
| C1.1 comparison mates | Fold D₂→P, (M,M) | Correct mates act as id on M²; the written topos composites have no type. | R01. |
| C1.2 local reduction | S, j!M and constant M | Closed stalks 0 and M; Γ(S,j!M)=0 and Γ(S,M)=M. | Retain; boundary data distinguishes the two cases. |
| C1.3 degree-zero comparison | Fold D₂→P | Both pushforwards are M×M, map (a,b)↦(a,b). | Retain. |
| C1.4 quasi-pro-étale comparison | Same finite étale fold | R⁰=M² and Rⁱ=0 for i>0 in both sites. | Retain. |
| C1.5 prime-to-p comparison | Identity P, p=2, ℓ=3; p=3, ℓ=2 | Both R⁰=M and Rⁱ=0 for i>0. The invertibility test is 2≠3 in both cases. | Retain. |
| C1.6 unbounded v/qproét comparison | Fold, A=(M[1],M[2]) | Both pushforwards have H⁻¹=M, H⁻²=M, other Hⁱ=0. | Retain. |
| C1.7 qcqs étale/qproét comparison | Fold, (M,M) | R⁰=M², higher groups 0 on both sides. | Retain qcqs. |
| C1.8 derived étale comparison | Fold, (M[1],0) | Both sides have H⁻¹=M and other Hⁱ=0. | Retain. |
| C1.9 Cartesian qproét base change | Base-change fold along P→P | Fibre has 2 points before and after; R⁰=M² and higher images 0. | Retain. |
| C1.10 derived qproét base change | Previous square, (M[1],M[2]) | H⁻¹=M, H⁻²=M on each side. | Retain. |
| C1.11 Cartesian étale base change | Fold pulled back to D₂ | Four points upstairs; each of two stalks downstairs has M² on both sides. | Retain. |
| C1.12 bounded derived base change | Previous square, shifted constant M[1] | Each stalk has H⁻¹=M², Hⁱ=0 otherwise. | Retain. |
| C2.1 v-local étaleness | Cover D₂→P; M[0] | Pullback is (M,M); its two restrictions agree on overlap, and descent gives M. | Retain. |
| C2.2 D_ét predicate | Zero and constant M[1] on P | All strictly disconnected tests have H⁻¹=0 or constant M; membership true for both. | Retain; testing arbitrary v-sheaves is still required. |
| C2.3 one-cover test | D₂→P, M[1] | Both cover components have H⁻¹=M; recovered object also H⁻¹=M. | Retain. |
| C2.4 D_ét completeness | Tower ⊕_{0≤r≤n}M[r] | In fixed degree −r the sequence is 0 until n=r, then constantly M; limit H⁻ʳ=M. | Retain. |
| C2.5 left-completed comparison | P and previous tower | Ordinary derived object and completed object both have one M in every nonpositive degree. | Retain. |
| C2.6 cohomology test | M[1], zero | Cohomology sheaves are respectively M in degree −1 or all 0; both are étale, as are the complexes. | Retain. |
| C2.7 étale qproét pushforward | Fold, (M,0) | Intrinsic and ambient outputs each M[0]. | Retain. |
| C2.8 qcqs pushforward | Finite fold, (M[1],M[2]) | Output H⁻¹=M, H⁻²=M, both étale. | Retain hypotheses. |
| C2.9 enhanced cutoff functoriality | Two identity maps and M[1] | Composite and identity have H⁻¹=M; their unit/counit maps send a↦a. | Retain the supplier's image condition for changing right adjoints. |
| C2.10 hyperdescent | Two-sheet split cover of P | Descent datum is (M,M,id); equalizer in degree 0 is diagonal M⊂M²; split higher Čech groups 0. | Retain. |
| C2.11 a cutoff for D_ét | P, finite M | Cardinal of sections is ℓ, below every adequate infinite cutoff; the same object works at both stages. | Retain. |
| C2.12 enhanced category | P, coefficients 0 and 𝔽_ℓ | Zero ring gives zero category; 𝔽_ℓ gives D(𝔽_ℓ) with nonzero object M. | Retain zero-ring case. |
| C2.13 coreflection | Already étale M[1] | Counit has H⁻¹ map id_M; replacing the right adjoint by zero gives 0→M and fails. | Retain. |
| C2.14 bounded formula | M[0] on P | Successive comparison pushforwards and coreflection each give M[0], not a shifted complex. | Retain. |
| C3.1 pullback | D₂→P, M[1] | Pullback has H⁻¹=(M,M); pullback along id gives M; composition gives the same pair. | Retain. |
| C3.2 direct image | Fold, (M,0) | Hom((M,M),(M,0))=Hom(M,M); pushforward is M. | Retain adjunction direction. |
| C3.3 coreflected direct image | Same finite fold | Ambient image M is already étale, so coreflection also M. | Retain. |
| C3.4 completed direct image | Fold, unbounded identical components | H⁻ʳ=M² in each degree r≥0 in both models. | Retain. |
| C3.5 bounded base change | Cartesian square of finite folds | Both fibrewise outputs M²; all positive Rⁱ=0. | Retain. |
| C3.6 unbounded finite-dimension case | Fold, cohomological dimension N=0 | H⁻ʳ of each side is M²; Rⁱ of every sheaf vanishes for i>0. | Retain uniform N. |
| C3.7 derived tensor | Λ=Z, A=B=Z/2 | H⁰(A⊗ᴸB)=Z/2 and H⁻¹=Z/2; underived tensor has only H⁰. | Retain derived tensor. |
| C3.8 étale tensor | Same constant complexes on P | Both nonzero cohomology groups are constant Z/2, hence étale. | Retain. |
| C3.9 internal Hom | Λ=Z, A=Z/2, B=Z | H⁰ RHom=0 and H¹=Z/2; zero-Hom replacement misses Ext¹. | Retain coreflected derived Hom. |
| C3.10 pushforward/internal Hom | Fold, A=(M,M), B=M | Both sides have M² in degree 0, zero elsewhere. | Retain. |
| C3.11 coefficients | Z→Z/2, A=Z/2 | Derived scalar change has H⁻¹=H⁰=Z/2; forgetting retains both groups. | Retain; flatness is not implicit. |
| C4.1 properness | S and its generic-point open; B C₂ over P | Identity proper=true; generic inclusion proper=false; B C₂ has two automorphisms of a lift, so unique-lift condition false. | Mathematical tests agree; R06 deletes imported API. |
| C4.2 closed immersions | ∅→P and id_P | Both proper=true; fibres are respectively 0 and 1 points. | R06; use D4.11. |
| C4.3 locally compact spaces | R→point versus {0,1}→point | Fibre R is noncompact, hence not proper; finite two-point fibre is compact, hence proper. | Retain both directions. |
| C4.4 valuative criterion | Generic inclusion into rank-two S | Identity square has 0 lifts, versus 1 for id_S; qc and separated alone give true/true for the inclusion. | Retain stronger ring test; import field criterion. |
| C4.5 partial properness | Perfectoid open disc; generic inclusion into S | Open disc: partially proper=true, qc=false; generic inclusion: partial proper=false by 0 lifts. | Retain; partial proper is not qc. |
| C4.6 proper iff partial proper + qc | Previous two maps; id_P | Values: false=(true∧false); false=(false∧true); true=(true∧true). | Retain both directions. |
| C4.7 stability | Two identities; generic open followed by id_S | Composite and factors proper=true for identities; open composite remains false. | Retain new consequences; R06 for supplied ones. |
| C4.8 absolute envelope | Algebraically closed C with residue F_p-bar | Minimal plus ring is F_p-bar+C°°=O_C; envelope of P is P, comparison id. | Retain. |
| C4.9 plus ring formula | Identity Spa(C,C⁺)→Spa(C,C⁺) | Integral closure of C⁺+C°° is C⁺; relative compactification is the original field pair. | Retain; replacing C⁺ by O_C loses rank-two points. |
| C4.10 envelope limits/surjections | Identity diagram P→P←P | Limit P; envelope of limit P; limit of envelopes P; induced map has one image point. | Retain. |
| C4.11 envelope properness | id_P; absolute P as in C4.8 | Envelope of identity is proper id; absolute P is partially proper. This does not make its map to the terminal v-sheaf qc. | Retain distinction. |
| C4.12 envelope size/type | P as in C4.8 | Envelope still one-point perfectoid diamond, and identity remains quasi-pro-étale. | Retain; no general spatiality claim. |
| C4.13 relative compactification | id_S | Formula gives S, factorization id∘id=id, and each test section has one lift. | Retain. |
| C4.14 universal property | id_S compactification, target id_S | Both Hom sets are singleton; the comparison takes id to id. | Retain. |
| C4.15 relative functoriality | Finite discrete 2→1 over P | Compactifications unchanged; map still onto, finite and proper. Pullback along 2→1 gives 4→2 on both sides. | Retain. |
| C4.16 proper image | {a,b}→{a} inside D₂ | Image {a} is closed, fibre has 1 point, and image→P is proper. | Retain. |
| C4.17 proper closed-piece colimit | Infinite discrete union of P over P | Finite subsets give proper pieces; union has infinitely many points, partial proper=true, qc=false. Absolute P→terminal has only ∅ and P as closed pieces but P is not proper over terminal. | Retain target qs condition; source gap below. |
| C4.18 tautness + field lifts | Rank-two identity and its generic inclusion | Both underlying finite spaces taut; lift counts 1 and 0, respectively; partial proper true and false. | Retain both conditions. |
| C5.1 étale shriek | Fold D₂→P; pair (M,M) | f! gives M⊕M; Hom(M⊕M,N)=Hom(M,N)²; f* gives (N,N). | Retain. |
| C5.2 shriek base change | Fold pulled back to D₂ | Each target stalk receives two copies of M on both sides; matrix is identity. | Retain direction of mate. |
| C5.3 open shriek | j:{η}→S | j*j!M=M; stalks of j!M are (0,M); cone of j!j*M→M has stalks (M,0). | Retain; distinguishes j! from j*. |
| C5.4 proper exchange map | f=id_S, j as above | Both sides j!M; map on η is id_M and on s is 0→0. Zero natural transformation fails η. | Retain. |
| C5.5 hypercover | id_P with constant split hypercover | Degree-zero Čech cohomology M; positive normalized groups 0; RΓ(P,M)=M[0]. | Retain. |
| C5.6 compactified field/ZR comparison | C′=C, residue k, plus O_C | k has only the valuation overring containing all k, namely k; each space has 1 point and sheaves are modules. | Retain. |
| C5.7 ZR acyclicity (headline) | K′=K; rank-one nontrivial V⊂K | Spa(K,V) has generic K and closed V. F=j!M has stalks (0,M), satisfies closed-fibre vanishing, Γ=0 and H>0=0. Constant M fails the hypothesis and has Γ=M. | Retain; verifies n=0 as well as positive n. |
| C5.8 bounded proper base change | id_S, j!M[1] | Both sides have η-stalk H⁻¹=M and s-stalk 0. | Retain coefficient/qproét alternative. |
| C5.9 unbounded proper base change | id_S, ⊕_{r≥0}j!M[r] | Rf* has bound 0; both sides have η-stalk M in all degrees −r and s-stalk 0. | Retain finite-bound extension. |
| C6.1 complete-field invariance | C→C′ algebraically closed, Y=P | End(M)=𝔽_ℓ before and after; H>0=0 on both. | Retain surjectivity of field-pair map. |
| C6.2 annulus reduction | ‖ϖ‖=‖t‖^a with a=1,2 | At n=1 interval is [1,1]; at n=2 it is [1/2,2]. a=1 occurs immediately; a=2 occurs at n=2. | Retain n≥1; no 1/0. |
| C6.3 compactified annuli/support | Rank-two base, j!M | Both base and compactified-annulus cohomology of the pulled-back j!M are 0; closed stalk is 0. | Retain prime-to-p hypothesis. |
| C6.4 annulus cohomology | Full algebraic root tower, ℓ≠p | Kummer H¹ transitions along ℓ-roots are ×ℓ=0 on 𝔽_ℓ, hence colimit H¹=0; H⁰=M. p-roots alone act by invertible ×p and leave H¹=M. | Retain full tower; wrong tower excluded. |
| C6.5 discrete→complete field | k=F_p-bar, C=completion of k((t))^a | Constant M has H⁰=M and H>0=0 before/after the base extension. | Retain k⊂C⁺. |
| C6.6 discrete field extension | k⊂k′ algebraically closed, constant M | End(M)=M, H>0=0 on both geometric base points. | Retain. |
| C6.7 cohomology/components | D₂ and ∅ after field extension | H⁰(D₂,M)=M² on both sides; clopen-set counts 4 and 4. Empty spaces have H*=0 and one clopen subset. | Retain empty case. |
| C7.1 constructible sheaf definition | S with F=(M→0); point with infinite free M^(N) | First has two constant finite strata, so constructible=true, locally constant=false. Infinite free stalk has infinite rank, so constructible=false. | Retain native stratification definition. |
| C7.2 strictly disconnected constructibility | Rank-two S, F=(M→0) | Étale/topological dictionaries both give stalk ranks (1,0) and two constructible strata. | Retain. |
| C7.3 constructibility on a stack | P with M and M^(N) | Pullback to P has ranks 1 and infinity; predicate true and false. A trivial predicate would accept both. | Retain. |
| C7.4 abelian closure | Multiplication by 2 on constant Z on P | Kernel 0, cokernel Z/2, image 2Z≅Z; all finite over Z, hence constructible. | Retain noetherian coefficients. |
| C7.5 finite presentability (headline) | Point with Z, and Q=colim Z[1/n!] | Z is finite/constructible and Hom(Z,−) commutes. For Q, colim Hom(Q,Z[1/n!])=0 while Hom(Q,Q)=Q; Q is not constructible. | Retain both directions and generation. |
| C7.6 constructible descent | D₂→P, infinite free stalk | Both pulled-back stalks have infinite rank; neither pullback nor original is constructible. Finite M has ranks (1,1) and descends to rank 1. | Retain. |
| C7.7 spatial characterization | P with M; S with (M→0) | P needs one stratum; S needs two with ranks 1,0. Both are finitely presentable. Infinite free point fails both properties. | Retain. |
| C7.8 constructible continuity | Z/2ⁿ tower; sheaf supported on one residue class mod 4 | Support indicator is 1 on that class and 0 off it, already at stage n=2; pullback preserves these values. | Retain. |
| C7.9 local systems | S, M→M versus 0→M | First diagram has stalk rank constantly 1 and restriction id; second ranks 0,1 and is not a local system. | Retain; extension by zero is not always locally constant. |
| C7.10 closed-support restriction | S, Z={s}, constant M | Cokernel of (0→M)→(M→M) is (M→0); restrictions to η and s are 0 and M. | Retain source/target and cone direction. |
| C7.11 filtration | Constant M on S | Two graded pieces (0→M), (M→0); pointwise sum of ranks gives (1,1). Zero filtration would give (0,0). | Retain finite filtration. |
| C7.12 perfect local systems | P with Λ²; Λ=Z[ε]/ε², A=Λ/ε | Free object has dual Λ² and evaluation eᵢ*(eⱼ)=δᵢⱼ. Quotient has Tor_n(A,A)=A for every n≥0, hence is not perfect. | Retain; duality is not asserted for the quotient. |
| C7.13 stratified perfect complexes | S with (M→0); empty S | Two finite perfect strata give true; empty partition covers ∅ and gives zero category. | Retain n=0 partition only for empty space. |
| C7.14 perfect-constructible predicate | Point over Z[ε]/ε² with Λ/ε | Constructible H⁰=Λ/ε, but Tor_n=Λ/ε for all n; perfect-constructible=false. Free Λ[1] gives true. | Retain stronger predicate. |
| C7.15 thick closure | Cone(id_Λ); direct summand Λ of Λ² | Cone has every Hⁱ=0; summand is rank-one projective, hence perfect. | Retain summands as well as cones. |
| C7.16 stalk/Tor characterization | Previous dual-number quotient | Locally bounded=true, constructible=true, perfect stalk=false, bounded Tor=false; both strengthened conjunctions false. Free Λ has Tor only in degree 0. | Retain all conjuncts. |
| C7.17 field coefficients | M[0]; ⊕_{r≥0}M[r] on P | First bounded/perfect=true; second has H⁻ʳ=M for every r, so bounded/perfect=false despite each Hⁱ finite. | Retain local boundedness. |
| C7.18 perfect descent | Split cover D₂→P, free Λ[1] | Pullback is two copies with Tor amplitude [−1,−1]; descended amplitude is the same. Dual-number quotient stays nonperfect on both sheets. | Retain arbitrary commutative ring. |
| C7.19 bounded filtered colimits | Point, A=M, C_n=Mⁿ in degree 0 | Both Hom-colimit sides are M^(N); all terms share lower bound 0. | Retain uniform lower bound. |
| C7.20 full faithfulness in limits | Constant spatial system; Z[1/n!]→Q | On rank-one perfect complexes Hom colimit is colim Z[1/n!]=Q=Hom_Q(Q,Q); shifts give 0 in nonzero Ext degrees. | Retain. |
| C7.21 spreading perfect local systems | Rank-one complex over Q with differential 1/6 | Complex and its differential descend to Z[1/6]; after tensoring both differentials are 1/6 and both complexes acyclic. | Retain finite coefficient data. |
| C7.22 perfect strata/filtration | Constant M on S | Two graded pieces as C7.11; each has one nonzero perfect stalk; stratified, filtered and perfect-constructible tests all true. | Retain. |
| C7.23 perfect continuity of spaces | Profinite 2-adic tower; two clopen finite perfect values | Indicator partition factors mod 2; each degree's values at all higher stages remain the prescribed two modules. | Retain finite partition. |
| C7.24 perfect coefficient continuity | Z[1/n!]→Q, rank-one modules | Hom colimit=Q=Hom(Q,Q); finite matrix 1/6 descends at a stage containing 1/6. Infinite free Q^(N) is not perfect. | Retain algebraic input separate from sheaf conclusion. |
| C8.1 specialization dimension | ∅, P, S | Both Krull-chain definitions give −∞, 0, 1; strict chain in S has 2 vertices and length 1. | Retain T0/quasi-sober hypotheses. |
| C8.2 topological fibre dimension | id_S, S→point, ∅→point | Supremum of fibre dimensions gives 0, 1, −∞, respectively. | Retain actual fibre subspace topology. |
| C8.3 generating degree | K=K; discrete K(t); trivial topology on K(t) | Dense-field infima are 0, 1, 0, respectively. The last is allowed by the definition but excluded from the normed-field theorem. | Retain definition's wider carrier. |
| C8.4 independent degree | Same three extensions | Independent finite-set maxima are 0, 1, 0: {t} independent only in the discrete transcendental case; closure of K is all K(t) in trivial topology. | Retain closure/algebraicity conditions. |
| C8.4a primitive perturbation | Gauss t, t′=t+a, a∈C, 0<‖a‖<1 | r_C(t)=1; displacement/radius=‖a‖<α<1. For x=t, relative error ‖a‖<α; for nonzero c∈C, error 0. Algebraic t has radius 0 and cannot satisfy strict displacement<0. | Retain nonzero x and positive radius. |
| C8.4b extension from generators | S={t}, φ(t)=t+a | Both completions C(t)^∧ and C(t+a)^∧ coincide; map sends t↦t+a, fixes c∈C; empty S gives identity on C. | Retain uniqueness on dense generators. |
| C8.4c multiradii | Previous singleton perturbation | r_C(t)=1=r_C(t+a); both independent sets have cardinality 1. Identity on empty set preserves cardinality 0. | Retain. |
| C8.5 finite comparison (headline) | K=K; C⊂C(t)^a∧ | Independent and generating degrees are 0=0 and 1=1; residue transcendence 1 rules out a zero generator. | Retain finite-degree hypothesis. |
| C8.6 finite generators | K=K, n=0; one Gauss variable, n=0,1,2 | Identity: 0≤0 and empty tuple works. Gauss extension: 1≤0 false; one generator works; padded tuple (t,0) works for n=2. | Retain “n elements”, allowing redundancy. |
| C8.7 tower bound | C⊂C(t)^a∧⊂C(t,u)^a∧ | Total degree 2; successive degrees 1,1; inequality 2≤1+1. Identity stage gives 1≤0+1. | Retain. |
| C8.8 dense-compositum base change | Base-change C(t) by adjoining independent u, then completed algebraic closures | New relative degree 1≤original degree 1; taking K′=K gives 0≤0. | Retain density condition. |
| C8.9 finite monotonicity | Identity, one and two Gauss variables | 0≤1 and 1≤2; original finite degree 1 remains nonzero in the two-variable extension. | Retain; no infinite-degree equality inferred. |
| C8.10 modified degree | K=K and one Gauss variable | Witness E=L gives bounds 0 and 1; residue transcendence gives lower bounds 0 and 1. Minima therefore 0 and 1. | Retain finite-witness universe requirement. |
| C8.11 finite modified/original equality | Previous extensions | Modified/original values 0=0 and 1=1. | Retain. |
| C8.11a complete amalgamation | L=M=K complete algebraically closed | E=K, two embeddings id; norms of 0 and 1 are 0 and 1 on each path. A rescaled norm would fail exact isometry on an element with norm ≠0,1. | Retain marked compatible embeddings. |
| C8.12 modified tower | Two independent Gauss variables | Modified total 2≤1+1; same residue lower bound prevents an artificial smaller value. | Retain. |
| C8.13 modified base change | C(t), C(u) in completed algebraic C(t,u) | Modified relative degrees 1≤1; identity square gives 0≤0. | Retain. |
| C8.14 analytic transcendence dimension | id_P, Gauss analytic field point over P, empty source | Pointwise suprema 0, 1, −∞. No arbitrary residue-field embedding can change the Gauss variable's residue degree. | Retain residue-map compatibility. |
| C8.15 topological ≤ transcendence | Field-point map with Gauss residue degree 1 | Underlying fibre is one point, topological dimension 0≤analytic degree 1; identity gives 0≤0. | Retain inequality, not equality. |
| C8.16 diamond transcendence dimension | id_P; one-variable geometric field map; ∅→P | Values 0,1,−∞ as for analytic presentations; trivial stabilizer does not force the relative degree to 0. | Retain. |
| C8.17 pullback dimension | Identity and empty base change | 0≤0 for identity; empty pullback has −∞≤original 0. | Retain empty base change. |
| C8.18 composition dimension | Two Gauss stages; empty source | 2≤1+1; empty composite has −∞ without evaluating ambiguous infinity arithmetic. | Retain separate empty case. |
| C8.19 locally finite dimension | Disjoint union of finite-dimensional affine pieces of dimensions n | At a point in piece n a neighborhood bound is n; supremum over all pieces is ∞. Locally finite=true, uniform finite bound=false. | Retain quantifier order. |
| C8.20 field-point fibre tests | id_P; D₂→P | Each nonempty fibre has dimension 0; all-test and field-test suprema both 0. Empty source yields −∞ in both. | Retain all plus rings. |
| C8.21 strict-disconnection acyclicity | S, sheaf A→B | H⁰=A and Hⁱ=0 for i>0; constant M gives H⁰=M, not zero. | Retain positive-degree restriction. |
| C8.22 quasi-pro-étale direct image | Fold D₂→P | j* gives M²; Rⁱj*=0 for i>0. | Retain qc and separated hypotheses. |
| C8.23 qc injection direct image | Generic inclusion j:{η}→S | j*M has stalks (M,M); higher Rⁱ=0. j! instead has stalks (0,M), so is not this operation. | Retain. |
| C8.24 point presentation | Algebraically closed P | Presentation group is 1; quotient has exactly 1 point. Empty diamond has 0 points and is excluded. | Retain faithful presentation. |
| C8.25 uniqueness of presentations | Same C with norm ‖·‖ and ‖·‖² | Identity field map preserves topology and integer ring, but at ‖t‖=r≠1 has values r and r², so is not isometric. | Retain topological/valuation-ring isomorphism, not norm equality. |
| C8.26 discrete module dictionary | Trivial action on M; G with quotient S₃ acting on the regular quotient module over 𝔽₅ | Invariants have dimensions 1 and 1, while the regular module has dimension 6. Invariant vector is the sum of six basis vectors. | Retain action; underlying module alone is insufficient. |
| C8.27 continuous cohomology | Diamond of K=F_p-bar((t)), ℓ≠p, constant M | Both field-étale and G_K cohomology give H⁰=M, H¹=M (Kummer class t), Hⁱ=0 for i>1. | Retain all degrees and the discrete-module dictionary. |
| C8.28 point cohomological dimension | Algebraically closed point; perfected Laurent field with residue 𝔽_p | Values 0 and 1. In the latter, xᵖ−x=1 would reduce to 0=1, so H¹≠0; characteristic-p upper bound is 1. | Retain point dimension distinct from topological dimension 0; R02 citation. |
| C8.29 stabilizer inclusion | Rank-two geometric S | Both stabilizers trivial; inclusion 1→1 has closed image and index 1. Reversing the specialization convention changes the named arrow's domain. | Retain stated direction. |
| C8.30 closed support | S, F=(M→0) | H⁰(S,F)=M, H>0=0; same as invariants/cohomology of trivial closed stabilizer. | Retain. |
| C8.31 generic-point bound | Previous sheaf, generic stabilizer 1 | pointCd=0 and Hⁱ=0 for i>0; H⁰=M shows strict inequality i>0 is necessary. | Retain. |
| C8.32 profinite extension | 1→C_p→C_p×C_ℓ→C_ℓ→1, ℓ≠p | cd_ℓ(C_p)=0, cd_ℓ(C_ℓ)=∞, cd_ℓ(product)=∞, hence ∞≤0+∞. Trivial extension gives 0≤0+0. | Retain primary coefficients. |
| C8.33 wild automorphism | γ=id, p=2,3; x≠0 and x=0 | Factorial and p-power errors all 0. Nonzero relative error 0<1; at zero total division gives ‖0/0−1‖=1. | Retain nonzero quantifier; R02 citation. |
| C8.34 wild kernel (headline) | Faithful trivial action of 1; nonfaithful trivial action of C_ℓ, ℓ≠p | First kernel 1 is pro-p. Second kernel C_ℓ has quotient order ℓ, so pro-p=false despite all nonzero relative errors being 0. | Retain explicit faithfulness; R02 citation. |
| C8.35 remove pro-p kernel | G=P=C_p, ℓ≠p; then ℓ=p as excluded control | Allowed dimensions 0=0 after quotient. Excluded case has ∞≠0. | Retain ℓ≠p; R02 citation. |
| C8.36 residue Galois action | G=1, C′=C | Fixed residue field k′=k is algebraically closed; G/I=1=Gal(k/k), all element orbits size 1. | Retain. |
| C8.37 residue transcendence bound | F=k; F=perfect closure of k(t), k algebraically closed | First cd=trdeg=0. Second trdeg=1 and cd_ℓ=1: Kummer class t is not an ℓ-th power for ℓ≠p. | Retain supplied field theorem. |
| C8.38 tame characters | Rational rank r=0 and r=1 | r=0 gives Hom(0,μ)=0; r=1 gives Hom(Q,μ_prime-to-p)=A_f^(p), with compact subgroup Z_ℓ for ℓ≠p. | Retain topology and closed-image condition. |
| C8.39 tame cohomological bound | Trivial subgroup at r=0; Z_ℓ at r=1 | Dimensions 0≤0 and 1≤1. | Retain; R02 citation. |
| C8.40 residue/value inequality | Gauss variable of radius 1; variable of rationally independent radius | Contributions are 1+0≤1 and 0+1≤1. Identity gives 0+0≤0. | Retain both contributions. |
| C8.41 maximal-point bound | id_P and Gauss field extension | Trivial stabilizer has pointCd=0; bounds are 0≤0 and 0≤1. | Retain ℓ≠p. |
| C8.42 specialization chains | S, n=0,1,2 | Weak chains count 2,3,4; nondegenerate chains count 2,1,0. For (η,s), γ₀d₀=s while γ₁=η. | Retain quasi-augmentation, not ordinary augmentation. |
| C8.43 chain complex | S, F=(A→ʳB) | Normalized C⁰=A⊕B, C¹=B, d(a,b)=b−r(a); H⁰≅A, H¹=0, higher terms 0. | Retain coefficient specialization and sign. |
| C8.44 spectral bound (headline) | ∅; point; S | Dimensions −∞,0,1; empty cohomology all 0, point/S H>0=0, so claimed bounds hold. S gives 0=H² above d=1. | Retain arbitrary abelian sheaves. |
| C8.45 boundary dimension drop | S, V={η}, U=∅ | Closure(V)\V={s}, dimension 0<dim S=1. If V=∅ boundary is empty, excluded from strict nonempty-boundary assertion. | Retain finiteness and nonemptiness. |
| C8.46 constructible support reduction | S, F=(M→0), U={η} | F=M_S/j!M, stalks (M,0); support has dimension 0. | Retain quotient direction. |
| C8.47 local stalk bound | Rank-two geometric S | Stabilizer dimensions 0; Rⁱg*F=0 for i>0, while R⁰g*F has stalks (A,B). | Retain support reduction hypotheses. |
| C8.48 spatial bound | S, support {s}; also F=0 | d=0,e=0 gives H⁰=M and H>0=0. Empty support gives all groups 0, independent of dimension arithmetic. | Retain separate empty support. |
| C8.48a field-pair predicate and sampled reduction | id; generic inclusion into rank-two S; ℚ_p⊂ℂ_p; square-zero thickening | Lift counts 1 and 0; contraction O_ℂ_p∩ℚ_p=ℤ_p. Every field map sends ε²=0 to ε=0, so thickened/reduced field-point sets agree. | Retain all plus rings and marked untilts. |
| C8.49 rank-one closure dimension | Rational rank-one point and Gauss point of proper analytic P¹ | Residue degrees 0 and 1; closure dimensions 0 and 1. | Retain field-pair partial properness. |
| C8.50 partially proper dimension | ∅; disjoint union of proper analytic Pⁿ | Supremum −∞ for ∅; dimensions n are unbounded, giving ∞ with no finite maximum in the union. | Retain supremum; source issue below. |
| C8.51 relative closure additivity | Gauss point of P¹×P¹ projecting to Gauss point of P¹ | Residue degrees and closure dimensions: 2=1+1. Identity projection gives 1=1+0. | Retain rank-one points. |
| C9.1 bounded filtered colimits | P, F=M, C_n=Mⁿ[0] | Both sides M^(N); shared lower bound 0. | Retain shared bound. |
| C9.2 same bound on étale tests | D₂→P, N=0 | Every sheaf's positive cohomology is 0 on P and on D₂; the bound stays 0 rather than doubling. | Retain. |
| C9.3 Postnikov reconstruction | L_n=⊕_{0≤r≤n}M[r] | H⁻ʳ(L_n)=M iff r≤n; H⁻ʳ(Rlim L_n)=M. At endpoint i=−n the comparison is id_M. | Retain category-level reconstruction and negative endpoints. |
| C9.4 ordinary/enhanced equivalence | P and preceding unbounded complex | Both categories' realizations have H⁻ʳ=M for every r≥0 and no positive cohomology. | Retain finite bound. |
| C9.5 coproducts of sections | P, family of M[0] indexed by N | Both RΓ(⊕M) and ⊕RΓ(M) are M^(N)[0], not the product M^N. | Retain coproduct convention. |
| C9.6 compact generators | P, generator Λ | Hom(Λ,⊕_nΛ)=⊕_nΛ; identity of infinite free Λ^(N) cannot factor through a finite subsum. | Retain qc generators. |
| C9.7 zero detection | P, A=M[1] | Hom(Λ,A)=0 but Hom(Λ,A[−1])=M≠0. All shifts detect A; only degree zero would not. | Retain all shifts. |
| C9.8 compact generation (headline) | P and S; zero ring | Point generator Λ has End=Λ and generates perfect complexes. On S, generators (Λ→Λ) and (0→Λ) have cone (Λ→0), detecting both stalks. Zero ring gives zero category on both sides. | Retain thick closure and all shifts. |
| C9.9 compact implies perfect | P, Λ and dual-number quotient Λ/ε | Free Λ is compact/perfect. Quotient has Tor_n=Λ/ε for every n and is not compact/perfect. | Retain. |
| C9.10 shriek of perfect local system | j:{η}→S, L=M² | Hom(j!M²,F)=Hom(M²,F_η), which commutes with sums; rank of j!L is (0,2). | Retain perfectness. |
| C9.11 perfect implies compact | S, constant M and its two-piece filtration | Two compact generators/cones give compact constant M; stalk ranks remain (1,1). | Retain finite filtration. |
| C9.12 compact iff perfect-constructible | Point over Z[ε]/ε² | Λ gives true↔true; Λ/ε gives false↔false, despite its finite H⁰. | Retain general-ring distinction. |
| C9.13 finite-field specialization | M[0]; ⊕_{r≥0}M[r] on P | First compact=true, bounded finite cohomology=true. Second unbounded and noncompact although each Hⁱ has dimension 1. | Retain boundedness. |
| C9.14 dimension hypotheses imply generation | D₂ over P, d=e=0 | H⁰=M² and Hⁱ=0 for i>0; uniform bound d+e=0 and compact objects are two perfect complexes. | Retain global bounds. |
| Open extension adapter, README 148 | S, U=∅, S, {η} | Outputs respectively 0, identity, (0→M); outside-open stalk is 0, whereas direct image gives M. | Retain; arbitrary spaces are needed. |
| Cutoff/product convention | Discrete coefficient Z_p on profinite Z_p test | Constant étale sections are locally constant maps with finite image; continuous identity has infinite image and is absent. A general condensed coefficient object admits identity. | Distinguishes étale predicate from arbitrary v-sheaf; retain cutoff qualifications. |
| Derived sign/shift convention | Two-term [Z --2→ Z] in degrees −1,0 | H⁻¹=0,H⁰=Z/2; shifting by 1 puts the nonzero cohomology in degree −1. Replacing derived tensor by underived loses Tor in degree −1. | Retain conventions used in C3/C7/C9. |
| Strict/nonstrict specialization convention | S and chain (η,s) | Strict chain length 1; repeated (η,η) has length 0 after normalization. First-vertex coefficient is B, not A. | Retain C8.42–C8.44 orientation. |
| Zero coefficients / empty base | Λ=0, X arbitrary; X=∅, Λ arbitrary | Only zero module sheaf and zero complex, all Hom groups singleton and all Hⁱ=0. Empty dimension −∞, not 0. | Retain stated degeneracies. |

## Not verifiable

- Huber (1996), §1.1, (1.1.14)(f), printed p. 45: the sources service resolved the book to a paywalled publisher and marked it uncertified. I did not read or certify that locator. The sampled unrestricted field-pair reduction was independently checked through CS17, ECD, Conrad and the valuation-domination input; the real-valued amalgamation input in C8.11a remains a separate uncertified citation.
- Scheiderer (1992), §2, Remark 2.5, Theorem 4.1 and Proposition 4.7: the DOI and the publisher article URL were tried through the sources service, which classified both as paywalled/uncertified. I also located the author's publication listing but did not obtain the text. KST Lemma 6.6 and its proof, KST lines 1013–1032, verify how these inputs are used, but do not certify the original locators. The two-point calculation above checks the orientation and normalization directly.
- Temkin2010 was read as arXiv:0707.3953v3, where Lemma 6.3.2 is at lines 2347–2356. I have not certified page-number agreement with the published JAG version. Temkin's separate arXiv:1610.09162v2 has Lemma 3.1.6 at lines 281–284, Theorem 3.1.9 at 296–325, and finite comparison in §3.2 at 331–346; those are the version-specific locators checked.

No source manifest or pull-request file was changed, and no unavailable text was treated as evidence of a false theorem. The review is complete rather than parked for these uncertified sources.

## Source issues

- **Misprint** in Conrad at §1, printed p. 1, Conrad line 22: the source says negative integers congruent to one modulo an odd prime have square roots in ℚ₃; it should be ℚ_p for that prime; affects nothing.
- **Gap** in ECD at Proposition 18.9, printed p. 106, ECD lines 4370–4374: the source says an affinoid test's relative compactification is proper without establishing quasicompactness over the target; it should be justified by a quasiseparated-target hypothesis or another quasicompactness argument; affects the proof.
- **Error** in CS17 at Proposition 4.2.19, printed pp. 711–712, CS17 lines 2537–2543: the source says the dimension is the maximum of the residue transcendence degrees without an attainment hypothesis; it should be their supremum, allowing empty and unbounded-dimensional spaces; affects a stated result.

- **Gap** in ECD at Proposition 20.13, printed p. 118, ECD lines 4869–4877: the source says an underlying-space replacement permits assuming an affinoid pro-étale cover; it should justify the replacement and preservation of the perfect comparison, including higher-rank field points; affects the proof.
- **Misprint** in ECD at Proposition 20.14, printed p. 119, ECD lines 4882–4885: the source says A has Λ-coefficients but places its Hom groups and the comparison system in 𝔽_ℓ-coefficient categories; it should use Λ consistently in all three categories; affects a stated result.
