<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12942#issuecomment-6789208834 -->
Review (codex) of 7bdf2de

Verdict: needs_changes

1. **F01** (P3) Keep the defining relation consistent in the worked tower

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1742–1745`: “with `f = x_1` (unramified)” and “whose stages `A/(φ_A^n(f))`”.

   **Claim:** The tower presented by the relation `p − f` has the Q10.4 stages displayed using `φ_A^n(f)`.

   **Witness:** At `p = 2`, `f = x`, `n = 1`, that formula gives `ℤ₂⟦x⟧/(x²)`, containing nonzero square-zero `x`; the asserted tower has `ℤ₂⟦x⟧/(2 − x²)`, a domain.

   **Exact repair:** In this worked example, call the series `g`, write the initial relation as `F = p − g`, and write the stages as `A/(φ_A^n(F))`. Explicitly identify this `F` with Q10.4's defining element `f`. Keep `g = x_1` in the unramified example and `g ∈ (p,x)²` in the ramified example. Do not change Q10.4 or add a Lean declaration.

   **Repair test:** With `g = x`, `φ(F) = 2 − x²`, so the corrected first stage is `ℤ₂[√2]`, of rank two, and the class of its relation in `𝔪_A/𝔪_A²` is `(1,0)`, agreeing with Q10.4. With `g = x²`, the first stage is `ℤ₂⟦x⟧/(2 − x⁴)`, also Eisenstein and regular; the original `φ(g) = x⁴` would again give a nonreduced ring. This is a notation error in the worked example, not a counterexample to Q10.4 with its stated normalized presentation.

2. **F02** (P3) The flatness Check does not isolate regularity on the base

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:961–963`: “The regularity of `f` on `A` is needed”.

   **Claim:** The dual-number example demonstrates the necessity of regularity on `A` while retaining the theorem's other hypotheses.

   **Witness:** For `A = 𝔽_p[ε]/(ε²)`, `M = 𝔽_p`, `f = ε`, multiplication by `f` is zero on nonzero `M`. Thus regularity fails on both `A` and `M`.

   **Exact repair:** Retain the computation but replace its opening with “Dropping both regularity hypotheses can also fail: …”. State that this is a simultaneous failure example, not a test isolating regularity on `A`. Alternatively replace it with an example that retains regularity on `M`; no theorem or Lean change is required.

   **Repair test:** In the retained example, `M[1/ε] = 0`, `M/εM = 𝔽_p`, and `Tor₁^A(𝔽_p,𝔽_p) = 𝔽_p ≠ 0`. Both flatness tests pass and both regularity assumptions fail, exactly as the corrected Check says. The preceding Check with `A = ℤ`, `M = ℤ/p` still isolates regularity on `M`.

Two P3 findings, no P1 or P2 findings. Both previous findings are repaired. The new findings concern a worked-example formula and the interpretation of a negative-control Check; neither refutes a headline theorem. The four authored package files were not changed.

## Verified sound

### Previous findings checked first

No finding was marked not actionable. Neither new finding re-raises a settled exception.

| Previous finding | Status | Repaired passage and independent test |
|---|---|---|
| Round 3 F01, vacuous Zariskization API | Repaired | README 1373: “for `p`-Zariski `A` and a faithfully flat `A`-algebra `B`, the `p`-Zariskization `B_{1+pB}` is faithfully flat over `A`”. The hypothesis concerns `B`, not its localization. For `B = ℤ₂[T]` the closed fibre remains `𝔽₂[T] ≠ 0`; for flat-only `B = ℚ₂` the localization is zero. |
| Round 3 F02, initial cotangent-space class | Repaired | README 1566: “at `n = 0` the element `φ_A^0(f) = f` is not in `𝔪_A²` by the choice of presentation”; README 1568 restricts the next calculation to `n ≥ 1`. For `p = 3`, `f = x − 3`, the classes are `(2,1)` and `(2,0)`. |

The added normalization at README 1544–1546 is necessary and correct: “so that `f(0)` has `p`-adic valuation one”. For `f = p² − x`, the class of `φ(f)` is zero, whereas after the prescribed replacement `f = x − p` its class is a nonzero multiple of `[p]`. At `p = 2` the latter classes are `(1,1)` initially and `(1,0)` thereafter. The normalization retains ramified rings and imperfect F-finite residue fields.

Read all five API lists for the old hypothesis-containing-conclusion pattern; it does not remain. Read all occurrences of the normalized presentation, Frobenius stages and worked towers; R01 is the remaining notation mismatch. The repaired Zariskization argument is also used correctly in Q9.6. The newly added Checks for `ℚ_p`, `ℤ_p[T]`, `A = B = ℤ`, and `p² − x` have the asserted values.

