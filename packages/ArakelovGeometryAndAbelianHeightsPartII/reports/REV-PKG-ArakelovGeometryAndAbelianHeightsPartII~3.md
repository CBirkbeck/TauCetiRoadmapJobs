<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6397992377 -->
Review (codex) of 0738d90

Verdict: needs_changes

1. **F01** (P2) Give the zero-dimensional intersection its correct arity

   **Location:** `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:569`, “a canonical multilinear map P̂ic(X/k) × P̂ic(X/k)_intᵈ⁻¹ → ℝ”. The same missing dimension qualification occurs in the mixed term of §4.3, line 712, and the geometric Siu statement in §0.3, line 193.

   **Claim:** This displayed domain defines the extension of model intersection for every flat essentially quasi-projective integral X over a field, with d its absolute model dimension.

   **Witness:** Take X = Spec 𝔽₄ over k = 𝔽₂. Then d = 0, Pic(X) = 0 and dim_k H⁰(X,O) = 2. The nullary intersection is 2; a unary additive map from Pic(X) is zero.

   The negative exponent is undefined as written. Interpreting d−1 as natural subtraction would leave the distinguished first argument and produce the incorrect value 0. Section 4.2 instead gives volume 0!·2/m⁰ = 2. Thus this is a missing case in the interface, not a reason to discard zero-dimensional varieties. The cited yuan-zhang-2025 Proposition 4.1.1, printed pp. 103–104, repeats the unqualified arity at lines 3854–3863; citing it does not resolve the case.

   **Exact repair:** State the one-arbitrary-entry extension for d ≥ 1. Separately retain the d-fold integrable intersection for d = 0 as the degree of the fundamental zero-cycle, importing SchemeAndStackFoundations §5.2 rather than reconstructing degree. State explicitly that Spec F, for finite F/k, has empty intersection [F:k]. Keep the d = 0 Hilbert–Samuel and volume statements. Qualify the displayed Siu mixed term by d ≥ 1 and give its zero-dimensional conclusion separately. Check the empty products used in §§11.2 and 12.2–12.3 against this convention; do not impose positive base dimension on the potential-bigness theorem.

   **Repair test:** Spec 𝔽₂ and Spec 𝔽₄ over 𝔽₂ give empty intersections and volumes 1 and 2. Pullback along Spec 𝔽₄ → Spec 𝔽₂ gives 2 = 2·1. Every line bundle on either scheme is trivial, so its difference has the same respective volume, 1 or 2. In positive dimension the existing Spec ℤ test remains vol(O(2)−O(1)) = 1 = 2−1. Add these as discriminating README Checks.

2. **F02** (P3) Correct three remaining source-line anchors

   **Location:** `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:993`, line 1425 and line 2050: “gao-habegger-2019 line 2510”; “yuan-2026 line 1619”; “p. 89, line 2978”.

   **Claim:** These extraction lines locate, respectively, the Moriwaki appendix, local φ definition, and displayed arithmetic Noether normalization.

   **Witness:** Gao–Habegger line 2510 belongs to §11 over ℚ̄; Yuan line 1619 discusses resistance; Yuan line 2978 is a function-field slope inequality. None is the indicated passage.

   **Exact repair:** Replace the first anchor by gao-habegger-2019 lines 2596–2614 and 2639–2655 (§§A.2–A.3, printed pp. 56–57); the second by yuan-2026 lines 1642–1689 (§3.3.1, printed pp. 48–49); and the third by yuan-2026 lines 2992–3001 (printed p. 89). Preserve the correct section/theorem locators and the two settled uncertified entries. No source-manifest entry needs rewriting.

   **Repair test:** The replacement ranges contain the ample comparison setup and specialization transfer, the diagonal-integral and positive-eigenvalue formulas for φ, and 12 deg λ = ω² + δ − 4g[K:ℚ]log(2π), respectively. This is a recurrence elsewhere of the locator pattern repaired under previous F08; F08's own height anchors are now correct.

Two findings: one P2 and one P3. All eight findings in the supplied round-2 review are repaired. The new blocking finding concerns the arity of the intersection pairing in dimension zero, not either declared supplier gap. The four package inputs were left unchanged.

## Verified sound

The review covered all 91 numbered subsections, all 91 `*Needs:*` lines, the conventions and supplier contracts, the 14 layer examples/dependency endings, and the Lean/metadata/source-manifest files. The previous review has computed adversarial rows for all 91 subsections. Its unchanged, nonsampled statements were carried forward only from those computed rows, not from its prose summaries. The repaired passages, their downstream uses, all 15 newly seeded targets and the headline results were examined again. The tables below record the new computations without reproducing a 91-target ledger.

The package is an extension of its parent: continuous metrics, arbitrary-base completions and relative admissible theory begin where the parent stops. No route restricted to good primes, replacement of the existing roadmap, computational algorithm, copied source passage, sorry'd data, or `set_option` was found. Characteristics 2 and 3, inseparable degree factors, real-place quotients, and singular projective inputs remain in scope. The integral/nonempty hypotheses exclude the zero ring and empty variety; they were not silently used as examples of varieties.

### Previous findings, checked individually

Locations in this table are in `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md`. Quotes are from the repaired package, not the repair report.

