# Review of ModularCharactersAndBlocksPartII (design, round 4)

**Verdict:** needs changes

Seven findings: two P1, three P2, two P3; five blocking. The two round-3 findings are repaired, as checked below. The additional findings concern the present design and its suppliers at their present heads. The scope is a legitimate Part II and is repairable.

## R01 (P1) — The maximal-ideal criterion is false at zero

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:175`, Conventions: “`q ∈ m` exactly when `ν_p(q) > 0`.” The Mathlib contract at line 209 imports `padicValRat`.

**Claim:** The stated criterion holds for every rational `q`, with the pinned integer-valued valuation.

**Witness:** `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:144`, `padicValRat.zero`: `padicValRat p 0 = 0`. For `p = 2`, `0 ∈ 2ℤ₂` is true, whereas `0 > 0` is false.

**Repair:** Specify `ν_p(q) = padicValRat p q` and write `q ∈ m ↔ q = 0 ∨ 0 < ν_p(q)`, or restrict both rational-valuation criteria to nonzero rationals and state zero membership separately. Add the zero Check, alongside `3/2` and `2/3`. The repaired criterion gives true, false, true respectively for membership in the maximal ideal. Do not import Martínez's convention `ν(0) = ∞` into an integer-valued function: martinez line 739 explicitly uses that different convention. Positive character degrees and class sizes used in §6.2 are nonzero, so its inequalities survive this repair.

## R02 (P2) — A prohibited supplier replaces an existing permissible owner

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:286`, supplier subsection, and lines 388 and 568: “`LocalFiniteGroupTheory L3`” and “`LocalFiniteGroupTheory L1`”; `packages/ModularCharactersAndBlocksPartII/design/plan.json:101`, 408 and 1858.

**Claim:** LocalFiniteGroupTheory may supply the fixed-point and complement-conjugacy inputs.

**Witness:** The binding brief expressly prohibits LocalFiniteGroupTheory as a supplier. On main, `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:3304`, IG.3.4, already owns conjugacy of coprime complements with the same solvability alternatives.

**Repair:** Replace the L1 citation by InverseGaloisAndArithmeticFundamentalGroups IG.3.4, target *Conjugacy of coprime complements*. For §1.2, give the direct stabilizer/complement route using that target and Mathlib `Subgroup.exists_right_complement'_of_coprime`: for a transitive compatible action, the stabilizer in `Γ ⋊ S` surjects onto `S`; split its normal Hall kernel and conjugate the complement to `S`. Apply the same conjugacy argument inside a point stabilizer for transitivity on fixed points. Apply this route to classes and to the `H`-action on `gH`. Replace all L3 supplier references, the contracts, layer dependencies and plan edges; no new general Glauberman-lemma target is needed here. Preserve `S` or `Γ` solvable. IG.3.4 is on main and is permitted.

**Repair test:** For `Q₈ ⋊ C₃`, the fixed classes and centralizer classes both number two; for `A₅` on `𝔽₇⁵`, the kernel groups in the stabilizer argument are solvable and the quotient may be nonsolvable, giving the seven constant vectors. For §3.1, the quotient is cyclic, so the conjugacy theorem applies to the order-three complements in `SL(2,3)`. This preserves both alternatives without using the prohibited roadmap.

## R03 (P3) — The two-series Check is outside the coprime domain

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:675` and 711: “`S = C₆ = C₂ × C₃` acting on `Q₈ × C₅`”; plan tests at `packages/ModularCharactersAndBlocksPartII/design/plan.json:643` and 717.

**Claim:** These are two evaluations of the composition-series correspondence of §§4.1 and 4.3.

**Witness:** `gcd(6, |Q₈ × C₅|) = gcd(6,40) = 2`. Moreover the `C₂` step acts on a group containing `Q₈`, so even that step lacks coprimality. The declared correspondence is unavailable.

**Repair:** Replace this example everywhere by `S = C₁₅ = C₃ × C₅` on `Γ = Q₈ × C₁₁`: `C₃` acts on `Q₈` as before, and a generator of `C₅` sends `r` to `r³` in `C₁₁`. Compare the series through `C₃` and through `C₅`.

**Repair test:** `gcd(15,88) = 1`; the powers of `3` modulo `11` are `3,9,5,4,1`, so the latter action has order five and fixed subgroup `1`. The common fixed subgroup is `{±1} × 1`. The first series gives `sgn → sgn × 1 → χ₂ × 1`; the second gives `sgn → χ₂ → χ₂ × 1`. Every factor action is now coprime.

## R04 (P3) — The permutation Check omits the identity element

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:422`: “each single element fixes four of each”; the same Check appears in `packages/ModularCharactersAndBlocksPartII/design/plan.json:158`.

**Claim:** Every element of the displayed `C₂ × C₂` fixes four vectors and four characters of `𝔽₂³`.

**Witness:** The identity fixes all eight vectors and all eight characters. Explicit enumeration gives fixed counts `(8,8), (4,4), (4,4), (4,4)` for `1,a,b,ab`; simultaneous fixed counts are `(2,4)`.

**Repair:** In both README and plan, say “each nonidentity element fixes four of each; the identity fixes eight of each.” Keep the simultaneous fixed counts `2` and `4`. The corrected sentence agrees with both directions of the permutation lemma and retains the intended counterexample to whole-group fixed-count equality.

