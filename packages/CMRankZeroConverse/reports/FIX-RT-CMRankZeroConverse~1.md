# CMRankZeroConverse red-team repair report

Both reviews number their findings F01–F03. The first three finding sections answer review a (RT-CMRankZeroConverse~1a), the next three review b (RT-CMRankZeroConverse~1b); elsewhere in this report `a-Fnn` and `b-Fnn` name them. The overlapping findings a-F02 and b-F02 concern the same gap and are settled once, under a-F02; b-F02 records how its three-way split was resolved.

## F01 (P1) — applied

Layer 1 Examples: “W is the rational Tate module of the modular curve” → W=M_f(1)≅ρ_(f*), the λ-component of V_p(A_f) with complex-conjugate coefficient action; W′≅ρ_f; the level-37 witness (dimension 4 against 2), with level 11 as the genus-one case where they agree. Same pattern repaired in Conventions and the §0.3 determinant Check.

Evidence: Kato line 1750 through line 1756 (§6.3, p. 161) makes V(f) a two-dimensional F-quotient. AutomorphicGaloisRepresentations §1.5 makes M_f's arithmetic dual ρ_f; §6.1 identifies the λ-factor of V_ℓ(A_f) with ρ_(f,λ). At weight two det ρ_f=ψχ, so ρ_f^∨(1)=ρ_f⊗ψ⁻¹, whose Frobenius trace is ψ(ℓ)⁻¹a_ℓ=ā_ℓ: hence ρ_(f*), as the reviewer says (conjugate action). The reviewer's sentence was refined: “not the whole Tate module” fails at level 11 (genus one), so the new text names that boundary.

## F02 (P2) — applied differently

Gap central-finite-conditions-and-descent → gap:finite-condition-shapiro (SelmerIwasawaCohomology §§2.7, 3.6). The needs sentence is now finite-condition Shapiro only. The away-p comparison is cited as supplied, as asked: §3.15 etale_jStar_degreeOne, §2.15, §4.9 blochKatoStructure, with PadicHodgeRegulators §1.7(d) above p. Coefficient extension and the quadratic corank identity are derived here.

Why it differs from the proposed text: the reviewer's replacement keeps coefficient extension and a quadratic restriction/corestriction comparison as requests. Both follow from what is supplied. First, V⊗_E L≅V^[L:E] as E-representations, and Bloch–Kato conditions commute with finite sums. Second, Ind V_pA≅V_pA⊕(V_pA⊗χ) and V_p(Aᶜʰⁱ)≅V_pA⊗χ; with SelmerIwasawaCohomology §4.26 (and §2.11), corank equals dim H_f¹. Announcing them as supplier work would repeat the defect this finding names.

Pattern, other place: gap:isogeny-corank-all-primes (EllipticCurves) asked for integral Selmer maps only to obtain equal rational coranks. An isogeny is a Galois isomorphism on rational Tate modules, because φ̂φ=[deg φ] is invertible there. SelmerIwasawaCohomology §4.26 then gives equal coranks at every p. The gap was deleted from the README contract, Scope, §4.3, §6.1 *Needs*, Layer 4 Dependencies and the plan. Consumers repointed: §1.2, §2.4 (statement, Check, *Needs*), §4.1, §4.3, §6.1, Scope, Layer 4 Dependencies.

## F03 (P3) — applied

From Tau Ceti: “extends the normalized good-prime cuspidal eigenform and adds newspace membership” → it extends the nonzero eigenform with nebentypus `HeckeRing.GL2.EigenformAwayFromLevel` (line 84), and adds newspace membership and first-coefficient normalization; the parent admits 2f, which only the normalization excludes. Verified at the pin: `Newform.lean` lines 84–100 (`ne_zero`, no normalization) and 104–108 (`isNew`, `isNorm`).

## F01 (P2) — applied differently

