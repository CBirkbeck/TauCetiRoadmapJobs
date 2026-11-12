<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6788634258 -->
Review (codex) of b47b3cd

Verdict: needs_changes

1. **F01** (P1) The field-level Leopoldt input has no supplier contract

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:546`: “which holds by Brumer's theorem because those fields are abelian over K”. The Needs line at 554 supplies duality and characteristic-ideal operations, but no theorem establishing this field-level Leopoldt assertion.

   **Claim:** Billot's hypothesis for every finite intermediate field of the two-variable extension is available as an input to §4.3. A literature attribution alone does not supply this library prerequisite, and none of the four declared gaps supplies it.

   **Witness:** BIL86 line 380 requires field-level Leopoldt. IntegralIwasawaTheory, PR #1306, `TauCetiRoadmap/IntegralIwasawaTheory/README.md:726`, proves it for abelian E/ℚ. For p=5, Gal(K_1/ℚ)=C₅⋊C₂ is nonabelian: cγc⁻¹=γ⁴≠γ.

   The ownership search found the abelian-over-ℚ theorem and the general Baker–Brumer input in IntegralIwasawaTheory, but no supplied abelian-over-imaginary-quadratic conclusion in the cited suppliers. Weak Leopoldt from the elliptic-unit Euler system in §3.4 is a different assertion; it does not fill this field-level prerequisite. BRU67's source-access waiver remains settled and is not being challenged.

   **Exact repair:** Add a declared gap `leopoldt-abelian-over-imaginary-quadratic`, with supplier `IntegralIwasawaTheory`, section `§4.4`, to the top-level gaps list and the README's Exact supplier contracts. Its single mathematical requirement should be: for every imaginary quadratic number field K, every finite abelian extension F/K and every rational prime ℓ, the localization map from O_F×⊗ℚ_ℓ to the product of the ℓ-adic local multiplicative completions tensored with ℚ_ℓ is injective, equivalently δ(F,ℓ)=0. Cite this contract in §4.3 and its Needs and layer dependencies. This extends the existing supplier rather than re-planning its logarithm theory here.

   Replace the anonymous direct Brumer invocation by that supplier application. If the direct bibliographic attribution is retained, also record the already waived work under its existing key BRU67 and give its locator in References: the present manifest contains only BKO21, AHII05, AHI06, BIL86 and RUB91. Do not fetch or reopen the waived source.

   **Repair test:** K_1/K is cyclic of degree 5, so it satisfies the proposed F/K hypothesis even though its degree-10 Galois group over ℚ is nonabelian. All finite intermediate fields required by §4.3 are abelian over K. The contract supplies exactly the missing hypothesis without restricting the roadmap to fields abelian over ℚ. IntegralIwasawaTheory is earlier in the supplied merge order.

2. **F02** (P2) Conjugation need not preserve the coefficient ring

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:243`: “which acts on R by a semilinear map”; line 546 also invokes “the coefficient automorphism”. The Conventions allow an arbitrary finite L/Φ containing the avatar values, not a conjugation-stable extension.

   **Claim:** The nontrivial automorphism of Φ/ℚ_p extends to an automorphism of this chosen R, so that the conjugate comparison can be treated as a semilinear self-map over R.

   **Witness:** At p=5 take a Teichmüller generator a of 𝔽₂₅× and L=Φ(∛(aπ)). Conjugation sends a to a⁵. The quotient a⁴ is not a cube; its cube root generates an unramified cubic extension, absent from totally ramified L.

   Indeed X³−aπ is Eisenstein, so L/Φ is totally ramified of degree 3. If conjugation extended to L, the quotient of the conjugate of ∛(aπ) by ∛(aπ) would have cube a⁴. Cube exponents in the cyclic group of order 24 are 0,3,6,9,12,15,18,21; exponent 4 is absent. The reduction of X³−a⁴ is irreducible and separable, so this quotient cannot belong to L. This coefficient choice is permitted already for a class-number-one CM datum whose avatar is Φ-valued, for example K=ℚ(√−2) with p=5.

   **Exact repair:** In §1.2 state that changing the CM embedding compares R with its conjugate ring c(R); it is not generally a semilinear automorphism of R. In §4.3 specify the conjugate-coefficient comparison. One valid route is to pass to a finite coefficient extension stable under the chosen conjugation, establish the required characteristic-ideal comparison there, and descend the resulting equality using finite faithfully flat base change from PadicMeasuresIwasawaAlgebras §4.6. Keep the coefficient automorphism in the intermediate transport formula: semilinear transport alone does not prove ideal invariance. Add that base-change/descent step and the displayed non-stable cubic extension as a negative-control Check. Do not narrow the coefficient scope to stable or unramified R.

   **Repair test:** Over the compositum L·c(L), both ∛(aπ) and a conjugate root exist. The comparison has the correct source and target, and the finite free extension of integer rings is faithfully flat, so equality of extended ideals descends. Over the original L the corrected statement makes no nonexistent automorphism claim.

