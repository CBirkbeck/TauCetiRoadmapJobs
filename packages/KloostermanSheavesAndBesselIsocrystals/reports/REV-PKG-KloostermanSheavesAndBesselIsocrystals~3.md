<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6783393497 -->
Review (codex) of 967bf39

Verdict: needs_changes

1. **F01** (P1) Lower ramification is not preserved by a central lift

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1415–1419, “`H` almost simple” and “`D₂ = 1`”.

   **Claim:** Gross–Reeder's lower-filtration conclusion holds for every almost-simple central form, assuming vanishing adjoint inertia invariants, adjoint Swan equal to the rank, and residue characteristic prime to the Weyl-group order.

   **Witness:** Over `F₅((t))`, take `u⁴=t`, `z⁵−z=u⁻²`. Its group `C₅⋊C₄` embeds in `SL₂`, has zero adjoint inertia invariants and adjoint Swan 1, but `D₂=C₅`.

   Here is the full calculation, requiring no classification. Let `σ(u)=u`, `σ(z)=z+1`, and `τ(u)=2u`, `τ(z)=−z`. These preserve the equations, have orders 5 and 4, and satisfy `τστ⁻¹=σ⁻¹`. Embed them as

   `σ ↦ diag(ζ₅,ζ₅⁻¹)`, `τ ↦ [[0,1],[−1,0]]`.

   This finite Weil parameter is discrete: its centralizer in `SL₂` is the finite centre. In the adjoint representation, wild inertia fixes only the Cartan line and `τ` negates that line, so full inertia invariants have dimension 0. Normalize the extension valuation by `v(u)=5`, `v(z)=−2`. Then `w=uz²` is a uniformizer and `v(σ(w)−w)=v(u(2z+1))=3`. Consequently

   `|D₀|=20`, `D₁=D₂=C₅`, `D₃=1`.

   The upper break is `2/4=1/2`; the two nontrivial root lines give adjoint Swan `2·(1/2)=1=rank SL₂`. Also `5∤2=|W_SL₂|`. Every displayed hypothesis holds, but `|D₂|=5≠1`.

   GR line 1173 restricts the dual group in this section to adjoint type; Proposition 5.6, GR lines 1302–1312, retains that context. Quotienting this example by `τ²` gives the adjoint dihedral image of order 10, whose lower wild break is 1 and whose `D₂` is trivial. Upper numbering and the adjoint representation survive this quotient; the lower numbering of the original image does not.

   **Exact repair:** Keep the general central-form scope and the definition by adjoint invariants/Swan. State the full Gross–Reeder image and lower-filtration theorem for the image in `H_ad`; state separately the adjoint upper-break conclusion for arbitrary `H`. Do not assert `D₂=1` for its central lifts. Explain the change of lower numbering under a central lift, and add the displayed `SL₂/F₅((t))` example as a negative-control Check. §§6.6 and 11.5 need only the adjoint upper-break conclusion and can retain it. The repaired adjoint version gives `|D₀|=10`, break 1 and `D₂=1` on this same example, while the original lift keeps `|D₂|=5`.

2. **F02** (P1) The object-level convolution omits its shift

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1821–1824, “`⋆` is `Rμ_!` of the exterior product” and the asserted object isomorphism. The claim is exported at 2147–2148.

   **Claim:** The unshifted compact-support convolution, with a half Tate twist, is the smooth Bessel object, and its trace is the negative convolution of the two normalized trace functions.

   **Witness:** For `q=3,n=2,a=1`, the defined unshifted twisted convolution has trace `−4/9`; the claimed `SO₅` object and the paragraph's own trace formula have trace `4/9`.

   Direct sums give `R₂(1)=−1`, `R₂(2)=2`, `U₂(1)=7`. Thus the two `SO₃` traces are `−2/3,1/3`, and the two normalized rank-two scalar traces are `1/√3,−2/√3`. Since both units are self-inverse,

   `Σ_{uv=1} T_SO₃(u) K₂(v) = −4/(3√3)`.

   The half twist multiplies this by `1/√3`, producing `−4/9`. The `SO₅` trace is `(U₂(1)−3)/3²=4/9`. A shift `[1]` supplies precisely the missing sign.

   Miy Definition 2.1.1 and Proposition 2.1.3, lines 549–560 and 580–598, explicitly give the positive trace convolution for the unshifted operation. XZ lines 701–717 place the isocrystals in the constructible heart, so their point traces do not conceal the required sign. XZ lines 2605–2607 define the same unshifted operation; its printed §5.3.9 formula, lines 2893–2895, has the normalization defect being corrected here.

   **Exact repair:** With the stated convention for `⋆`, write

   `Be†_{SO_{2n+1},Std} ≅ (Rμ_!(Be†_{SO₃,Std} ⊠ Be†_{2n−2}))[1](1/2)`.

   Equivalently define a shifted convolution explicitly, then use it consistently. Transport the shift to §11.5, explain concentration in the required degree, and retain the existing raw-sum and trace formulas. Add this object-versus-trace test. The repaired right side has trace `−(−4/9)=4/9`, agreeing with the left. No change to the Lean convolution identity is needed.

3. **F03** (P1) The toric route has unowned general prerequisites

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:2084–2092, the degree/Hodge/Newton assertion and “Wan's boundary decomposition gives ordinarity”.

   **Claim:** The declared inputs of §11.2 support the Adolphson–Sperber nondegenerate-polyhedron theorem and Wan's diagonal/facial ordinarity theorem used by its proof route.

   **Witness:** PR #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`:11506 and 12005, supplies an Euler-product definition and rationality. Neither section supplies Newton-polyhedron concentration, its Hodge bound, or diagonal/facial ordinarity. No declared gap supplies them either.

   The only listed needs are §9.1, RD.6.4 and RD.6.25. XZ lines 2981–3006 explicitly use the additional general results. The arithmetic-operations contract supplies six operations, weights and traces, not these polyhedral theorems. Object searches in the main/open-roadmap index and board found scalar Kloosterman cohomology at RD.6.94, and complex twisted-de-Rham concentration in `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`:1065–1073; the latter has complex coefficients and no finite-field Frobenius/Newton conclusion. These are not the missing general finite-field results. The settled uncertified status of AS89/Wan93/Wan04 is not this finding: a source citation does not assign library ownership.

   **Exact repair:** Add precise general supplier contracts to the earlier PadicDifferentialEquationsAndRigidCohomology roadmap, with matching gap slugs in the README and the plan's gaps list, and list them in §11.2's needs. Separate (a) nondegenerate Laurent-polynomial cohomological concentration, normalized-volume degree and Newton-above-Hodge, from (b) diagonal ordinarity and facial decomposition, with their exact coefficient, lattice, nondegeneracy and characteristic hypotheses. Alternatively own and plan those general theorems here before their use; do not replace them with assumptions solely about this Bessel polynomial. Reuse any already supplied complex or scalar results by citation, without claiming they contain Frobenius ordinarity.

   Test the completed contracts on `n=1,d=2,p=3`: dimension 3, volume 1, degree `3!·1=6`, slopes `0,1/2,1,3/2,2,5/2`. For `d=1`, degree 3 and slopes `0,1,2`; the quotient retains `1/2,3/2,5/2`. The `d=2,p=2` case must fail the prime-to-denominator hypotheses. These are the required specialization checks; their correct arithmetic cannot replace the missing ownership contract.

