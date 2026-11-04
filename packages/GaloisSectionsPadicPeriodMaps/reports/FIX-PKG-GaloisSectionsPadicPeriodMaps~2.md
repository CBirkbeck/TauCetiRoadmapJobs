# Repair report: GaloisSectionsPadicPeriodMaps

## F01 (P2) — applied differently

Supplier gap → owned full-faithful symmetric monoidal D_pH target in §2.1, assembled from PadicHodgeTheory §§3.5, 5.1, 5.3; both gap entries deleted. Shapiro is in ArithmeticGaloisRepresentations §1.3, rather than §1.12. Added Hom-space Checks and the missing-carrier inventory item. All D_pH/horizontal-contract references now retain only the horizontal contract. Evidence: bs line 464.

## F02 (P2) — applied

Overbroad polyannulus gap → imports from AdicEtaleGeometry §§A1.1, A1.3, InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 and PadicHodgeTheory §7.2. Section 4.1 now proves structural-map and point-fibre compatibility using fibre functors and inverse limits, including torsion reduction; both gap entries deleted. Checks compute dimension-zero, Tate-lattice and quadratic-cover fibres. Evidence: bs lines 1525, 1558, 1588.

## F03 (P2) — applied

Unrestricted symplectic finiteness and bundled definition → finiteness only for GSp-irreducible representations, with the same fixed rank, weight, ramification and root-degree bounds. Definition stays in §6.8. README and plan contracts agree; §§7.1–7.2 explicitly consume the gap. Added the unipotent-family negative control. Evidence: bs lines 370, 374, 378; stable line ℚₚe₁ excludes every member.

## F04 (P3) — applied

Bare source numbers → README section numbers with explicit Betts–Stix attribution in Suggested.lean; §9.3 added to its missing-carrier inventory. Section 9.1 now cites §§1.8, 6.4. The same ambiguity was repaired in §1.1's period-map reference and §6.2's interpolation references. No Lean declaration was added: these headlines lack their actual carriers at the pins.

## F05 (P3) — applied

P8, E3, SPM.7/SPM.8 and the provenance parenthetical → named supplier sections, properness of Y and Layers 7–8. The additional bare LV.2 reference in §1.2 now names MordellLawrenceVenkatesh §§2.1–2.4 and its polarised-fibre contract. The LV.3 period-variety and density references now resolve to §§3.8 and 3.18. The parenthetical disappears with the duplicate Check.

## F06 (P3) — applied differently

Removed all identified duplicate/restating Checks, plus repeats in §§1.4, 5.2 and the functor restatement in §6.6. Section 6.6 now has three discriminating pairing Checks; §7.6 has three Checks and a separate Needs paragraph. The proposed r=3,d=1 interpretation was corrected: 3=3 limits the type-(a) dimension argument, whereas distinct lines already exclude a common type-(b) isotropic line.

## F07 (P3) — applied

Universal reflexivity claim → definition of self-conjugacy in §3.1. Ambiguous inert-prime wording → a prime of E_K⁺ inert in E_K in §9.2. Recomputed ℚ(i): (3) fixed, (2+i) exchanged with (2−i), (1+i) fixed but ramified. Thus the changed definition agrees with the negative control and does not assert reflexivity.

## F08 (P3) — applied

Mislabelled §4.3 → Frobenius-centralizer orbits in §2.3 and Layer 2 dependencies; crystalline transport in §4.4 → §§2.11, 4.1–4.2. Added §§2.11, 4.1–4.3, with their good-model range, to the supplier contract. Fixed the doubled supplier name in §1.1. Verified each heading and its hypotheses at the new roadmap's head.

## F09 (P3) — applied

Smooth projective X in §0.5(a) → geometrically connected separated finite-type X; the proper genus-at-least-one curve hypothesis remains in (b). The proof uses finite CW comparison and Riemann existence for this full range. Added the non-proper G_m Check and updated the Lean inventory description. Evidence: hs lines 11, 391, 408, 416, with U trivial and S empty.

## F10 (P3) — applied