Gap elliptic-quadratic-analytic-identities → narrowed to the base-change identity L(A_K,s)=L(A,s)L(Aᶜʰⁱ_K,s), section R29.4 and R29.6. New gap:congruent-number-root-numbers (R29.6) for the sign table. Isogeny invariance and finite order are no longer requested; both are derived from supplied targets. Repointed: §0.1, §4.4, §5.3, §5.4, Layer 4 and Layer 5 Dependencies.

Why it differs: the reviewer proposed four gaps. Part (ii), equal local factors under ℚ-isogeny, is already supplied by EllipticCurveModularity. R29.3 (“Attachment and uniqueness across levels”) makes attachment an isogeny-class property, and R29.4's IsNewformOf.coeff_eq gives every Dirichlet coefficient of an attached form. Applied to newformOf E, these give equal L-series. Part (iii), finite analytic order, needs no supplier. `WeierstrassCurve.LFunction` has first coefficient one, and R29.6 gives absolute convergence on Re(s)>3/2. With Mathlib `LSeries.tendsto_atTop` (`Mathlib/NumberTheory/LSeries/Injectivity.lean:124`), the continuation tends to 1 and is not identically zero. The README already took this stance in Conventions and §4.4. For §4.4, G=F² follows. The reviewer's §5.4 attribution of (i) was not adopted: §5.4 uses only the root numbers and the sign isomorphism.

## F02 (P2) — applied differently

Settled with a-F02. Of the three proposed gaps: (a) central-bad-prime-finite-comparison is not created, because SelmerIwasawaCohomology §3.15 etale_jStar_degreeOne, §2.15 and §4.9 already supply it. (b) became gap:finite-condition-shapiro, without base change, which is derived. (c) is not created: the corank identity follows from (b), the induced-representation decomposition and §4.26.

## F03 (P3) — applied differently

KatoEulerSystems contract: “Sections 4.4 and 4.6 … in their stated admissible range” → §4.4 alone is restricted to its stated range. §4.6 is described as twisting and specialization, which involve no zeta element, with the same operations for every pair given by SelmerIwasawaCohomology §§3.7, 3.16. §2.1 *Needs*: the zeta gap was dropped and §3.7 added.

Why it differs: the reviewer's witness is the KatoEulerSystems README at a head that is not readable here. It is absent from main, from the open-roadmap index (`roadmaps show KatoEulerSystems`: not found) and from the board, which holds only its sources and review report. So the new text does not assert that §4.6 has no admissibility hypothesis. The operative repair holds on readable grounds: §2.1 constructs no zeta class, and SelmerIwasawaCohomology §3.7 twists every finite free O-lattice.

## Checks

- Elaboration: `lake env lean packages/CMRankZeroConverse/Suggested.lean`, run from the content checkout, exited 0. It gave exactly five warnings “declaration uses `sorry`”, at lines 55, 67, 78, 106 and 132. `Suggested.lean` was not changed this round: no finding changes a Lean statement, and no Lean name was added, renamed or removed.
- Binder audit: a scratch copy of `Suggested.lean` with `#check @name` for all nine declarations elaborated with exit 0. The results:
  - `ellipticLNonvanishingAtOne` and `squareclassHeight` keep `Field`, `NumberField`.
  - `descendsToRat` keeps `Field`, `Algebra ℚ`.
  - `congruentTwist` takes ℤ.
  - The three congruent-number limits have no binders.
  - Both CM headlines keep `Field`, `NumberField`, `IsTotallyComplex`, `finrank ℚ K = 2`, `¬(Ideal.span {3}).IsPrime`, `A.IsElliptic`, non-surjective `Int.castRingHom` into `TauCeti.Isogeny.Hom`, and `0 < ε`.
  - Every elaborated type matches its README statement; none changed.
- Dependency check (exact command of the brief), exit 0, complete output:

