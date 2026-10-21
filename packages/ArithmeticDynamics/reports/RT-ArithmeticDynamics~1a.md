# Red-team review of #1335 ArithmeticDynamics at 1921611 (pass a (codex))

**Verdict:** changes needed

## R01 (P1) — Diagonal-excluded atomic energy is not Möbius invariant

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:2225`, “invariance of the energy of mass-zero measures under PGL₂(C_v)”.

**Claim:** The energy just defined for continuous-potential measures and finite type-I atomic measures is invariant on mass-zero measures.

**Witness:** Over ℂ, ν=δ₀−δ₁ has diagonal-excluded self-energy 0. Under γ(z)=2z its image is δ₀−δ₂, with self-energy 2 log 2. Both measures have mass zero.

**Exact repair text:** “Möbius invariance of mutual energy is asserted for mass-zero measures whose total variations have continuous potentials. It is not asserted for diagonal-excluded type-I atomic energies. For those energies retain the diagonal correction under coordinate change.” Add the displayed scaling counterexample as a negative-control Check and retain the correction in all uses involving empirical measures.

## R02 (P1) — Uniform convergence alone does not give weak convergence of signed Laplacians

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:2211`, “weak continuity under locally uniform potential convergence”.

**Claim:** On differences of subharmonic potentials with Radon Riesz measures, locally uniform convergence implies weak convergence of the measure-valued Laplacian.

**Witness:** In a sphere chart take smooth compactly supported u_n=χ(x,y)sin(nx)/n, with χ=1 on a rectangle. Then u_n→0 uniformly but ‖Δu_n‖TV→∞. Weakly convergent finite measures have bounded total variation.

**Exact repair text:** “Locally uniform convergence gives convergence of Laplacians as distributions. Weak convergence as finite signed Radon measures additionally requires uniformly bounded total variations. In particular, uniform convergence of continuous potentials with a fixed positive background curvature gives weak convergence of their positive curvature measures.” Use the same bounded-variation guard already present in §2.3(ix).

## R03 (P1) — The quasi-projective adelic completion has no construction target

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5486`, “Use Layer 4, Global adelic intersections and successive minima, for the quasi-projective adelic completion”.

**Claim:** §4.2 already supplies the completion, intersections and heights needed by §4.4 and §4.49.

**Witness:** §4.2, line 5466, constructs projective-variety intersections over number fields by uniform approximation only. Yuan–Zhang Theorem 5.4.3 uses quasi-projective adelic bundles, including the function-field case (yuan-zhang-adelic-v9 line 6607).

**Exact repair text:** Insert before §4.4: “Construct quasi-projective adelic line bundles using projective models and the boundary topology, including independence of compactification, completion, nef and integrable classes, pullback, analytic metrics, intersection products and normalized heights, over number fields and one-variable function fields. Prove compatibility with §4.2 in the projective number-field case.” Give the construction its own exact Yuan–Zhang locators and named milestones, and make §4.4 consume it. Ordinary uniform approximation on a fixed projective variety is not this completion.

## R04 (P1) — A stale supplier name survives in the analytic-line contract

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5502`, “imported from TropicalAndBerkovichArithmetic Layer 2”.

**Claim:** TropicalAndBerkovichArithmetic supplies the Berkovich carrier and disc points.

**Witness:** The owner identified by this package is ArithmeticDynamics §2.2–§2.3 (lines 2175–2207); the same consumer’s Needs line 5506 uses that internal owner. TropicalAndBerkovichArithmetic is not an available supplier contract.

**Exact repair text:** “At a finite place, the Berkovich projective line over C_v and its disc points ζ_{a,r} are supplied by ArithmeticDynamics §§2.2–2.3.”