3. **F03** (P3) The tower locator points to the wrong subsection page

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:140`: “BKO21 §3.0.2, p.950”.

   **Claim:** That subsection and page support the global/two-variable/local tower identification.

   **Witness:** BKO21 line 388 starts §3.0.2 on printed p.951. The two-variable Galois identification is at BKO21 lines 828–829, p.961; the completion identification is at lines 853–860, pp.961–962.

   **Exact repair:** Replace the first locator by “BKO21 §6.0.1, p.961”, retaining “§6.0.2, pp.961–962” for the completion statement. The class-field-theoretic proof route remains appropriate for the asserted compatibility of transitions and maps.

   **Repair test:** The replacement directly locates the identification under p∤h_K; at n=0 both completions are Φ, and at n=1 both anticyclotomic local degrees are p. Page 950 no longer purports to contain §3.0.2.

4. **F04** (P3) The class-number Check calls the Hilbert class field cubic

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:132`: “E defined over the cubic field H”.

   **Claim:** In the example K=ℚ(√−23), the Hilbert class field H is a cubic number field.

   **Witness:** The three displayed reduced forms give [H:K]=3. Since [K:ℚ]=2, the tower law gives [H:ℚ]=6, not 3.

   **Exact repair:** Say “E defined over H, the cubic extension of K” instead of “the cubic field H”. Keep the example with h_K=3; it is a useful test of the intended generality.

   **Repair test:** The rewritten Check has [H:K]=3 and [H:ℚ]=6 simultaneously and continues to admit the same inert p=5 datum.

