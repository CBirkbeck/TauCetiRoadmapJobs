# Review of SpinRepresentations (pull request #1207 at 387add0)
Folder: `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`

**Verdict:** needs changes

## R01 (P2) — §2.3 is proved in full at the pin

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:999–1003`: “The additional **ZeroRankGeneratedNormalizerComparison** identifies the full twisted normalizer with Kˣ: under the scalar algebra equivalence `CliffordAlgebra Q ≃ₐ[K] K` … Construct this algebra equivalence”.
**Claim:** The algebra equivalence, the unit comparison, the twisted normalizer `≃* Kˣ` and the μ₂ comparison are all native over any commutative ring; the README owns them as a target and cites none.
**Witness:** `TauCeti/LinearAlgebra/CliffordAlgebra/Zero.lean:42,84` (`equivOfSubsingleton`, `unitsEquivOfSubsingleton`); `VectorNormalizer/Zero.lean:34,42` (`vectorNormalizer_eq_top_of_subsingleton`, `vectorNormalizerEquivUnitsOfSubsingleton : vectorNormalizer Q ≃* Rˣ`); `Spin/LowRank/Zero.lean:96,129`.
**Repair:** Delete §2.3. Add to the covers contract: “At rank zero consume `CliffordAlgebra.equivOfSubsingleton`, `unitsEquivOfSubsingleton`, `vectorNormalizerEquivUnitsOfSubsingleton`, `evenUnitaryGroupEquivRootsOfUnityOfSubsingleton` and `range_spinGroup_toUnits_eq_bot_of_subsingleton`.” Replace line 23's “Layer 2 adds only the full twisted normalizer at rank zero” and line 355's last sentence by “the rank-zero normalizer and μ₂ comparisons are native”; drop §2.3 from Layer 2's Examples and Dependencies; keep the three Checks as Examples.

## R02 (P2) — §2.4 owns the Spin₂(ℂ) exception and connectedness, both native

**Location:** `README.md:1038–1043`: “Consume SpinCompactTopologyFoundation to conclude connectedness for n≥2 … Own the exception n=2: … the actual topological group isomorphism with ℂˣ is `g↦u+iv` … Thus Spin₂(ℂ) is connected but not simply connected”.
**Claim:** Path-connectedness of complex Spin for every nondegenerate Q of dimension ≥2, and the topological-group isomorphism with ℂˣ, connectedness and non-simple-connectedness in dimension 2, are theorems at the pin; none is cited.
**Witness:** `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Connected.lean:120` (`pathConnectedSpace_spinGroup_of_two_le_finrank`); `Spin/Two.lean:133,146,153` (`nonempty_spinGroup_continuousMulEquiv_units_of_finrank_eq_two`, `pathConnectedSpace_…`, `not_simplyConnectedSpace_spinGroup_of_finrank_eq_two`).
**Repair:** Replace the two sentences by: “Connectedness for n≥2 is native (`CliffordAlgebra.pathConnectedSpace_spinGroup_of_two_le_finrank`), and so is the exception n=2 (`nonempty_spinGroup_continuousMulEquiv_units_of_finrank_eq_two`, with `spinGroupContinuousMulEquivUnitsWeightedSumSquaresOne` for `g↦u+iv`, and `not_simplyConnectedSpace_spinGroup_of_finrank_eq_two`). The target here is simple connectivity for n≥3, through the unitary fixed locus and SpinCompactTopologyFoundation.” Add these names to the “Compact Spin topology” contract.

## R03 (P2) — §3.2 misdescribes the native Lie-algebra file and re-owns its complex half

**Location:** `README.md:1125–1134`: “Equip the complex Clifford algebra with a finite-dimensional normed ℝ-algebra structure and prove that its topology agrees with the native module/subspace topology … in its actual real(p,q) scope; own the complex underlying-real adaptation here.”
**Claim:** For a nondegenerate form on `Fin n → ℂ` the pin already has the real normed-algebra structure with the module topology and the identification of the closed-subgroup Lie algebra of complex Spin with the quadratic Lie subalgebra.
**Witness:** `TauCeti/Topology/Algebra/CliffordAlgebra/Normed.lean` (`instNormedAlgebraRealComplexCliffordAlgebra`, `instFiniteDimensionalRealComplexCliffordAlgebra`); `Spin/LieAlgebra.lean:156,168` (`forall_expUnit_smul_mem_complexSpinGroup_iff_mem_quadraticLieSubalgebra`, `unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_quadraticLieSubalgebra_complex`).
**Repair:** Replace the passage by: “For Q on `Fin n → ℂ` consume the native normed ℝ-algebra structure of `Normed.lean` (its topology is the module topology) and `CliffordAlgebra.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_quadraticLieSubalgebra_complex`; the real `(p,q)` statement is its sibling in the same file. Own only the transport of both along the specified isometry of §1.1 from an abstract V to `Fin n → ℂ`.” List the two files in §3.2's *Needs*.

## R04 (P2) — Two statable summits of Layers 2 and 7 are neither stated nor named as not statable

**Location:** `README.md:6` (“real and complex group comparisons” among the endpoints) and `Suggested.lean:28–37` (the not-statable list: low-rank D, the differential comparison, the ρ-decomposition).
**Claim:** The real full cover `→ O(Q)` with kernel `{±1}` (§7.2) and simple connectivity of complex Spin for n≥3 (§2.4) have all carriers at the pin, are unproved there, and appear in neither the file nor its docstring.
**Witness:** `TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/FullCover.lean:20–22` says of surjectivity and kernel “These classical facts are not proved here”. Both statements below elaborate in a scratch file with `sorry` as the only warning.
**Repair:** Add, with imports `TauCeti.LinearAlgebra.CliffordAlgebra.Lipschitz.FullCover` and `TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Closed`, and name both in “How to read the build”:

```lean
theorem cliffordFullCoverToOrthogonal_surjective_and_card_ker {V : Type v} [AddCommGroup V]
    [Module ℝ V] [FiniteDimensional ℝ V] (Q : QuadraticForm ℝ V) (hQ : Q.Nondegenerate)
    (hV : 0 < Module.finrank ℝ V) :
    Function.Surjective (cliffordFullCoverToOrthogonal Q) ∧
      Nat.card (cliffordFullCoverToOrthogonal Q).ker = 2 := sorry

