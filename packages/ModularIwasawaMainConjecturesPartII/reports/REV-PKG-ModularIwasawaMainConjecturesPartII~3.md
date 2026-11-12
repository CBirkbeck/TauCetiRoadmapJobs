<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12963#issuecomment-6781325367 -->
Review (codex) of 0d71390

Verdict: needs_changes

1. **F01** (P1) The Coleman operator does not produce the asserted measure

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:559–561`, §5.1. Package quotation: “applies `(1 − φ_F/p)·D_θ log`” and “`Col` is `Λ`-linear”. The local-ingredient Check at :568 asserts agreement with the supplied cyclotomic Coleman map.

   **Claim:** This differentiated operator produces an integral measure supported on `ℤ_p^×`, with the ordinary group-algebra action.

   **Witness:** Set `p=5`, `F=Ĝ_m`, `θ=id`, `Y=1+T` and `g=(1+Y)/ω(2)`. Then `D log g=Y/(1+Y)`. The proposed output has constant coefficient `2/5` and translate sum 2.

   Here `ω(2)` is the Teichmüller lift in `ℤ_5`. This is an actual Coleman series of principal local units: `u_n=(1+ζ_{5^{n+1}})/ω(2)`, and its norm is itself since `ω(2)^5=ω(2)` and `∏_{ζ∈μ_5}(1+ζY)=1+Y^5`. Write `h=Y/(1+Y)` and `φ_F h=h(Y^5−1)`. Then the claimed series `h−φ_F h/5` has value `1/2−1/10=2/5` at zero. Its sum over the five translates `T↦ζ(1+T)−1` is `(5−1)φ_F h`, hence 2 at zero. An integral Amice transform has integral coefficients, and a measure supported on the units has translate sum zero. Both requirements fail. This is also a direct counterexample to the local-ingredient Check; it does not assume that a one-variable root tower survives in the two-variable global limit.

   Even changing only the projector leaves a twist. Put `d=(1−φ_F)h`. It has zero translate sum and first moment `Dd(0)=(1−5)/4=−1`. Under `a=2`, logarithmic differentiation gives `2 S_2 d`, whose first moment is −4; ordinary pushforward `S_2 d` has first moment −2. Thus the inverse derivative, or an explicitly equivalent normalization, is also needed for the claimed Λ-linearity.

   The supplied normalization is explicit in open pull request #1306, `TauCetiRoadmap/IntegralIwasawaTheory/README.md:1009–1011`, §7.2: its operator uses `H((1−Φ)δf)`, where `H` is multiplication by `x⁻¹` on unit measures. On main, `TauCetiRoadmap/ColemanPowerSeries/README.md`, §2.44, spells out cancellation of the residual factor `a`. These are the very suppliers cited by :568.

   **Exact repair:** Transport the full normalized supplier construction through `θ`: first form `(1−φ_F)D_θ log g`, then apply the inverse Mahler derivative in multiplicative coordinates, and use the compatible sign, period and group-action conventions. Name its source and target and include these operators in the dependencies. Recompute the dependence on `θ` and `ξ` and the §5.2 moment comparison with that normalization. Do not fix just the denominator while retaining the incorrect linearity claim. The repaired local operator has constant coefficient 0 before `H` and translate sum 0 on this example. The covariance `H S_a=a⁻¹ S_a H` cancels the factor 2; the second moments after `H` are −4 on both sides. Keep this discriminating Check.

2. **F02** (P1) A Tate module is called coefficient torsion

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:563`, §5.1. Package quotation: “`U(F′)` has `ℤ_p`-torsion `lim μ_{p^∞}(F′ ⊗_K K_𝔭)`”.

   **Claim:** The norm-compatible roots in the cyclotomic local tower are torsion over `ℤ_p`.

   **Witness:** The package's own :569 has `u=(ζ_{5^{n+1}})_n≠0`. For every `m≥0`, the component with index `n=m` of `5^m u` is `ζ_5≠1`. No nonzero element of `ℤ_5` kills `u`.

   The root limit is `ℤ_5(1)`: coefficient torsion-free but torsion over the one-variable Iwasawa algebra, annihilated by `σ−κ(σ)`. Rubin91 line 638, Theorem 5.1(ii), concerns the Iwasawa-module torsion, not `ℤ_p`-torsion. The quotient and cokernel assertions in the same package sentence must use that torsion notion.

   **Exact repair:** Replace `ℤ_p`-torsion by `Λ_{F′}`-torsion here, and explicitly identify the quotient as the quotient by that Iwasawa torsion submodule. Retain the two-variable/one-variable distinction. Add the simultaneous checks `5u≠0` and `(σ−κ(σ))u=0`; the first excludes coefficient torsion and the second verifies Iwasawa torsion. This repairs the displayed example without excluding the cyclotomic line.