4. **F04** (P2) The facet index is asserted for every face

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:2089, “every face not containing the origin is diagonal with lattice quotient of order `d`”.

   **Claim:** Every such face, in every dimension, has lattice quotient of order `d`.

   **Witness:** For `n=1,d=2,p=3`, the vertex `(1,0,0)` is a face not containing the origin. Its lattice generator is primitive: the quotient in its saturated span has order `1`, not `2`.

   In the ambient rank-three lattice the quotient by that single generator is infinite, so that interpretation does not rescue the claim. XZ line 2994 explicitly restricts the argument to codimension-one faces. For the facet with columns `(1,0,0),(0,1,0),(0,0,2)`, the determinant is 2, as required.

   **Exact repair:** Replace “every face” by “every codimension-one face” in the diagonal-index step, and use the facial-decomposition theorem with that precise hypothesis. Keep nondegeneracy on all required faces as a separate assertion. Add the primitive-vertex negative control: its saturated index is 1, while the displayed facet index remains 2. No restriction on the main ordinarity theorem is needed.

Four findings: three P1 and one P2; four blocking. All sixteen previous findings are repaired. The five Lean headlines elaborate, retain their hypotheses, and are not padding. The remaining defects concern central lifts of local parameters, a missing convolution shift, and the toric proof route. No package input was changed.

Previous findings were checked first. Locations in this table are in `packages/KloostermanSheavesAndBesselIsocrystals/README.md` unless stated otherwise.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01, radius at the wrong puncture | repaired | §7.3:1498 says “a nonzero solution functional at `0`”; 1507 gives “radius `1/\|c\|`”. XZ line 2547 uses solutions at zero. The coefficient and rescaling calculations below give radii 1, 4 and 1/4. |
| R02, incorrect ULA definition | repaired | §1.2:552 requires pullback “along every morphism” between smooth bases, with the graph comparison for every coefficient object. It retains “smooth” for the target. The zero-point inclusion in the smooth affine line is included, although that morphism is not smooth. XZ lines 988–998, 1064–1067 agree. |
| R03, central descent over arbitrary coefficients | repaired | §2.6:872 requires a “compatible `K`-rational marking”; §2.7:892 constructs the normalized comparison and proves Galois invariance. For a nonsquare `a`, the equation `c²a=1` still has no rational solution. The new rational-critical-centre contract occurs in the plan and README. |
| R04, using Frobenius before constructing it | repaired | §3.4 explicitly proves convergence before extension and invokes `gap:dense-convergence-detection`; the contract at 306 says “does not assume Frobenius”. RD.5.102(a), rather than F-only full faithfulness, supplies underlying dense restriction. The rank-248 `E₈` adjoint is reached without a minuscule-generator assumption or §4.1. |
| R05, central normalization in Newton bound | repaired | Contract at 244 now says “finite-order central character”, also in the plan. VL-est lines 270–279 and 291–303 support it. The torus norm character of slope 1 is excluded; a finite-order character has slope 0. |
| R06, eigenfunction uniqueness | repaired | §5.2:1267 specifies a “nonzero cuspidal Hecke eigenfunction”, with component values fixed by the chosen normalized eigenobject. It no longer asserts unrestricted uniqueness. For `PGL₂`, the two component vectors `(1,1)` and `(1,−1)` remain distinct. |
| R07, exceptional inclusion called an outer fixed group | repaired | §2.8:914 says “its seven-dimensional orthogonal representation” for `G₂⊂B₃`, separately from foldings. Dimensions are 14 and 21; the `B₃` diagram automorphism group has order 1. FG line 621 supplies the exceptional realization. |
| R08, general hypergeometric scope | repaired | §9.1:1736 starts “For finite sequences” of upper and lower parameters with nonintegral differences, both unequal-length directions, equal positive lengths on `G_m\{1}`, and the empty convolution unit. Suggested.lean:40–43 names that general construction as unstatable. The rank-two and balanced rank-one tests below distinguish the expansion. |
| R09, internal backward cycles | repaired | §2.8:924 proves rigidity “directly in characteristic zero”; §2.9 now contains the symmetries; §4.1 needs §2.8. The former `2.8→6.6→6.3→2.8` cycle and the symmetry edge to Layer 7 have disappeared. |
| R10, scalar supplier labels | repaired | Contracts at 213–221 cite “§1.1 (normalized sheaf)” and §§1.3, 2.1, 2.6, 2.5. These are present in the scalar package at lines 471, 534, 625, 747, 725. No old `KM.*` supplier citation remains in the reviewed README or Lean docstring. |
| R11, dropped downstream labels | repaired | At 374: “The former layer labels `KB.k` mean Layer `k`”. The following former-numbering table maps every named target used by GlobalShtukasAndFunctionFieldLanglandsPartII, including `rigidity-local` and `all-prime-corollaries`; former §7.2 maps to §2.9. |
| R12, rank-zero eliminated formula | repaired | §11.1:2014 restricts elimination to “`k ≥ 1`” and retains the rank-zero delta function. At `F₂,k=0,a=1`, the actual sum is 1, whereas the invalid eliminated expression is −1. At rank one the repaired formula gives `ψ(a)`. |
| R13, false Checks | repaired | §0.2 specifies “`t` a uniformizer”; §1.4 uses the “normalized fibre”; §§2.7/8.1 separate cyclic solutions from column-horizontal sections; §3.3 uses a “vertex neighbourhood”; §4.3 distinguishes the `PGL₂` and `SL₂` cocharacters. Each old counterexample now has the correct value, recorded below. |
| R14, AC and PRW locators | repaired | §1.1:528 cites “Abe–Caro Proposition 1.3.13(i)”; §8.4 cites PRW “Theorem 3.2, p. 14”. AC lines 817–819 give the directional exactness assertions; PRW lines 709–729 establish the printed page and theorem. Both manifest entries agree. |
| R15, Checks for supporting definitions | repaired | §11.1:2052 computes quadratic-character values “`0,1,−1`” and now has distinct controls for all five sum/character definitions. The quadratic-character values are `0,1,−1`; the `F₄` trace character takes `1,1,−1` at `0,1,ω`. The block definition in §10.1 also has its own controls. No Check was promoted to Lean padding. |
| R16, undefined functional action | repaired | §2.9:945 defines “`r_{a,σ} : V → V`”, its root-line action and composition. For `SL₂`, rotation changes the invariant from `b₁b₀` to `ab₁b₀`; two rotations give `ab`, not `a²b²`. The lowest-root scalar under the pinned automorphism is retained. |

