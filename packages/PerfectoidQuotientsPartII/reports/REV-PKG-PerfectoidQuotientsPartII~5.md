<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12942#issuecomment-6791106724 -->
Review (codex) of dddd8d6

Verdict: accepted

No findings: 0 P1, 0 P2, 0 P3. Both previous findings are repaired. The four authored package files are unchanged. There are no declared supplier gaps.

## Verified sound

### Previous findings, checked first

The previous review's F01 and F02 were both actionable; neither repair claims an exception.

| Previous finding | Status | Repaired passage and independent witness |
|---|---|---|
| F01: the worked tower applied Frobenius to the series rather than the defining relation | Repaired | `packages/PerfectoidQuotientsPartII/README.md:1748`: “the defining element `f := p − g` of `R = A/(f)`”; line 1749 gives “stages `A/(φ_A^n(p − g))`”. For `p=2, g=x, n=1`, the relation is `2−x²`, giving `ℤ₂[√2]`, rank 2, with cotangent class `(1,0)`. For `g=x²` it is `2−x⁴`, giving `ℤ₂[2^(1/4)]`, rank 2 over `ℤ₂[√2]`. The wrong relations `x²` and `x⁴` give nonzero nilpotents. |
| F02: the flatness Check failed both regularity hypotheses | Repaired | `packages/PerfectoidQuotientsPartII/README.md:961`: “The regularity of `f` on `A` is needed, even when `f` is regular on `M`”. Here `N=ℤ[1/p]/ℤ`, `A=ℤ⊕N`, `N²=0`, `M=ℤ`. Multiplication by `p` is injective on `M`, but kills `(0,[1/p])≠0` in `A`. Both fibre tests are rank-one free, while `Tor₁^A(M,M)=N≠0`. |

The repair also changes the dummy series name in the P7.17 supplier contract at README 291. I compared it with `TauCetiRoadmap/PerfectoidSpaces/README.md:17495`: the supplier's series is named `f`, but the same relation and tower are described. No mathematical contract changed.

Searched the remaining defining-relation formulas, Frobenius stages, regularity Checks and API hypotheses. Q10.2 and Q10.4 consistently use the defining element; their normalized presentation and separate `n=0` calculation remain correct. The earlier Zariskization repair at README 1377 still assumes faithful flatness of `B`, rather than putting its desired conclusion in the hypotheses. The changed passages and all their new computations were reviewed directly.

### Coverage, principles and shape

Read all 37 numbered subsections in six layers, the scope, conventions, supplier contracts, proof routes, APIs, Checks, worked examples and references. The earlier review was used only as evidence where it supplied computed values; its prose summaries were not treated as mathematical checks. Main's PerfectoidSpaces, StableReduction and EnhancedDerivedSheaves READMEs were consulted for shape and supplier context.

The package extends PerfectoidQuotients, importing its integral algebra and completed operations. It retains arbitrary primes, torsion and zero divisors, arbitrary-rank valuation rings, and imperfect F-finite residue fields. Q10.5 explicitly requires a compatible perfectoid cover; Q10.4 constructs one in the F-finite generality used by Q10.6. No hidden good-prime restriction, replanning, computational algorithm, copied source passage, upward supply, sorry'd data or `set_option` was found.

The layer organization is mathematical: Q5 supplies structural identities, Q6 their relative and valuation consequences, Q7 and Q8 are independent algebraic and valuative preparations, Q9 combines them, and Q10 supplies the regular-local applications. In particular Q7 and Q8 do not simply reproduce the source's exposition order. Every layer has Examples and Dependencies; theorem targets have hypotheses and locators. The five definition/API blocks Q7.1, Q7.2, Q8.2, Q9.1 and Q9.5 have respectively 5, 5, 3, 4 and 6 Checks. Their controls distinguish flat from faithfully flat, syntomic from merely finitely presented flat, sharp from an arbitrary coordinate lift, the root quotient from its completion, and a Zariski ring from an arbitrary ring.

All 18 local Lean names occur in the README. Backticked supplier names were distinguished from this package's declarations and resolved below. No process residue, machine path, HTML anchor or pull-request number occurs in the authored README or Lean file. Metadata is `topic = "math.AG"`. All nine cited works have distinct manifest keys and legal cached texts. The additional Stacks fetch reused the existing key with `--add-only`; the author's manifest entry was kept.

### Headline coverage, elaboration and padding

The headlines listed in the Summary and acceptance-test paragraph resolve as follows. The three torsion-free presentation forms and the two valuation statements are separate Lean theorems.