| Previous finding | Repaired passage | Independent check and status |
| --- | --- | --- |
| F01, Noether base | Line 1613: “Ξ_S ∈ D̂iv(S/ℤ)”; line 1623: “D̂iv(S/ℤ) → D̂iv(S_ℚ/ℚ)” | **Repaired.** On Spec ℚ the geometric group is zero, whereas the arithmetic local value at a genus-two unit type-0 node is 1+1/6=7/6. The inverse section and sign independence agree with yuan-2026 lines 3030–3074. |
| F02, height normalization | Line 764: “h_L̄ = h_K/[K:ℚ]” | **Repaired.** On [1:2] over a quadratic number field, relative height 2log 2 divided by 2 equals log 2. The current supplier still uses relative height. |
| F03, local comparison domains | Line 809: “p_v : X_Cv^an → X_Kv^an”; “equals the pullback by p_v” | **Repaired.** At a real place, i and −i are distinct upstairs and one point q downstairs; pushforward of their half-masses is δ_q. The measure and equidistribution comparisons now use pushforward, including at line 887. |
| F04, signed versus positive measures | Line 511: “polarize the positive top powers”; “prove decomposition independence” | **Repaired.** On ℙ¹×ℙ¹, 2H₁H₂=(H₁+H₂)²−H₁²−H₂²=2−0−0. A negative mixed degree is constructed by signed differences, not supplied as a positive top power. |
| F05, vertical integrability | Line 1294: “E an integrable adelic divisor”; line 1295: “modulo principal trivializations” | **Repaired.** The Fourier example at line 1304 is continuous and conjugation-invariant, but its curvature coefficients −2π²8ⁿ are unbounded, excluding a finite signed curvature measure. The integrable kernel excludes it. |
| F06, rational scaling | Line 318: “multiplication by nonnegative integers”; line 319: “in this rationalized carrier” | **Repaired.** Pic(ℙ¹)=ℤ contains degree 1 but no degree 1/2. In Pic⊗ℚ, twice the class of degree 1/2 has degree 1. |
| F07, missing APIs/Checks | Line 975: “changing the initial height by a bounded function leaves the limit unchanged”; line 1272: “underlying line O(x(S)) and fibre degree 1” | **Repaired.** §6.3 now tests 0,a,4a, relative factor 2, and failure of the torsion converse for a zero polarization. §8.5 tests degree 1 versus 0, evaluation shift 1 versus 0, and adjunction −1 versus +1. §6.1 distinguishes nef from big. |
| F08, height source anchor | Lines 751 and 809: “yuan-2026 lines 2146–2170” | **Repaired.** Those lines explicitly distinguish division by [K(x):ℚ] from division by [K(x):K]. The old line-2131 anchor is absent. R02 concerns different remaining anchors. |

The repair report's supplier-gap implementation deferral remains settled. Its reason is correct: both gaps are named contracts in the plan and README; their suppliers' unfinished implementation is not a package defect. No settled finding is re-raised.

### Seeded source verification

Page numbers below are printed pages of the precise versions recorded in `sources.toml`, not PDF viewer offsets. The manifest contains 20 works: 18 cached certified texts and two settled uncertified originals. Every seeded locator was readable through the supplied legal cache or its explicitly identified available comparison text.

| Seeded target | Text opened at the locator | Result, hypotheses and normalization |
| --- | --- | --- |
| 1.6, global/finitely generated fields | yuan-zhang-2025 §2.3, pp. 32–36, lines 1103–1145; §2.5.3, pp. 43–44, lines 1533–1572 | The pro-open model/filtered-colimit construction and common-open isometries support the arbitrary-base carrier. The base k is retained; Spec K over ℤ is not identified with Spec K over trivially valued K. |
| 1.7, complex base | yuan-zhang-2025 §2.7, pp. 54–62, lines 1953–2010, 2037–2100 and 2110–2210 | The valued base, continuous Green data, mixed rational/integral coefficients and boundary completion agree. The complex valued case is distinct from the trivially valued geometric case. |
| 1.9, nef domination | yuan-zhang-2025 Lemma 5.1.7(1), p. 138, lines 5315–5349 | Supports dominating both signs by a nef effective model divisor. Effectivity is required on the model and at infinity. |
| 4.2, volume | yuan-zhang-2025 Theorem 5.2.1, p. 141, lines 5439–5456 | Finite limit and comparison with representing model volumes agree. The volume itself has a valid d=0 value; R01 is its missing intersection counterpart. |
| 4.9, comparison | yuan-zhang-2025 §2.5.3, lines 1533–1572; §5.3.1, p. 152, line 5945 onward; yuan-2026 §4.1.2, pp. 63–64, lines 2146–2170 | Model-data comparison is compatible with completion, scalar pullback of metrics, pushforward of measures, and arithmetic degree division. Also checked the current ArithmeticDynamics and Heights contracts rather than assuming their normalizations. |
| 6.4, specialization | gao-habegger-2019 §§A.2–A.3, pp. 56–57, lines 2596–2614 and 2639–2655; wazir-2006 Theorems 0.2–0.3, pp. 4–5, lines 160–185 | The curve specialization and ample comparison are supported. Wazir's setting is a curve (lines 53–57); the general-base comparison uses the explicitly imported general-base duplication route, not an assertion that Wazir proves that broader case. Big polarization and division by cover degree are retained. R02 corrects the secondary anchor. |
| 7.2, admissible metrics | yuan-2026 §A.3, pp. 108–109, lines 3640–3704 | Positive genus, Jacobian pullback after a power, finite-extension descent, and the square's fibrewise condition agree. Degree-zero and genus-one cases remain allowed. |
| 7.3, admissible measure | yuan-2026 Proposition A.2, pp. 108–109, lines 3662–3683; Proposition A.5, pp. 117–118, lines 3975–4008 | Supports integrable-curvature characterization and unit-edge skeleton formula. The measure has mass one; deleted-edge resistance is used. |
| 8.4, twice theta and Poincaré | yuan-2026 Definition 2.4, p. 30, lines 1008–1021; p. 33, lines 1123–1125; p. 38, lines 1282–1288; yuan-zhang-2025 Theorem 6.1.1, pp. 180–181, lines 7212–7226; Theorem 6.1.3, pp. 183–184, lines 7350–7373 | Dual diagonal gives positive twice theta. Symmetry, rigidification and invariant metric fix its sign and constant. The algebraic construction is imported from JacobianChallengePartII. |
| 10.1, graph invariants | zhang-2010 §4.1, pp. 64–66, lines 2219–2307; Lemma 3.5.4, p. 62, line 2148 onward; baker-rumely-2007 Theorem 14.1 and Lemma 14.4, pp. 36–37, lines 1906–1964 | ε, φ and canonical divisor agree. The package correctly uses the Baker–Rumely τ and allows its canonical measure to be signed; it does not equate that measure with the admissible probability. |
| 10.3, local φ | yuan-2026 §3.3.1, pp. 48–49, lines 1642–1689; zhang-2010 Theorem 1.3.1, pp. 6–7, lines 206–238 | Diagonal integral, complex inner product and positive-eigenvalue sum agree. Genus >1 is retained for strict archimedean positivity. Ramification, not residue degree, controls renormalized edge lengths. R02 corrects the anchor. |
| 10.11, Faltings δ | wilms-2017 Theorem 1.1, p. 1, lines 31–45; §2.1, pp. 5–6, lines 249–305 | The theta Fourier normalization and Haar mass one make δ=−24∫log‖θ‖+2φ−8glog(2π) determinate. At g=1 the source explicitly has φ=0. The original Faltings text remains uncertified. |
| 10.13, Noether divisor | yuan-2026 §4.5.2, pp. 90–91, lines 3030–3074 | Arithmetic D̂iv(S/ℤ), its Green values, inverse Noether section, and separate geometric image now agree. The original arithmetic Noether normalization is also displayed at lines 2992–3001. |
| 12.4, product grid | yuan-2026 Lemma 4.3, pp. 66–67, lines 2235–2258 | The exponent uses codimension m−dim Z, and degree sums all irreducible components, including lower-dimensional ones. Apply the finite-set result to every finite subset for an arbitrary Σ. |
| 13.8, boundary divisor | yuan-2026 proof of Theorem 4.14, pp. 94–95, lines 3173–3250; cinkir-2015 §6, type XIV, pp. 13–14, lines 780–788 and 824–827 | The corrected coefficient c(g)Δ is supported by the calculation. The tetrahedral example numerically refutes the source's stronger intermediate Δ coefficient. |