3. **F03** (P2) The smoothed elliptic unit needs an auxiliary ideal prime to p

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:318–322`, §2.4. Package quotation: “For general `m` prime to `a`, define `a ζ_m` … for any `r ≥ 1` making units inject”.

   **Claim:** The formula defines a nonzero unit for these choices and is independent of `r`; no condition `a` prime to `p` is stated for this construction.

   **Witness:** Take `K=ℚ(i)`, `p=5`, `a=(5)`, initial `f=(3)`, `m=(1)`, `r=1`. Units inject modulo `(5)`, but the nonzero level point lies in `E[a]`, where `aθ_E` has a pole.

   The initial auxiliary condition `a` prime to `6f` holds. At the new level, the point has annihilator `(5)`. Its coefficient in `div(aθ_E)=N(a)(0)−E[a]` is −1, so `aθ_E(α)⁻¹=0`. Its norm is 0, not an element of `K(1)^×`. JLK line 590, immediately preceding Definition 3.2, fixes the auxiliary ideal prime to `6p`; lines 600 onward then give the norm relations. Layer 4's use at :434 already imposes this missing hypothesis, but does not repair the definition in §2.4.

   **Exact repair:** Keep the standard `a z_f` definition at its stated generality. Introduce the separate hypothesis `a` prime to `6p` before defining `a ζ_m`, retain `m` prime to `a`, and carry it into independence and norm statements. Add the failed `(5)` example as a negative control. With `a=(7)` instead and the same `p,m,r`, `E[5]∩E[7]={0}`; the nonzero level point is neither a zero nor a pole, so the value and its norm are nonzero. This is the source's full supported range, not a restriction on the prime of the main conjecture.

4. **F04** (P2) The CM action omits the quotient-isogeny pullback

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:381`, §3.1, using `η_a` defined at :304. Package quotation: “`σ ↦ ψ(a)⁻¹ (η_a^*)^{⊗r} ∘ σ`”.

   **Claim:** The formula is an endomorphism of the fixed étale realization, and the analogous semilinear action defines the de Rham realization.

   **Witness:** By §2.3, `η_a:E/E[a]→E^(σ)`. Thus `η_a^*` lands in `H¹(E/E[a])`, not `H¹(E)`. Kato line 5434 explicitly uses the canonical isogeny for the last pullback.

   This is a missing map, not a harmless scalar choice: no identification of those two cohomology spaces is supplied by the formula. Kato lines 5407–5413 and 5431–5434 construct the action through the composite isogeny from `E` to `E^(σ)`. For a concrete normalization test, use `K=ℚ(i)`, modulus `(1+i)^3`, `r=1` and `a=(5)`. The Artin symbol is the identity since `5≡1` modulo that modulus. The composite quotient isogeny and canonical identification is `[5]`; its pullback on the chosen CM line is 5, and `ψ((5))=5`. The normalized action is therefore `(1/5)·5=1`, as the identity automorphism requires.

   **Exact repair:** Name `q_a:E→E/E[a]` and `J_a=η_a∘q_a`. Use `ψ(a)⁻¹(J_a^*)^{⊗r}∘σ`, equivalently include `(q_a^*)^{⊗r}` after `(η_a^*)^{⊗r}`, in both the étale and de Rham actions. Specify the tensor bases: `K` for Betti, `K⊗ℚ_p` for étale and `K(f)` for the tensor power of `coLie(E)`, as in Kato lines 5399, 5403 and 5426. Retain the existing realization dimensions and add the principal-ideal identity test above. It now has the correct domain and target and evaluates to 1.

5. **F05** (P3) A principal ideal is confused with a prime above 7

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:371`, Layer 2 Examples. Package quotation: “`a = (7)` (split, norm 7)”.

   **Claim:** The principal ideal `(7)` in `ℚ(√−3)` has norm 7 and supplies the factor `7−σ_a`.

   **Witness:** `N((7))=7²=49`. The prime ideal `(2+√−3)` has norm `2²+3=7`; its conjugate is the other prime above 7.

   **Exact repair:** Write `a=(2+√−3)`, a prime above 7, and keep `7−σ_a`. Alternatively retain `(7)` and use `49−σ_(7)`. The first repair preserves the intended inert-versus-split comparison: `(5)` has norm 25, the selected prime above 7 has norm 7, and their principal product `(7)=a·ā` has norm 49.

6. **F06** (P3) The twist Check does not distinguish the inverse convention

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:193`, §1.1 Checks. Package quotation: “with `χ(g) = −1` … the semilinearity is `φ(g·x) = −g·φ(x)`”.

   **Claim:** This is the numerical convention Check for the inverse character in the semilinearity law.

   **Witness:** Both `χ(g)` and `χ(g)⁻¹` are −1 in this example. The stated Check also passes for the explicitly identified wrong convention.

   The following sentence correctly recognizes agreement in order two, but it supplies no computed non-real instance. The binding convention rule requires a Check which distinguishes the alternatives. The order-four Check in §2.5 concerns an Euler factor, not this semilinear map.

   **Exact repair:** Add an order-four character with `χ(g)=i`, over an allowed coefficient ring containing `i`, and a nonzero basis vector. The factor in `φ(g·x)` must be `i⁻¹=−i`, while the wrong convention gives `+i`. Keep the quadratic example only as an agreement/boundary test. These values also agree with the standing `Tw_{χ⁻¹}` convention and the supplied twist construction.

Six findings: two P1, two P2 and two P3. Four are blocking. The mathematical scope is an appropriate Part II and is repairable. Lean elaboration and the mechanical dependency check pass. No package source file was edited during this review.

## Previous findings, checked first

The nine findings in the round-2 review were compared with the round-3 repair report and the actual files. No finding below reopens an item marked “not actionable in this package”. Quotations in this table are from the package, not from sources.

