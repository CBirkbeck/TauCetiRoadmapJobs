<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6851649314 -->
Review (codex) of f122ca5

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) The noncoprime-degree Check needs a positive layer index

   **Location:** `packages/NonordinaryCMSpecialValues/README.md:491`, §3.2: “so `l` divides both … `[L[r] : K] = 23^r` … although the degrees are not coprime.”

   **Claim:** The displayed admissible pair `p = 47`, `l = 23` gives noncoprime degrees at all indices allowed in §3.1.

   **Witness:** §3.1 allows `r = 0` and states `L[0] = K`. At `n = r = 0`, the degrees are `2208` and `1`; their gcd is `1`, and `23` does not divide `1`.

   **Exact repair:** Insert “For `r ≥ 1`” before the assertion about divisibility of both degrees. Add: “At `r = 0`, `L[0] = K`; the degrees are coprime and disjointness is immediate.” At `r = 1`, `gcd(2208,23) = 23`, so the intended noncoprime example survives. The prime choices and ramification proof are correct. This is the remaining boundary defect in the repair of prior F03.

2. **F02** (P3) An inert good-prime factor appears in an all-prime Check

   **Location:** `packages/NonordinaryCMSpecialValues/README.md:404`, §2.6: “`χ = 1`, `r = 1` … `1 − φ̄((p))/p² = 1 + 1/p`”.

   **Claim:** Trivial twisting and weight one alone give the displayed deleted factor. However, §2.6 and the conventions explicitly allow split and ramified primes as well as primes dividing the conductor.

   **Witness:** For `E: y² = x³ − x`, `K = Q(i)`, `p = 5`, the prime splits and `φ̄((5)) = 5`: the displayed expression is `4/5`, not `6/5`. Deleting both primes gives `8/5`.

   Indeed the two good Frobenius values are `−1 ± 2i`, and `(1 − (−1 + 2i)/5)(1 − (−1 − 2i)/5) = 8/5`. Independently, `#E(F₅) = 8`, so `a₅ = −2` and the same polynomial is `1 − a₅/5 + 5/25 = 8/5`.

   **Exact repair:** Begin this Check: “For `χ = 1`, `r = 1`, and `p` inert with `p ∤ f`, …”. Add the split example above as a negative control. At an inert good prime, `φ̄((p)) = −p`, giving precisely `1 + 1/p` and valuation `−1`. At conductor primes the primitive local factor is `1`. Preserve the all-prime theorem and its proof route; only the Check needs scoping.

3. **F03** (P3) The opposite norm twist has centre 2

   **Location:** `packages/NonordinaryCMSpecialValues/README.md:724`, §5.1: “the opposite twist `Qφ̄(a)ν(a)` shifts the central point to `s = −1`.”

   **Claim:** Multiplication of a weight-one ideal character by its ideal norm moves its centre from `1` to `−1`.

   **Witness:** Put `η = φ̄ν`. Direct substitution gives `L(Nη,s) = L(η,s−1)`, whose centre is `2`. At a norm-`25` prime with `η(a) = −5`, the opposite-twist denominator is `6/5` at `s=2`, but `3126` at `s=−1`.

   **Exact repair:** Replace the final clause with: “the opposite twist `Qφ̄(a)ν(a)` has `L(Nη,s) = L(η,s−1)` and centre `s = 2`; its value at `s = 0` instead evaluates `L(η,−1)`.” The intended divided twist has `L(η/N,s) = L(η,s+1)` and centre `0`. For `K = Q(√−7)`, the canonical character, `ν=1`, and the inert prime `(5)`, its coefficient is `−1/5`; its denominator at `0` and the original denominator at `1` are both `6/5`.

Three P3 findings, no P1 or P2 findings. All three concern numerical Checks, not the headline theorems. The package files were not edited. The original Lean file elaborates with only its three `sorry` warnings; the dependency check reports no problems. Acceptance still requires correcting the three Checks below.

## Verified sound

### Prior findings and the changed passages

The prior review and repair report were read first, and the repaired passages were checked against the present files and sources. No maintainer notes were supplied.

| Prior finding | Present passage and verification | Status |
| --- | --- | --- |
| F01: primary sources absent | §2.5 now names “Kato 1999, Theorem 4.3.1”; KATO04 line 5495 identifies that theorem and lines 5496–5503 its height-one application. §4.2 names “Yang 1997, Theorem 2.6, (2.19), p.43” and Theorem 2.15, p.48. YANG97 lines 691–702 and 874–878 have these locators. Both works have manifest and References entries. | Repaired; KATO99 remains settled uncertified, and Yang's displayed constants have the OCR limitation below. |
| F02: impossible conductor support | §6.2 now says “`P = {5}`, support `R = {5, 7}`” and uses `(1 + 1/5)·1`. The quadratic character has conductor `7`, `κ(5)=−1`, `κ(7)=0`; the product is `6/5`. | Repaired. |
| F03: inadmissible auxiliary prime | §3.2 now says “`K = Q(√−7)`, `p = 47`, `l = 23`”. `40²³ ≡ −1 (mod 47)`; `4² ≡ −7 (mod 23)`; `23 ∤ 7`; `47 ∤ 22`. The replacement is admissible. | Partly repaired: the omitted `r ≥ 1` is R01. |
| F04: incomplete JIA24 manifest coverage | The JIA24 entry now includes `0.2`, `6.1` and “Introduction, p.1”. JIA24 line 18 supports the introductory family reference; §4 supplies the lattice estimate. | Repaired. |