```text
depcheck: 56 roadmaps, 652 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. All newly cited sections belong to suppliers already named and earlier in the order:
  - SelmerIwasawaCohomology §§2.7, 2.15, 3.6, 3.7;
  - EllipticCurveModularity R29.3–R29.4;
  - EllipticCurves Layer 2 (main);
  - PadicHodgeRegulators §1.7(d).
- Citation resolver: the same two leads as before, KatoEulerSystems and ModularIwasawaMainConjecturesPartII. Both are board packages in the merge order, not open pull requests. No Lean name was found missing.
- Plan: `gaps` still has 13 entries. Changes:
  - removed isogeny-corank-all-primes;
  - renamed central-finite-conditions-and-descent → finite-condition-shapiro;
  - added congruent-number-root-numbers;
  - narrowed elliptic-quadratic-analytic-identities.

  Every slug, supplier and needs sentence matches its README “What … must provide” line verbatim, checked by script. A structural comparison confirms every other top-level plan field is unchanged. No slug occurs outside `gaps`, or in any other package.
- `sources.toml`: added §6.3, p. 161 to the existing Kato locator; it parses as TOML. No new source or key, and no `needs-references.toml`.
- No gate failures were listed in the brief.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| W=M_f(1)≅ρ_(f*) at weight two | Frobenius eigenvalues α,β of ρ_f with αβ=ψ(ℓ)ℓ | Eigenvalues of ρ_f^∨(1) are ℓ/α, ℓ/β; trace ℓ(α+β)/αβ=ψ(ℓ)⁻¹a_ℓ=ā_ℓ; determinant ℓ/ψ(ℓ)=ψ̄(ℓ)ℓ | Matches ρ_(f*) (character ψ̄) | a-F01 |
| W′≅ρ_f, consistency with W′≅M_(f*)(h) | k=2, h=1 | W′=M_f^∨(0)=ρ_f; M_(f*)(1)=ρ_(f*)⊗ψ has trace ā_ℓψ(ℓ)=a_ℓ | Agrees with Conventions | a-F01 |
| Not the whole Jacobian | Level 37; level 11 | dim S₂(Γ₀(37))=2 gives V_pJ₀(37) of ℚ_p-dimension 4 against a 2-dimensional component; X₀(11) has genus 1, so 2=2 | Unqualified “never” fails at 11, so the boundary is stated | a-F01 |
| §0.3 determinant Check | k=2, trivial ψ | det M_f=χ⁻¹; det M_f(1)=χ⁻¹χ²=χ=det V_pE_f | Unchanged value, carrier corrected | a-F01 |
| Newform parent | f and 2f | Both nonzero eigenforms; first coefficients 1 and 2; `isNorm` rejects 2 | Parent is not normalized | a-F03 |
| Away-p finite condition on H¹_global(W) | ℚ, p=3, Σ={2,7}, cubic subfield of ℚ(ζ₇) (supplier Check) | The class is ramified at 7, so it is outside degree-one j_*; at ℓ≠p, H_f=H_ur; H¹(ℝ,V)=0 also at p=2 | H_f¹(ℚ,W) = classes of H¹_global finite at p | a-F02 |
| gap:finite-condition-shapiro | F′=F; ℚ(i)/ℚ with V=ℚ_p; ℚ(√2)/ℚ with V=ℚ_p(1) | Identity map; 0=0+0; unit ranks 1=0+1 (ℚ_p(1)⊗χ₈ picks the norm-minus-one units) | Statement consistent; holds for any V at p by Ind(V⊗B_cris)=Ind V⊗B_cris | a-F02 |
| Coefficient extension | L=E; [L:E]=2 | dim_E H_f(V⊗L)=1·d and 2·d; zero exactly when d=0 | Derived, no export | a-F02 |
| Quadratic corank identity | y²=x³−x over ℚ(i); same over ℚ(√5) | Twist by −4 is isomorphic to A, so corank(A/ℚ(i))=2·0=0; over ℚ(√5), 0+corank(y²=x³−25x) | Matches §4.3 doubling | a-F02 |
| §4.3 dyadic Check under new route | Ind₁ on ℤ₂², σ swapping | (1±σ)/2 images (1,1),(1,−1); determinant −2, index 2 | Rational, not integral, decomposition | a-F02 |
| Isogeny invariance of corank | Degree-2 isogeny at p=2 | φ̂φ=[2], invertible on V_2; V_2A≅V_2A′ | Equal dim H_f, hence equal corank | a-F02 pattern |
| Finite order of elliptic continuation | 11a1, 32a2 | First coefficient 1; LSeries(x)→1 as x→∞; F(x)→1≠0 | Not identically zero; finite order everywhere | b-F01 |
| Junk branch of Euler product | Non-multipliable family | tprod gives arithmetic function 1, whose value at 1 is 1 | First coefficient 1 in every case | b-F01 |
| Isogeny invariance of L-series | E, E′ ℚ-isogenous; F=newformOf E | R29.3: F attached to E′; R29.4: A_n(F)=a_n(E)=a_n(E′) for all n, including 11a1's split factor 1−T at 11 | Equal L-series and continuations | b-F01 |
| §4.4 G=F² | (s−1)^r u(s), r=0,1,2 | G orders 0,2,4 = 2r; u(1)²≠0 | Matches `analyticOrderNatAt_mul` | b-F01 |
| gap:congruent-number-root-numbers | n=1,2,3,5,6,7 | Signs +,+,+,−,−,−; n=5 gives Λ(1)=−Λ(1)=0, matching the §0.1 Check; SelmerIwasawaCohomology §4.29's parity table agrees | Consistent with §§0.1, 5.3, 5.4 | b-F01 |
| §2.1 without the zeta gap | h=1,2; DVR complex R→R by π | Twist φ_h of SelmerIwasawaCohomology §3.7 holds for any finite free O-lattice; Tor₁(R/π,R/π) has length 1 | No zeta element in the statement or route | b-F03 |

## Ownership, sources and notes for the maintainer

- Sources: all cited texts were read in the legal cache. Kato line 1750 through line 1756 (§6.3) is new.
- Supplier resolution:
  - SelmerIwasawaCohomology was read at its index head: §§2.7, 2.11, 2.15, 3.6, 3.7, 3.15 (etale_jStar_degreeOne), 3.16, 4.9, 4.26 and 4.29.
  - EllipticCurveModularity was read at its index head: “Coefficient and local-reduction notation”; R29.3 “Attachment and uniqueness across levels”; R29.4 IsNewformOf.localPolynomial_eq and IsNewformOf.coeff_eq; R29.6 “Elliptic coefficient summability” and “Continuation and the functional equation”.
  - PadicHodgeRegulators §1.7(d) was read at the supplied sibling checkout via the index.
  - AutomorphicGaloisRepresentations §§1.5 and 6.1 were read at the index head.
  - EllipticCurves Layers 2 and 5 were read on main.
  - Mathlib `LSeries.tendsto_atTop` and `ArithmeticFunction.isMultiplicative_eulerProduct` were checked at the pin.
- Ownership: no carrier or theorem was added. One gap was removed (isogeny-corank-all-primes) and one split off (congruent-number-root-numbers); the rest moved to supplied sections. Ownership against open pull requests outside the index was not checked. The KatoEulerSystems README is not readable here, so b-F03's witness about its §4.6 is unverified.
- Gap slugs that changed: central-finite-conditions-and-descent was renamed to finite-condition-shapiro, and isogeny-corank-all-primes was removed. Its supplier, EllipticCurves, no longer has a request from this roadmap. The new slug is congruent-number-root-numbers, and elliptic-quadratic-analytic-identities now names R29.4 and R29.6. No other package references these slugs.
- No Lean declaration changed, so no consumer needs a migration.
- The reviewers' source issues were not findings and are not acted on here.