| README headline | Suggested.lean coverage |
|---|---|
| Q5.6 perfectoid fibre products | `isIntegralPerfectoid_fibreProduct` |
| Q6.2 completeness transfer | `isAdicComplete_preTilt_iff` |
| Q6.4 valuation-ring equivalence | `valuationRing_iff_preTilt` |
| Q6.4 divisibility and value groups | `untilt_dvd_iff_and_exists_isUnit_mul_untilt` |
| Q6.7 algebraically closed fraction fields | `isAlgClosed_fractionRing_iff` |
| Q6.8 regular lifted parameter | `exists_surjective_of_isSMulRegular` |
| Q6.8 specified compatible roots | `exists_surjective_of_isSMulRegular_of_roots` |
| Q6.8 p-torsion-free presentation | `exists_surjective_of_isSMulRegular_p` |
| Q8.3 integral approximation | `exists_approximation` |
| Q8.4 valuative topological nilpotence | `isTopologicallyNilpotent_iff_forall_lt_one` |
| Q9.3 ordinary ind-syntomic André theorem | `exists_indSyntomic_andre` |
| Q9.6 semiperfectoid covers | `exists_semiperfectoid_cover` |
| Q10.2 regular-local perfectoid covers | `exists_faithfullyFlat_isIntegralPerfectoid` |
| Q10.5 compatible-cover Tor theorem | `tor_map_mul_root_eq_zero_of_cover` |
| Q10.6 F-finite Tor theorem | `tor_map_mul_root_eq_zero` |
| Q6.1 relative tilting equivalence | Named in the module docstring as not statable: the integral-perfectoid algebra categories and relative tilt functor are missing. No stand-in is stated. |

Ran the required `lake env lean` command on `packages/PerfectoidQuotientsPartII/Suggested.lean` from the pinned content checkout, using its absolute tool argument. Exit 0; fifteen warnings, all “declaration uses `sorry`”. All four imported Tau Ceti object files were available; no build was needed. The imports are one `import Mathlib` and four individual, used Tau Ceti modules.

On a scratch copy, every one of the fifteen sorried theorems was tried with goal-closing `simp`, `rfl`, `infer_instance` and `assumption`. All fifteen reached their numbered unsolved fallback; the probe elaborated with exit 0. The additional probe warnings concern unsuccessful/unused tactics, not the package. Inspected the relevant one-library-lemma candidates at the pins: the Fontaine evaluation identities, valued-field tilt result, standard syntomic interfaces, flatness criteria and projective-argument Tor vanishing do not prove any retained headline. No theorem is a Check, boundary computation, definition restatement or free-variable stand-in. No padding was found.

Appended `#check @name` for all eighteen declarations on the scratch copy and compared all elaborated types with the README and supplied signature ledger. No necessary binder was lost. The `IsIntegralPerfectoid` instance supplies p-adic completeness. Nonunit and domain binders needed by tilt and fraction-field carriers remain present. Approximation chooses its element before quantifying over valuations. Both Tor statements retain the actual inclusion into `R⁺`, finite localized étaleness, positive degrees, the chosen root sequence and its compatibility; Q10.5 retains the compatible cover map and Q10.6 retains F-finiteness of the residue field. `IsPZariski` itself appropriately does not retain an unused prime instance; its headline theorem does.

### Seeded source sample

There are no author-flagged unverified locators. The fifteen repeated “Theorem” labels correspond to the fifteen bold Theorem targets. I read the cached text at each locator, including its hypotheses and relevant proof steps. Page numbers are those of the manifest's arXiv versions.