## R05 (P1) — General covering and domination are attributed to narrower base sections

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:280`, 282, 974 and 1024; in particular “for `N ⊴ G`, `B` covers `b`” and “dominated by a block `B` of `G` (base §8.1)”. Plan targets 7.2 and 7.3 carry the same supplier edges.

**Claim:** Base §§8.1 and 8.2 supply domination and the covering criterion for arbitrary normal subgroups.

**Witness:** At #1775, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:834` assumes a normal `p`-subgroup; line 848 assumes a normal `p'`-subgroup, including its covering clause at line 851. Neither paragraph states the arbitrary-normal-subgroup contract claimed here.

**Repair:** Preserve the generality of §§7.2–7.5. Declare two precise base-supplier gaps, in both README and plan, and use their gap edges until supplied:

- Base §8.2: for arbitrary `N ⊴ G` in a splitting modular system, `e_B e_b ≠ 0` is equivalent to the ordinary-character covering criterion, including the “every `χ ∈ Irr(B)`” formulation with conjugates of `b`.
- Base §8.1: for arbitrary `N ⊴ G` and quotient map `π : k[G] → k[G/N]`, every block idempotent `e_b̄` of the quotient has exactly one block idempotent `e_B` with `e_b̄ π(e_B) = e_b̄`. This supplies general domination and its image criterion.

Alternatively add these genuine generalizations as targets here, explicitly importing the base's special cases, but do not continue calling them existing base contracts. Each new definition would need its API and Checks.

**Repair tests:** The repaired §7.2 Check uses `S₄ ⊵ A₄` at `2`, with `|A₄| = 12`, neither a `2`-power nor odd. It has one block on each side, and `e_B e_b = 1`. For domination take `G = S₃ × C₂`, `N = S₃ × 1`, `p = 2`: `|N| = 6` is neither kind. The two block images in `k[C₂]` are `1` and `0`, since the principal-block augmentation is `1` and the defect-zero-block augmentation is `0`. The unique quotient block is dominated by the former only. These are the general cases the stated supplier sections do not cover. This is supplier drift, not a counterexample to the mathematical theorems.

## R06 (P2) — Algebraically closed APIs are still consumed over splitting fields

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:178`: “`ω_χ : Z(K[G]) → K` is `TauCeti.Representation.centralCharacter`”; line 277 and §§6.4, 7.6, 9.2 consume base `brauer_first_main` for the splitting residue field.

**Claim:** These named APIs are available directly for the arbitrary splitting system of Conventions.

**Witness:** `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean:82` requires `[IsAlgClosed k]`. At #1775, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:753` states `brauer_first_main` over an algebraically closed field. `K = ℚ₂(ζ₃)` and `k = 𝔽₄` satisfy neither hypothesis.

**Repair:** Describe the ordinary central character over `K` as the transported class-sum formula through the fixed cyclotomic embeddings, and apply the native central-character theorem over an algebraic closure or over `ℂ`; state the comparison used in §6.1 explicitly. Do not identify the `K`-valued map with a native declaration whose binder excludes `K`. For first main, add the precise missing base §7.1 contract for fields splitting `G` and its subgroups (as a declared gap), or add a named scalar-extension/descent comparison target here preserving block idempotents, Brauer projections and defect groups and use it to descend the algebraically closed theorem. Merely extending scalars without this comparison does not discharge the hypothesis. Keep all splitting systems in scope.

**Repair test:** At `p = 2`, `G = S₃`, `K = ℚ₂(ζ₃)`, `k = 𝔽₄`, the central values on the transposition class are `3,−3,0`, with reductions `1,1,0`. The block of `C₂ = N_G(C₂)` corresponds to `B₀(S₃)`, and both height-zero counts are two. Over an algebraic closure these values and the two block idempotents remain the same. The required comparisons recover these valid conclusions while making the actual supplier hypotheses explicit. This is the algebraic-closure pattern identified by the last repair, now in two remaining contracts.

## R07 (P2) — The defect-class object has two owners

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:46` claims ownership of “defect classes”; line 856 introduces the predicate `a_B(𝒞) λ_B(𝒞⁺) ≠ 0`. Its contract at lines 267–269 simultaneously imports the base's characterization using that same object.

**Claim:** Part II introduces defect classes after consuming the completed base defect-group theory.

**Witness:** At #1775, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:680` already requires agreement with defect classes and central characters, citing Martínez Definition 3.2. That characterization necessarily uses this same predicate, not a different kind of class.

**Repair:** Make the base §6.2 the sole owner of the defect-class predicate and the characterization it already plans. Delete Part II's claim to introduce that definition; import it in Scope and ownership and the supplier contract. Keep genuinely additional §6.1 results, such as Osima's formula, and phrase their consequences on the imported object. Mirror ownership in the plan. The base cannot depend on a definition first owned by its consumer.

**Repair test:** In `S₃` at `2`, the principal block has coefficient/value products `1·1 = 1` at the identity and `1·0 = 0` at the three-cycle class; the defect-zero block has `0·1 = 0` and `1·1 = 1`. Both roadmaps select exactly the same classes and Sylow centralizers. No new variant needs a second definition.

## Verified sound

### Previous findings, checked first