## R05 (P1) — Height and unit-equation contracts cite retired supplier identifiers

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:1746`, `:1924`, `:8820`.

**Claim:** The supplier exports `DT.0/infinite-places-over`, `DT.0/mul-height-algebra-map`, `DT.0/northcott-absolute-height` and `DT.2/s-unit-equation-finiteness`.

**Witness:** None of these identifiers occurs in the current supplier. Its §0.2 names `prod_infinitePlace_comap_pow_mult` and `mulHeight_algebraMap` (lines 259, 269); §0.3 names `finite_setOf_absMulHeight₁_le` (364); the general unit-equation theorem is §2.4 (1142).

**Exact repair text:** Replace all `DiophantineApproximationAndTranscendence:DT.*` contracts by current sections and target names. Use §0.2 `prod_infinitePlace_comap_pow_mult`, `mulHeight_algebraMap`, `absMulHeight₁_eq_rpow`, `absMulHeight₁_eq_of_minpoly_eq`; §0.3 `finite_setOf_absMulHeight₁_le`; and §2.4's finite-rank nondegenerate unit-equation theorem over algebraically closed characteristic-zero fields, specialized to two variables after embedding. Do not cite the rational-only §2.3 theorem for arbitrary characteristic-zero coefficients.

## R06 (P1) — Good reduction of the elliptic curve does not normalize the chosen Lattès lift

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8016`, “at every nonarchimedean place v ∤ 2 at which E has good reduction”.

**Claim:** Good reduction of E makes the displayed doubling map have good reduction in the chosen x-coordinate.

**Witness:** At 5, E:y²+125y=x³ is isomorphic to y²+y=x³, which has good reduction. Its displayed lift (X⁴−31250XZ³,4X³Z+15625Z⁴) is normalized but has resultant Δ(E)²=729·5²⁴, hence bad reduction.

**Exact repair text:** “For an integral Weierstrass model with unit discriminant over a valuation ring, the doubling lift has unit resultant Δ² and hence good reduction, including residue characteristic 2. If the abstract elliptic curve has good reduction, this conclusion holds in the coordinates of a good integral model.” Replace both good-reduction conclusions in §6.3. Remove the unnecessary exclusion of 2 and add y²+y=x³ at 2 as a positive Check, with the scaled model at 5 as a negative control.

## R07 (P1) — Layer 2 imports the power-map construction from Layer 6

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:3574`, §2.86 Needs; `:3732`, Layer 2 Dependencies.

**Claim:** The Layer 2 acceptance theorem consumes §6.2, while Layer 6 consumes the earlier local-dynamical theory.

**Witness:** The §2.86 Needs link explicitly points to §6.2. The Layer 2 dependency paragraph explicitly includes “the elementary Layer 6 power map”. The general constructor in §6.2 itself needs only Layer 0.

**Exact repair text:** Move the arbitrary-characteristic `powerMap` constructor and its degree, resultant, composition and base-change API from §6.2 to Layer 0 after rational maps and good reduction. Keep Layer 6's applications as consumers. Repoint §2.86 and the Layer 2 dependency paragraph to that Layer 0 owner; move multiplier applications after the multiplier construction.

## R08 (P1) — Point heights are not field-independent for arbitrary adelic measures

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5805`, “h_ρ does not depend on K”; `:5681`, `AdelicMeasure.baseChange`.

**Claim:** Repeating the local measures at places above v preserves h_ρ(x), although the definition imposes no local Galois invariance.

**Witness:** Over ℚ let ρ∞ be unit-circle measure centered at i, and ρ_p=λ_p. The stated formula gives h_ρ,ℚ(i)=½log2. Over ℚ(i), choose its complex embedding i↦i and the stated base change: h_ρ,ℚ(i)(i)=0.

**Exact repair text:** “For arbitrary adelic measures the point-height notation retains the ground field: h_{ρ,K}(x) averages over Gal(K̄/K)·x. Base change preserves the height of a fixed K-Galois-stable finite set, but need not preserve point heights when that orbit splits. Prove point-height invariance under finite extension for the subclass invariant under the local Galois action at every place, including complex conjugation at real places, with compatible local identifications.” Update §4.12's base-change API and every field-independence use, retaining the general non-invariant measures with their base-field-dependent height. Add the centered-circle counterexample.

