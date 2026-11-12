<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12942#issuecomment-6781607385 -->
Review (codex) of 13eeee0

Verdict: needs_changes

1. **F01** (P1) The first Zariskization API clause assumes its conclusion

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1373`: “a flat `A`-algebra `B` with `B_{1+pB}` faithfully flat over `A` is faithfully flat after `p`-Zariskization”.

   **Claim:** This supplies a faithful-flatness result for Zariskization.

   **Witness:** Writing `B_z = B_{1+pB}`, both the hypothesis and conclusion are `Module.FaithfullyFlat A B_z`. The clause is `H → H`; neither flatness of B nor the p-Zariski hypothesis supplies additional content.

   **Exact repair:** Delete that first clause. Retain the substantive second clause, stated directly: for p-Zariski A and a faithfully flat A-algebra B, its p-Zariskization is faithfully flat over A. This is a README repair; add no acceptance-test declaration.

   **Repair test:** With A = ℤ₂ and B = ℤ₂[T], every denominator `1 + 2b` reduces to 1 on the closed fibre, so the localized closed fibre is still 𝔽₂[T], not zero; localization is flat, and faithful flatness follows. For the flat but non-faithfully-flat B = ℚ₂, `1 + 2(−1/2) = 0`, so `B_z = 0`: the original first clause has both H and its conclusion false and its implication true. The retained clause excludes this example by its actual faithful-flatness hypothesis. Stacks line 4367 supplies the nonzero-fibre criterion.

2. **F02** (P3) Separate the initial stage in the cotangent-space computation

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1558`: “in both cases the class of `φ_A^n(f)` in `𝔪_A/𝔪_A²` is a unit multiple of the class of `p`”. The tower starts at n = 0 in Q10.4.

   **Claim:** The displayed cotangent-space computation proves regularity at every stage, including the initial one.

   **Witness:** Take p = 3, A = ℤ₃⟦x⟧, f = x − 3, and n = 0. In the basis ([3], [x]), [f] = (2,1), whereas a unit multiple of [3] has coordinates (u,0).

   **Exact repair:** Begin the argument for (2) with: at n = 0, `φ_A^0(f) = f ∉ 𝔪_A²` by the chosen presentation. Restrict the unit-multiple-of-[p] calculation to n ≥ 1. Keep the theorem and the tower indexed from zero.

   **Repair test:** At n = 1 in the same example, `φ_A(f) = x³ − 3` has class (2,0), as claimed; at n = 0, (2,1) is nonzero and already proves regularity. For p = 2 the corresponding values are (1,1) and (1,0), so the corrected argument also includes the smallest prime. For a ramified presentation f = p − x², the class is [p] even at n = 0. The defect is the proof's uniform description of the class, not the regularity conclusion.