- **Round-3 F01 — repaired.** README lines 994–999 now say “the restriction of a simple module to a normal subgroup is semisimple” and name `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` and `Rep.indResAdjunction`. The former, at `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean:327`, has finite dimension, irreducibility, a field and normality, but no invertible-order or algebraic-closure hypothesis. The latter, `Mathlib/RepresentationTheory/Induced.lean:155`, is induction left adjoint to restriction over a commutative ring. Both appear in the contracts, plan 7.2 and layer dependencies. The revised use of ordinary `clifford_restrict_character` is explicitly over `ℂ`. The new `S₄ ⊵ A₄` Check is numerically correct; the remaining general-covering supplier problem is R05, not a failure of either repaired native input. The fix report correctly rejects the previous review's proposed algebraically closed substitute for this modular step.
- **Round-3 F02 — repaired.** Plan 1.2 no longer has `target:1.1`; its remaining inputs match README line 388. Plan 4.1 now contains `mathlib:MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)`, exactly the instance at `Mathlib/GroupTheory/GroupAction/OfQuotient.lean:62` and the README at line 667. `QuotientGroup.mk` is absent. Layer 7 Dependencies now includes base §2.4, matching §7.2's decomposition-map use.

No round-3 finding was marked not actionable. Pattern searches covered all Clifford/reciprocity uses, the valuation convention, all two-series examples, and all supplier and `*Needs:*` passages. R06 records the remaining algebraic-closure mismatch rather than reversing the valid modular-restriction repair.

### Principles, structure and scope

Read the entire README and the 35 plan targets, their hypotheses, APIs, prerequisites and 110 plan Checks. The two repaired targets agree with the README. Nine layers each end with Examples and Dependencies; all 35 targets have source locators and a `*Needs:*` paragraph. The definition/construction sections have prose APIs and at least three Checks; R03–R04 identify failures within those Checks. The existing design is an extension of ModularCharactersAndBlocks, not a replacement of it; R07 is a localized ownership conflict. The action strand allows arbitrary finite groups subject to its stated coprimality/solvability hypotheses, and the block strand does not exclude small primes or ramified systems. No algorithm, source copying, local machine path, pull-request number, `set_option`, or sorry'd data occurs in the roadmap. Character-degree, class-size and index denominators are nonzero; the rational zero exception is R01. Natural-number height subtractions are protected by `a − d ≤ ν(χ(1)) ≤ a`.

Read the main-branch CharacterTheory and InductionRestriction roadmaps as house-style and ownership comparators, and IG.3.4 for the replacement owner. The own names in `plan.json` are planned names, not claims that a design-stage Lean file declares them. README backticked library names and base declarations resolve as recorded below; no own declaration catalogue has been substituted for acceptance theorems.

### Sources: all 15 seeded targets

The fifteen sampled sections were checked against the cached source text, including hypotheses and the page containing each locator. No author-marked unverified locator occurs in the plan. Fifteen works are recorded under distinct manifest keys: ten available texts and five settled uncertified works. Both manifests parse, and the named sources are covered by their entries. No source was fetched or manifest entry changed.

| Target | Text and locator actually read | Result |
|---|---|---|
| 1.1 | glauberman line 94, printed p.1467; hartley-turull line 302, printed p.182 | Inverse-action convention and invariant characters agree; the definition itself needs no coprimality. |
| 1.2 | glauberman lines 287–298, Lemma 3(a)–(c), printed pp.1471–1472 | All three class/coset statements occur. The design's solvability alternative is explicit. Supplier repair R02 does not alter them. |
| 4.3 | glauberman lines 537–600, Theorem 4(b),(c), printed pp.1478–1479 | Cyclic agreement and independence, including the Sylow/Hall decomposition and intersection-of-first-terms route, agree. The example fails separately, R03. |
| 4.4 | glauberman lines 601–629, Corollaries 7–9, printed pp.1479–1480 | Equivariance, bijectivity and both counts are supported for solvable coprime action. |
| 4.5 | glauberman lines 540–543 and 601–629, printed pp.1478–1480; spath-vallejo lines 118–130, printed pp.278–279 | Construction, unique prime-to-`p` multiplicity and compatibility support the stated uniqueness induction. Navarro's separate uniqueness formulation remains uncertified. |
| 6.1 | martinez lines 351–373 (pp.9–10), Proposition 2.3 line 414 (p.11), Proposition 2.5 line 512 (p.12), Corollary 2.7 line 566 (p.13), lines 699 and 760 (pp.17,19) | Central values, Osima's formula without a missing conjugation, integrality, connectedness and `p`-regular defect classes agree. R06–R07 concern API/ownership, not these formulas. |
| 6.2 | martinez Theorem 3.4 line 728 (p.18), proof lines 783–831 (pp.19–20); mnst lines 51–55 (preprint p.2) | Exact common degree divisibility and attainment agree. Read both inequalities of the proof; all its rational quotients are nonzero. |
| 6.4 | martinez §3.2 line 718 (p.18), Theorem 2.8 line 583 (p.14) | Principal-block height criterion and defect-zero criterion agree; source's height-definition misprint is not imported. Correspondent generality is R06. |
| 7.1 | martinez Theorem 3.3 lines 710–713 (p.18), Lemma 4.4 lines 984–995 (p.25) | Both containments have the right direction; the induced-block conclusion is supported. |
| 7.5 | martinez Proposition 9.1 line 2161 (p.57), Theorem 9.2 line 2222 (p.58), Propositions 9.3–9.4 lines 2267–2284 (p.59), Corollary 9.5 line 2288 (p.60) | Regularity iff induction, centralizer condition, unique covering and Fong's maximal-defect hypotheses all agree. |
| 7.6 | martinez Theorem 8.8 line 1985 (p.53), Theorem 9.6 line 2295 (p.60); sambale Theorem 1.18 line 499 (p.17) | Orbit, defect-group and prime-to-`p` inertial-index clauses agree. |
| 8.1 | martinez Theorem 8.10 line 2011 (p.54) | Vanishing condition is exactly as stated; its cited Navarro proof remains uncertified. The README gives its separate second-main-theorem route. |
| 8.3 | reynolds Theorem 8 lines 531–540 (p.30); martinez Corollary 8.12 line 2131 (p.56), proof of Theorem 9.8 lines 2337–2347 (p.61) | Reynolds supplies the general normal-defect statement; Martínez's Corollary 8.12 alone is only the `P C_G(P)` case. The projective-degree input is correctly declared as a gap. |
| 8.4 | reynolds Theorem 9 lines 542–543 (p.30); martinez Theorem 9.8 lines 2328–2349 (p.61) | Both directions under normality agree. |
| 9.1 | martinez Conjecture 9.7 lines 2321–2322 (p.60); mnst lines 48–73 (preprint p.2); kessar-malle lines 22–26 (preprint p.1); ruhstorfer lines 25–34 (preprint p.1) | Predicate and attribution of the abelian-defect implication, odd-prime converse and prime-two result agree. The sources support the full assertion; the design plans its listed instances only. |