### Principles, shape and headline coverage

Read the complete README: 37 numbered subsections in six layers, six Examples endings, six Dependencies endings, every API list, Check, proof route, supplier contract and reference. Consulted main's `TauCetiRoadmap/PerfectoidSpaces/README.md`, `TauCetiRoadmap/StableReduction/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` for shape and context. The definition sections Q7.1, Q7.2, Q8.2, Q9.1 and Q9.5 have APIs and respectively 5, 5, 3, 4 and 6 Checks; R02 concerns a separate theorem Check.

The package extends PerfectoidQuotients and imports its existing integral algebra. It preserves torsion, zero divisors, all primes, arbitrary-rank valuation rings and the F-finite imperfect-residue-field generality. The cover in Q10.5 includes an actual compatible map to the completed absolute integral closure; Q10.6 constructs that cover under its stated F-finiteness hypothesis. No route-specific weakening, replanning, computational algorithm, copied source passage, upward supply, sorry'd data or `set_option` was found.

The layer names and dependency structure are mathematical. Q7 and Q8 are independent preparation branches for Q9, and their order differs from the source's exposition. Q10 adds the regular-local applications with their own inputs. Source references identify mathematical ownership and locators; the README does not instruct an implementer to follow a source's chapter arrangement.

No process narrative, pull-request number, job identifier, machine path or HTML anchor was found in the authored text. The namespace, module docstring and imports have the required form. All 18 local identifiers, comprising three real definitions and fifteen theorems, occur in the README; no backticked name presented as this package's own lacks a declaration. Metadata has `topic = "math.AG"`. All nine cited works have distinct, legally cached manifest entries with version-specific locators; no manifest change or reference request was needed.

| Headline from README summary / acceptance-test paragraph | Coverage in Suggested.lean |
|---|---|
| Q5.6 perfectoid fibre products | `isIntegralPerfectoid_fibreProduct` |
| Q6.2 completeness transfer | `isAdicComplete_preTilt_iff` |
| Q6.4 valuation rings and value groups | `valuationRing_iff_preTilt`; `untilt_dvd_iff_and_exists_isUnit_mul_untilt` |
| Q6.7 algebraically closed fraction fields | `isAlgClosed_fractionRing_iff` |
| Q6.8 three torsion-free presentation forms | `exists_surjective_of_isSMulRegular`; `exists_surjective_of_isSMulRegular_of_roots`; `exists_surjective_of_isSMulRegular_p` |
| Q8.3 integral approximation | `exists_approximation` |
| Q8.4 valuative nilpotence | `isTopologicallyNilpotent_iff_forall_lt_one` |
| Q9.3 ordinary ind-syntomic André theorem | `exists_indSyntomic_andre` |
| Q9.6 semiperfectoid covers | `exists_semiperfectoid_cover` |
| Q10.2 regular-local perfectoid covers | `exists_faithfullyFlat_isIntegralPerfectoid` |
| Q10.5–Q10.6 almost vanishing of Tor | `tor_map_mul_root_eq_zero_of_cover`; `tor_map_mul_root_eq_zero` |
| Q6.1 relative tilting equivalence | Explicitly named as not statable in the module docstring: the relevant integral-perfectoid algebra categories and relative tilt functor are missing at the pins. No replacement theorem is offered. |

### Elaboration, signatures and padding

Ran `lake env lean` on the package's absolute Suggested.lean path from the prescribed content checkout. Exit 0, fifteen warnings, all “declaration uses `sorry`”. The four individual Tau Ceti module object files were available; no build was needed. There is one `import Mathlib` and no import of another roadmap.

On a scratch copy, tried goal-closing `simp`, `rfl`, `infer_instance` and `assumption` for every sorried theorem. All fifteen reached the individually labelled fallback admission. This copy elaborated with exit 0; its extra unused-tactic diagnostics came from the deliberately unsuccessful probes. Read the supplied near-match leads and compared the relevant native declarations: no one-lemma `exact` candidate proves a retained headline. In particular, projective-argument Tor vanishing does not apply to arbitrary `N`; the valued-field tilt-domain result is narrower than arbitrary integral perfectoid valuation-ring equivalence; the Fontaine evaluation identities do not supply the transfer, existence or approximation assertions. None of the fifteen theorems is a definition restatement, numerical Check, boundary-case theorem or free-variable surrogate. No padding finding results.

