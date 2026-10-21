<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/39#issuecomment-6304608955 -->
Review (codex) of 38d2c9c

Verdict: needs_changes

1. **F01** (P1) Six essential interfaces still have no actual supplier target

   **Location:** `packages/QWittVectors/design/README.md:70`: “Source citations identify the mathematics; they do not identify a supplier target.” The required interfaces are at lines 72–82. See also the supplier and gap arrays of `packages/QWittVectors/design/plan.json`.

   **Claim:** The build requires integral cyclotomic algebra, exterior de Rham/Cartier theory, unbounded cochain completion, prismatic comparison, regular-parameter DGA Bocksteins and differential-ideal quotients from earlier owners.

   **Witness:** Three supplier records have empty section lists. The corresponding roadmaps and both proposed Part II roadmaps have no files in the supplied main/package inventories; the cited existing main sections do not state the remaining extensions.

   The main repository inspected is commit `0e8b058a97cc4f9401d2679313e0e937761c1024`. The two specified open roadmap heads also do not provide these contracts. Each row gives a short independently checkable witness:

   | Required interface | Witness | Required ownership repair |
   | --- | --- | --- |
   | `gap:cyclotomic-contract` | HabiroCyclotomicCompletions appears at `merge-order/ORDER.txt:63`, but has no roadmap in the available inventories. The plan's supplier section list is empty. | Obtain actual sections for the residual ideal, intersection, local factorization and completion-topology assertions. Continue importing the pinned polynomial product identities directly. |
   | `gap:ordinary-derham` | DerivedDeRhamCohomology appears at `merge-order/ORDER.txt:17`, with no available roadmap and an empty supplier section list. The pinned Kähler basis theorem concerns degree one. | Obtain actual arbitrary-base exterior de Rham, étale-extension and relative characteristic-p Cartier targets, including strict alternation at 2. |
   | `gap:cohomology-completion` | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1808` addresses quotient towers and finite-cohomology comparison; line 2006 addresses complete Tor-amplitude. Neither states Wagner Lemma 4.25's unbounded theorem. | Supply a real DerivedModuleAlgebra Part II, stating where the base roadmap stops and retaining degree-dependent torsion bounds for unbounded complexes. |
   | `gap:prismatic-frobenius` | PrismaticCohomology appears at `merge-order/ORDER.txt:51`, with no available roadmap and an empty supplier section list. | Obtain actual q-PD, explicit/prismatic Frobenius, iterated décalage and PD-presentation comparison contracts, sufficient for both §§9.6 and 9.7. |
   | `gap:dga-bockstein` | `TauCetiRoadmap/DGAInfinity/README.md:293` introduces associative DG carriers and cohomology, without the regular-parameter construction or parameter-change identity. | Supply these in a real DGAInfinity Part II with an explicit base-roadmap boundary; cite it from §9.4. |
   | `gap:dga-quotient` | The same Layer 1 lacks homogeneous differential-ideal generation and its quotient universal property. DG-category quotients elsewhere are a different object. | Supply the algebra-ideal construction and universal property in DGAInfinity Part II; cite it from §7.2. |

   **Exact repair:** Bind every gap to an inspectable earlier section or pinned declaration with the required hypotheses. The three named missing suppliers need real contracts; the extensions of the two existing roadmaps need actual Part II roadmaps. Update both the supplier records and each consuming prerequisite after those contracts exist. Do not count a merge-order name or a paper as a supplier, invent a section identifier, replan an existing roadmap here, or weaken the unbounded and smooth endpoints. This requires owner work outside the design fix worker's file scope. The present review does not authorize outside-folder edits.

2. **F02** (P2) The dependency order is not certified

   **Location:** `packages/QWittVectors/design/README.md:58`: “From TauCetiRoadmap.HabiroCyclotomicCompletions”; the full supplier block and `packages/QWittVectors/design/plan.json` require a registered consumer position in `merge-order/ORDER.txt`.

   **Claim:** These imports can form a supplier-before-consumer build of QWittVectors.

   **Witness:** The order has no QWittVectors entry. The prescribed package README is absent. Checking the existing design instead exits 1 with `NOT IN ORDER: QWittVectors (insert it after its last supplier)`.

   **Exact repair:** Have the merge-order owner register QWittVectors after every actual supplier, including the Part II owners established for R01, and before its consumers. Materialize the package README at the appropriate stage, then run the prescribed gate there. The reviewer and design fix worker must not alter the protected order file. An absence of UPWARD/CYCLE messages in a failed gate is not acceptance. Exact available output is recorded below.

3. **F03** (P2) The standing framing convention adds an unsupported finite-map restriction

   **Location:** `packages/QWittVectors/design/README.md:21`: “frames, when supplied, are finite étale maps A[T₁,…,T_r]→R.” The phrase “finite étale framing” recurs in Layers 8–9 and in `packages/QWittVectors/design/plan.json:2471` and subsequent framed targets.

   **Claim:** The standing convention requires the framing algebra map to be finite, although §8.2 and its source require only an étale map from a polynomial algebra on finitely many coordinates.

   **Witness:** ℤ[T]→ℤ[T,T⁻¹] is étale but not finite: an integral equation for T⁻¹ would give 1∈(T) after clearing denominators. Wagner line 2831 allows this framing.

   This is a real generality difference. Wagner lines 129–130 and 2830–2848 use an étale framing, without finite-module hypotheses. Pridham line 371 even uses a formally étale map for the framed construction. The headline in §8.2 only asks for étaleness, while the standing convention narrows it. The smooth extension arguments need ordinary étale coordinate charts, not finite covers of affine space.

   **Exact repair:** State: a frame consists of a finite list of coordinates and an étale A-algebra map A[T₁,…,T_r]→R; the map need not be finite. Replace ambiguous “finite étale framing” throughout both artifacts and the prismatic supplier requirement by “étale framing with finitely many coordinates”. Keep the general smooth exports. Add a localization Check: for R=ℤ[T,T⁻¹], γ(T⁻¹)=q⁻¹T⁻¹ and D(T⁻¹)=−q⁻¹T⁻². It verifies that the calculus covers this nonfinite étale frame and distinguishes its twisted derivative from the ordinary one. Mirror it in Lean when the requisite roadmap definition is kept on existing carriers.

Reviewed on 2026-10-21. Three findings, all blocking: one P1 and two P2. The design is repairable. No design or source-manifest entry was changed.

The requested `packages/QWittVectors/reports/REV-DESIGN-QWittVectors~2.md` is absent. Consequently its exact findings cannot be certified as a complete list. I first checked the three findings identified in `packages/QWittVectors/reports/FIX-DESIGN-QWittVectors~3.md`, then checked the available round-1 findings, before reviewing the whole design. The repair report was evidence to verify, not authority to perform repairs.

| Previous finding identified by the repair report | Status | Passage and independent verification |
| --- | --- | --- |
| F01: missing supplier contracts | **Not repaired** | `packages/QWittVectors/design/README.md:70`: “Source citations identify the mathematics; they do not identify a supplier target.” The six required interfaces remain at lines 72–82. The relevant supplier inventories and actual main sections confirm the missing ownership; see R01. |
| F02: uncertified merge position | **Not repaired** | `packages/QWittVectors/design/README.md:1083`: “Their constructions supply no prerequisites to QWittVectors.” This correctly removes reverse consumer supply, but does not register QWittVectors in the order. Both gate outcomes are recorded below; see R02. |
| F03: qualitative or repeated Checks | **Repaired for the three identified replacements** | `packages/QWittVectors/design/README.md:498`: “F_2 sends the right-hand scalar T to T”; line 797: “θ_2(τ_2(T)²)=2T³dT”; line 976: “β_2([T²])=[T dT]≠0.” These respectively follow from A-linearity, the F-semilinear product rule, and division of d_H(T²) by q²−1. Specializing the quotient complex at q=1 proves the last class nonzero. |

The available round-1 report, `packages/QWittVectors/reports/REV-DESIGN-QWittVectors.md`, has the following disposition. These identifiers are historical, distinct from this review's R01–R03.

| Round-1 finding | Status and repaired passage |
| --- | --- |
| R01, reversed relative tensor balancing | **Repaired.** `packages/QWittVectors/design/README.md:532`: “a⊗1=1⊗ψ_m(a)”; both sides evaluate to T² in the toric m=2 example. |
| R02, unowned inputs | **Not repaired.** The six `gap:` paragraphs remain. This review R01 includes the additional differential-ideal quotient gap. |
| R03, narrowed comparison and bounded complex | **Repaired for the identified omissions.** Line 1012 now quantifies over “every smooth A-algebra R, every prime p and every positive integer”; line 76 says “arbitrary, possibly unbounded, cochain complex”. Wagner Proposition 4.2 and Lemma 4.25 support these generalities. The distinct framing defect is this review R03. |
| R04, merge position | **Not repaired.** The unsupported position sentence has gone, but the order entry and passing gate are still absent. |
| R05, DGA supplier overclaim | **Partly repaired.** Line 48 now imports “associative nonunital, unital and augmented DG algebras”; line 714 explicitly imposes graded commutativity and odd-square vanishing. Line 82 correctly identifies a separate differential-ideal quotient interface, but it has no actual Part II owner yet. |
| R06, nondiscriminating Checks and negative index | **Repaired for the identified examples.** Line 516 gives a dual-number detector with values ε and 0; line 763 compares T²dT with 3T²dT; line 404 imposes “a≥1” and separates a=0. |
| R07, pagination and manifest omission | **Repaired for the cited omissions.** Line 144 includes “printed hesselholt v3 pp. 8–9”; the bhatt-scholze manifest entry includes Remark 2.27, p. 20, line 775 and cited-for 2.3. Sample pagination was checked against printed numbers, not extraction page markers. |
| R08, process narrative | **Repaired for the cited passages.** Line 23 now says “the values are computed in the Checks below”; line 1083 describes the supply boundary directly. Checkout instructions, review-status consumer labels and claims of unavailable Lean evidence are absent. |

## Verified sound

I read all ten layers, all **52 targets**, their **162 named public API claims**, all **156 Checks**, the conventions and the six external mathematical interfaces. The plan contains 9 definitions, 19 constructions and 24 theorem targets. All 28 definition/construction targets have API lists and three Check bullets. Every target has a locator and an individual Needs line; every layer ends with Examples and Dependencies. The README and plan agree literally on all target statements, proof routes, API statements and Check statements. All target names and API names appear in the README. All internal `target:` dependencies resolve to strictly earlier targets; all `gap:` references resolve to one of the six gap records. These structural checks do not resolve external ownership.

The principles pass found no replacement of an existing QWittVectors roadmap, no computational-algorithm deliverable, no good-primes restriction, no copied source passage, and no reverse dependency on a stated consumer. All primes, nonunital absolute rings, arbitrary relative Λ-bases, zero rings and empty truncation sets remain present. The general smooth E∞ comparison in §9.7 is retained. R03 identifies the exceptional unsupported restriction on frames. Claims were checked as mathematics, not inferred from a `sorry` build. No suspicious instruction to change the review scope was acted upon.

### Seeded source verification

All **15 seeded targets** were checked against readable legal cached texts. The design and manifest flag **zero additional unverified locators**. All eight existing manifest records parse and have certified status. No new source was needed, no source was fetched, and the manifest was unchanged. The table uses the versions recorded by the author: Wagner v5, Hesselholt v3, Pridham v4, Scholze v1, Bhatt–Scholze v4, Wagner–Habiro v2, and the July 2003 Langer–Zink preprint. Source support is distinguished from ownership.

| Target | Locator read, including printed page | Result of hypothesis and statement check |
| --- | --- | --- |
| 1.1 Truncation sets | hesselholt line 205, line 208 and line 213, §1, pp. 5–6; wagner line 435, §2.6, p. 10 | Positive divisor closure, the empty set and divisor-sum ghosts agree. Hesselholt's definition begins before the target's line-217 pointer; the additional Wagner locator supports the definition. No zero-based p-typical indexing is substituted. |
| 2.3 Arithmetic perfection | wagner line 1621 and line 1637, Remark 2.47/footnote 2.3, p. 32; bhatt-scholze line 775, Remark 2.27, p. 20 | Perfection by commuting Adams colimits has the stated shift inverses and universal map. The δ-ring citation is a single-prime model, not an identification with characteristic-p perfection. The full Λ claim uses the commuting operations of §2.1. |
| 3.1 Absolute q-FV systems | wagner line 475, Definition 2.8, p. 11; line 546, Remark 2.12, p. 12 | Nonunital inputs, structural maps, coefficient linearity and the distinct FV and VF laws agree. |
| 3.2 Absolute q-Witt rings | wagner line 483, Lemma 2.9/Definition 2.10, pp. 11–12 | Both ideal-generator families, chains e∣d∣m, initiality and arbitrary nonunital R agree. At m=1 the quotient sets q=1. |
| 4.2 Relative q-FV systems | wagner line 1504, Definition 2.40, p. 30 | The scalar map is c_m; F is an A[q]-algebra map and V is A[q]-linear. The repaired toric scalar Check has the correct direction. |
| 4.5 Relative base change | wagner line 1583, Lemma 2.46 and proof, pp. 31–32 | Arbitrary Λ-base change, without flatness, is the source theorem. The polynomial-image calculation and polynomial reflexive presentations are included in its proof. |
| 5.2 Étale ghost pushouts | wagner line 1715, Corollary 2.51, p. 34 | Both ordinary and derived pushouts are asserted for étale R→R′ over any Λ-base. Flatness is supplied by the horizontal q-Witt map, not by the ghost map. |
| 6.3 Completed ghost Frobenius | wagner-habiro line 647, §2.7, pp. 15–16; line 679 and line 709, Theorem 2.9 proof, pp. 16–17 | The standing étale hypothesis is retained despite its omission from the theorem's abbreviated first sentence. The bottom map fixes q, applies pth power to the coefficient factor modulo p, and lifts on the common completion. No p∤d assumption is inserted. |
| 7.2 Initial differential system | wagner line 1956, Proposition 3.12/Definition 3.13, pp. 40–41; line 1977 for the ideal | Initiality, de Rham surjection and unchanged degree zero agree. The defining lifted relations have positive degree; degree-zero relations would already be zero by additivity of V. The quotient's missing supplier is R01. |
| 7.3 Differential q-FV systems | wagner line 1893, Definition 3.6, p. 39; line 1922, proof of Lemma 3.7 | All displayed operator identities agree. The proof gives dF_n=nF_nd; the source display at line 1921 has a V misprint and is correctly not followed. |
| 7.5 Positive-degree Frobenius | wagner line 2053, Proposition 3.17, p. 42; line 2081, §3.20, p. 43; line 2123 and line 2461, construction/laws, pp. 44–50; langer-zink line 453, Proposition 1.3, pp. 14–16 | The absolute derivation and its relative descent have the stated values, semilinearity and unique initial-system Frobenii, without torsion-free coefficients. Langer–Zink supports the ordinary PD-derivation method; Wagner supplies the q-relative theorem. |
| 7.7 Differential base change | wagner line 2044, Lemma 3.16, p. 42; line 2552, Proposition 3.31, p. 50; line 2561, Lemma 3.32, p. 51 | Arbitrary Λ-base change and étale coefficient extension are distinct assertions with the right hypotheses. The extended differential differentiates the new coefficients; the inverse-variable Check is correct. |
| 8.2 Framed coordinate automorphisms | wagner line 2830, §4.7, p. 57; pridham line 371, Definition 1.22, p. 9; scholze line 319, §3, p. 6 | Formal lifting, hT_i divisibility and regularity support the local headline over arbitrary A. The finite-map convention is narrower than these sources: R03. No coordinate-independent conjecture is used as a theorem. |
| 9.6 Simultaneous prime-power induction | wagner line 2703, §4.3, p. 54; line 2756, Lemma 4.5, pp. 55–56; line 3341, Lemma 4.29, p. 67; line 3459, Lemma 4.32, p. 70; line 3584, final implication, p. 73 | The induction chain, separate smooth/framed/polynomial hypotheses and quasi-isomorphism rather than degreewise isomorphism agree. The quotient must include dV. Prismatic/Cartier ownership remains R01; framing scope remains R03. |
| 10.1 Smooth integer torsion-freeness | wagner line 2686, standing hypotheses; line 2690, Proposition 4.1, p. 54; line 3613, proof, pp. 73–74 | Perfect coverage of A and smoothness of R are retained. All positive m and primes are covered. V-injectivity follows from FV=n on the torsion-free source; no Noetherian base assumption is added. |

Additional source checks covered the full smooth comparison at wagner line 2692 and line 3644, the unbounded completion theorem at wagner line 3198, the prismatic hypotheses at bhatt-scholze line 3898, the q-PD comparison at bhatt-scholze line 4316 and line 4378, and the V-only prime-identity argument at langer-zink line 601. These confirm that the R01 gaps describe genuine mathematics but do not give them a roadmap owner.

### Adversarial mathematics pass

Each target row covers the headline, its associated public laws, hypotheses, proof route and Checks. “Pass” means that the indicated substitutions and consistency checks did not refute the claim; it is not a proof of the planned library. The final column recommends changes only: the design was not edited. All fourteen defect classes were considered. Topological-group compactness, induction normalization and analytic periods do not occur in these algebraic statements; coefficient characteristic, flatness, completion, map direction and sign tests do.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | n=0,1,2; q=1; two cochain coordinates; toric base; localization frame | Polynomial q-integers and positive Bockstein sign pass. Finite-coordinate and finite-map conditions differ. | R03 |
| 1.1 `BigWitt.TruncationSet` and ghosts | ∅, {1}, {2}, Div(6) | {2} fails closure; w₆=x₁⁶+2x₂³+3x₃²+6x₆. Empty coordinates give a singleton. | None |
| 1.2 Ghost image/injectivity | ℤ, ℚ, 𝔽₂; empty truncation | The mod-2 congruence over ℤ is necessary; (0,1) has zero ghosts over 𝔽₂. Unit indices allow triangular inversion. | None |
| 1.3 Big Witt ring/functor | Zero ring; empty S; zero-product additive ℤ | Over ordinary ℤ, τ(1)+τ(1)=(2,−1). With zero multiplication, the cross terms vanish and addition is coordinatewise. | None |
| 1.4 F, V, τ laws | n=1,2; a=b=2; τ(−1) | F₂V₂=2; the gcd factor is needed. τ(−1)=(−1,0)=−τ(1)+V₂τ(1), not additivity of τ. | None |
| 1.5 p-typical comparison | a=0,1,2; p=2,3 | Div(p^a) has a+1 coordinates. At p=3,a=2 the ghost is x₀⁹+3x₁³+9x₂. | None |
| 1.6 Ordinary Witt étale comparison | Identity; empty S; S={1}; coprime 2,3 | Empty tensor is zero; singleton gives R; iterating Div(2),Div(3) has four coordinates. Finiteness of S is retained. | None |
| 1.7 Commuting-action Koszul bridge | r=0,1,2; M=0; two matrix units on ℤ² | d¹d⁰=[D₁,D₂]. The supplied noncommuting example gives u₁ in wedge degree two. Arbitrary scalar extension concerns complexes; cohomology needs flatness. | None |
| 1.8 Arithmetic fracture | N=1,2; M=ℤ,ℤ[1/2],0; unbounded complexes | N=1 gives an identity square. Completion alone loses ℤ[1/2]. Finite prime products and the localization term fix detection. | None |
| 2.1 Arithmetic Λ-coalgebra | ℤ; toric ℤ[T]; proposed identity Adams on 𝔽₂ | ψ₂(2)=2 while ψ₂(T)=T². The δ₂(2)=−1 obstruction excludes the nonzero characteristic-two proposal. | None |
| 2.2 Prime sets/free objects | P=∅,{2}; no free generators | Empty P gives ordinary rings; single-prime coalgebras use infinite Witt vectors; the empty free Λ-ring is ℤ. | None |
| 2.3 Perfection | ℤ; toric ℤ[T]; already-perfect base | ℤ stays fixed; rational nonnegative exponents invert all index shifts; T has no ψ₂-preimage before perfection. | None |
| 2.4 Perfect coverage | Zero ring; ℤ[T]; ℤ[ε]/ε² with ψ_nε=nε | Toric ψ₂ has basis 1,T. On dual numbers modulo 2, ε annihilates the target module, contradicting flatness. | None |
| 2.5 Relative perfection/twists | R=A with noninvertible ψ₂; ℤ[T]/ℤ; n=1 | For R=A, r⊗a↦ψ_n(r)a is still invertible by balancing. Relative perfection fails for the polynomial algebra over ℤ. | None |
| 3.1 Absolute FV system | Polynomial system over ℤ; nonunital zero; m=1,2 | FV₂(1)=2 and VF₂(1)=1+q. Replacing V₂ by scalar 2 breaks the second identity. | None |
| 3.2 Absolute initial quotient | R=0,ℤ; m=1,2; q=1 | Q₁=R; Q₂(ℤ)=ℤ[q]/(q²−1); specialization at q=1 does not give ordinary Witt restriction. | None |
| 3.3 Absolute ghosts | m=1,2,6; prime V-images | First ghost at m=2 sends q to −1 and kills 1+q; level one has no proper V-images. | R01 prerequisite |
| 3.4 V-resolution/injectivity | m=1,6,2^a; a=0,1 | For m=6 the composite is −V₂V₃+V₃V₂=0. The prime-power sequence excludes a=0, which has its own augmentation. | R01 prerequisite |
| 3.5 Localization/torsion | R=ℤ,𝔽₂; m=1,2 | The two ℤ ghosts are jointly injective. Nonzero V₂(1) over 𝔽₂ refutes unconditional ghost injectivity. | None |
| 3.6 Absolute completion | m=1,2; zero/unit completion ideals | A zero parameter leaves the module unchanged; a unit kills it. Discrete completion and bounded torsion are separately hypothesized. | R01 prerequisite |
| 3.7 Witt injection/exactness | R=0,𝔽₂; nonunital kernel; m=1,2,6 | The characteristic-two V element survives. Kernel exactness must allow nonunital rings. Prime-to-p factors retain the q-substitution. | None |
| 4.1 Λ comparisons | ℤ and toric ℤ[T]; m=1,2 | For ℤ the maps are inverse; for toric ℤ[T], c₂ misses T. The composite c_ms_m is ψ_m. | None |
| 4.2 Relative FV systems | R=A,0; toric scalar T; m=2 | Right scalar T maps to T, whereas ψ₂-semilinearity would give T². The repaired Check tests the actual scalar convention. | None |
| 4.3 Relative initial quotient | R=A,0,A[X]; toric A=ℤ[T],m=2 | The dual-number detector takes the proposed balancing pair to ε and 0. Halving the TX coefficient is integral, and cross product terms are divisible by 4. | None |
| 4.4 Relative ghosts | d=m=2, toric A=R; m=1; A=ℤ | a⊗1=1⊗ψ₂(a); both toric sides map to T². Reversing the twist would give T⁴=T. | None |
| 4.5 Relative base change | Identity/zero base change; polynomial R; nonflat base map | The polynomial construction and presentation argument use Λ-compatibility, without a flatness hypothesis. | None |
| 4.6 Perfect-cover comparisons | R=A; polynomial ℤ[T]/ℤ; torsion coefficients | Relative perfection concerns the linearized map. Existence of c,s alone does not imply equivalence. Absolute V-injectivity handles torsion over ℤ. | None |
| 5.1 Étale preservation | Identity; m=1; nonflat quotient | The source étale map supplies the flat tensor factor; an arbitrary quotient does not. | None |
| 5.2 Ghost pushout | m=d=1; R=A; quotient by x | Derived pushout follows from horizontal flatness; no flatness of the ghost quotient is asserted. | None |
| 5.3 Relative completion | A=ℤ; R=A; p invertible; torsion R | Zero completions when p is invertible are allowed. Completed scalar extension, rather than commuting ordinary tensor with all limits, is required. | None |
| 5.4 Finite type | r=0,1; m=2; infinitely many variables | r=0 has rank m; 1,T generate the m=2 polynomial extension over the stated subring. Infinite variables give no Noetherian conclusion. | None |
| 6.1 Completed étale Frobenius | R=A,0,ℤ×ℤ; p=2; smooth ℤ[T]/ℤ | Product Frobenius lift is identity. Polynomial Frobenius misses T modulo 2, ruling out replacing étale by smooth. | None |
| 6.2 Cyclotomic completion | p=2,3; d=1,2; R=0 | Φ₃ mod 3=(q−1)² and Φ₄ mod 2=(q−1)². Radical agreement suffices even when p∣d; equality of ideals is unnecessary. | R01 prerequisite |
| 6.3 Ghost Frobenius | m=p; p∣d; A=R=ℤ,p=2 | Teichmüller exponents on both paths are m/d. q-fixed sends 1+h to 1+h, not 1+2h+h². | None |
| 7.1 Differential V systems | Level-one exterior algebra; odd generator in characteristic 2; even generator | Strict odd alternation excludes the characteristic-two symmetric algebra. Even square-zero elements are permitted. Vd=n dV follows without integer division. | R01 prerequisite |
| 7.2 Initial differential system | m=1,2; R=0,A,A[T]; characteristic 2 | Degree zero is unchanged; d(T²)=2T dT and (dT)²=0. The lifted ideal requires differential closure. | R01 prerequisite |
| 7.3 Differential FV systems | n=1,2,3; dτ(T); reduction mod 3 | F₃dτ(T)=T²dT but dF₃τ(T)=3T²dT. F is graded and generally not a chain map. | None |
| 7.4 V-only prime identity | p=2; x=0; Teichmüller and V generators | γ₂(V₂x)=V₂(x²) and 2γ₂(v)=v². No inverse of 2 or positive-degree F is needed. | None |
| 7.5 Positive-degree F | p=2,3; τ₂(T), V₂(T), τ₂(T)²; m=1 | θ₂V₂(T)=dT; θ₂(τ₂(T)²)=2T³dT by F-semilinearity. The level-one boundary has no prime step. | R01 prerequisite |
| 7.6 Differential ghosts | i=0,1; m=1,2 | V₂ has ghost coefficient 2 in degree zero and 4 in degree one; level one gives the identity DGA map. | None |
| 7.7 Differential base change | Identity; m=1; localization at T | The unique extension gives d(T⁻¹)=−T⁻²dT. A coefficientwise zero differential would not descend through tensor balancing. | R01 prerequisite |
| 8.2 Framed γ | r=0,1; base with zero divisors; localization frame | hT remains regular under étale flat base change. γ(T²)=q²T²; γ(T⁻¹)=q⁻¹T⁻¹ also exists for a nonfinite frame. | R03 |
| 8.3 Jackson derivative | n=0,1,2,3; q=1; characteristic 2; T⁻¹ | D(T)=1, D(T²)=(1+q)T; D(T⁻¹)=−q⁻¹T⁻². n=0 uses D(1)=0, not a negative-power convention. | R03 scope |
| 8.4 Framed complex/product | r=0,1,2; q=1; T² | d_H(T²)=(q²−1)T dT and dT·T=qT dT. The ordered wedge and skew action give the required Leibniz sign. | R01/R03 |
| 8.5 Framed Frobenius | p=2,3; h,T,dT; r=0 | At p=2, φ(h)=2h+h²; H sends dT to T dT, while C needs (1+q)T dT. | R03 scope |
| 9.2 Frobenius decomposition | r=0,1; α=0,1; p=2 | Ring basis 1,T and form basis T dT,dT agree. Zero exponent never introduces T⁻¹; scalar differential description is after quotienting. | R03 scope |
| 9.3 Two-term cohomology | α=e=0; e=α; p=2,α=1,e=0; two factors | Kernel (h+2)S and cokernel S/(h) are ℤ₂. The tensor split is over S, with polynomial quotient rather than division by a zero divisor. | R01/R03 |
| 9.4 Framed Bockstein | m=1,2; r=0,1; nonregular f=0 control | β₁(T)=dT; β₂([T²])=[T dT] survives q=1. Termwise regularity makes the cycle-lift formula independent of choices. | R01/R03 |
| 9.5 Framed cohomology system | m=1,2; polynomial frame; r=0 | T² is a cocycle modulo q²−1 and commutes with dT there; T is not a cocycle. The Bockstein, not the quotient differential, gives de Rham at m=1. | R01/R03 |
| 9.6 Simultaneous induction | α=0,1; p=2,3; T dT mod 2 | F₂dτ₂(T)=T dT gives the small Cartier lift. Quotienting only by im V leaves dV; the displayed induction has no forward target edge. | R01/R03 |
| 9.7 General smooth comparison | m=1,2,6; p=2,3; toric base; R=0,A | At m=6,p=2 the twists are ψ₂ and ψ₆. Tensoring twice over A[q] instead of C_α creates extra Tor₁. The full functorial E∞ scope matches Proposition 4.2. | R01/R03 |
| 10.1 Smooth integer torsion | R=A; m=1; nonsmooth ℤ[x]/x² | Ω¹ of the nonsmooth example has nonzero 2-torsion x dx. For smooth coefficients FV=n proves V-injectivity. | R01; use R03-corrected frames |
| 10.2 Difference torsion/completion | m=1,2; R=A; flat polynomial base change | At m=1, h annihilates everything and completion is identity. h(q+1)=0 at m=2 is compatible with integer torsion-freeness. Bounds remain degree/index dependent. | Use repaired suppliers/frames |
| Cyclotomic interface | m=1; equal indices; p∣d | Empty prime generators would fail at m=1; distinct-factor qualifications and radicals are necessary. | R01 |
| Ordinary de Rham/Cartier interface | Rank zero; characteristic 2; imperfect base | Alternation and the relative Frobenius twist cannot be discarded. Degree-one Kähler bases alone are insufficient. | R01 |
| Unbounded completion interface | ℤ[q] with zero differential in every integer degree; p-torsion and unbounded h-torsion controls | The unbounded torsion-free example is allowed. The controls fail the explicit term/cohomology torsion hypotheses. | R01 |
| Prismatic/PD interface | α=0,1; p=2; nonfinite localization frame | The α=0 décalage product is empty; the comparison requires the bounded prism and smooth formal input stated in the source. | R01/R03 |
| Generic Bockstein interface | f=g=h; f=h²,g=h; f=0 | From dx=gy, d((f/g)x)=fy gives Fβ_fV=β_g. f=0 is not regular on a nonzero term. | R01 |
| Differential-ideal quotient interface | J=0,P,(T),(T,dT) in ordinary de Rham | (T) is not d-stable, while (T,dT) is. The quotient must use a differential ideal, not an ordinary graded ideal alone. | R01 |

### Duplication audit by object

Pinned declarations were located with GitHub code search and then read at the manifest commits, not accepted from the search index's default-branch result. The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Object | Evidence inspected | Disposition |
| --- | --- | --- |
| p-typical sequence/ring/truncation | `Mathlib/RingTheory/WittVector/Defs.lean:52`, `WittVector.ext` at line 77; `Basic.lean`, `WittVector.map`, `ghostMap`, `ghostComponent`, `ghostComponent_apply`; `Truncated.lean`, `TruncatedWittVector`, `instCommRing`, both truncate APIs | Already imported by name. Big divisor-closed vectors and their reindexing comparison are different targets. |
| p-typical F, V and τ | `Mathlib/RingTheory/WittVector/Frobenius.lean:218`, `ghostComponent_frobenius` at line 240, `frobenius_eq_map_frobenius` at line 270, `frobeniusEquiv` at line 283; `Verschiebung.lean:109`, injectivity at line 154; `Teichmuller.lean:93`, ghost formula at line 124 | Existing p-typical operators are cited, not reconstructed as new p-typical objects. The characteristic-p and perfect-ring qualifications are kept. |
| p-typical adic topology | `TauCeti/RingTheory/WittVector/Complete.lean:197`, `WittVector.isAdicComplete_span_p_teichmuller`; `TauCeti/RingTheory/WittVector/Frobenius.lean:65` and line 79, continuity of F and its inverse | Correct import boundary. These do not supply the relative étale coefficient map of Layer 6. |
| Cyclotomic products | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337`, `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`; line 357, `prod_cyclotomic_eq_geom_sum` | The polynomial identities are already consumed. The stronger ideal/intersection/completion package remains R01. |
| Étale coordinate differentials | `TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`, `TauCeti.kaehlerBasisOfFormallyEtale` and its evaluation law, with commutative scalar tower and formal étaleness | Degree-one basis transport is imported. It does not supply exterior differential algebra or Cartier. |
| Bocksteins | `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean:92`, `TauCeti.explicitBockstein1`; `Integral.lean:136`, `TauCeti.integralBockstein` | These have continuous group-cohomology domains/codomains. They do not duplicate the regular-parameter DGA theorem. |
| Scalar versus commuting-action Koszul | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516`, §0.K.1 | Scalar complex, tensor formula and null-homotopies are supplied. Section 1.7 explicitly adds the general module-action/cochain bridge. |
| Derived operations and completions | DerivedModuleAlgebra §§0.2, 1.1–1.3, 1.5, 1.7–1.9; EnhancedDerivedSheaves §0.3 and E5:abstract | Imported operations are not replanned. The additional unbounded completion/cohomology theorem is unowned, not supplied by the finite-cohomology theorem. |
| DG algebra carriers | `TauCetiRoadmap/DGAInfinity/README.md:293`, Layer 1 | Associative carriers, signs, maps and cohomology are supplied. Graded commutativity and odd alternation are explicit conditions in §7.1. Quotients and Bocksteins require R01. |
| Frobenius and infinitesimal lifting | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1484`, §0.23a; line 1801, §0.29; line 5006, §4.1 | Étale invariance, relative scheme Frobenius and lifting are named imports. Characteristic-p perfection is distinguished from arithmetic Λ-perfection. |
| Integer localization/prime completion on spectra | `TauCetiRoadmap/GeneralizedCohomology/README.md:878`, G3.9 | It supplies spectral localization/completion. It does not state the arbitrary-complex finite-prime fracture square of §1.8 as a separate target in the inspected text. |

