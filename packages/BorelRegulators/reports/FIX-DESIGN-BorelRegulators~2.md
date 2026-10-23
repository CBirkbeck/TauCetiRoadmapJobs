# BorelRegulators design repair

The review's twelve claims were considered separately. Changes are confined to `packages/BorelRegulators/design/README.md`, `packages/BorelRegulators/design/plan.json`, `packages/BorelRegulators/sources.toml` and this requested report. Supplier gaps remain obligations, not certified supplier theorems.

## F01 (P1) — not actionable in this package: AdelicAlgebraicGroups must supply the numerical theorem

Unowned proof-certification request → gap:classical-tamagawa-proof assigned to AdelicAlgebraicGroups, extending §2.4 and the §3.4 carrier, with τ(SL₁(D))=1 for every division algebra of degree ≥2. Section 3.4 now specializes that measure; it does not own another numerical theorem. Borel invokes τ=1 at borel1977 line 227. Only the supplier can discharge this gap.

## F02 (P1) — applied differently

Unowned acceptance meta-gap → deleted from both files. The statable totally real theorem is not retained as a separate headline: F07 places its checks under §5.1. No blanket claim of unstatability remains. No Suggested.lean exists in this design, and creating one is outside the edit allowlist; no acceptance file or substitute theorem was added.

## F03 (P2) — applied differently

Unacknowledged overlap → explicit ownership boundary for ColemanIntegration §L3.Fc.1 in Scope and Downstream consumers. Sections 2.2–2.3 and 5.3 own the shared lattice theorem; §6.2 identifies the Beilinson normalization. Added the ℚ, n=3 check: Borel image tℤ versus Beilinson image (t/2)ℤ. The universal-deligne contract records the point-case overlap.

## F04 (P2) — applied differently

Asserted EndoscopicTransferAndUnitaryTraceComparison dependency → deleted from Scope and both consumer lists. Its §6.2 states the general simply connected theorem independently, using Lai and Kottwitz; its Needs line has no norm-one input. The type-A value required here is instead the AdelicAlgebraicGroups supplier gap. The unnecessary comparison citation was also omitted.

## F05 (P2) — applied

Compound DGFloer gap → CharacteristicClasses C5a.5 extension for the filtration comparison alone. C5a.5 supplies the multiplicative cohomological Serre sequence. The narrowed contract preserves α, β, edge restriction and the common-fibre identity for the actual bundles. Updated supplier contracts and every gap reference. The source comparison is borel1977 lines 328–337.

## F06 (P2) — applied

Combined Chern/index gap → CharacteristicClasses C6 item 3 supplies only the oriented integral Chern calibration. Section 5.2 owns the Cartan-map homotopy-index computation using TopologicalKTheory T7 item 1 and StableHomotopyKTheory §§2.4–2.5. Added explicit degree-five, degree-nine and representative-independence checks. Added Lemma 9.18 to the existing burgos2002 manifest locator; see burgos2002 lines 3546–3576.

## F07 (P2) — applied

Duplicate §7.1 theorem and mandatory route → deleted Layer 7, retained §5.1's general empty-determinant clause, and carried all four boundary checks into Layer 5 examples and §5.1's plan tests. Scope assigns Siegel–Klingen rationality to IntegralIwasawaTheory §6.0. The local Polylogarithms §4.7 contract now points to that owner and §5.1. No other layers were reordered.

## F08 (P3) — applied

Draft-state gap descriptions → mathematical Supplier extensions, each with the required “What Supplier must provide (gap:slug)” line and an exact requested location. Replaced every Needs reference by gap:slug. Removed the acceptance meta-text and “relocated” wording. MotivicEtaleKTheory requests name its universal-realization layer without asserting that an existing section supplies them. README and plan were synchronized.

## F09 (P3) — applied

Two duplicated §3.4 API bullets → deleted in README and plan. Its Needs line imports AdelicAlgebraicGroups §2.4's gauge independence and restriction-of-scalars identities. The scaling check remains prose: 2·(1/2)=1. The specialized quotient-mass target retains the actual measure and nonzero-form hypothesis.

## F10 (P3) — applied differently

Implicit native Brauer inputs → named Tau Ceti declarations, exact files and lines in the contracts, and prerequisites of §§3.1–3.2. The matrix representative API now requires a≥1 and specifies size a/d. The zero-class check also excludes a=0, because mk_matrix requires NeZero. This corrects the same hypothesis omission wherever that representative is used.

