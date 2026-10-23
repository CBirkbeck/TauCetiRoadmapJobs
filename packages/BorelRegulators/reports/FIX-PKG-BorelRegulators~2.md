# BorelRegulators repair report

## F01 (P2) — applied

Rank-zero rationality described as unstatable → the native headline exists_pos_rat_dedekindZeta_of_isTotallyReal, with total reality, even n and n≥2 explicit. Updated the module docstring and README §5.1, recorded the pinned total-reality interface, and made the quadratic Check numerical. Evidence: borel1977 line 590–594, Remark 6.3, p.632, including the page image.

## F02 (P3) — applied

Degree a≥2 → a≥1 in the existence theorem, its docstring and README §3.2. Added the D=F, a=1 Check and exclusion of a=0. The page image at borel1977 line 177 reads n≥1; the extraction loses the inequality. Sections 3.4 and 3.6 retain a≥2 for the noncompact infinite norm-one group.

## F03 (P3) — applied

The unqualified opening definition/order claim in README §1.3 → an explicitly quantified n≥2 statement. At F=ℚ,n=1, ζ(0)=−1/2 has order 0, whereas d₁=1. Recomputed the section’s four Checks and searched all uses of the leading coefficient; §5.4 already has n≥2, and no Lean signature for this germ is present.

## F04 (P3) — applied

Published §1.6, pp.6–9 → pp.7–9 in References and both the locator and version note of deligne_goncharov2005 in sources.toml. Evidence: deligne_goncharov2005 line 276 identifies printed p.7 and line 282 begins §1.6; line 227 begins p.6. The existing §2.3 locator already agrees.

## MERGE-ORDER (unrated) — not actionable in this package: merge-order placement and other roadmap edits require maintainer action

The review’s unnumbered operator section requests edits to merge-order/ORDER.txt and other roadmaps. Those files are outside authorization. The package has no dependency on ArithmeticKTheoryPartII; its Tamagawa prerequisite already has gap:classical-tamagawa-proof in both permitted contract locations. Changing that contract cannot settle the competing ownership consequences of the requested order move. No order or external roadmap was edited.

## Verification and scope of the repairs

All four numbered findings were independently verified. None is disputed, and no boundary-case Lean declaration was added. The only new Lean theorem is the numerical rank-zero headline; the degree-one and zero-degree controls are README prose. Existing Lean names are preserved.

For n≥2, rank zero is exactly the totally real, even-weight case: odd n gives dₙ=r₁+r₂≥1, while even n gives dₙ=r₂, which is zero exactly for a totally real number field. Borel’s source variable m is n−1. Its empty comparison is 1, so Remark 6.3 asserts rationality of √Δ_F ζ_F(n)/π^(Nn). The factors √Δ_F, π and ζ_F(n) are positive: the discriminant is nonzero, π>0, and the convergent ideal sum at n≥2 contains the unit ideal’s positive term. Thus the rational number is positive, and multiplying by π^(Nn) gives precisely the new Lean equality.

For degree one take D=F. It is central and one-dimensional; for either L=ℝ or ℂ and every specified embedding F→L, L⊗_F F is L and hence M₁(L). A finite-dimensional division algebra cannot have dimension zero. For a≥2 the invariant construction remains 1/a and −1/a at two finite places, including places above 2 and 3. At a=1 these are both zero in ℚ/ℤ, and the division representative is F. Enlarging this existence theorem does not enlarge the later volume theorem’s hypotheses.

For the quadratic Check, let χ₅ have values (1,−1,−1,1) on residues 1,2,3,4. The values of B₂(a/5) are (1,−11,−11,1)/150, so B₂,χ₅=4/5. The even-character formula gives L(2,χ₅)=4π²/(25√5). Therefore √5 ζ_ℚ(√5)(2)/π⁴=(1/6)(4/25)=2/75, and its reciprocal is 75/2. No assertion about the individual regulator of a positive-rank field is substituted for the empty determinant.