### Computed adversarial pass

Here H₁,H₂ are the two ruling classes on ℙ¹×ℙ¹. All metric comparisons use the same metrics in each occurrence. W denotes admissible canonical self-intersection, P the relative canonical self-pairing, and h the stated Faltings normalization. Numerical probes of constants do not assert existence of a curve with arbitrary prescribed invariants.

| Statement | Instances tried | Values computed on the two sides / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, Green sign and norm factor | Spec ℤ; norms e⁻¹,e⁻²; principal f=2 | Degrees 1,2; finite +log 2 plus infinite −log 2 = 0; squared Green values 2,4 give half-weighted degrees 1,2 | Consistent with parent | None |
| 0.2/3.2, Deligne pairing and norm | Finite flat degree 2; identity; ℙ¹×S | Norm of pullback O(c) is O(2c), identity O(c); pairing of O(1)+π*M with itself is 2M | Correct arity n+1 including n=0 | None |
| 1.2, boundary norm | Constant divisors −2,0,2; E₀=0 geometric proper case | Norms 2,0,2; with E₀=0 only zero has finite bound, nonzero has +∞ | Excludes an ordinary finite norm in the discrete case | None |
| 1.5, integral/rational positivity | O(1) on ℙ¹; scalar 1/2 | Integral degrees ℤ exclude 1/2; rationalized degree (1/2)·1=1/2 and doubling returns 1 | F06 repaired | None |
| 1.6, choice of base and heights | Spec ℚ; [1:2] over ℚ and a quadratic field; k(t)→k(u),t=u² | Geometric Pic(Spec ℚ/ℚ)=0; arithmetic O(1) degree 1. Heights log 2=(2log 2)/2; geometric moving-point heights 1→2 | Base and normalizations distinguish the carriers | None |
| 1.7, complex completion | Spec ℂ; constant Green data; a punctured curve | Constants 1+2=3 and divisor metric e⁻³=e⁻¹e⁻²; log²(1/∣t∣)/log(1/∣t∣)→∞ | Point carrier ℝ; uncontrolled growth excluded | None |
| 1.9, domination | D=([2],0), E=([2],c), c≥0 on Spec ℤ | E−D=(0,c), E+D=(2[2],c) effective; deg E=log 2+c≥0. Using (0,c) alone leaves coefficient −1 at [2] | Both signs require finite-place domination | None |
| 2.3/2.4, realization | Principal f=2; constant metric shift 1 | Principal Green −log 2 cancels log 2; norm of unit e⁻¹ differs from 1 | A bundle-only or metric-forgetting map fails injectivity test | None |
| 2.6, polarization | H₁,H₂ on ℙ¹×ℙ¹ | 2H₁H₂=2; (H₁+H₂)²−H₁²−H₂²=2−0−0=2 | Mixed product is 1 | None |
| 2.6, signed decomposition | −H₁ as 0−H₁ and H₁−2H₁ | Pairing with H₂ gives 0−1=−1 and 1−2=−1 | Independent decompositions; positivity not overclaimed | None |
| 2.6, dimension-zero local measure | Geometric point over a completed algebraic closure | Empty Chern product has mass 1=degree of that geometric point | Local mass statement is sound; distinct from arithmetic/base-field degree | None |
| 3.1 and 4.3, d=0 | Spec 𝔽₂ and Spec 𝔽₄ over 𝔽₂ | Empty intersections 1,2; volumes 1,2. Distinguished unary additive pairing on Pic=0 gives 0,0 if truncated subtraction is used | Missing arity case | R01 |
| 3.1, d=0 projection | Spec 𝔽₄→Spec 𝔽₂ | Correct empty-degree formula 2=2·1; characteristic 2 does not change the degree | Proposed repair passes | R01 |
| 3.1, positive-dimensional projection | Spec O_K→Spec ℤ, degree 2, O(1) | Pullback degree 2=2·1; non-dominant equal-dimensional pullback degree 0 gives 0 | No positive-dimensional change | None |
| 4.2, volume | Spec ℤ, O(c), c=−1,0,2 | Small sections for m: log(2⌊e^(mc)⌋+1); division by m tends to 0,0,2=max(c,0) | Correct sign and d=1 growth | None |
| 4.3, Siu | A=O(2), B=O(1), then B=O(0) | vol(A−B)=1=2−1; with B=0, mixed degree 0 and vol(A−εB)=2 for every ε>0 | No division by zero in the zero-mixed case | R01 only for d=0 |
| 4.4, big pairing | ℙ¹×S, O(1)+π*M, curve base | Pairing 2M has degree 2 when deg M=1, and 0 when deg M=0 | Bigness is substantive | None |
| 4.6/4.9, global-field adapter | Quadratic K; X=Spec K; O(1) from ℤ | Raw degree 2; supplier normalized degree 2/2=1; point heights 1=1. On ℙ¹ max self-square 0, Fubini–Study self-square 1/2 | F02/F08 repaired; distinguishes metrics | R02 elsewhere only |
| 4.9/5.3, real quotient | i,−i above one real analytic point q | p_*((δ_i+δ_−i)/2)=δ_q, mass 1; twice this measure has mass 2. Frame norm pulls back as e⁻¹=e⁻¹ | F03 repaired without losing probability denominator | None |
| 4.7/4.8, height bounds | Standard O(1); point of raw degree 2 over quadratic K | Point bound log 2≥log 2; normalized variety height 2/(2·1·1)=1=e₁ | Absolute degree factor retained | None |
| 5.1/7.1, invariant metrics | Even and odd bundles, constant shift c=1; q=1 | [2] even defect 1−4=−3; odd defect 1−2=−1. At q=1 every constant is invariant | q>1 and rigidification exclude spurious constants | None |
| 5.2/5.3, nondegeneracy/genericity | Constant elliptic family over a curve; torsion section | Betti rank 2<4 for whole family and 0<2 for section; torsion height 0. Repeated point not generic; small generic sequence gives 0≤h(Y)≤0 | Exclusions necessary and present | None |
| 5.4, Faltings metric | g=1,2; quadratic extension | Squared norm ratio π⁻g shifts height by (g/2)log π: (log π)/2, log π. Raw 2h divided by 2 gives h | Matches parent and Gaudron–Rémond convention | None |
| 6.1/6.2, polarized heights | Empty tuple over ℚ; zero polarization over ℚ(t) | [1:2] has log 2; a zero polarization makes all intersection heights 0, including infinitely many points | Northcott requires big polarization | None |
| 6.3, quadraticity/kernel | Order-two torsion; non-torsion with height a; quadratic constants | Values at [0],[1],[2] are 0,a,4a; torsion limit 0; relative 2a/2=a. Zero polarization gives non-torsion height 0 | F07 repaired | None |
| 6.4, cover specialization | Degree-two cover; normalized generic height 3 | Upstairs height 6; base-height ratio 2; specialization slope 6/2=3 | Cover factor correct | R02 anchor only |
| 7.2, curve and square admissibility | Genus-two three-edge banana; trivial line | Model canonical curvature δ_v₁+δ_v₂ has mass 2; admissible (2/3)Σ_e ds has mass 2 but different support. Constant trivial metric curvature 0 | Mass alone does not define admissibility | None |
| 7.3, admissible measure | Unit banana; good-reduction genus-two point graph | Deleted-edge resistance 1/2; density (1/2)/(1+1/2)=1/3, total 3/3=1. Point graph μ=δ_v and c₁(ω)=2δ_v | Correct probability and genus factors | None |
| 7.4/8.3, canonical normalization | g=2; constant diagonal shift 1; g=1 | Canonical curvature mass 2, Green mean 0, residue norm 1; shift gives mean 1. At g=1 canonical degree 0 cannot fix mean; positive-degree line has mass d>0 | Genus-one repair from earlier work preserved | None |
| 7.5/7.7, local extension | Unit intersection length; unramified versus ramified quadratic | Length/e: 1/1=1 unramified, whereas erroneous division by degree gives 1/2. Renormalized ramified graph lengths 1→2 | Residue and ramification factors distinguished | None |
| 8.4, twice theta | Elliptic fibre; multiplication by 2 and 3 | deg Θ=2; opposite dual gives −2. Pullbacks have degrees 8=4·2 and 18=9·2; constant-shift defect −3 | Positive dual diagonal and invariant norm fixed | None |
| 8.5, evaluation/adjunction | Section; base metric c=1; deg x*w=1 | Section degree 1 versus trivial 0; evaluation shifts 1=1 versus wrong 0; self-pairing −1, pairing with w +1 | F07 repaired with three independent tests | None |
| 8.6, vertical group | Constant O(1); section line; Fourier metric | Underlying degrees 0,1; constant curvature 0. Fourier curvature coefficients at 4,16,64 are −16π²,−128π²,−1024π² | Continuous wrong model excluded by integrability | None |
| 8.7, Hodge index | Degree-zero class of principal canonical height a | Twice-theta height 2a; self-pairing −2a; torsion gives 0=0 | Sign and factor two agree with GrossZagier supplier | None |
| 9.1, arbitrary-degree theta identity | g=2,d=1; d=0; g=1 | Main pairing A+8b on both sides; d=0 base pullback has fibre degree 0 and self-pairing 0; g=1 coefficient 2g−2=0 | Degree-zero case not declared finite | None |
| 9.2, canonical/difference/shift identities | g=2 and 3 | Canonical coefficients (8,32),(24,384); difference 8w+P,12w+P; shift 16Θ+32P,128Θ+384P | Coefficients and positive base terms agree | None |
| 9.3, nef canonical bundle | g=2,3; g=1 negative control | Cancellation −1/8+32/256=0; −1/24+384/9216=0; g=1 denominator is 0 | g>1 excludes invalid division | None |
| 10.1, graph invariants | Genus-two unit loop; genus-three loop length 2; genus-two unit bridge | (δ,ε,φ,τ)=(1,1/6,1/12,1/12), (2,4/9,2/9,1/6), (1,1,1,1/4). Canonical degrees 2,4,2 | Definitions, scaling and bridge case agree | None |
| 10.2, graph inequalities | Genus-two loop and bridge | δ+ε−2φ=1 and 0; RHS (3/2)δ−6τ=3/2−1/2=1 and 3/2−3/2=0. Bound ε≤δ/2+2φ gives 1/6≤2/3 and 1≤5/2 | Correct directions; no positivity claimed for μ_can | None |
| 10.3, local φ | Good reduction; unit loop; quadratic local extensions | φ=0 at good reduction; loop φ=1/12; extended norm keeps 1/12, ramified renormalization gives 1/6, unramified gives 1/12 | Correct local normalization | R02 anchor only |
| 10.7, relative intersection expansion | g=2 | Coefficients combine as 8−24+24+12=20; φ contribution −8 | Diagonal and canonical signs agree | None |
| 10.9/10.10, Hodge and Gross–Schoen | g=2 coefficient test; hyperelliptic normalization | 1+(39/2)·15=587/2<300; with W=2, φ=5, canonical Gross–Schoen term (5/2)W−φ=0. Degree-two raw extension gives (5/2)·4−10=0 | Correct inequality direction and extension scaling | None |
| 10.11, δ normalization | g=1; scalar change of theta norm by e | φ=0 gives δ=−24I−8log(2π). Changing norm by e changes I by 1 and RHS by −24 | Specified theta Fourier norm excludes rescaling | None |
| 10.12/10.13, Noether | Good reduction; genus-two unit type-0 node; sign change | Finite Green values 0 and 1+1/6=7/6; replacing section by negative changes −log norm by 0; geometric Spec ℚ image is 0 | F01 repaired, not a loss of arithmetic information | R02 reference anchor only |
| 11.1, uniform archimedean φ | Boundary error margin 1/156; t=e⁻ⁿ | Two errors consume 2/156; from 1/39 remains 1/78; Green lower growth n/78+O(1)→∞ | Coercivity retains a positive margin | None |
| 11.2/11.3, maximal-variation positivity | g=2 curve base, deg λ=1; constant family; quadratic raw degree | deg P≥1/25>0; constant case deg P=0 is excluded by variation. Raw lower 4c₀/5 divided by 2 gives 2c₀/5 | Geometric/arithmetic normalizations agree | R01 empty-base convention only |
| 11.4, canonical bigness | g=2 and one-dimensional base | Canonical Abel fibre degree 16; expansion contains 2·16P=32P>0 | Positive pairing produces total bigness | None |
| 12.2, potential-bigness intersections | Relative dimension 1, two factors; base dimension 2, a=2,M²=3,m=3 | Exponents (2,1),(1,2) contribute aM; (3,0),(0,3) vanish. Base term a^(m−d)M^d=2·3=6 | Correct fibre-degree and multinomial support | R01 supplies nullary convention |
| 12.3, equivalences | Base dimension 0, fibre degree a=2; relative dimension 0, Y=S | Fibre-power top degree m!2^m>0; for Y=S, vol(mL)=m^d vol(L) | Both directions preserve positivity | R01 supplies nullary convention |
| 12.4, product-grid bound | Three points on ℙ¹; 3×3 grid; mixed-dimensional Z | m=1 degree 3 gives bound 3; grid dim 0, degree 9 gives √9=3. One horizontal row plus six isolated points has total degree 7, bound 7≥3; top-degree-only 1 would fail | All-component degree is essential | None |
| 12.5/12.6, applications and special fibres | g=2; characteristics 2,3; square-zero special fibre | Base terms 2P+ι*Θ,8w+P,16Θ+32P positive. On 𝔽₂[x]/(x²), x²=0; integral reduced test is 𝔽₂ with fibre O(1) degree 1 | No assertion that an entire special fibre is integral | None |
| 13.1/13.3, stable height and correction | Extension degree 2, Hodge degree 3; h=1/10,δ=1,ε=1/6 | Stable height 3/2; W_model=12/10−1=1/5; W_a=1/5−1/6=1/30 | ε is subtracted from model square | None |
| 13.4/13.5, function-field comparison | g=2,φ=1/12; A(4)=139; formal δ=ε=0,h=1 | Hyperelliptic W=(2/5)φ=1/30≥1/60; 12/139>1/12; W=12 lies between h/12 and 12h | Constants and directions correct | None |
| 13.6/13.7, lower constants | g=1,2; smallest allowed Faltings lower bound | Wilms lower constants ≈−10.5441,−21.0883; h=−(g/2)log(2π²), c=(g/2)log(2π²)+1 give h+c=1 | Correct metric normalization | None |
| 13.8, coercive divisor | Unit K₄, g=3, c=17/288 | δ=6,φ=17/48,ε=11/6; D=107/48; D−δ=−181/48; D−cδ=15/8>0 | Corrected boundary coefficient passes | None |
| 13.9, number-field bounds | g=2,3,4 coefficient tests; log normalization | Lower coefficients 109.75,≈100.4412,142<144. 2glog(2π⁴)+4glog(2π)=6glog(2π²)≈17.8956g | Uniform coefficient 1/12 supported | None |
| 13.10, fixed-genus uniformity | g=2,3; h≥24∣c₅∣; constant function-field curve | c₃=4⁻¹⁶/12≈1.9403·10⁻¹¹ and 4⁻³⁶/12≈1.7647·10⁻²³; h/12+c₅≥h/24. Constant curve h=W=0 would require c₃≤0 | Non-isotriviality correctly excludes last case | None |
| Source control, Yuan–Zhang invariant-metric uniqueness | q=4,c_v=3; constant g=−1 | g=qg+c_v reads −1=−4+3; solution −c_v/(q−1)=−1, whereas the printed −c_v gives −3 | Constancy conclusion survives the missing divisor | Source issue only |
| Source control, Wazir 0.2 | Constant E×ℙ¹; L=pr_E*M⊗pr_base*O(1); zero section; comparison bundle O | Fibre canonical height 0; ordinary height h(t)+O(1)→∞; comparison height O(1) bounded | Source needs a positive-degree comparison bundle; package supplies it | Source issue only |
| Source control, Wazir 0.3 | Symmetric ample M on E; nontorsion Q; L=t_−Q*M; q=ĥ_M | ĥ_L(P)=q(P)−2B(P,Q); at P=Q this is −q(Q)<0, whereas the source asserts ≥0 | Source needs symmetry for positivity; package retains symmetry | Source issue only |