Appended `#check @name` for all eighteen declarations and read their elaborated types. No necessary section binder was lost. The native perfectoid instance supplies p-adic completeness; nonunit, domain and adic-topology hypotheses remain where the carriers require them. The approximation quantifier chooses one approximant before all valuations. The Tor statements retain maximal-adic completeness, mixed characteristic, finiteness of S, localized étaleness, compatible roots, and positive `n` and `i`; Q10.6 retains finiteness over the Frobenius field range. The Tor map is the actual base-changed inclusion followed by multiplication by `1 ⊗ c_k`. `IsPZariski` appropriately has no prime binder of its own; its headline uses still assume a prime. Nothing in Suggested.lean was changed.

### Source sample: all fifteen bold Theorem targets

There were no author-flagged unverified locators. The seeded labels resolve to the fifteen bold Theorem targets. Read their cached source text, the page boundaries and relevant proof steps, rather than relying on the previous review's source table.

| Sample | Exact text checked | Outcome |
|---|---|---|
| Q5.6 | CS24 Proposition 2.1.4, pp.12–13, CS24 line 468–486 | Surjection on one side, arbitrary perfectoid other side; both perfectoidness and tilt comparison match. |
| Q6.2 | CS24 Proposition 2.1.9, pp.14–15, CS24 line 539–565 | Divisibility by ξ₀ and both completeness directions; no torsion-free hypothesis is silently added. |
| Q6.4 valuation equivalence | Same proposition, CS24 line 544–546, 568–576 | Domain/valuation equivalence in both directions, including characteristic p. |
| Q6.4 value groups | CS24 line 547, 572–576 | Sharp, divisibility and the unit-times-sharp form give the stated order and surjectivity. |
| Q6.7 | CS24 line 576–585; Sch12 Theorem 3.7(ii), Proposition 3.8, p.17, Sch12 line 751–761 | Rank-one field comparison plus the height-one localization argument. |
| Q6.8 regular lift | CS24 Proposition 2.1.12, pp.17–18, CS24 line 682–700 | Regular lifted element, adic completeness, divisibility and surjection match. |
| Q6.8 specified roots | CS24 line 687–699 and Theorem 2.3.4 proof, p.25, CS24 line 1015–1018 | Taking the tilt element from the specified root sequence makes the auxiliary unit one, so all specified roots lift. |
| Q6.8 p-torsion-free source | CS24 line 684, 700–702 | The separate zeroth-Witt-coordinate choice proves this form. |
| Q8.3 | CS24 Lemma 2.3.1, pp.22–23, CS24 line 895–950 | Uniform choice, factor v(p), exponent pm and threshold equivalence match. |
| Q8.4 | CS24 Lemma 2.3.2, p.24, CS24 line 959–978; Wedhorn Proposition 7.18(1), pp.60–61, Wedhorn line 2494–2503 | CS24 states the principal-adic form; the general Tate form uses a pair of definition and the cited native continuous-valuative integrality criterion. |
| Q9.3 | CS24 Theorem 2.3.4, p.25, CS24 line 1004–1030 | Both alternatives, divisible ideal and both faithful-flatness assertions match. Positive degree correctly handles the constant polynomial. |
| Q9.6 | CS24 Corollary 2.3.7, pp.28–29, CS24 line 1157–1174 | Reduction precedes completion; the source of the quotient is not required to be an A-algebra. |
| Q10.2 | BS22 Remark 3.11, pp.32–33, BS22 line 1299–1327; Bha18 Proposition 5.2, p.8, Bha18 line 469–479 | Uses generalized integral perfectoid rings, modification (a), for ordinary faithful flatness; equal characteristic uses the named Kunz supplier. |
| Q10.5 | BS22 Remark 10.13, pp.83–84, BS22 line 3208–3226 | The package states the compatible-cover hypothesis and supplies the root-transport argument that the short source remark leaves implicit. |
| Q10.6 | HM17 Theorem 1.3, p.2, HM17 line 65–70; BS22 line 3210–3226 | F-finiteness is retained. The mod-pⁿ Tor theorem is the sufficient stronger form described by BS22, not an identical quotation of HM17. |

Additional readings for changed passages and conventions: Stacks Lemma 10.39.15/tag 00HP, Stacks line 4367–4372; Lemma 10.99.16/tag 0H7N, Stacks line 11208–11238; BMS1 Definition 3.5, Example 3.6, Lemmas 3.9–3.10, BMS1 line 1008–1067; Ces19 Lemma 5.2 and proof, Ces19 line 447–462; Bha18 Proposition 5.1, Bha18 line 451–467. Numbering is explicitly that of the cited arXiv versions.

### Computed adversarial pass

The previous report has explicit computed rows for the headlines and several supporting statements. Its summary of other subsections was not treated as a substitute for reviewing them: all 37 subsections were read in full this round. The table records the sampled headlines, definitions, repaired passages and supporting computations; “sound” below means these tests and the accompanying statement/proof audit found no additional defect, not that examples prove a general theorem.

