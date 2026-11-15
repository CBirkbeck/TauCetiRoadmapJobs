# Review of SpinRepresentations (pull request #1207 at 3a07d42)
Folder: `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`

**Verdict:** needs changes

## R01 (P3) — §7.2 plans the topology and kernel of the Lipschitz action, which are native

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1430–1432`: “Prove closure, the inherited topology, continuity of twisted conjugation, and its surjection onto O(Q) with kernel `{±1}` of order two”; the API bullets at 1466–1467 repeat it.
**Claim:** Closedness of the Lipschitz group, continuity of the reverse norm and of the twisted-conjugation map, its openness over ℝ and its scalar kernel are theorems at the pin; §7.2 and its *Needs* name none of them.
**Witness:** `TauCeti/Topology/Algebra/CliffordAlgebra/Lipschitz/OpenMap.lean:60,88` (`isClosed_lipschitzGroup`, `isOpenMap_lipschitzToOrthogonal`); `Lipschitz/Norm.lean:34` (`continuous_cliffordNorm`); `Lipschitz/Action.lean:145` (`continuous_lipschitzToOrthogonal`); `TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/Kernel.lean:74` (`mem_ker_lipschitzToOrthogonal_iff`).
**Repair:** Replace the sentence by: “The full cover is the preimage of {±1} under the native continuous `CliffordAlgebra.continuous_cliffordNorm` inside the closed `isClosed_lipschitzGroup`; its action is continuous by `continuous_lipschitzToOrthogonal`, and an element acts trivially exactly when it is a scalar unit (`mem_ker_lipschitzToOrthogonal_iff`). Consume these. Prove that the restriction to norm ±1 is still onto O(Q), with kernel the two scalars of square ±1 (the headline `cliffordFullCoverToOrthogonal_surjective_and_card_ker`), and that it is a covering map, from `isOpenMap_lipschitzToOrthogonal` and the positive scalars in the kernel.” Add the five names to §7.2's *Needs*. (Tested on `Cliff(0,1)`: the Lipschitz group `ℝˣ ∪ ℝˣe` is closed in `ℂˣ`, norms `a²`, `−b²`, preimage of ±1 is `{±1,±e}`.)

## R02 (P3) — Three further native inputs are restated or left unnamed

**Location:** `README.md:1033` “unitarity is equivalent to `conj g=g`”; `README.md:1129–1130` “Own the topology/smooth-inclusion transport, smoothness of the native SO projection and of the finite-dimensional Fock representation”; `README.md:2056` (the *Needs* of §9.2) and the “Kostant machine and CAR” contract row (line 249).
**Claim:** The adjoint formula `g† = (conj g)⁻¹` on complexified Spin, the smooth unit-group map of an algebra homomorphism with its differential, and the root-weight formulas of the adjoint Clifford lift are pinned declarations that these passages do not cite.
**Witness:** `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Complexification.lean:48` (`complexConj_reverse_eq_coe_inv`); `TauCeti/Geometry/Lie/AlgebraHom.lean:44,61` (`AlgHom.unitsSmoothHom`, `unitsLieAlgebraLieEquiv_lieMap_unitsSmoothHom`); `TauCeti/LinearAlgebra/CliffordAlgebra/Quadratic/Lie/RootWeights.lean:146,232`; `Coordinates.lean:175`; `LeftRegular.lean:139`.
**Repair:** §2.3: “unitarity is equivalent to `conj g=g`, by native `CliffordAlgebra.complexConj_reverse_eq_coe_inv` (`g†` is the inverse of `spinGroupBaseChangeCongr Complex.conjAe Q g`) and `continuous_complexConj`”. §3.2: “Smoothness of the Fock representation and `d(spinRep)(x)=spinAction(x)` are the restriction to the closed Spin subgroup of native `AlgHom.unitsSmoothHom` and `AlgHom.unitsLieAlgebraLieEquiv_lieMap_unitsSmoothHom`; the compact-real case is native `AlgHom.lieMap_realCliffordSpinSmoothHom_eq`. Own that restriction for complex Q.” §9.2 *Needs* and the Kostant row: add “`CliffordAlgebra.adjointCliffordHom_eq_sum_bivector` (the coefficient ¼), `adjointCliffordHom_cartan_eq_sum_posRoots`, `mem_genWeightSpace_ι_mul_of_mem_rootSpace` and `kostantLieSubmoduleOfLeftIdeal`”. (Tested at `Spin₂(ℂ)`, `z=2`: `g†↦z̄`, `(conj g)⁻¹↦z̄`.)

## R03 (P3) — The description's summary block lists eight headlines; the head states ten

**Location:** pull-request description, block `roadmap-summary`: “The Lean acceptance test keeps only headlines that no pinned library proves: the isometry criteria … and Kostant's isotypy and multiplicities (`nonempty_kostant_isotypic`, `kostant_multiplicity`, `kostantSpinRep_multiplicity`).”
**Claim:** The list omits two theorems of the head, which the prose further down does name.
**Witness:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/Suggested.lean:95,122`: `simplyConnectedSpace_spinGroup_of_three_le_finrank` and `cliffordFullCoverToOrthogonal_surjective_and_card_ker`.
**Repair:** In the block, after the rank-six item insert: “simple connectivity of complex Spin in dimension at least three (`simplyConnectedSpace_spinGroup_of_three_le_finrank`), the real full Clifford cover of O(Q) with kernel of order two (`cliffordFullCoverToOrthogonal_surjective_and_card_ker`),”.