### Ownership, supplier order and pinned declarations

The board-package index was read first. Object searches used the roadmap service over main and the indexed open heads, and `rg` over the board packages and both pinned libraries. Searches included adelic line bundles/Picard groups, Deligne pairings, arithmetic volume/intersection, Moriwaki heights, metric graphs/resistance, admissible metrics, Gross–Schoen heights, Noether isomorphisms and product grids. Open-head ownership was checked with the provided roadmap service; no pull-request write was made.

The board matches were the package itself, ArithmeticDynamics, and the designs of StableReductionPartII and HeightsRationalPointsAndObstructionsPartII. The latter designs have the supplier-moduli and downstream-small-point roles stated here. GenericDoublePointInterpolation's polynomial product-grid vanishing is different from §12.4's scheme-theoretic degree bound. MotivesAndAlgebraicCycles' cycle classes and primitive-height discussion do not construct this relative admissible canonical self-height. No second owner of the extension in this package was found. There are no Lean declarations whose fully qualified names could collide.

The following current supplier sections were opened and compared with the package. Paths are under `TauCetiRoadmap/<Supplier>/README.md`; line numbers refer to those source files, not the service's extra display header. SchemeAndStackFoundations was read on main; the other extant supplier folders are new-roadmap open heads. The citations resolver used main `35c9f96` and the supplied index of 362 open heads dated 2026-10-25. It reported only the declared StableReductionPartII gap; it reported no missing own Lean names. Its claim that it could not inspect Lake pins was not relied on: the local pins were inspected separately.