## F11 (P3) — applied differently

Broad K-theory and misplaced Burgos locators → §§2.5, 3.2, 3.12, 7.7–7.8, with transfer uses narrowed throughout. Section 1.2 is elementary; Definition 10.8 locates only embedding assembly. Deleted the specific PS.9.8–PS.9.10 covolume claim rather than replacing it with an uncertified locator: PeriodsAndSpecialValues has no readable main/head copy in the supplied repository or roadmap index.

## F12 (P3) — applied

Ambiguous ArithmeticKTheory Part II location → “extension of ArithmeticKTheory §§3.2–3.4 to all full ℤ-orders.” Scope explicitly excludes ArithmeticKTheoryPartII §R17's symplectic/KSp request. Its board design really does request BorelRegulators:R.3; this package supplies no such symplectic theorem and takes no input from that design. The base supplier remains ArithmeticKTheory.

## Verification evidence and ownership

The read main checkout is a4a8652e46fe27e56355bbcf74579562b503fbc3. Main-branch examples read for form were Completed/NumberFieldArithmetic, TauCetiRoadmap/AlgebraicTopology and TauCetiRoadmap/DGFloer. The roadmap tools searched objects across main and the indexed open heads; the named sibling package copies were also searched for Brauer period/index, regulators, Deligne realization and primitive determinants. No helpers or other agents performed mathematics or edits.

| Finding | Evidence read and implication |
| --- | --- |
| F01, F09 | AdelicAlgebraicGroups §2.4, “Independence of the gauge form”, “Tamagawa number” and “Tamagawa measures and restriction of scalars”; §3.4's SL₁(D) carrier. These supply the normalization, gauge independence and scalar restriction, not the numerical norm-one theorem. The latter remains the explicit extension request. Weil's waived locator was preserved; borel1977 lines 213–236 show its use. |
| F02 | Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47, Discriminant/Defs.lean:35,41, DedekindZeta.lean:49 and LSeries/HurwitzZetaValues.lean:226,232 expose the review's carriers and positive-integer witnesses. This establishes the counterexample to the deleted blanket premise; it does not certify every other target's statability. |
| F03 | ColemanIntegration §L3.Fc.1 constructs the complex Beilinson map and integral lattice/injective rational regulator, retaining pairings and determinants. Burgos's normalization comparison is burgos2002 Theorem 10.9, lines 4133–4245. Its rank-one determinant factor is 2, so the two lattices are related, not literally equal. |
| F04 | EndoscopicTransferAndUnitaryTraceComparison §6.2's statement, proof route and complete Needs line: all simply connected semisimple groups, with quasi-split calculation and inner-form comparison. SL₁(D) is a case of its conclusion, not a premise. |
| F05 | CharacteristicClasses C5a.5 explicitly constructs the multiplicative cohomological Serre sequence and its universal transgression; the arithmetic/invariant-form extension is the narrower contract. Borel's filtration-preserving maps are borel1977 lines 328–337; the odd-size degeneration used here is lines 440–461. |
| F06 | CharacteristicClasses C6 item 3 fixes right suspension and ch(u)=−v. TopologicalKTheory T7 item 1 fixes c(a)=2u² and c(b)=u⁴. StableHomotopyKTheory §§2.4–2.5 supplies the homotopy-fibre exact sequence. The specific Cartan comparison is proved here, following burgos2002 lines 3546–3576; the covolume factors are lines 3613–3614. |
| F07 | IntegralIwasawaTheory §6.0 explicitly states totallyRealHeckeValue_rational. LFunctions Layer 3 supplies the continued zeta germ and functional equation. The empty determinant in Borel's argument is borel1977 lines 590–594. Positive-even rationality is an equivalent specialization, not another owner. |
| F08 | Every remaining gap has a supplier, section, one-sentence needs, neededBy entries and matching prerequisite tokens. The two MotivicEtaleKTheory locations are requests; no existing universal-realization theorem is asserted from an unread section. |
| F10 | TauCeti/Algebra/BrauerGroup/Division.lean:69 gives exists_eq_mk_centralDivisionRing. TauCeti/Algebra/BrauerGroup/Group.lean:159 gives mk_matrix with [NeZero n]. Period–index is additional arithmetic, supplied here using poonen2017 lines 1396–1446. |
| F11 | GeneralAlgebraicKTheory §§2.5, 3.2 define the groups; §3.12 compares plus/Q; §§7.7–7.8 supply transfer and its base-change formula. Burgos Proposition 9.21, burgos2002 lines 3628–3645, is an embedding factorization, not the elementary trace law. Definition 10.8 is burgos2002 lines 4091–4106. |
| F12 | packages/ArithmeticKTheoryPartII/design/README.md, §R17 and Layer AK2.8, explicitly request symplectic stability from BorelRegulators:R.3. The base ArithmeticKTheory §3.4 instead supplies actual rational order comparison and SL ranks. Keeping the integral-order request with that base avoids a reciprocal supplier edge. |