Also re-read the repaired §7.2 route against martinez lines 1652, 1763–1779 and 1790, and the headline locators glauberman Theorems 1–3 and 5, reynolds Theorems 1–2, and sambale Theorem 1.19. The unavailable books were not guessed or requested again. Preprint citations above identify the version actually available; no comparison with unavailable published page numbering is claimed.

### Computed adversarial pass

The prior round has numerical rows for the untouched targets. I relied on those rows only for their actual computed cases, and read the surrounding design again. The following table recomputes the present sample, headlines, repaired passages and every mathematical finding. In particular it expands the earlier convention row to zero and the composition-series row to the coprimality hypotheses. It does not infer truth from a hypothetical sorry build.

| Statement | Instances tried | Values on each side | Result and change |
|---|---|---|---|
| Conventions: valuation | `p=2`, `q=0,3/2,2/3` | `ν=0,−1,1`; maximal-ideal membership `true,false,true`; `ν>0` is `false,false,true` | First equivalence fails at zero; R01. Repaired disjunction gives `true,false,true`. |
| 1.1 action, invariant set, pairing | `C₇` with `r↦r²`; `Q₈` with `C₃`; trivial action | Inverse exponent `4`, character value `ζ₇⁴`, versus wrong `ζ₇²`; `χ(1)=1` before/after and self-pairing `1=1`. On `Q₈`, invariant degrees `1,2`, two invariant characters; fixed subgroup `C₂`, two characters. Trivial action fixes all. | Sign/direction and carriers correct. |
| 1.2 fixed classes and cosets | `Q₈,C₃`; `A₅` on `𝔽₇⁵`; noncoprime swap on `𝔽₂²`; inner `C₂` on `S₃` | `2=2` classes; constants give `7=7`, and `5(3c)=c` in `𝔽₇`; swap-fixed coset `{(1,0),(0,1)}` has zero fixed points; inner action fixes three classes but centralizer has two | Statements and negative controls correct; supplier R02. |
| 1.3 permutation and orbit counts | `a=1+E₁₂,b=1+E₁₃` on `𝔽₂³` | For `1,a,b,ab`, fixed vectors/characters `(8,8),(4,4),(4,4),(4,4)`; whole-group fixed sets `(2,4)`; both orbit counts `(8+4+4+4)/4=5` | Theorem holds; identity Check repaired by R04. |
| 2.2 canonical extension, headline | `Q₈⋊C₃`; trivial character of `C₃⊴S₃`; trivial action | Eigenvalues `ω,ω²`: trace `−1`, determinant `1`; twist by `ω` has determinant `ω²≠1`. On `S₃`, trivial extension has determinant `1`, sign has `−1`. Product extension is `χ×1`, degree `χ(1)`. | Normalization excludes the wrong extension. |
| 2.4 Gallagher, headline | `SL(2,3)` over `χ₂`; `Q₈` over faithful character of its centre; `N=G,1` | Three quotient characters give three degree-two extensions. For `Q₈`, no extension exists: one character lies over the faithful central character but quotient has four irreducibles. `N=G`: singleton; `N=1`: identity. | Extension hypothesis is essential and present. |
| 3.1 cosets and complement route | `S₃=C₃⋊C₂`; `SL(2,3)`; `A=1` | Three transpositions give one coset class, centralizer size `2=2·1`. In `SL(2,3)`, two coset classes of size `4`, centralizer `6=3·2`; `(a(−1))⁴=a`, order `3`. `A=1` gives ordinary classes. | Formulas hold; replace supplier under R02. |
| 4.1 construction and 4.3 independence | Original `C₆` on `Q₈×C₅`; replacement `C₁₅` on `Q₈×C₁₁` | Original gcd `2≠1`, so no legal `Λ_C` instance. Replacement gcd `1`; `ord₁₁(3)=5`; both chains end at `χ₂×1` from `sgn`; fixed subgroup order `2`. | R03; both repaired values equal on the declared domain. |
| 4.2 prime-power characterization, headline | `Q₈,C₃`; extraspecial `3³,C₂`; trivial action | Multiplicities `2` and `3`: `(2−(−1))/3=1`, `(3−1)/2=1`; all other multiplicities zero. Trivial action: `(1−1)/p=0`. | Correct with sign, including `p=2`. |
| 4.3 cyclic agreement | Faithful `C₉` action on `C₁₉`; trivial action | `gcd(9,19)=1`, fixed subgroup `1`, only invariant character `1`; cyclic and chain correspondences both `1↦1`. Trivial action gives `χ↦χ` for every chain. | Correct, apart from R03's separate Check. |
| 4.4 equivariance and count, headline | `Q₈,C₃`; extraspecial `3³,C₂`; `C₇,C₃`; inversion of `C₇` in `C₇⋊C₃` | Counts `2=2=2`, `3=3=3`, `1=1=1`; last example fixes three linear characters, swaps the two degree-three characters, and fixes three classes, matching `Irr(C₃)`. | Counts and equivariance agree. |
| 4.5 unique compatible family, headline | Swap on `C₃×C₃`; `Q₈,C₃`; noncoprime swap on `C₂²`; `S=1` | `(ψ_a×ψ_a)(r,r)=ζ₃^{2a}`, so correspondent `ψ_{2a}`, multiplicity `1`, versus wrong `ψ_a`. For `χ₂`, distinguished multiplicity `2≡−1 mod 3`, other `0`. In `C₂²`, both invariant characters restrict to `1` with multiplicity `1`, preventing bijectivity. `S=1` forces identity. | Correct; the constituent property rules out arbitrary bijections. |
| 4.6 automorphisms, fields, constituents, headline | Swap on `C₃²`, inversion and `j=2`; `Q₈,C₃` | Both inversion paths give `ψ_{−2a}`; both power paths give `ψ_{4a}=ψ_a`. `ℚ(χ₂)=ℚ=ℚ(sgn)`; constituent multiplicity `2≠0`. | Correct. |
| 5.1 degree relation, headline | `Q₈,C₃`; extraspecial `3³,C₂`; trivial action | `2∣4·1`, quotient `2`; `3∣9·1`, quotient `3`; trivial action `n∣1·n`, quotient `1`. Reverse inequality fails for trivial character when index `4`: `4∤1`. | Correct divisibility direction. |
| 6.1 central values, Osima, defect classes | `S₃`, `p=2`, principal and degree-two blocks | Principal coefficients at `1,r,t`: `1/3,1/3,0 → 1,1,0`; central values `1,2,3 → 1,0,1`. Degree-two coefficients `2/3,−1/3,0 → 0,1,0`; central value at `r` is `−1→1`. Osima at `g=1,x=r`: `1+1=2=(1+sgn)(r)`. `{1}` alone gives coefficient `1/6∉ℤ₂`. | Formulas correct; API/ownership R06–R07. |
| 6.2 Brauer heights, headline | `S₃` at `2`; `A₅` at `2`; `SL(2,3)` at `3` | Principal `S₃`: `a=d=1`, minimum degree valuation `0=1−1`; defect-zero degree `2`: `1=1−0`. `A₅` principal degrees `1,3,3,5`, minimum `0=2−2`; degree-four block `2=2−0`. Degree-two block of `SL(2,3)`: `ν₃(2)=0=1−1`; degree-three block `1=1−0`. | Bound and attainment both hold. |
| 6.4 special blocks | Same `S₃,A₅`; correspondent in `A₄` | `Irr₀(B₀(S₃))={1,sgn}`, two odd degrees. `A₅`: four odd degrees; `A₄`: degrees `1,1,1,3`, all valuation zero, and `|A₄:V₄|₂=1`. Defect-zero degree `2` in `S₃`: `2₂=|S₃|₂=2`, height `0`. | Arithmetic correct; first-main field contract R06. |
| 7.1 Min–Max, both directions | `S₃` at `2,3`; `G=1` | At `2`, principal `λ(t)=1`, `D_t=C₂` contains a defect group; coefficient at `r` is `1`, `D_r=1≤C₂`. At `3`, `λ(t)=0` and `λ(r)=2≠0`, `D_r=C₃=D_B`. For `G=1`, both groups have order `1`. Induction `C₃→S₃` at `2` for `{λ}` gives defect `1≤1`. | Correct containments. |
| 7.2 repaired modular step | `S₄⊵A₄`, `p=2`, splitting `k`; nonnormal `C₂≤S₃` | `Res W=λ⊕λ̄`, `dim Hom(λ,Res W)=1`, `dim Ind λ=2=dim W`, character `(2,−1)`. `|A₄|=12=0` in `k`. For nonnormal `C₂`, a nontrivial unipotent has `(t−1)²=0` and `t−1≠0`, so restriction is not semisimple. | Repaired pins apply exactly with normality; general block covering contract still R05. |
| 7.2 covering criteria and idempotents | `S₃⊵C₃`, `p=2`; `N=1,G`; `S₄⊵A₄` | `ω_std(r+r²)=−1=ζ₃+ζ₃²`; trivial value `2≠−1`. In residue characteristic two, `e_λ+e_λ̄=r+r²=e_std`, product with `e_B₀=1+r+r²` is zero. `N=1`: all blocks cover; `N=G`: product nonzero iff equal. `S₄,A₄`: one block each, product `1`. | Both iff directions work; R05 supplies missing general input. |
| 7.3 domination | `S₃×C₂`, `N=S₃×1`, `p=2`; `S₃⊵C₃` at `3` | First quotient block images `1,0`; unique quotient block has defect `C₂=DN/N`. Second: one block maps to `1=e₊+e₋` in `k[C₂]`, both quotient defects `1=DN/N`. | Correct; arbitrary-normal supplier gap R05. |
| 7.4 Fong–Reynolds, headline | `S₃⊵C₃`, `p=2`; `S₄⊵V₄`, `p=3`; invariant `b` | `{λ}` induces to `{std}`; heights `0−(0−0)=0=1−(1−0)`. In `S₄`, inertia `D₈`, index `3`, two linear extensions induce to the degree-three characters; valuations `0→1`, defects `0→0`, heights `0→0`. Invariant `b`: index `1`, identity. | Preservation formula holds; input scope R05. |
| 7.5 regularity, unique covering, Fong | `S₃⊵C₃`, `p=2,3`; `N=G` | At `2`, principal central value on transpositions `1≠0`, so not regular; degree-two central value `0`, regular and induced from `{λ}`. At `3`, `P=C₃`, index `|G:PN|=2` prime to `3`, intersection `C₃`. `N=G`: outside set empty and induction is identity. | Both regularity directions and maximal-defect conclusion agree. |
| 7.6 extended first main | `S₃` at `2` and `3`; `S₄`, `p=2`, `P=V₄` | Inertial indices `1` and `2`, giving defect `C₂` and `C₃`. For `S₄`, stabilizer index `24/4=6` is even; induced block has defect `D₈` of order `8`, not `V₄` of order `4`. | Index hypothesis is necessary; field comparison R06. |
| 8.1 vanishing | `S₃` degree-two block at `2`; `SL(2,3)` degree-three block at `3`; principal block | `std(t)=0`, `t₂=t∉1`. Degree-three character on orders `3,6` has value `0`, and those have nontrivial `3`-part outside defect `1`. For a Sylow defect group, every `p`-part lies in a conjugate, so no zero is imposed. | Correct sufficient condition, not an erroneous iff. |
| 8.3 normal-defect height formula | `SL(2,3)` at `2`; `A₄` at `2`; `D×H`, `p∤|H|` | Degrees `1,1,1,2,2,2,3` yield heights `0,0,0,1,1,1,0`, matching constituent degrees `1,2` on `Q₈`. `A₄` gives heights all `0`, matching linear constituents of `V₄`. Product case: `ν(ξ(1)ψ(1))=ν(ξ(1))+0`. | Correct conditional on the declared Clifford divisibility gap and supplier fixes. |
| 8.4 Reynolds, headline | `D₈`; `C₂²`; defect `1`; both directions | `D₈` degrees `1,1,1,1,2` give heights `0,0,0,0,1`, so all-zero and abelian are both false. `C₂²`: four heights zero, both true. Defect `1`: singleton height zero. Degree sum `Σ ξ(1)²=|D|` with all `ξ(1)=1` gives `|Irr(D)|=|D|`. | Both directions agree. |
| 9.1 height-zero predicate and instances | `S₃` at `2,3`; `S₄` at `2`; trivial group | `S₃`: all blocks have cyclic defect and height zero. `S₄`: `a=d=3`, degree `2` has height `1`, defect `D₈` nonabelian, both sides false. Trivial group: one height-zero character, defect `1`, both true. | Predicate correct; no claim that §8.4 covers nonnormal `D₈`. |
| 9.2 Alperin–McKay predicate, headline | `S₃,A₅` at `2`; `SL(2,3)` at `3`; normal defect | Counts `2=2` with normalizer `C₂`; `4=4` with normalizer `A₄`; each defect-one block gives `3=3` with normalizer `C₆`. Normal defect: normalizer `G`, correspondent `B`, identical counts. | Correct; splitting-field first-main contract R06. |
| Existing Clifford gap | `N=G,1`; `Q₈⊵Z`; `S₃⊵C₃`; nonnormal `C₂≤S₃` | Quotients/index divisibilities `1∣1`, `χ(1)∣|G|`, `2∣4`, `2∣2`; nonnormal restriction of `std` has constituent degree `1`, giving `2∤3`. | Normality needed; the declared contract is precise and remains minimal. |

