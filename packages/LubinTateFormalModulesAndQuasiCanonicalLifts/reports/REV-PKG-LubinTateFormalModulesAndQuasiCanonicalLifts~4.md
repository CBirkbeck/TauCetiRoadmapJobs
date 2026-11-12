<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6788941496 -->
Review (codex) of a6a668c

Verdict: needs_changes

1. **F01** (P2) The quadratic comparison still requires later targets

   **Location:** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1564`, §6.2: “§6.4 for the quadratic orders `O_s`”. The comparison at lines 1542–1545 also uses `L_s` before its definition at line 1621.

   **Claim:** §6.2 proves the quadratic level comparison in build order, while the build description at lines 359–363 says no section requires a later one.

   **Witness:** In the same README, §6.4 defines `O_s` at line 1591; §6.5 defines `L_s` at line 1621. The explicit edge 6.2 → 6.4 is forward, rather than a pointer to a later consequence.

   **Exact repair:** Keep §6.2's general lattice quotient, multiplier order, marking and twist comparison. Move its quadratic level identification, degree-`q₀^s` comparison with GrossZagierAndArithmeticHeights §7.2, and level-one order Check into §6.5, after defining `L_s` using §6.4's `O_s`. Remove the §6.4 dependency from §6.2. In §6.5, replace the appeal to the already-proved “marked comparison of §6.2” by the comparison now proved there from the general marking construction of §6.2 and quotient of §5.2; list those inputs. This retains every result and all section numbers, and leaves three Checks in §6.2.

   **Repair test:** For `q₀=2,s=1`, `L_s/T` has two elements, so the quotient degree is 2; the marked orbit has 3 elements in the unramified case and 2 in the ramified case. Those comparisons can be proved in §6.5 with both the general quotient and `O_s` available. The resulting order 6.1 → 6.2 → 6.3, independently 6.4, then 6.5 uses no later target. The original four instances of prior F03 are fixed; this is the remaining occurrence of that pattern, not a challenge to a “not actionable” disposition.

2. **F02** (P3) LT66 §2.5 is a remark

   **Location:** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1035` and `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml:11`: “Propositions 2.4–2.6”.

   **Claim:** The cited consecutive items are three propositions.

   **Witness:** LT66 line 207 labels item 2.5 a remark, printed p.54; line 214 starts Proposition 2.6. Proposition 2.4 starts at line 148, printed p.52.

   **Exact repair:** In both places use “Proposition 2.4, Remark 2.5 and Proposition 2.6, pp.52–55”. Preserve the existing LT66 manifest key, access status and source-service fields.

   **Repair test:** The corrected locator reaches the lifting/coboundary comparison at LT66 lines 148–211 and the finite-height dimension statement at lines 214–222. The formal-module action corrections remain supported separately by VZ07 §3, equations (3.1)–(3.7), printed p.62. This changes no mathematical claim.

Two findings: one P2 and one P3. The acceptance file elaborates with only its five `sorry` warnings. All five one-tactic padding probes fail to close their goals. The external dependency check passes. No authored roadmap, Lean, metadata or manifest file was changed.

## Verified sound

### Previous findings, checked first

I read the round-3 review and round-4 repair report before the fresh pass. No prior disposition was “not actionable in this package.” References in this table are to `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` as reviewed now.

| Prior finding | Repaired passage | Status and computed retest |
|---|---|---|
| F01: ideal versus radical points | Lines 445–451 identify the ideal-coordinate subgroup and say it is the whole supplier carrier “exactly when `I` is a radical ideal”. The supplier contract at lines 278–287 has the matching hypotheses. | Repaired. For `I=9ℤ₃`, native coordinates are `9ℤ₃`, supplier coordinates `3ℤ₃`; 3 belongs only to the latter. For `I=3ℤ₃`, both equal `3ℤ₃`. The native construction is not narrowed to radical ideals. |
| F02: Honda operator at `q=1` | Lines 1183–1193 specify “let `q = p^r` with `r ≥ 1`” and coefficientwise finite support; §4.2 retains the condition. | Repaired. For `ℓ=X`, `u=2+ΣT^i`, `q=1` would give coefficient `2+1+1+⋯`; `q=2` gives coefficients 2,1,1 at degrees 1,2,4. The negative control is explicit at lines 1215–1219. |
| F03: reverse comparison dependencies | Lines 512–513: trace compatibility “is stated with them in §9.1”; lines 697–698 place the torsion/field consequences in §§2.1–2.4; lines 1442–1445 separate actual lattices from §6.6; lines 1974–1976 place trace signs in §9.3. | Partly repaired. All four original occurrences are fixed: actual image of `T` under `Art(π_F)` is `T`, its class is also `[π_F⁻¹T]=[T]`; degree-two additive trace of 3 is 6; adjacent signs multiply by −1. The new explicit forward need in §6.2 remains R01. |
| F04: a unit need not be non-strict | Lines 707–711: “strict exactly when `u = 1`”. | Repaired. On the multiplicative law over `ℤ₂`, `u=1` gives `X`, derivative 1; `u=3` gives `3X+3X²+X³`, derivative 3. |
| F05: sign test outside the trace source | Lines 2079–2085 use a base-field point with “`ℓ_H(x) = 5² = 25`”. | Repaired. Both trace routes have total degree 30 and logarithm 750. Adjacent-label correction gives −750 on both sides; omission gives +750 on one. `w₁` generates a degree-600 field and is explicitly excluded from the degree-30 source. |

I searched the rest of the package for the repaired patterns: arbitrary ideals, positive powers in Honda operators, forward dependencies, strict versus marked isomorphisms, and the domains of trace test points. The additional cocycle and rigidity Checks at §§3.3–3.4, the canonical modulus boundary, and the actual-lattice/class distinction were also recomputed. The logarithm naturality sentence at §0.3 is read with §0.1's explicit differential factor, not as a false derivative-free equality: `ℓ_G(φ(x))=φ′(0)ℓ_F(x)`.