The remaining cross-roadmap inputs were read at their named sections: ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–ALS.0.9 and ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; ClassFieldTheory Layers 5 and 10; ArithmeticGaloisDuality R02.4.5b–R02.4.6; DifferentialGeometry Layers 5–6 and 8; SchemeKTheoryOperations §6.8; StableHomotopyKTheory §§3.37,4.14; ArithmeticKTheory §§3.2–3.4; AlgebraicTopology Stage 5 item 5. Consumer contexts read were Polylogarithms §§2.3,3.7–3.8,4.4,4.7; HeightsRationalPointsAndObstructions §3.6; HabiroNahmSeries §1.5; and ColemanIntegration §L3.Fc.1.

The roadmap index and the main tree contain neither PeriodsAndSpecialValues nor MotivicEtaleKTheory. The former's specific PS.9 citations could therefore not be certified and were cut. The latter's universal and infinitesimal realization requirements remain declared supplier gaps. This does not treat a consumer's reference or another report as an authoritative supplier statement.

The library pins match the manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Native quotient, embedding, discriminant, empty determinant and covolume declarations were read at the README's file/line locators. In particular IsZLattice requires a discrete subtype topology as a parameter and full span as a field; Submodule.mkQ imposes no topology. TauCeti.Hodge.tate uses tateLatticeMap, the ordinary inclusion at TauCeti/Geometry/Hodge/Tate/Basic.lean:44–45, not the scaled coefficient lattice.

All newly used source passages were read in the supplied legal extractions. No new work or duplicate source key was introduced. The manifest's waived weil1961 and uncertified beilinson1985 entries were not reopened; no text depends on obtaining another copy.

## Adversarial mathematics pass