For the untouched material not repeated in this table, round-3 numerical rows remain usable for §§2.1, 2.3, 3.2–3.4, 5.2, 6.3 and 8.2. Their concrete witnesses include determinants `1,−1`, field intersections `ℚ` versus `ℚ(i)`, the signed values `−1,1` on `a,−a`, multiplicity quotients `(2+1)/3=1` and `(3−1)/2=1`, reverse degree divisibility `2∤1`, height lists `{0,1}`, and the `P=1` singleton block. No earlier uncomputed summary was used as evidence of a new check. Zero modules and zero rings are excluded respectively by irreducibility/nonzero hypotheses and by the field/DVR hypotheses; there is no arbitrary topological or geometric carrier in these statements.

### Pins and dependency resolution

The actual manifest pins agree with the plan: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The named APIs were located at these pins, not a current online release. Important declarations and the contexts opened include:

| Pinned file | Declarations and line numbers | Scope or convention checked |
|---|---|---|
| `Mathlib/Algebra/Group/Action/Basic.lean`; `Mathlib/Algebra/Group/End.lean` | `arrowAction`,103; `MulAut.conj`,721 | Pullback by inverse; conjugation sends `h` to `g*h*g⁻¹`. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean`; `OfQuotient.lean` | `FixedPoints.subgroup`, 203; `mem_subgroup`, 208; quotient instance, 62 | Fixed by every element; normality of the quotient subgroup. |
| `Mathlib/GroupTheory/SemidirectProduct.lean` | `inl`,100; `inr`,120; `inl_aut`,138; `rightHom`,151; `range_inl_eq_ker_rightHom`,175 | Conjugation direction and kernel. |
| `Mathlib/GroupTheory/SchurZassenhaus.lean` | `Subgroup.exists_right_complement'_of_coprime`,277 | Existence for normal Hall subgroups; not the general conjugacy supplier. |
| `Mathlib/RepresentationTheory/Induced.lean` | `Rep.indResAdjunction`,155 | Induction is left adjoint; commutative coefficients suffice. |
| `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | `padicValRat`,126; `padicValRat.zero`,144 | Integer codomain, zero sent to zero: R01. |
| `Mathlib/RepresentationTheory/Character.lean`; `Mathlib/Data/ZMod/Basic.lean` | `Representation.isIntegral_character`,102; `ZMod.chineseRemainder`,889 | Finite-group character integrality and coprime CRT. |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean` | `irreducibleCharacters`,114; `mem_irreducibleCharacters_iff`,123; `card_irreducibleCharacters`,181; `characterTable`,337; `sum_characterTable_mul_conj`,585 | The native set consists of characters of irreducible representations on finite coordinate spaces. Its definition does not assume algebraic closure; the count does. |
| `TauCeti/RepresentationTheory/CharacterTable/Pairing.lean`; `Determined.lean` | `characterPairing`,48; `Representation.nonempty_equiv_of_character_eq`,49 | Inverse in second argument, factor `|G|⁻¹`; recognition in characteristic zero. |
| `TauCeti/RepresentationTheory/Induction/Conjugate.lean`; `Inertia.lean` | `char_conjFDRep`,485; `conjNormalFDRep`,683; `conjNormalFDRep_ρ`,836; `inertia`,94; `mem_inertia_iff`,100; `le_inertia`,111 | Conjugate by `g⁻¹`; normal-subgroup inertia. |
| `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean`; `Decomposition.lean` | `isSemisimpleRepresentation_comp_subtype`,327; `clifford_restrict_character`,305 | First is field-general; second has algebraic closure and `IsUnit (Nat.card G : k)`. |
| `TauCeti/RepresentationTheory/Induction/Clifford/Classes.lean`; `Dimension.lean` | `FDRep.cliffordCorrespondence`,125; `clifford_restrict_dvd_finrank`,113; `clifford_restrict_inertia_eq_top_of_coprime`,142 | Ordinary-character applications use `ℂ`. The degree theorem divides out multiplicity and does not prove the declared gap. |
| `TauCeti/RepresentationTheory/Induction/Clifford/Obstruction.lean`; `TensorFactorization.lean`; `ProjectiveCorrespondence.lean` | `IsProjectiveInertiaExtension`,87; `exists_isProjectiveInertiaExtension`,162; `tensorRep`,108; `tensorRepEquiv`,329; `tmulIntertwining_bijective`,149; `isIrreducible_tensorRep_iff`,223 | Opposite factor sets `β,β⁻¹`; ordinary-extension case uses `β=1`. |
| `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean`; `Degree.lean` | `centralCharacter`,89; class-sum identity,162; integrality,180; `finrank_dvd_card`,117 | Algebraic-closure binder at CentralCharacter line 82; quotient form also requires nonzero degree. R06 records the `K`-valued mismatch. |
| `TauCeti/RepresentationTheory/CharacterTable/Cyclotomic/Action.lean`; `FieldOfValues.lean` | `cyclotomicIrreducibleCharacterAction`,172; its `_apply`,201; `FDRep.characterField`,44 | Power-map law; the action's shared-universe restriction is acknowledged in the contract. |
| `TauCeti/RepresentationTheory/CharacterTable/CentralIdempotent.lean`; `ClassSum/Basic.lean`; `ClassSum/Basis.lean`; `VirtualCharacter.lean` | `primitiveCentralIdempotent`,301; `classSum`,31; `classSumCenter`,76; `virtualCharacters`,127 | Existing idempotents, class sums and virtual characters are consumed. |
| `TauCeti/GroupTheory/SemidirectProduct.lean` | `SemidirectProduct.range_monoidHomSubgroup`,33 | Internal/external group comparison. |