None of the previous findings was marked not actionable. No settled finding is re-raised. The repaired patterns were searched throughout the four package inputs; the findings below concern additional claims, not a request to undo these repairs.

## Verified sound

All 65 numbered target subsections, their definitions, APIs, Checks and needs lines were read. The prior report's computed rows were reused only for unchanged assertions: tame-character order, all-power traces, oper parameter, localization flatness, specialization/unit, column Frobenius and its inverse, dominance, unit-root multipliers and quotient duality. Its blanket source/ownership summaries were not treated as evidence. Changed passages, this round's fifteen sampled targets, the five Lean headlines and all finding targets were examined again. Numerical tests are counterexample searches and convention checks, not proofs of the deep constructions.

**Principles and shape.** This is a new roadmap, not a replacement of an existing main-branch roadmap. Its characteristic-two branch, ranks divisible by the residue characteristic, arbitrary central forms and general hypergeometric construction are retained. R01 repairs a theorem about central forms without discarding them. R03 is the remaining general-library ownership defect. No computational-algorithm target, copied source passage, sorry'd data, `set_option`, forbidden import, `lemma` declaration, machine path, pull-request number or handoff narrative was found in the README/Lean inputs. All twelve layers have Examples and Dependencies. The layers are mathematical, with Newton bounds preceding monodromy and the characteristic-two comparison; their needs force this order rather than adopting source chapters. Definition/API/Check blocks, including all six Lean-supporting definitions, have at least three discriminating controls. Main-branch AffineLieAlgebras and ReductiveGroupsPartII were read as shape comparisons. Metadata has topic `math.NT`.

**Lean, all signatures and all padding probes.** The prescribed elaboration was run from the pinned content checkout on the unchanged package file: exit 0, exactly five `declaration uses 'sorry'` warnings, at Suggested.lean lines 66, 133, 145, 156 and 169, and no other warning. There is only `import Mathlib`, so no Tau Ceti module build was necessary. A scratch copy with `#check @name` for every actual declaration also elaborated. There are eleven declarations, six definitions and five theorems; the supplied thirteen-entry ledger includes parser false positives. All eleven types were compared with the README. No needed binder disappeared and no signature was changed.

The signed theorem retains the complete DVR, fraction field, characteristic zero, nonunit two, nonvanishing coefficients, and all signed congruences; it is not specialized to `Z₂`. The characteristic-two identity uses a nontrivial prime-field character and its trace lift. The odd identity allows any coefficient field admitting the nontrivial character. Every relevant field is finite, every Bessel parameter is a unit, and ranks satisfy the stated positive lower bounds. The ordinarity theorem chooses the whole eigenvalue list before quantifying over extensions; prime-field algebra structures agree uniquely, and the explicit `Type` choice matches the convention. Rank-zero and zero-parameter junk in the total definitions is documented and excluded from the headline hypotheses.

On a scratch copy, every `sorry` was replaced with `first | rfl | infer_instance | simp`. All five failed: the signed theorem left coefficient divisibility, and the four sum/eigenvalue theorems made no progress. The native declarations and supplied near-match candidates were compared at the pins; none proves a headline by one `exact` library application. None of these theorems is a boundary calculation or a restated definition. No padding deletion is requested.

**Headline coverage.**

| README headline | Acceptance-test coverage |
| --- | --- |
| Signed 2-adic Dwork refinement, §10.2 | `signed_dwork_congruence`, line 66. |
| Characteristic-two orthogonal/scalar identity, §11.1(i) | `orthogonalSum_sub_card_eq_kloostermanSum`, line 133. |
| Quadratic hypergeometric identity, §11.1(ii) | `gaussSum_mul_orthogonalSum_sub_card`, line 145. |
| Raw convolution identity, §11.1(iii) | `orthogonalSum_sub_card_eq_convolution`, line 156. This numerical theorem does not contain the faulty object shift of R02. |
| Everywhere orthogonal trace-function ordinarity, §11.3 | `orthogonalSum_ordinary`, line 169. Scalar trace-function ordinarity belongs to the named scalar supplier. |
| Group-valued eigenobject, Bessel F-isocrystal and companion; arithmetic Satake | Docstring lines 19–24 names the missing curve-isocrystal, arithmetic D-module, Grassmannian and Hecke-eigensheaf carriers. |
| Zhu comparison and relative de Rham–rigid comparison | Docstring lines 25–27 names missing stack D-modules, opers and relative rigid cohomology. |
| Differential/algebraic/arithmetic monodromy; exceptional characteristic-two branch | Docstring lines 28–30 names missing differential and isocrystal monodromy carriers. |
| Generic Newton ordinarity and everywhere classical/`G₂` Newton points | Docstring lines 31–35 names the group-valued Newton-point carrier; native trace consequences are covered above. |
| Functoriality, companion monodromy, characteristic-two isocrystal comparison | Docstring lines 36–39 names the missing local-system/isocrystal carriers. |
| General rational nonresonant arithmetic hypergeometric construction | Docstring lines 40–43 specifies both parameter sequences, rank, balanced domain and missing arithmetic category. |
| Adjoint rigidity and simple-wild local parameters | Docstring final bullet names missing coefficient cohomology and group-valued Weil-parameter carriers. |

No additional statable summary headline was found absent, and no free predicate or ad hoc encoding stands in for an unavailable carrier. All backticked identifiers attributed to this roadmap resolve to its eleven declarations. The wrappers for native characters and raw sums exist only to state these headlines; they are not a second planned character-sum library.

**Seeded source verification.** All fifteen requested targets were checked against the legal cached texts. Versions agree with sources.toml: XZ uses arXiv v2 pagination, HNY the published pagination, GR the cached preprint's page 34, and FG arXiv v3. The seven settled uncertified sources are distinguished below. There was no additional author-flagged unread locator requiring a fetch.