theorem simplyConnectedSpace_spinGroup_of_three_le_finrank {V : Type v} [AddCommGroup V]
    [Module ℂ V] [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate)
    (hV : 3 ≤ Module.finrank ℂ V) : SimplyConnectedSpace (spinGroup Q) := sorry
```

In the docstring add: “the maximal compact subgroup and Cartan homeomorphism of `Spin(p,q)` (Layer 7): the quotient `K(p,q)` is a construction of the roadmap.”

## R05 (P3) — Layer 8 does not consume the native Lie-level triality on the three modules

**Location:** `README.md:1620–1622,1803,1911`: “Construct the three Lie-module intertwiners on the actual vector and half-spin carriers”; “Construct linear equivalences `J₁:B₁≃ₗ[ℂ]V`, `J₃`, `J₄`”; “Finally construct the nonzero `Spin₈`-invariant trilinear form”.
**Claim:** Over ℚ, for a polarization with a basis of `P.W`, the block equivalences with their E/F/H equations, the three triality intertwiners with cyclic composite the identity, and a nonzero cyclic Lie-invariant trilinear form are native; Layer 8 cites none.
**Witness:** `TauCeti/RepresentationTheory/Spin/HalfSpin/D4Tripled.lean:142,149,412–638`; `Spin/Triality/Basic.lean` (`d4VectorToSpinMinusEquiv`, `d4SpinMinusToSpinPlusEquiv`, `d4SpinPlusToVectorEquiv`, `_serreE/F/H`); `Spin/Triality/TrilinearForm.lean:57,74,92,109`; `TauCeti/Algebra/Lie/D4/Tripled/VectorBlock.lean:263`.
**Repair:** Add a contract row “Native rational triality on the three modules” naming `TauCeti.D4Tripled.vectorBlockEquiv`, `SpinPolarizationData.d4SpinPlusBlockEquiv`, `d4SpinMinusBlockEquiv`, the three intertwiners and `d4TrialityTrilinearForm` with `_ne_zero`, `_cyclic` and the three invariance theorems (scope: `Module ℚ V`). In §§8.1, 8.3 and 8.4 state the remaining targets as: base change of these from the split rational form to `Q₈` along the isometry of §8.2 item 2, the group-level equations on `x_±i(u)` and `T_Cl(s)`, and the comparison of the transported form with Clifford multiplication; add the names to the three *Needs* lines.

## R06 (P3) — Further native declarations restated as targets

**Location:** `README.md:1212,1036,1191,1268`: “Construct the native real-to-complex Clifford base-change and group-inclusion maps, proving their generator, evenness, norm and generated-membership equations”; “The TypeB invariant-subspace dichotomy is packaged as irreducibility”; “The transported Cartan acts on each exterior basis vector `w_I` by the sign vector”.
**Claim:** The base-change maps with their equations, type-B Lie irreducibility and the diagonal-bivector weights are pinned declarations that §§2.4, 4.1, 4.2 and 5.1 do not name.
**Witness:** `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/BaseChange.lean:77` (`spinGroupBaseChange`); `BaseChange.lean:95,101,130` (`ofBaseChangeAux_star`, `_mem_even`, `_injective`); `Complexification.lean:71,98`; `RepresentationTheory/Spin/Polarization/Irreducible.lean:142`; `Spin/Weight.lean:318`.
**Repair:** §4.2 and §2.4: “Consume `CliffordAlgebra.spinGroupBaseChange`, `lipschitzGroupBaseChange`, `ofBaseChangeAux_involute`, `_reverse`, `_star`, `_mem_even`, `_injective`, `complexConj` and `complexConj_ofBaseChangeAux`; the targets are the equality of the complexified real even algebra with the complex one and the fixed-locus identification.” §4.1: “type-B irreducibility is native `SpinPolarizationData.isIrreducible_typeBSpinLieRep`”. §5.1 and the Cartan-coordinate contract: cite `TauCeti.spinWeight`, `SpinPolarizationData.diagonalBivector` and `spinAction_diagonalBivector_basis` for `Hᵢ=Nᵢ−½`.

## R07 (P3) — Dangling “this layer” and undefined abbreviations in the supplier contracts

**Location:** `README.md:503,550,780,86,528,1007`: “(the summit of the layer)”; “this layer consumes it for the complex topology”; “downstream of this layer”; “QFI1 records native Cartan–Dieudonné”; “Consume OG1A's comparison”; “no OG dependency”.
**Claim:** These sentences sit under “Exact supplier contracts”, where no layer is in scope, and `QFI`/`OG` are defined nowhere. Main's SpinGeometry cites “SpinRepresentations Layer 2's SpinCompactTopologyFoundation”, which only line 550 ties to a layer.
**Witness:** Lines 503, 550 and 780 are under the `####` contract headings “Covers and the general-field image”, “Compact Spin topology” and “Compact topology and geometric consumers”; `grep -n 'QFI\|OG1' README.md` finds uses only.
**Repair:** Line 503 “(the summit of Layer 2)”; line 550 “and Layer 2 (§2.4) consumes it”; line 780 “downstream of Layer 7”; write “QuadraticFormInvariants Layer 1” for `QFI1` (lines 86, 536) and “OrthogonalSpinGroups §1A” / “OrthogonalSpinGroups” for `OG1A` / `OG` (lines 528, 1007–1008).