## Verified sound

| Previous finding (review of 387add0) | Head passage | Result |
|---|---|---|
| R01 native rank zero | README:517–524 “consume `CliffordAlgebra.equivOfSubsingleton` … `range_spinGroup_toUnits_eq_bot_of_subsingleton`”; old §2.3 deleted; line 23 | Repaired; six names at `Zero.lean:42,84`, `VectorNormalizer/Zero.lean:34,42`, `Spin/LowRank/Zero.lean:96,129` |
| R02 native `Spin₂(ℂ)` and connectedness | README:578–586, 1041–1050 | Repaired; `Connected.lean:120`, `Two.lean:88,133,153` |
| R03 native complex Lie algebra | README:1133–1145 | Repaired; `Normed.lean:188,203`, `Spin/LieAlgebra.lean:156,169` |
| R04 two statable summits | `Suggested.lean:95,122`; docstring lines 38–41 | Repaired; both elaborate |
| R05 native rational triality | README:246, 1634–1639, 1820–1823, 1940–1943 | Repaired; orders and directions match `Triality/Basic.lean:57–71`, `TrilinearForm.lean:57` |
| R06 further native declarations | README:1036–1038, 1200–1203, 1223, 1265–1267 | Repaired; all names exist |
| R07 dangling “this layer”, `QFI`, `OG` | README:86, 537, 545, 560, 804 | Repaired; no `QFI`/`OG1` token left |
| R08 locator for the polar retraction | README:1028–1031 | Repaired; `gallier2008 line 1322` |