Values below are mathematical evaluations, not claims that elaboration proves truth. Each target row covers its defining equations and API; separate rows cover the modified supplier contracts and conventions. The retained n≥2, number-field, finite-dimensionality, arithmetic-subgroup, division, nonzero-form and finite-residue-field conditions exclude the indicated negative controls.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing degree/signature and weight conventions | ℚ; ℚ(i); real quadratic; n=1,2,3 | N=r₁+2r₂ gives 1,2,2; dimensions at n=2,3 are (0,1),(1,1),(0,2). At n=1 the target has dimension r₁+r₂, while units have rank r₁+r₂−1. | Higher-weight distinction holds | None |
| Tate twist and embedding conjugation | A complex pair; n=2,3 | Conjugating 2πi·t gives −2πi·t; conjugating −4π²t gives −4π²t. Divided pairs are (t,−t),(t,t). | Parity agrees | Reused in lattice overlap check |
| Cohomological real correction | Degrees 0,1,2,3,5 | i^q is 1,i,−1,−i,i; i·(−1)=−i=i³. | Multiplicative correction holds | None |
| Ordered determinant, positive covolume and zero dimension | [t], [2t], empty matrix, swapped columns | det=t,2t,1; covolume=abs(t),2abs(t),1; a column swap has determinant −1 and absolute value 1. | Signs and empty convention agree | Rank-zero checks retained |
| Integer exponents | ℚ n=3; ℚ(i) n=2; real quadratic n=2 | d−Nn=−2,−3,−4; natural subtraction would give 0 in each case. | Integer powers essential | None |
| Gauge normalization | ω↦2ω over ℚ; ℚ(i), h=3 | Infinite/finite multipliers 2 and 1/2 give 1; at a complex place abs(2)²=4; 4^(−3/2)·2³=1. | Product and discriminant factors agree | Supplier facts imported |
| §1.1 Vₙ, Cₙ, coordinate maps and topology | ℚ n=2,3; imaginary pair; weight-three generator | Real weight two: t=−t gives 0; weight three dimension 1. The generator −4π² divides to 1. Weight-two ambient norm 2π becomes coordinate norm 1; both topologies coincide. | Coordinates distinguish wrong parity and unscaled norm | None |
| §1.2 R,T, degree and tower laws | ℚ(i)/ℚ; degree-four quadratic tower; identity | n=2: T(t,−t)=0; n=3: T(R(t))=2t. A four-embedding tower gives 4t=2(2t); identity gives t=t. | Elementary fibre formulas hold | Deleted K-theory prerequisite and false locator |
| §1.3 analytic leading coefficient | ℚ n=2,3,4; n=1 | (−1/12)/(ζ(2)/π²)=−1/2; ζ′(−2)/(ζ(3)/π²)=−1/4; (1/120)/(ζ(4)/π⁴)=3/4. At n=1 the orders are 0 versus proposed higher-weight 1. | Nonzero leading coefficients, correct exclusion | None |
| §2.1 suspended character and stable class | Bott weights 2,3; identity block; zero/double character | ch(u)=−v implies ch(u²)=v² and ch(−u³)=v³. Twisted periods are −4π² and −8π³i; c₃ changes the weight-three value by 2. Identity block contributes 0; zero/double maps give 0/2 rather than coordinate 1. | Calibration fixes sign and scale | Narrowed calibration contract |
| §2.2 regulator on actual groups and localization | 0; mx=0, m>0; nonzero rational class | r(0)=0; mr(x)=r(mx)=0 gives r(x)=0; actual localization gives coordinate t, a doubled inverse gives 2t≠t. | Map and torsion checks agree | Ownership boundary only |
| §2.3 real isomorphism, torsion kernel, restriction and transfer | ℚ; ℚ(i); real quadratic; quadratic transfer | Source/target ranks are (0,1),(1,1),(0,2) at n=2,3; in odd weight tr∘res and T∘R both give 2t; even trace gives 0. | Rank and map witnesses agree | ColemanIntegration overlap recorded |
| §3.1 global period/index and matrix representatives | Zero; invariants (1/2,1/2), (1/3,−1/3); a=0,2 | Empty lcm=1, degree=1. Pair lcms 2,3 give dimensions 4,9; a lone 1/3 sums to 1/3≠0. Zero class at a=2 is M₂(F), dimension 4; a=0 has no positive matrix size. | Arithmetic statement plus native representative API | Added a≥1 and zero-size negative control |
| §3.2 division algebra in each degree | D=(−1,3)/ℚ; degree-three invariant pair; Hamilton | Hilbert symbols for D at 2,3,∞ are −1,−1,+1; others +1. Degrees/dimensions are 2/4 and 3/9. Hamilton has infinite invariant 1/2, not 0. | Infinite-splitting controls agree | Named native representative inputs |
| §3.3 Borel gauge and transport | ℚ(√5), h=3; ℚ(i), h=3; h=0; ω=0 | Removing the discriminant factor multiplies by 5^(3/2); complex ordinary-coordinate transport contributes 1/8. At h=0, 2·(1/2)=1; ω=0 yields mass 0. | Nonzero form and normalization necessary | None |
| §3.4 specialized quotient mass | Degrees 2,3; form doubled; norm-one torus | Dimensions a²−1 are 3,8. The requested τ and specialized product-quotient mass are both 1; rescaling gives 2·(1/2)·1=1. The torus has character rank 1 versus SL₁(D)'s 0 and is excluded. | Witnesses agree conditional on explicit supplier theorem | Numerical ownership assigned; duplicated API cut |
| §3.5 finite factors, correction and index | SL₂, SL₃ over 𝔽₂; exceptional mass b; q=1 | 6/8=3/4; 168/256=21/32=(3/4)(7/8). Correction at q=2 is b/(3/4)=4b/3. Standard-place enlargement multiplies by 1; q=1 gives denominator 0 and is excluded. | Ramified correction and nonvanishing agree | Gap notation synchronized |
| §3.6 adelic identity and covolume changes | Level index 3; split M₂(ℚ); Hamilton | (m_f/3)(3vol∞)=m_f·vol∞=1. Split matrix algebra gives a noncompact real quotient; Hamilton is not split at infinity. | Division and splitting serve different hypotheses | Numerical input now imported through §3.4 |
| §4.1 cohomological indecomposable determinant | Λ(x₃,x₅); k[u₂]; k in degree zero | H⁸ dimension 1 but Q⁸ dimension 0; Q²(k[u₂]) dimension 1, Q⁴ dimension 0; Q(k)=0 and ∧⁰0=k with generator 1. | Quotient and empty determinant agree | Gap notation synchronized |
| §4.2 invariant-form comparison | Degree 0; products of degrees 1,2; degrees 3,5; C₂ stabilizer | 1 maps to 1; i·(−1)=−i; odd corrections −i and i differ. A point has H¹=0, whereas H¹(C₂,𝔽₂) has dimension 1. | Correct phase and descent hypotheses | None |
| §4.3 compact rational period and discriminant | ℚ weights 2,3; ℚ(i) weight 2 | Absolute weight-two generator is 4π², class π² with ratio 4; weight three has π³; Δ=4 gives 4^(−3/2)π⁴=π⁴/8. | Nonzero compact factors agree | None |
| §4.4 compact cycles and lower-generator wedge | j=1,2, N=1; j=1,N=2; repeated exterior generator | Dimensions N(j²+2j) are 3,8,6; restriction wedge factors (j+1)^(jN) are 2,9,4. Wedge with a repeated earlier generator is 0 on both sides. | Source's dimension/factor slips are not propagated | None |
| §4.5 full-group determinant | Successive products j=0,1,2 | Products 1,ζ_F(2),ζ_F(2)ζ_F(3) have ratios ζ_F(2),ζ_F(3); denominators positive. For ℚ,n=2 full rank N=1 although base rank d=0. | Full-group period survives rank zero | None |
| §4.6 common compact fibre and lift changes | ℚ n=2,3; ℚ(i); triangular matrix | (d,N,N−d)=(0,1,1),(1,1,0),(1,2,1). det[[1,2],[0,1]]=1; fibre scaling by 2 would give determinant 2. | Identity on fibre is substantive | Only filtration comparison remains a gap |
| §5.1 general primitive determinant and its phase | ℚ n=2,3; ℚ(i) n=2,3; real quadratic n=2 | E=−2,2,0,0,−4, always even. Empty comparison gives 1=6·(1/6). Raw exponents −2,−3,−4,−6,−4 agree with −Nn. | General comparison includes empty case | Former §7.1 checks folded here |
| Former §7.1, now Layer 5 example | ℚ n=2,4; real quadratic n=2k; imaginary quadratic | Positive rational values 1/6,1/90 have reciprocals 6,90. N=2 gives exponent −4k and determinant 1; imaginary quadratic even weight has d=1, not 0. | Boundary case agrees with Siegel–Klingen via functional equation | Duplicate theorem deleted |
| §5.2 Cartan map and homotopy indices | q=5,9; identity; g=diag(i,−i), h rotation by π/2 | q_* then C_* has multipliers 1·2=2 and 2·1=2. C(SO)=I; (gh)(gh)ᵗ=ggᵗ=−I. The representative rule [g]↦g gives g versus gh, which differ. | Source/target, scale and quotient well-definedness agree | Explicit map and tests added |
| §5.2 Tate/homotopy covolume conversion | ℚ n=2,3,5; imaginary quadratic n=2,3; real quadratic n=3 | Factors are 1,4π,2π; 2π in both imaginary cases; (2π)²·2²=16π² in real rank two. | Real index is distinct from twist shift | Real-index computation owned here |
| §5.3 integral lattice and Borel/Beilinson overlap | Rank zero; t=3; doubled generator; rank-two subgroup of ℝ | Empty covolume 1. Borel lattice 3ℤ has covolume 3, Beilinson (3/2)ℤ has 3/2; doubled lattice has 6. ℤ+√2ℤ has source rank 2 but target dimension 1 and is nondiscrete. | Real isomorphism, not finite generation alone, ensures discreteness | Added normalized overlap check |
| §5.4 zeta covolume and rational basis | ℚ n=2,3; ℚ(i) n=2,3; swapped basis | 1=(−12)(−1/12)=6ζ(2)/π². Exponents are −2 for ℚ,n=3 and −3,−5 for ℚ(i). Swap determinant −1 preserves absolute covolume; column multiplier 2 doubles it. | Both rational classes and signs agree | None |
| §5.5 S-integers and orders | S empty or containing 2; K₁; commensurable lattices | Empty S gives ratio 1; higher odd residue even K-group is 0, so images stay equal. K₁ unit ranks for ℤ,ℤ[1/2] are 0,1. Common-subgroup indices 2,3 give ratio 3/2. | Degree restriction and commensurability agree | Base supplier location clarified |
| §6.1 point quotient and its inverse | n=2,3; z=1+i; real embedding | P₁(1+i)=i with complement 1; P₂(1+i)=1 with complement i. Kernel is respectively ℝ and iℝ; fixed real-embedding dimensions are 0 and 1. | Projection, kernel and inverse identities agree | Gap notation synchronized |
| §6.2 Borel/Beilinson maps and determinants | Dimensions 0,1,2; nonzero rank-one class | 2^d=1,2,4; empty determinants 1=1; t=3 gives 3=2·(3/2). A zero Beilinson map would give 0≠3. | Independent normalization necessary | Overlap uses this comparison |
| §6.3 Adams scalar and determinant | a=2,n=3,d=1,2; n=2,d=0; a=1 | Scalars 8,8 and determinants 8,64; at d=0 determinant 2^0=1; a=1 gives scalar/determinant 1. | Injectivity transfers the Chern weight law | Gap notation synchronized |
| gap:stable-finite-range | F=ℚ,q=3,a=15,13 | a−1=14>12, while 12>12 is false. The requested sufficient bound distinguishes the endpoint; no isomorphism claim at failure is inferred. | Strict inequality retained | Timeless contract text |
| gap:integral-chern-calibration | n=2,3; doubled/zero character | Periods −4π²,−8π³i divide to 1; doubled/zero characters divide to 2,0. | Contract fixes integral orientation and scale | Reduced to one deliverable |
| gap:cyclic-local-degrees | a=1,2,8; invariants of denominator 2,8 | Local restrictions multiply invariants by degree: 2·(1/2)=1=0 and 8·(1/8)=1=0 in ℚ/ℤ; a=1 leaves 0. Fixed unramified dyadic data can have obstruction value −1 rather than +1. | Variable extensions do not erase Wang's obstruction | Token form only |
| gap:inner-type-a-structure | a=2,3,1 after splitting | Base changes are SL₂,SL₃ with dimensions 3,8; a=1 gives dimension 0 and fails absolute almost simplicity. | a≥2 matters | Token form only |
| gap:adelic-rational-masses | Standard and finite-index levels over 𝔽₂ | SL₂ mass 3/4; index-two subgroup mass 3/8; exceptional rational mass b gives correction 4b/3. A zero mass is not positive. | Contract includes all compact opens, not just standard ones | Timeless description |
| gap:classical-tamagawa-proof | Division degrees 2,3; indefinite quaternion; split torus exclusion | Requested τ values 1,1; quaternion Hilbert symbols −1,−1,+1 give h=3; norm-one torus character rank 1 differs from division-group rank 0. | Numerical theorem specified, not inferred from checks | Named external owner; obligation remains |
| gap:order-finite-generation | R=O_F; full order R=ℤ+2ℤi; common-subgroup indices 2,3 | At equality the image/covolume ratio is 1; R has ℤ-rank 2 and rational span ℚ(i). Indices 2,3 give covolume ratio 3/2, so rational equivalence alone does not give equality. | Request is integral and belongs to the base direction | Ambiguous Part II locator replaced |
| gap:universal-deligne | One complex point; real descent; two embeddings | H¹_D point target has real dimension 1; real-embedding invariants give dimensions 0,1 at n=2,3. Two odd-weight embeddings send t to (t,t) and trace to 2t. | Point contract matches realization adapter | Named requested location and consumer overlap |
| gap:infinitesimal-classifying-comparison | Constant degree zero and positive degree; normalized cone projection | Normalization of constant cosimplicial ℝ gives N⁰=ℝ, N¹=0; the two point projections of 1+i are i and 1. | Coefficients/cone projection are fixed independently | Named requested location; source generality read |
| gap:graded-indecomposable-api | Λ(x₃,x₅); k[u₂]; k | Q⁸=0 versus H⁸ dimension 1; Q⁴(k[u₂])=0 versus u₂²≠0; Q(k)=0 and empty determinant 1. | Generic quotient differs from a chosen complement | Token form only |
| gap:multiplicative-serre-comparison | Common fibre at ℚ,n=2; lift matrix | Fibre dimension 1, edge comparison multiplier 1; changing lifts by [[1,2],[0,1]] gives determinant 1; arbitrary fibre multiplier 2 gives 2. | Abstract isomorphism does not suffice | Machinery imported; only filtered comparison requested |

