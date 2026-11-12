<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12963#issuecomment-6791191974 -->
Review (codex) of 4b6ddb8

Verdict: needs_changes

1. **F01** (P2) Import the CM cyclotomic module structure from its earlier owner

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:22`, also lines 3, 16, 806–813; `Suggested.lean:10`. The scope says: “Their CM cases are theorems of this roadmap: Theorem 12.4 for CM forms is §7.8”.

   **Claim:** The rational CM clauses of Kato's Theorem 12.4 belong here rather than to KatoEulerSystems §4.4. Section 7.8(4) makes them a separate target, with a proof route, and the summary and Lean docstring advertise that ownership.

   **Witness:** Open PR #1804, `TauCetiRoadmap/KatoEulerSystems/README.md:199` includes every CM form among admissible pairs; §4.4, lines 1808–1827, already owns CM torsion, torsion-freeness and rational rank-one freeness, including the contained dyadic case.

   This is an object-level overlap, not a missing hypothesis in either theorem. The supplier explicitly invokes PadicFamilies §4.0.3 for its CM rational clauses. Its admissibility restriction excludes no CM form. Neither its §4.4 nor its ownership text delegates that result to this Part II. The package cannot unilaterally limit the supplier to non-CM forms because it prefers to build the proof through elliptic units. The binding ownership rule applies to planned results as well as completed proofs.

   **Exact repair:** Import the cyclotomic module-structure result from KatoEulerSystems §4.4, with its PadicFamilies §4.0.3 contract. Remove §7.8(4) as an independently owned target and adjust the summary, scope, supplier contracts and Lean docstring accordingly. In §7.8(2)–(3), distinguish the imported cyclotomic torsion/freeness assertions from the new assertions concerning the elliptic-unit submodule. Retain §7.8(1)'s localized ray-tower primitivity and vanishing, and the assertion that `Z(ψ,T)` generates generically: those supply information the cyclotomic structure theorem does not. The lattice inequality of §7.9 also has an additional integral range and a specifically constructed elliptic-unit lattice, so it need not be deleted. Correct the scope's description of the supplier's rational CM coverage rather than calling it non-CM only.

   **Repair test:** For `f = 32.2.a.a`, `p = 2`, supplier admissibility is automatic. Both rational cyclotomic statements give `rank H² = 0`, `rank H¹ = 1` on each component; the full cyclotomic torsion group has order two. Importing that result preserves this case. It does not assert that a particular ray-tower element generates: retaining §7.8(1) and the `Z(ψ,T)` assertion preserves the genuinely additional content. Supply remains KatoEulerSystems → this Part II.

2. **F02** (P3) The new reduction warning cites the wrong printed page

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:317`: “Kato, proof of Proposition 15.9, p. 259, Kato lines 5492–5494”.

   **Claim:** The source's assertion of good reduction everywhere occurs on printed page 259.

   **Witness:** Kato line 5460 starts printed page 258; lines 5492–5494 precede the page-259 header at Kato line 5501.

   **Exact repair:** Change this particular `p. 259` to `p. 258`. Keep the line locator and the corrected reduction criterion. Other citations spanning the whole proof may continue to use pp. 258–260.

   **Repair test:** The cited lines lie strictly between the headers for 258 and 259. The repaired page and line locators select the same passage.