The repaired patterns were searched elsewhere: numerical auxiliary-prime choices, order versus conductor indices, explicit conductor supports, named theorem inputs, and manifest coverage. The canonical support `{7}` in the worked example is compatible with the repaired `{5,7}` twisting example. The two further Check defects are R02 and R03. The previously settled ownership observation concerning the later `ModularIwasawaMainConjecturesPartII` remains a consumer-side matter; it is not re-raised against this package.

### Principles, shape and Lean acceptance test

Read all 43 numbered targets, the seven layer dependency blocks, 49 Checks blocks, conventions, contracts, downstream discussion, References, metadata, manifest, and the entire Lean file. The all-prime scope of §§2.1–2.6 is explicit, including `2`, `3`, split and ramified primes; the narrower BKO hypotheses enter only where required. No computational algorithm, source-chapter layer, roadmap re-planning, sorry-defined data, `set_option`, or source-passage reuse was found. Definitions have prose API lists and at least three Checks. Apart from R01–R03, the inspected Checks do not contradict their targets. Layer headings and proof inputs determine a mathematical dependency order. Upstream shapes were compared with `LFunctions`, `GlobalNumberFields` and `DiophantineApproximationAndTranscendence`.

`Suggested.lean` contains seven definitions with actual bodies, one local prime instance, and three headline theorems. Its imports are exactly `Mathlib` and the two used Tau Ceti Hecke-character modules. There are no admitted examples, catalogue lemmas, sorry-defined maps or stand-in propositions for missing heavy constructions. Its namespace and declaration names agree with the README. Backticked names belonging to suppliers were resolved separately from its own ten named definitions/theorems.

The prescribed `lake env lean` elaboration was run from the content checkout against the package's absolute file location. Exit status: **0**. The only warnings were “declaration uses `sorry`” at lines **130, 140, 166**. Both imported Tau Ceti object files were available; no build was needed.

A scratch copy with `#check @name` for all ten definitions/theorems was elaborated, exit **0**. The seven definitions retain their field, number-field and CM-field binders where used. Both counting theorems retain algebraicity, nonzero directions and exponent ranges. The parity theorem retains quadraticity, odd inert prime, unramifiedness of both base characters, finite odd order of `ν`, and uniformizer valuations. No binder was lost. The local instance has its explicit prime argument. Nothing in the reviewed Lean file was changed.

For **every one of the three sorried theorems**, a separate scratch probe tested `simp`, `rfl`, `infer_instance`, and a one-lemma search with `exact?`, each inside `fail_if_success solve | …`. All **12** attempts failed to close their goals. The probe elaborated with only the same three `sorry` warnings. Theorems are not small-value Checks, boundary assertions or definitions restated as conclusions. The library near-match suggestions were compared with native declarations, not treated as proof of duplication.

| README headline | Acceptance-test disposition |
| --- | --- |
| Root-number zeros and the parity dichotomy, §§1.4, 6.5 | `centralValue_parity_dichotomy`; the existential sign replaces a missing root-number carrier without weakening the two assertions about the actual character family. |
| Rohrlich's vanishing and power-saving bounds, §6.1 | `rohrlichCount_eq_zero`, `rohrlichCount_lt`; native `PadicInt`, algebraicity and a finite integer-pair count. |
| Finis weight-one divisibility; BKO units and a nontrivial witness, §§4.6, 5.4–5.5 | Named in the module docstring as not statable: integral CM period/Néron differential, algebraic value and its p-adic avatar, and local invariants are missing. |
| Kato reciprocity and the integral CM class, §§2.5–2.8 | Named as not statable: coefficient Galois cohomology, dual exponential and de Rham period carrier. |
| Torsion-field disjointness, semilocal splitting and the CM Lubin–Tate comparison, §§3.2–3.5 | Named as not statable: attached CM curve, torsion fields and Lubin–Tate objects; existing ring class fields are explicitly acknowledged. |
| Explicit root-number formulas and canonical sign, §§1.1–1.3 | Named as not statable: local/global Hecke root-number carrier. |
| Jia's Galois-average limit, §6.2 | Named as not statable: algebraic-character Galois action. |

No additional headline statable with a few simple native definitions was identified as missing. In particular, replacing the CM attachment by arbitrary subfields would not state §3.2.

### Seeded source sample

All 15 requested targets were read against the available source extractions. Page numbers below are printed pages, except JIA24's manuscript pagination. Every cited work is represented by one of the 13 manifest keys. No new source fetch or manifest change was required. The settled BOXALL92 and KATO99 statuses were respected.