5. **F05** (P3) The pin already has general cohomological Selmer carriers

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean:18`: “the pinned Selmer groups are the 2-descent groups”. Also `packages/InertAnticyclotomicCMMainConjecture/README.md:21`, which assigns the generic discrete carrier solely to EllipticCurves Layer 7, and its supplier contracts at lines 63 and 103.

   **Claim:** The pin's Selmer inventory consists of the two listed descent groups and the S-unit group, with the general discrete cohomological carrier still only a roadmap input.

   **Witness:** At Tau Ceti 2fd255d9, `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69` defines the general structure; line 97 defines its Selmer group. `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:176` defines `WeierstrassCurve.selmerGroup` for arbitrary m.

   Both files are tracked and unchanged at the exact pin. The latter's lines 199–205 prove the local Kummer characterization when the curve is elliptic and m is invertible in the field. Setting m=5 is already outside the advertised 2-descent inventory. The generic structure has actual localization maps induced by compatible group/coefficient maps, and local-condition subgroups; it does not impose an almost-everywhere unramified condition or construct this roadmap's signed arithmetic conditions.

   **Exact repair:** Add `TauCeti.ContCohomology.SelmerStructure`, its `localization`, `selmerGroup` and `mem_selmerGroup_iff`, and the finite-m elliptic Selmer carrier to Scope and ownership and the Tau Ceti contract. Make §1.4 an arithmetic instantiation of this pinned kernel carrier, retaining SelmerIwasawaCohomology for the needed coefficient, local-condition and limit comparisons. Correct the module docstring's inventory. The remaining missing objects are the actual CM signed conditions, towers with these representations, elliptic-unit class and Rubin L-function; do not add a free-predicate substitute or an unused import.

   **Repair test:** For arbitrary m=5 the pinned elliptic carrier is defined. For a generic Selmer structure, all local conditions equal to the full groups give the full H¹, while identity localization with condition 0 gives the zero subgroup. These are genuine cohomological carriers. They do not supply the signed CM constructions, so this correction does not make any of the four headlines immediately statable.

Five findings: one P1, one P2 and three P3. All nine requested repairs from round 2 are present and pass their original counterexamples. The additional findings concern an unowned Leopoldt input, coefficient conjugation, a source locator, a field-degree Check and an incomplete inventory of the pinned Selmer carriers. The authored package files were not changed.

## Previous findings, checked first

The following locators refer to `packages/InertAnticyclotomicCMMainConjecture/README.md` unless otherwise stated. Each quotation is from the repaired package, not a source.

| Round-2 finding | Status | Repaired passage and verification |
|---|---|---|
| R01, extraction artefact | Repaired | Line 343 retains “δ_χ(ξ)=L(φ̄χ,1)/Ω”; the false sentence alleging that BKO prints no conjugation is gone. Line 394 retains conjugate(φχ). Inverse covariance at χ(γ)=ζ₅ gives ζ₅, not ζ₅⁻¹, in the interpolation coordinate. The previous review's visual verification of the overbars is retained. |
| R02, coefficient prime and μ | Repaired | Line 33: “Λ_R/(π) has μ-invariant e.” Lines 31–33 distinguish ϖ_R from π, and lines 492, 570, 593, 605 and 798 consistently use the vertical prime (ϖ_R). For R=O[√π], the length is 2 and (π)=(ϖ_R²) is not prime. |
| R03, inert Frobenius trace | Repaired | Line 133: “of trace −2p, which is −10 at p=5.” Expanding (X+5)² gives X²+10X+25 and trace −10. The rational-prime trace is separately identified. |
| R04, derivative after coefficient extension | Repaired | Line 196: “δ(v_+) is a unit of R.” The additional O-valued assertion is restricted to an extended O-basis. Multiplication by 1+√π gives derivative 1+√π when the original derivative is 1. |
| R05, cofinal modulus shift | Repaired | Line 334: “raising its exponent by one only shifts the cofinal indexing and leaves ξ and δ(ξ) unchanged.” The defining moduli at lines 321, 323 and 327 are f p^(n+1). Corestriction reconstructs the deleted first coordinate with multiplier 1, not 6/5. |
| R06, characteristic ideals at the pin | Repaired | Line 61 cites “`TauCeti.Iwasawa.charIdeal`” and the actual multiplicativity, quotient and semilinear declarations. Suggested.lean lines 16–17 and 26–27 acknowledge that carrier. The definitions and signatures were reopened at the pin; see below. R05 of this review identifies a separate omission concerning Selmer carriers. |
| R07, local-control cokernel | Repaired | Line 642: “the restriction map L_n^s→L_∞^s[ω_n^s] is an isomorphism.” Line 644 supplies the additional divisibility argument. At p=5,n=2 the coranks are 20 and 5; a finite divisible cokernel Q has Q=ϖ_R^kQ=0. |
| R08, localization cokernel | Repaired | Line 522: “which may be zero or nonzero”. Localization images H^ε and T H^ε give cokernels 0 and Λ_R/(T), respectively. |
| R09, logarithm versus discrete Kummer class | Repaired | Line 228: “By contrast [π]Q⊗π⁻¹=Q⊗1=0”. The primitive class Q⊗π⁻¹ is nonzero, and the general complementary-lattice divisibility criterion is stated. Nonzero logarithm alone is no longer used to detect a nonzero tensor class. |

No finding in the last repair report was marked not actionable in this package. None below re-raises such a settled finding. I searched the rest of the package for each repaired pattern; the old μ=1, O-unit, cofinal Euler-factor and forced-nonzero-cokernel assertions do not remain.

## Verified sound

### Coverage, principles and shape

Read all 36 numbered targets, their 36 target Needs lines, all API and Checks blocks, the conventions, supplier contracts and worked examples. There are seven layers, seven Examples endings, seven Dependencies endings and 36 Checks blocks. Each substantive definition has an API and at least three Checks. The organization proceeds from arithmetic transport and primitive coordinates to global units, duality, the main conjecture, control and rank bounds; the internal dependencies force this direction. There is no assertion that the roadmap follows a source's organization and no chapter-named layer.

The full inert Gross datum over H and arbitrary finite R/O are retained. The E/K restriction is explicit for the finite-level rank/control application. I found no route-specific good-prime shortcut, re-planned existing roadmap, algorithm, sorry'd data, set_option, own backticked declaration absent from the Lean file, PR number, machine path or hand-off text in the authored roadmap. The three main-branch style comparisons were EllipticCurves, ClassFieldTheory and PadicMeasuresIwasawaAlgebras. The two supply/coefficient defects above still require repair.

The previous round's computed rows were used only for unchanged assertions actually covered by those rows. All changed assertions and all 15 seeded targets were re-examined. The table below records the new computations, including the findings and headlines; arithmetic module models test the stated algebra, not the existence of a curve realizing every model.

### Computed adversarial table

| Statement | Instances tried | Values on the two sides / excluded model | Result and change |
|---|---|---|---|
| Conventions; 0.1 datum | K=ℚ(√−23),p=5; p=2,3 | Reduced-form count 3; −23 mod 5=2 is outside {0,1,4}; [H:ℚ]=3·2=6. p=2,3 fail p≥5. | Arithmetic scope sound; degree wording R04. |
| 0.1 Frobenius and coefficients | p=5; R→R′ | (X+5)²=X²+10X+25, trace −10; T′-coefficient quotient after extension has R′-corank 1. Quotient by the old lattice has nonzero vector-space quotient L′/L. | Repairs pass. |
| 0.2 towers | n=0,1,p=5 | Local anticyclotomic degrees 1,5 versus tame division degree 24; cγc⁻¹γ=1 versus γ²≠1. | Mathematics consistent; locator R03. |
| 0.3 conductor convention | Orders 1,5,25 | c=0,2,3; signs +,+,−; Agboola–Howard character-set labels −,−,+. Point labels stay the same. | Both directions of dictionary agree. |
| 0.4 trace dual | R=O and O[√π] | Differents O and (2√π); inverse-different quotient has 25 elements at p=5. Trace of 1 is 2, pairing 2/p^k versus 1/p^k. | Twist and trace preserved. |
| 0.5 scalar kernels and basis | a=p,T; u=1+√π | p(χ⁻¹)=p≠0; T has exactly the trivial-character zero. With δ(v)=1, δ(uv)=1+√π∈R× and δ_1(uv)=6(1+√π)/5. | Scalar-kernel converse and repaired R-unit Check hold. |
| 1.1 signed Kummer tensors | n=0; Q and [π]Q | L_0⁺=0; corank L_0⁻=1. Q⊗π⁻¹≠0 has order π; [π]Q⊗π⁻¹=0. In free complementary lattice, y=π^m e gives zero quotient class iff j≤m. | Repaired primitivity test exact. |
| 1.1 transition maps | One-level inclusion; base logarithm b | Restriction gives b; formal trace gives pb=5b at p=5. | Map directions distinguished. |
| 1.2 comparison | u=2,π; non-stable cubic R | 2L_n^s=L_n^s; ker[π] has 25 elements for R=O. Cubic Kummer lines mod 3 are {(0,0),(1,1),(2,2)} and {(0,0),(2,1),(1,2)}, unequal. | Linear-unit independence holds; conjugation Check R02. |
| 1.3 away-p vanishing | Good q=4; inertia scalar a | Absolute values of α and q/α both 2≠1, so rational H⁰=H²=H¹=0. Integral ker(a−1) may have length v_R(a−1)>0. | Rational/integral distinction retained. |
| 1.4 Selmer kernel | n=0; full versus zero local conditions | Sel_+=Sel_str and Sel_−=Sel_ord. Full conditions give H¹; identity localization with zero condition gives 0. | Arithmetic definition sound; pinned owner R05. |
| 1.5 dual convention | χ(γ)=ζ₅ | Dual value ζ₅⁻¹=ζ₅⁴ versus ζ₅; annihilator of away-p zero is the full compact group. | Correct variance and strict/relaxed swap. |
| 2.1 primitive class | ν=1; compatible family and tail | R[Gal(K/K)]=R, evaluation=id; tame denominator 24 invertible. Reconstructed first coordinate cor(z_fp²)=z_fp, multiplier 1. | Cofinal repair passes; no extra Euler factor. |
| 2.2 special values | χ=1 and order 5 | Deleted p-factor 1−(−5)/25=6/5 at 1; local factor 1 for ramified χ. | Formulas agree with source conventions. |
| 2.3 sign and nonvanishing | ε=+,order 25; ε=−,χ=1 | (−1)³·1=−1 gives zero; ε=− gives trivial derivative zero. πv≠0 in a free line but is not a basis. | Sign versus primitivity separated. |
| 2.4 coordinate | ξ=Tv; v′=(1+T)v; ramified R | Coordinates T and T/(1+T), ideal (T). For e=2, (ϖ_R) strictly contains (π)=(ϖ_R²). | Unique integral coordinate and basis covariance. |
| 2.5 interpolation | χ(γ)=ζ₅; ε=−,χ=1 | δ_(χ⁻¹)(γv)=ζ₅δ_(χ⁻¹)(v). At 1 on minus line, both derivatives 0 while model L_p=π has L_p(1)=π≠0. | No wrong-character evaluation or 0/0. |
| 3.1 full family | S=Λ, one smoothed class Tv versus unit-factor generator | One generator contributes char(S/TC)=(T)char(S/C); adjoining a unit-factor generator removes that factor. | Full auxiliary family necessary. |
| 3.2 Gross descent | h=3,p=5 versus h=5 | 1/3∈R, 1/5∉R; tame degree 24 is a 5-unit. | Integral averaging hypotheses discriminate. |
| 3.3 compact local comparison | p=5; scaled signed lattice | Nontrivial tame character order 24 gives invariants 0; ranks 2=1+1. Scaling a line by π gives nonzero Λ/(π), local vertical length e. | Integral comparison and matching labels consistent. |
| 3.4 ranks | Rank-one module (ϖ_R,T) | Generic rank 1; minimal number of generators 2. Euler rank difference 1 complex place × rank 1=1. | No unsupported freeness assertion. |
| 3.5 strict comparison | K=ℚ(√−23),p=5; LT/trivial residual characters | Degree 3·24=72 prime to 5. LT character has order 24, trivial one order 1. char(Λ/(π))=(ϖ_R^e), μ=e, versus zero module after inverting p. | Correct nonsplit equality component and integrality. |
| 4.1 exact sequence | loc(S_rel)=H^ε and T H^ε | Localization cokernels 0 and Λ/(T); final dual map surjective in either case. | Repaired Check passes. |
| 4.2 opposite torsion, headline | ε=± | (rank S_ε,rank X_ε)=(1,1); S_(−ε)=S_str=0 and rank X_(−ε)=0. A torsion submodule of H=Λ² is 0. | Rank and saturation argument agrees with AHII05. |
| 4.3 involution and input | f=T−5; K_1; tame cubic coefficients | Inverted root −5/6≠5. At p=5, cγc⁻¹=γ⁴≠γ. c(a)/a=a⁴ is not a cube, so no automorphism of R. | R01 supplies missing theorem; R02 corrects coefficient comparison. |
| 4.4 characteristic formulas, headline | H^ε=Λ,S=(T),C=(T²),char X_str=(T) | char(S/C)=(T); char X_(−ε)=(T)(T)=(T²)=char(H^ε/C). With C=πS, vertical multiplicity is e. | Exact-sequence calculation holds. First identity retains §4.3 inputs. |
| 4.5 primitive lattice | Smoothing α≡2 mod 5; wrong common factor ϖ_R | N(α)−φ(α)≡4−2=2 is a unit; cyclic quotient char=(L_p). Common factor ϖ_R would give (ϖ_R L_p). | Required integral unit-factor test passes; rational equality alone would not suffice. |
| 4.6 main conjecture, headline | R/O degree 2,L_p=T; R=O[√π],L_p=π | Restricted characteristic ideal (T²), not (T). For π, vertical length 2 and ideal (ϖ_R²); μ=2. | Repaired coefficient normalization agrees. |
| 5.1 products | p=5,n=0,1,2 | (ω⁺,ω⁻)=(1,T),(1,γ⁵−1),(Φ₂₅(γ),γ⁵−1); last degrees 20+5=25 and product γ²⁵−1. | Empty product and both root-set directions correct. |
| 5.2 local control | n=0,1,2, both signs | Corank pairs (0,1),(0,5),(20,5). Finite divisible Q has Q=ϖ_R^kQ=0. Nonfree model 𝔪/T𝔪=R⊕R/ϖ_R instead has nonzero finite quotient. | Strengthened isomorphism and negative control correct. |
| 5.3 global control | n=0,±; ramification e=2 | Plus quotients 0; minus uses T-coinvariants. Proper W-submodule ϖ_R⁻¹R/R has length 1, while π⁻¹R/R has length 2. | Uniformizer repair and dual direction correct. |
| 5.4 finite decomposition | p=5,n=2,R=O | Mod γ⁵−1, Φ₂₅(γ)=5. Error ring 𝔽₂₅[T]/(T⁵) has 25⁵=9,765,625 elements and rationalization 0. | Finite errors and rational direct sum distinguished. |
| 5.5 specialization length | 0,A/(t²),κ²; split character coefficients | (dimension,length)=(0,0),(1,2),(2,2). For f=T−(ζ₅−1), orders at χ,χ⁻¹ are 1,0 when coefficients contain ζ₅. | Inequality sound; inverse-order symmetry properly restricted to extended O-generators. |
| 5.6 strict specialization | X_str=Λ/(g²); χ=1 | Fiber dimension 1≤length 2; injective restriction bounds finite-level dimension by 1. At 1, inverse character equals itself. | No surjectivity assumption needed. |
| 6.1 divisor containment | char X_str=(T), complementary factor T² | (T³)⊆(T); orders 1≤3. | Direction correct. |
| 6.2 CM correction | n=0,2,p=5 | CM local dimensions 1,25; each character occurs once. Underlying ℚ_p dimensions 2,50. | Correction bound is 1 over CM coefficients. |
| 6.3 matching bound | ε=+,χ order 5 | χ(ω_2⁻)=0; ordinary and minus local χ-lines both have dimension 1; ord=0 forces Selmer dimension 0. | No extra dimension in matching parity. |
| 6.4 rank bound, headline | χ=1,ε=±; χ order 25,ε=+ | Bounds ord_1 L_p and ord_1 L_p+1; order 25 gets +1. At order of vanishing 0, matching rank=0 and opposite rank≤1. | E/K restriction and parity branches match BKO21. |
| New characteristic-ideal contract | 0,Λ/(T²),Λ/(ϖ_R,T) | Ideals (1),(T²),(1). Exact sequence with two Λ/(T) factors gives (T²)=(T)(T). Free Λ is not torsion and is excluded from arithmetic characteristic formulas. | Pinned total definition not confused with its torsion interpretation. |

Zero rings, positive-characteristic coefficient fields, inseparable extensions, q=1 and nonabelian tower groups fail the standing number-field/DVR/ℤ_p-tower hypotheses. The nonabelian group in R01 is the group over ℚ, not the permitted cyclic group over K. Ramified coefficient rings, including the cubic ring in R02, satisfy the coefficient hypotheses and therefore cannot be dismissed. The source's nontrivial-character root-number formula is not used at the trivial character. Every interpolation denominator used is nonzero in its stated parity.

### Seeded sources and exact locators

The five cached sources were read at their numbered extractions. No locator is flagged unverified in the authored files. All five cited References entries have matching manifest keys; the direct Brumer invocation is the additional recording issue addressed in R01. No source was fetched or manifest entry changed.

| Seeded target | Source lines and printed locator inspected | Result |
|---|---|---|
| 0.1 inert datum | BKO21 lines 373–416, §3.0.1–3.0.2, pp.950–952; lines 802–822, pp.960–961 | Gross datum, smooth model, period, class-number condition and larger R agree. R04 concerns the example, not these hypotheses. |
| 0.2 towers | BKO21 lines 828–829 and 845–860, §§6.0.1–6.0.2, pp.961–962 | Correct identifications under p∤h_K. The p.950 subsection citation is R03. |
| 1.2 comparison independence | BKO21 lines 860–866, §6.0.2, p.962 | The R-linear independence assertion is explicit. It supplies no conjugation automorphism of arbitrary R; R02. |
| 2.1 primitive class | BKO21 lines 398–416, 435–478, pp.951–953; lines 823–836, p.961 | Trivial auxiliary character, m=0 composite and primitive modulus support match. |
| 2.3 sign/nonvanishing | BKO21 lines 831–834, p.961; AHII05 lines 151–169, Proposition 3.1 and Remark 3.2, p.614 | Correct parity translation; general datum's nonvanishing comes from the named NCM supplier, not an unqualified E/ℚ import. |
| 2.4 integral coordinate | BKO21 lines 833–839, §6.0.1, p.961 | Free line, coordinate and principal ideal agree. |
| 3.3 compact comparison | AHII05 lines 190–213, Proposition 3.4 and (3.2), p.615; BKO21 lines 791–797, Theorem 5.8, p.960; lines 860–866, p.962 | Local rank/splitting and signed Kummer conditions support the stated transport. R-extension and trace lattice remain explicit targets. |
| 3.5 strict comparison | AHII05 lines 180–189, Proposition 3.3, p.615; RUB91 lines 486–551 and 565–571, §4 and Theorem 4.1(ii), pp.36–37 | Nontrivial decomposition component, prime-to-p finite descent and nonsplit theorem are retained. AHI06 lines 1081–1128, 1234–1238 and 1290–1308 give the twist and matching correction-divisor templates in the ordinary setting. |
| 4.2 opposite torsion | AHII05 lines 216–231, Theorem 3.6, p.616; lines 274–280, p.617 | Ranks, compact vanishing and S_ε=S_rel follow with the integral splitting. |
| 4.3 relaxed torsion | AHII05 lines 233–246, Theorem 4.1, p.616; BIL86 lines 366–381 and 618–642, Proposition 3.8 and Theorem 3.24, pp.353,364–365; AHI06 lines 415–417, Lemma 1.2.1, p.1010 | Coprimality, field-level Leopoldt and involution are real inputs. R01 and R02 address the missing ownership and coefficient transport; no unrestricted R-automorphism follows from these sources. |
| 5.2 local control | AHII05 lines 318–338, Lemma 5.1, pp.618–619; lines 213 and 329–332, Conjecture 3.5 and its use | Source gives finite cokernel under splitting. The roadmap's stronger isomorphism follows from its additional divisibility calculation. |
| 5.4 finite decomposition | AHII05 lines 392–408, Proposition 5.3, p.620 | Finite kernel and cokernel, with cofinite-type hypotheses; rational splitting correct. |
| 5.5 specialization length | BKO21 lines 902–908, proof of Theorem 6.2, p.963; pinned length declarations below | This is the local-length argument underlying the source bound. Infinite length is ℕ∞, not a junk finrank 0. Character-prime/order identification is a declared gap. |
| 5.6 strict specialization | BKO21 lines 894–908, pp.962–963; AHII05 lines 322–337, p.618 | Restriction injection and inverse-character duality suffice; no unproved finite strict-control cokernel is imported. |
| 6.3 matching bound | BKO21 lines 888–908, Theorem 6.2, pp.962–963; AHII05 lines 343–408, Theorem 5.2 and Proposition 5.3, pp.619–620 | E/K hypothesis, matching sign and absence of +1 agree. |

The other headline locators were also read: AHII05 Theorem 4.2 at lines 247–280, pp.616–617; BKO21 Theorem 6.1 at lines 881–886, p.962; BKO21 Theorem 6.2 at lines 888–908, pp.962–963. AHI06's ordinary-prime arguments are used as proof templates, with inert/Gross adaptations stated here, not as already-proved inert imports.

### Pins, headline coverage and Lean

The actual checkout HEADs agree with the manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The newly found Selmer files are tracked and clean at that Tau Ceti pin.

Opened these declarations and their hypotheses. Library paths in this table are relative to the respective library repository.

| Pinned declaration | File and line | What was verified |
|---|---|---|
| `Module.length`, `Module.length_le_of_surjective`, `Module.length_eq_finrank` | `Mathlib/RingTheory/Length.lean:31`, 202, 293 | ℕ∞ length; surjectivity retained by include; finite module needed for finrank. Line 288 handles unrestricted rank. |
| `IsLocalRing.length_restrictScalars` | `Mathlib/RingTheory/LocalRing/Length.lean:54` | Local-map and scalar-tower hypotheses; residue-field length factor. |
| `Polynomial.cyclotomic`, `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227`, 525 | Native polynomial; prime-power product over a commutative ring. |
| `Module.Basis` | `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | Representation equivalence supplies actual coordinates. |
| `Ideal.span_singleton_mul_left_unit` | `Mathlib/RingTheory/Ideal/Span.lean:100` | Explicit unit hypothesis. |
| `IsGalois.normalBasis` | `Mathlib/FieldTheory/Galois/NormalBasis.lean:121` | Finite Galois extension. |
| `IsDedekindDomain.selmerGroup` | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161` | S-unit valuation conditions modulo powers, distinct from cohomological local conditions. |
| Local principal-domain regularity instance | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:80` | Local domain and principal-ideal-ring assumptions. |
| `TauCeti.PowerSeries.isRegularLocalRing`, `ringKrullDim_of_isDiscreteValuationRing` | `TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean:157`, 169 | Regularity and dimension 2 for the coefficient DVR's series ring. |
| `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` | `TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean:59` | Requires dimension at most 2; Λ_R meets it. |
| `TauCeti.Iwasawa.charDivisor` | `TauCeti/RingTheory/Iwasawa/Char/Divisor.lean:87` | Finite support and finite local lengths for finite torsion modules; the total definition uses toNat outside that domain. |
| `TauCeti.Iwasawa.charIdeal` and operations | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85`, 125, 132, 152, 198 | Definition; pseudo-isomorphism; exact multiplicativity; semilinear comap direction; nonzero principal quotient in noetherian UFD. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Compatible finite-level carrier; no arbitrary-coefficient compactness assertion. |
| `TauCeti.IsCompactModule.completedGroupAlgebraModule` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` | Compact-module and continuous-action data used. |
| `WeierstrassCurve.Affine.selmerGroup₂`, `selmerGroupA` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104`; `SelmerGroupA.lean:144` in that directory | The two advertised descent carriers exist, but are not exhaustive. |
| `TauCeti.ContCohomology.SelmerStructure` and its kernel | `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`, 86, 97, 103 | Actual localization data and H¹ local conditions; R05. |
| `WeierstrassCurve.selmerStructure`, `selmerGroup`, Kummer characterization | `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:147`, 176, 199 | All m; Kummer characterization requires ellipticity and invertibility of m; R05. |
| `TauCeti.GlobalNumberFields.HeckeCharacter` | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70` | Continuous characters of the idele class group; no Gross/signed construction supplied by this carrier alone. |