| Statement | Instances | Values on the two sides / discriminating calculation | Result / change |
|---|---|---|---|
| Integral perfectoid convention | 0, 𝔽₂, ℤ₂ | For 0 and 𝔽₂ choose π=0; completion is the original ring and ker θ over 𝔽₂ is (2). In ℤ₂, 2v₂(π)≤1 forces a unit π, whose completion is 0≠ℤ₂. | Correct native predicate; no reducedness or domain assumed by definition. |
| Q5.1 alternate tilt and θ | A=ℤ₃; wrong modulus 9; characteristic p | Tilt ℤ₃♭=𝔽₃ with three compatible sequences. Modulo 9, (1+1)³=8≠2, so the wrong quotient has no Frobenius ring map. For a perfect characteristic-p ring both tilts and sharp are the identity. | Divisor condition discriminates; θ uniqueness is applied modulo pⁿ where p is nilpotent. |
| Q5.2 products and pullbacks | A′=0; g=id; empty product | Pullbacks equal A×B and A respectively, before and after tilt; empty product and its Witt ring are 0. With A′=ℤ/p², p²·1=0 but p·1≠0, so the bound-one argument fails as expected. | Sound. |
| Q5.3 sharp quotient | Completed 3-root tower | Both mod-3 rings are 𝔽₃[t^(1/3^∞)]/(t); (ϖ♭)³=t. Multiplication of t by a unit changes neither quotient ideal. | Direction and ideal normalization agree. |
| Q5.4 torsion comparison | 𝒪_C×𝔽̄_p, ϖ=(p^(1/p),0); characteristic p | Both annihilators are 0×𝔽̄_p. For ξ=p in characteristic p, M={(x,y):x=y}/p identifies with A on both projections. In 𝔽_p[t^(1/p^∞)]/(t), t^(1/p)≠0 but its p-th power is 0, unlike the reduced tilt. | Correct isomorphism and negative control. |
| Q5.5 surjection | f=id; 𝒪_C→k̄; target 0 | Kernel for identity is 0; W(𝒪_C♭)→W(k̄) has kernel W(𝔪_C♭); for target 0 the quotient of the whole A_inf by ξ is A. | Correct sources and targets. |
| Q5.6 headline | Two perfect root-polynomial rings over 𝔽₂ mapping to 𝔽₂ | Pullback is pairs with equal constant term; unique square roots are coordinatewise and preserve that equality. Tilt gives the same ring. For A′=0 both sides give A×B. | Sound. |
| Q5.7 glueing | B=k̄ or 𝔽_p in 𝒪_C×_(k̄)B | Rings are respectively 𝒪_C and {a: residue(a)∈𝔽_p}; Frobenius on B is bijective. Reversing B→k̄ would not define the displayed pullback. | Correct direction. |
| Q6.1 relative equivalence | Characteristic p; B=C♭ over 𝒪_C♭ | W(B)/(p)=B in the first case. In the second ξ₀ is a unit, its completion is 0 and W(C♭)/(ξ)=0≠C♭. | Completeness excludes the wrong model. |
| Q6.2 headline | ϖ♭=0 in characteristic p; constant roots in ∏𝒪_C | Both zero-adic inverse limits equal their original rings; the product case gives ∏𝒪_C and ∏𝒪_C♭, both complete. | Both directions and nonnoetherian test. |
| Q6.3 nonperfectoid valuation rings | V=ℤ_p and 𝔽_p⟦t⟧ | Tilts both equal 𝔽_p; source value group is {0}, target group ℤ. Sharp is injective but the value-group inclusion is not surjective. | Distinguishes this target from Q6.4. |
| Q6.4 valuation headline | 𝒪_C; 𝒪_C×𝒪_C | Valuation-ring predicates are true/true in the first pair. In the second, (1,0)(0,1)=0 with both factors nonzero, both before and after tilt: false/false. | Sound. |
| Q6.4 value-group headline | p-root tower; x=t^(1/p), y=t; a=0,1+p | Values 1/p≤1 give x dividing y on both sides. Both groups are ℤ[1/p]. Forms are 0=1·0♯ and 1+p=(1+p)·1♯. | Zero and order direction included. |
| Q6.5 localization completeness | V=𝒪_C, q=𝔪; a=0; q=0 and a≠0 | V_q=V in the first case. Zero-adic completion always equals the ring. At q=0, nonzero a becomes a unit and completion is 0≠Frac(V). | Prime containment is essential; the zero case is immediate separately. |
| Q6.6 localizations | Mixed-characteristic 𝒪_C and characteristic-p 𝒪_C♭ | Localizing at 𝔪 returns the ring. At 0 the mixed-characteristic completion is 0, while the characteristic-p fraction field is perfect with π=0. | Exclusion of the mixed-characteristic zero prime is correct. |
| Q6.7 headline | 𝒪_(ℂ₃); completed 3-root tower | First fraction fields are algebraically closed on both sides. In the second residue field 𝔽₃, squares are 0,1, so X²−2 has no root on either side. | True/true and false/false. |
| Q6.8 first headline | A=𝔽₂, ϖ=0 | Completed ℤ₂[2^(1/2^∞)] maps onto 𝔽₂; ϖ̃=2^(1/2) is regular, squares to 2 and maps to 0. | Handles torsion target. |
| Q6.8 specified-root headline | Same target | r′_n=2^(1/2^(n+1)); (r′_(n+1))²=r′_n and all images are 0. | Lifts the actual prescribed sequence. |
| Q6.8 p-regular headline | A=𝔽₂; A=0 | Multiplication by 2 is injective on the source above; on the zero source it is the unique injective map, and the map to target 0 is surjective. | Both cases allowed. |
| Q7.1 ind-fppf definition/API | ℤ→ℤ[X_i]; ℤ→ℚ; empty product | Polynomial stages have basis monomials and nonzero fibres; ℚ⊗𝔽_p=0; empty product over ℤ also has zero fibre. | Faithfulness and nonempty-product condition discriminate. |
| Q7.2 syntomic/ind-syntomic definitions | k[x,y]/(x²,xy,y²); ℤ→ℤ[1/p]; 0 | First has dimension 0, embedding dimension 2 and three minimal relations, not a complete intersection. Localization is syntomic but has zero p-fibre. At 0, span ∅=⊥=⊤. | Three different wrong models excluded. |
| Q7.3 stability | Base change ℤ[X] to 𝔽₂; two factors versus none | Base change is 𝔽₂[X], each fibre nonzero. Two-factor fibre is k×k; empty-product fibre is 0. | Correct product distinction; filtered factorization preserves finite tests. |
| Q7.4 flatness | ℤ_p over ℤ; ℤ/p over ℤ; dual numbers | First gives localized ℚ_p and quotient 𝔽_p, both flat. Second has Tor₁^ℤ(ℤ/p,ℤ/p)=𝔽_p. Dual-number M has εM=0 and Tor₁^A(k,k)=k. | The theorem matches Stacks; R02 corrects what the third Check isolates. |
| Q7.5 blowup | (p,T) in ℤ_p[T]; a=g=2 in ℤ | Good presentation eliminates T and yields ℤ_p[X]. Bad presentation has nonzero X−1 killed by 2, whereas blowup ℤ[2/2]=ℤ has no 2-torsion. | Regular-pair hypothesis discriminates. |
| Q7.6 hypersurface | g=pX; g=1+px; n=0,g=1 | First has nonzero X killed by p. Second is ℚ_p, with zero closed fibre. Last quotient is 0, with no nontrivial fibres, compatible with natural n−1=0. | Correct flatness and boundary interpretation. |
| Q8.1 continuity | Trivial valuation; rank-two T/p composition | v(pⁿ)=1 in the trivial case. In additive lexicographic notation, v(T)=(-1,0)<(0,-n)=v(pⁿ) for all n. | Neither valuation is continuous; cofinality cannot be omitted. |
| Q8.2 tilted valuation | x=p♭ in 𝒪_C | v♭(p♭)=v(p); zeroth-coordinate lifts 0 and p have values 0 and v(p), so arbitrary-lift valuation is not well defined. If v(p)=0 both sides kill p♭. | Definition, failure case and normalization verified. |
| Q8.3 headline | a=b♯; a=1+p,a′=1; m=0 | Error 0 in the first case; v(p) in the second, equal to v(p)max(1,v(ϖ)^(pm)); m=0 gives the bound v(p). In characteristic p the required error is 0. | Uniform approximation and factor correct. |
| Q8.4 headline | p,1 in ℚ_p; T in ℚ_p⟨T⟩; 0 | pⁿ→0 with v(p)<1; 1ⁿ=1 and v(1)=1; Gauss v(T)=1. Zero ring has powers 0 and no valuations, so both sides are true. | Both directions, empty valuation family and nonnilpotent examples. |
| Q9.1 root-extension definition/API | Empty polynomial family; P=T; P=1 | Empty family gives I′=0. For P=T, T=0 in quotient but T^(1/p)≠0 and its p-th power is 0; it becomes zero on completion. P=1 gives I′=A′ and quotient 0. | Positive degree and quotient/completion distinction necessary. |
| Q9.2 blowup stages | P=T,m=1,j=0 over 𝒪_C | After inversion, finite stage is C[T^(1/pⁿ)]; union contains T^(1/p^(n+1)), absent from that stage. T^(1/p)/ϖ^(1/p) has p-th power T/ϖ but is absent before root closure. | Repaired ind-syntomic wording remains correct. |
| Q9.3 headline | 𝒪_C; completed 3-root tower; 0 | A′=A,I′=0 works for 𝒪_C. X²−2 has no root in the second ring, since residues square only to 0,1. In 0, all rings and ideals are 0 and no polynomial has positive natural degree. | Nontrivial extension is genuinely asserted. |
| Q9.4 consequences | Cyclotomic completion at p=3; p=2 control | X³−3 and (Y+1)³−4 are Eisenstein; a normal cubic root field would contain ζ₃ of degree 2, impossible. At p=2, √2=ζ₈+ζ₈⁻¹ lies in the cyclotomic tower. | Odd-prime condition is only on the negative control. |
| Q9.5 definition and repaired API | ℤ₂[T], ℚ₂, ℤ₂×ℚ₂ over ℤ₂; ℤ over itself | Localized closed fibres are respectively 𝔽₂[T], 0, 𝔽₂. For ℤ, localization is ℤ_(2) and its fibre at 3 is 0. For characteristic p, all denominators are 1. | Faithful flatness and p-Zariski hypotheses both discriminate; F01 repaired. |
| Q9.6 headline | ℤ_(p); 𝔽_p; 0 | ℤ̄_p completes to 𝒪_(ℂ_p). For 𝔽_p, use ℤ̄_p/p; its reduction and p-completion are 𝔽̄_p. At 0 the target can be 0. | Source-ring and reduction order correct. |
| Q10.1 unramified towers | ℤ_p; ℤ_p[√p] | W(𝔽_(pⁿ)) has ramification index 1 and p∉𝔪². After adjoining √p, p=(√p)² and index is 2. | Unramified refinement has a separating control. |
| Q10.2 headline | ℤ₂; 𝔽₃⟦t⟧; characteristic-p field | Covers are completed 2-root tower, faithfully flat perfection, and perfect closure. Wrong map ℤ₂→𝔽₂ has Tor₁=𝔽₂≠0. | No fixed-field or characteristic-zero restriction was added. |
| Q10.3 absolute integral closure | ℤ_p; 𝔽_p⟦t⟧; ℚ | Completions are 𝒪_(ℂ_p), R⁺, and 0 respectively. In characteristic p, p·1=0 although 1≠0, so the claimed p-regularity requires characteristic zero. | Hypotheses and unit case correct. |
| Q10.4 repaired regularity | p=3,f=x−3,n=0,1; p=2; f=p²−x | Classes (2,1),(2,0); at p=2, (1,1),(1,0). Bad presentation has [φ(f)]=0 and at p=2 yields (x−2)(x+2)=0. | F02 and added normalization repaired. |
| Q10.4 rank/intersection | k=𝔽₃(t),d=2,n=1; p-root tower | Rank is 3·3²=27, not 9. Valuations of p^(1/p) and p^(1+1/p) are 1/p and 1+1/p; only the latter lies in pR⁺ and equals p times an element of the tower. | F-finite factor and completed injection checks pass. |
| Q10.5 headline and root transport | c=0; c=pu; c=p(x+p) | Zero c forces every c_k=0. For b_k^(p^k)=vp, (c_k/b̄_k)^(p^k)=u/v̄ is a unit. In the enlarged cover, T^(1/p^k) maps to c_k and to 0 in the reduced quotient perfectoidization. | Actual annihilator element transported; no unjustified actual roots of p. |
| Q10.5–Q10.6 nonzero-source Tor test | p=3, R=ℤ₃⟦x⟧, B=R[√2], S=R+(3,x)√2, N=𝔽₃, n=i=1, c=3 | As R-modules S=R⊕(3,x). Over D=𝔽₃⟦x⟧, S/3S≅D²⊕𝔽₃, so Tor₁^D(S/3S,𝔽₃)=𝔽₃≠0. R⁺ is a union of finite normal extensions, free over this two-dimensional regular R; target Tor is 0, hence the map and each root multiple are 0. | The theorem does not assume source Tor vanishes. S[1/3]=B[1/3] is finite étale. |
| Q10.6 residue-field binder | Perfect k; 𝔽₃(t); infinite p-basis | Frobenius-range dimensions are 1, 3, and infinite respectively; the first two satisfy the hypothesis, the last does not. For S=R, positive Tor is 0. | Exact F-finite generality retained. |
| Worked tower, R01 | p=2,g=x or x²,n=1 | Original ideals are (x²) or (x⁴), giving nonzero nilpotents. Correct ideals are (2−x²) or (2−x⁴), Eisenstein and regular. | Correct the defining relation in the example. |