Object searches across active/completed main roadmap READMEs and the available packages found no competing general arithmetic Λ/q-Witt or Jackson-calculus owner. The three representative roadmap shapes read were DerivedModuleAlgebra, DGAInfinity and EnhancedDerivedSheaves. The target has the required summary, ownership, conventions, supplier, build, layer, consumer and reference sections; no target-numbering table or Hypotheses/API/Tests/Sources field catalogue replaces its prose.

Both named open roadmap heads were independently retrieved and their scope and relevant object occurrences read:

- ArithmeticDynamics: head `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, README blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`. Its cyclotomic uses concern dynatomic power maps and import the existing polynomial identities. They do not supply cyclotomic integral intersection/completion or q-Witt theory.
- ErdosProgressionPowers: head `e101259371172a32b3dd13e926676ae33b6af5cd`, README blob `4c16df24893ccac630ed2aeb61b0a4dc617520a0`. Its scope is progression powers, Frey curves, characters and analytic bounds; no relevant q-Witt, Λ-coalgebra, Jackson or DGA Bockstein target was found.

These are a bounded object audit with explicit positive declarations, not an exhaustive absence theorem for every declaration at either pin. Search returned a manifold de Rham candidate from the newer Tau Ceti default branch, but its pinned file fetch was 404; it was not treated as an available supplier.