| Sampled target | Locator opened | Finding from the source comparison |
| --- | --- | --- |
| 0.2 root-depth quotient | HNY §1.2, pp. 250–252, HNY lines 426–451; XZ §4.1.1, XZ line 1751 | Affine-simple quotient supported. The roadmap correctly substitutes the root-depth kernel for the problematic commutator description; the uniformizer Check is repaired. |
| 1.4 clean datum | XZ Lemma 4.1.4, pp. 38–39, XZ lines 1827–1835; HNY Lemma 2.3/Definition 2.4, pp. 256–257, HNY lines 669–674 | Genericity, component choice and inverse dimension shift agree. |
| 1.5 normalized Hecke action | XZ §4.1.2, pp. 38–39, XZ lines 1779–1815; §4.1.8, p. 40, XZ lines 1891–1895 | Bounded Grassmannian, unit, tensor constraints and base-point exponential pushforward agree. |
| 1.6 eigenobject | XZ Theorem 4.1.5 and §§4.1.6–4.1.8, pp. 39–40, XZ lines 1836–1869; HNY Theorem 1, p. 261, HNY lines 857–867 | Source supports eigenobject, purity and tensor construction. Repaired ULA and affine-exactness inputs retain the needed hypotheses. |
| 2.6 central descent | XZ §4.3.6, p. 49, XZ lines 2277–2289 | Geometric statement supported; source alone does not establish rational triviality. The marked rational descent is now an explicit additional target, with a separating nonsquare Check. |
| 3.3 quasi-minuscule middle image | XZ Lemma 4.2.6, pp. 44–45, XZ lines 2045–2107 | Middle-image claim located. The source's affine-step gap is expressly replaced; it is not presented as a valid affine proof. The global variety is distinguished from its punctured vertex chart. |
| 6.1 monodromy groups | XZ §4.5.1 and (4.5.1.1), p. 51, XZ lines 2345–2367 | Generated categories, fibre functor and directions of closed immersions agree; no canonical group independent of a chosen fibre functor is asserted. |
| 6.5 simple wild parameters | GR Proposition 5.6, p. 34, GR lines 1302–1312, with GR lines 1170–1173 | Adjoint-type hypothesis lost: R01. |
| 7.3 exact radius | XZ Proposition 5.1.3 proof, p. 55, XZ lines 2532–2555 | Correct puncture zero, solution-functional convention and parameter rescaling. Monodromy inputs now precede the theorem. |
| 8.2 orthogonal matrices | XZ §5.3.3, p. 58, XZ lines 2680–2735; §5.3.6, pp. 60–61, XZ lines 2805–2882 | Matrices, invariant vector and cyclic operator supported; coordinate choices checked by the form equation below. |
| 8.5 boundary count | XZ Proposition 5.3.5, pp. 59–60, XZ lines 2774–2802 | Source's constant is false starting at `n=4`. The roadmap's corrected constant passes independent chart enumeration. |
| 8.6 even toric trace | Same proposition, plus XZ (5.3.6.5), p. 60, XZ lines 2864–2869 | Even shift has positive sign; corrected boundary term and invariant-line decomposition give compatible traces. |
| 9.2 normalized hypergeometric object | XZ Theorem 5.2.2 and §5.2.3, p. 57, XZ lines 2620–2645 | Gauss scalar, degree powers and weight-zero normalization agree; rank-n zero spectrum correctly stops at exponent `n−1`, not printed `2n`. Katz's underlying original locator remains uncertified. |
| 11.2 toric slopes | XZ Lemma 5.4.3, pp. 62–63, XZ lines 2948–3006 | Polynomial, volume and claimed slopes located. General inputs are not owned (R03); the facet condition is lost (R04). Original AS/Wan texts are settled uncertified. |
| 11.3 everywhere ordinarity | XZ Theorem 5.4.2(ii), p. 62, XZ lines 2932–2947, and Lemma 5.4.3 | Classical/`G₂` scope and route agree, with scalar all-prime ordinarity explicitly contracted. The route inherits R03; native small-field trace tests pass. |

The repaired AC/PRW locators were also reopened; so were Miy's general-parameter theorem and dense-convergence argument, Miy lines 64–90 and 1294–1303, and VL-est Proposition 2.1, VL-est lines 270–303. The current manifest has one key per work: 24 works, 17 certified and 7 settled uncertified. Every referenced work is recorded. No source or missing-reference entry was added or rewritten.