The pattern search covered the complete README, Suggested.lean and sources.toml. The affected occurrences are §1.3’s opening, §3.2’s quantifier and Checks, §5.1’s headline and quadratic Check, the Mathlib supplier paragraph, the two relevant Lean docstrings/module description, and the three published-page-range occurrences. All other degree bounds, rank-zero examples, phase signs and leading-coefficient uses retain their mathematically required hypotheses. The design plan was not edited; only its gaps list is editable and these findings need no new gap.

## Pinned APIs, citations and ownership

The content checkout is main at 35c99162e8be040065af64b05336c29b27b40d1c. Its manifest pins Mathlib to 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti to a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The declaration bodies and hypotheses were inspected at those pins.

| Native input | Pinned locator and relevant boundary |
|---|---|
| NumberField.dedekindZeta | Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49; an ideal-count L-series, used only at n≥2 in the new headline. The one-sided residue theorem at line 77 supplies no global continuation. |
| NumberField.discr, discr_ne_zero | Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36,41; the integer discriminant is nonzero. The absolute value is taken after its real cast. |
| NumberField.IsTotallyReal, nrComplexPlaces_eq_zero_iff | Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47,52; all infinite places are real, equivalent to r₂=0 for a number field. |
| riemannZeta_two, riemannZeta_four | Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:226,232; π²/6 and π⁴/90. |
| TauCeti.Algebra.index | TauCeti/Algebra/CentralSimple/Index.lean:99,112,171,180,255; chosen division degree, presentation independence, division-algebra specialization, positivity and an index-degree splitting field. |
| TauCeti.Algebra.IsSplittingField | TauCeti/Algebra/CentralSimple/Splitting.lean:120; an actual scalar-extension matrix-algebra equivalence. The generic definition permits matrix size zero; the finite-dimensional division input excludes it. |
| TauCeti.BrauerGroup.mk, mk_matrix, instCommGroup | TauCeti/Algebra/BrauerGroup/Group.lean:139,159,174; matrix size needs NeZero, and the group instance uses the field’s universe. |
| Division representative | TauCeti/Algebra/BrauerGroup/Division.lean:69; existential central finite-dimensional division ring, not chosen data here. |
| Local Dedekind continuation | TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158; only Re(s)>1−1/N. It does not state §1.3’s global germ. |

Searches by object in both pinned libraries found no general totally real positive-even Dedekind rationality theorem, number-field period–index equality, or higher Quillen K-group/Borel-regulator construction replacing the unstatable headlines. The rational-field ideal-count coefficient theorem in TauCeti/NumberTheory/ArithmeticDirichletSeries/Trivial.lean:155 is about coefficients, not the new numerical headline. No new definition, instance, carrier or imported module is needed.

Read the main-branch SemisimpleAlgebras and ComplexTori roadmaps for shape and native-carrier boundaries. Re-ran roadmaps grep, roadmaps show and roadmaps resolve, together with searches of the board packages and the supplied sibling folders. The native headline name has no collision in the readable roadmap Lean files. Polylogarithms’ total-real even-weight theorem is a consumer explicitly attributing the rationality input to BorelRegulators; it does not transfer ownership of the primitive-period theorem. IntegralIwasawaTheory’s input is negative-integer Hecke-value rationality, not a second primitive comparison. No existing supplier construction is replanned.

The following supplier and consumer locators were opened on main or at the supplied indexed open heads. Citations to extensions remain requests with explicit gap contracts, not claims that those extensions already exist.