### Pinned-library declarations and duplication audit

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the following native declarations and their surrounding hypotheses. Paths in this table are library-relative.

| Native interface | File and line at the pin | What was checked |
|---|---|---|
| Integral perfectoidness | `TauCeti/RingTheory/Perfectoid/Integral.lean:76`, 95, 102, 106, 111, 121, 131, 144 | Real adic witness, Frobenius and principal-kernel fields; completeness instance; perfect and zero examples. Domain and reducedness are not fields of the definition. |
| PreTilt and specialized domain result | `Mathlib/RingTheory/Perfection.lean:623`, 630, 779, 801 | Inverse perfection of mod-p ring; valued-field domain specialization does not prove Q6.4. |
| Sharp | `Mathlib/RingTheory/Perfectoid/Untilt.lean:40`, 49, 57, 72 | Prime, nonunit and completeness binders; multiplicative map, reduction and root identity, not an additive map on the original rings. |
| Compatible sequences | `Mathlib/RingTheory/Teichmuller.lean:195`, 206 | Monoid equivalence at a complete ideal with characteristic-p quotient and its zeroth coordinate. |
| Fontaine map | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`, 173, 183, 196 | Reduction, Teichmüller evaluation and Frobenius-surjective input for surjectivity. |
| Witt uniqueness | `Mathlib/RingTheory/WittVector/TeichmullerSeries.lean:117` | Nilpotence of p in the target is explicit; Q5.1 uses finite quotients first. |
| Completeness/Jacobson | `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`, 915 | Completeness includes Hausdorffness; complete ideal lies in the Jacobson radical. |
| Valuation rings/value groups | `Mathlib/RingTheory/Valuation/ValuationRing.lean:64`, 77 | Domain hypothesis and unit-orbit quotient; not a valuation predicate on arbitrary non-domain rings. |
| Standard syntomic | `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:90`, 105 | Flatness, generator/relation count and nontrivial-fibre dimension. Local covers and filtered factorization are the package's simple predicates. |
| Huber/Tate carriers | `TauCeti/RingTheory/Huber/Basic.lean:163`, 177, 213 | Open ring of definition, finitely generated adic ideal and topologically nilpotent unit. No hidden Hausdorffness requirement. |
| Continuous valuations | `TauCeti/RingTheory/Valuation/Continuous/Basic.lean:129`; `TopologicallyNilpotent.lean:123`, 140 | Attained-value balls; continuous multiplication supplies the ratio-value comparison in the rings used here. |
| Valuative criterion | `TauCeti/RingTheory/Huber/Continuous/ValuativeCriterion.lean:429`; `TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.lean:155` | Open subring and cofinality conjunct; mere v(I)<1 is not substituted for continuity. |
| Henselization | `TauCeti/RingTheory/Henselization/Algebra.lean:43`, 47; `Henselian.lean:154`; `IndEtale.lean:47`, 60; `Quotient.lean:81` | Actual algebra, extended ideal, ind-étaleness, all-power quotient comparison and Jacobson hypothesis for faithful flatness. |
| Henselian permanence | `TauCeti/RingTheory/Henselian/Quotient.lean:34`; `Ideal.lean:110`; `TauCeti/RingTheory/Etale/IndEtale.lean:94` | Surjective transfer, radical equivalence and ind-étale flatness match Q9.3/Q9.6. |
| Affine blowup | `TauCeti/RingTheory/Ideal/AffineBlowup.lean:64`, 138, 161, 226 | Localization subalgebra, numerator description, regularity and universal lift; Q7.5 adds the regular-pair presentation. |
| Tor | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, 56 | Derives in the second argument, remains functorial in the first; projective N vanishing is narrower than either headline. |

Object searches covered the pinned perfectoid, syntomic, flatness, Huber, valuation and homological interfaces. The native localization-flatness criterion covers principal opens; it does not replace the closed/open glueing target Q7.4. Existing perfectoid Tate and field statements do not replace the arbitrary integral-ring versions. No retained headline duplicates a native theorem or uses another roadmap's fully qualified local declaration name.

### Supplier resolution, open work and order

Read the board-package index before ownership checks. Used `roadmaps grep` on mathematical objects and `roadmaps show` for the relevant indexed heads, and read main suppliers directly. The three unresolved-name leads are roadmap target names, not claims of pinned native declarations: the two ordinary-flatness names are in DerivedDeRhamCohomology §1.10; `RegularTower.exists_perfectoidTower` is in PerfectoidSpaces P7.17.

| Supplier / comparison | Current resolution |
|---|---|
| PerfectoidQuotients, open #1042 | `TauCetiRoadmap/PerfectoidQuotients/README.md:616`, 711, 782, 831, 920, 1088, 1193 resolve §§0.2–0.6, 1.2, 1.4. Naturality, generators, bounded torsion, torsion removal, root closure and completed operations match. Lines 53–56 and 1111 assign ordinary André and additional structure results to this Part II. |
| PerfectoidSpaces, main | `TauCetiRoadmap/PerfectoidSpaces/README.md:5049`, 5101, 8424, 11053, 11144, 17397, 17487 resolve P1.24, P1.25, P3.7, P4.15.2, P4.15.4, P7.16a, P7.17; 17507 names the tower. P1.4–P1.6 and P1.15 are the Tate comparison/tilt specialization; P0.1–P0.2 and P0.11 supply the almost setup. |
| PrismaticCohomology, open #1057 | `TauCetiRoadmap/PrismaticCohomology/README.md:1168`, 1192–1214, 1453, 2788, 2800 resolve §§0.61–0.63, 0.79, 2.30–2.31. Perfection in §§0.83–0.84 redirects to PerfectoidSpaces P4.15.2, as the package records. |
| DerivedDeRhamCohomology, open #868 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:536–549`, §1.10, names both ordinary-flatness criteria with noetherian base, regular π and classical completeness. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:706`, §E1.6, has the regular characteristic-p Frobenius-flatness theorem with its stated hypotheses. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md:375`, Layer 1, owns syntomic morphisms. The package consumes their affine-local description and develops ind-syntomic factorization. |
| DirectSummandsAndBigCohenMacaulay, open #1735 | `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:580–610`, §§3.2–3.3, constructs a fixed-perfectoid-field cover and almost flatness. Those extra root-field and almost-element constructions differ from the general integral-perfectoid prism cover here. No mutual ownership found. |
| PurityForFlatCohomology, open #1840 | `TauCetiRoadmap/PurityForFlatCohomology/README.md:185`, 708–723 imports Q5/Q6/Q7/Q10.1. Its additional regular-tower-tilt request is explicitly a consumer-side gap at 717, not an undeclared prerequisite of this package. |
| PrismaticCohomologyPartIII, open #1070 | `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:68` imports the earlier perfectoid interfaces; its scope is not the integral structure/ordinary André library owned here. |