| Previous finding | Status | Repaired passage and independent test |
|---|---|---|
| R01, scalar coefficients and determinant shift | Repaired | README:448 now says `ETNC(h⁰(F)_E, O_E)` and uses `Det(RΓ(…)[1])`. For `[ℤ_p →p ℤ_p]`, the determinant valuation is +1, its shift has −1, and an additional inverse would restore +1. The scalar tensor example has component valuations `(0,1,−1)` and total 0; it does not assert three separate integral generators. |
| R02, Frobenius transport | Repaired for the reported interpolation defect | README:546 defines `Φ(g) = ((g ∘ θ)^φ) ∘ θ⁻¹`; :548 says `N_F g_u = Φ(g_u)`. With `p=5`, `c³=1≠c`, `θ=cT`, this gives `ε_F=cX`, `g=1+X/c`, `Φg=g`, and `D_θ log g=1`. The subsequent measure construction, also changed by the repair, fails a different test: new R01. |
| R03, one-variable kernel and specialization | Partly repaired | README:563 says “No one-variable Coleman map is asserted to be injective”; :587–598 retain both `A_{F′}` and `ℤ_p(F′)`. Their characteristic-ideal signs and the Tor cancellation are correct. However, :563 calls the surviving Tate module `ℤ_p`-torsion. New R02 corrects that false coefficient-ring assertion. |
| R04, image versus hull | Repaired | README:574 says “the same localization at every height-one prime”. At :579, `Aν/Jν ≅ Ô ≠ 0`, whereas every height-one localization is zero. The separate assertion about an individual auxiliary factor is corrected at :580 and in §2.6. |
| R05, finite Frobenius eigenvalue | Repaired | README:232 retains `1 − χ(δ_𝔩)⁻¹γ_𝔩⁻¹`. For `K=ℚ(i), p=5, f=(3)`, the two inertia-trivial quartic characters give augmentation 2, the trivial and quadratic characters augmentation 0. The distinction is carried through §§6.1–6.3 and the worked example. |
| R06, central-character parity | Repaired | README:898 says “for even `k`”. At `k=3`, a proposed square root character would give `h(−1)²=−1`, but a character of an order-two element gives `h(−1)²=1`. The endpoint §8.6 still covers every `k≥2`. |
| R07, five incorrect Checks | Repaired | README:191 now has `T_2μ_4 = 0`; :346 has derivative `−log(9)/4 ≠ 0`; :532 distinguishes division-tower degree 16 from ray degree 4; :578 distinguishes ideal type `(1,0)` from idelic type `(−1,0)`. Transverse norms in §1.2 kill the finite root groups. The point count is 8 and the ordinary Euler product is `(32−24i)/25`. |
| R08, native ray fields and missing headline | Repaired | README:62 and Suggested.lean:18–22 name `TauCeti.ClassFieldTheory.rayClassField` and `rayClassArtinEquiv`; these exist at the pin. Suggested.lean:34–36 now identifies the Katz functional equation and λ-identity as unstated because their measure carrier is missing. |
| R09, references and manifest | Repaired | README:936–937 include Coleman79 and BKO21. The Rubin91 locator includes §5. Ten cited works have ten manifest entries, with no duplicate key for a version of the same work. |

I reread the changed paragraphs and searched their patterns elsewhere: coefficientwise versus transported Frobenius, scalar versus group-ring determinants, literal image versus divisorial hull, one- versus two-variable control, finite Frobenius eigenvalues, parity and missing native carriers. For unchanged material, only earlier adversarial rows with actual computed values were reused; sampled targets were checked again. New R01, R02 and R06 arise in these renewed checks, not from treating the repair report as authoritative.

## Verified sound

The following are positive results of the review, not additional findings. They do not certify the claims refuted above.

### Principles, shape and acceptance file

The package builds on ModularIwasawaMainConjectures §§0.6–0.7 and identifies where its CM extension begins. It retains every prime in the rational endpoint, including 2 and 3; Rubin's narrower hypotheses are distinguished from the all-prime Johnson-Leung–Kings input. It imports generic Iwasawa, Euler-system, theta and Katz constructions by owner and section. I found no algorithmic target, copied source passage, source-chapter layer title, source-following declaration, sorry'd data, `set_option`, prohibited supplier, machine path or process narrative in the roadmap files. The nine layers 0–8 have mathematical headings, Examples and Dependencies. The analytic and algebraic branches are ordered by named inputs; source exposition is not offered as the organizing rule. The README was compared with the shapes on main of ModularForms and ModularCurves.

All definition subsections were read for their object, API, source/target and Checks, and all theorem paragraphs for hypotheses, locators and Needs. There are at least three Checks for the definition blocks; R06 records a non-discriminating convention Check rather than treating a count as evidence. R03 and R04 are the definition defects found in this pass. The repaired §5.1 power-series transport itself is coherent; R01 concerns the subsequent map to measures.

`Suggested.lean` has one `import Mathlib`, one module docstring and the required namespace. It has **zero declarations**: zero sorried theorems to try with `simp`, `rfl`, `infer_instance` or one library lemma; zero declaration signatures needing a `#check @name` binder audit; zero potential name collisions. This is not a substituted API catalogue. The previous syntax-failure lead does not reproduce in the delivered file.

The required `lake env lean` invocation was run on the package's absolute file path from the pinned content checkout. Result: **exit 0, no output and no warnings**. No Tau Ceti object needed building. No Lean process remains running.

| Headline from the Summary / endpoint | README | Acceptance-file treatment and pin test |
|---|---|---|
| CM Kato main conjecture at every prime | §8.6 | Named at Suggested.lean:10–15. Native `Newform` lacks the Galois realization, cyclotomic arithmetic cohomology and zeta morphism. Not statable with a few simple definitions. |
| CM module structure, Kato 12.4 | §7.8 | Named in the same paragraph; the arithmetic `H¹,H²` carriers are missing. |
| Rational equivariant equality with tame Euler factors | §6.2 | Named at :16–22. Ray fields exist, but their norm-limit modules and elliptic-unit submodule do not. |
| Johnson-Leung–Kings equality at all primes | §4.5 | Named at :23–26. Needs arithmetic two-variable complexes, their determinant lines and the elliptic-unit zeta element. |
| Rubin two-variable equality and classical all-prime form | §4.8 | Named at :27–30. Needs the arithmetic local/global unit and ramified Galois norm-limit modules. |
| Katz equality, specializations and anticyclotomic components | §§5.3–5.4 | Named at :31–33. Katz measure, Coleman map and these arithmetic modules are missing. |
| Katz functional equation and λ-identity | §5.5 | Named at :34–36. Missing Katz measure itself, not merely a missing lemma about an existing element. |