**Adversarial calculations.** The following are fresh calculations unless labelled inherited. Finite-field sums used exact cyclotomic integer coordinates, not floating-point approximations: 441 identity instances over `F₂,F₄,F₈,F₃,F₉,F₅,F₇`. They cover ranks corresponding to `n=1,2`, all nonzero parameters, all additive-character scalings for odd-characteristic identities, and all scalings for raw convolution at `N=2`; the characteristic-two scalar comparison uses the prescribed prime-field trace character. There were also nine direct chart-sum comparisons. These totals do not include the Dwork coefficient grid or matrix checks. Let `ζ³=1`, `ζ≠1`, so `ζ²=−1−ζ`.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 0.1 half twists and scalar normalization | Rank two, `q=3,a=1`; degree two over `q=4` | `R₂(1)=−1`, normalized trace `1/√3`; `(c₄⁻²)²=(1/4)²=1/16=4⁻²` | Correct. A chosen half twist is necessary. |
| Hasse–Davenport supplier and 9.2 degree powers | Quadratic Gauss sum over `F₃→F₉` | `g₁=−i√3`, `g₂=3=−g₁²`; `α₂=−3=α₁²`, where `α₁=−g₁` | Correct degree normalization. |
| 0.2 quotient | `SL₂`, torus, `GL₂/F₂[[t]]` | Root-line dimensions 2 and 0; coefficient of `t` in a square is 0, versus 1 in `1+t`; `1+t²=(1+t)²` | Correct quotient and repaired negative control. |
| 0.3 level components | `SL₂`, `PGL₂` | Big-cell dimension 2 in each case; component-group orders 1 and 2 | Correct; components cannot be collapsed. |
| 1.1–1.2 exactness/ULA | Zero-point inclusion in `A¹`; constant object and `j_!K` | Inclusion has relative dimension −1 and is not smooth; constant vanishing cycles 0, extension-by-zero has nonzero boundary vanishing cycles | All smooth-base morphisms are now included; genericity/cleanness cannot be omitted. |
| 1.3 normalized Satake | Minuscule `PGL₂`, torus | `H⁰(P¹)` and `H²(P¹)` dimensions `1+1=2`; normalized eigenvalues `q⁻¹/²,q¹/²`; torus weight object rank 1 | Half twist correct; full twist would give `q⁻¹,1`. |
| 1.4 clean fibre | `SL₂` big cell | Ordinary fibre `K[2]`, nonzero degree −2; normalized fibre `K[2][−2]=K[0]` | Repaired. |
| 1.5 normalized Hecke action | Unit, standard `SL₂`, tensor square | Unit rank 1 and shift 0; tensor rank `2·2=4`; at `q=3`, half-normalized rank-two trace `1/√3` versus full-twist `1/3` | Correct unit/tensor/twist controls. |
| 1.6 eigenobject | Standard, unit, evaluation | Ranks 2, 1, and evaluation target 1; source of evaluation rank 4; standard trace at `F₃,a=1` is `−(−1)/√3=1/√3` | Correct; rank alone is not used as tensor compatibility. |
| 1.7–1.8, inherited unchanged tests | Exponent `1/4`; matrices `diag(1,3)`, `diag(2,2)` | Tame order 4 versus integral order 1; first traces `4=4`, second traces `10≠8`, determinants `3≠4` | Retained computed evidence for tame data and all-extension traces. |
| 2.1–2.5, inherited unchanged tests | `SL₂×SL₃` scaled by 2; `K[t]/(t)` | Invariant scalings `4,8`; tensor rank 6; nonflat derived fibre has `Tor₀=K, Tor₁=K`, underived fibre only `K` | Factorwise exponents and localization flatness retained. |
| 2.6 central torsor | Nonsquare `a`; square `a=b²` | `det(c·diag(a,1))=c²a`; no value 1 for nonsquare `a`; `c=b⁻¹` gives 1 in square case | Rational marking is discriminating. |
| 2.7/8.1 cyclic versus horizontal sign | Rank 3, `λ=1` | `1+x+x²/8` gives coefficient 0 in `(δ³−x)f`, coefficient 2 in `(δ³+x)f`; horizontal solution starts `1−x+x²/8` | Repaired and consistent with scalar supplier §2.6. |
| 2.8 exceptional inclusion and rigidity | `B₃`, `D₄`, `SL₂` | Fixed `B₃` dimension 21 versus `G₂` dimension 14; triality fixed dimension 14 versus 28; adjoint Euler result `1−1−0=0`, duplicated zero term gives −1 | Correct separation and independent characteristic-zero route. |
| 2.9 symmetry | `SL₂`, affine coefficients `(b₁,b₀)`, rotations `a,b` | Product becomes `ab₁b₀`; two rotations give `ab·b₁b₀`; scaling both coordinates instead gives `a²b₁b₀` | Repaired action has source/target and composition. |
| 3.1–3.2, inherited unchanged tests | Unit and standard minuscule representation | Unit comparison `1:A†→A†`; fibre ranks `2→2` | Retained; rank equality is not a proof of comparison. |
| 3.3 quasi-minuscule chart | `Spec K[u,v,w]/(uv−w²)` | Cone dimension 2; removing its vertex leaves the same global ring but loses that point, so cannot be affine; adjoint target rank 3 | Correct negative control for the discarded affine proof. |
| 3.4–3.5 convergence order | `E₈` | Nontrivial minuscule generators: 0; adjoint rank: 248 | Explicit Frobenius-free convergence input now reaches this case. |
| 4.1–4.3 unit and zero fibre | Torus; `SL₂`; `PGL₂` | Torus `N=E=0`, Frob 1; `N²=0`, rank `N=1`; for `C₀=diag(c⁻¹,c)`, both `(NC₀)₁₂` and `(qC₀N)₁₂` equal `c` | Correct unit, nilpotent residue and half cocharacter. `ρ` is integral for `PGL₂`, not `SL₂`. |
| 4.4–4.5, inherited column convention | Scalar `A=−1/2,q=3`; transpose/inverse | `C=x⁻¹` satisfies `δC=−C=(1−q)C/2`; `Ad_C₀N=q⁻¹N`, inverse gives `qN` | No inverse/transpose substitution found. |
| 5.1–5.3 dominance/cuspidality | `GL₂`; torus; `PGL₂` components | Polygon heights `0>−1/2` with endpoints 0; finite-order torus slope 0 versus norm slope 1; two component eigenvectors have eigenvalues `±1` | Correct direction; repaired central hypothesis and normalization. |
| 6.1 generated monodromy groups | Trivial torus object; standard `SL₂` | Trivial generated group dimension 0; `2⊗2=3⊕1` gives invariant dimension 1, versus 4 for a trivial rank-two object | Generated category excludes the wrong trivial model; immersion directions agree with source. |
| 6.3 principal strings | `sl₃`, `G₂` | Correct dimensions `3+5=8`, printed misindex `1+3=4`; `14/6=7/3<3` | Corrected exponents and integral irregularity bound. |
| 6.4/11.4 monodromy | `SL₃`, `SL₇` at 2 | Standard dimensions 3,7; monodromy dimensions 3,14; ambient adjoint dimensions 8,48 | Characteristic-two branch retained; standard comparison does not identify adjoints. |
| 6.5 simple wild, central lift | Explicit `SL₂/F₅((t))` example in R01 | Invariants 0, Swan `2·2/4=1`; lower `D₂` order 5 versus asserted 1; adjoint quotient lower `D₂` order 1 | R01. |
| 6.6/11.5 rigidity/local invariants | Rank one; `A₄⊂SO₃` | Boundary Euler `−1+1+0=0`; character average `(3−3+0)/12=0`; `2` divides every almost-simple Weyl order | Adjoint conclusion survives R01; prime-to-Weyl clause never applied at 2. |
| 7.1 normalization of central torsor | `SL₂`, multiply Frobenius by −1 | Spectrum `{c⁻¹,c}` becomes `{−c⁻¹,−c}` | Frobenius at zero excludes this twist. |
| 7.3 exact radius | `4^j/(j!)²`, `j=1,2,4,8,16,32`; scales 2 and 1/2 | Valuations `2,2,2,2,2,2`; asymptotic quotient tends to 0, radius 1; scaled radii 4 and 1/4 | Correct zero-centred scaling. Constant quotient would instead have infinite radius. |
| 7.3 puncture negative control | Adjoint `SL₂` at infinity | Pole and constant terms force `u₀=v₀=w₀=0`; recurrence `a(2k−1)u_k=0` forces all coefficients 0 | Infinity has solution dimension 0, not a nonzero radius-one solution. |
| 7.4–7.6 functoriality | `G₂` representation, `SL₂→PGL₂` | `dim Λ²(7)−7=21−7=14`; central kernel order 2; unit scale gives radius 1 | Correct representation and central-isogeny distinctions. |
| 8.2 matrix form equations | Odd dimensions 3,5; even dimensions 6,8 | All four `NᵗJ+JN` and `EᵗJ+JE` are zero matrices; even invariant-vector residuals 0; added middle entry gives absolute residual sum 2 and vector residual 1 | Exact integer matrix checks pass. |
| 8.2 odd cyclic coefficients | `n=1,λ=1` | Recurrence gives `a₁=2`, `a₂=3/2`; halving `E` gives `a₁=1` | Factor 2 is necessary. |
| 8.4 potential | `n=3`, common coordinate rescaling | Empty internal sum; each fraction has net degree 0; shift `2(n−1)=4` contributes sign +1 | Denominators invertible on the specified chart. |
| 8.5 chart count | `n=3`, `F₂,F₃,F₄` | Direct sums respectively `3`; `13,4`; `37,5,5`; equal `U₂+q²−q` at each parameter | Correct; ordering of `F₄` parameters is immaterial to the stated list. |
| 8.5 discriminating boundary | `n=4`, `F₂,F₃` | Direct sums `7`; `13,40`; corrected formula same; printed formula gives `5`; `7,34` | Corrected constant confirmed beyond first nondiscriminating rank. |
| 8.6 normalized trace | `SO₈/F₂`, and `SO₄/F₃,a=1` | `7/8−(−1/8)=1`; `T_SO₄=T₂²=(1/√3)²=1/3` | Invariant line and low-rank product agree. |
| 9.1 general parameters | `q=7`, upper `(0,1/2)`, lower `(1/3)`; balanced `(0;1/2)` | Differences `−1/3,1/6`, rank 2; balanced rank 1 with puncture 1; integral difference 0 excluded | General construction now includes both examples. Empty lengths give delta unit, not a smooth rank-zero substitute. |
| 9.2 zero spectrum | `n=3,m=1`; `n=2,m=0` | `α,αq,αq²` normalize to `q⁻¹,1,q`; scalar spectrum `c_q⁻¹,c_q` | Correct lengths, no zero eigenvalue. |
| 9.3 odd comparison | `q=3,n=1,a=1` | `U₁−3=−2`; `g=−i√3=−1−2ζ`; product `2+4ζ=H₃(4)` | Correct parameter 4 and Gauss sign. |
| 9.4 object convolution | `q=3,n=2,a=1` | Unshifted twisted trace `−4/9`; Bessel trace `4/9`; adding `[1]` gives `4/9` | R02; numerical convolution itself remains correct. |
| 10.1 block definition | `p=2,m=1,s=1`, and `p=0,s=1` | Nonzero support is indices `{2,3}`; at `p=0,s=1` interval is empty and block is 0 | Definition fixes endpoints; headline uses only `p=2`. |
| 10.2 signed headline | Bessel ranks 3,5, `m=s=1,N=4` | Coefficients `640/27`, `23296/243`; factors `−16`, `−64`; quotients `−40/27`, `−364/243` have valuations 3,2 | Exact divisibility holds. |
| 10.2 broader coefficient grid | Ranks 3,5; `s=0..3,m=0..2,N=0..64` | Minimum nonzero-coefficient valuation margins are 3 and 2 respectively, against required margin ≥0 | All computed coefficients pass. Zero coefficients give zero quotient. |
| 10.3–10.5, inherited multiplier/dual tests | Geometric series, `p=2,q=4`; two Bessel series | `f₄=(1+x)(1+x²)=1+x+x²+x³`; `F/G=1−16x+112x²+…`; quotient multiplier `q^n/f` has slope `n` versus unit-root slope 0 | No Frobenius/dual reversal in repaired route. |
| 10.6 / first sum headline | `n=1,2,a=1` over `F₂,F₄,F₈` | `U₁−q=R₃`: `−1,5,17`; `U₂−q=R₅`: `−1,21,−151` | Exact equality for every nonzero parameter tested. |
| Second sum headline | `n=1,2` over `F₃,F₉,F₅,F₇` | At `F₃,a=1`: left/right `2+4ζ` and `−4−8ζ` respectively; all other tested differences exactly zero | Odd characteristic, nontrivial character and unit parameter retained. |
| Third sum headline | `N=2`, all seven fields | At `F₃,a=1`, `U₂−3=4`, convolution `2+2=4`; at `F₄,a=1`, both 21 | All raw convolution differences exactly zero. |
| `kloostermanSum` | `F₂`, ranks 0,1,2; `F₃`, rank-zero other parameter | Values at parameter 1: `1,−1,1`; rank zero at `a=2` gives 0 | Rank-zero delta distinguished from eliminated expression. |
| `orthogonalSum` | `F₂`, `n=0,1,2`; `F₃,n=1,a=1` | Values 1,1,1; over `F₃` value 1 and `U₁−3=−2` | Total `n=0` expression has two distinguished variables; headline excludes it. |
| `quadraticCharIn` | `F₃→C` at 0,1,2; characteristic-two coefficients | Values `0,1,−1`; last two become `1,1` in characteristic two | Native character transport correctly models coefficient collapse. |
| `quadraticHypergeometricSum` | `F₃,N=3,b=1`; `b=0`; `N=0,b=1` | Values `2+4ζ`, 0, `ψ(−1)ρ(1)=ζ²` | Total zero-parameter behavior is correct; headline parameter `4a` is nonzero. |
| `traceChar` | `F₄=F₂[ω]` at `0,1,ω`; trivial base character | Traces `0,0,1`, values `1,1,−1`; trivial base gives `1,1,1` | Trace lift is distinguished from an arbitrary additive character. |
| 11.2 degree/slopes | `n=1,p=3,d=1,2` | Volumes `1/2,1`; degrees `6·1/2=3,6·1=6`; slope lists `0,1,2` and `0,1/2,1,3/2,2,5/2`; quotient half-integers | Arithmetic correct, general theorem ownership missing: R03. |
| 11.2 faces | Same case, `d=2` | Facet determinant 2; primitive-vertex index 1, not 2 | R04. |
| Ordinarity headline, 11.3 | `F₂,n=1,a=1`, extensions of degrees 1,2,3 | Actual power sums `−1,5,17`; polynomial `T³+T²−2T−8` has coefficient valuations `0,0,1,3`, Newton root slopes `0,1,2` | Norms `1,1/2,1/4` agree with the signature; repeated slope list `0,1,1` does not. |