The numerical phase, rational-factor, finite-field and projection calculations were recomputed independently, including signatures (1,0), (0,1), (2,0) and weights 2–5. The Cartan map uses the nonabelian groups themselves, not an assumed additive group law: g and h in the displayed SU₂ example do not commute. Characteristic-zero coefficient, finite-type H-space and arithmetic-manifold hypotheses remain on their original targets. No new theorem-shaped hypothesis, arbitrary scalar normalization or sorry-defined object was introduced.

## Checks and limitations

- Required dependency check: exit 0. Exact final output:

```text
candidate: BorelRegulators is not in the merge order yet; checked as if placed after ArithmeticKTheory (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

- No final UPWARD or CYCLE line. An intermediate run interpreted the retained negative EndoscopicTransferAndUnitaryTraceComparison comparison in Scope as a supplier and emitted `CYCLE: BorelRegulators consumes EndoscopicTransferAndUnitaryTraceComparison (#125) and is consumed by Polylogarithms (#114), which comes first: a supplier after a consumer, a cycle through BorelRegulators`. Removing that unnecessary citation along with its false consumer entry resolved the scan; no tooling or order file was edited. No gate failures were supplied separately in the brief.
- Citation resolution: exit 0, against main a4a8652 and 330 indexed open heads. Its sole cross-roadmap lead was `ArithmeticKTheoryPartII §R17: no roadmap ArithmeticKTheoryPartII on main or in an open pull request`. The exact section exists in the authorized board design, as verified above; the citation marks an excluded request, not a supplier. No unresolved Lean names were reported. The resolver did not inspect pinned libraries, so the README's external declaration names and hypotheses were read manually at the two pins.
- JSON and TOML parse successfully. The plan has six layers, 26 targets and eleven named supplier gaps. All target and gap prerequisite references resolve internally; every neededBy entry has a matching gap prerequisite. All eleven README extension lines match their plan supplier and needs. Affected target Checks and the relocated rank-zero tests agree between README and plan.
- Pattern scans find no designed/unwritten/relocat/treated-as narrative, pinned-headline-carriers, old §7.1 reference, retired totallyRealEvenPrimitivePeriod name, DGFloer gap assignment, supplier `none`, old exact-supplier-contract Needs phrasing, or GeneralAlgebraicKTheory §§7.4–7.8 citation. Whitespace and machine-path checks pass. The only manifest change is the existing Burgos entry's Lemma 9.18 locator.
- Lean elaboration and the requested mechanical `#check @name` binder audit were not run. There is no Suggested.lean in this design, no Lean declaration was added or edited, and the allowlist excludes creating that file. Thus there are zero changed Lean signatures to compare; this is not a claim of a successful acceptance build. Acceptance-file creation and any remaining headline-statability assessment must be handled where that file is editable.

## Consequences for maintainers

AdelicAlgebraicGroups must discharge gap:classical-tamagawa-proof. CharacteristicClasses' two narrowed extension requests remain gaps; they do not assert delivered supplier APIs. The generality of the norm-one request includes infinity-ramified division algebras, although this roadmap's quotient-volume application retains infinite splitting.

ColemanIntegration §L3.Fc.1 still contains the overlapping construction at its read head. This design records the required move of the regulator/lattice block to the earlier supplier, retaining ColemanIntegration's pairings and determinants. Aligning that other roadmap cannot be done by editing these files. The factor-two comparison must accompany that alignment.

Polylogarithms §4.7 still cites §7.1 at its read head; its replacement is §5.1's empty-determinant clause and IntegralIwasawaTheory §6.0, with LFunctions Layer 3 and §1.3 for the equivalent zeta expression. The plan target totallyRealEvenPrimitivePeriod and its two API entries are retired; no Lean declaration bearing these names was present or changed. All other target IDs remain stable, including §3.4's measure specialization.

ArithmeticKTheoryPartII's BorelRegulators:R.3 symplectic request is not supplied by this package. Its owner must address that external scope request; the integral-order supplier gap here is directed solely to the base ArithmeticKTheory. PeriodsAndSpecialValues' unavailable PS targets and MotivicEtaleKTheory's requested realization layer have not been silently certified. No other repository, pull-request text, issue, order file or tooling was changed, and no commit was made.