No headline can be supplied merely by quantifying arbitrary modules or arbitrary measures: that would discard the arithmetic objects in its conclusion. No statable headline was found missing. Every backticked identifier attributed to the package was read in context; the remaining backticks denote mathematical notation or cited supplier/library names, not absent own Lean declarations.

### Computed adversarial table

The compact table covers all 15 seeded targets, all headline groups, every finding and the changed mathematical passages. “Pass” means that this test supports the stated formulation, not that examples prove a theorem. Unchanged auxiliary checks with computed values in the previous review were also revisited by reading their definitions and dependencies; prose-only assurances from that review were not counted as computations.

| Statement | Instances tried | Values computed on the competing sides | Result / change |
|---|---|---|---|
| §0.1 ray group and small primes | `K=ℚ(i)`, conductor 1, p=2 and 5; p=5 with f=(3) | Finite torsion orders 1, 4 and 32 respectively; not uniformly prime to p for general f | Pass; arbitrary finite Δ retained |
| §0.2 rational characteristic ideals | `A/(p)`, `A/(T²)`, `(A/T)²` | After inverting p: first module 0, ideal 1; the latter two have length 2 at `(T)` and divisor `(T)²` | Pass; does not assert an integral equality |
| §1.1 ray Iwasawa H⁰ | `T₂μ₄`; trivial `ℤ_p` with degree-p corestriction | `T₂μ₄=0` although `#μ₄=4`; inverse limit of multiplication by p is 0, restriction direct limit is `ℤ_p` | Pass |
| §1.1 semilinear twist | `χ(g)=−1` and `χ(g)=i` | Correct/wrong factors: `−1/−1`, then `−i/+i` | R06; add second test |
| §1.2 unit limit | `ℚ(i)`, p=5; transverse norms | p-unit rank 2 versus global-unit rank 0; transverse degree `p^m` norm on a fixed finite root group is raising to `p^m`, eventually 1 | Pass |
| §1.4 Brauer comparison | One versus two p-adic places | Kernel of sum `ℤ_p^s→ℤ_p` has rank 0 for s=1 and 1 for s=2 | Pass; distinguish H² from class module |
| §§1.5, 6.1, 6.3 Euler components | `K=ℚ(i), p=5, f=(3)` | `#Δ=32`, inertia order 8, quotient order 4; two quotient characters give augmentation 0, two give 2; 28 inertia-nontrivial components give zero local module | Pass after old R05 |
| §2.2 theta normalization and isogeny law | Constant rescaling; quotient by E[a] | `u³=u⁸=1` forces u=1; quotient pushes `N(a)(0)−E[a]` to 0 instead of a nonconstant divisor | Pass with prime-to-degree hypothesis |
| §2.3 CM pairs | `ℚ(i)`, moduli `(3)`, `(1+i)`, `(1+i)³` | Unit images of orders 4, 1, 4; ray degrees 2, no rigid pair, 1 respectively | Pass |
| §2.4 standard and smoothed units | `p=5, a=(5), m=1, r=1`; replace a by (7) | Original value is 0; repaired value is nonzero since E[5]∩E[7]={0} | R03 |
| §2.4 auxiliary norm relation | a=(5), b=(7) in ℚ(i) | Norms 25 and 49; unequal exponents `25−σ_(5)` and `49−σ_(7)` | Pass; not the tautology a=b |
| §2.5 inverse and vanishing | χ(a)=i; trivial χ for K=ℚ(i), f=(3) | Correct factor `25+i` versus `25−i`; derivative `−log 9/4`, order 1 versus order ≥2 for a nontrivial χ with an extra zero Euler factor | Pass |
| §2.6 auxiliary-free element | `A=O[[S,T]], J=(S−a,T−b)` | `A/J=O` of codimension 2; `J_q=A_q` at height one, but a nonzero individual factor can have positive valuation | Pass; ideal and factor distinguished |
| §2.7 cotorsion route | Primitive nontrivial character versus one with an extra tame zero | Leading order 1 and nonzero leading coefficient versus order ≥2 and zero derivative | Pass; route chooses the former |
| Layer 2 split-prime example | `(7)` and `(2+√−3)` | Norms 49 and 7, respectively; 7·7=49 | R05 |
| §3.1 CM realization | Tensor over K versus over ℚ; principal ideal (5), r=1 | K-line dimension 1 versus Q-tensor dimension `2^r`; full pullback gives `(1/5)·5=1`, omitted map has wrong codomain | R04 |
| §3.2 period evaluation | r=1, N(a)=25; r=2 with principal a=(c) | `|N(a)−ψ(a)χ(a)⁻¹|≥25−5=20`; r=2 can give `c²−c²=0` | Pass: no division by arbitrary auxiliary factor in this formula; nonzero choices must be justified separately |
| §3.3 relative height | Inert CM formal group | Absolute p-height 2, relative O_p-height 1 | Pass; declared supplier gap uses relative height |
| §4.1 Euler system and twisting | Finite group C_p at p | Integral character homomorphism exists; idempotent coefficient `1/p` is not integral; unramified norm factor is `1−Frob⁻¹` | Pass; §4.1 imposes a prime to 6p |
| §4.2 scalar ETNC | Split order `ℤ_7[C₃]`, scalar tuple `(1,7,1/7)` | Component valuations `(0,1,−1)`; tensor valuation 0 | Pass; no componentwise integral conclusion |
| §§4.2–4.3 determinant parity | `[ℤ_p →p ℤ_p]` | Unshifted determinant +1, shifted −1, inverse of shifted +1 | Pass; one inversion |
| §4.5 JLK headline | Rank-one model H¹=A, z=t, H²=A/(t) | At each height-one q both lengths are `v_q(t)`; replacing z by et adds `v_q(e)` | Consistent determinant/divisor normalization |
| §4.8 Rubin and classical headline | ℚ(i) at 5; ℚ(√−7) at 2 | Division-tower finite degree 16, ray degree 4; −7≡1 mod8 gives splitting, but `2∣#μ₂` excludes Rubin's original hypothesis | Pass; all-prime route is separately supplied |
| §5.1 transported Frobenius | p=5, c³=1≠c, θ=cT | ε_F=cX; Φ(1+X/c)=1+X/c; coefficientwise twist gives `1+cX`; Dθ log=1 and trace equation is 5=5 | Pass after old R02 |
| §5.1 Teichmüller interpolation | Constant c moved by Frobenius | `N(φ^(−n−1)c)=(φ^(−n−1)c)^p=φ^(−n)c` | Pass |
| §5.1 measure projector | g=(2+T)/ω(2), p=5 | Bad constant 2/5 and trace 2 versus required integral constant and trace 0; corrected d has constant 0, first moment −1 | R01 |
| §5.1 Λ-linearity | Same d, a=2 | Raw logarithmic-derivative action first moment −4; regular pushforward −2; after H, second moments −4=−4 | R01 |
| §5.1 one-variable torsion | Compatible ζ_(5^(n+1)) | Norm ζ₂₅=ζ₂₅^55=ζ₅; `5^m u≠0` for every m; `(σ−κσ)u=0` | R02; Λ-torsion, not ℤ₅-torsion |
| §5.2 image versus hull | J=(S−a,T−b), ν≠0 | `Aν/Jν=Ô≠0`; all height-one quotient lengths 0; hull Aν | Pass after old R04; map still needs R01 |
| §5.2 CM-type comparison | E:y²=x³−x over 𝔽₅ | Point counts over x=0,1,2,3,4 are 1,1,2,2,1 plus infinity: 8; a₅=−2; Euler products `(32−24i)/25` versus conjugate `(32+24i)/25` | Pass; selects ordinary place |
| §5.3 specialization Tor terms | `Z=A₂/(S−s,T)`; `Z=A₂/(S−s,T−t)`, t≠0 | First: Z[T] and Z/T both have height-one length 1; second: torsion 0, quotient O/t finite length and characteristic ideal 1 over A₁ | Pass; cancellation, not individual pseudo-nullity |
| §5.3 one-variable correction | Trivial component versus nontrivial component | `char ℤ_p(F′)^1=(γ−1)`; nontrivial component gives module 0 and ideal 1 | Pass; correction retained |
| §5.4 θ-component headline | θ≠1 and θ nontrivial on D_pbar | Both correction components 0, characteristic ideals 1; T and pT each have λ=1 but different ideals | Pass; no μ=0 inferred from λ equality |
| §5.5 functional equation headline | Involution on A₁ | `ι(T)=(1+T)⁻¹−1=−T/(1+T)`; both λ-invariants 1; the quotient is a unit | Pass on invariant normalization |
| §6.1 regular-prime equality | Local tame factor e, q=(e) with simple zero | `length H²_pf=length h²+1`; removing e incorrectly gives a difference of 1 | Pass with stated Euler term |
| §7.1 CM characterization | CM conductors over ℚ(i), ℚ(√−3); level 11 non-CM form | Levels `4·8=32`, `3·9=27`; inert-prime self-twist would force a₂=0 for candidate ℚ(i), but level-11 form has a₂=−2 | Pass; general-weight induction retained |
| §7.6 contained case | p=2,3,5,7 | Imaginary quadratic possibilities at 2 are ℚ(i), ℚ(√−2); at 3 and 7 are ℚ(√−3), ℚ(√−7); unique quadratic at 5 is real ℚ(√5) | Pass; ℚ(i) is not contained at p=5 |
| §7.7 length lemma | A=ℤ_p[[T]], M=A/(T), a=p | M/a=𝔽_p of length 1, M[a]=0; RHS has one height-one term of coefficient 1 and length 1 | Pass; a=p with M=A/(p) is excluded by the height-one hypothesis |
| §7.8 CM module headline | Generic component and finite tame Euler quotients | H² rank 0, H¹ rank 1; a nonzero Euler factor contributes rank 0, so localization sequence preserves rank 1 | Consistent; proof uses nonvanishing, not arbitrary rank-one data |
| §8.1 archimedean normalization | Two sign lines with nonzero chosen periods | Scaling by c₊ and c₋ preserves periods only if c₊v₊=v₊ and c₋v₋=v₋, hence c₊=c₋=1 | Pass; only Gal(ℂ/ℝ)-equivariance claimed |
| §8.4 zeta bridge | r=k−1; zero γ; Tate sign | Period power `(2πi)^(k−1−r)=1`; γ=0 maps to 0 on both sides; the inverse Tate line has conjugation −1 | Consistent with the sourced bridge; no extra period scalar |
| §8.5 equality descent | A=O[[x,y]] localized at (x,y), M=A/(y), a=x | Quotient length 1, a-torsion length 0; divisor sum 1. For the general exact sequences, `length(M₁/a)=length(M₁[a])+length(M₂/a)` | Pass; equality bookkeeping supplies what the cited inequality alone does not |
| §8.6 all-prime rational endpoint | Coefficient extension ramification index e; integral p-factor | Equal lengths n,n become en,en; ideals `(p)` and `(1)` both become `(1)` after inverting p | Pass; rational claim cannot imply integral equality |
| §8.7 central specialization | k=2 and k=3 | k=2 gives character c↦c⁻¹ and quotient O; k=3 forces −1=1 at the order-two element | Pass with even-weight condition |