**Pinned-library audit.** The pins were read from lake-manifest.json: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are relative to those libraries. The actual definitions/hypotheses were opened, not inferred from search hits.

- `Mathlib/Algebra/Group/AddChar.lean`:242, 354, 463 supplies `compAddMonoidHom`, finite-domain orthogonality and `mulShift`; `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240 supplies `sum_eq_zero_of_ne_one` with a domain target. The identity character is constant 1; native additive notation for it in `sum_eq_ite` does not change that value.
- `Mathlib/Algebra/Algebra/ZMod.lean`:47 gives `ZMod.algebra` under `CharP`; it is deliberately not an instance. `Mathlib/FieldTheory/Finite/Trace.lean`:37, 49 gives prime-field trace nondegeneracy and the Frobenius-power formula for finite fields.
- `Mathlib/NumberTheory/GaussSum.lean`:72, 200 defines the Gauss sum and proves its inverse-character product for nontrivial multiplicative character and primitive additive character. This is not the orthogonal/hypergeometric identity. `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`:120 and `Mathlib/NumberTheory/MulChar/Basic.lean`:455 supply the native quadratic character and coefficient-ring transport.
- `Mathlib/RingTheory/PowerSeries/Basic.lean`:77, 112 supplies coefficients and the real coefficient constructor; `Mathlib/RingTheory/PowerSeries/Expand.lean`:33 substitutes `X^p`, requiring `p≠0`. Polynomial-valued initial truncation is not the interval block used here and gives no signed Dwork congruence.
- `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56 defines a local PID domain which is not a field; the maximal ideal is nonzero. `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57 includes Hausdorffness and precompleteness. `Mathlib/RingTheory/Localization/FractionRing.lean`:52 uses localization at non-zero-divisors. The signed theorem explicitly carries these assumptions.
- `Mathlib/NumberTheory/Padics/Complex.lean`:137 is the completed algebraic closure; `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61 is natural-number module rank. The finite-field extension assumptions exclude infinite-rank junk. `Mathlib/LinearAlgebra/Matrix/Trace.lean`:43 and `Mathlib/Algebra/Lie/Basic.lean`:73 supply matrix trace and the actual scalar-compatible Lie-algebra structure.
- `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:95 supplies `TauCeti.FGComoduleCat`, finitely generated right comodules. `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138 supplies `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, with its universe lift. Neither supplies coefficient objects on a curve.

Object searches, including the supplied near matches, found no pinned proof of any of the five headlines and no duplicate fully qualified declaration in the readable roadmaps. Mathlib's Witt-vector isocrystal is an object over a coefficient field, not an overconvergent isocrystal on a curve. No blanket claim that Mathlib lacks every notion named “isocrystal” is being used.

**Ownership, suppliers and current citations.** The board package index was read before treating any supplier as absent. Object searches used the roadmap service over main and the supplied open heads, and the board package files. The five closest open scopes were inspected: #1002 PadicDifferentialEquationsAndRigidCohomology, #1712 CharacterSumsOverFiniteFields, #1235 GeometricSatakeAndFusion, #1490 GlobalShtukasAndFunctionFieldLanglands and #1845 GlobalShtukasAndFunctionFieldLanglandsPartII. The arithmetic Satake and group-valued Bessel constructions are owned here; the generic étale/diamond Satake framework, scalar constructions, character lifting relation and global bundle geometry retain their separate earlier owners. The later global-shtuka roadmap consumes the Bessel construction; it does not supply it back.

Every cross-roadmap citation was resolved afresh against main for existing roadmaps, or the available head/package for new ones. The following records the concrete resolutions; the RD.6.4/6.25 applicability failure is R03, despite those headings existing.

| Supplier | Resolved sections and evidence |
| --- | --- |
| CongruenceSpectralGap, #1504 | `TauCetiRoadmap/CongruenceSpectralGap/README.md`:647, 677, §§4.2a–4.2b: raw product-fibre sum, positive-rank elimination, Artin–Schreier trace and scalar sheaf. |
| CharacterSumsOverFiniteFields, #1712 | `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`:1123, §3.3: Hasse–Davenport with characters not both trivial. The cyclotomic coefficient-field transport does not discard this hypothesis. |
| KloostermanMomentsAndPotentialAutomorphy | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`:471, 534, 625, 725, 747: §§1.1, 1.3, 2.1, 2.5, 2.6. The supplied citation resolver's missing-§2.6 lead is false: this section is present in the board package. |
| GlobalShtukasAndFunctionFieldLanglands, #1490 | `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md`:174, 494, 537, 564, 614, 648, 662, 713, 727, 804: §§0.1, 0.14, 1.1–1.2, 1.4–1.6, 1.8–1.9, 1.12. The mixed-characteristic extension is a declared gap, not falsely claimed from finite-field geometry. |
| ReductiveGroupsPartII | Main RG2.3.3, RG2.3.6 and RG2.4.1: parahoric models, root/torus filtration and Iwahori–Weyl components; they are not claimed to prove the HNY-specific quotient by themselves. |
| ReductiveGroups; OrthogonalSpinGroups | Main ReductiveGroups Layers 1, 7, 9, 10 and OrthogonalSpinGroups Layers 0–1: representations, structure, integral pinning, highest weights and orthogonal/spin carriers. Principal-subgroup classification remains explicitly contracted. |
| FormalConnectionsOpers; AffineLieAlgebras | F2, F4, F6 and A7–A8: torsor connections, intrinsic opers/slice, punctured-disc reduction, complex critical centres. The additional rational forms are a separate gap, not an unsupported coefficient extension. |
| SpringerResolutionAndCharacteristicCycles, #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md`:832, 929, 964, 1016, 1051, 1075: §§8.1–8.6 and 9.1, 9.4, 9.6–9.7. The intermediate-extension citation now points to the actual §9.6. |
| BunGAndNewtonStrata | §§1.5 and 1.22: rational dominance with the central projection fixed and detection through representations. Same polygon direction as §5.1. |
| MotivesAndAlgebraicCycles | §§6.1–6.3, 6.5: fibre functors, reconstruction, generation and tensor-isomorphism torsors; existence of a torsor is not confused with a rational point. |
| DeligneWeightsAndPurity; EtaleCohomologyFoundations | DWP §§8.5, 8.12, 8.14, 8.19 and the constructible/six-operation sections of EtaleCohomologyFoundations. These support the étale theory, not the contracted arithmetic operations. |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | RD.0.37, 0.44; RD.1.11–1.19, 1.35, 1.44–1.46; RD.2.13–2.16, 2.33, 2.51; RD.3.8, 3.25, 3.33–3.37, 3.43–3.47, 3.51; RD.4.58–4.59; RD.5.8–5.9, 5.76, 5.89, 5.101–5.103, 5.112; RD.6.3–6.4, 6.23, 6.25, 6.28, 6.41–6.48, 6.51–6.52, 6.55, 6.64–6.65, 6.82, 6.94–6.95, 6.97 all have the cited headings. In particular RD.5.102(a)/5.112(ii) distinguishes underlying dense restriction from F-only extension; RD.6.95 has the opposite exponential-sign convention, explicitly converted here. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`:1461, 1483: MS.4.6–4.7, specified maximal-slope quotient map and its irreducible-curve lift. These are not a theorem for arbitrary unrelated maximal-slope objects. |

The overlap report lists no conflicting head, dropped supplier ID, or ID defined only by an unnamed open revision. The actual #1845 consumer, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`:609 and 637, uses the former `KB.*` labels; the new numbering map resolves them. No upward supplier edge was added. The other open-roadmap ownership search found no second owner of the group-valued construction or signed Dwork theorem. The complex Newton theory found in the board is explicitly distinguished from the missing finite-field theory in R03.