| Statement / target | Instances tried | Left side computed | Right side / control | Result |
|---|---|---|---|---|
| §0.1 `generator_range_iff` | V=0; Q=0 on a line; real plane, conjugation by diag(2,1) | only automorphism id; `ε↦uε` keeps Kε; X↦[[0,2],[1/2,0]] | isometry id; isometry u; not in span{Z,X} | Agree both directions |
| §0.1 `first_word_piece_iff` | dim 1, `e²=c`: `e↦a+be`; `Cliff(4,0)`, `u=2+ω` | `2ab=0`, b≠0 so a=0; `ue₁u⁻¹=(5e₁−4e₂e₃e₄)/3` | W kept; grading kept, F₁ not | Agrees |
| §1.1 transport | monomial groups n=0..3; `w↦2w`, `w′↦w′/2` | orders 2,4,8,16; classes 5, 10; polar(2w,w′/2)=1 | 8=4+2², 16=8+2·2²; 1 | Agree; no source locator, own comparison |
| §2.3 `simplyConnectedSpace_spinGroup_of_three_le_finrank` | n=2 (`ℂˣ`), n=1, n=0; z=2 | `u=5/4`, `v=−3i/4`, `u²+v²=1`, `u+iv=2`; H(2,1)=1 | native `v=i(z⁻¹−z)/2=−3i/4`; n=2 natively not simply connected | Bound 3 sharp; agrees with `Two.lean:88–100` |
| §2.3 fixed locus | g in Spin with `g†g=1` | `conj(reverse g)=g⁻¹=reverse g` gives `conj g=g`; image real, lifts to ±h | −1 in compact Spin(n), n≥2; n=1: {±1} both | Agrees; native input uncited: R02 |
| §3.1 bivectors | β(e₁,e₂), `Q(eᵢ)=1` | `[e₁e₂,e₁]=−2e₂`, `[e₁e₂,e₂]=2e₁`; β(u,u)=0 | polar formula −2e₂, 2e₁; dim 3 at n=3 | Agrees |
| §5.1 low-rank D | l=1,2,3 | weights −½ / +½; (½,½) on `w₁∧w₂` in S⁺; (½,½,½) on odd top wedge | ω₂ in S⁺ for l=2; ω₃ in S⁻ for l=3 | Parity rule consistent |
| §5.2 group corollary | B₀, rank 0 | Lie action 0; −1 acts by −1 | not statable (docstring) | Consistent with §3.2 |
| §5.3 character | so(2l+1) vector module, m(0)=1; so(2l), m(0)=0 | `2^[1/2]=1`, product over `eᵢ` | sum over 2^l sign vectors | Agrees with `panyushev2001 line 287, 311` |
| §6.1 `Spin₅ ≅ Sp₄` | top coefficient of `reverse(s)∧t` on ⋀(w₁,w₂) | ⟨w₁,w₂⟩=1=−⟨w₂,w₁⟩; ⟨1,w₁₂⟩=1=−⟨w₁₂,1⟩ | alternating; dim Sp₄=10=dim so₅ | Agrees |
| §6.2 `spin6_vector_equiv_exteriorSquare` | diag(2,3,5,1/30); −I, iI | ⋀² eigenvalues 6,10,1/15,15,1/10,1/6 | product 1; −I↦1, iI↦−1 | Consistent; not native |
| §7.1 real Spin image | (1,0); (1,1) | Spin={±1}; ±(cosh t+sinh t·z), norm cosh²−sinh²=1 | SO(1)=1; SO₀(1,1) | Agrees |
| §7.2 `cliffordFullCoverToOrthogonal_surjective_and_card_ker` | `Cliff(0,1)`, `Cliff(1,0)`, z=e₁e₂ in (1,1); dim 0 | {±1,±e}≅C₄; ≅C₂²; `reverse(z)z=−1`; scalars with a²=±1 are ±1 | reflections lift at `Q(v)=±1`; dim 0 excluded by `hV` | True; twisted action (`CartanDieudonne.lean:54` onto O); not at the pin |
| §7.2 native Pin image | definite ±, indefinite | odd word norm `(−1)^k∏Q(vᵢ)`: <0, possible, sign character | SO; O; index-two kernel | Agrees with `gallier2008 line 931–936` |
| §7.3 maximal compact | (1,1),(2,1),(2,2),(3,1) | dim K+pq = 0+1, 1+2, 2+4, 3+3 | 1, 3, 6, 6; \|K(1,1)\|=2 | Agrees with `gallier2008 line 1361–1375` |
| Clifford table | (1,0),(0,1),(0,2),(0,3),(2,0),(3,0),(5,0) | residues 7,1,2,3,6,5,3 | ℝ², ℂ, ℍ, ℍ², M₂(ℝ), M₂(ℂ), M₂(ℍ)² | Agree |
| §8.1 numbered elements | E₄=C₃C₄, F₄=A₄A₃; Killing form | `N₃N₄−(1−N₃)(1−N₄)`; Σ over 24 roots of α(H₁)²=12 | `N₃+N₄−1`; `6·tr(H₁²)=6·2` | Agrees |
| §8.3 blocks and pullbacks | native intertwiners; block rotation | V→S⁻, S⁻→S⁺, S⁺→V; composite identity | `K_−v`, `K_+−`, `K_v+`; `P₂₄³=1` | Directions equal `Triality/Basic.lean:57–71` |
| §8.4 `exists_trialityAut` | σ: 0→2→3→0 | weights of `ρ∘t`: V→ω₄, S⁺→ω₃, S⁻→ω₁ | Lean: V∘t≅S⁺, S⁺∘t≅S⁻, S⁻∘t≅V | Orientation consistent in README, Lean and pin |
| §8.4 `exists_trialityForm` | T(w₁,1,w₂w₃w₄); w₂ first | 1; `w₂∧w₂w₃w₄=0` | weights sum `e₁−½Σe+½(−e₁+e₂+e₃+e₄)=0` | Nonzero, torus-invariant |
| §9.1 rank bookkeeping | sl₂, sl₃, 0; Killing lift | `3=1+2·1`, `8=2+2·3`, 0; `Q(x)=κ(x,x)` (`SkewAdjoint.lean:301`) | exponents (d±l)/2 integral | Agrees with `bazlov2008 line 444–450` |
| §9.2 `nonempty_kostant_isotypic` | sl₂ | Cliff=M₂⊕M₂, A=diagonal M₂ | four copies of the 2-dimensional simple | Agrees |
| §9.2 `kostant_multiplicity` | (d,l)=(3,1),(8,2),(0,0) | dims 2, 8, 1 | copies 4, 32, 1; products 2³, 2⁸, 1 | Exact divisions |
| §9.2 `kostantSpinRep_multiplicity` | same | spinor dims 2, 16, 1 | `2^⌊l/2⌋·dim L(ρ)`=1·2, 2·8, 1·1 | Agrees |
| §9.2 P and Q_P | sl₂ ω; sl₂⊕sl₂ | `(x₁x₂x₃)²=−q₁q₂q₃=512`; determinant form −512 | `(−1)^m` with m=1; dim P=1, 2 | Agrees with `bazlov2008 line 375–403` |
| §9.3 CAR | bracket; ordering constant; ν | `[F_ij,d_kl]=δ_jk d_il−δ_li d_kj`; antisymmetrized = `F_ij−(N/2)δ_ij` | ν=ρ+(N/2)(1,…,1)=(N−½,…,½); `2^(N(N+1)/2)·2^(N(N−1)/2)=2^(N²)` | Agrees with `shlyakhtenko2026 line 199, 209, 400` |