3. **F03** (P3) Correct the distinguished-polynomial Check for inversion

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:657`: “substituting it into a distinguished polynomial of degree λ gives λ times a unit”.

   **Claim:** A distinguished polynomial becomes its degree multiplied by a unit under `T ↦ −T/(1+T)`.

   **Witness:** Take `P(T)=T`, of degree one. Its substituted value is `−T/(1+T)`, a nonunit with zero constant coefficient. One times a unit has nonzero unit constant coefficient.

   **Exact repair:** Replace the quoted clause by the reduction argument: for a distinguished polynomial `P` of degree `d`, modulo the coefficient uniformizer, `P(−T/(1+T)) = (−1)^d T^d/(1+T)^d`. Thus its first unit coefficient has index `d`, and substitution preserves λ. Do not replace the sentence by an assertion that the full substituted polynomial is `T^d` times a unit: a distinguished polynomial can have a nonzero constant coefficient divisible by the uniformizer.

   **Repair test:** Degrees zero, one and two give reduced orders zero, one and two respectively. For `P=T+ϖ`, the constant coefficient remains `ϖ`, while the first unit coefficient is at index one. This validates the repaired argument and excludes both plausible incorrect readings. The functional equation and the stated λ-equality need no change.

Three findings: one P2 ownership defect and two P3 corrections. Both findings from the previous review are repaired. The mathematical endpoint remains the rational main conjecture for every CM newform of weight at least two, at every prime.

## Verified sound

### Previous findings, checked before the new pass

| Previous finding | Repaired passage | Independent calculation and status |
|---|---|---|
| F01: ideal action lacked coprimality with the level | README:312: “a prime to f and to the primes ramified in K′/K”; line 316 repeats it. | **Repaired.** For `K=ℚ(i)`, `π=1+i`, `f=(π³)`, quotient by `E[π]` changes the point annihilator to `(π²)`, whereas `(f:(5))=f`. An isomorphism cannot restore the first annihilator. The hypothesis and negative control now separate these cases. |
| F02: split CM height one lacked good reduction and an unramified coefficient setting | README:560 specifies good reduction at an unramified place above the split prime; scope lines 14 and 29 repeat the restriction. | **Repaired.** At 5, `y²=x³−x` has discriminant 64 and eight points over `𝔽₅`, hence trace −2 and ordinary height one. For `y²=x³−25x`, `v₅(c₄)=2`, `v₅(Δ)=6`, giving additive reduction, whose formal group is not the good ordinary height-one group. |

The repair report did not leave either finding “not actionable”. The repaired patterns were searched throughout the package. Coprimality is retained in the Artin action, ray representatives and auxiliary ideals (README:312, 316, 335, 353, 393); good reduction/unramified coefficients are retained in the Coleman construction and its uses (lines 560–574). The inert example keeps good reduction and distinguishes relative height one from absolute height two.

The newly added reduction criterion in line 317 was checked separately, rather than accepted from the repair report. The inertia action is the image of the units congruent to one modulo the prime-to-place part of the level; Néron–Ogg–Shafarevich makes its triviality the required criterion. For Gaussian level `(π³)` at π that kernel has four elements; away from π it has one. The added auxiliary-prime argument in §3.3 makes the unit injection hold at every relevant place before invoking relative-height-one reciprocity. Its extra Euler factor is nonzero, so descent does not divide by zero. R02 concerns only the page of the source error this argument corrects.

### Seeded source verification

All fifteen requested targets were checked against the available legal text, including hypotheses and the distinction between printed pages and extraction pages. No author-flagged unresolved locator requiring another source was found. The manifest has ten work entries, with no new key needed. OCR limitations are listed below rather than silently certified.

| Target | Text opened and locator result |
|---|---|
| §0.2 Normalization, regular primes and characteristic ideals | JLK lines 1412–1498, Lemmas 7.2, 7.6–7.7, pp. 34–35: normalization and regular localizations after inverting p, not integral normalization at singular primes. The package preserves that distinction. |
| §1.5 Euler-factor sequence | JLK lines 845–909, Lemma 4.3, pp. 20–21, and lines 1480–1498, Lemma 7.7: localization and the local determinant factor. Finite places dividing the tame level remain in the sequence. |
| §1.7 Unit-module structure | JLK lines 960–1058, Lemma 5.1 and Theorem 5.2, pp. 23–25; Kato lines 5280–5335, pp. 253–254. The package does not infer projectivity of an augmentation quotient merely from a p-group argument. Torsion-freeness is over the appropriate ray algebra, not a claim that roots of unity never survive a cyclotomic norm limit. |
| §2.5 Kronecker limit formula | Kato lines 5242–5287, (15.5.1), p. 253; JLK lines 727–799, Theorem 3.9, pp. 17–19. Character inversion, imprimitive Euler factors and logarithmic normalization agree with the worked values below. Some displayed glyphs in Kato's extraction remain damaged. |
| §4.3 Elliptic units as Tamagawa zeta elements | JLK lines 727–799, Corollary 3.10, p. 19. Auxiliary Euler factors are invertible over the rational coefficient field, not necessarily over its integer ring. The ramified-at-p hypothesis of the corollary is retained in the comparison that uses it. |
| §4.6 Main conjecture with Euler factors | JLK lines 1030–1058, Corollary 5.3, pp. 24–25, together with Lemma 4.3 above. Each additional local term contributes its determinant; it is not discarded when its augmentation vanishes. |
| §5.5 Functional equation and λ-identity | Kriz lines 1034–1064, Theorem 27, p. 22; CGLS lines 815–844, especially (2.11) at line 836, p. 15. The involution is `χ⁻¹N`; the anticyclotomic assertion concerns λ, without adding μ-vanishing. R03 corrects the polynomial Check. |
| §7.6 Contained cyclotomic case | Kato lines 5704–5737, 15.13–15.14, p. 264. The exceptional fields and the replacement by the subgroup fixing K are retained, including the two dyadic imaginary quadratic fields. |
| §7.8 CM Theorem 12.4 | Kato lines 5738–5753, 15.15, p. 265; lines 4306–4341, 13.8, pp. 227–228; BT lines 182–184, Theorem 2.3, p. 4. The mathematical result has source support, but its cyclotomic structure clauses have an earlier roadmap owner: R01. |
| §7.9 CM lattice inequality | Kato lines 5761–5782, Proposition 15.17, p. 265. The generic rational range and Rubin condition (b) for primes above p are distinguished. The length identity is Lemma 14.15, Kato lines 4910–4934, pp. 243–244, despite the source's reference to 14.12. |
| §8.1 Archimedean induction normalization | Kato lines 5610–5678, proof of Lemma 15.11, pp. 261–263. The period comparison supplies the normalization. The archimedean embedding itself is not treated as a Galois-equivariant map. |
| §8.3 Equivariant equality on ψ-components | Kato lines 5704–5725, Lemma 15.13, p. 264, and JLK regular-prime equality. Ramified coefficients force the relevant inertia operator to be invertible after p is inverted; this does not assert an integral unit. |
| §8.5 Equality descent | Kato lines 4910–4934 and 5761–5782; BT lines 202–244, Theorem 2.6 and proof, p. 5. The package supplies the equality/Tor bookkeeping rather than citing a one-sided inequality as equality. |
| §8.6 Every-CM, every-prime endpoint | BT lines 202–244, Theorem 2.6, p. 5; Kato 15.11–15.17 as above. The conclusion is rational. It does not assert equality at height-one primes containing p. Weight is at least two. |
| §8.7 Normalization dictionary | Kato 15.8–15.11, including lines 5450–5527 and 5610–5678; BT Theorems 2.1, 2.3, 2.6. Infinity type, inverse twist, full cyclotomic group and period exponent are mutually consistent in the calculations below. |

Additional repaired passages were checked against Kato lines 5226–5239, 5492–5504; Rubin91 lines 1465–1485; Coleman79 lines 61–89; and Yager lines 93–111. The original Rubin ranges were checked at Rubin91 lines 545–571. In particular, Yager's introduction requires both good reduction and splitting and excludes 2 and 3; the package's all-prime extension uses the general Coleman supplier instead of attributing that extension to Yager.

### Computed adversarial table

The full text pass covered the 51 numbered targets, their APIs, conventions and Checks. The compact table below records the sampled targets, headlines, changed passages and representative cross-layer controls. It supplements the previous round's computed rows; no merely qualitative previous “sound” row was treated as a computation. `A` denotes the displayed power-series ring, `ϖ` a coefficient uniformizer, and lengths are at the displayed prime. Zero rings, nonabelian ray groups, arbitrary inseparable coefficient fields and weight-one forms are excluded by the actual hypotheses, rather than silently tested as admissible inputs.

| Statement | Instance and values computed on the two sides | Result / change |
|---|---|---|
| Conventions: inverse character twist | `χ(g)=i`: semilinearity contributes `χ(g)⁻¹=−i`; the uninverted convention gives `i`. | Opposite conventions are distinguished; retained. |
| §0.1 full ray and cyclotomic groups | Gaussian `f=1`: torsion orders are 1 at p=2 and 4 at p=5; at p=2 the full rational cyclotomic group still has a torsion subgroup of order 2. | Ray and cyclotomic groups must not be identified; retained. |
| §0.2 rational characteristic ideals | `A/(p)` becomes zero after inverting p, with ideal `(1)`. `A/(T²)` and `(A/(T))²` both have length 2 at `(T)` and ideal `(T²)`. | No p-primary information is claimed after rationalization. |
| §0.2 singular versus regular components | For `Δ=C₂`, `ℚ₂[Δ]=ℚ₂×ℚ₂`; the two projectors have denominator 2. They are not integral projectors in `ℤ₂[Δ]`. | Rational normalization passes; integral splitting excluded. |
| §1.1 roots and norm limits | `T₂(μ₄)=0`, though `#μ₄=4`; on a stationary copy of `ℤ₂`, norm multiplication by 2 gives inverse limit 0. | Finite roots are not a nonzero Tate module. |
| §1.4 Brauer correction | For one p-adic place the kernel of the sum map has rank 0; for two places it has rank 1. | The correction cannot be discarded before the height calculation. |
| §1.5 Euler-factor sequence | Gaussian p=5, tame level 3: tame ray torsion has order 32, inertia order 8, quotient order 4. Among the four surviving characters, two Euler augmentations are 0 and two are 2; the other 28 characters give zero local modules. | Omitting all tame factors changes the characteristic ideal. |
| §1.7 unit rank and torsion convention | On a character component the claimed unit rank is 1; the zero module has rank 0. In the cyclotomic tower `Norm(ζ₂₅)=ζ₅`, whereas a transverse norm direction acts by p and kills a stationary root limit. | Ray-tower torsion arguments are not transferred unchanged to a cyclotomic line. |
| §2.1 logarithmic residue | Auxiliary integer 5 gives `N((5))−1=25−1=24`; replacing ideal norm by integer 5 would give 4. | Norm convention discriminates. |
| §2.2 theta divisor and normalization | For ideal norm n the divisor degree is `n−n=0`. Rescaling a theta function by u changes a degree-d norm equation by `u^(d−1)`; degrees 2 and 3 force u=1, rather than leaving an arbitrary unit. | The normalization determines the function. |
| §2.3 repaired ideal action | `f=(π³)`, `a=(π)` gives `(f:a)=(π²)≠f`; `a=(5)` gives `(f:a)=f`. | Previous F01 repaired. |
| §2.3 canonical Gaussian point | On `y²=x³−x`, `α=(i,1−i)` has `[2]α=(0,0)`, `[π²]α≠0`, `[π³]α=0`. | The level is π³, not π². |
| §2.3 new reduction criterion | At π, the prime-to-π part of `(π³)` is 1, with unit kernel of size 4; away from π the kernel is size 1. | Bad versus good reduction separated; R02 only fixes its source page. |
| §§2.4–2.5 auxiliary units | At p=5, auxiliary `(5)` produces a nonunit denominator and is excluded; auxiliary `(7)` has norm 49 prime to 5. | Auxiliary coprimality prevents an invalid inversion. |
| §2.5 inverse-character factor | `N(a)=25`, `χ(σ_a)=i`: `25−χ(σ_a)⁻¹=25+i`, while the uninverted factor is `25−i`. | Sign/inversion retained. |
| §2.5 imprimitive limit formula | Gaussian trivial character with tame level 3 gives derivative `−log(9)/4`; adding an Euler factor vanishing at the evaluation point raises the vanishing order and can make the first derivative 0. | No primitive/imprimitive substitution. |
| §2.6 auxiliary ideal versus its hull | `J=(S−a,T−b)` in `O[[S,T]]`: `A/J≅O`, while at each height-one prime J localizes to A. Thus the image can be proper although its height-one divisor is zero. | Do not replace the actual elliptic-unit image by its divisorial hull. |
| §3.1 coefficient dimension | A CM line has dimension 1 over K and dimension 2 over ℚ; a principal ideal `(5)` acts by normalized scalar `5⁻¹·5=1`. | Normalization is not an unmarked isomorphism. |
| §3.2 nonvanishing auxiliary factor | With r=1 and principal integer 5, the relevant difference is `25−5=20≠0`; a mismatched exponent can instead give `25−25=0`. | The allowed infinity type and exponent are essential. |
| §3.3 new auxiliary-prime descent | Gaussian `q=(2+i)`, `ψ(q)=−1+2i`: `1−ψ(q)⁻¹=(6+2i)/5≠0`. Its analytic expression `1−ψ̄(q)/5` gives the identical value. | The factor can be cancelled; conjugation and norm match. |
| §3.3 relative height | At an inert good prime, relative `O_𝔭`-height 1 has absolute height 2; at a split good ordinary place the relevant component has absolute height 1. | The declared reciprocity gap has the needed relative generality. |
| §§4.2–4.3 determinant and scalar coefficients | Differential multiplication by p contributes valuation +1; shifting the two-term complex contributes −1. The auxiliary factor `25−1=24` has 3-adic valuation 1, but is invertible in a 3-adic field. | Neither determinant parity nor integral invertibility is silently reversed. |
| §4.5 JLK equality headline | Local DVR model `H¹=A`, `z=t`, `H²=A/t`: both lengths are 1. Replacing z by t² gives lengths 1 and 2, only an inequality. | Equality needs the specified zeta element, not an arbitrary nonzero element. |
| §4.6 Euler correction | Adding a local factor t raises each appropriate divisor length by 1. A ramified character with Euler value 0 gives factor `1−0=1`, contribution 0. | Correct local contributions on both sides. |
| §4.8 classical/rational Rubin headlines | In an inert tower the relevant local-unit rank is 2 and elliptic-unit rank is 1; their quotient has rank 1, not 0. For `ℚ(√−7)` at p=2, p divides `#μ=2`, so original Rubin condition (b) fails. | Original integral range is not extended by a rational argument. |
| §5.1 repaired formal-group range | Good Gaussian curve at 5: `Δ=64`, trace −2, height 1. Quadratic twist by 5: `v₅(c₄)=2`, `v₅(Δ)=6`, additive reduction. | Previous F02 repaired; excluded example is genuinely different. |
| §§5.1–5.2 Coleman boundary and image | For a cubic unramified coefficient orbit, Frobenius sends c to c⁵. The boundary normalized by subtracting the constant term has value 0 on constants, whereas an unnormalized constant series has its nonzero constant value. | Coefficient transport and normalization are retained. |
| §§5.3–5.4 specialization and θ-headlines | `M=A/(S−s,T)` specialized at `T=0`: both Tor and cokernel have dimension 1, so their length difference is 0. Also `λ(T)=λ(pT)=1` although `(T)≠(pT)`. | Tor cannot be omitted; λ-equality alone does not imply ideal equality. |
| §5.5 functional equation | `(χ⁻¹N)⁻¹N=χ`; applying inversion twice to T returns T. | Functional-equation involution passes. |
| §5.5 polynomial Check | `P=T`: substituted value `−T/(1+T)` is a nonunit, whereas `1·u` is a unit. Modulo ϖ, degrees 0, 1, 2 have orders 0, 1, 2. | R03: replace the erroneous clause by reduction modulo ϖ. |
| §6.2 equivariant headline | The nontrivial local terms computed in §1.5 persist after rationalization; the factors with augmentation 0 cannot all become units. | Corrected tame Euler factors are necessary. |
| §7.1 CM induction | Gaussian conductor norm 8 and discriminant magnitude 4 give level 32; Eisenstein conductor norm 9 and discriminant magnitude 3 give level 27. | Level norm and discriminant factors agree. |
| §7.2 induced representation | On restriction, eigenvalues 2 and 3 give trace 5; an element interchanging the two lines has trace 0. | Induction is distinguished from a one-dimensional character. |
| §7.5 descent control | For `A=k[[x,y]]`, `M=A/(y)`, quotient by x has length 1 and x-torsion length 0. For `M=A/(x,y)`, both lengths are 1. | The Tor correction changes the answer from 1 to 0 in the second model. |
| §7.6 contained case | At p=2, `ζ₈+ζ₈³=i√2`, exhibiting `ℚ(√−2)` as well as `ℚ(i)`. At 3 the field is `ℚ(√−3)`; at 5 there is no imaginary quadratic subfield; at 7 it is `ℚ(√−7)`. | The replacement subgroup is necessary, including at 2. |
| §7.7 length identity | `A=ℤ_p[[T]]`, `M=A/(T)`, `a=p`: quotient length 1, torsion length 0, right side 1. For `M=A/(p)`, the required vanishing at the height-one prime containing a fails. | Both positive and excluded cases match the statement. |
| §7.8 headline and ownership | CM `f=32.2.a.a`, p=2: generic ranks `(H²,H¹)=(0,1)` here and in KatoEulerSystems §4.4. Zero H¹ would instead have rank 0 and fail. | Mathematical check passes; duplicate ownership is R01. |
| §7.9 inequality | DVR model `H²=A/t`, `H¹=A`, `Z=t²A` gives `1≤2`, but not equality. | The inequality is not used alone to prove the endpoint equality. |
| §8.1 normalization | For nonzero independent `v₊,v₋`, equalities `c₊v₊=v₊`, `c₋v₋=v₋` force `c₊=c₋=1`. At r=k−1 the period exponent is 0 and its factor is 1. | Both archimedean components are fixed. |
| §8.3 ψ-component equality | Inertia value i gives `i⁻¹−1=−i−1`, of norm 2, nonzero and invertible after p=2 is inverted. Trivial inertia gives `1−1=0`. | Ramification is essential; no claim of an integral unit. |
| §8.4 comparison sign | Complex conjugation on the inverse Tate line acts by −1; twisting changes the untwisted negative zeta relation to the prescribed positive relation. The zero vector maps to 0 on both sides. | Twist and sign agree with the KatoEulerSystems convention. |
| §8.5 equality descent | With `A=k[[x,y]]`, both compared modules `A/(y)` have x-quotient length 1 and x-torsion 0. The scalar `1/x` has valuation −1 at `(x)` and cannot be used as an integral comparison. | Equality requires the actual integral comparison and cancellation, which are stated. |
| §8.6 all-prime rational headline | A coefficient extension of ramification index e multiplies both finite lengths n by e. Conversely `(p)` and `(1)` both become `(1)` after inverting p. | Faithfully flat descent preserves equality; it cannot recover the omitted integral assertion. |
| §8.7 dictionary | At k=2 the infinity type is `(−1,0)` and at critical r=k−1 the normalization exponent is 0. At p=2 the full cyclotomic torsion order is 2, not 1. | Weight, period and dyadic conventions agree across layers. |