Object searches covered both pins and the indexed roadmap heads, including Selmer local conditions, elliptic units, signed Selmer groups, Rubin functions, characteristic ideals and restriction of scalars. In particular the stronger Selmer near-match was opened rather than relying on the previous inventory. There is no own Lean declaration to collide with another roadmap's namespace.

The four headlines are §4.6 (integral main conjecture), §6.4 (finite-character rank bounds), §4.2 (opposite torsion and compact vanishing) and §4.4 (signed characteristic formula). All four are explicitly named in the module docstring. Even with the corrected pinned Selmer inventory, each needs the actual CM signed local conditions, elliptic-unit class or Rubin function and the associated arithmetic representations/towers. These are substantial constructions, not a few simple predicates. No missing statable headline or stand-in theorem was found.

Ran the prescribed `lake env lean` command on Suggested.lean from the content checkout: **exit 0, no output, no warnings**. The file has exactly `import Mathlib`, its module docstring and the required namespace. It has **zero declarations and zero sorry occurrences**. Consequently the exhaustive one-tactic padding probe and the `#check @name` binder comparison each have **zero cases**. No imported TauCeti object needed building, and no Lean process remains running. R05 changes the documentation and attribution, not this elaboration result.

### Supplier resolution, ownership and merge order

Read the board package index before searching ownership. `roadmaps show` and `roadmaps grep` were used for the actual indexed heads, and `roadmaps resolve` found no unresolved cross-roadmap citation or roadmap Lean name. Its library-name check was unavailable, so the independent pinned checks above were necessary.