### Supplier order and dependency-gate output

I read all **52 Needs lines**, all ten layer dependency lists, all seven roadmap supplier records and all six gap records. Actual cited sections in DerivedModuleAlgebra, DGAInfinity, EnhancedDerivedSheaves and SchemeAndStackFoundations exist and have the roles described above. None cites QWittVectors back as a prerequisite. The three absent named suppliers have positions earlier than the intended consumer, but there is no registered consumer position. The generic Part II suppliers are neither available nor registered. No ownership was moved and no supplier/order file was edited.

The prescribed gate was run against `packages/QWittVectors/README.md`. It exited **1** before producing a dependency summary because that file does not exist. Its terminal exception, with the file rendered repository-relative, was:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/QWittVectors/README.md'
```

The machine-path traceback is omitted to comply with the report path rule. No result was inferred from that failed invocation. The diagnostic invocation with only the README argument changed to `packages/QWittVectors/design/README.md`, the same name and `merge-order/ORDER.txt`, exited **1** and printed exactly:

```text
NOT IN ORDER: QWittVectors (insert it after its last supplier)
depcheck: 3 roadmaps, 12 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. No false positive is alleged. The six unowned mathematical inputs and missing registration prevent a complete supply certificate despite the acyclic internal target graph.

## Not verifiable