| Target | Text and locator checked | Result |
|---|---|---|
| Q5.6 | CS24 Proposition 2.1.4, pp.12–13; CS24 line 468–486 | One map is surjective; the other is arbitrary. Perfectoidness and the tilt pullback are both supported. |
| Q6.2 | CS24 Proposition 2.1.9, pp.14–15; CS24 line 539–565 | Both completeness directions, divisibility by ξ₀, and the torsion reduction match. |
| Q6.4, valuation equivalence | CS24 Proposition 2.1.9, pp.14–15; CS24 line 544–546, 568–576 | Valuation rings in both directions, without a rank-one assumption. |
| Q6.4, value groups | Same proposition; CS24 line 547, 572–576 | Sharp induces the order comparison and every element is a unit times a sharp. |
| Q6.7 | CS24 Proposition 2.1.9, pp.14–15; CS24 line 576–590; Sch12 Theorem 3.7(ii), Proposition 3.8, p.17; Sch12 line 751–761 | Rank-one field theorem plus the stated localization argument supports arbitrary rank. |
| Q6.8, regular lift | CS24 Proposition 2.1.12, pp.17–18; CS24 line 682–700 | Adic completeness, regularity, divisibility and surjection match. |
| Q6.8, specified roots | Same proof; CS24 line 687–699 and Theorem 2.3.4 proof, p.25, CS24 line 1015–1018 | Choosing the tilt element from the given sequence makes the unit correction one and lifts those roots. |
| Q6.8, p-regular source | CS24 Proposition 2.1.12, pp.17–18; CS24 line 684, 700–702 | Separate ξ₀-variable construction gives the claimed p-torsion-free source. |
| Q8.3 | CS24 Lemma 2.3.1, pp.22–23; CS24 line 895–950 | Uniform approximant, multiplier v(p), exponent pm and threshold equivalence agree. |
| Q8.4 | CS24 Lemma 2.3.2, p.24; CS24 line 959–978; Wedhorn Proposition 7.18(1), pp.60–61; Wedhorn line 2494–2503 | CS24 states the principal-adic version. The package explicitly supplies the pair-of-definition extension using the native continuous-valuative integrality criterion. |
| Q9.3 | CS24 Theorem 2.3.4, p.25; CS24 line 1004–1030 | Both alternatives and both faithful-flatness conclusions match; positive degree corrects the constant-polynomial boundary. |
| Q9.6 | CS24 Corollary 2.3.7, pp.28–29; CS24 line 1157–1174 | Reduction before completion and the auxiliary surjective source match. |
| Q10.2 | BS22 Remark 3.11, pp.32–33; BS22 line 1299–1327; Bha18 Proposition 5.2, p.8; Bha18 line 469–479 | Generalized integral perfectoidness, modification (a), supports ordinary faithful flatness. Equal characteristic uses the named Kunz supplier. |
| Q10.5 | BS22 Remark 10.13, pp.83–84; BS22 line 3208–3226 | Cover compatibility is explicit in the package. Its enlargement transports the actual specified roots, filling the implicit step in the remark. |
| Q10.6 | Same remark; HM17 Theorem 1.3, p.2; HM17 line 65–70 | F-finiteness is preserved. The displayed mod-pⁿ Tor theorem is the sufficient stronger form of the BS22 argument, not a literal restatement of HM17. |

Additional direct readings: BMS1 Definition 3.5, Example 3.6 and Lemmas 3.9–3.10 (BMS1 line 1008–1067); Ces19 Lemma 5.2 and its ramified construction (Ces19 line 447–462); Bha18 Proposition 5.1 (Bha18 line 451–467); Stacks Lemma 10.99.16/tag 0H7N (Stacks line 11208–11238, *Commutative Algebra*). For Q7.5 I fetched *More on Algebra* through the sources service using the existing Stacks key, and read Lemma 15.32.2/tag 0BIQ, pp.82–83 (Stacks line 3872–3893 in that extraction). It states the blowup presentation for H₁-regular sequences and explicitly includes regular sequences.

### Computed adversarial pass

The table records values, rather than treating elaboration as proof. It covers the fifteen sampled/headline targets, every definition block, the repaired passages and the remaining numbered subsections. “Pass” means no defect found in the statement and proof-route audit together with these computations. The existing computed tests were retained where applicable and checked against the unchanged statements; the replacement flatness example was computed afresh.