### Source sample and manifest

All ten manifest texts were available in the supplied legal cache. No new source was fetched, no manifest entry was changed and no duplicate key was introduced. No author-marked unverified locator was found outstanding. The table records actual readings of the sample; mathematical errors in a target are not excused by a nearby correct citation. Page numbers below are the printed pagination cited by the README, not extraction-page counts.

| Seeded target | Text and locator checked | Outcome |
|---|---|---|
| 1.1 Iwasawa cohomology of the ray tower | Kato line 5293 onward, §15.6, pp.253–255; JLK lines 861–943, Lemmas 4.3 and 4.7, pp.20–22 | Cohomology amplitudes and the restricted perfectness claims match. General coefficient formalism is explicitly supplied by SelmerIwasawaCohomology. Inverse twist is correct; its Check needs R06. |
| 2.4 Standard elliptic units | Kato lines 5267–5292, §15.5, p.253; JLK lines 590–649, Definition 3.2 and Proposition 3.3, pp.14–15 | R03: the source imposes a prime to 6p for ζ_m. Norm and auxiliary laws otherwise match, subject to the OCR caveat below. |
| 2.6 Elliptic-unit module and auxiliary-free element | Kato lines 5293–5351, §15.6, pp.253–255; JLK lines 951–1038, §§5.1,5.3, pp.23–25; BT lines 136–145 | Auxiliary ideal and codimension-two quotient are present; whole ideal, not each generator, is a unit at height one. |
| 3.1 CM realization | Kato lines 5385–5453, §15.8, pp.256–258; BT lines 199–206 | R04: quotient-isogeny pullback is missing in package. Dimensions and coefficient fields match once that map and tensor bases are retained. |
| 3.2 Period evaluation | Kato lines 5529–5571, (15.9.1)–(15.9.2) and proof, pp.259–260 | Correct locus and r≥1 range. Factorials and period route checked; OCR does not certify every overbar. Vanishing auxiliary factor is allowed in the displayed identity. |
| 4.1 Elliptic-unit Euler system and twists | JLK lines 553–705, Definitions 3.1,3.5, Corollary 3.4, Proposition 3.6, Lemma 3.7, pp.13–16 | Actual construction, conductor conditions and norm factors present. Integral character map is not replaced by an unavailable idempotent. |
| 5.4 Anticyclotomic θ-components | CGLS lines 380–420, Definition 1.2.1, Theorem 1.2.2 and Remark 1.2.3, pp.7–8; Rubin91 lines 671–718, Theorem 5.3 | Local exclusions retained; package adds p prime to h_K for the Rubin route and makes no Hida μ-vanishing claim. New one-variable terms vanish on the stated component. |
| 6.1 Regular height-one equality | JLK lines 1412–1516, §7.2, pp.34–36; BT lines 152–157, Theorem 2.1, p.4; Kato §15.2(2), p.251 | Regular primes exclude p. Package correctly retains the tame Euler modules omitted by the latter two source statements. |
| 7.1 CM characterizations | Kato lines 5572–5601, §15.10, pp.260–261 | CM/self-twist/Hecke-character equivalences and weight k≥2 match. Existing character and modular-form infrastructure is cited. |
| 7.6 K contained in cyclotomic tower | Kato lines 5731–5734, §15.14, p.264, and 5738–5753, §15.15, p.265 | Separate contained-case induction is present. Quadratic subfield classification recomputed at 2,3,5,7. |
| 7.7 Kato length lemma | Kato lines 4912–4931, Lemma 14.15 and proof, pp.243–244 | Noetherian ring, support and height-one avoidance conditions match; both sides tested. |
| 8.1 Archimedean normalization | Kato lines 5602–5663, Lemma 15.11(2) and proof, pp.261–262; caveat at 5670–5676 | Period-normalized real-conjugation comparison is what is stated. It is not promoted to a Galois comparison. |
| 8.4 Elliptic to Beilinson–Kato elements | Kato lines 5754–5760, §15.16, p.265; BT lines 215–216 | The inverse Tate twist and zeta-morphism identification match. Fixed normalization is required and named. |
| 8.5 Equality descent | Kato lines 5762–5772, proof of Proposition 15.17, p.265, and lines 4912–4931; BT lines 213–218 | Kato proves an inequality; package explicitly supplies the additional equal-divisor argument, with the two Tor/quotient contributions on the correct sides. |
| 8.6 Every CM newform and prime | BT lines 208–218, Theorem 2.6 and proof, p.5 | Rational endpoint and all-prime range match. Even weight is required only for the subsequent central specialization, not this theorem. |