All 50 target sections and all 50 target Needs lines were read. Untouched material was carried forward only where the previous review supplied computed rows; the seeded targets and changed passages were freshly checked. The table below supplies computations for all target sections, including the new §0.4. These tests are evidence against defects, not proofs of the future theorems.

### Sources: all fifteen seeded targets

The manifest has one entry for each of the eight cited works: LT65, LT66, H68, H70, G86, Y95, VZ07 and BKO21. Seven legal cached texts were inspected. LT65 remains settled **uncertified**, and was neither fetched nor requested again. No further author-flagged unverified work was found. Printed page numbers below are distinguished from extraction page markers.

| Target | Text and locator inspected | Result and actual scope |
|---|---|---|
| 0.2 Module of adic points | Native point/evaluation declarations listed below; supplier §R07.1.12; LT65 §1, formulas (12)–(13) and following paragraph, p.383 | The subgroup, topology and radical qualification agree with the supplied carriers. LT65 itself remains uncertified. An `I`-coordinate point is not automatically every radical-coordinate point. |
| 0.3 Logarithm convergence | H70 §1, pp.216–219, lines 69–263; the native convergence and exponential declarations below; LT65 §1 p.383 | H70 supplies the formal logarithm framework; the analytic estimates are imported from the pin. The inverse is restricted to a deep ideal, and naturality retains the derivative as specified in §0.1. LT65 not read. |
| 0.4 Local models and elliptic points | Mathlib `IsKrasner.krasner`, `adicCompletion`, `adicCompletionIntegers`; Tau Ceti weak approximation and elliptic completion maps, file locators below | This is an additional finite-tower construction from named native inputs, not a purported theorem number in one of the papers. The strict Krasner inequality, separability and compatible inclusions are required. Small quadratic tests distinguish the extensions. |
| 2.1 Finite-height torsion | Y95 §2–§3, pp.294–296, lines 78–81,116–154; VZ07 Lemma 2.1/Definition 2.2, pp.59–60, lines 2799–2838; native Weierstrass preparation | The finite-height hypothesis and `O_K`-height convention are supported. The finite flat rank is `q^(hm)`, with the general-base assertion using Weierstrass preparation and the named group-scheme supplier. |
| 2.6 Uniformizer change | LT65 §2, Lemma 2, Theorem 3 and corollary, pp.385–387 | Source text remains uncertified. Independently checked the twist against arithmetic Artin on units and `π′`, and the completed-unramified supplier. This is not a source certification of LT65. |
| 3.3 Deformation cocycles | VZ07 §3, (3.1)–(3.7), p.62, lines 2877–2888; LT66 §2, pp.52–55, lines 148–222 | Coupled law/action corrections and linear coordinate coboundaries agree. LT66 is the ordinary formal-group comparison, not the entire `O_K`-action theory. R02 corrects the kind of item 2.5. |
| 6.3 Marked/unmarked classification | Y95 Propositions 1–2, p.297, lines 185–211; corollary p.298, lines 224–230; Proposition 4, p.300, lines 305–321 | The `F×`-homothety quotient differs from marked classes; order alone does not classify higher-degree lattices. The order-plus-module invariant and quadratic freeness distinction are appropriate. |
| 6.6 Marked field of moduli | Y95 §4, pp.296–298, lines 155–175,185–215; G86 §5, pp.324–325, lines 180–217 | Y95's field contains the CM field; marking/twist components and stabilizers matter. Gross uses the completed strict base. The roadmap states the finite-residue comparison rather than silently identifying those bases. |
| 7.1 Ring-class degrees | G86 Proposition 5.3(2), p.325, lines 204–217; Y95 Theorem 1, p.297, lines 212–215 | Positive-level unramified and ramified degrees agree; `s=0` is separate. Residue characteristic 2 is included. |
| 7.2 Uniformizer modulus | G86 Proposition 5.3(3), pp.325–326, lines 210–235; Y95 Theorem 2′ and example, pp.301–302, lines 350–376; proof route §§9–10, pp.305–309, lines 460 onward | Gross explicitly states normalized valuation 1 in the extension. Dividing by the ramification degree gives the roadmap's valuations. The canonical ramified modulus is distinguished from elements of the smaller coefficient ring. Some extracted display formulas are incomplete; see limitations. |
| 7.5 Ramified Honda boundary | G86 §5, Proposition 5.3, p.325, lines 198–217; Y95 §§3–4, pp.295–298, lines 116–230 | The proper multiplier order survives coefficient extension. The ramification and proper order obstruct an integral `O`-action despite the residual Frobenius equation. |
| 7.6 Neighbours | BKO21 Theorem 5.5(ii), proof in §5.0.2, p.959, lines 750–768; G86 §5, pp.324–325 | The source's intended inward/outward count is supported. The roadmap's two-basis-vector representatives correct the printed neighbour typo; level zero is separate. |
| 8.1 Character data | BKO21 §2, pp.947–948, lines 225–281; LT65 Theorem 2/§2 | Full tower, `−p`, tame factor and the `n+1` indexing agree with BKO. Arithmetic reciprocity comes from the named supplier; LT65 remains uncertified. |
| 8.2 Cyclotomic/anticyclotomic directions | BKO21 §2, pp.947–948, lines 225–252; §5.0.2, pp.958–959, lines 712–744; LocalFieldsRamification Layer 1 | Logarithmic plus/minus lines and norm-one subgroup agree. Division by 2 is used only under `p≥5`. The extension is pro-p over `Φ`, not over `ℚ_p`. |
| 9.1 Formal traces | BKO21 §4, pp.954–955, lines 514–549; §5.0.2, pp.958–959, lines 734–768; LT65 §1 p.383 | BKO supplies the application and formal-sum context, not a standalone general finite-separable trace theorem. The stated general theorem follows by the named formal group/evaluation inputs and Galois permutation of embeddings. LT65 not read. |