| Target | Source locator inspected | Hypotheses and support |
| --- | --- | --- |
| 0.1 Conjugation-equivariant characters | JIA24 Property 1, pp.3–4, lines 122–148 | Rational-principal law is `κ(n)n`; equivariance and type conventions agree. The later inverse-integer misprint is not imported. |
| 1.3 Conductor sign | GREENBERG83 p.247, lines 317–333; QUEYRUT74 p.135, lines 86–97; BKO21 Proposition 3.3(3), p.953, lines 475–488 | Greenberg's class-number-one/order formulation is not claimed to prove the full generality. The local generalization explicitly depends on the declared Fröhlich–Queyrut contract. Conductor, not order, controls the sign when `p` divides the class number. |
| 2.5 Height-one reciprocity | KATO04 proof of Proposition 15.9, pp.258–259, lines 5478–5527; KATO99 Theorem 4.3.1 | Kato applies height `1` to each prime component, including the split case. The corrected translation, cofinal tail, twist and factorial are spelled out. KATO99 itself is not readable; see below. |
| 2.8 Direct-character reciprocity | BKO21 (3.4), pp.951–952, lines 414–432; KATO04 Proposition 15.9 | `γ = per(ω)/Ω`, direct character weights and `φ̄` on the right agree. Inverting the character would change the weights. |
| 3.1 Torsion/ring-class compositum | BKO21 p.952, lines 435–447 | The roadmap separates torsion index, field degree and conductor index. Positive order exponent `r` uses conductor `r+1`; the trivial character is handled separately. |
| 3.2 Disjointness | BKO21 p.953, lines 460–466 | Intersection is an abelian l-extension unramified everywhere; `l ∤ h_K` kills it. Coprime degrees are unnecessary. The theorem is supported; R01 concerns its Check. |
| 4.2 Primitive theta/Shintani/Yang | FINIS06 §2, pp.771–780, lines 187–287, 454–583; YANG97 Theorem 2.6, (2.19), p.43, lines 691–702, and Theorem 2.15, p.48, lines 874–878 | Primitive decomposition, test-function restrictions and Finis's weight-one specialization are present. The normalized trace adjoint differs from the unnormalized sum; the README keeps the index factor. Yang's raw formula has OCR limits. |
| 4.4 Torsion subvarieties | FINIS06 Lemma 4.5, p.803, lines 1571–1602; BOXALL92 pp.1063–1066 | The prime-to-characteristic torsion/stabilizer input is present in Finis's argument. The general Boxall primary citation is settled waived; not independently certified from that text. |
| 4.5 Theta nonvanishing | FINIS06 Theorem 4.1, p.795, lines 1221–1225 and its proof | Split odd tower prime, distinct residue prime, integral normalization, and sufficiently large conductor are retained. The claim is not unrestricted small-conductor nonvanishing. |
| 5.1 Weight-one family | FINIS06 §1, pp.768–769, lines 61–70, 101–122; Corollary 2.3, p.778, lines 494–508; BKO21 p.954, lines 501–508 | The divided norm twist and centre `0` agree with Finis's convention. The opposite-twist Check is R03. |
| 5.2 Inert corrections | FINIS06 p.769, lines 95–99, and (14), pp.788–789, lines 902–917; BKO21 pp.953–954, lines 493–507 | Conductor support at ramified primes makes the inert corrections vanish; the unramified branch of `μ` is `0`, not the valuation of zero. |
| 5.4 Almost-all units | FINIS06 Theorem 1.1, p.769; BKO21 (3.9), p.954, lines 501–513 | The canonical family meets the weight-one theorem's hypotheses; `p ∤ D` makes its discriminant normalization a unit. Finitely many exceptions remain allowed. |
| 5.6 Unramified coefficients | BKO21 p.954, lines 503–507; KATO04 Proposition 15.9 | The source's finite coefficient extension is strengthened by the roadmap's own prime-to-p root argument and descent, not falsely attributed verbatim to BKO. The `p ∤ h_K` and auxiliary-order conditions are used. |
| 5.7 Scalar/tensor kernels | BKO21 pp.952–954, lines 433–466, 503–513, with the native linear-disjointness criterion | Totally ramified torsion coefficients and unramified character coefficients have trivial intersection. Injectivity, and hence equality of the two kernels, uses this extra argument. |
| 6.2 Galois-average limit | JIA24 (2.16)–(2.29), pp.6–8, lines 234–347; Main Lemma 2, p.13, lines 596–605; Lemma 3, p.17, lines 799–812; §4, pp.18–20, lines 880–938; ROHRLICH84 §3 | The rational contribution retains all conductor-support Euler deletions; the nonrational part is controlled by the counting estimates. The corrected limit is positive with factor `6/5` in the repaired example. |

### Computed adversarial record

These are concrete positive and negative controls, not a claim that numerical tests prove the general theorems. All targets were read; the table records the defining laws, normalizations, headline bounds, sampled targets and every finding. Ineligible inputs were checked against the actual hypotheses: the zero ring and characteristic-p fields are not number fields; `S₃` and `Q₈` are not the abelian ray-class Galois groups; `p=2` is excluded only from the parity/BKO statements, not Kato's layer. Natural zero moduli in the asymptotic counting statements are excluded by choosing the eventual bound at least `2`.