| Statement | Instances tried | Values on the two sides or separating computation | Result / change |
|---|---|---|---|
| Integral-perfectoid convention | 0, 𝔽₂, ℤ₂ | π=0 works for the first two; over 𝔽₂, ker θ=(2). In ℤ₂, `2v₂(π)≤1` forces π a unit, whose completion is `0≠ℤ₂`. | Pass; no domain/reducedness field was smuggled into the predicate. |
| Q5.1, alternate tilt and θ | ℤ₃, wrong modulus 9, perfect characteristic 3 | ℤ₃♭=𝔽₃ has three sequences. Modulo 9, `(1+1)³=8≠2`; over perfect characteristic 3, sharp is identity. | Pass; Witt uniqueness is used at p-nilpotent quotients first. |
| Q5.2, products/pullbacks | A′=0, g=id, empty product, A′=ℤ/4 | Pullbacks are A×B and A on both sides; empty product is 0. In ℤ/4, `4·1=0` but `2·1≠0`. | Pass; torsion-bound role explicit. |
| Q5.3, sharp quotients | Completed 3-root tower | Both mod-3 rings are `𝔽₃[t^(1/3^∞)]/(t)`; `(ϖ♭)³=t`. Replacing t by ut for a unit leaves the ideal unchanged. | Pass. |
| Q5.4, torsion modules | 𝒪_C×𝔽̄_p; perfect characteristic p; nonreduced root quotient | Both annihilators for `(p^(1/p),0)` are `0×𝔽̄_p`. With ξ=p the two projections identify the diagonal quotient with A. In `B̂→B/(t)`, multiplication by t is nonzero on B̂ but zero on B/(t), excluding an A_inf-module isomorphism in the nonperfectoid control. | Pass, including module rather than merely ring distinction. |
| Q5.5, surjection | Identity, 𝒪_C→k̄, target 0 | Identity kernel 0; Witt kernel `W(𝔪_C♭)` for the residue map; for target 0 the kernel quotient is `A_inf/(ξ)=A`. | Pass. |
| Q5.6, headline | Two perfect root-polynomial rings over 𝔽₂, mapped to 𝔽₂ | Pullback consists of pairs with equal constant coefficient. Coordinatewise unique square roots preserve that equation; its tilt is the same ring. With A′=0, both give A×B. | Pass. |
| Q5.7, gluing | B=k̄ and B=𝔽_p | Pullbacks are 𝒪_C and `{a: residue(a)∈𝔽_p}`. The arrow B→k̄ exists in both cases; reversing it does not form the stated pullback. | Pass. |
| Q6.1, equivalence | Characteristic p; B=C♭ | `W(B)/(p)=B`. For B=C♭ over 𝒪_C♭, ξ₀ is a unit, its completion is 0 and `W(C♭)/(ξ)=0≠C♭`. | Pass; completeness excludes the wrong object. |
| Q6.2, headline | Zero parameter in characteristic p; ∏𝒪_C | Zero-adic inverse limits equal the original rings. Constant root parameters give completions ∏𝒪_C and ∏𝒪_C♭. | Pass in both directions, including nonnoetherian rings. |
| Q6.3, nonperfectoid valuation rings | ℤ_p and 𝔽_p⟦t⟧ | Both tilts are 𝔽_p; additive value-group map is `{0}→ℤ`, injective but not surjective. | Pass; separates Q6.3 from Q6.4. |
| Q6.4, valuation headline | 𝒪_C; 𝒪_C×𝒪_C | Valuation predicates true/true for the first pair; false/false for the product since `(1,0)(0,1)=0` on both sides. | Pass. |
| Q6.4, value-group headline | Root tower; x=t^(1/p), y=t; a=0,1+p | `1/p≤1` gives divisibility in the same direction; both groups are ℤ[1/p]. `0=1·0♯` and `1+p=(1+p)·1♯`. | Pass. |
| Q6.5, completeness/localization | V=𝒪_C, q=𝔪; a=0; q=0 with a≠0 | V_q=V; zero-adic completion equals the ring. At q=0 a becomes a unit, giving completion `0≠Frac(V)`. | Pass; zero case is immediate separately from the nonzero exact-sequence argument. |
| Q6.6, perfectoid localizations | 𝒪_C and 𝒪_C♭ | At 𝔪 localization returns the ring. At 0 the mixed-characteristic p-completion is 0, while the characteristic-p fraction field is perfect with π=0. | Pass; mixed-characteristic zero prime excluded. |
| Q6.7, headline | 𝒪_(ℂ₃); completed 3-root tower | Algebraic closedness true/true in the first pair. In the second, residues have squares 0,1, so `X²−2` has no root in either fraction field. | Pass. |
| Q6.8, regular-lift headline | A=𝔽₂, ϖ=0 | Completed `ℤ₂[2^(1/2^∞)]` surjects to 𝔽₂; regular `ϖ̃=√2` has square 2 and image 0. | Pass. |
| Q6.8, specified-roots headline | Same target and zero root sequence | `r′_n=2^(1/2^(n+1))`, `(r′_(n+1))²=r′_n`, and every image is 0. | Pass; prescribed roots actually lift. |
| Q6.8, p-regular headline | A=𝔽₂ and A=0 | Multiplication by 2 is injective on the mixed-characteristic source; the zero source also has injective multiplication and surjects onto 0. | Pass. |
| Q7.1, ind-fppf definition/API | ℤ→ℤ[X_i], ℤ→ℚ, empty product | Polynomial stages have monomial bases and nonzero fibres; `ℚ⊗𝔽_p=0`; the empty product has zero fibre too. | Pass; faithfulness/nonempty products discriminate. |
| Q7.2, syntomic/ind-syntomic definitions | `k[x,y]/(x²,xy,y²)`, ℤ→ℤ[1/p], 0 | First ring: dimension 0, embedding dimension 2, three minimal relations. Localization has zero p-fibre but is syntomic. At 0, `span ∅=⊥=⊤`. | Pass; flatness alone is insufficient, and faithful flatness is not part of syntomicity. |
| Q7.3, stability | Base change ℤ[X] to 𝔽₂; two factors versus none | Base change is 𝔽₂[X]; two-factor fibre k×k is nonzero; empty-product fibre is 0. | Pass. |
| Q7.4, retained flatness Checks | M=ℤ_p and ℤ/p over ℤ | First has fibres ℚ_p and 𝔽_p, flat. Second has localization 0 and quotient 𝔽_p but `Tor₁(ℤ/p,ℤ/p)=𝔽_p`. | Pass; second isolates regularity on M. |
| Q7.4, repaired Check | N=ℤ[1/p]/ℤ, A=ℤ⊕N, M=ℤ | `pN=N`, `N[1/p]=0`, `N[p]≅𝔽_p`; both localized and reduced modules are rank-one free. `Tor₁^A(M,M)=N/N²=N≠0`; p is injective on M. | F02 repaired; isolates regularity on A. |
| Q7.5, blowup presentation | (p,T) in ℤ_p[T]; a=g=2 in ℤ | Good presentation eliminates T, giving ℤ_p[X]. Bad presentation has `(X−1)≠0`, killed by 2, while ℤ[2/2]=ℤ has no 2-torsion. | Pass. |
| Q7.6, hypersurfaces | g=pX, g=1+px, n=0 with g=1 | First has nonzero p-torsion X; second is ℚ_p with empty closed fibre; last quotient is 0 with no nontrivial fibres and natural `n−1=0`. | Pass. |
| Q8.1, continuity | Trivial valuation and T-adic/p-adic composite | Trivial values `v(pⁿ)=1`. In additive lexicographic coordinates, `v(T)=(-1,0)<(0,-n)=v(pⁿ)` for every n. | Pass; neither is continuous. |
| Q8.2, tilted valuation | x=p♭ over 𝒪_C | `v♭(p♭)=v(p)`; lifts 0 and p of the zeroth residue coordinate have values 0 and v(p). A valuation with v(p)=0 kills p♭ as well. | Pass; arbitrary lifts cannot define it. |
| Q8.3, headline | a=b♯; a=1+p, a′=1; m=0 | Errors 0 and v(p); second equals `v(p)max(1,v(ϖ)^(pm))`. At m=0 bound is v(p); in characteristic p bound and error are 0. | Pass; uniform quantifier order retained. |
| Q8.4, headline | p,1 in ℚ_p; T in ℚ_p⟨T⟩; zero ring | `pⁿ→0`, v(p)<1; `1ⁿ=1`, v(1)=1; Gauss v(T)=1. Zero ring has powers 0 and no valuations, so both predicates true. | Pass in both directions. |
| Q9.1, root extension/API | Empty family, P=T, excluded P=1 | Empty family gives I′=0. For P=T, the quotient has T=0 but `T^(1/p)≠0`; its pth power is 0 and completion kills it. For P=1, I′=A′ and quotient 0. | Pass. |
| Q9.2, stages | P=T, m=1, j=0 over 𝒪_C | After inversion, stages `C[T^(1/p^n)]` omit `T^(1/p^(n+1))`; the union contains it. `T^(1/p)/ϖ^(1/p)` has pth power T/ϖ but is absent before root closure. | Pass; ind-syntomic is not replaced by syntomic. |
| Q9.3, headline | 𝒪_C, completed 3-root tower, 0 | For 𝒪_C take A′=A,I′=0. In the root tower, `X²−2` has no root since squares mod 3 are 0,1. At 0 all objects are zero and no polynomial has positive natural degree. | Pass. |
| Q9.4, consequences | Cyclotomic completion, p=3 and p=2 | `X³−3` and `(Y+1)³−4` are Eisenstein; a normal degree-3 root field cannot contain ζ₃ of degree 2. At p=2, `√2=ζ₈+ζ₈⁻¹`. | Pass; oddness is confined to the negative example. |
| Q9.5, Zariski definition/API | ℤ₂[T], ℚ₂ over ℤ₂; ℤ over itself | Zariskized closed fibres are 𝔽₂[T] and 0. ℤ becomes ℤ_(2), with zero fibre at 3. In characteristic p every denominator is 1. | Pass; both faithful flatness and base Zariski condition needed. |
| Q9.6, headline | ℤ_(p), 𝔽_p, 0 | ℤ̄_p completes to 𝒪_(ℂ_p); `ℤ̄_p/p` has reduction and p-completion 𝔽̄_p; at 0 choose target 0. | Pass. |
| Q10.1, unramified refinement | ℤ_p and ℤ_p[√p] | Witt residue extensions have ramification index 1; adjoining √p gives index 2 and `p=(√p)²∈𝔪²`. | Pass. |
| Q10.2, headline | ℤ₂, 𝔽₃⟦t⟧, characteristic-p field | Covers are completed 2-root tower, faithfully flat perfection, and perfect closure. Wrong cover ℤ₂→𝔽₂ has Tor₁=𝔽₂≠0. | Pass; equal characteristic and dimension zero retained. |
| Q10.3, absolute integral closure | ℤ_p, 𝔽_p⟦t⟧, ℚ | Completions are 𝒪_(ℂ_p), R⁺ and 0. In characteristic p, `p·1=0` with 1≠0, so p-regularity needs characteristic zero. | Pass. |
| Q10.4, regularity | p=3,f=x−3,n=0,1; p=2; f=p²−x | Classes `(2,1),(2,0)`; at p=2, `(1,1),(1,0)`. Bad f gives `[φ(f)]=0`; at p=2, `(x−2)(x+2)=0`. | Pass; normalized presentation and initial-stage distinction are necessary. |
| Q10.4, rank/intersection | k=𝔽₃(t), d=2,n=1; p-root tower | Rank `3·3²=27`, not 9. Valuations `1/p<1` and `1+1/p≥1` distinguish `p^(1/p)` from `p·p^(1/p)` in pR⁺. | Pass. |
| Q10.5, headline/root transport | c=0, c=pu, c=p(x+p) | At c=0 every root is 0. For `b_k^(p^k)=vp`, `(c_k/b̄_k)^(p^k)=u/v̄` is a unit. Enlarged cover sends `T^(1/p^k)` to c_k and its reduced quotient sends it to 0. | Pass; specified annihilators transported. |
| Q10.5–Q10.6, nonzero source Tor | p=3, R=ℤ₃⟦x⟧, S=R+(3,x)√2, N=𝔽₃, n=i=1, c=3 | For D=𝔽₃⟦x⟧, `S/3S≅D²⊕𝔽₃`, so source Tor₁=𝔽₃≠0. R⁺ is a union of finite normal extensions, free over this regular two-dimensional R; target Tor₁=0. Thus map and root multiples are 0. | Pass; not a vacuous source-vanishing theorem. |
| Q10.6, residue-field binder | Perfect k; 𝔽₃(t); infinite p-basis | Dimensions over k³ are 1, 3 and infinite respectively; only the first two qualify. For S=R, positive Tor=0. | Pass; F-finiteness is not perfectness. |
| Worked tower and renamed supplier series | p=2,g=x or x²,n=1 | Relations `2−x²` and `2−x⁴` are Eisenstein; wrong relations x² and x⁴ have nonzero nilpotents. Reversing the sign of p−x preserves its ideal and all stages. | F01 repaired. |