- **Round-2 review completeness:** `packages/QWittVectors/reports/REV-DESIGN-QWittVectors~2.md` is absent. The finding-by-finding reconciliation above covers the repair report's F01–F03 and the available round-1 report, without pretending to have read the missing report.
- **Lean elaboration:** **not available**. No `Suggested.lean` exists in this package and the brief supplies no usable elaboration command. No Lean command was run. Import form, elaborated binders, README/Lean generality, proved example mirrors, and “sorry is the only warning” cannot be certified. The design contains no Lean data definition or option override to inspect. A missing design-stage Lean file is recorded as unavailable, not as an invented build failure.
- **External supply:** the six actual contracts in R01 are unavailable. Their mathematical sources are readable; the obstruction is ownership, not legal access. No missing-reference manifest entry is needed for these already available texts.
- **Package-level gate:** the prescribed input README does not exist. The design diagnostic also fails registration, as recorded in R02.
- **Exhaustive pinned-library absence:** no local pinned library checkout is supplied. Search candidates were checked at the pins; negative default-branch searches alone cannot certify absence across every pinned file. The newer manifold de Rham file returned 404 at the Tau Ceti pin and was excluded. The positive imported declarations above were readable.

All sampled source passages were readable. No new legal-source request remains outstanding. The only deliverable writes are this report and `packages/QWittVectors/design/review.json`; scratch records preserve the worklist and validation outcomes.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "38d2c9c66f9022dd2033b3ea08f9534b634f67c8", "job": "REV-DESIGN-QWittVectors~3", "model": "gpt-6-astra", "worker": "chris-1"} -->