The changed Honda material was also compared with H70 condition (F) and operator definition, pp.220–221, lines 309–358. The elliptic headline was compared with H70 Lemma 4.2, p.231, lines 738–749, Theorem 9, pp.240–241, lines 1100–1122; H68 Theorem 2, pp.204–205, lines 210–247 and Corollary 4, p.212, lines 497–502; and BKO21 Lemma 5.1, p.956, lines 573–588. The local scalar-Frobenius argument in the roadmap is additional to H70's theorem about curves over ℚ.

### Computed adversarial table

The zero ring and a field cannot supply the DVR/irreducible-uniformizer hypotheses. A finite residue field has `q≥2`; the independently chosen Honda exponent is now also positive. No inseparable finite extension enters the characteristic-zero field layers. For the general trace, the non-Galois cubic test below has a nonabelian Galois closure. Formal commutativity, rather than abelianness of that ambient group, supplies invariance.

| Statement | Instances tried | Computed values on the two sides or competing models | Result; change |
|---|---|---|---|
| 0.1 Action, height, logarithm convention | Additive law in characteristic p; quadratic coefficient restriction; conjugate scalar action | `[p]=0` has infinite height; a height-one quadratic module has underlying height 2; conjugating scalar `i` changes tangent `i` to `−i`, failing the tangent law. | Pass. |
| 0.2 Adic points | Multiplicative law over ℤ₃, `I=9ℤ₃`, `x=y=9`; radical comparison | Formal sum `9+9+81=99∈I`; inverse `−9/10∈I`. Coordinate 3 is outside `I` but inside `√I=3ℤ₃`; with `I=3ℤ₃` both carriers coincide. `F(0)` has one element. | F01 repaired. |
| 0.3 Evaluated logarithm | Additive law, `φ=2X,x=3`; multiplicative torsion; p=2 disc | `ℓ(φ(3))=6=2ℓ(3)`, not 3. `log(ζ_p)=0` although `ζ_p−1≠0`. At p=2, `‖4‖=1/4<1/2`; coefficient `−1/2` has norm 2. | Pass with the differential factor; global injectivity correctly excluded. |
| 0.4 Number-field model | ℚ_p; quadratic units at p=3; the two quadratic 2-adic tests | ℚ completes to ℚ_p; a nonsquare unit gives `(e,f)=(1,2)`, a square residue gives two completions of degree 1. ℚ₂(√−1) has `(2,1)`, whereas ℚ₂(√−3) has `(1,2)`. Zero parameter maps to the elliptic identity. | Pass; closeness cannot be replaced by congruence mod 2 alone. |
| 1.1 Two predicates | `πX+X^q`, `πX`, and `πX+X^q+X^(q+1)` | Reductions are respectively `X^q`, `0`, `X^q+X^(q+1)`; degrees are q,1,q+1. The zero polynomial has derivative 0, not π. | Pass; the real predicate bodies exclude the wrong models. |
| 1.2 Interpolation headline | `f=g,a=0,1`; cyclotomic p=2,3 | Intertwiners are 0 and X. Quadratic coefficient is 0 at p=2; at p=3 the equation `3c+3=9c` gives `c=1/2`. | Pass; not an identity-only headline. |
| 1.3 Existence/uniqueness headline | `O=𝔽₂[[t]],f=tX+X²`; cyclotomic ℤ₃ | `f(X+Y)=tX+tY+X²+Y²=f(X)+f(Y)`; for the multiplicative law, `1+f(F(X,Y))=(1+X)³(1+Y)³`. | Pass in equal and mixed characteristic. |
| 1.4 Coordinates | `f=2X+X²,g=2X+3X²`; unit 1 and 3 | `2c+1=4c+3` gives `c=−1`; with equal f,g the unit comparisons have derivatives 1 and 3. Composing multiplicative [2] and [3] gives `(1+X)^6−1` in both orders. | F04 repaired. |
| 2.1 Finite torsion | `q=3,h=1,m=0,1,2`; square-zero base `𝔽₃[ε]/ε²` | Ranks are 1,3,9. Multiplicative `[3]=X³` over the square-zero base gives free basis 1,X,X² and rank 3. Additive `[3]=0` gives an infinite-rank quotient and is excluded by finite height. | Pass; nonreduced bases are not silently omitted. |
| 2.2 Tate module | Rank-one cyclotomic; quadratic coefficient ring | `T/3²T` has 9 elements; `V/T=ℚ₃/ℤ₃` is divisible, not free. Quadratic `O`-rank 1 gives ℤ_p-rank 2, not 1. | Pass; inverse/direct limits distinguished. |
| 2.3 Primitive-root degree headline | Cyclotomic ℚ₂ and ℚ₃, m=1,2 | Degrees 1,2 and 2,6 equal `(q−1)q^(m−1)`. The root 0 fails primitivity. The guard `m≥1` excludes the subtraction boundary. | Pass. |
| 2.4 Tate character | ℚ₅, arithmetic Artin on unit 2 and uniformizer 5 | Unit scalar is `2⁻¹≡3 mod 5`, rather than 2; uniformizer scalar is 1. At the first level the scalar group has 4 elements. | Pass; sign convention discriminated. |
| 2.5 Norm-group headline | m=0; ℚ₅ at m=1 | For m=0 roots are `{0}` and both sides hold for every `x∈K×`; `π^ℤ U(K,0)=K×`. At m=1, unit 2 acts by 3 and is outside `π^ℤ U(K,1)`; π acts by 1 and is inside. | Pass in both directions, including depth zero. |
| 2.6 Uniformizer change | `π′=2π` over ℚ₅; `u=1`; inverse comparison | At `Art(π′)`, old character `1/2` times twist 2 gives 1; inverse twist would give `1/4≠1`. For u=1 both characters coincide. The forward linear coefficient satisfies `σ(b)=2b`, its inverse `σ(b⁻¹)=b⁻¹/2`. | Pass; LT65 source remains uncertified. |
| 3.1 Marking and coefficient base | `[3]` on multiplicative ℤ₂; ramified quadratic action at p=3 | Integral derivative 3 differs from 1; residual `X+X²+X³` has derivative 1 but is not X. On `ℤ₃[π]/π²`, one deformation parameter has values 0,π,2π; imposing the height-one quadratic action gives one class. | Pass; strictness, marking and extra action differ. |
| 3.2 Coefficient algebra | Law coefficient XY; `[π]` coefficient `X^q` | Weights are 1 and `q−1`; q=2,3 give 1,2 for the latter. A coordinate law and its nontrivial coordinate transform can share one marked deformation class. | Pass; not the deformation ring. |
| 3.3 Cocycles | Kernel I=0; `I=(ε)`, coordinate change `(1+εc)X` | I=0 gives the zero space. Transport of the multiplicative law gives XY coefficient `1−εc` versus 1; the difference `−εc` is a coboundary and represents class 0. For p=2,c=1 it is ε, not 0 as a coefficient. | Mathematical pass; locator repair R02. |
| 3.4 Lifting and rigidity | Same square-zero transport; additive residual infinite height | Coordinate transport gives distinct coefficients 1 and `1−ε`, but the same marked class. Additive endomorphism `εX^p` is nonzero and reduces to 0, so finite height is necessary for reduction rigidity. | Pass; native rigidity used only at finite height. |
| 3.5 Tangent dimension | Heights 1,2,3 | Dimensions `h−1` are 0,1,2. A height-one quadratic action gives dimension 0; forgetting it gives an underlying height-two problem with dimension 1. | Pass. |
| 3.6 Universal deformation headline | Heights 1,2; dual numbers over 𝔽₃ | Rings B and `B[[t]]`; residual-identity maps to `𝔽₃[ε]/ε²` give respectively 1 and 3 parameter values. For imperfect `𝔽_p(t)`, residue-compatible coefficient maps can send t to t or `t+ε`; fixing B matters. | Pass as a roadmap extension with the named descent route. |
| 3.7 Elliptic comparison | Supersingular height two versus ordinary height one | Underlying formal deformation tangent dimensions are 1 and 0; universal elliptic tangent dimension is 1. The supersingular hypothesis selects the matching 1, not the ordinary 0. | Pass; comparison is on the supplier's domain. |
| 4.1 Honda operator | ℤ₂, `ℓ=X,u=2+ΣT^i`, q=1 versus 2 | q=1 gives `2+1+1+⋯` in coefficient 1; q=2 gives `2X+X²+X⁴+⋯`, with coefficients 2,1,1. | F02 repaired by `q≥2`; finite support per coefficient. |
| 4.2 Functional-equation integrality | `ℓ=X+X²/p`, p=3 and p=2 | The transported law has XY coefficient `−2/3` at p=3. At p=2 that coefficient is −1, but the `X²Y²` coefficient is `−5/2`, still nonintegral. | Pass; the type condition is substantive. |
| 4.3 Honda comparison | `f=2X+X⁴`; sparse logarithm | Actual coefficient at degree 4 is `−1/14`; sparse Honda coefficient is `1/2`; strict comparison coefficient is `−4/7`. They are isomorphic, not identical logarithms. Type `p−sT²` yields parameter sp. | Pass; unramified restriction retained. |
| 4.4 Elliptic headline | `y²+y=x³` at p=2; scalar signs | Δ=−27 is a 2-adic unit; counts are 3 over 𝔽₂ and 9 over 𝔽₄; trace over 𝔽₄ is −4, parameter −2. In general the signed counts are `(p−s)²`; p=2 gives 1 or 9. | Pass; no p=2 exclusion or wrong sign. |
| 5.1 Lattices | Rank-two T; index-3 enlargement versus full `3⁻¹T` | First quotient has 3 elements; full `3⁻¹T/T` has 9. L=T has quotient 0 and trivial kernel. | Pass; index and rank are not conflated. |
| 5.2 Integral quotient | Multiplicative ℤ₂, kernel `{0,−2}` | Product `X·F(X,−2)=−X²−2X` reduces to `X²`; target coordinate −X converts it to `[2]=2X+X²`. Trivial kernel gives X. | Pass; normalization and target coordinate recorded. |
| 5.3 Homomorphisms | Rank-one lattices T and `p⁻¹T` | Scalars carrying T into `p⁻¹T` form `p⁻¹ℤ_p`; scalar `p⁻¹` is an isomorphism with inverse p. End(T)=ℤ_p; scalar 0 gives the zero map, not an isomorphism. | Pass. |
| 5.4 Actual-lattice descent | `a=π_F`; order-three unit class | Actual image of T is T, whereas literal `π_F⁻¹T/T` has `#k_F` elements; their homothety classes agree. A unit class u of order 3 acts by u², not u. | F03's original lattice occurrence repaired. |
| 5.5 Elliptic quotient comparison | Multiplicative coordinate model, degree 2 | Quotient coordinate `−2X−X²` differs from `[2]=2X+X²` by target derivative −1. The logarithm comparison therefore has the same −1 factor. | Pass; generic coordinate equality would be false. |
| 6.1 Canonical lift | Quadratic extension; level zero | Relative height 1 restricts to height 2; tangent dimension with the full action is 0. Endomorphism order is `O_F`, index 1, and the level-zero orbit has one class. | Pass. |
| 6.2 Marked quotients | Indices `q₀^0,q₀^1`; quadratic unramified rescaling | Frobenius exponents are 0,1; multiplication by `π_F` changes the exponent by residue degree 2 in the unramified quadratic case. At q₀=2,s=1 quotient degree is 2. | Mathematics consistent; placement R01. |
| 6.3 Classification | Cubic order `O₀+ϖ₀O_F`; quadratic order | Cubic lengths give total 3 versus twice quotient length `2·1=2`; not Gorenstein, so trace dual is not free although its multiplier order is O. Quadratic lengths give `2=2·1`; proper lattices are free. | Pass; marked and unmarked classes not identified. |
| 6.4 Quadratic orders | s=0,1; ramified `π_F²=3` | `O_0=O_F`, conductor `O_F`; at s=1 conductor is `3O_F`, of π_F-valuation 2, not 1. At s=0 `1+O_F` contains 0, so the positive-level units formula cannot apply. | Pass; definition needed before its use in §6.2. |
| 6.5 Quadratic levels | q₀=2,s=1; q₀=3,s=2 | Marked orbit sizes are 3 versus 2, and 12 versus 9, for unramified versus ramified. Each level has one unmarked homothety class. | Pass; R01 moves the earlier comparison here. |
| 6.6 Field-of-moduli headline | L=T; a unit class of order 3 | Stabilizer for T is all `F×`, hence field F and degree 1. For a nontrivial order-three orbit, inverse action has exponent 2 versus forward exponent 1. Uniformizer changes the representative but fixes its marked class. | Pass; fields contain F and retain the twist component. |
| 7.1 Degree headline | q₀=2,3; s=0,1,2 | q₀=2 gives degree 1 at zero, then unramified 3,6 and ramified 2,4; q₀=3 gives 1, then 4,12 and 3,9. Wrong positive-level substitution at zero gives 3/2 or 4/3. | Pass. |
| 7.2 Uniformizer headline | q₀=3, s=1,2; ramified canonical example | Unramified valuations 1/4,1/12; ramified 1/3,1/9. For `π²=3`, coefficient of X³ in `[π]²` is `π+π³=4π`, valuation 1, while nonzero elements of `𝔪_B` have valuation at least 2. | Pass; canonical level treated separately. |
| 7.3 BKO primed fields | p=5,s=0,1,2,3 | Degrees 1,6,30,150; `O/O_s` has size `5^s`. The first kernel's field has degree 6 while its nonzero points generate degree 24. | Pass; rational subgroup is not a rational generator. |
| 7.4 Infinite primed tower | p=5 tame/pro-p factors | Tame order `(25−1)/(5−1)=6`; successive finite orders 6,30,150. A bare ℤ₅ would lose the order-6 subgroup. | Pass. |
| 7.5 Ramified boundary | p=5, level-one lift | Base extension degree 6, valuation of −5 is 6 rather than 1, endomorphism-order index is 5 rather than 1; reduction of `[−5]` is nevertheless `X²⁵`. | Pass; correctly refutes dropping unramifiedness. |
| 7.6 Neighbours | Rank two over ℤ₅; levels zero and positive | Lines in 𝔽₅² are five `⟨e₁+a e₂⟩` and one `⟨e₂⟩`: six total. Positive levels split 1 inward + 5 outward; level zero has 6 outward. Multiples of one vector give only one line. | Pass; printed source typo corrected. |
| 8.1 BKO character | p=5,n=0,1 | Full division degrees 24 and 600; Δ has order 24, pro-p quotient has rank 2. Arithmetic Artin on a residue unit acts by its inverse, not itself. | Pass. |
| 8.2 Plus/minus directions | `z=5(a+bα)`, `c(α)=−α` | Projectors give 5a and 5bα; traces are 10a and 0. Minus exponential has norm 1; plus unit `1+5` has norm 36, not 1. The two logarithmic lines intersect in 0. | Pass; inverse of 2 exists here. |
| 8.3 Fixed fields | p=5,n=0,1,2 | Θ-degrees 1,25,625; Ψ-degrees 1,5,25. `Gal(Ψ₁/ℚ₅)` has order 10, not a power of 5. | Pass; correct base for “pro-p.” |
| 8.4 Fields/generators | p=5,s=0,1,2 | Primed degrees 1,6,30; unprimed 1,5,25. `6·5=30`, with degree-one intersection for the first rectangle. Modulus field degree 6 differs from torsion-generator field degree 24. | Pass; shift and tame factor retained. |
| 8.5 Generator signs | Labels 0,1,2; base point of logarithm 25 | Signed logarithms are 25,−25,25. `[5]w₁=w₀`, whereas `[−5]w₁=−w₀`. | Pass; trace consequences now in §9.3. |
| 9.1 Formal trace | Quadratic `x=√5`; cubic `α³=5` over ℚ₅; identity extension | Additive traces are 0 in both extensions; multiplicative formal traces are −5 and +5 because norms of `1+x`, `1+α` are −4 and 6. The cubic closure has S₃ action, which permutes the three summands. Identity trace is x; a base point has trace `[d]x`. | Pass; both Galois and non-Galois cases, formal versus ordinary trace. |
| 9.2 Tame descent | p=5, a base-field point x | Trace is `[6]x`; section `[1/6]` composed with trace is x. The normalized averaging map fixes x, whereas unnormalized trace multiplies it by 6. | Pass; denominator is a unit. |
| 9.3 Trace-compatible headline | p=5,s=0, `ℓ(x)=25`, labels 1→0 | Both degrees `6·5=5·6=30`; both unsigned logarithms 750. Corrected comparison gives −750 on both sides; omitted correction gives +750 on one side. Torsion field degree 600 differs from source degree 30. | F05 repaired. |