| Supplier | Sections resolved; concrete lines opened | Ownership and convention check |
| --- | --- | --- |
| ArakelovGeometryAndAbelianHeights | §§1.1–1.3, 1.7–1.10, 1.12–1.15, 2.1, 2.7–2.8, 3.4, 5.0b, 5.3–5.4, 6.5; lines 227,377,584,683,839,1026,1359,1445,1469,1736 | Degree, squared Green functions, stable height, integral Hodge model and Bost stay there. The conversion g↦2g and h_Del−h_Fal=(g/2)log π agrees. |
| HeightsRationalPointsAndObstructions | §§0.11,0.16,0.18–0.20,0.26–0.29,5.17a–5.17b,5.17d–5.17f; lines 233,294,315,327,339,407,415,436,444,2705,2736,2776,2797,2813 | Relative heights, general-base duplication route, singular model intersections, raw versus normalized degree, Hilbert–Samuel, Nakai and minima are imported. |
| ArithmeticDynamics | §§4.1,4.1a,4.3,4.3a,4.4,4.40; lines 5860,5878,5913,5928,6749 | The local positive top power is on C_v. General global-field adelic carriers/equidistribution remain there; mixed signed extension and arbitrary-base comparison are additional here. |
| SchemeAndStackFoundations | §§0.3,0.20–0.21,3.5,4.11–4.12,5.1–5.3,5.5–5.6,5.12; lines 551,1302,1394,4876,5528,5613,6567,6653,6701,6768,6921,7336 | Models, finite normalization, line norms, Chow degree/intersection and Bézout are supplied. R01 can use its existing zero-cycle degree with residue-degree weights. |
| ComplexComparisonPartII | §C5.4, line 3018 onward | Current and integration calculus is on smooth complex manifolds. It does not already supply the declared singular Bedford–Taylor/regularization contract. |
| TropicalAndBerkovichArithmetic | §§0.1,0.12,0.15,0.22–0.23,2.7,2.13,3.1,3.3,6.1–6.8; lines 189,396,455,638,673,1170,1265,1469,1522,2049,2094,2120,2145,2204,2239,2279 | General Banach spectra and nonarchimedean analytification, model metrics, scalar-extension measure pushforward, signed limits and graph potentials are supplied. Laplacian sign and real edge lengths agree. |
| GrossZagierAndArithmeticHeights | §§2.2–2.4,2.8,2.10,2.12–2.13; lines 712,739,764,844,903,955,969 | Arakelov probability, mean-zero Green kernel, residue norm and real descent agree. Faltings–Hriljac uses full polarization, explaining −2a in the self-pairing test. |
| JacobianChallengePartII | §§1.2–1.4,2.2,2.4–2.7,3.1,3.3–3.13,4.5–4.9,5.1–5.2,6.3; lines 211,232,257,314,343,367,406,430,472,493,523,547,597,605,613,707,737,769,799,809,1034 | Algebraic Jacobian, Poincaré, actual Picard comparison and Hodge line stay there. Signs j(x,y)=y−x and Θ=Δ*P∨ agree. Relative metrized arbitrary-degree identities are distinct. |
| NeronModelsAndSemistableAbelianVarieties | §§3.3,3.9–3.12; lines 1355,1618,1644,1688,1716 | Identity-component base change is not whole-model base change. Excellence/finite separability and prime-to-residue-characteristic level assumptions match their uses. |
| MotivesAndAlgebraicCycles | §§2.2–2.3; lines 352,369 | Supplies geometric Weil cohomology, cycle-class kernel and base change, not a general unconditional cycle-height theorem. |
| StableReductionPartII | Contract MC.4–MC.6; board design and README contract | No extant supplier README was manufactured. The same named gap is in `design/plan.json` and README lines 115–117; missing implementation is allowed by the contract. |