Additional repaired or headline sources checked: JLK lines 399–432 and 512–522 (scalar coefficient TNC and tensor determinant identity); HuberKings lines 716–730 (Proposition 2.3.1, h⁰ and powers-of-two limitation); Coleman79 lines 61–89 and 513–530 (Theorem A and norm operator); Rubin91 lines 638–718 (Theorems 5.1,5.3); Kriz lines 1034–1064 (Theorem 27, printed p.22); BKO21 lines 799–823 (Theorems 6.1–6.2, pp.962–963). The last supplies the inert-signed scope boundary, not a theorem consumed in this package.

### Pinned library audit by object

The pins inspected were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, as recorded in the content manifest. Searches used objects as well as proposed names: completed group rings, ray fields, class and unit groups, CM/theta/elliptic units, arithmetic norm limits, Katz measures and newform realizations. Native generic carriers are cited; the arithmetic constructions do not thereby exist.

| Declaration opened at the pin | File and line | What the native object supplies / does not supply |
|---|---|---|
| `ClassGroup` | `Mathlib/RingTheory/ClassGroup/Basic.lean:89` | Quotient of invertible fractional ideals, with a domain hypothesis; not an arithmetic norm limit. |
| `Module.length` | `Mathlib/RingTheory/Length.lean:31` | Extended-natural length from the submodule lattice; finite length is not automatic. |
| `Ideal.height`, `IsLocalization.AtPrime` | `Mathlib/RingTheory/Ideal/Height.lean:36`; `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50` | Height and localization carriers; arithmetic support and finiteness remain hypotheses. |
| `NumberField.Units.regulator`, `regulator_ne_zero` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267,290` | Actual regulator and nonvanishing, supporting the unit-regulator argument. |
| `NumberField.Units.torsion` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean:145` | Torsion subgroup of units; not its Tate module or its tower limit. |
| `NumberField.IsTotallyComplex` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210` | Every infinite place is complex, which excludes real-place dyadic corrections. |
| `IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | Primitive-root and generation conditions, not a chosen infinite arithmetic tower. |
| `cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308` | Total definition has a trivial fallback when the field does not contain all required roots; package uses algebraic closures where the intended root hypotheses hold. |
| `PowerSeries`, `MvPowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86` | Coefficient-function carriers, not a chosen coordinate identification of a completed group ring. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Actual completed algebra with its inverse-limit construction; arithmetic Γ-coordinates and module actions remain supplied constructions. |
| `TauCeti.GlobalNumberFields.Modulus` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98` | Nonzero finite ideal and finite real-place part. |
| `TauCeti.GlobalNumberFields.RayClassGroup` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean:130` | Quotient of ideals prime to the modulus by the ray relation. |
| `TauCeti.GlobalNumberFields.HeckeCharacter` | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70` | Continuous multiplicative map on the idele class group, not Kato's CM realization. |
| `rayClassField`, `rayClassArtinEquiv` | `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123,209` | Actual intermediate field in a separable closure, with finite-dimensional/number-field/abelian instances at :135–143 and the Artin equivalence. Old missing-carrier assertion is repaired. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Eigenform with newness and normalization; no attached p-adic Galois representation. |
| Generic characteristic ideal | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85` | Existing characteristic-ideal construction; package uses it through its supplier rather than re-owning the generic construction. |