Additional vacuity control: the zero ring does not refute the non-finite-presentation discussion of Q9.2, because it has no positive-degree polynomial. No theorem hypothesis contains its own conclusion. The Tor target's arbitrary module remains arbitrary; projectivity is neither assumed nor silently supplied. Commutative-ring targets do not require artificial nonabelian-group tests.

### Pins and duplication by object

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are the copies searched and opened, rather than newer library heads. The table records the principal native interfaces inspected; file paths are library-relative.

| Interface | Declaration and pinned location | Scope comparison |
|---|---|---|
| Integral perfectoid | `TauCeti.Perfectoid.IsIntegralPerfectoid`, `TauCeti/RingTheory/Perfectoid/Integral.lean:76`; API at 95, 102, 106, 111, 121, 131, 144 | Fields are an adic witness, Frobenius surjectivity and principal θ-kernel. No domain or reducedness field. Package imports this predicate. |
| Tilt and its domain specialization | `PreTilt`, `Mathlib/RingTheory/Perfection.lean:623`; ring at 630, valuation at 779, `PreTilt.isDomain` at 801 | Native domain theorem uses the valued-field setting; it does not prove arbitrary integral valuation-ring equivalence. |
| Sharp | `PreTilt.untilt`, `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`; congruence at 57 and root identity at 72 | Multiplicative map with explicit prime, nonunit and completeness hypotheses. |
| Compatible sequences | `Perfection.quotientMulEquiv`, `Mathlib/RingTheory/Teichmuller.lean:195`; zeroth coordinate at 206 | Native multiplicative equivalence is cited, not a target here. |
| Fontaine maps | `WittVector.fontaineTheta`, `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`; reduction 173, Teichmüller value 183, `surjective_fontaineTheta` 196 | Evaluation/surjectivity are narrower than the structure and existence headlines. |
| Witt uniqueness | `WittVector.eq_of_apply_teichmuller_eq`, `Mathlib/RingTheory/WittVector/TeichmullerSeries.lean:117` | Requires nilpotent p in the target; package applies it modulo pⁿ. |
| Adic completeness | `IsAdicComplete`, `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`; `IsAdicComplete.le_jacobson_bot` at 915 | Includes Hausdorffness; the cited Jacobson alias still exists at this pin. |
| Valuation rings | `ValuationRing`, `Mathlib/RingTheory/Valuation/ValuationRing.lean:64`; `ValueGroup` at 77 | Domain is an explicit requirement. Native value group has zero; nonzero quotient description in prose agrees. |
| Standard syntomic | `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`, `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:90`; presentation criterion 105 | Flatness is a field; fibre condition concerns nontrivial fibres. |
| Local syntomic near-match | `TauCeti/RingTheory/RingHom/StandardSyntomic.lean:164`, 176, 182 | These use one fixed relative dimension. Package's finite cover allows dimension to vary and supplies ind-syntomic factorization; no headline duplicate. |
| Huber/Tate | `TauCeti.Huber.PairOfDefinition`, `TauCeti/RingTheory/Huber/Basic.lean:163`; Huber 177, Tate 213 | Open subring, finitely generated adic ideal, and topologically nilpotent unit; no hidden Hausdorff assumption. |
| Continuous valuations | `Valuation.IsContinuous`, `TauCeti/RingTheory/Valuation/Continuous/Basic.lean:129`; nilpotence/cofinality in `TopologicallyNilpotent.lean:123`, 140 | Attained-value balls; group comparisons use continuity of multiplication in the topological rings at issue. |
| Continuous valuative criterion | `TauCeti.Huber.isIntegral_of_forall_continuous_valuation_le_one`, `TauCeti/RingTheory/Huber/Continuous/ValuativeCriterion.lean:429`; `cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`, `TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.lean:155` | Integrality and the cofinality conjunct are supplied; the package does not substitute merely v(I)<1 for continuity. |
| Henselization | `TauCeti/RingTheory/Henselization/Algebra.lean:43`, `Henselian.lean:154`, `IndEtale.lean:47`, 60, `Quotient.lean:81`; `TauCeti/RingTheory/Etale/IndEtale.lean:94` | Actual algebra, henselianity, ind-étaleness, faithful flatness under the Jacobson condition, all-power quotient comparison and flatness. |
| Henselian permanence | `RingHom.henselianRing_of_surjective`, `TauCeti/RingTheory/Henselian/Quotient.lean:34`; `Ideal.henselianRing_radical_iff`, `Ideal.lean:110` | Correct hypotheses for Q9.6's quotient and radical steps. |
| Blowup algebra | `Ideal.affineBlowup`, `TauCeti/RingTheory/Ideal/AffineBlowup.lean:64`; numerator criterion 138, regularity 161, universal lift 226 | Package adds the regular-pair presentation, not a second blowup carrier. |
| Tor | `CategoryTheory.Tor`, `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`; projective vanishing at 56 | Derived in the second argument, functorial in the first. Arbitrary N in the package is not assumed projective. |