### Lean acceptance, signatures and padding

The required `lake env lean` invocation, run from the pinned content checkout on the package's `Suggested.lean`, exited 0. Its only diagnostics were `sorry` warnings at lines 77, 91, 113, 129 and 151. The three imported Tau Ceti object files were present; no build was needed. No Lean command was left running.

There are **seven actual declarations**: two real predicates and five theorems. The supplied automated inventory's eighth entry, `it`, comes from prose inside a docstring and is not a declaration. I appended `#check @name` for all seven real declarations to a scratch copy and elaborated it successfully. No instance, standing hypothesis or scalar parameter disappeared. The two construction theorems retain the domain, DVR, finite-residue and irreducibility hypotheses without adding completeness or characteristic zero. The two field theorems retain the local-field and characteristic-zero instances; the degree theorem retains `m≥1` and primitivity, and the norm theorem retains the equality tying the field unit to π. The elliptic theorem retains primality, both allowed signs, unit discriminant and the signed point count.

| README headline | Acceptance file or reason it is not stated |
|---|---|
| Lubin–Tate existence and uniqueness, §§1.2–1.3 | `exists_formalGroup_of_isLubinTateSeries`, line 77; `existsUnique_lubinTate_intertwiner`, line 91. Two simple native coefficient predicates, lines 56 and 62, make these statable. |
| Division-field degree and splitting, §2.3 | `finrank_adjoin_primitive_lubinTate_root`, line 113. A primitive coordinate in the native algebraic closure, not an arbitrary stand-in field. |
| Division-field norm group, §2.5 | `artinMap_fixes_lubinTate_roots_iff`, line 129, on the actual native Artin map and native unit filtration. |
| Supersingular elliptic Lubin–Tate structure, §4.4 | `exists_lubinTate_endomorphism_formalGroup`, line 151, on the actual Weierstrass formal group over `W(𝔽_(p²))`, for every prime. |
| Torsion/Tate freeness and scalar character, §§2.2,2.4–2.5 | Docstring lines 26–30 names the missing formal coefficient action, torsion and Tate character. Available evaluated points and Hom/Iso are explicitly acknowledged. |
| Marked finite-height representability, §3.6 | Docstring lines 31–33 names the missing action-sensitive marked deformation functor. No fake Prop-valued replacement is supplied. |
| Honda functional equation and type comparison, §§4.2–4.3 | Docstring lines 34–35 names the missing Frobenius-skew power-series carrier. |
| Quasi-canonical classification, fields, degrees and uniformizer, §§6.3–7.2 | Docstring lines 36–38 names missing lattice quotients, markings and moduli. |
| BKO tower/trace comparison, §§8.4–9.3 | Docstring lines 39–41 names the particular fields, comparisons and formal traces needed. A generic point carrier alone does not state this headline. |