## R09 (P1) — Scheme classification is attributed to a supplier that does not supply it

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:1363` and `:1365`, “Use that supplier statement”.

**Claim:** SchemeAndStackFoundations supplies both the morphism associated to homogeneous forms and classification of every endomorphism of the projective line by such forms.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:550`–`:576` supplies relative Proj, base change and O(n). It does not state this classification. ArithmeticDynamics's own ownership contract at line 109 assigns the forms-to-morphism comparison to Layer 0.

**Exact repair text:** “SchemeAndStackFoundations §0.3 supplies the projective-line carrier. This target constructs the morphism attached to a base-point-free pair of homogeneous forms, proves its compatibility with points, composition and scalar equivalence, and proves that every K-endomorphism arises this way, including degree-zero constants.” Replace the supplier-based proof plan with named prerequisites for the projective-line line-bundle/section classification, owned here unless an actual earlier owner is cited by its current target.

## R10 (P1) — The Lattès Check reintroduces the wrong elliptic-height normalization

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:6630`, “ĥ_E = ½ĥ_{f_E}∘x with Tau Ceti's … canonicalHeight”.

**Claim:** Tau Ceti's canonicalHeight is half the absolute Lattès height.

**Witness:** At the Tau Ceti pin, `Point.canonicalHeight` in `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` is lim h_x(2ⁿP)/4ⁿ without ½. Over ℚ this is exactly ĥ_{f_E}(x(P)), as README §1.18 already records.

**Exact repair text:** “For P∈E(L), where L is a number field containing its coordinates, ĥ_{f_E}(x(P)) = Point.canonicalHeight(P)/[L:ℚ]. The absolute height for O((O)) is half this value.” Apply this normalization to the Check and use a non-torsion point over ℚ as its discriminating control; torsion points alone hide the factor error.

## R11 (P1) — Marked monodromy and the comparison bridge depend on each other

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5030` and `:5093`, §3.67 and §3.70.

**Claim:** The proof of marked-monodromy irreducibility imports the analytic–algebraic comparison, which itself imports marked-monodromy transitivity.

**Witness:** §3.67 explicitly uses §3.70 for connectedness-to-irreducibility. §3.70's Needs list explicitly imports §3.67 and its statement includes the resulting geometric integrality. Neither composite target precedes the other.

**Exact repair text:** “First prove the local analytic-equation/Jacobian comparison, independently of global connectedness. Next prove transitivity on marked periodic points using the ray and transversality inputs. Finally combine these two targets to prove smoothness and geometric integrality and descend to characteristic-zero fields.” Remove §3.70 from the proof inputs of monodromy itself; give each of these three targets its own Needs line.

## R12 (P1) — Lech–Cassels lists itself as a prerequisite

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:9479`, §6.86's Needs line.

**Claim:** The Lech–Cassels assembly is supplied by the link to the Lech–Cassels assembly itself.

**Witness:** The final link in §6.86's Needs line has anchor `#686-embedding-a-finitely-generated-field-into-ℚ_p-with-prescribed-integral-elements-lechcassels`, the section containing that line. Its proof instead uses §6.28 and §6.51.

**Exact repair text:** Replace the self-link with “§6.28, integral primitive presentation; §6.51, primitive-root transport”, retaining §6.70 as the specialization input. The resulting target depends on these earlier constructions and is not its own supplier.

## R13 (P2) — Residue-class reconstruction is false for modulus zero

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8274`, “S is one iff each {k : Nk + j ∈ S}, 0 ≤ j < N, is one”.

**Claim:** Finite-union-of-progressions membership can be reconstructed from the indicated residue classes without a positivity guard on N.

**Witness:** Take N=0 and S={2^k:k∈ℕ}. The right side quantifies over no residue classes and is true; the left side is false, as the roadmap’s own negative-control theorem states.

**Exact repair text:** “For N≥1, S is a finite union of arithmetic progressions iff, for every j<N, {k : Nk+j∈S} is one.” In the proof at line 8259 also replace “beyond N=max b_i” by “for n≥1+max b_i”: a singleton starting at max b_i otherwise violates the claimed periodicity at the threshold. Add the N=0 counterexample as a negative control.

## R14 (P2) — Two Lean signatures narrow their named README targets

**Location:** `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:461` and `:490`; README §§6.14 and 6.45.

**Claim:** `not_isFiniteUnionAP_powers` and `linearSynchronizedIntersection` mirror their README targets.

**Witness:** README line 8281 covers every p≥2; Lean fixes 2. README line 8814 covers every characteristic-zero field; Lean fixes ℂ. Both general forms use existing carriers and explicit hypotheses.

**Exact repair text:** Change the first signature to `theorem not_isFiniteUnionAP_powers (p : ℕ) (hp : 2 ≤ p) : ¬ IsFiniteUnionAP (Set.range fun k : ℕ ↦ p ^ k) := sorry`. Generalize `linearSynchronizedIntersection` to `{K : Type*} [Field K] [CharZero K]`, replacing its complex-valued binders and functions by K. Keep the complex embedding reduction in the proof plan.

## R15 (P2) — Easy polynomial-orbit endpoints are missing from Suggested.lean

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:9441` and `:9531`; `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:488`.