## R08 (P3) — §2.4 has no locator for the polar retraction

**Location:** `README.md:1029–1032`: “Use the complexified positive-real-form polar deformation … Its formula is `H(g,t)=g(g†g)^(-t/2)`, for 0≤t≤1, with endpoint in `Spin∩U`.”
**Claim:** The homeomorphism of an adjunction-stable complex group with its unitary part times a vector space is a cited-nowhere classical theorem; the section carries no source.
**Witness:** `gallier2008 line 1322` (Theorem 1.24, p. 43): a pseudo-algebraic subgroup G of `GL(n,ℂ)` stable under adjunction is homeomorphic to `(G∩U(n))×ℝ^d` by `(U,H)↦Ue^H`.
**Repair:** Append to that sentence “(Gallier, arXiv:0805.0311v3, Theorem 1.24, p. 43, for the polar homeomorphism of an adjunction-stable pseudo-algebraic group; the Spin-specific deformation is the native one)”.

## Verified sound

| Previous finding (review of 690944d) | Head passage | Result |
|---|---|---|
| R01 tripled-carrier names | README:1651–1653, 1777 “`TauCeti.D4Tripled.pointsPresentation` with `…IntegralPointsPresentation.mulEquiv`, `mulEquiv_mapPoints` and `natIso`” | Repaired; all exist (`Presentation.lean:129,158,200`) |
| R02 native SL₄ exterior square | README:317–332, 1379 | Repaired; ten names exist in `Six/` |
| R03 API lists and Checks | §§2.1, 3.1, 4.1, 5.1, 6.1, 7.2, 8.1 each have an API list and three Checks | Repaired |
| R04 stale pointers | README:775 “NegativeFormEvenComparison of §7.3”; 1046 “(§3.2)”; 2082, 2085 | Repaired; residue is R07 |
| R05 LieGroups Layer 9 | README:383–387 | Repaired; matches main LieGroups README:1201–1232 |
| R06 locators | README:1300, 1305, 1419–1421, 1502–1504, 2064 | Repaired; all five read in the texts |
| R07 description block | summary block lists `spin6_vector_equiv_exteriorSquare` | Repaired |