Object searches included integral perfectoid predicates, tilts, syntomic and ind-fppf maps, flatness/localization, Huber valuations, henselization, blowups and Tor. The native principal-open flatness criterion is not Q7.4's closed/open glueing criterion. The extra native `PreTilt.coeff_eq_zero_iff` in `TauCeti/RingTheory/Perfection.lean:80` assumes the mod-p ring is reduced and does not replace Q6.3. No retained headline is supplied by one native theorem. The three simple predicates in Suggested.lean are used by the actual headline statements; they do not replace missing heavy carriers.

### Supplier resolution and open work

Read the board package index first. Used the prescribed `roadmaps grep` for ownership by object and `roadmaps show` for indexed open heads, and read main's supplier files directly. The three unresolved-name leads are roadmap targets, not allegedly existing native declarations: both ordinary-flatness names exist in DerivedDeRhamCohomology §1.10; the tower name exists in PerfectoidSpaces P7.17.

| Supplier / comparison | Current file resolution and ownership result |
|---|---|
| PerfectoidQuotients, open #1042 | `TauCetiRoadmap/PerfectoidQuotients/README.md:616`, 711, 782, 831, 920, 1088, 1193 resolve §§0.2–0.6, 1.2, 1.4. Naturality, generators, bounded torsion, torsion removal, root closure and completed operations match. Lines 53–56 explicitly place general fibre products, valuation methods and ordinary ind-syntomic André in this Part II. |
| PerfectoidSpaces, main | `TauCetiRoadmap/PerfectoidSpaces/README.md:5049`, 5101, 8424, 11053, 11144, 17397, 17487 resolve P1.24, P1.25, P3.7, P4.15.2, P4.15.4, P7.16a, P7.17. Line 17507 names `RegularTower.exists_perfectoidTower`. The earlier P1.4–P1.6/P1.15 Tate comparisons and P0.1–P0.2/P0.11 almost setup are the cited specializations and background, not new targets here. |
| PrismaticCohomology, open #1057 | `TauCetiRoadmap/PrismaticCohomology/README.md:1168`, 1192–1214, 1453, 2788, 2800 resolve §§0.61–0.63, 0.79, 2.30–2.31. Universal perfect-site and integral perfectoidization/almost-purity statements supply Q10.5. Perfection is correctly attributed through this supplier to PerfectoidSpaces P4.15.2. |
| DerivedDeRhamCohomology, open #868 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:536–550`: §1.10 names both ordinary flatness criteria with noetherian base, regular parameter and classical completeness. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:706`: §E1.6 gives regular characteristic-p Frobenius flatness with no perfection or F-finiteness restriction. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md:375`: Layer 1 owns syntomic morphisms. This package uses their affine-local description and adds the ind-syntomic theory. |
| DirectSummandsAndBigCohenMacaulay, open #1735 | `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:580–610`: §§3.2–3.3 construct a fixed-perfectoid-field cover with actual roots of p and almost faithful flatness. Its additional field structure and almost-element construction differ from Q10.2's general integral-perfectoid prism cover. |
| PurityForFlatCohomology, open #1840 | `TauCetiRoadmap/PurityForFlatCohomology/README.md:708–723` imports Q5/Q6/Q7/Q10.1. Its regular-tower-tilt request is a consumer-side declared gap at line 717, not a missing prerequisite of this package. |
| PrismaticCohomologyPartIII, open #1070 | `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:68` imports earlier perfectoid interfaces; its comparisons and F-crystals do not compete with the structure/ordinary André ownership here. |