### Headline and Lean audit

`lake env lean` on the package's absolute `Suggested.lean` path, run from the pinned content checkout, returned exit 0 with no output and **no warnings**. No library build was required. The file has one `import Mathlib`, one module docstring and the required namespace. It contains zero definitions, zero instances, zero theorems and zero admitted examples. Thus the exhaustive one-tactic probe has **zero candidates**, and the elaborated-binder/`#check @name` audit has **zero own declarations**. The earlier supplied signature-extraction failure is not reproduced by elaborating this file.

| Headline from README | Suggested.lean coverage and pin test |
|---|---|
| §4.5 JLK main conjecture for every finite-order character and prime | Docstring lines 23–26: arithmetic tower complexes, their determinant lines and the distinguished elliptic-unit zeta element are missing. Native module and ideal types alone do not supply them. |
| §4.8 Rubin two-variable and all-prime classical forms | Lines 27–30: arithmetic local/global/elliptic-unit norm limits and ramified Galois modules are missing. |
| §§5.3–5.4 Katz and anticyclotomic forms | Lines 31–33: Katz measure, arithmetic Coleman map and the preceding modules are missing. |
| §5.5 functional equation and λ-equality | Lines 34–36: the actual Katz measure is missing. A theorem about arbitrary power series would not state this headline. |
| §6.2 rational equivariant main conjecture | Lines 16–22: native ray fields and completed group algebras exist, but their elliptic-unit/class-group norm-limit constructions do not. |
| §7.8 CM Theorem 12.4 | Lines 10–15 name the missing representation/cohomology carriers; R01 corrects ownership, not elaboration. |
| §8.6 Kato equality for every CM newform and every prime | Lines 10–15: attached Galois representation, arithmetic Iwasawa cohomology, zeta morphism and zeta submodule are missing. A native newform alone is insufficient. |