| Target | Instance and values computed on the two sides | Result / change |
| --- | --- | --- |
| 0.1, `IsEquivariantTypeOneZero` | Over `Q(i)`, rational `(7)` gives `φ((7))=−7=κ(7)·7`; omitting `κ` gives `7`, inverting the character gives `−1/7`. At norm `5`, absolute value is `√5`, not `1/√5`. | Correct convention; wrong models excluded. |
| 0.2, `IsAnticyclotomic`, `IsPAnticyclotomic` | Over `Q(√−7)`, `p=5`, orders `1,5,25` have conductor exponents `0,2,3`. Over `Q(√−31)`, the unramified class character of order `3` has exponent `0`, not `2`. A conjugate pair with values `ζ₅,ζ₅⁻¹` satisfies the law; `ζ₅,ζ₅` does not. | Class-number restriction is not smuggled into the full family. |
| 0.3, Euler factor and central value | Inert good `p=7`: factor `(1+1/7)⁻¹=7/8`, inverse-sign model gives `7/6`. A ramified character contributes `1`. At `p=5`, the deleted factor `6/5` has valuation `−1`; zero denominators are not divided by in the convergence half-plane. | Primitive/deleted distinction correct. Entire continuation plus agreement on an open half-plane fixes the value uniquely. |
| 0.4, integral period | `ω ↦ 2ω` gives `Ω ↦ 2Ω`, normalized value `A ↦ A/2`; at `p=5` valuations agree. `ω ↦ 5ω` lowers value valuation by `1` but ceases to be Néron. | Unit rescaling is allowed; arbitrary p-scaling is excluded. |
| 0.5, auxiliary prime | For `K=Q(√−7), p=5`, `l=23`: `4²≡−7 (mod 23)` and `23≡3 (mod 5)`. `l=11` has residue `1 (mod 5)`; `l=13` has nonsquare `−7≡6`. | Admissible and excluded choices separated. |
| 0.6, auxiliary tower | Exact orders `23,23²` give degrees `23,529` and conductor exponents `2,3`. Order `1` gives degree `1`, exponent `0`. | Order and conductor are distinct. |
| 1.1, canonical root number | For discriminant `−7`, Rohrlich's complex/finite pair `(-i,i)` and the supplier's pair `(i,-i)` both multiply to `1`; mixing the conventions yields `−1`. | Global sign preserved by consistent additive-character change. |
| 1.2, auxiliary twists | Split conjugate local factors multiply to `ν(−1)=1` for odd-order `ν`; the rational norm factor gives `φ(l)/l=1`. An odd-order character on a conjugation-fixed ideal has value with square `1`, hence value `1`. | No spurious auxiliary sign. |
| 1.3, inert conductor parity | For `c=0,2,3`, `(-1)^c=1,1,−1`. A trace-zero `Δ` has `χ(Δ)²=χ(Δ²)=1`; odd order forces `χ(Δ)=1`. The unramified class character has `c=0`. | Full conductor formula passes; replacing `c` by order exponent fails. |
| 1.4, wrong-sign zero | With base sign `+1`, `c=3` gives `Λ(1)=−Λ(1)`, hence `2Λ(1)=0`; `c=2` gives `Λ(1)=Λ(1)` and no forced zero. | Both sides and the nonconverse checked. |
| 2.1, theta norm | For `a=(5)` in `Z[i]`, divisor is `25(0)−E[5]`, degree `0`, order `24` at `0`. Pushforward along `[5]` gives divisor `0`, not the original divisor; `[2]` permutes the 5-torsion and preserves it. | Coprime-kernel restriction is necessary and present. |
| 2.2, canonical pairs/units | For `Q(i), f=(3)`, four units inject into `F₉×` of size `8`, giving ray degree `2`; modulo `(2)`, `1` and `−1` coincide. Kronecker's value is `24·(−log(3)/2)=−12 log(3)` for standard units, opposite for theta values. | Modulus and inverse-unit convention discriminated. |
| 2.3, Kummer tower | With unit tame modulus, the separating tail starts at `n=1` for `p=7`, at `n=2` for `p=2`; `K(4)` has degree `2` whereas `K(2)=K` for `Q(i)`. Kummer classes of a theta value and its inverse add to `0`. | Small primes retained through a cofinal tail. |
| 2.4, realisation/period | At `r=2`, `[9]` scales the differential tensor by `81`; multiplying by the inverse character gives `81·81⁻¹=1`. Omitting the character leaves `81`. For inert `p=7`, inverse Frobenius is `−1/7`, not `−7`. | Tate dual and pullback direction fixed. |
| 2.5, translated reciprocity | On `C/(56 Z[i])`, at `p=7,m=n=1`, representatives `ξ=8`, `α=1`, `ν=7` give `ξ−ν=1`, while `ξ+ν=15`. Taking `g=(7)` at level `0` gives the zero torsion point, outside the unit evaluation; levels `1,2` have annihilators `7,49` and degrees `12,588`. | Translation and cofinal indexing correct. |
| 2.5, factorial/general prime | For `r=1,2,3`, `(r−1)!⁻¹=1,1,1/2`; for `p=7,m=1`, `p⁻ᵐ=1/7`. At split `p=5`, connected/étale component dimensions are `1,0`, not two connected dimension-one formal groups. | General prime components kept; denominators nonzero in characteristic zero. |
| 2.6, sign and deleted factor | `dlog θ ∼ 24 dz/z`; differentiating gives `−24/z²`, whereas the unsigned second Eisenstein sum has `+24/z²`. At split `5` over `Q(i)`, the single `(5)` expression is `4/5`, full deletion `8/5`, claimed inert value `6/5`. | Derivative sign passes; R02 scopes the Check. |
| 2.7, smoothing | A residue `α=2` gives `α(ᾱ−1)=2` in `F₅`; `α=1` gives `0`. | Invertible smoothing factor is chosen, not automatic. |
| 2.8, direct character | At `χ=1,p=5`, factor is `6/5`. At a value `χ(σ)=ζ₂₅`, direct/inverse weights are unequal since `ζ₂₅²≠1`; both associated central values can nevertheless be `0` at conductor exponent `3`. | Tests weights rather than an invalid claim that values must differ. |
| 2.9, diagonal twist | If `g` acts on the coefficient line by `φ(g)⁻¹`, the tensor action is `g(x)⊗φ(g)⁻¹t`; omitting it gives `g(x)⊗t`. For `φ(g)=−1`, these differ by `−1`; at the identity they agree. | Actual diagonal action and tower-factorization hypothesis retained. |
| 2.10, periods | Replacing `ω,Ω` by `2ω,2Ω` leaves `per(ω)/Ω` unchanged; the value divided by `Ω` is halved. Replacing only `Ω` by `−Ω` negates the class. | Period and differential changes distinguished. |
| 3.1, torsion field | At `n=0,p=5`, `[Φ₀:Φ]=24`, not `1`; at `n=1` it is `600`. At auxiliary `r=0`, `M=F_n`; `r=1` needs modulus `l²`. | Base and torsion indexing correct. |
| 3.2, disjointness Check | `40²³≡46 (mod 47)`, `4²≡16 (mod 23)`, and `2208=23·96`. At `r=1`, gcd is `23`; at `r=0`, gcd is `1`. In either case an everywhere-unramified 23-extension of a class-number-one field has degree `1`. | Theorem passes; R01 corrects the example's quantifier. |
| 3.3, semilocal factors | With two places, augmentation is `(x,y)↦x+y`, not projection `(x,y)↦x`. The principal class of `(p)` maps to Artin element `1`, so its residue degree is `1` in the ring-class extension. | Sum over places and splitting direction agree. |
| 3.4, Frobenius | At `p=5`, scalar `−5` has trace `−10`; `#E(F₂₅)=25+1−(−10)=36`. The opposite scalar predicts `16`. | Negative parameter fixed numerically. |
| 3.5, Lubin–Tate comparison | Division degrees `(25−1)25ⁿ` are `24,600` for `n=0,1`; changing a p-power basis to a `−p`-power basis gives signs `−1,+1` at levels `1,2`. | Matches supplier's parameter convention. |
| 4.1, local invariants | `v₅(ζ₅−1)=1/4`; nontrivial prime-to-5 roots have `v₅(ζ−1)=0`. Finis type `(-1,0)` has archimedean value `i` at `i`; the opposite type gives `−i`. | Ramified/unramified and infinity conventions separated. |
| 4.2, theta dimension and trace | With `r=25,D=7,a=O_K`, dimension is `175`; enlarging the lattice to `(1/5)O_K` gives dimension `7`. The trace sends a vector in that subspace to `25h`; normalized adjoint sends it to `h`. Primitive dimension is `168`. | Index normalization is essential and present. |
| 4.2, Shintani/Yang normalization | In the split `2`-component, the factor calculation is `(1/2)²·2=1/2`, not `2`; in weight one the global constant is `√7/π`. At a conductor prime the primitive Euler factor is `1`. | The Finis reformulation retains local and global factors. |
| 4.3, valuation identity | A sample valuation balance gives `0−0−3/4+1=1/4`, not `7/4`; the discriminant contribution `−1/2+1/4=−1/4` is cancelled by `D^(1/4)`. Multiplying an integral representative by the residue prime raises its value valuation by `1`, its squared norm valuation by `2`. | Normalization is not invariant under nonunit rescaling. |
| 4.4, torsion stabilizer | For `X=E`, connected stabilizer is `E`; for a point it is `0`. In `E²`, the diagonal relation at `(P,P)` is `P−P=0`; at `(P,2P)` it is `−P≠0` for a point of order `5`. | The subgroup relation excludes a plausible wrong subvariety. |
| 4.5, theta nonvanishing | If the normalized theta value has valuation `0`, its squared norm term also has valuation `0`; multiplying the representative by `ℓ` gives valuations `1,2`, hence not a unit. The theorem only asserts the former for normalized representatives and sufficiently large conductor. | Distinct tower/residue primes and the eventual threshold retained. |
| 4.6, weight-one Finis | For `D=7,p=5`, `μ=0`, `b=0`, `v₅(D)=0`, so the theorem gives normalized value valuation `0`. A wrong-sign central value is `0`, with valuation `∞`, and fails the sign hypothesis. | Nonzero/unit conclusion not asserted for wrong sign. |
| 5.1, norm twist | At norm `25`, `η=-5`, divided coefficient `−1/5`, opposite coefficient `−125`. Denominators: divided at `0` = original at `1` = opposite at `2` = `6/5`; opposite at `−1` = `3126`. | R03 corrects the opposite centre; main identity passes. |
| 5.2, corrections vanish | For an unramified local character, units have value `1`, so the differences have valuation `∞`; the separately defined unramified `μ` is nevertheless `0`, and `b=0`. | No replacement of the branch by an infimum of zeros. |
| 5.3, auxiliary Euler deletion | Nontrivial `ν` of order `l^r` is ramified at both primes over `l`, so their primitive factors are `1·1=1`. For `ν=1` they need not be `1`. The inert p-factor is still `6/5`. | Nontriviality is used exactly at the auxiliary deletion. |
| 5.4, auxiliary units | In the canonical `D=7,p=5` family, the lower-bound corrections total `0`; the nonvanishing specialization gives equality `v₅(A)=0`. The theorem does not claim every conductor, including the trivial character, works. | Cofinite unit assertion matches the sources. |
| 5.5, unit witness | Orders `23,23²,23³,…` give distinct conductor exponents `2,3,4,…`; deleting finitely many indices still leaves a positive index, whereas the trivial character has index `0`. | Nontrivial witness follows from an infinite family, not from the trivial member. |
| 5.6, unramified coefficients | `X²−2` is irreducible modulo `5` with derivative `2X≠0`, yielding an unramified quadratic extension. In contrast, adjoining a fifth root of `6` gives shifted polynomial `Y⁵+5Y⁴+10Y³+10Y²+5Y−5`, Eisenstein at `5`. | Prime-to-p root degree is essential; `p ∤ h_K` supplies it. |
| 5.7, scalar/tensor kernels | At `p=5,n=0`, totally ramified degree `24`; adjoining `ζ₂₃` unramified over `Φ` has degree `ord₂₃(25)=11`, since `2¹¹≡1`. Compositum degree `264=24·11`. Replacing the unramified field by the same nontrivial ramified field gives `a⊗1−1⊗a≠0` mapping to `0`. | Correct injectivity hypothesis; arbitrary coefficient fields would fail. |
| 6.1, vanishing count | Take `P={5}`, `α=5,β=0`, box bound `1`: at `q=5`, allowed `v=±1` and three `u` give count `6`; at `q=25`, count `0`. Thus the statement must be eventual. For `P=∅`, the only positive supported modulus is `1`, excluded by eventual bound `2`. | Native finite count handles boundary cases. |
| 6.1, power saving | Choose `d=11/20`, `s=7/16`: `1/2<11/20<3/5`, and `5d/2−1=3/8<7/16<1/2`. In the same small box at `q=25`, `0<25^(7/16)`. | Quantifier order and nonempty exponent interval agree with Rohrlich. |
| 6.2, average | For `K=Q(√−7)`, support `{5,7}`, Euler correction is `(1−(−1)/5)(1−0/7)=6/5`, not `1`. With `r=7/16,a=15/16`, `2r=7/8<a<1` and `r−a/2=−1/32<0`. | Rational limit and decaying error pass. |
| 6.3, Galois stability | Sending `ζ₂₅↦ζ₂₅²` preserves order `25` and conductor exponent `3`; both wrong-sign central values are `0`. Complex conjugation sends `i↦−i` and does not fix `K=Q(i)`, so is outside `Aut(C/K)`. | Correct Galois group and algebraic-value transport. |
| 6.4, correct-sign nonvanishing | The repaired example's limit is `2L(1,κ)·6/5>0`. An orbit of zero values has average `0`, which cannot approach that limit along arbitrarily large conductors. | Positivity, stability and finiteness are all used. |
| 6.5, parity headline | For orders `1,5,25,125`, conductor exponents are `0,2,3,4`, giving signs `+,+,−,+`. Choosing the opposite `ε` would put infinitely many forced zeros in the claimed finite exceptional set. | Sign is determined by the actual family; not a vacuous existential. |