Two findings: one P1 (a vacuous README API clause, using the brief's severity classification) and one P3 (a boundary qualification in a proof sketch). Neither is a counterexample to a headline theorem. All five previous findings are repaired. The authored package files were left unchanged.

## Verified sound

### Previous findings, checked first

The repair report marked no finding “not actionable in this package”. None of the findings above re-raises a settled exception.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| Round 2 R01: duplicated integral-perfectoid class | Repaired | README 116: “uses it directly”; 196: “`TauCeti.Perfectoid.IsIntegralPerfectoid p A`”. Suggested.lean 5 imports its native module and 44 opens the native name. The local class is gone. Native `Integral.lean:76` and its completeness instance at 95 have the required fields and consequences. |
| Round 2 R02: infinite polynomial-root stages called syntomic | Repaired | README 1266: “ind-syntomic over `A`”; the finite stages and their filtered colimit are distinguished at 1265–1272. The same correction appears in the Q7 Examples and Q9 introduction. After inverting ϖ, a finite stage is C[T^(1/pⁿ)], while the union contains the missing exponent 1/p^(n+1). |
| Round 2 R03: actual p-roots asserted in arbitrary covers | Repaired | README 1344: “a unit multiple of `p` has compatible `p`-power roots”; 1649–1655 uses `b_0 = vp` and the unit ratio `c_k/b̄_k`. The separate quadratic negative control is now restricted to R = ℤ_p, p odd, and records the ramified counterexample. |
| Round 2 R04: phantom supplier declarations | Repaired | README 298: “§0.61 (δ-functoriality”; 207–218 names the native henselization API. Q9.3 uses ind-étaleness, quotient preservation and the nonzero-fibre criterion over A; Q9.6 uses `faithfullyFlat_of_le_jacobson` where its hypothesis holds. The change from the previous proposed repair is mathematically justified. |
| Round 2 R05: obsolete pins | Repaired | README 159 and 194: “revision pinned by the repository's `lake-manifest.json`”. The actual manifest pins Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`. |

The changed passages were checked independently: native predicate and automatic completeness, the finite versus infinite syntomic stages, both cyclotomic root exclusions, the unit-ratio annihilation argument, henselization and its two different faithful-flatness applications, and the pin references. Searches for the repaired patterns found no remaining local integral-perfectoid class, obsolete hashes, phantom names, or assertion that every perfectoid cover contains actual roots of p.

The repair report's auxiliary cyclotomic computation used a square root where its notation indexed a cube root. That calculation is not in the package. The package's formula is correctly `b_k^(p^k) = vp`; the table below tests that formula without substituting a square root for b₁ at p = 3.

### Principles, shape and acceptance-test coverage

Read all 37 numbered subsections, all API lists, Checks, proof routes, conventions, supplier contracts, references and downstream descriptions. Read main-branch PerfectoidSpaces, EnhancedDerivedSheaves and StableReduction for shape and supplier context. There are six layers, six terminal Examples subsections and six Dependencies subsections. The definition sections Q7.1, Q7.2, Q8.2, Q9.1 and Q9.5 have API lists and respectively 5, 5, 3, 4 and 4 Checks. R01 is the vacuous clause within one of those API lists.

This extends PerfectoidQuotients instead of replanning it. Its base owns Fontaine generators, torsion removal, p-integral closure, completed operations and the weaker root covers. This package owns the additional integral tilting comparisons, arbitrary-rank valuation-ring results, torsion-free presentations, ordinary ind-syntomic André theorem, semiperfectoid covers and the specified regular-local applications. It retains all primes, torsion, zero divisors, ramified rings, arbitrary-rank valuations and the stated imperfect-residue-field generality. The F-finite hypothesis in Q10.4/Q10.6 matches HM17; Q10.5 explicitly takes a cover with a compatible map as data for other residue fields.

The organization is mathematical. Q7 and Q8 are independent branches feeding Q9, and Q10 uses the prismatic and regular-local suppliers. It does not reproduce the source's section sequence: the commutative-algebra preparation precedes the valuation branch here, while CS24 puts approximation and nilpotence before its ind-syntomic discussion. Mathematical headings and dependency lines explain the construction. The introductory source locators are attribution, not instructions to follow a book's organization.

No copied source passage, computational algorithm, route-specific prime exclusion, sorry'd data, `set_option`, `lemma` declaration, forbidden diagnostic command, machine path, HTML anchor or review/pull-request narrative was found in the authored files. The recursive Witt construction is a mathematical proof of approximation. There are no declared supplier gaps. Metadata retains `topic = "math.AG"`; all nine cited works have one manifest entry each, with legal cached copies.

The README's named headline targets and their acceptance-test coverage are:

| README headline | Suggested.lean declaration(s) |
|---|---|
| Q5.6 fibre products | `isIntegralPerfectoid_fibreProduct` |
| Q6.2 completeness transfer | `isAdicComplete_preTilt_iff` |
| Q6.4 valuation rings and value groups | `valuationRing_iff_preTilt`; `untilt_dvd_iff_and_exists_isUnit_mul_untilt` |
| Q6.7 algebraically closed fraction fields | `isAlgClosed_fractionRing_iff` |
| Q6.8 torsion-free presentations, including specified roots | `exists_surjective_of_isSMulRegular`; `exists_surjective_of_isSMulRegular_of_roots`; `exists_surjective_of_isSMulRegular_p` |
| Q8.3 approximation | `exists_approximation` |
| Q8.4 valuative nilpotence | `isTopologicallyNilpotent_iff_forall_lt_one` |
| Q9.3 ordinary ind-syntomic André theorem | `exists_indSyntomic_andre` |
| Q9.6 semiperfectoid covers | `exists_semiperfectoid_cover` |
| Q10.2 regular-local perfectoid covers | `exists_faithfullyFlat_isIntegralPerfectoid` |
| Q10.5–Q10.6 almost vanishing of Tor | `tor_map_mul_root_eq_zero_of_cover`; `tor_map_mul_root_eq_zero` |
| Q6.1 relative tilting equivalence | Named in the module docstring as not statable: the integral-perfectoid-algebra categories and relative tilt functor are not available at the pins. No substitute is stated. |

All 18 local declarations (15 theorems and three small predicates) are named in the README. Every backticked identifier attributed to this package resolves to one of them. The three predicates have real bodies on native carriers and are used by the headline statements. The native integral-perfectoid predicate is imported, not copied. No statable headline from the named end-theorem list is missing.

### Elaboration, signatures and padding

Ran the prescribed `lake env lean` invocation on `packages/PerfectoidQuotientsPartII/Suggested.lean` from the content checkout: exit 0, exactly 15 warnings, all “declaration uses `sorry`”. All four individual Tau Ceti imports had existing object files; no build was necessary. `import Mathlib` is the only Mathlib import.

On a scratch copy, tried `simp` with goal closure required, `rfl`, `infer_instance` and `assumption` against every one of the 15 sorried theorems. Every theorem reached the fallback admission; the copy elaborated with 15 sorry warnings, zero errors, and unused-tactic diagnostics from the deliberately unsuccessful probes. Opened the supplied near-match candidates by object. No candidate provides a one-lemma `exact` proof: the Tor vanishing result assumes projectivity of N, the tilt-domain instance is a valued-field specialization, the Fontaine lemmas concern reduction or Teichmüller evaluation, and the ordinary flatness declarations do not construct a perfectoid cover. No headline is a definition restatement, numerical Check, boundary case or free-variable stand-in. No Lean padding finding results.

Appended `#check @name` for every one of the 18 declarations to that copy and read all elaborated types. No required binder was lost. In particular:

- native integral perfectoidness supplies p-adic completeness in the three signatures that dropped the redundant instance;
- prime, nonunit, domain, adic topology and completeness hypotheses remain where required;
- the value-group universe is independent of the ring universe in both valuation headlines;
- the two Tor signatures retain maximal-adic completeness, mixed characteristic, finite S, the localized étale hypothesis, compatible roots, positive i and n, and in Q10.6 the exact finite-module hypothesis over the Frobenius field range;
- the cover map in Q10.5 is an R-algebra map into the completion of the actual integral closure, and the Tor map is the base-changed inclusion followed by multiplication in its target;
- `IsPZariski` drops the unused prime instance, harmlessly: its body makes sense for any natural number, and every headline using it still explicitly assumes p prime.

### Sources: all fifteen sampled Theorem targets

The seeded labels select all fifteen bold Theorem targets. There is no author-flagged unverified locator. Read the cached text at the following locators, including hypotheses and the relevant proof steps; the numbered preprint versions agree with References. Source line numbers below are the cache's supplied line numbers.

| Target | Source text read | Comparison |
|---|---|---|
| Q5.6 | CS24 Proposition 2.1.4, pp.12–13, lines 468–486 | Surjection A → A′, arbitrary B → A′, perfectoid fibre product and its tilt. |
| Q6.2 | CS24 Proposition 2.1.9, pp.14–15, lines 539–565 | Divisibility by ξ₀ and both completeness directions; no torsion-free hypothesis. |
| Q6.4 valuation rings | CS24 Proposition 2.1.9, lines 544–546, 568–576 | Both directions, including characteristic p. |
| Q6.4 value groups | CS24 lines 547, 572–576 | Sharp induces the comparison; every element is a unit times a sharp. |
| Q6.7 | CS24 lines 576–585; Sch12 Theorem 3.7(ii), Proposition 3.8, p.17, lines 751–761 | Rank-one equivalence plus localization to the height-one prime handles arbitrary rank. |
| Q6.8 torsion-free presentation | CS24 Proposition 2.1.12, pp.17–18, lines 682–700 | Lift of the specified ϖ, regularity, divisibility and completeness. |
| Q6.8 prescribed roots | CS24 lines 687–699; Theorem 2.3.4 proof, p.25, lines 1015–1018 | Choosing the tilt element from the given tower makes the auxiliary unit 1 and preserves all specified roots. |
| Q6.8 p-torsion-free presentation | CS24 lines 684, 700–702 | Separate zeroth-coordinate choice supplies this assertion. |
| Q8.3 | CS24 Lemma 2.3.1, pp.22–23, lines 895–950 | One approximation for every continuous bounded valuation; the factor v(p) and exponent pm match. |
| Q8.4 | CS24 Lemma 2.3.2, p.24, lines 959–978; Wedhorn Proposition 7.18, pp.60–61, lines 2494–2503 | CS24 states the principal-adic case. The stated Tate-ring form uses a pair of definition and the native continuous-valuative integrality criterion, with its openness hypothesis. |
| Q9.3 | CS24 Theorem 2.3.4 and proof, p.25, lines 1004–1030 | Both alternatives, compatible roots, divisible ideal and both faithful-flatness conclusions match. Positive degree corrects the source's constant-polynomial omission. |
| Q9.6 | CS24 Corollary 2.3.7, pp.28–29, lines 1157–1174 | Reduction precedes completion; the root-bearing source ring is not asserted to be an A-algebra. |
| Q10.2 | BS22 Remark 3.11, pp.32–33, lines 1299–1327; Bha18 Proposition 5.2, p.8, lines 469–479 | The generalized integral-perfectoid form is faithfully flat; this is modification (a), not the fixed-field almost-flat form alone. |
| Q10.5 | BS22 Remark 10.13, pp.83–84, lines 3208–3226 | The supplied-cover hypothesis, finite subextension, étaleness off c and Tor map match. The package adds the necessary compatible-root transport argument. |
| Q10.6 | HM17 Theorem 1.3, p.2, lines 65–70; BS22 lines 3210–3226 | F-finite residue fields are retained. The mod-pⁿ Tor statement is BS22's sufficient stronger statement, not a verbatim restatement of HM17. |

Additional repair-critical readings: BMS1 Definition 3.5, Example 3.6 and Lemmas 3.9–3.10, lines 1008–1067; CS24 finite versus infinite stages, lines 1140–1155; Stacks Lemma 10.39.15/tag 00HP, lines 4367–4372; Stacks Lemma 10.127.4/tag 07C3, lines 14640–14651; Stacks Lemma 10.99.16/tag 0H7N, lines 11208–11238; Ces19 Lemmas 4.7 and 5.2, lines 303–310 and 447–462; Bha18 ordinary flatness, lines 451–467. No source fetch or manifest alteration was necessary.

### Computed adversarial table

The earlier review has computed rows for all 37 subsections, rather than only “checked” labels. For untouched supporting statements I used those rows, rereading the corresponding README assertions. I independently recomputed the sampled headlines, changed passages, maps and conventions below. R01's individual API clause and R02's n = 0 class computation were not justified by the earlier aggregate rows. They are now explicit findings. This table covers every sampled theorem, every named headline, the repairs and both findings; it is not an elaboration-as-truth claim.

| Statement | Instances | Values computed on both sides | Result / change |
|---|---|---|---|
| Native perfectoid predicate and completeness | 0; 𝔽₂; ℤ₂ | At 0 and 𝔽₂, π = 0 and zero-adic completion is the original ring; ker θ over 𝔽₂ is (2). In ℤ₂, `2v₂(π) ≤ 1` forces π a unit, whose completion is 0 rather than ℤ₂. | Prior R01 repaired. |
| Q5.3 quotient/sharp normalization | Completed ℤ₃[3^(1/3^∞)], ϖ = 3^(1/3) | Both mod-3 quotients are 𝔽₃[t^(1/3^∞)]/(t); `(ϖ♭)³ = t = p♭`. Unit multiples generate the same ideal. | Sound. |
| Q5.4 torsion and root annihilators | 𝒪_C × 𝔽̄_p, ϖ = (p^(1/p),0) | Both torsion modules are `0 × 𝔽̄_p`; multiplication by every root still kills that factor. | Sound; supports Q10.5. |
| Q5.6 fibre product | Two perfect root-polynomial rings over 𝔽₂ mapping to 𝔽₂; A′ = 0 | The first pullback consists of pairs with equal constants and admits coordinatewise unique square roots; its tilt is itself. The second pullback is A × B on both sides. | Headline passes. |
| Q5.7 changed native supplier | B = 𝔽_p → k̄; B = k̄ | Pullbacks are respectively `{a ∈ 𝒪_C : residue(a) ∈ 𝔽_p}` and 𝒪_C. Frobenius on B is bijective in both cases. | `of_perfectRing` applies. |
| Q6.1 relative equivalence | Perfect characteristic-p base; B = C♭ over 𝒪_C♭ | ξ = p gives W(B)/(p) = B. In the second case ξ₀ is a unit and W(C♭)/(ξ) = 0, so the nonzero B fails the required completeness. | Correct docstring-only headline. |
| Q6.2 completeness transfer | ϖ♭ = 0 in characteristic p; constant root in ∏𝒪_C | The first inverse limits are the original rings. The second limits are the complete product and its product tilt. | Both directions and nonnoetherian case pass. |
| Q6.4 valuation-ring equivalence | 𝒪_C; 𝒪_C × 𝒪_C | The first ring and tilt are domains with comparable divisibility. In the second, `(1,0)(0,1)=0` with both factors nonzero, on both sides. | True/true and false/false. |
| Q6.4 value-group comparison | Completed p-root tower; x = t^(1/p), y = t | Additive groups on both sides are ℤ[1/p]; valuations are 1/p and 1, so x divides y on both sides. `1+p=(1+p)·1♯` has a unit multiplier. | Direction and normalization pass. |
| Q6.7 algebraic closedness | 𝒪_(ℂ₃); completed 3-root tower | First pair of fraction fields is algebraically closed. Second pair has residue field 𝔽₃, whose squares are 0 and 1; X²−2 has no root on either side. | Both directions tested. |
| Q6.8 arbitrary torsion-free presentation | A = 𝔽₂, ϖ = 0 | Completed ℤ₂[2^(1/2^∞)] surjects onto A; lift 2^(1/2) is regular, squares to 2 and maps to 0. | First presentation headline passes. |
| Q6.8 specified roots | Same A and source | `r′_n = 2^(1/2^(n+1))`; `(r′_(n+1))² = r′_n`; every image is 0. | Preserves the prescribed sequence. |
| Q6.8 p-torsion-free presentation | A = 𝔽₂; A = 0 | Multiplication by 2 is injective on the nonzero source above. For target 0, source 0 also has injective multiplication and a surjective unique map. | Third presentation headline passes. |
| Q7.2 predicates | k[x,y]/(x²,xy,y²); empty cover of 0 | First algebra has embedding dimension 2, dimension 0 and three minimal relations, exceeding codimension 2: flat over k but not syntomic. In 0, span ∅ = ⊥ = ⊤, so the empty cover is allowed. | Definitions discriminate the intended objects. |
| Q7 Examples and Q9.2 repaired stages | A = 𝒪_C, P = T, m = 1, j = 0 | Finite stage after inverting ϖ is C[T^(1/pⁿ)]; the union also contains T^(1/p^(n+1)), absent from that stage. At n = j the relation eliminates T^(1/pʲ), giving A[X_j]. | Ind-syntomic versus syntomic repair passes. A = 0 admits no positive-degree monic P, so it is not a counterexample. |
| Q8.1 continuous valuations | Rank-two T-adic/p-adic composition; trivial valuation | `v(T)=(-1,0) < (0,-n)=v(pⁿ)` for every n; trivial valuation gives v(pⁿ)=1. Neither has the required cofinality. | Repaired continuity pattern remains sound. |
| Q8.2 tilted valuation | x = p♭ over 𝒪_C | Sharp gives v♭(p♭)=v(p). Lifts 0 and p of the same zeroth coordinate give 0 and v(p), so the coordinate-lift wrong model fails. | Definition determined. |
| Q8.3 approximation | a = b♯; a = 1+p, a′ = 1; m = 0 | Errors are respectively 0 and v(p). The latter equals `v(p)·max(1,v(ϖ)^(pm))`; at m = 0 the bound is v(p). | Uniform quantifier and factors pass. |
| Q8.4 nilpotence | p and 1 in ℚ_p; T in ℚ_p⟨T⟩; zero ring | pⁿ tends to 0 and v(p)<1; 1ⁿ=1 and v(1)=1; Gauss v(T)=1. Zero ring has only 0, whose powers are 0, and no valuations. | Both directions, Gauss control and empty family pass. |
| Q9.3 André theorem | 𝒪_C; completed 3-root tower | For 𝒪_C choose A′=A and I′=0. In the root tower X²−2 has no root since its residue never vanishes, so the asserted extension adds genuine content. | Positive degree retained. |
| Q9.3 changed henselization argument | A = ℤ_p, B = ℤ_p[T] | `1+pT` is not a unit in B, so p is not in Jac(B); nevertheless Bʰ/p = 𝔽_p[T] is nonzero. The flat composite A → Bʰ has nonzero closed fibre. | Correctly avoids faithful-flatness-of-B-henselization without its Jacobson hypothesis. |
| Q9.4 cyclotomic repair | p = 3; p = 2 negative control | X³−3 is Eisenstein. `(Y+1)³−4 = Y³+3Y²+3Y−3` is Eisenstein too. Each degree-3 root field is nonnormal because [ℚ₃(ζ₃):ℚ₃]=2 does not divide 3. At p=2, √2 = ζ₈+ζ₈⁻¹ lies in the tower. | The odd-prime restriction on this Check is correct; it is not a restriction on the theorem. |
| Q9.5 definition and universal localization | A = ℚ; A = ℤ; p = 2 | In ℚ, `1+2(−1/2)=0`; in ℤ, 3 is not a unit. Inverting `1+2ℤ` gives ℤ_(2), where every odd integer is a unit. | Definition and negative controls pass. |
| Q9.5 first flatness API clause | A = ℤ₂, B = ℚ₂ | B is flat; B_(1+2B)=0; its faithful-flatness hypothesis and conclusion are both false, so the implication is true without supplying a result. | R01: delete the tautological clause. |
| Q9.5 retained preservation theorem | A = ℤ₂, B = ℤ₂[T] | Before and after localization the closed fibre is 𝔽₂[T] ≠ 0, since all denominators reduce to 1. | Repair retains a substantive theorem. |
| Q9.6 semiperfectoid covers | A = ℤ_(p); A = 𝔽_p | ℤ̄_p is faithfully flat over ℤ_(p) and completes to 𝒪_(ℂ_p). For A = 𝔽_p take ℤ̄_p/p; its reduced quotient is 𝔽̄_p, equal to its p-completion. | Reduction/completion order and source map pass. |
| Native henselization quotients and radicals | n = 0; (ℤ₃,(3)), n = 1; ϖ²=2 | At n=0 both quotients are 0; at n=1 both are 𝔽₃. If ϖ²=2, √(ϖ)=√(2), giving the same henselian-pair condition. | Changed native contracts pass. |
| Q10.2 perfectoid covers | R = ℤ₂; R = 𝔽₃⟦t⟧; wrong crystalline quotient | The first cover is the completed 2-root tower; δ(2−x) is a unit. The second is the faithfully flat perfection. The map ℤ₂→𝔽₂ has Tor₁(𝔽₂,𝔽₂)=𝔽₂ ≠ 0 and cannot replace the cover. | Headline and prismatic construction pass. |
| Q10.4 finite ranks | R = ℤ₃; k = 𝔽₃(t), d = 2, n = 1 | R₁ has rank 3 in the first case. In the second, [k:k³]=3 and the formula gives 3·3²=27. Infinite p-basis gives an infinite degree, outside the stated finite-stage hypothesis. | F-finite generality retained. |
| Q10.4 regularity proof at n = 0 | p=3, f=x−3; n=0,1 | Classes in basis ([3],[x]) are (2,1) and (2,0); only the second is a multiple of [3]. Both are nonzero. | R02: distinguish the initial stage. |
| Q10.4 embedding/intersection | p^(1/p), p^(1+1/p) in the p-root tower | Valuations 1/p and 1+1/p exclude/include pR⁺ respectively; the included element equals p times p^(1/p) in the tower. | Intersection normalization passes. |
| Q10.5 unit-root repair | c=pu; b_k^(p^k)=vp; k=0 | `(c_k/b̄_k)^(p^k)=u/v̄` is a unit, and the inverse ratio also has a unit p-power, so root-closedness puts both in the completion. At k=0 the ratio is u/v̄. `b_k^(p^k) ∈ pR∞` puts b_k in √(pR∞). | No actual root of p is assumed in R∞. |
| Q10.5 root membership | R=ℤ₃, S=ℤ₃[√3]; R=ℤ₃[3^(1/3)] | First value group is (1/2)ℤ, excluding valuation 1/3. Second already contains 3^(1/3). | Correct base hypothesis and negative control. |
| Q10.5 annihilator transport | c=0; c=p(x+p), root index k | c=0 forces c_k=0 in the domain R⁺. In the enlargement, `(T^(1/p^k))^(p^k)=c`; its image modulo c in the reduced perfectoidization is 0, while its image in the completed R⁺ is c_k. | Correct element of J acts by the requested root. |
| Q10.6 Tor and F-finite binder | k perfect; 𝔽₃(t); S=R, i>0 | Frobenius-range module ranks are 1 and 3. With S=R, positive Tor is 0, and multiplying the induced zero map by any c_k remains 0. | Signature passes; the general theorem is not replaced by this boundary computation. |

The untouched supporting rows inherited with computed evidence cover Q5.1–Q5.5, Q5.7, Q6.3, Q6.5–Q6.6, Q7.1, Q7.3–Q7.6, Q9.1 and Q10.1/Q10.3. Their values include 8 ≠ 2 modulo 9 for Frobenius on a wrong quotient, the nonzero nilpotent t^(1/p) versus its reduced tilt, trivial versus ℤ value groups, zero localization fibres for ℤ→ℚ, the blowup's nonzero 2-torsion class X−1, the pX nonflat hypersurface, nilpotent root classes before completion, ramification index 2 for ℤ_p[√p], and the characteristic-p failure of p-torsion-freeness. No inference of soundness was taken from a row lacking computed values.

### Pinned-library audit

Opened the relevant native declarations and checked the source hypotheses, rather than treating name matches as proof. The substantial interfaces are:

| Native object / declaration | File and line at the pin | Hypotheses checked |
|---|---|---|
| Integral perfectoidness and its API | `TauCeti/RingTheory/Perfectoid/Integral.lean:76`, 95, 102, 106, 110, 121, 131, 144 | Actual adic witness, Frobenius surjectivity, quantified principal kernel; zero ring allowed. No reducedness, domain or Tate hypothesis is built into the predicate. |
| Sharp and its congruence/root identity | `Mathlib/RingTheory/Perfectoid/Untilt.lean:40`, 49, 57, 72 | Prime, nonunit p and p-adic completeness. It is a multiplicative map, not generally additive. |
| Compatible sequences | `Mathlib/RingTheory/Teichmuller.lean:195`, 206 | Quotient characteristic p and completeness at the selected ideal; a monoid equivalence before characteristic-p structure. |
| Fontaine map and surjectivity | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`, 173, 183, 196 | Reduction and Teichmüller identities; surjectivity requires Frobenius-surjective mod p. |
| Uniqueness from Teichmüller values | `Mathlib/RingTheory/WittVector/TeichmullerSeries.lean:117` | Nilpotent p in the target; Q5.1 applies it modulo pⁿ before separation. |
| Completeness and Jacobson containment | `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`, 915 | Completeness includes Hausdorffness for the adic filtration. |
| Valuation rings and value groups | `Mathlib/RingTheory/Valuation/ValuationRing.lean:64`, 77 | Domain assumption; value group from unit orbits. |
| Continuous valuation | `TauCeti/RingTheory/Valuation/Continuous/Basic.lean:129`; `TopologicallyNilpotent.lean:123`, 140 | Attained-value definition; comparison with arbitrary value-group ratios uses continuous multiplication, present for the adic/Tate rings here. |
| Tate ring / pair of definition | `TauCeti/RingTheory/Huber/Basic.lean:163`, 213 | Open ring of definition, finitely generated ideal and its adic topology; a topologically nilpotent unit. Hausdorffness is not silently added. |
| Continuous spectrum / integrality | `TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.lean:155`; `TauCeti/RingTheory/Huber/Continuous/ValuativeCriterion.lean:429` | Cofinality conjunct and open-subring hypothesis. |
| Standard syntomic algebra | `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:90`, 105 | Flatness, finite presentation with the dimension count and nontrivial-fibre dimension. This is not the local-cover or filtered-factorization predicate introduced here. |
| Affine blowup | `TauCeti/RingTheory/Ideal/AffineBlowup.lean:64`, 138, 161, 226 | Subalgebra of a localization and universal lift; the regular-pair presentation is additional content. |
| Henselization | `TauCeti/RingTheory/Henselization/Algebra.lean:43`; `Henselian.lean:154`; `IndEtale.lean:47`, 60; `Quotient.lean:81` | Quotient comparison includes n=0; faithful flatness requires the ideal in the Jacobson radical. |
| Ind-étale flatness and henselian permanence | `TauCeti/RingTheory/Etale/IndEtale.lean:94`; `TauCeti/RingTheory/Henselian/Quotient.lean:34`; `Ideal.lean:110` | Surjection has no extra kernel-containment condition; radicals preserve and reflect the pair condition. |
| Tor and elementary vanishing candidate | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, 56 | Tor derives in the second argument; the first argument remains functorial. Projective-second-argument vanishing does not prove the headline for arbitrary N. |

Also resolved the basic carriers used in the signatures: `PreTilt` (`Mathlib/RingTheory/Perfection.lean:623`), `PerfectRing` (`FieldTheory/Perfect.lean:44`), `PerfectClosure` (`FieldTheory/PerfectClosure.lean:68`), `IsSMulRegular` (`Algebra/Regular/SMul.lean:47`), `HenselianRing` (`RingTheory/Henselian.lean:81`), `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:52`), `Algebra.FinitePresentation` (`RingTheory/FinitePresentation.lean:44`), `Algebra.Etale` (`RingTheory/Etale/Basic.lean:205`), `Module.Flat` (`RingTheory/Flat/Basic.lean:114`) and `Module.FaithfullyFlat` (`RingTheory/Flat/FaithfullyFlat/Basic.lean:64`), together with the quotient, subalgebra, localization, nilradical, Frobenius, integral-closure, polynomial and tensor-product APIs. Unrelated declarations with the same short name were not accepted as resolutions.

Object searches of the pinned perfectoid, syntomic, Huber, valuation and homological files, combined with all supplied near-match leads, found no duplicate of a retained headline. The nearby native affinoid nilpotence theorem has extra analytic hypotheses; Q8.4 is for arbitrary Tate rings. No integral-perfectoid relative tilting functor was found at these pins.

### Cross-roadmap ownership and supplier order

Read the board-package index before searching for owners. Used `roadmaps grep` by mathematical object and `roadmaps show` at the supplied open heads; main suppliers were read directly on main. The three unresolved-name leads are resolved roadmap names, not missing native declarations: both ordinary-flatness names occur in DerivedDeRhamCohomology §1.10, and `RegularTower.exists_perfectoidTower` occurs in PerfectoidSpaces P7.17. The native names substituted by the repairs resolve at the pins above.

| Supplier | Resolved sections / evidence |
|---|---|
| PerfectoidQuotients, open #1042 | `TauCetiRoadmap/PerfectoidQuotients/README.md:616` (§0.2), 711 (§0.3), 782 (§0.4), 831 (§0.5), 920 (§0.6), 1088 (§1.2), 1193 (§1.4). Naturality, generators, bounded torsion, root annihilators, p-integral closure and completed operations match. Lines 53, 812 and 1112 assign the extra fibre-product/tilting and ordinary ind-syntomic results to this Part II. |
| PerfectoidSpaces, main | `TauCetiRoadmap/PerfectoidSpaces/README.md:879`, 965, 1714 resolve P0.1/P0.2/P0.11; P1.4–P1.6 and P1.15 supply the Tate specialization; 5049/5101 resolve P1.24/P1.25; 8424 resolves P3.7; 11053/11144 resolve P4.15.2/P4.15.4; 17397 and 17487 resolve P7.16a/P7.17. Cohen presentations occur at 17425–17443 and the tower name at 17507. The general integral predicate is now consumed from Tau Ceti, while the additional criteria remain supplied here. |
| PrismaticCohomology, open #1057 | `TauCetiRoadmap/PrismaticCohomology/README.md:1168` (§0.61), 1192–1214 (§§0.62–0.63), 1453 (§0.79), 2788 (§2.30), 2800 (§2.31). δ-functoriality is prose, perfect prisms redirect to PerfectoidSpaces, and the universal perfect-site description and arbitrary-ideal almost purity remain in these sections. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:689`, 706, §E1.6. Kunz's regular, characteristic-p hypotheses match. |
| DerivedDeRhamCohomology, open head | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:536`, §1.10, explicitly names both ordinary-flatness declarations and requires a noetherian base, regular π and classical completeness. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md:375`, Layer 1, owns syntomic morphisms. Q7 uses their affine local description and adds the filtered/factorization theory. |

Read every `*Needs:*` line and checked its direction against the supplied merge order. No upward citation, forbidden supplier, circular hand-off or missing cited section was found. SchemeAndStackFoundations is no longer a supplier for the replaced native henselization facts. Q10.5 includes the Q7/Q9 inputs needed for its enlarged cover. No gap slug is declared or silently relied upon.

The closest open-head ownership checks also read:

- #1735, `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:580`, §3.2: fixed-perfectoid-field covers and almost flatness. Its construction adjoining roots of a unit and passing to almost elements differs from the general integral-perfectoid prismatic cover and the HM17 extended-plus-closure Tor statement here.
- #1840, `TauCetiRoadmap/PurityForFlatCohomology/README.md:185`: imports this Part II's valuation and residue-tower interfaces. Its further regular-tower tilt request is explicitly a consumer-side supplier gap at line 717, not a claim that this package already states that comparison.
- #1070, `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:68`: imports the existing perfectoid/prismatic inputs rather than claiming these integral structure and André theorems.

The overlap report has no shared-head conflict, dropped cited id, open-revision-only id or dropped local id. A fresh consumer search found the preserved Q5/Q6 section citations in #1743, `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:156`, 1538 and 1596. No fully qualified declaration collision or mutual ownership was found. Main precedes open work throughout these resolutions.

Required dependency-check output:

```text
depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

## Not verifiable

- No required source sample, named supplier interface or elaboration was inaccessible. No missing-reference request is needed.
- Ownership was checked against main, the board index and the provided open-head index, including the closest heads above. No claim is made about unindexed or unspecified open work.

## Source issues

- **Misprint** in CS24 at Corollary 2.3.7, proof, printed page 29 (line 1174): the source says the product clause 2.1.11(d) justifies the root-stable quotient; it should be the quotient clause 2.1.11(c); affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, printed page 25 (lines 1009–1010), and Corollary 2.3.7, printed page 28 (lines 1159–1160): the source says all monic polynomials acquire roots; it should be monic polynomials of positive degree, since the constant 1 has no root in a nonzero ring; affects a stated result.
- **Misprint** in CS24 at §2.3.3, printed page 24 (lines 987–988): the source says finite products preserve ind-fppf algebras without qualifying the index; it should be nonempty finite products, since the empty product over ℤ is not faithfully flat; affects a stated result.
- **Gap** in BS22 at Remark 10.13, printed page 83 (lines 3214–3216): the source says Remark 3.11 supplies the perfectoid cover inside the completed absolute integral closure; it should be supplemented by construction of that compatible map; affects the proof.
- **Gap** in BS22 at Remark 10.13, printed pages 83–84 (lines 3217–3226): the source says middle-term almost annihilation yields annihilation by the specified roots in the absolute integral closure; it should include compatible-root transport identifying elements of the annihilator with those roots; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "13eeee04051c045601df1258d8988e7a0cd1b8d4", "job": "REV-PKG-PerfectoidQuotientsPartII~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
