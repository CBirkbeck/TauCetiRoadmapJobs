# Review of SpinRepresentations (pull request #1207 at 690944d)
Folder: `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`

**Verdict:** needs changes

## R01 (P2) — Two cited tripled-carrier declarations do not exist at the pin

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1555,1679`: “Consume `TauCeti.D4Tripled.pointsMulEquiv`/`pointsFunctorNatIso` for the represented Hopf-algebra points”; “Prove compatibility with `pointsMulEquiv`”.
**Claim:** §8.2 consumes two native declarations for the represented points of the tripled carrier; neither name is declared in namespace `TauCeti.D4Tripled`, and `pointsFunctorNatIso` is declared nowhere in the pinned Tau Ceti.
**Witness:** Pinned `TauCeti/Algebra/Lie/D4/Tripled/PointsFunctor.lean:56` declares `TauCeti.D4Tripled.pointsPresentation`; the representing equivalence is `TauCeti.GeneralLinear.IntegralPointsPresentation.mulEquiv` (`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/HopfIdealPoints/Presentation.lean:129`). The only `pointsMulEquiv` in the D4 files is `GeneralLinear.pointsMulEquiv`.
**Repair:** Replace the first sentence by: “Consume `TauCeti.D4Tripled.pointsPresentation` with `TauCeti.GeneralLinear.IntegralPointsPresentation.mulEquiv`, `mulEquiv_mapPoints`, `D4Tripled.points_def` and `D4Tripled.mem_points_iff` for the represented Hopf-algebra points”, and in item 3 write “compatibility with `(TauCeti.D4Tripled.pointsPresentation ℂ).mulEquiv`”.

## R02 (P3) — The native exterior-square orthogonal action of SL₄ is not consumed

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1301`: “*Needs:* Native polarized `TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix`, its half-spin/dual comparison; Mathlib exterior powers and `Representation.exteriorPower`”.
**Claim:** The invariant form on `⋀²(K⁴)`, the map `SL₄ → SO(⋀²K⁴)`, its kernel and its hyperbolic coordinates are native; §6.2 and the supplier contracts name none of them, so the route to `spin6_vector_equiv_exteriorSquare` would rebuild them. `Representation.exteriorPower` is Tau Ceti's (`TauCeti/RepresentationTheory/ExteriorPower.lean:48`), not Mathlib's.
**Witness:** `TauCeti/RepresentationTheory/Spin/Exceptional/Six/ExteriorSquare.lean:54,146` (`spinSixWedgeForm`, `spinSixSpecialLinearToIsometryGroup`); `Six/SpecialIsometry.lean:59,71,112` (`spinSixSpecialLinearToSpecialIsometryGroup`, its `_apply` as `(stdSLRep K 4).exteriorPower 2`, kernel of order 2); `Six/Hyperbolic.lean:152` (`spinSixWedgeIsometryEquivPolarSplit`).
**Repair:** Add these declarations to the rank-six supplier bullet and to §6.2's *Needs* (“Tau Ceti `Representation.exteriorPower`, `spinSixWedgeForm`, `spinSixSpecialLinearToSpecialIsometryGroup` with its apply and kernel theorems, `spinSixWedgeIsometryEquivPolarSplit`”), and state the remaining target as: the comparison of this native `SL₄ → SO(⋀²ℂ⁴)` with `spinToSpecialOrthogonal Q` along `spinGroupEquivSpecialLinearGroupOfFinrankEqSix P hV` and a specified isometry `V ≅ ⋀²ℂ⁴`.