Both gaps are owned, specific and attached to their consuming interfaces. The complex gap concerns singular varieties beyond C5.4's smooth-manifold calculus. The moduli gap concerns fine curve moduli, stable boundary and curve Noether/positivity interfaces, rather than the already supplied algebraic Jacobian or Siegel Hodge line. Their slugs agree between the plan and README. No additional unowned supplier was inferred merely from their absence today.

The required dependency command completed successfully. Its output was:

```text
depcheck: 51 roadmaps, 591 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line and no merge-order edit.

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These declarations were opened at those pins:

| Declaration | Repository-relative file and line | Native content and limitation |
| --- | --- | --- |
| `NumberField.prod_abs_eq_one` | `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98` | Nonzero-element product formula, including infinite-place multiplicity. It does not make native heights absolute. |
| `Projectivization.logHeight` | `Mathlib/NumberTheory/Height/Projectivization.lean:51` | Relative logarithmic height; field, finite-index and admissible-absolute-value binders. On a quadratic base [1:2] has native height 2log 2. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112` | Full subcategory with rank-one locally free predicate; morphisms are module maps, not automatically isomorphisms/isometries. No metric. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object, including dimension zero. No canonical metric or height is bundled. |
| `InvertibleSheaf.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70` | Difference of Euler characteristics through H¹. It does not itself assert finiteness or supply arithmetic degree. |
| `LineBundleClass.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:126` | Isomorphism-class version of algebraic degree. |
| `InvertibleSheaf.eulerDegree_canonicalBundle` | `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168` | Canonical degree 2g−2 with integral/Noetherian/separated, DVR/coheight, valuative-existence, function-field/constants and properness hypotheses. Imported rather than restated. |
| `WeierstrassCurve.Affine.Point.canonicalHeight` and `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119` and line 332 | Native x-coordinate canonical height; the kernel theorem requires ellipticity and Northcott. This is not the finitely generated-field, polarized Moriwaki height on arbitrary abelian varieties. |