No headline that can be stated using the pins and a few simple native definitions was found omitted. No placeholder, sorry'd data, free predicate standing for a missing condition, stand-in theorem, `set_option`, extra import or padding declaration is present. Backticked identifiers attributed to this roadmap were checked in context; none claims an undeclared own Lean API. API lists and Checks remain prose.

### Pinned declarations opened, by object

The inspected pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are locations in those libraries, not claims about their latest versions.

| Object / declaration | Pinned file and line; what its body supplies |
|---|---|
| Class group | `Mathlib/RingTheory/ClassGroup/Basic.lean:89`: quotient of invertible fractional ideals. It does not construct the arithmetic inverse-limit module of this roadmap. |
| Length, height, prime localization | `Mathlib/RingTheory/Length.lean:31`; `Mathlib/RingTheory/Ideal/Height.lean:36`; `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50`. Length is extended-natural length; finite-length hypotheses remain necessary. |
| Regulator, torsion units, totally complex | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267` and :290; `Mathlib/NumberTheory/NumberField/Units/Basic.lean:145`; `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210`. These provide the native objects and regulator nonvanishing, not the scalar Tamagawa comparison. |
| Cyclotomic extension and character | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`; `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308` and :324. The character specification uses the required roots; an algebraic closure supplies them. |
| Power series | `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86`. Native coefficient functions do not identify a Katz measure. |
| Completed group algebra | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`: the inverse-limit subalgebra exists. The package specializes it rather than rebuilding it. |
| Ray modulus and ray class group | `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`; `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean:130`: nonzero ideal, finite real part and ideal-class quotient. |
| Hecke character | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70`: continuous multiplicative map from the idele class group to complex units. It does not include Kato's realization or comparison map. |
| Ray class field and Artin map | `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123`, :135–143 and :209: actual field, number-field/finite/abelian structure and Artin equivalence. No “ray fields are absent” assertion is made. |
| Newform | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84` and :104: normalized new cuspidal eigenform with nebentypus. Its fields contain no attached p-adic Galois representation. |
| Characteristic ideal | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85`: height-one product. The package's new object is its arithmetic application; the generic operation is imported. |