- Sources: 20 locators read in 7 texts: `gallier2008` lines 325, 482, 934, 1203, 1322, 1361, 1370; `panyushev2001` lines 287, 311, 313, 322; `kirillov2008` line 1351; `conrad-rgs` line 8173; `baez2002` lines 578–751; `bazlov2008` lines 371–458; `shlyakhtenko2026` lines 198, 208, 397. All support the statements as written.
- Library (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): all 486 backticked names of the README checked; every library name has a declaration at the pins. 31 files opened, among them those in R01–R02 and `Lipschitz/FullCover.lean:20–22,45,58`, `Spin/Connected.lean:120`, `Spin/Two.lean:88–154`, `Triality/TrilinearForm.lean:57`.
- Cross-roadmap citations resolved on main (`e6f6358`): OrthogonalSpinGroups §§1A–1F, ClassicalGroups §§0.1, 0.2, 1.2, 3.5, 3A, LieHighestWeight Layers 7 and 9, RootSystems §§4.3, 5.2, LieGroups Layers 0–5 and 9, ReductiveGroups 9B, QuadraticFormInvariants Layer 1, SpinGeometry Layers 1 and 4.
- Gate: every check passed at 3a07d42. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of this folder.
- Elaboration: `Suggested.lean` elaborates with 10 `sorry` warnings and nothing else. `#check @name` on the eleven declarations: types equal the README statements, no lost binder (`kostantSpinRep` keeps `FiniteDimensional` and `IsKilling`).
- Padding: each of the 10 theorems tried with `first | rfl | (simp; done) | infer_instance | exact?`; none closes.
- Headlines: 10 stated, 4 named as not statable (low-rank D, the differential comparison, `K(p,q)` with its Cartan homeomorphism, the ρ-decomposition); none statable and absent.
- Description: read against the head; one omission (R03), no sentence contradicted.

Overlap check: read open OrthogonalSpinGroups, LieHighestWeightPartII, LieHighestWeight, ExceptionalThetaCorrespondencesForG2 and main SpinGeometry, OrthogonalSpinGroups, LieHighestWeight (ChevalleyGroups searched through the index only; the third list is empty). Shared objects and owners: general-field spinor norm and low-rank unitary carriers, OrthogonalSpinGroups; generic highest weights and Serre presentation, LieHighestWeight; negative-form group comparison, native, cited here and by SpinGeometry G1.1; triality on the three modules, this roadmap, cited by ExceptionalThetaCorrespondencesForG2 as Layer 8. No object has two roadmap owners.

Source independence: 14 passages compared with 7 sources, none shared; largest share gallier2008, 4 of 21 locator sites (panyushev2001 also 4); contents compared with gallier2008 (§§1.1–1.9) and panyushev2001: independent (Layers 0, 3–6, 8 and 9 have no counterpart in either). The contents of Lawson–Michelsohn and Fulton–Harris could not be read.

## Not verifiable

- Lawson–Michelsohn, Theorems I.2.10 and I.4.3, Tables I–II, §I.2 (README:570, 743, 1413): not in the manifest or the sources cache; the sources service returned “no legal source found”.
- fultonharris1991, Lecture 19 §§19.2, 19.4 and Lecture 20 §§20.1–20.3: settled uncertified.
- kostant1997, Proposition 28 and Theorems B, 35, 40: settled uncertified; read only as reported at `bazlov2008` lines 396, 401, 448, 458.
- goodmanwallach2009, meinrenken2013, Chevalley, Cartan, Adams: References only, no locator at a statement.

## Source issues

- **Gap** in bazlov2008 at §3.5, p. 11: the source says the image E of the enveloping algebra is the Clifford centraliser of the invariants J; it should be the ℤ/2-graded centraliser, since for sl₂ the ordinary centraliser of J is the whole algebra; affects nothing.

## For the human reviewers

- Not tested: Lawson–Michelsohn (3 of 21 locator sites) and Fulton–Harris Lectures 19–20 could not be read; wording and arrangement were compared only with the seven readable texts.
- Licence: `shlyakhtenko2026` is an unrefereed 2026 preprint (arXiv:2606.28648v1), cited for the motivating CAR instance of §9.3, whose statements are native Tau Ceti theorems.