The last native definition uses a limit on a field with admissible absolute values; ellipticity is a hypothesis of its convergence/results, not its definition. Thus it was not mistaken for a carrier that makes all of Layer 6 statable. Searches also distinguished polynomial grid-vanishing lemmas from the missing mixed cycle degree on arbitrary curve powers.

### Shape, headline coverage and Lean acceptance file

The README has the required opening, ownership/conventions/contracts, build paragraph and 14 ordered layers. All 44 explicit definition API blocks have at least three Checks; the repaired §6.3 and §8.5 blocks now satisfy that requirement. All 91 subsections have individual dependencies, and every layer ends with Examples and Dependencies. The main-branch StableReduction and AlgebraicVectorBundles roadmaps were read for shape. No process labels, Lean-name catalogue or computational procedure was introduced by the repairs. The metadata remains the mathematical topic `math.NT`.

The headline inventory was compared with the module docstring, not with a quota of Lean declarations:

| README headline family | Named in Suggested.lean; missing statement carrier at the pins |
| --- | --- |
| Model and adelic Deligne pairing, metric, base change and projection (§§0.2,3.1–3.3) | Layers 0/3: relative metrized Deligne pairing and hermitian metrics. |
| Arbitrary-base adelic Picard/divisor realization, injectivity/full faithfulness and global-field comparison (Layers 1–2, §4.9) | Layers 1/2: completed adelic carriers and global analytic realization. The global-field comparison needs those same unavailable carriers. |
| Hilbert–Samuel, Siu, positive pairings and height/fundamental inequalities (§§4.2–4.8) | Layer 4: adelic bundles, volume, intersection and normalized height. |
| Invariant extensions, nondegenerate height inequality and small-point equidistribution (§§5.1–5.3) | Layer 5: relative metrics, measures and nondegeneracy; general global-field equidistribution is explicitly imported. |
| Adelic Hodge bundle and stable Faltings identity (§5.4) | Layer 5: Hodge metric, adelic Hodge bundle and stable height. |
| Moriwaki height machine, Northcott, canonical kernel and specialization (Layer 6) | Layer 6: arithmetic polarization and intersection height. |
| Canonical admissible metrics, family extensions and relative Hodge index (Layers 7–8) | Layers 7/8: Berkovich curve metrics and relative admissible adelic lines. |
| Arbitrary-degree theta pullbacks and nefness of the canonical bundle (Layer 9) | Layer 9: metrized theta, admissible bundles and relative pairings. |
| Graph inequalities, ε/φ/Noether divisors, Hodge decomposition and Gross–Schoen identity (Layer 10) | Layer 10: polarized metric graphs/resistance, Green kernels, arithmetic divisors and special cycle height. |
| Uniform archimedean φ positivity; canonical/self-pairing nefness and bigness under maximal variation (Layer 11) | Layer 11: canonical Green/φ and adelic positivity/intersection carriers. |
| Potential-bigness equivalence and its three theta applications (§§12.1–12.3,12.5) | Layer 12: adelic bigness and Deligne pairing. |
| Product-grid degree bound (§12.4) | Layer 12: mixed degree of an arbitrary closed subset of a curve power, including all components. |
| Canonical-square correction, local/global lower bounds, two-sided comparison and uniform max(h,1) theorem (Layer 13) | Layer 13: admissible self-intersection, local invariants and stable Faltings height on actual curves. |