The supplied overlap facts show no conflicting head, dropped cited id, citation defined only by an open revision, or dropped local id cited elsewhere. The repairs preserve numbering. Broader search hits concern geometric fibre products, analytic covers and consumers; no competing owner or mutual handoff was found. No local Lean declaration has another readable roadmap's fully qualified declaration name. Every `*Needs:*` line and supplier contract was checked for content and direction; no forbidden supplier or undeclared supplier gap was found.

Required dependency-check output in this round:

```text
depcheck: 237 roadmaps, 2142 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Not verifiable

- None of the fifteen sampled locators, repair-critical texts, required supplier interfaces or Lean commands was inaccessible. No missing-reference request remains.
- Ownership coverage is main, the provided board index and the indexed open heads available through the prescribed tools; it makes no claim about unindexed work.

## Source issues

- **Misprint** in CS24 at Corollary 2.3.7, proof, printed page 29 (CS24 line 1174): the source says part 2.1.11(d) provides the root-stable quotient argument; it should be part 2.1.11(c), since (d) concerns products; affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, printed page 25, and Corollary 2.3.7, printed page 28 (CS24 line 1009–1010, 1159–1160): the source says every monic polynomial acquires a root; it should be every positive-degree monic polynomial, since 1 has no root in a nonzero ring; affects a stated result.
- **Misprint** in CS24 at §2.3.3, printed page 24 (CS24 line 987–988): the source says finite products preserve ind-fppf algebras without an index qualification; it should be nonempty finite products, because the empty product over ℤ is not faithfully flat; affects a stated result.
- **Gap** in BS22 at Remark 10.13, printed page 83 (BS22 line 3214–3216): the source says Remark 3.11 supplies a perfectoid cover inside the completed absolute integral closure; it should justify the compatible map to that completion; affects the proof.
- **Gap** in BS22 at Remark 10.13, printed pages 83–84 (BS22 line 3217–3226): the source says almost annihilation of the middle Tor yields annihilation by the specified target roots; it should justify transport of annihilators to those roots; affects the proof.
- **Misprint** in Stacks at Lemma 15.32.2, proof, printed page 82 of More on Algebra (Stacks line 3877–3888): the source says the last relation uses the variable indexed n, although the variables end at r; it should use the variable indexed r; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "dddd8d6eb69c93e5f9fdcde10e9d99d555da445c", "job": "REV-PKG-PerfectoidQuotientsPartII~5", "model": "gpt-6-astra", "worker": "chris-9"} -->