Every own backticked identifier in the README resolves to one of those seven declarations; each Lean declaration is represented in the README. No statable headline omitted in favor of a weaker scalar identity was found. The five theorem proofs were each replaced on a scratch copy by one-tactic alternatives `simp`, `rfl`, `infer_instance` and `exact?`, each required to close the whole goal. All five ended with an unsolved-goal error from `exact?`; none was discharged by an earlier alternative. Reading the signatures also found no boundary-only theorem, restated definition or README Check masquerading as a headline. No padding finding is warranted.

The file has one `import Mathlib` and only the three used individual Tau Ceti imports, one module docstring, the required namespace and layer comments, real predicate bodies, declaration docstrings and `theorem` rather than `lemma`. There is no sorry'd data, `set_option`, opaque placeholder or admitted example.

### Pinned-library audit

Pins inspected: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are relative to the corresponding library repository. These were opened at the pins; external search suggestions were treated as leads, not proof that an object exists or does not exist.

| Objects/declarations | Pinned files and lines; comparison |
|---|---|
| Formal group carrier | `Mathlib/RingTheory/FormalGroup/Basic.lean:57,75,127,185`: `FormalGroup`, `IsComm`, `Point`, `map`. The group structure itself has no inverse field or commutativity field. `Point` uses substitution-compatible series, not valued-field points. |
| Substitution | `Mathlib/RingTheory/PowerSeries/Substitution.lean:40,158,301,457,511,543,567`: `HasSubst`, `subst`, `X_subst`, `substInv`, both inverse identities, `substInvOfIsUnit`; `Mathlib/RingTheory/MvPowerSeries/Substitution.lean:217,228`. Polynomial substitution at 1 can equal 1 even though 1 is not nilpotent. |
| Evaluation and preparation | `Mathlib/RingTheory/PowerSeries/Evaluation.lean:60,157,197`: `HasEval`, `eval₂Hom`, `comp_eval₂`; `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean:689,814`: quotient equivalence and preparation existence. Completeness, separation and continuity hypotheses remain part of their use. |
| Local-field and DVR carriers | `Mathlib/NumberTheory/LocalField/Basic.lean:46`; `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `Mathlib/RingTheory/Valuation/Integers.lean:32`; `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean:28,36`. The local-field class includes nontrivial valuation, compatible topology and local compactness; the DVR class explicitly excludes fields. |
| Polynomial, closures and Galois | `Mathlib/Algebra/Polynomial/Degree/Defs.lean:59`; `Mathlib/RingTheory/PowerSeries/Basic.lean:467`; `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127`; `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34`; `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42,101`. The latter quotient is topological abelianization, not an assumption that the absolute group is abelian. |
| Krasner/local models | `Mathlib/Analysis/Normed/Field/Krasner.lean:56,63`; `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381`; `Mathlib/RingTheory/DedekindDomain/AdicValuation/Completion.lean:51,294`. Krasner has strict-distance and separability/splitting inputs. |
| Witt vectors, finite fields, curves | `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/FieldTheory/Finite/GaloisField.lean:68`; `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:131,230`; `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477`. The point carrier includes the identity; the unit discriminant makes the reduced model elliptic. |
| Native formal Hom/Iso/points | `TauCeti/RingTheory/FormalGroup/Hom.lean:137,351`; `TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Basic.lean:85`; `TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Hom.lean:42`. Point coordinates carry `HasEval`; the group structure requires complete Hausdorff linear topology. These do not bundle the formal `O_K`-action. |
| Native analytic and rigidity inputs | `TauCeti/RingTheory/FormalGroup/Logarithm/Convergence.lean:44,57,62,68`; `TauCeti/RingTheory/FormalGroup/Exponential/Padic.lean:76`; `TauCeti/RingTheory/FormalGroup/Rigidity.lean:186,229`; `TauCeti/RingTheory/FormalGroup/Logarithm/Naturality.lean:62,138,149`. The Hom logarithm formula contains the differential factor; the strict formula requires strictness. |
| Elliptic formal points | `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58,75,83`; `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/AdicPoint.lean:69`; `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Hom.lean:149`; `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean:273,292`; `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Range.lean:158`. The generic point map's auxiliary hypothesis is not silently discarded; the unconditional map is used through the Dedekind completion presentation. |
| Arithmetic reciprocity | `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,132,205,345,397`: `artinMap`, finite restriction, norm-preimage criterion, norm functoriality and field naturality. |
| Units and approximation | `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:104,145`; `TauCeti/RingTheory/Henselian/Teichmuller.lean:94`; `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`. Depth zero is the integer-ring unit group. |

Object searches for coefficient actions, Lubin–Tate interpolation, quasi-canonical quotients, fields of moduli and formal traces found no pinned proof duplicating a kept headline. Near-matches such as `PowerSeries.X_subst` (above), `IsPrimitiveRoot.subOnePowerBasis` in `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean:135`, and `Algebra.norm_eq_prod_automorphisms` in `Mathlib/RingTheory/Norm/Transitivity.lean:270` are substitution, cyclotomic and norm inputs, not the general formal-module existence, primitive-coordinate degree or Artin-kernel statements. Generic convergence, rigidity and elliptic formal-point objects are correctly imported, not rebuilt.

### Ownership, suppliers and order

The board-package index was read before absence conclusions. I used the roadmap service's object search and inspected main/permitted open heads, including all five closest overlap candidates. Main BordismFormalGroups, EllipticCurves and ModularCurves supplied the house-style comparison. An open revision of an existing roadmap was inspected for overlap, not substituted for its main version as a supplier.

| Supplier or overlap | Resolved evidence and ownership boundary |
|---|---|
| RelativeFarguesFontaine §2.5 | New-roadmap PR #1209, `TauCetiRoadmap/RelativeFarguesFontaine/README.md:1296`: finite division fields, scalar Galois isomorphisms and infinite tower. Imported here; retained targets compare primitive polynomial coordinates to those fields. |
| GrossZagierAndArithmeticHeights §7.2 | PR #1487, `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:2944`: marked completed-strict-base quadratic lifts, orders, quotient degrees and orbit sizes. This package adds finite-residue comparisons and higher-degree lattices. R01 concerns their placement, not a second owner. |
| EndoscopicTransferAndUnitaryTraceComparison §§10.2,12.3 | PR #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:3623,4593`: finite-residue and algebraically closed marked deformation functors. The arbitrary specified-B extension here is explicitly compared to them. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | PR #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:591,988,1160,1220,1737,1780,3236,3289,3326`, §§R07.1.1,1.8,1.12–1.13,1.20–1.20a,2.6–2.8. Frobenius/Verschiebung, Tate module, formal Lie groups, closure, quotient and Dieudonné contracts exist. Line 1192 uses radical coordinates; the package now compares the correct subgroup. All five citation-resolver leads are planned declarations in this supplier, not missing pinned declarations. |
| RamificationOfCompleteDiscretelyValuedFields §4a.3 | `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:1185`: completed maximal-unramified field, residue closure and inertia comparison. Earlier in the order; no reverse ownership. |
| BordismFormalGroups §§F1,F5 | Main `TauCetiRoadmap/BordismFormalGroups/README.md:46,543`: general formal-group algebra and ordinary perfect-residue deformations. Revision PR #1808 retains F1 and F5 (`README.md:249,1185` at that head), imports native general algebra and keeps ordinary deformation theory. No duplicate formal coefficient-action theory or dropped cited section. |
| EllipticCurves Layers 1,3 | Main `TauCetiRoadmap/EllipticCurves/README.md:423,637,683`: elliptic isogenies, invariant differential, formal group/logarithm, Frobenius and Hasse theory. The scalar-Frobenius comparison uses these; no second elliptic formal carrier is built. |
| ModularCurves §§0B,0C,2B,7C–7F | Main `TauCetiRoadmap/ModularCurves/README.md:688,779,1243,2417,2427,2442,2528`: finite locally free groups/quotients, elliptic quotients, formal completion, marked deformations, p-divisible groups and Serre–Tate. Domain hypotheses agree. |
| ClassFieldTheory Layers 6–8 and former §2.6 | Main `TauCetiRoadmap/ClassFieldTheory/README.md:1150,1204,1466`; former-numbering map at lines 260–268 sends the old convention citation to Conventions C6. Arithmetic normalization, naturality and characteristic-zero local existence are supplied. The older §2.6 citation at package line 892 is therefore not drift. |
| LocalFieldsRamification Layers 0–2 | `Completed/LocalFieldsRamification/README.md:70` onward, including Layer 2 at line 576: local fields, units, logarithmic range, unramified extensions and arithmetic Frobenius. Completion of the maximal-unramified field is assigned separately. |
| AnticyclotomicLocalUnits | PR #1692, `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:4,93`: imports this formal-module/tower package and owns local units and its application point systems. No mutual prerequisite or duplicate general trace construction found. |
| FunctionFieldArithmetic | PR #1474, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1269`: imports the general Layer 1 construction, owns its equal-characteristic arithmetic extension. This package's Layer 2 remains mixed-characteristic by its explicit boundary. |
| EllipticCurveModularityWild3Adic | PR #1484, `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:1`: modularity/torsion application, not a second owner of the general formal-module construction. |
| VectorBundlesAndIsocrystals | PR #1205, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1095`: Lubin–Tate universal-cover/Dieudonné/period application. It does not replace the elementary arbitrary-series construction and marked lattice-moduli theory reviewed here. |