None of these missing objects can be supplied by a few elementary definitions on existing carriers. In particular, a free scalar inequality or a polynomial grid lemma would not state the corresponding headline. No statable native headline was found omitted.

The required `lake env lean` invocation on `packages/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean`, from the pinned content checkout using the required absolute input argument, exited **0 with no output and no warnings**. There is one `import Mathlib`, one module docstring, the correct namespace, and **zero declarations**. No TauCeti object build was needed. There are no sorried theorems to probe with one tactic and no own declarations for `#check @name`; both audits have zero targets, so no scratch signature or padding theorem was invented. No section binder can silently disappear from a nonexistent declaration. The successful build is an elaboration result, not a proof of the README mathematics.

## Not verifiable

- The original moret-bailly-1989 Théorème 2.5 and faltings-1984 Theorem 6/δ discussion remain settled as uncertified. They were not fetched or requested again. The Noether normalization was checked in yuan-2026 lines 2992–3026 and the theta-integral characterization in Wilms; that does not certify the unread original proofs.
- Original works invoked through the available sources' recollections, such as Zhang 1993, Heinz, the original Calabi uniqueness reference, and the singular regularization reference, were not independently certified. The named claims, supplied interfaces and available source passages were examined; the two declared gaps still require their suppliers' mathematical work.
- Future supplier proofs and the missing adelic/analytic formalizations are not present merely because a roadmap states them. The review checks their contracts and ownership, not completed formal proofs.
- The manuscript/version-specific numbering was checked in the cached versions recorded by the author. No claim of agreement with a separately obtained later edition is made.

No new inaccessible work requiring a source request was found. No source-manifest entry was added, removed or rewritten. No source text was copied into the package or report.

## Source issues

- **Misprint** in yuan-zhang-2025 at §3.2.2, printed p. 72, line 2632: the source says the divisor-to-metric map uses exp(−g/2); it should be exp(−g), inverse to its −log norm convention; affects nothing.
- **Misprint** in yuan-zhang-2025 at Proposition 4.1.1, printed pp. 103–104, lines 3854–3863: the source says one arbitrary Picard argument and d−1 integrable arguments for every model dimension; it should be qualified by d≥1, with the nullary degree separately retained at d=0; affects a stated result.
- **Misprint** in baker-rumely-2007 at Theorem 14.1(A), printed p. 36, lines 1906–1925: the source says the canonical measure is a probability; it should be a possibly signed measure of mass one, with atom −1/2 at a trivalent vertex; affects a stated result.
- **Error** in wazir-2006 at Theorem 0.2, printed p. 4, lines 168–172: the source says any comparison line bundle M on the base curve suffices; it should require positive degree, since a trivial M cannot control an unbounded base-height twist; affects a stated result.
- **Error** in wazir-2006 at Proposition 0.3, printed p. 4, lines 144–151: the source says ampleness alone gives nonnegative canonical height with torsion kernel; it should retain symmetry for that assertion; a translated ample symmetric bundle can have negative canonical height; affects a stated result.
- **Misprint** in yuan-2026 at §3.3.1, printed p. 49, line 1660: the source says divide the split semistable node count by the extension degree; it should use the ramification index under the unit-edge normalization; affects nothing.
- **Misprint** in yuan-2026 at proof of Theorem 4.14, printed p. 94, line 3208: the source says the geometric coercive divisor minus Δ is effective; it should be minus c(g)Δ, as the subsequent calculation proves; affects nothing.

- **Misprint** in yuan-zhang-2025 at proof of Theorem 6.1.2, printed p. 183, line 7341: the source says g_max=qg_max+c_v gives g_max=−c_v; it should be −c_v/(q−1), likewise for the minimum; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0738d90d36191f03c760dbcfeb8b3d06cd0af735", "job": "REV-PKG-ArakelovGeometryAndAbelianHeightsPartII~3", "model": "gpt-6-astra", "worker": "chris-13"} -->