Object searches covered native units, character modules, completed group algebras, ray fields, Katz measures, elliptic units, newforms, Galois representations and Iwasawa cohomology. Generic native objects were compared with the actual fields/bodies above rather than treating a name match as a duplicate theorem.

### Supplier, ownership and order audit

Every `*Needs:*` line and supplier citation was read. `roadmaps resolve` produced no missing cross-roadmap or own-name lead. The following current supplier sections were opened; line numbers refer to the supplier's README at main or at the supplied open head. A citation to a range means its mathematical contract was inspected, not merely that its heading exists.

| Supplier | Resolved contracts and representative locations |
|---|---|
| GlobalNumberFields | Main Layers 2, 9, 10, at lines 279, 508, 531. |
| ClassFieldTheory | Main former §2.6 is explicitly mapped at line 267 to Conventions C.6, line 537; Layers 10, 11, 13 at 1638, 1781, 1924. Arithmetic Frobenius convention agrees. |
| ProfiniteProPGroups | Main Layer 9, especially lines 2193–2225: completed group algebra for profinite groups, with commutativity for abelian groups. |
| ModularForms; EllipticCurves; ModularCurves | Main ModularForms Layers 4, 5, 7, 9 at 670, 708, 785, 1016; EllipticCurves Layers 1–2 at 423, 647; ModularCurves Layers 0 and 2 at 639, 1157. |
| ImaginaryQuadraticClassNumber | Main §H3.1, line 103: lattice/ideal dictionary. |
| PadicMeasuresIwasawaAlgebras | Main §§2.1–2.3, 2.6, 2.8, 4.1, 4.6, 5.1, including lines 1148, 1229, 1328, 1597, 1745, 2361, 2710, 3172. Normal components and determinant parity match the computations above. |
| SelmerIwasawaCohomology, #869 | §§0.9–0.10, 2.8, 3.0–3.3, 3.7, 3.15, 3.17: lines 236, 250, 518, 1329–1426, 1492, 1656, 1770. Twist, Kummer, descent, `j_*` comparison and local hypotheses are present. |
| ArithmeticGaloisDuality, #858 | R02.4.3–4 and D7.5, lines 3436, 3505, 5576. |
| IntegralIwasawaTheory, #1306 | §§2.6, 7.1–7.2, 10.0, lines 383, 981, 1007, 1461. Frobenius transport and the signed dyadic roots were compared with the package; its odd-prime Coleman clause is not used as an all-prime theorem. |
| ColemanPowerSeries, #1309 | Layer 1 and §§2.37, 2.39, 2.44, lines 7078, 7124, 7209. Raw versus constant-subtracted Coleman maps and the all-prime normalization are distinguished. |
| EulerSystemsAndKolyvaginSystems, #1272 | §§2.2, 2.5, 8.1–8.2, 8.6–8.7, 8.14, 8.25, 8.37, including lines 1606, 1683, 4558, 4601, 4776, 4813, 5111, 5466, 5869. |
| ComplexMultiplicationAndExplicitReciprocity, #1254 | §§1.2, 2.2, 3.2, 4.1–4.2, 5.1, lines 354, 445, 583, 634, 666, 733. The existing good-reduction ordinary/supersingular criterion includes small primes; the package's ideal-indexed theta construction is additional. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §5.1, lines 3109–3129: Néron–Ogg–Shafarevich over a henselian DVR with auxiliary Tate prime different from the residue characteristic. |
| AutomorphicGaloisRepresentations, #1007; PartII, #1006 | §§1.5, 7.3 at 1801, 3708; AG2.0 at 640. Cohomological/geometric Frobenius convention and character realizations agree with the package. |
| AutomorphicLFunctionsAndLocalFactors, #924; LFunctions | AL.1, line 643; main LFunctions Layer 7, line 1440. Induction/local factors and nonvanishing inputs have owners. |
| PadicHodgeRegulators, #1498 | §§1.4 and 1.7, lines 523, 572: dual exponential and compatibilities. Relative height-one explicit reciprocity is separately declared as a gap, not falsely claimed from the existing section. |
| AutomorphicPadicLFunctionsPartII, #1543 | §§3.3, 3.4, 8.5, lines 572, 607, 1304. Eisenstein–Kronecker continuation and Katz measure are imported; this package owns their new elliptic-unit comparison and functional equation. |
| PadicFamilies, #1019; KatoEulerSystems, #1804 | PadicFamilies §§4.0.1, 4.0.3 at 2364, 2393; Kato §§4.2, 4.4, 5.1, 5.3, 7.2 at 1673, 1806, 1995, 2145, 2681. R01 is the actual overlap. Integer-indexed theta units and zeta morphisms are otherwise imported. |
| NoncommutativeAndEquivariantIwasawa, #1307 | §4.3, especially 2063–2089: rational CM curves over ℚ with class number one, p≥5 good ordinary. The general imaginary-quadratic, arbitrary-class-number and all-prime statements here are explicitly distinguished extensions. |
| PeriodsAndSpecialValues, #1496 | PS5.2, PS6.5 at 1105, 1306. General ETNC formulation and the negative-weight comparison do not already prove this package's scalar weight-zero result. |
| ModularIwasawaMainConjectures, #1499 | §§0.1, 0.6–0.7 at 215, 423, 467: the datum and rational main-conjecture predicate, including full torsion at 2. The endpoint consumes that predicate. |
| AnticyclotomicLocalUnits, #1692 | §1.1, line 273: inert height-two Lubin–Tate interpolation; not a duplicate of the split height-one comparison. |