### Supplier resolution, ownership and merge order

The board package index was read before drawing absence conclusions. All explicit Needs lines and supplier sections were resolved against main or the provided open heads using the roadmap service and reading the retrieved files. The resolver reported no missing roadmap citation or own Lean name; native names were checked separately because the resolver is not evidence of their definitions.

The following gives the resolved section contracts. Paths in this table are under `TauCetiRoadmap/<name>/README.md`; sections are used as the stable citation locator. Main and open-head copies were distinguished. This is a resolution of the supplied contracts, not a claim to have proved the suppliers' mathematics.

| Supplier | Resolved sections and consumed object |
|---|---|
| GlobalNumberFields; ClassFieldTheory; ProfiniteProPGroups | Layers 2,9,10; Layers 10,11,13 and arithmetic Artin convention; Layer 9 prerequisites: moduli, characters, Brauer sequence, reciprocity, ray fields, completed algebra. |
| ModularForms; EllipticCurves; ModularCurves | Layers 4,5,7,9; Layers 1,2; Layers 0,2: newforms, multiplicity one, Hecke L-functions, isogenies, divisors and formal groups. |
| PadicMeasuresIwasawaAlgebras | §§4.1,4.6,5.1: pseudo-nullity, characteristic ideals, perfect-complex determinant lines. |
| SelmerIwasawaCohomology, #869 | §§0.9,0.10,2.8,3.0–3.3,3.7,3.15,3.17: Kummer, limits, Iwasawa/Shapiro/control, twists, j_* comparison, local conditions. §3.13 is cyclotomic and odd-p; package correctly does not import it for the general ray rank theorem. |
| ArithmeticGaloisDuality, #858 | R02.4.3, R02.4.4, D7.5: Poitou–Tate, Euler characteristic and derived duality. |
| IntegralIwasawaTheory, #1306; ColemanPowerSeries on main | §§2.6,7.1,7.2,10.0; Layers 1–2: cyclotomic weak Leopoldt, series, normalized Coleman map, compact coefficients. The normalization mismatch is R01, with the exact supplier witness above. |
| EulerSystemsAndKolyvaginSystems, #1272 | §§2.2,2.5,8.1,8.2,8.6,8.7,8.14,8.25,8.37: generic Euler-system and Rubin bounds. Elliptic-unit specialization is owned here. |
| ComplexMultiplicationAndExplicitReciprocity, #1254; ImaginaryQuadraticClassNumber | §§1.2,2.2,3.2,4.1,4.2; H3.1: ideal isogenies, idele action, ray fields, weight-two character and induction, lattice dictionary. They do not make the incomplete action in R04 well-typed without the quotient isogeny. |
| AutomorphicGaloisRepresentations, #1007; its PartII, #1006 | §§1.5,7.3; AG2.0: modular realizations and Hecke-character representations. |
| AutomorphicLFunctionsAndLocalFactors, #924; LFunctions | AL.1 global distributions and rank-one comparison; Layer 7: completed Hecke functions, functional equation and nonvanishing. |
| PadicHodgeRegulators, #1498 | §§1.4,1.7: dual exponential and its functoriality. Relative-height-one reciprocity is explicitly a declared gap, not falsely claimed supplied. |
| AutomorphicPadicLFunctionsPartII, #1543 | §§3.3,3.4,8.5: Eisenstein–Kronecker series and Katz measure. The package owns its elliptic-unit comparison, not the measure construction. |
| PeriodsAndSpecialValues, #1496 | PS.5.2 and PS.6.5: determinant/period infrastructure; no componentwise integral ETNC is inferred from the scalar statement. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §5.1: reduction/formal-group input. |
| PadicFamilies, #1019 | §§4.0.1,4.0.3: integer-indexed theta functions and non-CM rational structure. Ideal-indexed CM functions and CM structure are differentiated here. |
| NoncommutativeAndEquivariantIwasawa, #1307 | §4.3, especially README:2063,2077,2083: rational CM curve, p≥5 ordinary, image ideal J and Katz characteristic ideal. General imaginary quadratic field/class number and the all-prime conclusions are genuine extensions here. |
| KatoEulerSystems, #1804 | §§4.2,4.4,5.1,5.3,7.2: analytic nonvanishing, non-CM module structure, zeta morphism and interpolation, non-CM bound. The CM clauses are not used to prove their own CM input. |
| ModularIwasawaMainConjectures, #1499 | §§0.1,0.6,0.7: modular datum and the rational conjecture being proved, not replanned. |
| AnticyclotomicLocalUnits | §1.1: inert height-two interpolation; split height-one transport is distinct. |