| Roadmap | Locations verified |
|---|---|
| GeneralAlgebraicKTheory | §§2.5,3.2,3.12,7.7–7.8: Quillen groups, plus/Q and finite-resolution transfers. |
| StableHomotopyKTheory | §§2.3–2.5,3.37,4.14: fibre comparisons/LES, finite-type rational Hurewicz and stable GL plus multiplication. |
| ArithmeticKTheory | §§3.2–3.4: finite generation, finite-S maps and rational order/rank comparisons. The finite-stage range and integral order comparison remain declared gaps. |
| ArithmeticLocallySymmetricSpaces | ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1: CE/relative forms, quotient carriers and de Rham comparison. |
| AutomorphicFormsOnReductiveGroups | §§1.1–1.3: coefficient/pair functoriality, continuous/smooth cochains and van Est with full maximal compact subgroup. |
| AdelicAlgebraicGroups | §§1.2,1.4,2.2–2.5,3.4,4.2: restricted products, restriction of scalars, quotient/gauge measures, norm-one groups, compactness and strong approximation. |
| ClassFieldTheory; SemisimpleAlgebras | ClassFieldTheory Layers 5,10: invariants and the global exact sequence. SemisimpleAlgebras Layer 6: index/splitting theory; arbitrary splitting-degree divisibility remains gap:splitting-degree-index. |
| ArithmeticGaloisDuality | R02.4.5b–R02.4.6: fixed-prescription Wang exception. The variable-local-extension consequence remains gap:cyclic-local-degrees. |
| LFunctions; IntegralIwasawaTheory | Layer 3: continued Dedekind function/functional equation; §6.0: totally real Hecke rationality. |
| CharacteristicClasses | C5a.2–C5a.5, C6 items 2–3: invariant indecomposables, transgression, filtered/Hopf comparisons and ordered Chern suspension. The generic quotient, integral calibration and arithmetic filtration extensions remain gaps. |
| TopologicalKTheory | T4 and T7 item 1: chosen complex Bott class and real complexification coefficients. |
| DifferentialGeometry; AlgebraicTopology | Layers 5,6,8: integration, forms and de Rham; Stage 5 item 5: supplied Serre filtrations and their bundle applications. |
| SchemeKTheoryOperations | §6.8: higher Adams operations with the regular Noetherian finite-dimensional ample-family hypotheses. |
| Polylogarithms; HabiroNahmSeries | §§2.3,3.7–3.8,4.4,4.7 and §1.5 respectively: explicit regulator consumers and rank-zero determinant use. |
| ColemanIntegration; HeightsRationalPointsAndObstructions | L3.Fc.1: complex regulator lattice/pairings; §3.6: number-field period–index use. These expose the external ownership issue below. |

MotivicEtaleKTheory has a board target, not an existing numbered universal-realization section; both universal-realization prerequisites already have exact named gaps here. PeriodsAndSpecialValues PS.3.2a could not be independently opened: its README is absent from the available checkout and roadmaps show did not expose a main or indexed head. Ownership against that unavailable open head was not checked. No additional head was retrieved. This limitation concerns an unchanged external ownership reference, not the source of any repaired mathematical statement.

All seven source entries retain their lifetime keys and provenance. The needed texts were available in the legal cache; the Borel page images were read to recover missing formulas and the inequality. No new source was fetched. weil1961 remains waived and beilinson1985 remains uncertified, with neither reopened or added to a missing-reference request. All twelve gap slugs, suppliers and needs sentences still agree mechanically between the README and design/plan.json.

## Adversarial mathematics pass

Values below are computations in the stated conventions. A rational-class calculation asserts the displayed rational proportionality, not an unknown integral regulator value. The Checks of every section, the worked examples and consumers of the changed bounds/normalizations were compared with these values.