All nine declared gaps have matching slugs in the README and the plan, with named earlier suppliers: relative-level-geometry; cuspidal-newton-bound; arithmetic-d-module-operations; formal-slope-comparison; companion-monodromy; principal-sl2-subgroups; scalar-kloosterman-ordinarity; dense-convergence-detection; critical-center-rational-forms. Their stated hypotheses, mathematical purpose and boundaries with existing contracts were inspected. None has supplier `none`; none is treated as a defect merely because its supplier has not implemented it. R03 asks for additional ownership, not repetition of one of those contracts.

The exact prescribed dependency check completed with:

```
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every needs line was also read for internal direction: apparent forward numeric references to another supplier's section were resolved in that supplier; the old internal cycle and late symmetry prerequisite are gone. This mechanical success does not prove the missing toric prerequisite is owned.

## Not verifiable

- AS89, Wan93, Wan04, Bal82, DH35, ESDE and KatzCC are seven settled uncertified manifest entries. Their original texts are unavailable here; they were not requested again. In particular, the original polyhedral degree/ordinarity theorems and Katz's full zero-inertia calculation are not independently source-certified. Their use was checked through the readable XZ discussion and the explicit computations above, with the ownership defect separately reported.
- The cached BD text is available, but its entire foundational proofs were not re-proved in this review. The localization claims were checked against Zhu's stated Theorem 8/Corollary 9 and the rational-centre gap. This is not a missing-text request.
- The new rational descent and replacement quasi-minuscule proof are planned theorems, not completed formal proofs. Their earlier false implications have been removed and their prerequisites made explicit. Passing finite examples or elaborating `sorry` does not certify their future proofs.

No missing-reference request is pending from this review. The package remains repairable and therefore is not rejected.

## Source issues

- **Misprint** in HNY at Remark 2.5, printed p. 257: the source writes the affine factor as `I(1)/I(0)`; it should write `I(1)/I(2)`; affects nothing.
- **Misprint** in HNY at Definition 2.6, printed p. 257: the source places the tame-character sheaf on the `(0,2)` stack; it should use the `(1,2)` stack and its dimension shift; affects nothing.
- **Error** in XZ at Theorem 1.2.4(i), p. 5: the source uses `Q_p(μ_p)` for normalized group-valued Frobenius without adjoining the required half twist; it should allow the chosen square root of `p` in the coefficient field; affects a stated result.
- **Error** in XZ at (1.2.9.1), p. 6: the characteristic-two raw identity has an extra factor `−1/√q`; it should have factor one, giving `−1=−1` over `F₂`; affects a stated result.
- **Error** in XZ at (1.2.9.2), p. 7: the raw convolution is equated to `−(U_n−q^{n−1})/√q`; it should equal `U_n−q`; affects a stated result.
- **Error** in XZ at §4.1.1, pp. 37–38: the source identifies the second level with a commutator-plus-centre kernel without an isogeny restriction; it should use the affine-root depth kernel in the bad-isogeny cases; affects a stated result.
- **Gap** in XZ at Lemma 4.2.6(i), pp. 44–45: the source uses affineness of the punctured quasi-minuscule family; it should justify the middle-image argument without that false affineness step; affects the proof.
- **Gap** in XZ at §4.3.6, p. 49: the source trivializes a finite central local system after extension to the affine line; it should distinguish geometric triviality from constant coefficient-field torsors and establish rational descent; affects the proof.
- **Misprint** in XZ at Lemma 4.5.5, p. 53: the source indexes principal strings by exponent minus one; it should use `Sym^{2e_i}` for exponents `e_i`; affects the proof.
- **Misprint** in FG at Corollary 10, p. 28: the source gives ambient type `D_{2n+1}` for the `B_n` row; it should give `D_{n+1}`, with `D₄` handled separately; affects a stated result.
- **Misprint** in FG at Proposition 11, (14.1), p. 29: the source subtracts the zero-place invariant dimension twice; it should subtract the invariant dimensions at zero and infinity once each; affects a stated result.
- **Misprint** in XZ at §5.2.3, p. 57: the source ends the rank-n zero spectrum at `q^{2n}α`; it should end at `q^{n−1}α`; affects nothing.
- **Error** in XZ at Proposition 5.3.5(ii), pp. 59–60: the source gives boundary constant `(q−1)q^{n−2}`; it should give `q^{n−1}−q`, producing 7 rather than 5 at `n=4,q=2`; affects a stated result.
- **Misprint** in XZ at Proposition 5.3.8(i), p. 61: the source places zero in the normalized Frobenius spectrum; it should place one there; affects nothing.
- **Error** in XZ at §5.3.9 and Corollary 5.3.11(i), p. 61: the source identifies normalized Bessel objects with unshifted, untwisted convolution; it should include `[1](1/2)`, giving trace factor `−q^{−1/2}`; affects a stated result.
- **Misprint** in XZ at Lemma 5.4.3, (5.4.3.1), p. 63: the source calls the raw character sum the hypergeometric Frobenius trace; it should call it the negative trace under §5.2.2(iii); affects the proof.
- **Gap** in XZ at Proposition A.9, p. 66: the source identifies the maximal quotient using the solution line without the dual connection and normalized Frobenius; it should use `d+η dx` with multiplier `q^n/f` for the normalized Bessel object; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "967bf39a51874055fde394ed0ee2cd0234d3a1c8", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals~3", "model": "gpt-6-astra", "worker": "chris-32"} -->