The remaining conventional carriers (`FDRep`, `Representation`, `IsIrreducible`, `MonoidAlgebra`, `Subalgebra.center`, `IsDiscreteValuationRing`, `IsAdicComplete`, residue fields, `IsPGroup`, `IsSolvable`, `ConjClasses`, `Sylow`, `LinearMap.det`, cyclotomic extensions, `IntermediateField.adjoin`, `fixedField`, `IsPrimitiveRoot.autToPow`) occur at the pins. `QuotientGroup` in the prose denotes the native namespace/quotient machinery, not a missing theorem. A name-resolution pass reports no missing roadmap citation; its native-name scan is unavailable on this host, so it was not used to assert native existence.

Cross-roadmap sections were resolved anew:

- Main `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md`: §2.1 line 349, §3.5 line 497, §3.6 line 521, §4.3 line 741, §4.4 line 760. Their degree sums, orthogonality, external products, central characters and field-of-values theorem are the objects consumed.
- Main `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`: Layers 1,2,5,7 at lines 241,268,607,721. Read Layer 7's scalar obstruction and projective factorization. It supplies neither the degree quotient divisibility nor a general modular character reciprocity theorem. The single declared `clifford-multiplicity-dvd-index` gap is precise, owned, minimal and present under the same slug in README and plan.
- #1775 `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md`: all cited sections exist, including §§0.2,1.1–1.3,2.1–2.4,3.1,4.1–4.3,5.1,6.1–6.3,7.1–7.2,8.1–8.2. Existence of the headings does not establish the stronger contracts: R05–R07 record the differences.
- #1634 `TauCetiRoadmap/LocalFiniteGroupTheory/README.md`: L1 line 131 and L3 line 186 do contain the named mathematics, but this supplier is prohibited here. Main IG.3.4 supplies complement conjugacy; R02 gives the permitted route.
- #1708 `TauCetiRoadmap/FiniteGroupInvariants/README.md:996`, §6.2, owns the Galois-action permutation statement. Its action is distinct from the automorphism action here, as the scope explains.