### Library and ownership audit

The library search was by objects as well as declaration names: Hecke conductors and ideal characters; CM conjugation; Euler products; ring class fields; normalized theta units; CM periods; formal-group division fields; linear disjointness; p-adic lattice counts; and anticyclotomic central-value nonvanishing. No pinned proof of any of the three headline signatures was found. The near matches involving Dirichlet characters, finite multiplicative characters, and generic analytic orders have different carriers or conclusions.

The following declarations and definitions were opened at the pins. These are evidence for the native inputs, not merely names returned by the resolver.

| Pinned file and line | What was checked |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/CMField.lean:70`, `:142`, `:154` | `IsCMField` is totally complex and quadratic over its maximal real subfield; `complexConj` and its compatibility with complex embeddings. Quadraticity over `Q` is an additional headline hypothesis. |
| `Mathlib/Algebra/MonoidAlgebra/Basic.lean:231`, `:250` | `lift`, `lift_single`: a basis element evaluates to the chosen character, without inversion. |
| `Mathlib/RingTheory/LinearDisjoint.lean:219`, `:233` | Ambient semiring hypotheses and `linearDisjoint_iff_injective` for the multiplication map; no automatic disjointness of arbitrary fields. |
| `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:311`, `:412` | Nonzero modulus context and `DirichletCharacter.LFunction_apply_one_ne_zero` for a nontrivial character. |
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:245`, `:291`; `Mathlib/NumberTheory/MulChar/Lemmas.lean:73` | Natural-number conductor/primitive Dirichlet characters and finite multiplicative-character conjugation do not supply number-field Hecke-family predicates or nonvanishing. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70`, `:80` | Native carrier is `ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ`; finite order is separate, not built into that carrier. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85`, `:181`, `:254`, `:270` | Local component, conductor exponent, finite conductor and nonzero conductor. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120`, `:155`, `:200` | Ideal character on ideals prime to the conductor; prime-uniformizer comparison; principal value as inverse archimedean product. |
| `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`, `:316`, `:498`; `RayClass/Basic.lean:87` in the same directory | Nonzero finite modulus; multiplicative congruence on `Kˣ`; prime-to-modulus ideal group and principal membership. The definition does not admit `x=0`. |
| `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111`, `:155`, `:178`, `:214`, `:222`, `:251` | Ring class field, unramifiedness, Picard Artin equivalence, arithmetic Frobenius, degree and complete-splitting criterion. These do not construct the attached CM elliptic curve or its torsion fields. |

The board package index, main roadmap folders, supplied open-head index and overlap report were read before any absence claim. There is no second copy on main, conflicting open head, dropped cited id, or citation available only in an unnamed open revision in the supplied overlap facts. Object searches used the roadmap service over open heads and main, and the board packages. The closest scopes were read at their actual heads, including #1804, #1692, #1254, #1744 and #1499. Searches for Finis, Shintani, theta normalization, local units and canonical CM pairs also inspected the relevant `AutomorphicCongruences` consumption of a Finis input; it does not independently own the theorem built here.

Overlap check: read KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, CMRankZeroConverse, ModularIwasawaMainConjectures, LFunctions and GlobalNumberFields. Shared normalized theta unit: PadicFamilies §4.0.1 owns it; KatoEulerSystems and this roadmap import it, with modular and CM refinements respectively. Shared CM attachment, periods, canonical Gross characters and torsion reciprocity: ComplexMultiplicationAndExplicitReciprocity owns them. Signed local projections: AnticyclotomicLocalUnits. Selmer converse: CMRankZeroConverse. Cyclotomic modular main-conjecture objects: ModularIwasawaMainConjectures. Generic analytic continuation: LFunctions; Hecke/ray-class carriers: GlobalNumberFields. This package owns the stated CM special-value refinements and parity/nonvanishing results; no new double ownership was found.

### Supplier resolution and direction

Every `*Needs:*` line and supplier citation was read against the supplier's current main text, supplied open head, or earlier board package. The following ledger gives the resolved sections; file locations refer to the supplier README, not this package's descriptions of it.

| Supplier | Resolved material |
| --- | --- |
| `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md` | §§1.2, 2.2, 3.2, 4.1–4.3: period lattice/ideal twists; idele/torsion dictionary; ray-level generation; rank-one Tate realization, Frobenius and full L-factors; canonical Gross existence and good reduction. The arithmetic Frobenius and inverse ideal-action conventions agree. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` | AL.1.1.1, 1.3.1, 1.3.4, 1.3.5, 5.1.1 and 5.3.2. Former AL.1.5.2 and AL.1.6.2 are explicitly mapped to AnalyticNumberTheoryPartI §2.3a, preserving the citations. ArithmeticGaloisRepresentations §2.7 supplies the named product formula. |
| `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` | §§2.1–2.4 and 4.3–4.4, at lines 605, 635, 657, 688, 1066, 1101: torsion, Tate module, division fields, character and signed Honda/elliptic comparison. Located in the board even though the resolver did not index it; it precedes this package in ORDER. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md` | R07.1.8–1.9 and R07.1.12–1.14: Tate modules, connected–étale sequence, formal connected groups and dimension. The étale component is not routed through connected formal groups. |
| `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` | §§0.8–0.11, 3.6, 3.7: completed finite-S Kummer theory, cup products, Shapiro and semilocal limits. §3.7 supplies the cyclotomic twist; the additional general-character twist is declared as a gap. |
| `TauCetiRoadmap/PadicHodgeRegulators/README.md` | §§1.4, 1.7, 1.11: dual exponential, twist/restriction/corestriction compatibility and semilocal maps. Finite-level twisting is not mistaken for a canonical untwisted identification. |
| `TauCetiRoadmap/PadicFamilies/README.md` | §4.0.1: normalized theta unit with divisor, q-expansion and coprime isogeny norm. |
| `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md` | §4.3: the ordinary split, class-number-one Siegel-function elliptic-unit construction. This package explicitly distinguishes the general CM ideal refinement and Kato normalization. |
| `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md`; `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md` | §§1.2, 4.3 and R17.4.16: critical-value algebraicity, algebraic coefficient embeddings and quadratic automorphic induction. No Galois transport of transcendental complex periods is claimed. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` | §5.1: Néron–Ogg–Shafarevich with auxiliary Tate prime different from residue characteristic. |
| Main `DiophantineApproximationAndTranscendence`, `GlobalNumberFields`, `ClassFieldTheory`, `Chebotarev`, `LocalFieldsRamification`, `EllipticCurves`, `ArithmeticDirichletSeries` | Resolved respectively §§2.1, 2.3; Layers 9–11; Layer 13; Layer 10; Layers 2–3; Layers 1–3; Layers 3 and 5. These supply the subspace/Ridout inputs, class fields, auxiliary primes, ramification, elliptic torsion/Frobenius and ideal/Euler-series estimates. |