| Statement | Instances tried | Values on the two sides / excluded model | Result | Change |
|---|---|---|---|---|
| Field, degree and weight conventions | ℚ, ℚ(i), ℚ(√5); n=0,1,2 | (N,r₁,r₂)=(1,1,0),(2,0,1),(2,2,0); 2≤0 and 2≤1 are false | NumberField excludes characteristic p and the zero ring; higher weights start at 2 | F03 makes the analytic bound local |
| Tate lines and divided coordinates | n=2,3 | (2πi)¹=2πi; (2πi)²=−4π²; dividing the selected generator gives 1 in each case | No untwisted rescaling | none |
| Conjugation and representative sign | imaginary pair, n=2,3; real place, n=2 | divided pairs (t,−t),(t,t); real equation t=−t gives 0; representative multipliers −1,+1 | Fixed-space parity agrees | none |
| Signed determinants and coordinate volume | basis (t), basis (−t), empty basis | signed t,−t; volumes both abs(t); empty determinant and volume 1 | Positive/signed distinction retained | none |
| Comparison phases | degrees 0,1,2,3,5 | i⁰=1; i·i²=−i=i³; i⁵=i | Graded multiplicativity, not one fixed odd phase | none |
| Gauge and chart normalization | scale by 2 over ℚ; complex place; ℚ(i),h=3 | 2·1/2=1; squared complex multiplier 4; 4^(−3/2)·2³=(1/8)·8=1 | Product formula and discriminant convention agree | none |
| Left/right quotient transport | inversion; C(gSO)=ggᵗ | inverse of inverse is g; C(I)=I and C(diag(i,−i))=−I | Quotients retain the specified transported forms | none |
| §1.1 Vₙ and dimension | ℚ, ℚ(i), real quadratic, n=2,3 | dimensions (0,1),(1,1),(0,2) respectively; each imaginary pair contributes 1 | Correct parity and pair count | none |
| §1.1 Cₙ, topology and normalized lattice | totally real n=2; t=1 at n=2,3 | zero-space fundamental point has mass 1; ambient norms 2π,4π² while coordinate norms are 1,1 | Same topology, no unscaled isometry | none |
| §1.2 restriction and trace | ℚ(i)/ℚ at n=2,3; real quadratic | T(t,−t)=0; T(Rt)=t+t=2t; T(a,b)=a+b | Full trace excludes averaging | none |
| §1.2 tower and identity laws | two degree-two extensions; identity extension | summed fibre count 2·2=4=[L:F]; identity fibre count 1 gives T(t)=R(t)=t | Composition and identity agree | none |
| §1.3 order and germ coefficient | ℚ, n=1,2,3,4 | at 0: ζ=−1/2, order 0≠d₁=1; at −1,−2,−3: orders 0,1,0=d₂,d₃,d₄ | Higher-weight bound essential | F03 |
| §1.3 functional-equation proportionality | ℚ, n=2,3,4 | (−1/12)/(1/6)=−1/2; ζ′(−2)/(ζ(3)/π²)=−1/4; (1/120)/(1/90)=3/4 | Nonzero rational factors, with both signs allowed | none |
| §2.1 suspended character and stable class | n=2,3; add an identity block | values −4π²,−8π³i; divided values 1,1; added reduced character 0 | Zero class and twice the class fail calibration; c₃ introduces factor 2 | none |
| §2.2 actual regulator and rational extension | zero/torsion class; nonzero K₅ coordinate t | r(0)=0; m·r(x)=0 implies r(x)=0 for m>0; localization gives t versus doubled inverse 2t | No unrelated rational inverse | none |
| §2.3 real isomorphism and kernel | ℚ at n=2,3; ℚ(i), both; real quadratic n=3 | source/target dimensions 0=0,1=1; 1=1; 2=2; torsion maps to 0 | Degenerate isomorphism asserts no zeta value alone | none |
| §2.3 functoriality | quadratic extension in odd/even weight | trace after restriction is 2t; imaginary even pair sums t−t=0 | Target and K-transfer normalizations agree | none |
| §3.1 period=index, including Lean | zero class; quaternion class; invariants 1/3,−1/3 | lcm/index/dimension: 1/1/1, 2/2/4, 3/3/9; single 1/3 has nonzero total invariant | Global zero-sum condition essential | none |
| §3.1 central simple representatives | split class, a=1,2; index 8 | M₁(F),M₂(F) have dimensions 1,4 but both index 1; index 8 gives division dimension 64 | Degree of a presentation is not always its index | none |
| §3.2 existence, including Lean | a=0,1,2,3 | 0: impossible dimension 0; 1: D=F, 1²=1; 2: two half-invariants, dimension 4; 3: ±1/3, dimension 9 | Exactly positive degrees; all infinite invariants 0 | F02 |
| §3.2 infinite splitting boundary | Hamilton algebra over ℚ | infinity invariant 1/2≠0; dimension 4 does not imply splitting at infinity | Correct excluded model | none |
| §3.3 specified measures | ℚ, ω→2ω; h=0; ω=0; ℚ(i),h=3 | multipliers 2 and 1/2; point total mass 1; zero form gives 0; (1/8)·8=1 | Nonzero form and rational gauge retained | none |
| §3.4 norm-one Tamagawa mass | (−1,3)/ℚ; degree-three division; norm-one torus | quaternion symbols at 2,3,∞: (−1,−1,+1), product 1; h=3,8 and τ=1; torus h=1 and geometric character rank 1 | Torus excluded; mass supplied by declared gap | none |
| §3.5 standard and exceptional local factors | q=2,a=2,3; ω=2ω_std at 2 | 6/8=3/4; 168/256=21/32=(3/4)(7/8); scaled mass 3/8, correction (3/8)/(3/4)=1/2 | All exceptional factors retained | none |
| §3.5 c_S and denominator positivity | add standard place; index-three level; q=1 | correction 1; mass ratio 1/3; at q=1, 1−q^(−2)=0 | q≥2 and finite-index laws exclude zero denominators | none |
| §3.6 exact volume | index-three level; split M₂(ℚ); F=ℚ(√5),a=2 | (3vol)·(m_f/3)=vol·m_f=1; split quotient is noncompact; unscaled/Borel ratio 5^(3/2) | Division and a≥2 remain required | none |
| §4.1 indecomposable quotient | Λ(x₃,x₅), Λ(x₃), k[u₂], k | H⁸ dimension 1 but Q⁸=0; Q³ dimension 1,Q⁶=0; Q² dimension 1,Q⁴=0; Q(k)=0 | Products killed, no chosen complement | none |
| §4.1 determinant adapter | quotient dimensions 0,1; rational basis scale 2 | ∧⁰0=k with generator 1; ∧¹k=k; induced determinant multiplier 2 | Native functorial determinant, no free scalar | none |
| §4.2 jℝ, α and β | degrees 0,3,5; point with C₂ stabilizer | jℝ(1)=1; correction −i,i; in positive degrees point cohomology is 0 but H*(C₂,𝔽₂) has dimension 1 in each degree | Torsion-free descent and characteristic-zero hypotheses matter | none |
| §4.3 compact rational periods | ℚ,n=2,3; ℚ(i),n=2 | classes π²,π³; abs(−4π²)/π²=4; quadratic discriminant scalar 4^(−3/2)=1/8, power π⁴ | Compact determinant is nonzero | none |
| §4.4 representation and cycle | (N,j,a)=(1,1,17),(1,2,37),(2,1,33) | padded blocks 13,28,29; dimensions 3,8,6; factors 2,9,4; regular determinant Nrd^(j+1)=1 | No false unital representation in odd dimension | none |
| §4.4 lower-generator ideal | Λ(x₃,x₅) | x₃²=0 and x₃∧(x₃x₅)=0; x₃x₅ itself is nonzero | Repetition, not arbitrary positive degree, kills the term | none |
| §4.5 arithmetic primitive determinants | cumulative stages j=0,1,2; ℚ,n=2 | products 1,ζ_F(2),ζ_F(2)ζ_F(3); ratios ζ_F(2),ζ_F(3); full rank 1 despite base rank 0 | Positive denominator permits induction | none |
| §4.6 compact-fibre cancellation | ℚ,n=2,3; ℚ(i); lift change | (base,full,fibre) ranks (0,1,1),(1,1,0),(1,2,1); det [[1,2],[0,1]]=1, rescaled fibre det=2 | Actual fibre identity determines empty comparison | none |
| §5.1 primitive-period determinant | ℚ,n=2; ℚ(i),n=2,3 | empty scalar 1 versus normalized zeta 1/6, reciprocal 6; quadratic raw classes 2ζ_F(2)/π⁴,2ζ_F(3)/π⁶ | Raw determinant differs from Tate-converted regulator | F01 adds native numerical clause |
| §5.1 phase exponent | n=2,3,4,5; signatures (1,0),(0,1),(2,0),(1,1) | E=(n−1)r₁ for odd n and −nr₁ for even n; ℚ values −2,2,−4,4; all 16 instances even | Source phase descends to ℚˣ | none |
| New native rank-zero headline | ℚ,n=2,4; ℚ(√5),n=2 | q=1/6,1/90,2/75; multiplying by π²,π⁴,π⁴ gives √Δ_F ζ_F(n) in each case | q>0; no continuation carrier needed | F01 |
| §5.1 numerical boundary | ℚ,n=0,1,3; ℚ(i),n=2 | n=0,1 fail 2≤n; n=3 has d=1; imaginary quadratic has d=1 | Odd weights and nonreal fields are outside rank-zero headline | none |
| §5.2 Cartan map | g=diag(i,−i), h=[[0,1],[−1,0]] | ggᵗ=(gh)(gh)ᵗ=−I; C(SO)=I | Descends on right SO-cosets; choosing g itself does not | none |
| §5.2 homotopy-to-Tate covolume | ℚ,n=2,3,5; imaginary quadratic | covolumes 1,4π,2π,2π; free quotient/Cartan indices at degrees 5,9 are (1,2),(2,1), composite 2 | Real-place factor occurs only at n≡3 mod4 | none |
| §5.3 integral image lattice | zero space; tℤ and 2tℤ, t≠0 | image/covolume {0}/1; tℤ/abs(t); 2tℤ/2abs(t); index 2 | Integral image, not its rational span | none |
| §5.3 discreteness and spanning boundary | ℤ+√2ℤ, tℚ⊂ℝ | integer approximants give nonzero values tending to 0; t/m→0; source rank 2 versus target rank 1 in first case | Finite generation alone does not imply discreteness | none |
| §5.4 zeta covolume | ℚ,n=2,3; ℚ(i),n=2,3 | R/ζ*(−1)=−12; R/(ζ(2)/π²)=6; n=3 exponent −2; quadratic exponents −3,−5 | Leading-term scalar may be negative, positive-value scalar positive | none |
| §5.4 rational-basis laws | column swap, column scale 2; ℚ,n=3 conversion | det multipliers −1,2; volume multipliers 1,2; lattice conversion (2π)·2=4π | Signed and absolute laws agree | none |
| §5.5 finite-S and order transport | S empty; prime above 2; K₁ of ℤ and ℤ[1/2] | higher regulator image ratio 1; higher rank dₙ unchanged; K₁ unit ranks 0 and 1 | Higher odd degree bound essential, no good-prime restriction | none |
| §5.5 commensurable lattice ratio | C⊂L₁,L₂ of indices 2,3 | covol(L₁)=covol(C)/2, covol(L₂)=covol(C)/3, ratio 3/2 | Commensurability does not force equality | none |
| §6.1 point quotient and projection | n=1,2,3; z=1+i | projections 1,i,1; complementary differences i,1,i lie in ℝ(n) | Projection and quotient inverse laws hold | none |
| §6.1 zero-weight and real-fixed boundaries | n=0; F=ℚ,n=2,3 | totalized P₀(1)=1≠0 on ℝ(0); fixed quotient dimensions 0,1 | n>0 essential; simultaneous conjugation retained | none |
| §6.1 integral coordinates and trace | generator (2πi)^(n−1); quadratic pair | selected coordinate 1; ℤ(n) quotient image 0; odd trace t+t=2t | Correct lattice and full trace | none |
| §6.2 Borel–Beilinson map comparison | rank-one coordinate t≠0; ranks 0,1,2 | Beilinson coordinate t/2; t=2(t/2), whereas zero map gives 0≠t; determinant ratios 1,2,4 | Independent calibration, not a definition by scaling | none |
| §6.3 Adams action | a=2,n=3,d=1,2; d=0; a=1 | scalars 8; determinants 8,64; empty determinant 1; identity scalar/determinant 1 | Correct weight and empty-space convention | none |
| Downstream period conversion | row factor λπ^(n−1), λ∈ℚˣ; ℚ,n=3; d=0 | exponent shift (n−1)d; −2+2=0 for ℚ,n=3; rank-zero shift 0 | No polylogarithmic symbol construction imported here | none |