The following citations were resolved afresh; section numbers below are not remembered substitutes for reading the heads.

| Supplier and available head | Resolved locations and content |
|---|---|
| AnticyclotomicLocalUnits, PR #1692 | `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:148`, 237, 297–361, 458, 498–524, 591, 648–694, 1075–1123 resolve §§0.1,0.5,1.2–1.5,2.4,3.1–3.2,3.6,4.2–4.4,8.2,8.4–8.5. Inverse derivative covariance, direct logarithm covariance and same-parity point kernels agree. Its scope at line 7 leaves global Selmer groups and L-functions downstream. |
| NonordinaryCMSpecialValues | `packages/NonordinaryCMSpecialValues/README.md:168`, 247, 257, 368–406, 453–473, 709 resolve the period, root signs, normalized class, reciprocity/twist/period change, semilocal splitting, inert Frobenius, Honda comparison and central nonvanishing. The cited NCM identifiers remain in its plan. Fixed-support corestriction has factor 1. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/plan.json:1125`, 1230, 3332 resolve LT.2/lt-character, LT.2/reciprocity-comparison and LT.8/bko-fields. In particular [Θ_n:Φ]=p^(2n), [Ψ_n:Φ]=p^n, with the anticyclotomic inversion action. |
| ComplexMultiplicationAndExplicitReciprocity, PR #1254 | `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:634` and 684 resolve §§4.1 and 4.3. The cited Frobenius and Tate-component titles exist. `IsCanonicalGrossCharacter` and `canonicalGrossExistence` occur in its Suggested.lean at lines 50 and 70. The consumer's noncanonical Gross scope is distinguished from canonical existence. |
| SelmerIwasawaCohomology, PR #869 | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:343`, 372, 411, 427, 441, 469, 591, 717, 821, 1329, 1373, 1426, 1562, 1582, 1600, 1758 resolve §§2.1–2.6,2.10,2.13,2.19,3.0,3.1,3.3,3.10–3.12,3.16. Read the trace-dual distinction, propagation/divisibility, Poitou–Tate and retained control/Tor errors. R05 updates the underlying pinned carrier. |
| ArithmeticGaloisDuality, PR #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1303`, 1401, 3118, 3436, 3505, 6232, 6354 resolve R02.2.2–2.3, R02.4.2–4.4 and D7.7.1–7.2. Restriction/corestriction index and ordered pairings match the conventions. |
| EulerSystemsAndKolyvaginSystems, PR #1272 | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1606`, 4558, 4983, 5466 resolve §§2.2,8.1,8.11,8.25. The anticyclotomic tower is not declared admissible: the two-variable route or condition (*) is used. Its weak Leopoldt output is not R01's field-level theorem. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909`, 2485, 2620, 2710 and the base-change/norm paragraphs at 2818–2835 resolve §§1.7,4.3,4.5,4.6. Generic characteristic-ideal operations now point to the pin; finite DVR base change is supplied, restriction of scalars there has base ℤ_p. |
| EllipticCurves and ClassFieldTheory, main | `TauCetiRoadmap/EllipticCurves/README.md`, Layers 1,3,4,7, supplies the cited formal-group, Frobenius, reduction and Selmer interfaces, subject to R05's implemented carrier. `TauCetiRoadmap/ClassFieldTheory/README.md:1150`, 1781, 1834, 1924 resolves Layers 6,11–13: local/global reciprocity, existence and class fields. |
| IntegralIwasawaTheory, PR #1306, checked as a possible owner | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:704`, 712, 724–726: algebraic Baker–Brumer, real-abelian resolvents and abelian E/ℚ Leopoldt. This proves the scope distinction in R01 and identifies the earlier supplier for the extension contract. |