Owned modified adelic carrier → imported carrier and projection from HeightsRationalPointsAndObstructions §3.17d. Updated scope, supplier contract, §0.4 construction route and Layer 0 dependencies; removed the three imported-carrier API bullets. The finite-cover locus and its section comparison stay here. The P¹, point and two-real-component elliptic Checks have the same values.

## Verification outcomes

- Suggested.lean elaboration: `lake env lean` on `packages/GaloisSectionsPadicPeriodMaps/Suggested.lean`, from the content checkout, exited 0 with no output. No Tau Ceti import or targeted build was needed.
- Mechanical declaration inventory: zero definitions, instances or theorems; therefore zero `#check @name` entries and no binders to lose. A scratch file with the resulting empty signature inventory and `import Mathlib` elaborated once, exit 0, no output. No signature changed. The file still has exactly one import, no `set_option`, no admitted data and no padding.
- The missing-carrier claims were rechecked at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the pins of the content manifest. Mathlib's abstract Galois categories do not give a scheme étale-fundamental-group instance; searches of its algebraic-geometry files and both libraries found no de Rham-representation, D_pst, D_pH or filtered-monodromy carrier. Mathlib `RingTheory/Perfectoid/BDeRham.lean` lines 75 and 88 supplies period rings, not those carriers. Consequently no headline is replaced by a stand-in.
- Dependency command: the specified `gate --depcheck`, with package name, ORDER.txt and `--movable`, exited 0 and printed exactly:

```text
depcheck: 49 roadmaps, 570 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order edit is needed.

- Citation resolver: compared against main `4aeb1cc` and the indexed heads of 353 open roadmap pull requests; no cross-roadmap citation or roadmap Lean name was found nowhere. Its notice that external library names were not checked was handled by opening the pinned files directly, as recorded below.
- Plan restriction: JSON comparison after removing the top-level gaps values gives equality with the original plan. The seven remaining gaps match their README contracts verbatim. The only deletions are dpH-full-faithfulness and polyannulus-integral-local-systems; only the symplectic-faltings-finiteness needs sentence changes among retained entries.
- Style/pattern searches: no SPM., E3, (P8), provenance parenthetical, doubled supplier name, crystalline-specialisation label, deleted gap or D_pH/horizontal-contract phrase remains in README or Suggested.lean. `git diff --check` passes.
- No gate failures were supplied separately. The repairs above address the ten review findings; no tooling, library checkout, other package or merge-order file was edited. Sources and metadata needed no changes.

## Ownership, locators and pinned interfaces

Read the main-branch shapes of AdicEtaleGeometry, AdicSpacesPartIII and LocalGaloisGroups before editing. Ownership searches used `roadmaps grep` by mathematical object over main and indexed open heads, followed by `roadmaps show` for the actual suppliers and `rg` over local board packages. The named open-work set was included in those indexed searches. No additional open pull request was sought outside the provided index. The package owns the colimit-category assembly and the polyannulus compatibility of its transport construction; existing generic categories and finite-level comparisons are imported.

All 22 suppliers were resolved to main or to a new roadmap's indexed head, never to a revision of existing work. Rechecked contracts:

| Supplier | Consumed locator verified |
| --- | --- |
| AnabelianGeometryAndNonabelianChabauty | §7.1: section classes, point map, Kummer and field-general injectivity criterion |
| InverseGaloisAndArithmeticFundamentalGroups | §§IG.0, IG.0.3, IG.1.3: finite covers, integral systems and characteristic-zero base change |
| ArithmeticGaloisRepresentations | §§1.3, 1.12, 2.1: induction/Shapiro, semisimplicity/restriction, decomposition maps |
| HeightsRationalPointsAndObstructions | §§2.3–2.4, 2.11a, 3.1–3.5, 3.17d: ordinary and modified adeles, topology, torsor descent |
| PadicHodgeTheory | §§3.3–3.5, 5.1, 5.3, 7.2–7.3, 7.5, 8.1–8.2; finite descent data, algebraic-unramified periods and integral/pro-étale comparison |
| CohomologyComparisons | §§6.4–6.7: naturality, cup, trace-normalized Tate line, duality and Chern classes |
| MordellLawrenceVenkatesh | §§0.4–0.5, 0.9–0.12, 0.18, 1.2, 1.4–1.16, 2.1–2.4, 2.9, 2.11, 3.1–3.19, 4.1–4.3, 7.1, 7.4, 8.13–8.14, LV.10–LV.11; five supplier extensions remain declared, rather than attributed to unstated targets |
| AbelianSchemesAndArithmeticModuli | §§A3.5, A3.7, A4.3–A4.4, A6.30–A6.31 |
| AlgebraicModuliForArithmeticGeometry | §1.3: coherent quotients and partial flags |
| AdicEtaleGeometry | §§A1.1, A1.3(c): strong sheafiness and finite étale equivalence |
| AdicSpacesPartII | Layer R1: rigid/adic comparison and analytification |
| ComplexComparisonPartII | §§C5.2, C6.0, C6.2: Gauss–Manin, finite stratified topology, Riemann existence |
| EtaleDualityAndPerverseSheaves | §0.3, paragraph on smooth-curve Poincaré duality, and §0.5 |
| ArithmeticGaloisDuality | §R02.3.1: Hermite bounded-degree, bounded-ramification finiteness |
| WeightsInEtaleCohomology | R34.1–R34.2: geometric Frobenius, subquotients, abelian good reduction |
| ClassFieldTheory | Layers 7, 11: reciprocity, norms and character dictionary |
| GlobalNumberFields | Layers 2, 7, 8: ray classes and norms |
| LocalFieldsRamification | Layers 0, 2, 4: finite extensions, unramified Frobenius and tame relation |
| LocalGaloisGroups | Layer 7: full absolute-group generator rank |
| ReductiveGroups | Layers 0, 3: group functors, subgroups and quotients |
| Chebotarev | Layers 10, 13–14: density and counting specializations |
| AnalyticNumberTheoryPartI | §0.32: Siegel–Walfisz; the stronger least-prime result remains a gap |

The retained gaps are not claims that these suppliers already state their extensions. Their mathematical boundary examples are tested below. No declaration name cited by another roadmap was renamed or deleted, since Suggested.lean has no declarations. D_pH full faithfulness is now consumed internally from §2.1; the corrected bounded-root-degree finiteness extension remains required from MordellLawrenceVenkatesh.

All cited works are the four legally cached, certified manifest entries. No new work or alternative version was needed; no missing-reference request is outstanding. Changed statements use bs Theorem 2.9 (bs line 464), Lemma 2.4 (bs line 374), Lemma 3.27 and point sections (bs lines 1525, 1558, 1588), and hs Theorem 2.1 (hs lines 391, 416). Stoll's component quotient and descent are stoll lines 127, 552, 633, 759; local section injectivity is stix08 line 1109. Published Annals numbering is not used.

| Pinned declaration | File within its pinned library and line |
| --- | --- |
| Field.absoluteGaloisGroup; Field.absoluteGaloisGroup.map | Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, 87 |
| ContinuousMonoidHom | Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57 |
| ConnectedComponents | Mathlib/Topology/Connected/Clopen.lean:510 |
| IsDedekindDomain.HeightOneSpectrum.adicCompletion | Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603 |
| LinearMap.IsAlt; LinearMap.Nondegenerate | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286, 595 |
| Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:101 |
| NumberField.IsCMField; NumberField.IsCMField.ringOfIntegersComplexConj | Mathlib/NumberTheory/NumberField/CMField.lean:69, 236 |
| IntermediateField | Mathlib/FieldTheory/IntermediateField/Basic.lean:52 |
| MulAction.orbit | Mathlib/GroupTheory/GroupAction/Defs.lean:49 |
| Nat.forall_exists_prime_gt_and_eq_mod | Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442; retains IsUnit hypothesis |
| hasSum_zeta_four | Mathlib/NumberTheory/ZetaValues.lean:457; n=0 term is zero |
| TauCeti.Symplectic.groupScheme | TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122 |

Read these definitions directly: absoluteGaloisGroup.map depends on a choice of closure embedding; ConnectedComponents is the quotient by connected-component equivalence; IsAlt tests diagonal vanishing; Nondegenerate requires both separations but no rank-one target; Matrix.symplecticGroup imposes exact form preservation. None supplies the missing arithmetic/geometric interfaces on its own.

## Adversarial mathematics record

Rows identify individual constructions or assertions, including every numbered subsection and each newly changed assertion. Values are mathematical calculations on the specified objects, not Lean proofs. The source routes supply the general theorems; the tests distinguish conventions and missing hypotheses. Equal-characteristic fields and inseparable local extensions are outside the explicitly finite-extension-of-ℚₚ Hodge domain; all p=2,3 tests below remain characteristic zero.

| Statement | Instances tried | Values on the two sides or membership tests | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Tate signs and purity | ℚₚ(1), ℚₚ⊕ℚₚ(−1) | jump −1; jumps 0,1 sum 1; geometric eigenvalues 1,q; weights 0,2 | Mixed sum is not weight 1 | None |
| Conventions: monodromy | φe=e, φf=pf, Nf=e | Nφf=pe=pφNf; inverse relation gives e versus p²e | Correct direction | None |
| Conventions: inverse transport | T(e₁)=e₁+e₂ | T⁻¹span(e₁)=span(e₁−e₂); forward value span(e₁+e₂) differs over ℚ₂ too | Correct inverse | None |
| Conventions: induction tensor structure | Index 2 | dim(Ind1⊗Ind1)=4; dim Ind(1⊗1)=2 | Lax only | None |
| Conventions: reciprocity | ℚ₃, unit 4 | χ_cyc(Art4)=1/4; inverse character value 4 | Matches supplier | None |
| Conventions: Σ and ranks | A=ℚₚ², ℚₚ[ε]/ε², ℚ_{p²}, zero algebra | #Σ=2,1,0,0; dimensions=2,2,2,0 | Splitness required for #Σ=dim | None |
| Conventions: universes and covers | Identity cover, empty finite étale map | degree 1 and one-point fibre; degree 0 and empty fibre | Empty map excluded by covering hypothesis | None |
| §0.1 restriction | Spec K; complex place; real inversion extension | 1→1; G_ℂ=1; conjugation sends 2 to 2+2(−2)=−2 | Classes agree although raw sections differ | Deduplicated |
| §0.2 local injectivity | E with full 2-torsion; E(ℝ)⁰ | 4 distinct p-adic points/classes; ℝ/ℤ divisible so distinct points can have one class | Local field hypothesis necessary | None |
| §0.3 Selmer condition | Spec K; Y(ℝ)=∅; four rational 2-torsion points | cardinalities 1,0,4 respectively | All-place condition retained | Deduplicated |
| §0.4 modified carrier | E:y²=x³−x over ℚ; Spec K | real component count 2; point carrier count 1 | Uses imported quotient | Ownership corrected |
| §0.4 finite-cover locus | P¹; trivial torsor; rational point | P¹ locus equals whole carrier; trivial-torsor survival=all; rational point survives via its fibre twist | Correct quantifier over twists | Deduplicated |
| §0.5(a) finite descent/sections | G_m and diagonal 1; Spec K | every torsor evaluation equals the global fibre class; both sides contain the diagonal 1; point case both cardinalities 1 | Nonproper case admitted | Generality restored |
| §0.5(b) projected equality | Empty local curve; rational curve point y in the allowed genus range | both images empty, size 0; with y, both contain exactly the same specified local value y_v | Both directions use local injectivity | No hypothesis weakened in (b) |
| §1.1 symplectic pair | Standard plane, zero form, zero module, rank-two line | determinant form perfect; zero form rank 0<2; 0≅Hom(0,L); line rank 2≠1 | Perfectness and line condition separate | Deduplicated |
| §1.1 coefficient fibres | Split two-factor algebra with swap; dual numbers | two fibres exchanged, induced rank 4 from rank 2; ε maps only to 0 | No nonreduced reconstruction from Σ | Deduplicated |
| §1.2 geometric fibre | Identity finite base; degree δ cover | A=ℚₚ, #Σ=1; generally #Σ=δ | Geometric points, not closed-point count | Deduplicated |
| §1.3 relative pair | Legendre family; base Spec F | algebra rank 1, module rank 2, wedge²=ℚₚ(−1); one fibre returns same ranks | Relative system need not be constant | Deduplicated |
| §1.4 section pair | Constant family; geometric conjugation γ | all pairs (ℚₚ,H¹(A₀)); γρ(s)γ⁻¹=ρ(γsγ⁻¹) | Simultaneous algebra/module/line isomorphism | Extra repeats deleted |
| §1.5 section/fibre restriction | Point section and finite double cover | restricted representation equals point fibre; fibre set has 2 points with its actual local permutation | Tensor/fibre structures agree | None |
| §1.6 interpolation of section pair | s=κ(y), elliptic fibre | algebra rank 1, module rank 2 and pairing value ω(e,f)=1 on each side | Pairing retained | None |
| §1.7 adelic locus | Constant family; empty adelic set | whole adelic set; empty set of size 0 | One global interpolant precedes all places | Deduplicated |
| §1.8 Selmer inclusion | s=κ(y) | loc_v(s)=y_v; both fibre pairs rank 2δ over ℚₚ | Recovers rational-point inclusion | References resolved |
| §2.1 filtered category | Unit, Tate line, zero | unit jump 0 and N=0; Tate φ=p⁻¹σ, jump −1; zero ranks 0=0 | Actual algebraic-unramified carrier required | Owned assembly explicit |
| §2.1 full faithfulness | Hom(1,1), Hom(1,ℚₚ(1)), Hom(0,0) | ℚₚ≅ℚₚ; 0≅0 since v(φλ)=vλ≠v(pλ) for λ≠0; 0≅0 | Rules out extra period morphisms | New Checks |
| §2.1 tensor/restriction | 1⊗ℚₚ(1); identity extension | jumps 0+(−1)=−1; restriction index 1 gives unchanged triple | Tensor and identity laws | Gap deleted |
| §2.1 induction | Quadratic extension | discrete rank 2, de Rham algebra L of dimension 2; restrict induced representation gives two units, while L need not split over base | Induction differs from Weil restriction | Duplicate restatement deleted |
| §2.2 endomorphisms | Unit over ℚ_{p²} | G_v-invariant scalars ℚ_{p²}; φ-invariant scalars ℚₚ | G_v alone is insufficient | Deduplicated |
| §2.2 similitude data | D=0; diag(2,3); scalar 2 | Aut(0)=1, Aut^GSp(0)=G_m; multipliers 6 and 4 | Multiplier retained | Restatement deleted |
| §2.2 retwist | Two-space, jumps 0,1 | F¹ a line; original line returns original module | Fixed discrete data, moving filtration | Deduplicated |
| §2.3 orbit criterion | G_m² on P¹ | eigenlines (1:0),(0:1) fixed; complement one orbit, total 3 classes | Both directions identify precisely one orbit | Locator fixed |
| §2.4 dimension bounds | Unit; standard symplectic plane; zero | 1≤1; dim GSp₂=4=1·3+1; rank zero gives 1=0+1 | Rank-zero multiplier consistent | None |
| §3.1 conjugacy | ℚ(i), primes 3,5,2; odd-degree field | c(3)=3; c(2+i)=2−i≠2+i; c(1+i)=(1+i) as ideal; no CM test gives true | Symmetric, not reflexive | Definition corrected |
| §3.2 conjugate weights | χ_cyc⁻¹; split CM characters | 1+1=2; labelled pair 1+0=1 | General coefficient extension would break self-conjugate parity | None |
| §3.3 finite-order twist | χ_cyc⁻¹ | χ₀=1, n=2; χχ_cyc=1 | Exponent −n/2 correct | None |
| §3.4 weighted sum | Elliptic H¹; degree-two induced H¹; zero | 1=1·2/2; 2=1·2·2/2; 0=0 | Zero average excluded, sum retained | None |
| §4.1 finite étale equivalence | n=0; quadratic z²=t over ℚ₃ | G_R=G_v, q=s=id; t=1 gives 2 fixed points, t=2 gives one orbit of length 2 | Correct Galois category and point pullback | Gap deleted |
| §4.1 structure and fibre maps | Base Tate lattice; torsion lattice | χ_cyc q s_y=χ_cyc; (ℤ/pᵃ)⊗ℚₚ=0 | Infinite continuous monodromy allowed; torsion periods zero | Compatibility proved here |
| §4.1 polyannulus transport | Constant pair; y=y₀ | T=id; comparison matrices both identity | Unique map tied to actual comparison | Route clarified |
| §4.2 polydisc reduction | Residue fields 𝔽₂,𝔽₄,𝔽₈ | 2 residues leave 0 choices; 4 and 8 leave at least 2 and 6; gcd(2,3)=1 | Small residue field covered | None |
| §4.3 transport identities | Constant rank-two pair and three centres | I·I=I; T_y,y=I | Cocycle and uniqueness agree | None |
| §4.4 smooth proper transport | H⁰ of identity family; rank-two shear | H⁰ rank 1 fixed; T=[[1,0],[1,1]] invertible, discrete rank 2 fixed | No constant-filtration claim | Supplier locator fixed |
| §4.5 representation control | Centre; shear | Φ(y₀)=F¹; pulled-back line (1:−1), not (1:1) | Uses full faithfulness only on actual period values | Contract references corrected |
| §5.1 Hodge cohomology pair | Elliptic curve | algebra rank 1, module rank 2, target jump 1; ω(e,f)=1 | Tate-line sign agrees with supplier | None |
| §5.2 retwisted pair | Elliptic line; Φ=span(e₁,f₁) in four-space | line self-pairing 0; ω(e₁,f₁)=1 but F² target=0 | Half rank without isotropy fails | Duplicate Checks removed |
| §5.3 period diagram | Equal periods; centre | equal Φ yields same retwist; centre returns original H^{≤1} | Local pair class recovered | None |
| §5.4 factor decomposition | Degrees 1,2, d=1; identity residue extension | domain dimensions 1+2=3; degree 1 factor unchanged | Separable product retained | None |
| §6.1 S-goodness | ℚₚ⊕ℚₚ(−1); H¹(E)(1); V=0 | weights 0,2 versus required 1; jumps −1,0 versus 0,1; zero V leaves only A ramification | Correct negative controls | Contract references corrected |
| §6.1 factor integrality | Eigenvalues √2,−√2 | total X²−2 integral; factors X∓√2 nonrational; squaring lowers degree 2→1 | Root bound survives, rationality need not | None |
| §6.1 Artin algebra | ℚ₇[ε]/ε², ε↦ζ₃ε | eigenvalues 1,ζ₃; trace 1+ζ₃ not rational | Finite image does not imply rational polynomial | None |
| §6.2 local LV locus | Constant family; rational fibre | all local points interpolated; y maps to y_v | Local versus adelic quantifiers distinguished | Duplicates removed |
| §6.3 compact finiteness criterion | Constant family; nonproper Legendre base | period image dimension 0<1, so density fails; abs(p⁻ⁿ)=pⁿ unbounded, finitely many in each bounded disc | Properness necessary for finite cover | Provenance replaced |
| §6.4 interpolants S-good | Rational y and good u outside S | smooth proper fibre has unramified H¹, weight 1, rank 2δ; Hodge jumps 0,1 | Global hypotheses obtained at all places | None |
| §6.5 rational-point inclusion | y∈Y(K) | local class exactly H^{≤1}(X_y)|G_v; same algebra rank δ and module rank 2dδ | Rational point in locus | None |
| §6.6 dimension comparison | g=3, q=11,23 | (5/2)·10=25; (5/2)·22=55 | Numerical witnesses unchanged | Duplicate removed |
| §6.6 rank-two equality | d=1,A=ℚₚ | ∧²V is one-dimensional; multiplier of f is det(f) | Forgetting a line creates no extra condition here | Kept one Check |
| §6.6 rank-four inequivalence | Two non-isomorphic absolutely irreducible planes; nonsquare c | common line scalar b requires b=a₁²=c a₂²; c=(a₁/a₂)² impossible | Same module, distinct symplectic pairs | Added common-line and irreducibility hypotheses |
| §6.6 forgetting equivariance | Same planes, map f₂↦c⁻¹f₂ | target pairing on e₂,c⁻¹f₂ is c·c⁻¹=1; first plane value 1 | Forms isomorphic without Galois condition | Added positive control |
| §6.7 coefficient points | One closed point of degree 4 | geometric set 4 points, one orbit; dim H⁰=4=#Σ | Full extension degree, not residue degree alone | None |
| §6.8 trichotomy | A=ℚₚ; A=ℚₚ[ε]/ε³; Σ=∅ | (c) 1≥1/(d+1); d=1 gives 1≥1/2, versus false 1≥3/2 if dim A substituted; empty 0≥0 | Correct cardinality version | None |
| §6.9 three types | Identity coefficient point; degree-5 point | index 1<4 rules out (a),(b), forces (c); degree-5 small-orbit proportion 0<1/(d+1) | Thresholds consistent | None |
| §7.1 local class set | δ=1, non-CM elliptic fibre | only L=K; rank 2, B=2, H¹ class qualifies | Fixed degree bound before ranging | Gap consumption explicit |
| §7.2 finiteness hypothesis | Unipotents ρ_λ over ℚ(i) | det=1, polynomial (X−1)², n=0,B=1; ω(e₁,e₁)=0 and e₁ stable | Infinite family excluded by GSp-irreducibility | Contract corrected |
| §7.3 type-(a) dimensions | (d,r)=(1,4),(1,3),(2,4) | 3<4; 3=3; 10<12 | No strict count at (1,3) | None |
| §7.4 type-(a) period locus | All fibre degrees ≤3 | number of index-≥4 components 0, locus empty | Non-density without monodromy | None |
| §7.5 type-(a) finiteness | Empty Y(K_v); constant positive-dimensional family | empty locus count 0; constant period image dimension 0<domain | Constant family fails full monodromy hypothesis | None |
| §7.6 half-meeting condition | d=1, r=3 distinct lines | dim W=1; intersection dimensions 0 or 1; ≥1/2 forces equality with each | No common W already for two distinct lines | Corrected suggested interpretation |
| §7.6 four-line witness | e,f,e+f,e+2f in characteristic 0 | any two different line intersections have dimension 0; at least one fails required ≥1/2 | Exceptional locus proper | Added Check |
| §7.6 exceptional positive witness | All r lines equal span(e) | W=span(e) gives intersection 1≥1/2 in every factor | Exceptional locus nonempty | Added Check |
| §7.7 type-(b) period locus | Rank-two factors of degrees 1 and 4 | degree 1 cannot give type (b); degree 4 leads to four-line common-W condition | Local subrepresentation condition retained | None |
| §7.8 type-(b) finiteness | Empty local curve; full-monodromy disc | empty count 0; proper exceptional subset has smaller dimension than dense image | Non-density and compact disc cover both needed | None |
| §8.1 small-orbit proportion | 3-orbit⊔4-orbit; regular S₃; S₃/C₂ | 3/7; 0/6=0; 3/3=1 | Whole-group orbit convention | Duplicate removed |
| §8.1 monotonicity | Four fixed points into one fixed plus a 4-orbit | source 4/4=1; target 1/5 | Equal positive fibres and surjectivity are necessary inputs | None |
| §8.2 local subfield count | ℚ₅; ℚ₂ | 3 quadratics+4 cubics=7; 7 quadratics+4 cubics=11 | Wild residue characteristic not excluded | None |
| §8.3 torsion bound | g=2,k=5,q_v=7 | gcd(5,6)=gcd(5,48)=gcd(5,342)=1; n_vk^g=175 versus total 625 | Pairing fixed spaces isotropic | None |
| §8.4 type-(c) exclusion | g=2,q_v=5,q=83 | k=41,d=123; 82≥63; 63/13448<1/124; forbidden primes 3,5,31 do not divide 82 | Strict exclusion | None |
| §8.4 pairing Frobenius | μ₄₁∨ at q_v=5 | 5·33=165≡1 mod 41 | Uses inverse 33, not 5 | None |
| §8.5 auxiliary prime | q_v=2,q=11 | forbidden odd primes 3,7; 10 prime to both and not divisible by 4; 10<9·11=99 over ℚ₂ | Condition (1) alone insufficient | None |
| §8.6 comparison range | g=3,q=11,n_v=2; original threshold | 2ζ(6)·8/10³≈0.01628<1/26≈0.03846; q=23 gives d=55 versus d=25 for q=11 | Larger coverage with smaller auxiliary family | None |
| §9.1 final local LV theorem | Empty Y(K_v); set-theoretic trichotomy | 0 points in each locus; generally finite a + finite b + empty c has size ≤N_a+N_b | Correct assembly | References fixed |
| §9.2 Mordell consequence | Empty local curve; ℚ(i) above 3; elliptic positive rank | global cardinality 0; conjugation fixes prime above 3; genus 1<2 | Inert extension now specified | Wording corrected |
| §9.3 self-conjugate Selmer finiteness | ℚ(i): v above 3 versus 5; empty local curve | self-conjugacy true versus false; empty localisation image size 0 | Includes CM fields at the stated places | Headline inventory completed |
| §9.4 Theorem A | K=ℚ,p=2,3; empty local curve | CM-subfield test empty, self-conjugacy true at both; empty image size 0 | No good-prime restriction | None |
| §9.5 Theorem B | Empty local curve; equality from §0.5(b) | finite-descent projection 0=Selmer image 0; equal projections have equal cardinalities | No Stoll-conjecture assumption | None |
| §9.6 obstruction comparison | p=2; nonproper-centre variant | original p>2 test false, model-free local theorem still allows p=2; inverse-transport witness remains (1:−1) | Supplier model-free contract remains needed | None |
| Gap: horizontal-pst-specialisation | Constant rank 1; torsion rank 0 | both period ranks 1; torsion rational periods 0=0 | Boundary compatible, still supplier extension | Retained |
| Gap: model-free-polarised-fibres | Elliptic plane; identity transport | ω(e,f)=1, reverse −1; transport I preserves both values | Pairing and transport normalized | Retained |
| Gap: model-free-period-maps | Constant versus Legendre; shear | image dimensions 0 versus 1; inverse line (1:−1) | Density needs monodromy, inverse convention fixed | Retained |
| Gap: symplectic-faltings-finiteness | Unipotents; integer polynomial degree 2d | stable isotropic dimension 1 excludes unipotents; eigenvalue degree ≤2d | Corrected irreducibility range, bounded-degree extension still required | F03 |
| Gap: four-isotropic-lagrangians | d=0; d=1 four distinct lines; all equal | exceptional set empty in rank 0; empty common-W set for distinct lines; nonempty for equal lines | Proper subset in each case | Retained |
| Gap: kodaira-parshin-local-fibres | g=2,k=5 | number of primitive cyclic characters 5⁴(1−5⁻⁴)=624 | Equal-fibre target nonempty | Retained |
| Gap: linnik-polynomial-least-prime | m=2,a=1; m=3,a=2; nonunit a=0 mod 3 | least primes 3,2,3 respectively; nonunit class has no prime beyond 3 | Coprimality essential for general bound | Retained |

The six source issues listed after the numbered findings do not require new scope: the README already uses #Σ in §6.8, bounded root degrees in §§7.1–7.2, Frobenius in §2.4, M^{≤1} in §7.7, the ramified-prime bound in §8.6, and the finite-base fibre in §8.4. These choices remain intact. This report records mathematical checks, not acceptance; a fresh independent review remains necessary.