## Required checks and exact outcomes

1. Required elaboration of packages/BorelRegulators/Suggested.lean with lake env lean, run from the pinned content checkout: exit 0. Exact diagnostics, with filenames expressed relative to the repository:

```text
packages/BorelRegulators/Suggested.lean:46:8: warning: declaration uses `sorry`
packages/BorelRegulators/Suggested.lean:55:8: warning: declaration uses `sorry`
packages/BorelRegulators/Suggested.lean:72:8: warning: declaration uses `sorry`
```

Both imported TauCeti module object files were available; no targeted module build was needed. No process remains running.

2. Mechanical binder audit: a single scratch copy of the final file appended #check @name for every one of its three declarations and was elaborated once. Exit 0, with the same three expected sorry warnings. The expanded types preserve Field F and NumberField F in all three declarations, centrality and finite dimension inside the existence statement, every embedding’s induced scalar structure, and IsTotallyReal F, 2≤n and Even n in the new headline. They agree with README §§3.1,3.2,5.1. There are no definitions or instances with hidden section binders. Changes to signatures are exactly 2≤a → 1≤a and the added rank-zero theorem.

3. Required dependency gate with --depcheck, --name BorelRegulators, the supplied order and --movable: exit 0. Exact output:

```text
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This validates the package’s supplier direction, not the external ownership moves discussed below.

4. Source manifest parsed as tauceti-roadmap-sources/v1 with seven distinct keys. All twelve gap contracts matched their plan needs and suppliers. Pattern checks found no old pp.6–9 range in the README or manifest. The name/import audit gives three documented theorems, one import Mathlib and the same two used TauCeti imports, no definitions or instances, no set_option and no admitted examples. git diff --check passed. No separate gate failures were listed in the brief.

## Maintainer consequences and limits

The unnumbered operator matter has concrete external witnesses. merge-order/ORDER.txt places ArithmeticKTheory at line 113, ArithmeticKTheoryPartII at line 223 and BorelRegulators at line 224. The obsolete exclusion in packages/BorelRegulators/design/README.md:13 names ArithmeticKTheoryPartII; the package README does not. The prior design review records a candidate after ArithmeticKTheory and ownership moves from ColemanIntegration, HeightsRationalPointsAndObstructions and PeriodsAndSpecialValues.

The readable ColemanIntegration L3.Fc.1 still constructs the complex lattice theorem, and HeightsRationalPointsAndObstructions §3.6 still uses period=index in its proof. EndoscopicTransferAndUnitaryTraceComparison §6.2 states Tamagawa number one for all simply connected semisimple groups and is at order line 166, preceding the package’s present slot. Meanwhile ArithmeticKTheoryPartII R17 requests stable symplectic cohomology and finite-type KSp from BorelRegulators:R.3. That label is absent here, and that symplectic construction is outside this number-field SL regulator contract. These are genuine placement/import questions that the dependency gate alone cannot resolve. No new gap or assertion of a supplier target was invented to absorb them.

The maintainer must decide the requested move after ArithmeticKTheory and coordinate ownership/import changes on the other roadmaps. Polylogarithms’ readable §4.7 still points to BorelRegulators §7.1; the valid rank-zero location is §5.1 and the new native theorem. Its regulator lattice/covolume inputs are §§2.3,5.3–5.4, and the normalization comparison is §6.2. The other consumer-label corrections identified by the review also require edits outside this package. No existing name cited downstream was renamed or deleted.

The changes make the package reviewable; they do not constitute an independent acceptance review. No commit, push, pull-request edit or external message was made.