## R03 (P3) — Constructions without an API list or three Checks

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:931,1046,1136,1199,1265,1329,1475` (§§2.1, 3.1, 4.1, 5.1, 6.1, 7.2, 8.1).
**Claim:** Each of these sections constructs an object (a matrix-group comparison, a basis comparison, a Lie action, the D₂/D₃ identifications, a pairing comparison, the covering map, `c_mat`/`c_quad`) and has no “API” list; §§2.1, 3.1, 4.1, 5.1, 6.1 have no Check and §8.1 has one. The previous R11 is repaired only in part.
**Witness:** Counting `**Checks.**` blocks and “has the following API” lists per `###` section gives 0/0 for §§2.1, 3.1, 4.1, 5.1, 6.1, 1/0 for §7.2 and 0/0 plus one inline Check for §8.1.
**Repair:** Add to each an API list of three prose bullets and these Checks. §2.1: for `D=diag(1,2)` the coordinate swap has `AᵀA=1` but `AᵀDA=diag(2,1)≠D`; in the basis `e₁, e₂/√2` the swap is an isometry; `−1∈Spin` has vector matrix `1`. §3.1: `β(e₁,e₂)` sends `e₁↦−2e₂`, `e₂↦2e₁`; `β(u,u)=0`; the dimension is `n(n−1)/2`, so 3 at n=3 and 0 at n=1. §4.1: on a hyperbolic plane `β(w,w′)` acts by `N−½`, with values `−½` on 1 and `+½` on w; `[N,C]=C` agrees with `c(polar(w′,w)w)`; in dimension 1 the Lie algebra is zero. §5.1: move the three weight computations of the layer's Examples (l=2, 3, 1) here. §6.1: `−1∈Spin₅` goes to `−I∈Sp₄`; `dim Sp₄=10=dim so₅`, whereas a symmetric pairing would give `dim SO₄=6`; in rank three the same pairing on the two-dimensional S is the area form, `Sp₂=SL₂`. §8.1: keep the Killing-form Check; add `[E₄,F₄]=N₃+N₄−1` with value −1 on the vacuum (the order `A₃A₄` changes its sign) and the count `4+24=28=dim so₈`. §7.2: add the API list (closure, the action formula `involute(x)·v·x⁻¹`, kernel `{±1}`, the inclusion of native Spin).

## R04 (P3) — Internal references point to layers that no longer hold the material; one undefined label

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:756,1016,1984–1986,1969`: “NegativeFormEvenComparison below in this layer”; “supplied by SpinConcreteGroupModels in Layer3”; “`spinGroup Q ≃* SL(2, ℂ)` (Layer 6)”.
**Claim:** After the move of native material into the supplier contracts these pointers are wrong, and `SpinConcreteGroupModels` is defined nowhere.
**Witness:** `SpinConcreteGroupModels` occurs once in the file; NegativeFormEvenComparison is in §7.3 while line 756 is in the supplier contracts; Layer 6 now has only §§6.1–6.2 (ranks five and six); `Cliff(0,2) ≅ ℍ` (line 1984, “Layer 7”) and SpinCompactTopologyFoundation (“Consume Layer2's”, line 753) are in the contracts. Line 1969 is a stray `---` before §9.3's *Needs*.
**Repair:** Line 756: “is NegativeFormEvenComparison of §7.3”. Line 1016: “supplied by SpinDifferentialComparison (§3.2)”. Lines 1984–1986: replace “(Layer 7)” and “(Layer 6)” by “(supplier contracts, real form and Clifford classification)” and “(supplier contracts, rank-three standard representation)”. At line 753 replace “Layer2's SpinCompactTopologyFoundation” by “the SpinCompactTopologyFoundation contract above”. Delete line 1969.

## R05 (P3) — LieGroups Layer 9 is used but is not in the LieGroups contract

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:364,1444,1452`: “Consume [LieGroups Layers 0–3 and 4–5]”; “LieGroups Layers 0–3 and Layer 9 Cartan decomposition”.
**Claim:** §7.3 and Layer 7's Dependencies consume the Cartan decomposition of LieGroups Layer 9; the supplier contract lists only Layers 0–5 and states nothing assumed of Layer 9.
**Witness:** Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1199,1225`: Layer 9 proves `K×𝔭≅G` for a global matrix-cover model (closed transpose-stable `H≤GL_N(ℝ)` with a finite central cover); the contract at README:364–367 does not mention it.
**Repair:** Append to the LieGroups contract: “§7.3 additionally consumes Layer 9's Cartan decomposition `K×𝔭≅G` for a global matrix-cover model; §7.3 supplies the model, `H=SO₀(p,q)` in the coordinates of `realCliffordForm p q` with the two-fold central cover `Spin(p,q)→H`.”

## R06 (P3) — Locators missing or attached to the wrong statement

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:1239–1241,1963–1964,1339–1341,1415–1416`: “together they are a full set of fundamental representations (Panyushev, … Lemma 2.2 and equation (2.3), pp. 7–8)”; “the CAR-matrix analysis of Shlyakhtenko (arXiv:2606.28648)”.
**Claim:** (a) The Panyushev locator supports the character formula, not the list of fundamental representations. (b) Shlyakhtenko is cited without a locator. (c) The surjection of the full cover onto O(Q) with kernel `{±1}` (§7.2) and the polar homeomorphism `Spin(p,q)≅K(p,q)×ℝ^(pq)` (§7.3) have none.
**Witness:** `panyushev2001 line 287` and `line 311` state only `ch Spin(V)` and `ch Spin₀(V)`. `shlyakhtenko2026 line 198` (Lemma 1, p. 5), `line 208` (Lemma 2, p. 6), `line 397` (Proposition 1, p. 10). `gallier2008 line 1203` (Proposition 1.21, p. 39), `line 1322` and `line 1361` (Theorem 1.24, p. 43; Propositions 1.25–1.26, p. 44).
**Repair:** (a) Move the Panyushev locator to the end of the character sentence and cite the fundamental-representation list as Fulton–Harris, Lecture 19, §§19.2 and 19.4 (key `fultonharris1991`, uncertified). (b) Write “(Shlyakhtenko, arXiv:2606.28648v1, Lemmas 1–2, pp. 5–6, and Proposition 1, p. 10)”, here and in the References. (c) Add “(Gallier, Proposition 1.21, p. 39)” to the covering statement of §7.2 and “(Gallier, Theorem 1.24, p. 43, and Propositions 1.25–1.26, p. 44, for `SO₀(p,q)`; the lift to Spin is a target here)” to §7.3.