**Claim:** The file records the layer’s end statements when expressible on existing carriers, but stops at synchronized affine intersections.

**Witness:** §6.84 can use Polynomial K, forwardOrbit and function iteration. §6.90 can use Polynomial K and IsFiniteUnionAP. All exist in the file or Mathlib; neither requires scheme or analytic carriers.

**Exact repair text:** Add named README/Lean targets: (1) for characteristic-zero K and F,G∈K[X] of equal degree >1, infinite intersection of their forward orbits implies equality of some positive compositional iterates; (2) for characteristic-zero K, F,G∈K[X], x,y,A,B,C∈K with A≠0 or B≠0, `IsFiniteUnionAP {n | A * (fun z ↦ F.eval z)^[n] x + B * (fun z ↦ G.eval z)^[n] y = C}`. Preserve the general polynomial hypotheses, including constants in (2), and cite §§6.84 and 6.90 respectively.

## R16 (P2) — The uniform-boundedness definition drops projective dimension

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:4560`, “Define UniformBoundednessConjecture d D”.

**Claim:** §3.39 defines the preceding conjecture UBC(N,d,D), but its construction and named API quantify only over maps of ℙ¹.

**Witness:** The statement at line 4556 quantifies over N≥1; the definition at 4560 omits N. The monotonicity target at 4569 then uses UBC(N,d,D), which that definition cannot express.

**Exact repair text:** “Define UniformBoundednessConjecture N d D using degree-d morphisms of ℙᴺ over number fields of degree at most D. Define UniformBoundednessProperty N d D C with the same dimension parameter. The elliptic-curve application specializes these predicates to N=1.” Supply the general projective-morphism carrier from the earlier polarized-morphism targets and retain N throughout the basic API and source contract.

## R17 (P2) — The filter still calls a removed list-state interface

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:4383`, “S.filter (orbitRepeatsWithin f S (|S| + 1) [])”.

**Claim:** This expression defines the filter from §3.11's repetition predicate.

**Witness:** §3.11, line 3959, defines `orbitRepeatsWithin f S N x` with no list argument. After the first three arguments its next input is x:α; applying it to [] does not produce a predicate on α.

**Exact repair text:** “Define preperiodicFilter f S as the finite subset of S consisting of x satisfying orbitRepeatsWithin f S (|S|+1) x, using classical decidability when represented by Finset.filter.” Remove the obsolete [] argument and describe later uses as the finite-orbit characterization, without reintroducing an executable orbit-enumeration algorithm.

## R18 (P2) — The short Poonen-bound API loses the rank hypothesis

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:4042`, “Under the conjecture z² + c has at most eight finite rational preperiodic points”.

**Claim:** `card_quadratic_preperiodic_le_eight` follows from PoonenConjecture alone.

**Witness:** Its promoted owner §3.89, lines 5430–5432, also requires rank J(C₁(3₂))(ℚ)≤1. The supplier contract at line 121 explicitly leaves the corrected rank-upper-bound descent as an assumption.

**Exact repair text:** “`card_quadratic_preperiodic_le_eight`: Assuming PoonenConjecture and rank J(C₁(3₂))(ℚ)≤1 for C₁(3₂): y²=x⁶−2x⁴+2x³+5x²+2x+1, every z²+c has at most eight finite rational preperiodic points; supplied by §3.89.” Carry both assumptions in every corresponding application.

## R19 (P2) — The generic arboreal endpoint discards the source's positive-characteristic theorem

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:7843`, “that extension is outside the selected statement”.