| Statement / target | Instances tried | Left side computed | Right side / control | Result |
|---|---|---|---|---|
| §0.1 `generator_range_iff` | V=0; Q=0 on a line; real plane, conj. by diag(2,1) | only automorphism id; `ε↦uε` keeps Kε; X↦[[0,2],[1/2,0]] | unique isometry id; isometry u; not in span{Z,X} | Agree both directions |
| §0.1 `first_word_piece_iff` | `φ(ιv)=a+ι(Tv)`; Cliff(4,0), u=2+ω | square gives `2a·ι(Tv)=0`, T injective on F₁/F₀; `ue₁u⁻¹=(5e₁−4e₂e₃e₄)/3` | a=0; grading kept, F₁ not | Agrees |
| §1.1 transport Checks | n=0..3 monomial groups; w↦2w, w′↦w′/2 | orders 2,4,8,16; classes 5, 10; polar(w′/2,2w)=1 | 8=4+2², 16=8+2·2²; 1 | Agree; no source locator, own comparison |
| §2.2 reflections in Pin | Q(v)=−1; Q(v)=1 | `star(ιv)·ιv=−Q(v)`: 1; −1 | native Pin needs 1 | README's `Q v=−1` is right |
| §2.3 zero rank | V=0 over ℂ: scalars 2, −1 | norms 4, 1 | μ₂={±1}, generated Spin={1} | True, and native: R01 |
| §2.4 Spin₂(ℂ)≅ℂˣ | z=2; polar path | u=5/4, v=−3i/4, u²+v²=1; g†↦z̄, H=z/\|z\|^t | u+iv=2; H(2,1)=1 | Agrees with `Spin/Two.lean`; native: R02 |
| §3.1 bivectors | β(e₁,e₂), Q(eᵢ)=1 | [e₁e₂,e₁]=−2e₂, [e₁e₂,e₂]=2e₁; β(u,u)=0 | polar formula −2e₂, 2e₁; dim 3 at n=3 | Agrees |
| §3.2 differential | rank 0, 1, 2 | Lie algebra dims 0, 0, 1 | −1 acts by −1 on the rank-1 spinor line | Agrees; complex Lie algebra native: R03 |
| §4.1 algebraic Lie action | hyperbolic plane | β(w,w′)=N−½: −½ on 1, +½ on w; [N,C]=C | bracket identity gives ιw | Agrees |
| §5.2 group corollary | B₀, rank 0 | Lie action 0; −1∈Spin acts by −1 | not statable (docstring) | Consistent with §3.2 |
| §5.3 character | l=2; Panyushev 2.2, m(0)∈{0,1} | four sign vectors | (t₁^½+t₁^−½)(t₂^½+t₂^−½)·2^0 | Agrees with `panyushev2001 line 287, 311` |
| §6.1 Spin₅≅Sp₄ | pairing top(reverse(s)∧t) on ⋀(w₁,w₂) | ⟨w₁,w₂⟩=1=−⟨w₂,w₁⟩; ⟨1,w₁₂⟩=1=−⟨w₁₂,1⟩ | alternating; dim Sp₄=10=dim so₅ | Agrees |
| §6.2 `spin6_vector_equiv_exteriorSquare` | diag(2,3,5,1/30); −I, iI | ⋀² eigenvalues 6,10,1/15,15,1/10,1/6 | product 1; −I↦1, iI↦−1 | Consistent; native theorem covers only the split form (`Hyperbolic.lean:277`) |
| Clifford table | (1,0),(0,1),(0,2),(1,1),(3,0),(0,3),(5,0) | residues 7,1,2,0,5,3,3 | ℝ², ℂ, ℍ, M₂(ℝ), M₂(ℂ), ℍ², M₂(ℍ)² | Agree |
| §7.1 real Spin image | (1,0); (1,1) | Spin={±1}; ±(cosh t+sinh t·z), norm cosh²−sinh²=1 | SO(1)=1; SO₀(1,1) | Agrees |
| §7.2 full cover | Cliff(0,1), Cliff(1,0), z=e₁e₂ in (1,1) | {±1,±e}≅C₄; ≅C₂²; z²=1, reverse(z)z=−1 | Pin = cover; Pin={±1}; z↦−1∉SO₀ | Agrees with `gallier2008 line 934, 1203`; headline absent: R04 |
| §7.3 maximal compact | (1,1),(2,1),(2,2),(3,1) | dim K+pq = 0+1, 1+2, 2+4, 3+3 | 1, 3, 6, 6; \|K(1,1)\|=2 | Agrees with `gallier2008 line 1370–1373` |
| §8.1 numbered elements | E₄=C₃C₄, F₄=A₄A₃; chain | N₃N₄−(1−N₃)(1−N₄); N_i(1−N_(i+1))−N_(i+1)(1−N_i) | N₃+N₄−1; N_i−N_(i+1); κ: 12=6·2 | Agrees |
| §8.2 root and torus Checks | x₁(u); T_Cl(s) on b₁₂₃₄, b₁₂₃, b₁₂, b₁ | polar(b₂+ub₁,b′₁−ub′₂)=−u+u | s₄, s₃, s₂s₄⁻¹, s₁s₄⁻¹; V-kernel s₃=s₄=±1 | All nine recomputed, agree |
| §8.3 block tables | all 21 lowering steps | F₄b₃=b′₄, F₄b₄=−b′₃=F₃b′₄, F₂b₁₂₄=b₁₃₄, F₄b₃₄=1 | native words `[0,1,3]`, `[0,1,2,3]`, `[2,1]`, `[3,1,0,2,1,3]` | Agree with the private table (`TripledWeight.lean:220`) |
| §8.4 `exists_trialityAut` | σ: 0→2→3→0 (`swap 0 3 * swap 0 2`); t(h_i)=h_σ(i) | ρ_(ω_j)∘t has weight ω_(σ⁻¹j): V→ω₄, S⁺→ω₃, S⁻→ω₁ | Lean: V∘t≅S⁺, S⁺∘t≅S⁻, S⁻∘t≅V; blocks 0–7→8–15→16–23 | Orientation consistent in README, Lean and pin |
| §8.4 `exists_trialityForm` | T(w₁,1,w₂w₃w₄); w₂ first | 1; w₂∧w₂w₃w₄=0 | weights e₁−½Σe+½(−e₁+e₂+e₃+e₄)=0 | Nonzero, torus-invariant; ℚ-version native: R05 |
| §9.2 `nonempty_kostant_isotypic` | sl₂ | Cliff=M₂⊕M₂, A=diagonal M₂ | four copies of the 2-dimensional simple | Agrees |
| §9.2 `kostant_multiplicity` | (d,l)=(3,1),(8,2),(0,0) | dims 2, 8, 1 | copies 4, 32, 1; products 2³, 2⁸, 1 | Exact divisions |
| §9.2 `kostantSpinRep_multiplicity` | same | spinor dims 2, 16, 1 | 2^⌊l/2⌋·dim L(ρ)=1·2, 2·8, 1·1 | Agrees |
| §9.2 P and Q_P | sl₂ ω; sl₂⊕sl₂ | (x₁x₂x₃)²=−q₁q₂q₃=512; det form −512 | dim P=1, 2; P=I would give 3 | Agrees with `bazlov2008 line 375–378` |
| §9.3 CAR | bracket; N general | [F_ij,d_kl]=δ_jk d_il−δ_li d_kj; shift (N/2)δ_ij | ν=(N−½,…,½); 2^(N(N+1)/2)·2^(N(N−1)/2)=2^(N²) | Agrees with `shlyakhtenko2026 line 199, 400` |