The supplied overlap report lists no conflicting head, dropped cited id, open-revision-only citation or local dropped-id breakage. Section numbers were preserved by the repairs. The broader object search returned analytic fibre products, geometric perfectoid covers and consumers of integral valuation rings, rather than another owner for these headline objects. Supplier clauses and every `*Needs:*` line were read for direction and content. No forbidden supplier, upward citation, cycle or missing named contract was found. No supplier gap is declared by this package.

Required dependency-check output:

```text
depcheck: 236 roadmaps, 2137 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

## Not verifiable

- No sampled locator, repair-critical source, required supplier interface or Lean command was inaccessible. No missing-reference request is needed.
- Ownership conclusions concern main, the provided board index and the indexed open heads inspected through the prescribed tools; they do not cover unindexed work.

## Source issues

- **Misprint** in CS24 at Corollary 2.3.7, proof, printed page 29 (CS24 line 1174): the source says part 2.1.11(d) supplies the root-stable quotient argument; it should be part 2.1.11(c), since (d) concerns products; affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, printed page 25, and Corollary 2.3.7, printed page 28 (CS24 line 1009–1010, 1159–1160): the source says every monic polynomial acquires a root; it should be every positive-degree monic polynomial, because 1 has no root in a nonzero ring; affects a stated result.
- **Misprint** in CS24 at §2.3.3, printed page 24 (CS24 line 987–988): the source says finite products preserve ind-fppf algebras without an index qualification; it should be nonempty finite products, because the empty product over ℤ is not faithfully flat; affects a stated result.
- **Gap** in BS22 at Remark 10.13, printed page 83 (BS22 line 3214–3216): the source says Remark 3.11 supplies the compatible perfectoid cover inside the completed absolute integral closure; it should include a construction of the compatible map; affects the proof.
- **Gap** in BS22 at Remark 10.13, printed pages 83–84 (BS22 line 3217–3226): the source says annihilation of the middle Tor gives annihilation by the specified roots in the target; it should justify transport of annihilator elements to those specified roots; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7bdf2de7947a89d9f3dd7b0068a5dd74cbb03fd4", "job": "REV-PKG-PerfectoidQuotientsPartII~4", "model": "gpt-6-astra", "worker": "chris-10"} -->