**Claim:** The generic polynomial endpoint and its prerequisite chain are deliberately restricted to characteristic zero despite citing the general theorem.

**Witness:** juul-generic-iterates line 65 states the generic rational-function result over any field and the generic polynomial result when (degree, characteristic)≠(2,2). Lines 87–90 separately address the exceptional polynomial case.

**Exact repair text:** “For every field k and d≥2, the generic degree-d rational map has full iterated symmetric wreath image. The generic monic polynomial has that image when (d,char k)≠(2,2). Treat generic quadratic polynomials in characteristic two separately using Juul §5.” Extend the critical-orbit and first-level prerequisites to the source's hypotheses, and retain characteristic zero as a Check rather than the endpoint's scope.

## R20 (P3) — The power-lift height Check drops the factor 2

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:1764`, “both constants vanish”.

**Claim:** For F=(X₀²,X₁²) and q=(X₀,0;0,X₁), both displayed constants in §1.4 vanish.

**Witness:** Over ℚ, totalWeight=1 and mulHeightBound(q)=1, so the displayed lower constant is −log 2. Pinned Mathlib `Height.logHeight_eval_ge`, `Mathlib/NumberTheory/Height/MvPolynomial.lean`, retains Nat.card ι′=2.

**Exact repair text:** “For F=(X₀²,X₁²), q=(X₀,0;0,X₁) and K=ℚ, the displayed upper constant is 0 and the lower constant is −log 2. The sharper equality logHeight F(x)=2 logHeight x follows directly from the power-height formula, not by making this general lower-bound constant vanish.”

## R21 (P3) — The required source manifest is absent

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:10376` and missing `TauCetiRoadmap/ArithmeticDynamics/sources.toml`.

**Claim:** The package cites dozens of works and version-specific locators but does not record their provenance in the required manifest.

**Witness:** The package contains only README.md, Suggested.lean and metadata.toml; there is no sources.toml.

**Exact repair text:** Add `TauCetiRoadmap/ArithmeticDynamics/sources.toml` with schema `tauceti-roadmap-sources/v1`, recording every cited work, exact cited version, locator, targets, and the source service’s provenance/status fields. Record inaccessible texts as uncertified; do not invent successful fetch records.

## R22 (P3) — Discriminating Checks of kept definitions have no Lean mirror

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5300`–`:5301`, `:2436`, `:8278`; `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:374`–`:383`, `:455`.

**Claim:** The stated Checks are represented by proved examples testing the kept definitions.

**Witness:** No example tests H(0,0)=−2 or all four sign pairs; none tests the empty exceptional set of integer translation; the AP example tests only even numbers, omitting the requested isolated odd point.

**Exact repair text:** Consolidate the Morton examples to test all four sign pairs and H(0,0)=−2 while retaining the quotient denominator control. Add a proved integer-translation exceptional-set example. Replace the evens-only AP example by the proved `{1} ∪ Set.range (fun k : ℕ ↦ 2*k)` example. Keep at most two examples per kept definition; combine related assertions rather than adding an unrestricted test catalogue.

## R23 (P3) — The Hölder Check is false on the Berkovich line

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5801`, “the potential is locally constant off the Julia set”.

**Claim:** For z²+c with |c|_v>1 the normalized potential is locally constant away from the Berkovich Julia set.

**Witness:** Take c=p⁻² over ℂ_p. On ζ₀,r with 1<r<p, the orbit escapes and G(ζ₀,r)=log p. Thus g(ζ₀,r)=log p−log r varies on this Fatou segment.

**Exact repair text:** “For z²+p⁻², on the Berkovich segment ζ₀,r with 1<r<p, g(ζ₀,r)=log p−log r. It is harmonic there but not locally constant; the stated Hölder estimate still applies.”