The prescribed gate was run against the candidate and returned:

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 234 roadmaps, 2113 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The insertion note is not a finding at the design stage. A zero-problem gate does not override the explicit prohibited-supplier rule or establish missing supplier hypotheses.

### Ownership, overlaps and acceptance-file audit

Read the board package index before searching, and searched main, board README files and the indexed open heads by object: Glauberman, Gallagher, canonical extension, defect classes, Osima, Fong–Reynolds, height zero and Clifford degree divisibility. Open-head inspection used the supplied roadmap tools. The closest roadmaps were read: #1778 GlaubermanZStar, #1775 ModularCharactersAndBlocks, #1777 OddOrderTheorem, #1634 LocalFiniteGroupTheory and #1708 FiniteGroupInvariants. GlaubermanZStar concerns isolated involutions; OddOrderTheorem concerns its local and character analysis; neither owns the correspondence or height theorems here. FiniteGroupInvariants owns the distinct Galois permutation statement. R02 and R07 record the actual ownership conflicts. The native representation-theory trees contain none of the Glauberman, Osima, Fong or block-height end theorems under those object searches.

The supplied overlap report has no conflicting head modifying this roadmap, dropped cited id, or id supplied only by an open revision. Its five closest-roadmap leads were checked rather than treated as instructions. The existing supplier section numbers remain present. No new declaration is assigned a fully qualified name already owned by a readable sibling acceptance file; this design has no acceptance file.