The declared `gap:height-one-explicit-reciprocity` has the same slug and supplier in `design/plan.json` and README:117. Its contract specifies a p-divisible group over the integers of a finite extension, an `O_𝔭` action of relative height one, Kummer cup products, Tate basis powers, the dual exponential and logarithmic derivatives of a Coleman series. It is precise, needed at inert/ramified as well as split primes, and is not supplied by the generic dual-exponential compatibility API. It is a legitimate declared contract, not an unowned prerequisite. No new gap is requested by this review.

The supplied board-package index was read before searching sibling packages. Ownership searches used both the indexed main/open README text and the available board packages, by objects including elliptic units, CM pairs, Katz measures and CM Kato statements. The closest open heads were inspected: #1804 gives R01; #1816 AutomorphicCongruences owns Eisenstein/congruence instances; #1499 owns the base modular conjecture formulation; #1272 owns the generic Euler-system theorems; #1744 CMRankZeroConverse consumes a CM equality for a rank-zero conclusion. EllipticCurvePeriodsAndModularParametrizations #1715 has a one-variable ring-class norm-limit application, distinct from the every-modulus ideal-indexed construction here. These comparisons do not justify re-planning #1804's module-structure theorem.

The supplied overlap report records no conflicting head changing this roadmap, no dropped cited id and no id existing only in an open revision. The named supplier sections above were resolved independently at the available heads. No new supplier was inferred from an unavailable open file. The non-consumed scope exclusion for InertAnticyclotomicCMMainConjecture is not counted as verification of that roadmap's unavailable content.