## R24 (P3) — The alleged Misiurewicz parameters are periodic critical parameters

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:6395`, “Misiurewicz parameters (P_c^{n+1}(0) = P_c(0))”.

**Claim:** That equation describes strictly preperiodic critical parameters.

**Witness:** For P_c(z)=z^D+c, P_c^{n+1}(0)=P_c(0) is equivalent to (P_c^n(0))^D=0, hence P_c^n(0)=0. The critical point is periodic. For D=2,n=2 the parameters are 0 and −1.

**Exact repair text:** “The equation P_c^{n+1}(0)=P_c(0) gives periodic critical parameters again. For strictly preperiodic parameters use P_c^{m+n}(0)=P_c^m(0), with m≥2 and n≥1, together with exact preperiod m and exact period n. Equidistribution applies to any sequence of their nonempty Galois-stable finite sets with finite repetitions.”

## R25 (P3) — The rational-function product-formula proof reverses the infinity sign

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8084`, “which is −log|g|_∞”.

**Claim:** The degree difference equals minus the logarithm of the infinity absolute value defined immediately above.

**Witness:** Take g=t. The stated normalization gives log|t|_∞=1 and Σπ deg(π)ordπ(t)=1; the displayed negative logarithm is −1.

**Exact repair text:** “Σπ deg(π)ordπ(g)=deg(num g)−deg(denom g)=log|g|_∞. Thus Σπ log|g|_π+log|g|_∞=0.” Add g=t as the sign Check.