Headline inventory from Summary and How to read the build: normalized/canonical extension (§§2.1–2.2), Gallagher (§2.4), cyclic correspondence (§3.2), prime-power characterization (§4.2), independence/count/unique Glauberman family (§§4.3–4.5), equivariance, fields and constituents (§4.6), degree relation (§5.1), degree-divisibility predicate (§5.2), Brauer heights (§6.2), Min–Max (§7.1), Fong–Reynolds (§7.4), Fong and extended first main (§§7.5–7.6), normal-defect height formula and Reynolds (§§8.3–8.4), and the height-zero/Alperin–McKay predicates with their proved instances (§§9.1–9.2).

This is the design lane: no `Suggested.lean` exists in this package. The one-tactic padding probe, import audit, declaration-by-declaration `#check @name`, signature comparison and sorried-headline completeness test therefore have no file to run on. No Lean command was run. Elaboration: **not available (this lane does not elaborate; say so in the report)**. This is not a passing build claim. At package stage the ordinary-character headlines have native character, action, subgroup, representation and determinant carriers and must be stated with the few necessary real definitions. The block headlines need real block-membership/defect/height predicates on native group-algebra carriers or an explicit per-headline non-statability explanation; no stand-in theorem is justified by this design review. A predicate's definition is not itself a deep acceptance theorem, and its boundary instances must not become padding.

## Not verifiable

- `isaacs`: Theorems 3.12 and 6.32, Corollaries 6.17 and 11.29, Chapter 13; `isaacs-1973`: the out-of-scope odd-order correspondence; `navarro-1998`: Chapter 3 and Theorem 5.9; `navarro-2018`: Chapter 2; `feit`: Chapter IV. These five manifest entries are settled as uncertified and their texts were not available. They were cited by locator and not re-requested. Accessible corroboration is distinguished above from verification of these books themselves.
- Published pagination/numbering beyond the available preprint versions of kessar-malle, mnst and ruhstorfer was not independently compared. The propositions checked are at the listed preprint lines and the manifest records those versions.
- Lean elaboration and one-tactic probes are unavailable in this design lane, with no `Suggested.lean` present. No build or warning claim is made.

## Source issues

The following were checked visually against the cached PDF pages, not inferred from OCR alone. None of the four erroneous formulas is copied into this design.

- **Misprint** in martinez at Theorem 2.6 proof, printed p.13 (martinez line 561): the source says a central character is nonzero on the selected idempotent exactly outside the selected character set; it should be nonzero exactly inside that set; affects the proof.
- **Misprint** in martinez at §3.2, printed p.18 (martinez line 725): the source says height zero means the numerical block defect equals the degree's p-part; it should be the degree's p-part equals p to the group-valuation minus block-defect exponent; affects a stated result.
- **Misprint** in sambale at Proposition 1.17(ii),(iii), printed p.17 (sambale lines 490–491): the source says the restriction multiplicity differs from one; it should be the restriction multiplicity differs from zero; affects a stated result.
- **Misprint** in ruhstorfer at Introduction, preprint p.1 (ruhstorfer lines 27–28): the source says the block is abelian in its informal height-zero equivalence; it should be the defect group is abelian; affects nothing.