The supplied overlap audit is based on main `32cc4c3` and 438 open heads indexed on 2026-11-11. It lists no other PR changing this roadmap, dropped cited id, or cited id defined only by an open revision. Inspection of the nearest heads found no contrary ownership evidence. Searching all readable roadmap Lean files for the five kept theorem names returned “no match on main or in any open roadmap pull request”; no duplicate fully qualified declaration was found. No forbidden supplier is cited.

The required dependency command returned:

```text
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All external supplier/Needs citations were resolved. The mechanical check does not inspect the internal section-order defect in R01. No supplier gap is declared and no conditional acceptance is claimed.

### Shape, scope and policy

The README has the required summary, ownership, conventions, exact contracts, build description, ten mathematically named layers, ten Examples and Dependencies endings, downstream consumers and references. All 50 numbered targets have a Needs line and at least three Checks; definitions have their API lists. R02 is the identified locator correction. The layers combine the prerequisites of formal modules, deformation, Honda theory and marked lattice moduli toward the end theorems; they do not claim to follow one source or reproduce its chapter arrangement. The retained internal forward use is R01.

No route-specific shortcut, “good primes” replacement, computational algorithm, source copying, re-planning of a main roadmap, process residue, HTML anchor, machine path, pull-request number or target-number catalogue was found in the authored README/Lean. The BKO assumption p≥5 is confined to that application; the general Lubin–Tate and quadratic theory retains small primes and ramified cases. Metadata parses, and all references have manifest entries. The source manifest's existing locator mistake is reported rather than edited.

## Not verifiable

- LT65 remains uncertified/paywalled under its settled manifest entry. In particular the sampled §2.6 locator and the LT65 support cited by §§0.2–0.3,8.1–8.2,9.1 were not checked against full text. Independent calculations and supplier checks above do not change that access status. No renewed request was made.
- Some equations and Newton-polygon diagrams in the cached G86/Y95 extractions are incomplete. The readable G86 Proposition 5.3 degree and uniformizer statements and proof prose support the sampled quadratic results; I do not claim a fresh transcription check of every missing display in Y95 §§9–10. Earlier round computed values were retained where applicable, not treated as a replacement source text.
- VZ07's normalized/closed-residue-field results and LT66's ordinary formal-group results are not literally every arbitrary-imperfect-residue-field formal-module theorem of §§3.5–3.6. The fixed-B finite-jet/descent route was reviewed as proposed mathematics, not as a theorem already stated in those sources. Likewise H70 Theorem 9/H68 Corollary 4 concern curves over ℚ; the additional local scalar-Frobenius argument is the roadmap's own proof route.
- `NonordinaryCMSpecialValues` is named only as a downstream consumer. The supplied service did not expose its README; its future consumption was not checked. No claim that it exists nowhere is made, and it supplies no prerequisite here.
- Ownership conclusions concern the supplied main checkout, board index and accessible open-head index, not later or unavailable heads. A successful elaboration with `sorry` checks types, not the truth of the admitted mathematics.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed p.956 (BKO21 lines 573–588): the source says trace 2sp corresponds to type p+sT²; it should be type p−sT² for parameter sp; affects a stated result.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959 (BKO21 lines 754–758): the source says outward neighbours use scalar multiples of the same Tate vector; it should be distinct lines generated by p^(−s−1)t+(a/p)αt; affects the proof.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959 (BKO21 lines 758–765): the source says the outward trace uses conjugates indexed by x_s; it should be x_(s+1); affects the proof.
- **Misprint** in BKO21 at §2, printed p.948 (BKO21 lines 247–249): the source says the anticyclotomic extension is pro-p over ℚ_p; it should be pro-p over Φ and dihedral over ℚ_p; affects a stated result.
- **Error** in Y95 at §2, printed p.294 (Y95 lines 85–88): the source says its coefficient-algebra category has an initial object for every residue extension; it should be suitably restricted or formulated with a specified coefficient algebra B; affects a stated result.
- **Error** in Y95 at the quadratic example in §6, printed p.302 (Y95 lines 372–376): the source says every quadratic quasi-canonical modulus is prime, without a level-zero exception; it should be restricted to positive level in the unramified case, treating the canonical lift separately; affects a stated result.

These source issues are already avoided by the package. For the imperfect-field issue, residue-compatible maps to `𝔽_p(t)[ε]/ε²` can send t to t or `t+ε`, contradicting uniqueness of an asserted initial coefficient object. For the modulus issue, the normalized unramified canonical modulus can be 0, which is not a prime element. Neither issue requires narrowing the repaired package's general theory.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a6a668c38ff25d8b4fc670e11d10586131e596d7", "job": "REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