## R26 (P3) — The quadratic discriminant Check omits its positive-index guard

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:7082`, “Monic quadratic: A = −4”.

**Claim:** The positive-sign quadratic recurrence is presented as a Check of the general recurrence without restricting n.

**Witness:** At n=0, f=X²+1 and α=0, Disc(f)=−4, while the Check's right-hand side is +4. For n≥1, (−4)^(2^n) is positive as claimed.

**Exact repair text:** “For a monic quadratic and n≥1 the recurrence has factor 2^(2^(n+1)); at n=0 its factor is −4, so Disc(f−α)=−4(f(γ)−α).” Preserve the existing general formula and add its n=0 negative control.

## Verified sound

Read all 10,754 README lines and all 497 Suggested.lean lines. Coverage counts: **68 Lean declarations** (15 definitions, 36 theorems, 16 proved examples, one local instance); **500 numbered target sections**; **361 bold target/API/Check names within the layers**, plus 459 pinned-catalogue names. These are reading counts, not a claim that every source-dependent target is certified.

The declaration/context inventory and adversarial table record every Lean declaration, its binders, inherited instances and boundary cases. Every named Lean declaration occurs in the README. No sorry'd definition, admitted example, `set_option`, `lemma`, `True` placeholder or hypothesis containing its own conclusion was found in Suggested.lean. Its imports are the single `import Mathlib` and the elliptic canonical-height module actually used. The sphere instance uses its compact topology. No forced substitute for an unavailable heavy carrier was found.

**Checks tested:** 47 exact rational/integer assertions were executed in reviewer scratch, covering Morton coordinates and their poles, the rational three-cycle and candidate set, the formal-period-two collision, the cycle multiplier, degree normalization, discriminant sign, progression threshold, Stoll products and the alleged Misiurewicz equation. These are 47 assertions, not 47 distinct README Check blocks. All 16 Lean example bodies were inspected mathematically; none was executed. Analytic and valuation counterexamples are given in the findings. Coverage of all 116 README Checks blocks is not certified.

No further mathematical defect was identified in the typed generic orbit/preperiodicity equivalence, positive-iterate and bijective-semiconjugacy transport, group power-map criterion, Tate convergence/uniqueness/Northcott signatures, sphere power-map signatures, guarded Morton equations, finite-union-of-progressions equivalence, primitive-root transport or Lech–Cassels embedding. This is a mathematical signature review, not an elaboration certificate or a completed proof of the source-dependent classification theorems.

**Locators verified:** 19 distinct locator groups in seven legal source texts:

| Source | Locators checked | Source witness |
|---|---|---|
| call-silverman-1993 | Theorem 1.1; Example 1; Corollary 1.1.1; Proposition 1.2 | lines 132–162, 195–237 |
| ms95 | Theorem 3.1; Proposition 3.2; Corollary 3.3; Lemma 3.4 | lines 407–470; OCR limitations below |
| mcmullen-1987 | Theorem 2.2; Corollary 2.3 | lines 208–237, 809–826 |
| benedetto-aws-2010 | Theorem 1.11; Propositions 4.22, 4.23, 6.20 | lines 316–355, 1950–1971, 3230–3262 |
| favre-rivera-letelier-2006 | Proposition 2.6; Proposition 4.5; Definition 5.1 | lines 640–697, 1221–1232, 1480–1540 |
| yuan-zhang-adelic-v9 | Theorem 5.4.3 | lines 6607–6650 |
| juul-generic-iterates | Theorem 1.1 | lines 49–90 |

**Sibling citations checked:** zero citations to ErdosProgressionPowers occur in this package. Searches of that sibling's supplied head for the dynamical objects found no competing target. Current-main supplier checks included SchemeAndStackFoundations §0.3 and DiophantineApproximationAndTranscendence §§0.2, 0.3, 2.3, 2.4; the mismatches are reported above. This is not certification of every supplier row.

The pinned `Mathlib/Dynamics/PeriodicPts/Defs.lean` and `Lemmas.lean` were inspected for the periodic-point conventions; the new preperiodic predicate does not redefine their positive-period set. Pinned `Mathlib/NumberTheory/Height/MvPolynomial.lean` supplies the height-bound normalization, and pinned `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` supplies the full native elliptic height. Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Dependency checker output:

```text
depcheck: 2 roadmaps, 6 edges, 0 problem(s)
```

There is no external UPWARD or CYCLE line. A separate scan of 1,324 local Needs links detects the §6.86 self-edge; the other reported cycles use proof-plan prose and coarse layer dependencies, which this checker does not expose. The power-map construction must move to Layer 0, as specified above; no later roadmap is added as supplier.

HEAD was verified as `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`. The outside-package diff is empty and the checkout remains clean. No Lean build was run, no checkout file was edited, and nothing was posted.

## Not verifiable

- **Lean elaboration:** not run under the read-only/no-build brief. Mathematical inspection and the supplied example proof texts do not certify tactic execution or inferred types.
- **Complete pinned-library duplication audit:** the 459 catalogue entries were read, but not all were independently fetched at the pins. The four pinned files identified above are direct verification evidence; no global absence claim rests on a name search alone.
- **Unavailable supplier heads:** the supplied main/Completed trees do not contain readable folders for HeightsRationalPointsAndObstructions, EffectiveDiophantineMethods, InverseGaloisAndArithmeticFundamentalGroups or ArakelovGeometryAndAbelianHeights. Their permission in the merge order is not evidence of their exact present signatures. The RP.0, ED.0/ED.3/ED.4, IG.2 and adelic-interface contracts remain uncertified. Their absence from these inputs is not itself raised as a package defect.
- **Other suppliers:** the full contracts of AlgebraicCurves, ConformalMapping, FuchsianOrbifolds, ComplexManifolds, RestrictedPowerSeries, ModularCurves, PolynomialGaloisGroups, LocalGaloisGroups and ClassicalArithmeticCompletion were not independently verified target by target. The object searches and reading inventory do not certify their proof prerequisites or rule out all cross-roadmap duplication.
- **Source text quality:** the supplied ms95 and mcmullen-1987 extractions omit portions of some mathematical displays. The locator groups above were checked against the readable statements and surrounding arguments; omitted formulas were not guessed or certified from OCR.
- **Remaining sources and locators:** only the 19 locator groups tabulated above were certified. Other locators, including other locators in those seven works, remain unchecked. The bibliography has 64 entries, with some aliases for the same work. No claim is made that an unattempted source is legally inaccessible. The unverified entries are enumerated below; their status is “not independently fetched/read in this pass”, not a finding that their statements are false.

| Bibliography entry | README line | Status |
|---|---|---|
| cassels-embedding-1976 | 10378 | Uncertified in this pass |
| cassels-embedding-addendum-1976 | 10384 | Uncertified in this pass |
| bell-embedding-2007-v2 | 10390 | Uncertified in this pass |
| demarco-mavraki-ye-2026 | 10402 | Uncertified in this pass |
| levy-2011 | 10408 | Uncertified in this pass |
| milnor-1993 | 10414 | Uncertified in this pass |
| rumely-2013 | 10420 | Uncertified in this pass |
| rumely-2014 | 10426 | Uncertified in this pass |
| silverman-ads-sample | 10432 | Uncertified in this pass |
| silverman-aws-2010 | 10438 | Uncertified in this pass |
| demarco-krieger-ye-2020 | 10444 | Uncertified in this pass |
| baker-rumely-2006 | 10450 | Uncertified in this pass |
| favre-rivera-letelier-2007-corrigendum | 10462 | Uncertified in this pass |
| hutz-2009 | 10474 | Uncertified in this pass |
| hutz10 | 10486 | Uncertified in this pass |
| hutz15 | 10492 | Uncertified in this pass |
| fps95 | 10498 | Uncertified in this pass |
| poonen95 | 10504 | Uncertified in this pass |
| poonen-errata | 10510 | Uncertified in this pass |
| morton98 | 10516 | Uncertified in this pass |
| morton92 | 10522 | Uncertified in this pass |
| stoll08 | 10528 | Uncertified in this pass |
| gaoou13 | 10534 | Uncertified in this pass |
| doylepoonen19 | 10540 | Uncertified in this pass |
| bijmst18 | 10546 | Uncertified in this pass |
| chambert-loir-2006 | 10552 | Uncertified in this pass |
| pst2012 | 10558 | Uncertified in this pass |
| yuan2008 | 10564 | Uncertified in this pass |
| baker-hsia-2005 | 10570 | Uncertified in this pass |
| fili2017 | 10576 | Uncertified in this pass |
| baker-demarco-2011 | 10582 | Uncertified in this pass |
| jones-arboreal-survey | 10588 | Uncertified in this pass |
| jones-density-2008 | 10594 | Uncertified in this pass |
| aitken-hajir-maire | 10600 | Uncertified in this pass |
| stoll-1992-quadratic-iterates | 10612 | Uncertified in this pass |
| demarco-krieger-ye-2020-annals | 10618 | Uncertified in this pass |
| ingram-2018-critical-height | 10624 | Uncertified in this pass |
| ingram-2011-variation | 10630 | Uncertified in this pass |
| ghioca-tucker-zieve-2008 | 10636 | Uncertified in this pass |
| bell-ghioca-tucker-2010 | 10642 | Uncertified in this pass |
| milnor-lattes-2006 | 10648 | Uncertified in this pass |
| ghioca-2019-positive-characteristic | 10654 | Uncertified in this pass |
| Zieve1996 | 10660 | Uncertified in this pass |
| FRLergodicv3 | 10666 | Uncertified in this pass |
| Lyubich1983 | 10672 | Uncertified in this pass |
| fps | 10678 | Uncertified in this pass |
| gao-ou | 10684 | Uncertified in this pass |
| doyle | 10690 | Uncertified in this pass |
| morton96 | 10696 | Uncertified in this pass |
| morton96-corr | 10702 | Uncertified in this pass |
| doylekrumm | 10708 | Uncertified in this pass |
| dwy-2014-v3 | 10714 | Uncertified in this pass |
| benedetto-2005 | 10720 | Uncertified in this pass |
| favre-2017-v2 | 10726 | Uncertified in this pass |
| ritt-1920 | 10738 | Uncertified in this pass |
| bilu-tichy-2000 | 10742 | Uncertified in this pass |
| forster-riemann-surfaces | 10746 | Uncertified in this pass |

The scratch deliverables are `lean-declaration-inventory.md`, `adversarial-lean-table.md`, `bold-target-inventory.md`, `section-inventory.md`, `exact-arithmetic-checks.md`, and `local-dependencies.json`. They retain the full running inventories and distinguish reading from verification. This report does not certify that the remaining unchecked source/supplier claims are sound.