## R07 (P3) — The description's summary block lists seven headlines; the head has eight

**Location:** Pull-request description, `roadmap-summary` block: “The Lean acceptance test keeps only headlines that no pinned library proves: the isometry criteria …, triality for Spin₈ …, and Kostant's isotypy and multiplicities”.
**Claim:** The block omits `spin6_vector_equiv_exteriorSquare`, which the head declares and the prose below the block lists.
**Witness:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/Suggested.lean:85` declares it; the worker's change list shows it added against main.
**Repair:** In the block write “…the isometry criteria for Clifford automorphisms (`generator_range_iff`, `first_word_piece_iff`), the rank-six vector/exterior-square comparison (`spin6_vector_equiv_exteriorSquare`), triality for Spin₈ …”.

## Verified sound

| Previous finding (review of 20b4750) | Head passage | Result |
|---|---|---|
| R01 monomial groups | README:254 “`CliffordAlgebra.monomialGroup`, `monomialGroupEquiv`, `natCard_monomialGroup` … supply the signed monomials” | Repaired |
| R02 coordinate adapters | README:270 “`QuadraticForm.isometryEquivWeightedSumSquares` … supply diagonalization” | Repaired |
| R03 polar deformation | README:281–291 “`spinPolarRetraction`, `spinPolarHomotopyRel`, `spinPolarHomotopyEquiv`” | Repaired |
| R04 odd-line sign | README:299 “No second odd-line construction is required” | Repaired |
| R05 Fock equivariance | README:300 “`TauCeti.pinRep_mul_spinAction_ι_mul_pinRep_inv`” | Repaired |
| R06 exceptional comparisons | README:306–316, the three bundled endpoints | Repaired |
| R07 real components | README:317–326 | Repaired |
| R08 positive-root identity | README:1868–1871 “prove `LieAlgebra.rank ℂ 𝔤 = dim H` … combine it with `TauCeti.finrank_eq_finrank_cartan_add_two_mul_card_isPos`” | Repaired |
| R09 zero-rank owner | README:968 “import the generated-Spin versus full even norm-one scalar comparison from OrthogonalSpinGroups §1F” | Repaired |
| R10 rank-six headline | Suggested.lean:85 | Repaired |
| R11 README shape | Sections, *Needs*, Examples, Dependencies present; API/Checks missing in seven sections | Partly: R03 |
| R12 zero-dimensional Check | README:856 “a criterion requiring positive dimension would wrongly exclude this case” | Repaired |
| R13 locators | Gallier, Bazlov, Kirillov, Conrad, Baez attached; the pin's text has the integration theorem as Theorem 3.41, p. 40 (`kirillov2008 line 1351`), as the head cites | Repaired; remaining gaps are R06 |
| R14 description | Prose lists the consumed native APIs | Repaired; R07 is new |

| Statement / target | Instances tried | Left side computed | Right side / control | Result |
|---|---|---|---|---|
| §0.1 `generator_range_iff` | V=0; Q=0 on a line; real plane, conjugation by diag(2,1) | only automorphism id; `ε↦uε` keeps Kε; X↦[[0,2],[1/2,0]] ∉ span{Z,X} | unique isometry id; isometry u; no isometry | Both directions agree in all three |
| §0.1 `first_word_piece_iff` | dual numbers; Cliff(4,0), u=2+ω | `φ(ε)=a+uε` squares to `a²+2auε`, so a=0; `u e₁ u⁻¹=(5e₁−4e₂e₃e₄)/3` | F₁ kept iff W kept; grading kept but F₁ not | Agrees; grading is weaker |
| §1.1 monomial Checks | n=0,1,2,3 | orders 2,4,8,16; classes 5 (n=2), 10 (n=3) | 8=4·1²+2²; 16=8·1²+2·2² | Agree |
| §2.1 coordinate comparison | D=diag(1,2), coordinate swap A | `AᵀDA=diag(2,1)` | D=diag(1,2); `AᵀA=1` | D must be retained; text agrees |
| §2.2 reflections in Pin | Q(v)=−1; Q(v)=1 | `ιv·star(ιv)=−Q(v)`=1; =−1 | native Pin needs 1 | Text's normalization `Q v=−1` is right |
| §2.4 Spin₂(ℂ)≅ℂˣ | z=2 | u=5/4, v=−3i/4, u²+v²=25/16−9/16=1 | u+iv=2 | Agrees |
| §3.2 differential | β=e₁e₂, Q(eᵢ)=1 | [β,e₁]=−2e₂, [β,e₂]=2e₁ | polar formula: −2e₂, 2e₁ | Agrees |
| §4.1 algebraic Lie action | hyperbolic plane, `H=½(ww′−w′w)` | N−½: −½ on 1, +½ on w | `[N,C]=C=c(polar(w′,w)w)` | Agrees |
| §4.2 compact real span | rank 2, e₁=C+A, e₂=i(C−A) | e₁²=e₂²=1; e₁e₂=i(1−2N) | eigenvalues i, −i; `(Qv)⁻¹(Qw)⁻¹>0` is a real square | Agrees |
| §5.1 fork assignment | l=1,2,3,4 | top wedge degree 1,2,3,4 | ω_l on S⁻,S⁺,S⁻,S⁺; l=1 weights −½, +½ | Agrees with native parity rule |
| §5.3 character | l=2; Panyushev 2.2 with m(0)=0 or 1 | four sign vectors | (t₁^½+t₁^−½)(t₂^½+t₂^−½), factor 2^0 | Agrees; locator placement is R06 |
| §6.2 `spin6_vector_equiv_exteriorSquare` | SL₄ diag(2,3,5,1/30); −I, iI | ⋀² eigenvalues 6,10,1/15,15,1/10,1/6 | reciprocal pairs, product 1; −I↦1, iI↦−1 | Consistent with kernel {±1}; not proved at the pin (R02) |
| §7 classification | (1,0),(0,1),(0,2),(1,1),(3,0),(0,3),(5,0) | residues 7,1,2,0,5,3,3 | ℝ×ℝ, ℂ, ℍ, M₂(ℝ), M₂(ℂ), ℍ×ℍ, M₂(ℍ)² | Agree with the standard table read at q−p |
| §7.1 real Spin image | (1,0); (1,1) | Spin={±1}, image 1; elements ±(cosh t+sinh t·z) | SO(1)=1; positive boosts only | Agrees |
| §7.2 full cover | Cliff(0,1); Cliff(1,0); z=e₁e₂ in (1,1) | {±1,±e}≅C₄; ≅C₂×C₂; z²=1, reverse(z)z=−1 | Pin = cover; Pin={±1}; z ∉ Spin, acts by −1 | Agrees; Pin image is the kernel of `r_v↦sign(−Q v)` |
| §7.3 maximal compact | (1,1),(2,1),(2,2),(3,1) | dim K+pq = 0+1, 1+2, 2+4, 3+3 | dim so(p,q)=1,3,6,6; |K(1,1)|=2 | Agrees |
| §8.1 numbered elements | E₄=C₃C₄, F₄=A₄A₃; chain i | [E₄,F₄]=N₃N₄−(1−N₃)(1−N₄) | N₃+N₄−1; chain N_i−N_(i+1); κ: 12=6·2 | Agrees |
| §8.2 root and torus Checks | x₁(u) on b₂,b′₁; T_Cl(s) | polar(b₂+ub₁,b′₁−ub′₂)=−u+u | 0; characters s₄,s₃,s₁,s₂s₄⁻¹,s₁s₄⁻¹; V-kernel s₃=s₄=±1 | All nine Checks recomputed, agree |
| §8.3 block tables | all 21 lowering steps | e.g. F₃b′₄=−b′₃, F₂b₁₂₄=b₁₃₄, F₄b₁₃₄=b₁, F₄b₃₄=1 | rows as displayed, two minus signs in row 0–7 | Agree |
| §8.4 `exists_trialityAut` | σ=(1 3 4); weight of ρ∘t at node i is λ(σi) | ρᵥ∘t: node σ⁻¹(1)=4; ρ₊∘t: 3; ρ₋∘t: 1 | S⁺, S⁻, V; composite of the three K maps `J₁P₂₄³J₁⁻¹` | Lean orientation equals README's; cube is id |
| §8.4 `exists_trialityForm` | T(w₁,1,w₂w₃w₄); w₂ in first slot | top coefficient 1; w₂∧w₂w₃w₄=0 | weights e₁−½Σe+½(−e₁+e₂+e₃+e₄)=0 | Nonzero and torus-invariant |
| §9.1 rank bookkeeping | sl₂, sl₃, 0 | d=3,8,0; l=1,2,0 | l+2#Δ⁺=1+2, 2+6, 0 | Agrees; rank = dim H is not at the pin, target kept |
| §9.2 `nonempty_kostant_isotypic` | sl₂ | Cliff=M₂⊕M₂, A diagonal M₂ | left-regular = 4 copies of the 2-dimensional simple | Agrees; instance resolves to `kostantLieRingModule ℂ L` |
| §9.2 `kostant_multiplicity` | (d,l)=(3,1),(8,2),(0,0) | 2^((d−l)/2)=2,8,1 | copies 4,32,1; products 8,256,1=2^d | Exact divisions, no junk value |
| §9.2 `kostantSpinRep_multiplicity` | same | spinor dimension 2,16,1 | 2^⌊l/2⌋·dim L(ρ)=1·2, 2·8, 1·1 | Agrees |
| §9.2 P and Q_P | sl₂ ω; sl₂⊕sl₂ | (x₁x₂x₃)²=−q₁q₂q₃=512; ⟨ω,ω⟩=−512 | Bazlov's `p·p=(α(p),p)`, α=−1 in degree 3: 512 | Agrees with `bazlov2008 line 399` |
| §9.3 CAR | N=1,2; bracket | `[F_ij,d_kl]=δ_jk d_il−δ_li d_kj`; shift (N/2)δ_ij | ν=(N−½,…,½); 2^(N(N+1)/2)·2^(N(N−1)/2)=2^(N²) | Agrees with `shlyakhtenko2026 line 199, 400` |
| R01 names | `TauCeti.D4Tripled.pointsMulEquiv`, `pointsFunctorNatIso` | 0 declarations at the pin | `pointsPresentation`, `IntegralPointsPresentation.mulEquiv` exist | R01 |
| R05 LieGroups contract | contract lines 364–367 | Layers 0–3, 4–5 | §7.3 *Needs* adds Layer 9 | R05 |

- Sources: 13 locators read in 7 texts: `gallier2008` lines 325, 482; `panyushev2001` lines 287, 311, 313, 320; `kirillov2008` line 1351; `conrad-rgs` line 8173; `baez2002` lines 640–721; `bazlov2008` lines 371–458; `shlyakhtenko2026` lines 198, 208, 397. All support the statements as written except the placement in R06(a).
- Library: 420 backticked names of the README checked for a declaration at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`); one unresolved pair (R01). 14 signatures opened, among them `FullCover.lean:45`, `Real/IdentityComponent.lean:127`, `Real/Connected.lean:247`, `ReflectionLift.lean:307`, `Lie/SkewAdjoint.lean:262,301`, `Weights/Dimension.lean:182`, `CAR/Isotypic.lean:175`, `OrthogonalGroup/Coordinate.lean:35`.
- Cross-roadmap citations resolved on main: OrthogonalSpinGroups 1A–1F (lines 430–555), ClassicalGroups §§0.1, 0.2, 1.2, 3.5, Layer 3A, LieHighestWeight Layers 7 and 9, RootSystems §§4.3, 5.2 and its numbering table, LieGroups Layers 0–5 and 9, ReductiveGroups 9B, QuadraticFormInvariants Layer 1, SpinGeometry G1.1 and G4.1; consumers NoncompactQuantumSymmetry M0 and RelativisticQuantumFieldTheory RQFT2 at their open heads.
- Gate: every check passed at 690944d. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of this folder.
- Elaboration: `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else. The nine elaborated signatures were compared with the README statements: no lost binder, same generality.
- Padding: each of the 8 theorems tried with `rfl`, `simp`, `infer_instance` and `exact?` on a scratch copy; none closes. No pinned declaration states any of them.
- Headlines: 8 stated; the docstring names low-rank D, the group-level highest-weight and differential comparison, and the full ρ-decomposition as not statable, each with its missing carrier.

Overlap check: read open OrthogonalSpinGroups, LieHighestWeightPartII, ExceptionalThetaCorrespondencesForG2 and main SpinGeometry, OrthogonalSpinGroups, LieHighestWeight (the open LieHighestWeight and ChevalleyGroups heads were not among the checkouts with files; the third list is empty). Shared objects and owners: general-field spinor norm, low-rank unitary carriers and the rank-zero μ₂ comparison, OrthogonalSpinGroups; generic highest weights and Serre presentation, LieHighestWeight; half-spin separation for classical recognition, LieHighestWeightPartII, citing Layer 5 here; negative-form group comparison, native, cited by both this roadmap and SpinGeometry G1.1; triality on the three modules, this roadmap, cited by ExceptionalThetaCorrespondencesForG2. Nothing has two owners.

Source independence: 12 passages compared with 7 sources, none shared; largest share panyushev2001, 4 of 18 locators; contents compared with panyushev2001 and gallier2008: independent. The contents of the uncertified books (Lawson–Michelsohn, Fulton–Harris) could not be read.

## Not verifiable

- Lawson–Michelsohn, Theorems I.2.10 and I.4.3, Tables I–II, §I.2 (README:540, 699, 1322): the sources service returned “no legal source found”; recorded in the scratch reference list.
- fultonharris1991, Lecture 20, §§20.1–20.3: settled uncertified; not requested.
- kostant1997, Proposition 28 and Theorems B, 35, 40: settled uncertified; checked only as reported at `bazlov2008` lines 396, 401, 448, 458.
- goodmanwallach2009 and meinrenken2013: settled uncertified; cited in the References only.
- Chevalley, Cartan and Adams (References only): no locator at a statement; not requested.

## Source issues

- **Gap** in bazlov2008 at §3.5, p. 11: the source says the image E of the enveloping algebra is the centraliser of the invariants J in the Clifford algebra; it should be the ℤ/2-graded centraliser, since for sl₂ the ordinary centraliser of J is the whole algebra; affects nothing.

## For the human reviewers

- Not tested: Lawson–Michelsohn (3 of 18 locators) and Fulton–Harris Lecture 20 could not be read; wording and arrangement were compared only with the seven readable texts.
- Licence: `shlyakhtenko2026` is an unrefereed 2026 preprint (arXiv:2606.28648v1); it is cited for the motivating CAR instance of §9.3 only, whose statements are native Tau Ceti theorems.