- Sources: 19 locators read in 7 texts: `gallier2008` lines 325, 482, 934, 1203, 1322, 1361, 1370; `panyushev2001` lines 287, 311, 313, 320; `kirillov2008` line 1351; `conrad-rgs` line 8173; `baez2002` lines 578–751; `bazlov2008` lines 371–458; `shlyakhtenko2026` lines 198, 208, 397. All support the statements as written.
- Library (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): every backticked name of the README has a declaration at the pins; 26 files opened, among them those cited in R01–R06, `TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean:277,302,317`, `DiagramPermutations.lean:75`, `SkewAdjoint.lean:301`, `Weyl/Vector.lean:292`.
- Cross-roadmap citations resolved on main: OrthogonalSpinGroups Layer 1, ClassicalGroups §§0.1, 0.2, 1.2, 3.5, Layer 3A, LieHighestWeight Layers 7 and 9, RootSystems §§4.3, 5.2, LieGroups Layers 0–5 and 9, ReductiveGroups 9B, QuadraticFormInvariants Layer 1, SpinGeometry G1.1 and G4.1; all eight relative links resolve.
- Gate: every check passed at 387add0. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of this folder.
- Elaboration: `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else. `#check @name` on all nine declarations: types equal the README statements, no lost binder.
- Padding: each of the 8 theorems tried with `first | rfl | (simp; done) | infer_instance | exact?`; none closes.
- Headlines: 8 stated, 3 named as not statable; two more are statable and absent (R04).
- Description: title and prose read against the head; no sentence contradicted.