The overlap report has no conflicting head, dropped cited id or revision-only id. The closest-roadmap scopes were compared: HeegnerPointEulerSystems, PR #1423, `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:3–14`, constructs Heegner point families; ModularIwasawaMainConjectures, PR #1499, `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:634`, constructs cyclotomic Coleman-kernel signed conditions. These are not the anticyclotomic elliptic-unit construction owned here. No conflicting shared ownership was found among these heads. No package under review in the board index supplies the missing Leopoldt extension.

The four existing gap slugs match the plan and README contracts:

- `elliptic-unit-euler-system`: extends NCM's restricted-modulus normalized class to the all-auxiliary family and twisted tower.
- `inert-two-variable-main-conjecture`: exactly Rubin's nonsplit theorem on the specified decomposition components.
- `restriction-of-scalars-finite-extension`: arbitrary DVR base O, beyond the supplied ℤ_p-base norm theorem.
- `character-prime-multiplicity`: identifies the local divisor multiplicity with the analytic order at a finite-character point.

All four are precise and owned. Their absence as implementations is not a finding. R01 requests a separate contract for an input none of them covers.

Dependency-check output with the prescribed name, order, movable and content arguments:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The named prerequisites are on main or earlier in the order; the downstream-consumer paragraph is not a reverse supply edge. A mechanically clean graph cannot detect the unnamed prerequisite in R01.

## Not verifiable

- BRU67 is waived by the operator. Its text was not requested, fetched or independently certified. R01 concerns ownership and citation recording, not access or an alleged error in Brumer.
- The BKO extraction loses overbars. The previous round's rendered-PDF evidence for pp.953 and 961 is retained; the present environment has no available pdftoppm or installed Python PDF renderer, so I did not repeat that visual inspection. I did not infer a misprint from the extraction.
- RUB91's OCR is sufficient to read the §4 hypotheses, component condition, sequence (5) and Theorem 4.1(ii). Some §1 formulas are garbled, so their individual typography is not certified. No new source request is needed for this already recorded source.
- The declared gaps and the roadmap's Gross/R transport, integral lattice comparison and future proofs remain contracts and targets, not formalized results. The computations and source checks establish the evidence described above; they do not certify those future proofs.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the control-product exponent uses p^k; it should be p^n for the fixed level n; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry input is AHI06 Lemma 2.1.2; it should be Lemma 1.2.1; affects nothing.
- **Misprint** in BIL86 at Introduction, p.342: the source says the pseudo-isomorphism and characteristic-series results are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b47b3cddd394e958cdf2d316db4ac55f288e57cd", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