The closest open heads in the overlap report were read: KatoEulerSystems #1804, AutomorphicCongruences #1816, ModularIwasawaMainConjectures #1499, EulerSystemsAndKolyvaginSystems #1272 and CMRankZeroConverse #1744. They respectively supply the named zeta/generic constructions or consume the CM/Katz consequences; no additional competing ownership was identified. The broader object searches also checked NoncommutativeAndEquivariantIwasawa, AutomorphicPadicLFunctionsPartII and EllipticCurvePeriodsAndModularParametrizations #1715. The latter's ring-class, one-variable norm closures are distinguished from the every-modulus ideal-indexed Kato units here. No identical fully qualified Lean declaration can occur because this acceptance file declares none.

The supplied overlap report has no conflicting head changing this roadmap, no dropped cited id and no id supplied only by an unnamed open revision. Section numbering has not changed in the repair. No additional overlap finding is warranted. Ownership against open work for which no readable head was provided is not claimed; see below.

The gap `height-one-explicit-reciprocity` occurs both in `design/plan.json`'s top-level gaps list and README:109, naming PadicHodgeRegulators §1.4. It specifies the finite local field, p-divisible group with O_𝔭 action, relative height one, norm-compatible units, Kummer cup product, Tate basis and Coleman derivative evaluation. It is a precise missing theorem, not an unowned prerequisite or a request for an already-native construction. This review does not demand its implementation in this package. Acceptance after repairs may be conditional on that gap.

The dependency check was run with the supplied name, content checkout, merge order and movable setting. Its complete result was:

```text
depcheck: 236 roadmaps, 2151 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No supplier or merge-order file was edited.

## Not verifiable

- Yager is an OCR extraction. The basic Chapter 3 norm/derivative argument is legible, but portions of Theorem 1 and Chapter 8 are too damaged to certify the full displayed normalization or all generality directly. Coleman79's fixed-base theorem and Rubin91's stated comparison were readable. R01 also has an independent rational-function counterexample and an exact supplied normalization, so it does not depend on guessing OCR.
- Some overbars and displayed factors in Kato (15.4.4), (15.5.1) and (15.9.1)–(15.9.2) are lost in extraction. The character-inverse, period and Frobenius conventions were tested, but those individual typographic glyphs are not certified from the extraction alone.
- The source statements and the proof steps explicitly used in the sampled routes were checked. This review does not independently reconstruct every proof in Rubin91 §§8–10. No unread proof is represented here as a computed verification.
- No readable head for InertAnticyclotomicCMMainConjecture was supplied among the available roadmap files. Its signed inert scope boundary was checked against BKO21; it is not a dependency of this package. Ownership against other open pull requests without provided readable files was not checked. The provided main/open files and board package index were searched.

There is no newly missing bibliographic work to request: all ten recorded works are present. These extraction limitations are recorded rather than inventing a second key or reopening a settled source entry.

## Source issues

- **Error** in BT at Theorem 2.1, printed page 4: the source says the two characteristic ideals agree without tame conductor corrections; it should retain the away-from-p Euler modules, or use H² over the p f-open; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed page 251: the source says the conductor-f elliptic-unit quotient and class module have equal lengths throughout its stated range; it should retain tame Euler factors on components where they are nonunits; affects a stated result.
- **Gap** in BT at the proof of Theorem 2.6, printed page 5: the source says equality follows through Kato's descent; it should supply the equality bookkeeping, since the cited Proposition 15.17 proves an inequality; affects the proof.
- **Misprint** in Kato at the proof of Proposition 15.17, printed page 265: the source says the needed length result is Lemma 14.12; it should cite Lemma 14.15; affects nothing.
- **Misprint** in Kato at (15.4.2), printed page 252: the source says the theta norm identity holds for an unrestricted linear isogeny; it should require degree prime to N(a), since quotienting by E[a] sends the divisor to zero; affects a stated result.
- **Gap** in CGLS at Theorem 1.2.2, printed page 8: the source says Rubin's theorem supplies the comparison under the displayed assumptions; it should justify the prime-to-p class-field-degree input or invoke a theorem dispensing with it; affects the proof.
- **Misprint** in JLK at §1.2, printed page 4 (JLK line 164): the source says a character factors through a subgroup identified as Gal(F′/K); it should say quotient group for the subextension F′/K; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0d71390a569ebc94357a708b31c496a5d95a18ee", "job": "REV-PKG-ModularIwasawaMainConjecturesPartII~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