The prescribed dependency command returned exactly:

```text
depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file or tooling was edited. R01 is an ownership collision despite a clean graph: a clean direction check cannot establish unique ownership.

### Shape and principles

The README has the required opening summary, ownership, conventions, exact supplier contracts, reading guide, nine mathematical layers, examples/dependencies and references. Definitions retain prose APIs and discriminating Checks; the defective Check is R03. The source order does not determine the layer organization: the dependencies force units before realizations/reciprocity, these before the equivariant equality, and then induction/descent before the modular endpoint. The split-prime Katz layer is explicitly a consequence in its legitimate range, not a restriction of the all-prime endpoint.

Main-branch ModularForms and ModularCurves were read for repository shape. No computational-algorithm target, copied source block, process date, pull-request number, machine path, HTML anchor, forbidden supplier, `lemma` declaration, sorry'd datum or `set_option` was found in the package text. R01 is the exception to the otherwise preserved “build on earlier work” principle. The original package inputs were not edited.

## Not verifiable

- Some displayed characters and overbars in the Kato extraction, especially (15.4.4), (15.5.1) and (15.9.1)–(15.9.2), are degraded. Surrounding propositions, hypotheses, page markers and the indicated computed controls were readable; this review does not certify every printed glyph from the extraction.
- Yager's scanned displayed normalization formulas are not wholly legible in the available extraction. Its introductory good-reduction, splitting and prime restrictions were readable. No new request is made for a work already recorded in the manifest; the package's broader construction was checked against its general suppliers rather than guessed from that display.
- InertAnticyclotomicCMMainConjecture is a scope exclusion, not an input; its complete current file was not available among the supplied readable heads. No claim of a full ownership comparison against that unavailable text is made.
- The relative-height-one explicit-reciprocity supplier gap is declared and remains unimplemented. Its specification and ownership were verified; a future proof of that supplier contract cannot be certified by this package review.

## Source issues

- **Error** in Kato at (15.3.3), printed p. 252: the source says unramified prime divisors suffice for the ideal action on CM pairs; it should be restricted also to ideals coprime to the level; affects a stated result.
- **Error** in Kato at proof of Proposition 15.9, printed p. 258: the source says the canonical curve has good reduction at every finite place; it should be tested by unit injection modulo the prime-to-place level, or replaced by an auxiliary-level curve; affects the proof.
- **Misprint** in Kato at (15.4.2), printed p. 252: the source says the theta norm identity without the necessary coprimality restriction; it should be restricted to isogenies of degree prime to the auxiliary ideal norm; affects a stated result.
- **Error** in JLK at proof of Lemma 5.1, printed p. 23: the source says the relevant p-group augmentation quotient is projective over the integral group ring; it should be justified by another argument, since splitting the augmentation requires division by the group order; affects the proof.
- **Error** in BT at Theorem 2.1, printed p. 4: the source says the equivariant equality without tame-level Euler corrections; it should be the equality including the local factors at primes dividing the tame level; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed p. 251: the source says the ray-tower equality without the tame local contribution; it should be the equality with the missing local Euler factors; affects a stated result.
- **Gap** in BT at proof of Theorem 2.6, printed p. 5: the source says the cited descent supplies the desired equality; it should be supplemented by equality and Tor bookkeeping beyond Kato's one-sided lattice inequality; affects the proof.
- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265: the source says the needed length identity is Lemma 14.12; it should be Lemma 14.15; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4b6ddb82a87f9f259681b86ffc7b841af6050e51", "job": "REV-PKG-ModularIwasawaMainConjecturesPartII~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