The sole citation-resolver lead, missing `LubinTateFormalModulesAndQuasiCanonicalLifts`, is a false positive: the board package and all consumed sections exist. No supplier name was treated as absent merely because the open-head service lacked it.

Both gaps are precise, minimal and owned: `gap:al-local-frohlich-queyrut` and `gap:sic-character-twist` occur in both the README contracts and the top-level `gaps` in `design/plan.json`. The first asks for the local epsilon identity with its trace character and trace-zero element; the second asks for the finite-free tower-factorizing twist with diagonal action, localization/corestriction and finite-S completion. Neither is supplied at that generality by the cited existing section. They are contracts, not findings. This needs-changes verdict does not use the accepted-only JSON field `conditional_gaps`.

The prescribed mechanical check returned:

```text
depcheck: 208 roadmaps, 1906 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No forbidden supplier or consumer-to-supplier cycle was identified.

### Expression, arrangement and reuse

For each sampled locator, the roadmap's own wording was compared with the source. Five further passages were compared: the period definition (§0.4), canonical-unit discussion (§2.2), realization/period normalization (§2.4), integral theta valuation proof route (§4.3), and lattice-count formulation (§6.1). The shared material is mathematical notation, standard terminology and necessary hypotheses; no sentence-length expressive copying, clause-by-clause paraphrase of an expository passage, table, figure or imported list of exercises was identified.

Counting explicit author-and-locator introductions in the body, excluding the References list, gave **116**, of which **37** refer to FINIS06. Its organization is Introduction, theta functions, integral theta functions, nonvanishing. The roadmap does not reproduce that as its layer plan: it separates the character/root-number, reciprocity, torsion-field, theta-divisibility, canonical-family and arbitrary-class-number nonvanishing branches. Within Layer 4, primitive theta operators feed integral normalization, the stabilizer argument feeds mod-ℓ nonvanishing, and these feed divisibility; the `*Needs:*` lines force those edges. Finis's opening main theorem is the layer's conclusion rather than its opening construction. KATO04's reciprocity and JIA24/ROHRLICH84's nonvanishing form distinct branches, not extra chapters inserted into Finis's sequence.

Source independence: 20 passages compared with 8 readable sources; no expressive copying or reused source artifact found. Largest share FINIS06, 37 of 116 explicit body locator introductions; contents compared with FINIS06: independent mathematical dependency organization. KATO99 and BOXALL92 were not readable under their settled statuses; YANG97's OCR limits are recorded below.

## Not verifiable

- **KATO99, Theorem 4.3.1:** settled `uncertified`. Its text was not available legally in the supplied cache. KATO04 lines 5495–5503 verify the citation and height-one application; they do not permit independent certification of the complete primary theorem. No renewed request was made.
- **BOXALL92, pp.1063–1066:** settled `waived`. The primary proof was not read; FINIS06 Lemma 4.5 and its use were read. No renewed request was made.
- **YANG97 (2.19):** the scan's OCR identifies Theorem 2.6, the page and equation, and Theorem 2.15's test function, but garbles parts of the displayed constants. The exact weight-one formula was checked in FINIS06 Proposition 2.4 and its derivation. A clean independent transcription of every symbol of Yang's display was not possible from this extraction.
- Some KATO04 displays are OCR-garbled. The surrounding hypotheses, the cited theorem, translation point and scalar/factorial comparisons were readable; the report does not claim a clean transcription of every displayed tensor formula.

These limits are source-certification limits, not new missing-source requests. No unread source was silently certified.

## Source issues

- **Error** in KATO04 at (15.4.2), printed p.252: the source says every CM isogeny preserves the theta function under norm; it should require kernel disjointness from the smoothing torsion; affects a stated result.
- **Misprint** in KATO04 at the proof of Proposition 15.9, printed p.258: the source translates by plus the difference point while asserting evaluation at the original torsion point; it should translate by minus that difference; affects the proof.
- **Misprint** in BKO21 at §3.0.2, printed pp.952–954: the source identifies auxiliary order, field-layer and conductor exponents; it should distinguish conductor exponent r+1 from positive order exponent r; affects a stated result.
- **Misprint** in JIA24 at the line before (2.1), p.4: the source gives the rational-principal value using the inverse integer; it should use the quadratic character times the integer; affects nothing.
- **Gap** in JIA24 at (2.10)–(2.11) and (2.25), pp.5–7: the source sums the rational contribution without conductor exclusions; it should retain those exclusions and the corresponding Euler deletions in the limit; affects the proof.
- **Misprint** in JIA24 at (2.43), p.10: the source prints a growing exponential in the tail bound; it should be the decaying exponential used earlier in (2.29); affects the proof.
- **Misprint** in JIA24 at §4, condition (1), p.18, and (4.9), p.20: the source uses the full ring as modulus and the inverse modulus as box bound; it should use q times the ring and box bound q to exponent c; affects the proof.
- **Error** in FINIS06 at §2, printed p.772: the source calls the unnormalized trace sum the adjoint for the normalized inner products; it should divide that sum by the lattice index; affects a stated result.
- **Misprint** in YANG97 at (2.28), printed p.47: the source has exponent one third in the intertwining normalization; it should have exponent one half; affects the proof; corrected in print at FINIS06, printed p.779, footnote 4.

## For the human reviewers

- KATO99 is a printed proceedings contribution whose text and licence were not inspected. Its manifest status is settled `uncertified`; KATO04 supplies the primary-theorem locator. BOXALL92 has a settled waiver. Neither status was reopened.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f122ca54347ac09b794285bea935dfeae41c04e1", "job": "REV-PKG-NonordinaryCMSpecialValues~7", "model": "gpt-6-astra", "worker": "chris-10"} -->