Overlap check: read open OrthogonalSpinGroups, LieHighestWeightPartII, ExceptionalThetaCorrespondencesForG2 and main SpinGeometry, OrthogonalSpinGroups, LieHighestWeight (open LieHighestWeight and ChevalleyGroups searched through the index only; the third list is empty). Shared objects and owners: general-field spinor norm and low-rank unitary carriers, OrthogonalSpinGroups; generic highest weights and Serre presentation, LieHighestWeight; half-spin separation, LieHighestWeightPartII, citing Layer 5 here; negative-form group comparison, native, cited by this roadmap and by SpinGeometry G1.1 (main SpinGeometry README:535 still says this roadmap consumes G1.1; this head does not); triality on the three modules, this roadmap, cited by ExceptionalThetaCorrespondencesForG2. No object has two roadmap owners; the objects owned twice against the pinned library are R01–R03.

Source independence: 16 passages compared with 7 sources, none shared; largest share panyushev2001, 4 of 20 locator sites; contents compared with panyushev2001 and gallier2008: independent (Layers 3–6, 8 and 9 have no counterpart in either). The contents of Lawson–Michelsohn and Fulton–Harris could not be read.

## Not verifiable

- Lawson–Michelsohn, Theorems I.2.10 and I.4.3, Tables I–II, §I.2 (README:560, 719, 1400): not in the manifest or the sources cache; the sources service returned “no legal source found”.
- fultonharris1991, Lecture 19 §§19.2, 19.4 and Lecture 20 §§20.1–20.3: settled uncertified.
- kostant1997, Proposition 28 and Theorems B, 35, 40: settled uncertified; read only as reported at `bazlov2008` lines 396, 401, 448, 458.
- goodmanwallach2009, meinrenken2013, Chevalley, Cartan, Adams: References only, no locator at a statement.

## Source issues

- **Gap** in bazlov2008 at §3.5, p. 11: the source says the image E of the enveloping algebra is the Clifford centraliser of the invariants J; it should be the ℤ/2-graded centraliser, since for sl₂ the ordinary centraliser of J is the whole algebra; affects nothing.

## For the human reviewers

- Not tested: Lawson–Michelsohn (3 of 20 locator sites) and Fulton–Harris Lectures 19–20 could not be read; wording and arrangement were compared only with the seven readable texts.
- Licence: `shlyakhtenko2026` is an unrefereed 2026 preprint (arXiv:2606.28648v1), cited for the motivating CAR instance of §9.3, whose statements are native Tau Ceti theorems.
