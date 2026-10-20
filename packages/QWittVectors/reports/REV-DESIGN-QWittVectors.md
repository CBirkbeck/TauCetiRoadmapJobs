# Review of QWittVectors (design, round 1)

**Verdict:** needs changes

Reviewed on 2026-10-20. There are eight findings, five blocking (P1 or P2). The design is repairable; I found no existing QWittVectors roadmap being replanned. There was no previous review to reconcile. The design files and the author's source manifest were not changed.

## R01 (P1) — The relative ghost Check reverses tensor balancing

**Location:** `packages/QWittVectors/design/README.md:530`, also target 4.4's first Check in `packages/QWittVectors/design/plan.json:1422`: “At d=m the structural coaction s_m(a) maps to ψ_m(a)⊗1=1⊗a”.

**Claim:** This is the value of the first relative ghost with the right-factor scalar convention of the Conventions paragraph and §2.5.

**Witness:** Take the toric Λ-ring A=R=ℤ[T], m=d=2. Under A⊗_{A,ψ₂}A≅A, r⊗b↦ψ₂(r)b, the asserted two sides become T⁴ and T. They are unequal, also after adjoining ζ₂.

The coaction's ordinary first ghost is a, not ψ_m(a): see hesselholt line 753 and wagner lines 1318–1323. The relative ghost construction is at wagner lines 1565–1582. Balancing in the stated twist gives a⊗1=1⊗ψ_m(a). Thus the Check contradicts the correctly directed headline and `relativeGhost_tmul`, rather than exposing a defect in the source theorem.

**Exact repair:** In both design artifacts replace the first Check by gh₁(s_m(a))=a⊗1=1⊗ψ_m(a). Add the computed toric m=2 value T² and the rejected T⁴=T equality. Keep the right-factor action and the twist direction unchanged. Mirror this tensor-balancing witness in the eventual Lean file using existing tensor-product carriers.

## R02 (P1) — Five indispensable inputs have no actual supplier contract

**Location:** `packages/QWittVectors/design/README.md:60`: “gap:cyclotomic-contract; the cyclotomic and completion section identifiers are absent.” The other four gaps are specified at lines 64, 68, 76 and 80; `packages/QWittVectors/design/plan.json:3070` begins the corresponding gap catalogue.

**Claim:** The build can consume the cyclotomic, ordinary de Rham, cochain-completion, prismatic-Frobenius and multiplicative-Bockstein inputs described there.

**Witness:** HabiroCyclotomicCompletions, DerivedDeRhamCohomology and PrismaticCohomology have no supplied roadmap text; neither proposed Part II exists. DerivedModuleAlgebra §§1.5, 1.8 and DGAInfinity Layer 1 do not state the two requested extensions.

These are explicit, substantive prerequisites, not merely unknown theorem numbers:

| Missing contract | Consumers in this design | Ownership evidence |
|---|---|---|
| `gap:cyclotomic-contract` | §§3.3, 3.4, 3.6, 6.2, 7.5, 9.3, 10.1 | The named earlier roadmap appears in `merge-order/ORDER.txt`, but no section text is available in main or the packages. |
| `gap:ordinary-derham` | §§7.1, 7.7, 8.4, 9.6 | The same problem applies to DerivedDeRhamCohomology. |
| `gap:cohomology-completion` | §9.5 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1808` and `:2006` cover ordinary module comparisons and complete Tor amplitude, not the stated theorem commuting cohomology with completion. |
| `gap:prismatic-frobenius` | §9.6 | No PrismaticCohomology section can be checked against the requested q-PD, framed and iterated décalage package. |
| `gap:dga-bockstein` | §9.4 | `TauCetiRoadmap/DGAInfinity/README.md:293` does not state the regular-parameter multiplicative Bockstein theorem. The proposed Part II is absent. |

**Exact repair:** Bind each residual input to an actual earlier roadmap section/target or pinned declaration, with its hypotheses. Extensions of existing roadmaps must be supplied by actual Part II contracts before this design depends on them; naming a proposed Part II is insufficient. Import existing primitives directly: `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` and `Polynomial.prod_cyclotomic_eq_geom_sum` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`, and `TauCeti.kaehlerBasisOfFormallyEtale` in `TauCeti/RingTheory/Kaehler/FormallyEtale.lean`, already provide parts of the requested material. They do not fill the remaining gaps. Do not replan the suppliers inside this roadmap or treat a paper citation as an ownership contract.

## R03 (P2) — General comparison theory is narrowed to the proof route

**Location:** `packages/QWittVectors/design/README.md:11`: “its framed polynomial instance in 9.6 is exactly the instance the torsion proof uses.” Section 9.6 at line 994 gives only the framed prime-power comparison, and line 998 explicitly stops after the induction.

**Claim:** The general smooth de Rham/q-Witt comparison may be excluded because the torsion endpoint needs only a framed instance.

**Witness:** wagner lines 2692–2702, Proposition 4.2, p. 54, gives a functorial equivalence of p-complete E∞-A[q]-algebras for every smooth R/A, including the product formula for m=p^αn, (n,p)=1.

This is a stronger algebraic interface on the objects built here, not a geometric cohomology functor belonging to a named consumer. The design expressly replaces it with the special instance needed by its chosen proof, contrary to the general-library and no-route-specific-shortcut requirements. A second narrowing occurs at README line 76: the requested cochain completion input assumes boundedness of the complex, whereas wagner lines 3198–3209, Lemma 4.25, pp. 64–65, only imposes the stated degreewise torsion conditions.

**Exact repair:** Keep §9.6 as a simultaneous induction milestone, and add a named general smooth comparison export, with perfect coverage of A, arbitrary smooth R, every prime p, all positive m=p^αn, the ψ_{p^αd} twists and Φ_d(q^{p^α}) factors, derived tensor, p-completion, E∞ multiplicativity and functoriality. Give its construction/descent dependencies and sources, including wagner lines 3491–3610. Alternatively cite an actual earlier owner of that full algebraic comparison; there is none in the supplied contracts. The general cochain-completion supplier contract should likewise retain the source's degreewise hypotheses without adding global boundedness. Special cases belong in Checks. Heavy E∞ carriers may remain README targets.

## R04 (P2) — The declared merge position cannot be certified

**Location:** `packages/QWittVectors/design/README.md:1065`: “QWittVectors follows its last earlier supplier in the merge order and precedes every Habiro or trace consumer.”

**Claim:** The roadmap has the stated position in the supplied order.

**Witness:** QWittVectors is absent from `merge-order/ORDER.txt`. The dependency gate on the design reports `NOT IN ORDER: QWittVectors (insert it after its last supplier)` and exits 1.

**Exact repair:** Have the merge-order owner register QWittVectors after every actual supplier and before its consumers, including any Part II suppliers established for R02. This reviewer and the design fix worker must not edit the protected order file. Once the package README is materialized, rerun the prescribed gate on that file; before then the design README can be checked diagnostically. Do not report this run as a clean dependency check. The exact diagnostic is included below.

## R05 (P2) — DGAInfinity is cited for more than its stated interface

**Location:** `packages/QWittVectors/design/README.md:48`: “associative and commutative DG carriers, maps, quotients and cohomology multiplication.”

**Claim:** DGAInfinity Layers 0–1 supply commutative DG algebra carriers and the quotient API needed for the differential-ideal construction in §7.2.

**Witness:** `TauCetiRoadmap/DGAInfinity/README.md:295` lists nonunital, unital and augmented DG algebras, maps, opposites, tensors, cycles and cohomology. It gives no commutative-DGA or differential-ideal quotient target. Its Layer 7 quotient concerns DG categories.

**Exact repair:** Narrow the supplier citation to what Layers 0–1 state. Explicitly define the light graded-commutativity/strict-odd-alternation conditions on the supplied associative carriers here. Obtain the general differential-ideal quotient construction from a named existing owner or an actual DGAInfinity Part II target; then §7.2 can specialize it to q-Witt relations. Update the corresponding supplier entry in the plan. Do not substitute the DG-category quotient.

## R06 (P3) — Several Checks do not discriminate, and one omits its boundary

**Location:** `packages/QWittVectors/design/README.md:514`: “The tensor product without the displayed ideal need not make V A[q]-linear; the generators test precisely this failure.” Also lines 402 and 761.

**Claim:** These bullets satisfy the requirement for three discriminating Checks per definition.

**Witness:** Line 514 gives no ring, element or unequal values; line 761 merely states that F₁ is a chain map. At line 402, a=0 would require the undefined positive index 2^(−1).

**Exact repair:** Replace §4.3's last bullet with an explicit base, algebra, scalar and element for which the unquotiented tensor violates V-linearity; compute both values and show that the displayed ideal kills their difference. Replace §7.3's identity-map restatement with a second nontrivial computation or non-example distinguishing its scaled differential rule. State a≥1 in §3.4's prime-power sequence and retain the separate m=1 Check. Apply the same discriminating-test standard throughout the eventual Lean selection; do not count three bullets alone as verification.

## R07 (P3) — Printed-page locators and one manifest use are incomplete

**Location:** `packages/QWittVectors/design/README.md:142`: “(hesselholt line 301, Lemmas 1.3–1.5, lines 301–371).” Most sampled target locators similarly omit printed pages. `packages/QWittVectors/sources.toml:74` lists only “2.4” and “gap:prismatic-frobenius” for bhatt-scholze.

**Claim:** The locators and manifest completely record the citations used by the design.

**Witness:** README line 272 cites bhatt-scholze Remark 2.27 for §2.3; that use and locator are missing from its manifest entry. Hesselholt's sampled Frobenius material is on printed pp. 8–9.

**Exact repair:** Add printed pagination to target locators, retaining version and extraction-line precision; the seeded table below provides the verified pages. Have the author correct the existing bhatt-scholze entry to include Remark 2.27, p. 20, line 775, cited for §2.3, and include it in References. The reviewer has left the author's recorded entry unchanged as required. Distinguish the paper's printed pages from extraction page markers.

## R08 (P3) — Process commentary remains in the mathematical README

**Location:** `packages/QWittVectors/design/README.md:23`: “their elementary Lean witnesses are recorded in the design report.” Also lines 29, 72–80 and 1060.

**Claim:** These passages belong in the timeless roadmap and certify checks or supplier status.

**Witness:** Line 29 instructs a reader to inspect a particular checkout; line 72 discusses the supplied checkout and board; line 1060 calls a consumer section an unverified input label. No Suggested.lean is supplied.

**Exact repair:** Move audit status and workflow instructions to the report. Replace the supplier gaps with the actual mathematical contracts resolved under R02. Describe consumers by the exported interfaces they consume, omitting unverified consumer section labels. State the conventions and computed witnesses directly, without claiming unavailable Lean evidence. Use ordinary mathematical titles for the mechanically split subsection names.

## Verified sound

I read all 51 targets, all 159 associated public API claims and all 153 Check bullets in the design, and compared the plan's target, prerequisite and gap data. There are ten layers and 28 definition/construction targets; each has an API list and three Check bullets. Every layer has Examples and Dependencies. Each target has a source locator. The numerical counts pass; R01 and R06 explain why counting bullets is not a soundness test.

The positive findings are scoped to the checks below, not a claim that an unformalized development has been proved. The general big Witt, nonunital absolute, arbitrary relative Λ-base and all-prime scope is preserved through most of the design. No computational-algorithm deliverable, good-primes restriction, copied source passage, existing-roadmap replacement or reverse consumer dependency was found in the material inspected. In particular, p=2 is retained in the positive-degree operations; the displayed differential-Frobenius correction follows the source proof rather than its misprinted display. The exceptional narrowing is R03.

The design distinguishes the q-fixed coefficient map from the framed q↦q^p map, uses polynomial q-integers instead of quotient-ring division, imposes strict odd alternation at 2, and distinguishes radical equality from equality of ideals. Finite frames, finite truncation in étale Witt preservation, the smoothness of the whole algebra, perfect coverage where needed, and per-degree rather than uniform torsion bounds are explicit. No arbitrary-data theorem with its conclusion hidden as a hypothesis was found.

The shape was compared with the main-branch roadmaps `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, `TauCetiRoadmap/DGAInfinity/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`. Main was inspected at commit `0e8b058a97cc4f9401d2679313e0e937761c1024`.

### Seeded source verification

All 15 seeded targets were checked against readable legal cached text at the versions recorded in the manifest. No locator was explicitly labelled unverified or uncertified in the design or plan. The five `gap:` labels concern ownership, not inaccessible source texts. No new source was needed or fetched, and no manifest entry was changed. Pages below are printed pages, not extraction page markers. Source passages are not reproduced.

| Target | Text and locator checked | Hypotheses and outcome |
|---|---|---|
| 1.4 `BigWitt.frobenius` | hesselholt lines 301–371, Lemmas 1.3–1.5, pp. 8–9 | Positive indices and shifted truncations; F, V, Teichmüller, gcd and projection identities agree. Infinite expansion is interpreted by restriction limits. |
| 1.5 `BigWitt.pTypicalEquiv` | wagner lines 471–473, Remark 2.7, p. 11; pinned finite carriers | Div(p^a) has a+1 coordinates. The infinite comparison is the stated inverse-limit consequence, not a second explicit sentence of the remark. |
| 1.6 `BigWitt.etale_baseChange` | hesselholt lines 811–827, Theorem 1.25, p. 19; borger lines 1323–1334, Corollary 5.4, p. 26 | Finite truncations and étale hypotheses retained. The iterated-prime comparison uses disjoint prime sets. No arbitrary infinite étale-preservation claim. |
| 2.1 `ArithmeticLambdaRing` | hesselholt lines 711–801, Proposition 1.19, Definitions 1.21/1.23, Lemma 1.24, pp. 17–19 | Full Witt coaction, not just Frobenius congruences on torsion rings. The converse from commuting lifts requires integer torsion-freeness. |
| 2.3 `ArithmeticLambdaRing.perfection` | wagner lines 1621–1643, Remark 2.47 and footnote, p. 32; bhatt-scholze lines 775–776, Remark 2.27, p. 20 | Multi-prime divisibility colimit and inverse shifts agree. The latter reference gives the single-prime δ analogy; the design supplies the multi-prime argument. Manifest omission: R07. |
| 2.5 `IsRelativelyPerfect` | wagner lines 1573–1582 and 1626–1628, §§2.45/2.47, pp. 31–32 | Linearization goes from R⊗_{A,ψ_n}A to R, r⊗a↦ψ_n(r)a. A itself need not be perfect when R=A. |
| 3.7 `absolute_witt_injective` | wagner lines 1194–1311, Proposition 2.28, Corollary 2.29, Lemma 2.30, pp. 23–26 | Arbitrary commutative inputs, including nonunital torsion kernels. The p-local product separates m=p^a n with (n,p)=1. No torsion-free hypothesis silently added. |
| 4.4 `relativeGhost` | wagner lines 1565–1582, §§2.44–2.45, p. 31 | The headline, twist and ordinary ghost formula agree. The first Check does not: R01. |
| 4.6 `perfectCover_comparison` | wagner lines 1573–1643, §§2.45–2.47, pp. 31–32 | Relative perfection and perfect-base hypotheses are kept in the respective comparisons. No equivalence for arbitrary A is inferred. |
| 6.3 `completedGhostFrobenius` | wagner-habiro lines 679–723, proof of Theorem 2.9, pp. 16–17; standing étale setting at lines 647–658 | Map r⊗a↦r^p⊗a fixes q. Perfect coverage and étaleness are retained; pd divides m, also when p divides d. |
| 7.1 `DifferentialVSystem` | wagner lines 1822–1848, Definition 3.1 and Lemma 3.2, pp. 37–38 | Graded commutativity, strict alternation and V-relations agree. Vd=n dV is correctly derived. Ownership of generic DGA machinery remains R02/R05. |
| 7.2 `differential` | wagner lines 1956–2010, Proposition 3.12, Definition 3.13, Remark 3.14, pp. 40–41 | The positive-degree differential ideal and initial property agree; degree zero is preserved. No positive-degree Frobenius assumed prematurely. |
| 9.2 `framedFrobeniusDecomposition` | wagner lines 2892–2972, §§4.10–4.12, pp. 58–60 | Finite étale frame and perfectly covered base retained. Rank p^(αr), v=0 monomial convention and cyclotomic reduction before scalar decomposition are correct. |
| 9.6 `primePowerSmoothInduction` | wagner lines 2703–2720, §4.3, pp. 54–55; lines 2756–2808, Lemma 4.5, pp. 55–56; lines 3341–3608, §§4.29–4.35, pp. 67–72 | The simultaneous (a)–(d) induction is correctly directed, including α=0 and p=2. Its framed quasi-isomorphism is not a degreewise isomorphism. General export missing: R03; prismatic supply missing: R02. |
| 10.2 `smooth_boundedDifferenceTorsion` | wagner lines 2810–2822, Lemma 4.6, p. 56 | Smooth finite-presentation localization over a perfectly covered, hence integer-torsion-free base. Bound is per degree and index; no Noetherian base or globally uniform bound asserted. |

Additional source checks included the torsion argument in bhatt-scholze Lemma 2.28, lines 778–803; free Λ perfect coverage in wagner-habiro §1.22(e), lines 493–498; the differential-Frobenius sign at wagner lines 1893–1929; the integral p=2 divided-power identity at lines 1853–1874; the cochain-completion hypotheses at lines 3198–3227; and the prismatic inputs in bhatt-scholze Theorem 15.3, lines 3898–3909, p. 103, Constructions 16.19–16.20, lines 4316–4339, p. 114, and Theorem 16.22, lines 4378–4380, p. 115. These support the mathematical input descriptions but do not create the missing roadmap ownership contracts.

### Adversarial mathematics pass

Each row covers the named target's full statement, every associated public API claim, its Checks and its standing conventions. Thus the table covers all 51 targets and 159 API claims, not just the seeded sample. “No defect found” means the listed substitutions and type/direction checks passed; it is not a proof certificate. R02/R05 still block the construction of objects using missing generic suppliers. Group-theoretic tests such as compactness and split tori are inapplicable to these ring-and-complex signatures; the relevant analogues here are zero rings, torsion, ramification-free arbitrary bases, nonperfect bases, inseparable maps and rank-zero frames.

| Statement, including its public laws | Instances and attempted failure modes | Result | Change |
|---|---|---|---|
| Conventions | q=1; Φ₁=q−1; m=1; p=2; zero ring; right versus left tensor action; rank-zero frame | Polynomial q-integers avoid 0/0; finite ideals and universes specified; the contradictory twist Check is isolated below. | R01; eventual Lean mirrors unavailable. |
| 1.1 Truncation set and ghost polynomials | ∅, {1}, Div(2), Div(6), invalid {2}; w₂=x₁²+2x₂ | Closure and positive indexing work; w₆ includes both mixed prime divisors. | None. |
| 1.2 Ghost image and injectivity | ℤ, ℚ, 𝔽₂, empty S; (0,1) over 𝔽₂ has zero ghosts | Congruence criterion does not require commuting lifts; injectivity needs torsion hypotheses; units give recursive inversion. | None. |
| 1.3 Big Witt construction | W∅, W_{1}, zero and nonunital square-zero rings; τ(1)+τ(1)=(2,−1) at Div(2) | Integral polynomial construction is distinct from coordinatewise ring operations and from p-typical carriers. | None. |
| 1.4 F, V and Teichmüller | n=1; a=b=2; a=2,b=3; p=2; τ(−1) versus −τ(1) | F₂V₂=2, coprime interchange and shifted domains agree; Teichmüller is multiplicative, not additive. | None. |
| 1.5 p-typical comparison | a=0,1; p=2,3; empty versus length zero | Div(p⁰) is length 1, not length 0; coordinates p^i correspond to i. | None. |
| 1.6 Étale Witt base change | Identity and split étale maps; empty finite S; inseparable Frobenius | Identity/empty cases agree. Inseparable Frobenius is excluded unless it is an isomorphism; finiteness is retained. | None. |
| 1.7 Commuting-action Koszul | r=0,1,2; zero module; zero and nonregular commuting operators | d¹(a,b)=D₁b−D₂a gives d²=0 without regularity. Extensionality concerns maps induced by intertwining maps, not arbitrary chain maps. | None. |
| 1.8 Arithmetic fracture | N=1; M=0, ℤ, ℚ, p-primary torsion, ℚ/ℤ | Empty finite product is zero; derived p-completion sees torsion via its shifted contribution, avoiding a false underived argument. | None. |
| 2.1 Arithmetic Λ-ring | ℤ with ψ_n=id; toric ℤ[T]; attempted 𝔽₂ Frobenius-only structure | Coaction retains torsion-sensitive identities. 𝔽₂ cannot acquire the full unital δ₂ structure just from Frobenius congruences. | None. |
| 2.2 Prime-set/free structures | Empty prime set; {p}; empty generator set; one generator | Empty operations leave ordinary rings; single-prime coalgebra is δ theory. Free exterior-operation variables, not only Adams symbols, are required. | None. |
| 2.3 Perfection | ℤ; toric ℤ[T]→ℤ[T^r : r∈ℚ≥0]; already perfect A | Transition maps compose along divisibility; inverse shifts invert all Adams maps; idempotence agrees. | R07 locator bookkeeping. |
| 2.4 Perfect coverage | Perfect A; toric polynomial extension; free Λ-ring; attempted nonzero p-torsion | Faithfully flat perfect cover excludes nonzero integer torsion. Polynomial monomial bases give flat Adams maps even in infinitely many variables. | None. |
| 2.5 Relative perfection | R=A with A=ℤ[T]; perfect A and R; toric R=A[T] | Relative identity case is an isomorphism even when absolute Adams is not; toric extension need not be relatively perfect. Balancing is r a⊗b=r⊗ψ_n(a)b. | R01 must use this convention. |
| 3.1 Absolute FV-system | m=d=1; zero system; m/d=2 | FV=2 and VF=1+q^d have distinct coefficient interpretations; positive indices and structural compatibility are present. | None. |
| 3.2 Absolute initial system | m=1; R=0; m=2; nonunital square-zero input | Relations force q=1 at m=1, retain genuine V relations and preserve the nonunital kernel model. | None. |
| 3.3 Absolute ghosts | m=1,2,6; n dividing or not dividing m/d | First ghost quotient and the zero/nonzero V cases agree; no inverse integer is needed. | Cyclotomic supply: R02. |
| 3.4 V-resolution | m=1,6,2^a; a=0 attempted | For m=6, (−V₃,V₂) followed by (V₂,V₃) has zero composite. The third Check lacks a≥1. | R06; generic inputs R02. |
| 3.5 Localization and torsion | R=ℤ, 𝔽_p, ℤ/p²; U={1}; localization killing the ring | The torsion-free hypothesis is needed for ghosts, not for V injectivity; bounds are fixed-m bounds. | None. |
| 3.6 Absolute completion | m=1; n=1; discrete p-completion; attempted unbounded p-torsion | Discreteness is a hypothesis, not automatic; bounded primary torsion controls the separate bounded-difference conclusion. | R02 for cyclotomic interface. |
| 3.7 Witt injection and p-local product | R=𝔽₂, ℤ/4, zero/nonunital kernels; m=p^a, n=1 | Injection is not deduced by ghosts on torsion rings; the exact-sequence argument handles them. n=1 leaves one product factor. | None. |
| 4.1 Λ comparison and coordinates | A=ℤ and toric ℤ[T]; m=1,2; nonperfect versus perfect | c_m s_m=ψ_m, not identity in general; at m=2 toric T maps to T². Perfectness supplies inverse Adams, not an implicit assumption. | None. |
| 4.2 Relative FV-system | R=A, R=0; d=m; right scalar action | Structural maps and A[q]-linear V are retained; this is stricter than an unbalanced tensor construction. | None. |
| 4.3 Relative initial object | m=1; R=A nonperfect; R=0; omitted relative ideal | Stated values Q₁=R and Q_m(A/A)=A[q]/(q^m−1) agree. The omitted-ideal bullet lacks a computed nonexample. | R06. |
| 4.4 Relative ghost | A=R=ℤ[T], m=d=2; A=ℤ; m=1 | Correct map gives T⊗1=1⊗T². The Check gives the false T⁴=T. | R01. |
| 4.5 Λ-base change and polynomial image | Identity; nonflat Λ-base quotient; one variable, m=2 | Initial/presentation argument supports ordinary base change without flatness; the toric image is A[T²,q]+(1+q)A[T,q] modulo q²−1. | None. |
| 4.6 Perfect-cover comparisons | A perfect; R=A nonperfect; arbitrary R over perfect A | Absolute/relative comparison over perfect A and polynomial comparison for relatively perfect R are kept distinct. | None. |
| 5.1 Étale q-Witt and pushout | Identity; split étale extension; divisors 1 and m; inseparable nonétale extension | Étaleness is actually assumed; no smooth replacement is made. | None. |
| 5.2 Ghost étale pushout | d=m=1; d=m=2 over toric base | At level 1 this is ordinary étale base change; the nontrivial case retains the ψ_d twist. | Correct R01 convention throughout. |
| 5.3 Relative torsion and completion | R=A; R=A/p; m=1; perfectly covered versus arbitrary Λ-base | Statements retain each source's prime-specific hypotheses; completion descent is through perfect coverage, not a claimed universal equivalence. | R02 limits availability of generic inputs. |
| 5.4 Finite type | r=0,1; m=1,2; infinitely many variables attempted | Finite-variable ℤ-polynomial setup yields finite module over ℤ[T_i^m,q]/(q^m−1); infinite variables are not covered. | None. |
| 6.1 Completed étale Frobenius | R=A; split étale R; attempted R=A[T]; p=2,3 | Linearization can be an equivalence while ψ_p itself is not surjective. Smooth polynomial coefficients do not satisfy the étale hypothesis. | None. |
| 6.2 Cyclotomic completion | d=1, p=2; d=p; q fixed | In ℤ[q], (2,q−1) and (2,Φ₄) have equal radicals, not equal ideals. Both p∣d and p∤d are included. | Cyclotomic supply: R02. |
| 6.3 Completed ghost Frobenius | p=2, d=1, m=2; d=p, m=p²; τ_m(r) | Lower path raises r to p, so both ghosts give r^(m/d); q and right scalars remain fixed. | None beyond supplier gaps. |
| 7.1 Differential V-system | m=d=1; degree 0; p=2; odd degree | Vd=n dV and strict odd alternation are compatible. Graded commutativity alone would allow nonzero odd squares at 2. | DGA ownership: R02/R05. |
| 7.2 Initial differential system | m=1; R=A; degree 0 and 1; zero ring | Q₁Ω*=Ω*, positive degrees vanish for R=A, and relation generators in positive degree do not quotient degree zero. | R02/R05. |
| 7.3 Differential FV-system | m=2, R=ℤ[T]; F₂(dτ₂T)=T dT; identity | dF₂τ₂T=2T dT verifies the factor 2. dV has reversed source/target and cannot replace Fd. One Check is a restatement. | R06. |
| 7.4 Prime V differential | p=2 and 3; x=0,1; non-FV q-V system | p^(p−2)=1 at p=2, so no negative power or division by 2. The construction uses injective absolute V and descends; positive F is not needed. | None. |
| 7.5 Positive Frobenius | p=2; τ₂(T), V₂(x); degree 0; composite prime factors | θ_p on Teichmüller and V generators gives scaled differential law; uniqueness is asserted only on the initial object. | Cyclotomic/DGA inputs: R02/R05. |
| 7.6 Differential ghosts | i=0,1; n=2; τ(T), V(x dy) | V contributes n in degree zero and n² in degree one; n^i appears in the F identity without division by n. | Ordinary de Rham supply: R02. |
| 7.7 Differential base change | Identity; étale localization; attempted inseparable extension; degree 0 | Extension of a derivation uses formal étaleness; no such uniqueness asserted for arbitrary smooth or inseparable maps. | R02. |
| 8.2 Framed γ | r=0,1; q=1+h; A with zero divisors; R=A[T]; T inverted | Flatness of the étale polynomial frame preserves T-regularity; h is regular on series. The zero ring causes no uniqueness failure. | None. |
| 8.3 Jackson D | T⁰,T,T²; γ(T²)−T²=hT(1+q)T; h=0; two coordinates | D(1)=0, D(T)=1, D(T²)=(1+q)T; hT cancellation has a stated injectivity proof, not a field division. | None. |
| 8.4 Framed complex | r=0,1,2; h=0; T dT; d¹(a,b)=D₁b−D₂a | Skew rule dT·T=qT·dT gives the Leibniz identity for T²; ordinary graded commutativity would give the wrong coefficient. | Ordinary forms/DGA inputs: R02/R05. |
| 8.5 Framed Frobenius | p=2,3; T; dT; rank 0 | On H□, φ(dT)=T^(p−1)dT and φ(h)=q^p−1. On C□ the extra [p]_q is necessary. No q-fixed coefficient equivalence is substituted. | None. |
| 9.2 Frobenius decomposition | r=0,1; α=0,1; p=2; v=0 | Ring basis 1,T and form basis T dT,dT at p=2,α=1. No T⁻¹ is used. Scalar differentials are claimed only after cyclotomic reduction. | None. |
| 9.3 Two-term cohomology | p=2,α=1,e=0; e=α; α=0; two equal exponents | S=ℤ₂[[h]]/(h(h+2)); ker(h)=(h+2)S and coker(h)=S/(h). At e=α differential is zero. Triangular splitting is over S, not derived tensor over the ambient ring. | R02. |
| 9.4 Bockstein | m=1,2; T; d=m; rank 0; nonregular parameter attempted | β_h(T)=dT fixes plus sign. Termwise regularity ensures lift division/independence. Identity FβV follows by multiplying a lift by f/g. | R02/R05. |
| 9.5 Framed cohomology system | m=1; zero variables; polynomial versus merely framed R | Underlying H□/h has zero differential but its cohomology Bockstein is ordinary d; degree-zero maps on framed R require the stated fracture argument. | R02. |
| 9.6 Smooth prime-power induction | α=0,1; p=2; T dT mod 2; quotient killing only V attempted | Cartier lift F₂(dτ₂T)=T dT works. Killing dV as well as V is essential. Induction arrows use α−1, not a same-level cycle. | R02/R03. |
| 10.1 Smooth integer torsion-freeness | R=A; m=1; R=ℤ[x]/(x²) as negative control | For the nonsmooth algebra x dx is nonzero 2-torsion. Smoothness and perfect coverage therefore matter; no good-prime exclusion remains. | R02. |
| 10.2 Bounded difference torsion | m=1; degree above relative dimension; zero ring; fixed i,m versus all i,m | h acts as zero at m=1, hence exponent 1 suffices. Vanishing degrees pose no problem. Finite local frames give bounded complex degree; no uniform torsion exponent promised. | R02. |

### Duplication audit by object

Search results were used to locate objects, then the relevant files were read at the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Seventeen pinned source files were inspected. Recursive file trees at both pins were checked; default-branch results were not treated as pinned evidence.

| Object | Pinned or main-branch owner checked | Audit result |
|---|---|---|
| p-typical coordinates, ghosts and maps | `Mathlib/RingTheory/WittVector/Defs.lean`: `WittVector`, `WittVector.ext`; `Basic.lean`: `map`, `map_coeff`, `ghostMap`, `ghostComponent`, `ghostComponent_apply` | Correctly imported; big Witt construction is a distinct object. Ring operations retain `Fact p.Prime`. |
| Finite p-typical truncation | `Mathlib/RingTheory/WittVector/Truncated.lean`: `TruncatedWittVector`, `instCommRing`, `WittVector.truncate`, `coeff_truncate`, `TruncatedWittVector.truncate` | Fin n is the length convention; §1.5 is a comparison, not duplicate ownership. |
| p-typical F, V, Teichmüller | `Mathlib/RingTheory/WittVector/Frobenius.lean`, `Verschiebung.lean`, `Teichmuller.lean`: declarations named in the supplier contract | Prime, characteristic and perfectness hypotheses were checked. No unrestricted p-typical inverse Frobenius imported. |
| p-typical adic topology | `TauCeti/RingTheory/WittVector/Complete.lean`: `WittVector.isAdicComplete_span_p_teichmuller`; `Frobenius.lean`: `TauCeti.WittVector.continuous_frobenius`, `continuous_frobeniusEquiv_symm` | These require the stated characteristic/perfect/adic setup. They do not already supply §6's relative coefficient map. |
| Twists, formal étaleness, series, degree-one differentials | `Mathlib/RingTheory/TensorProduct/Basic.lean`, `Etale/Basic.lean`, `PowerSeries/Basic.lean`, `Kaehler/Basic.lean` | Existing carriers and maps are cited. `includeRight` confirms R01's convention. Generic exterior DGA theory is a separate input. |
| Cyclotomic polynomial and factorization | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`: `Polynomial.cyclotomic`, `prod_cyclotomic_eq_X_pow_sub_one`, `prod_cyclotomic_eq_geom_sum` | Some primitives requested from the missing supplier already exist. Import them by exact names; they do not supply the entire ideal/completion package. R02. |
| Étale Kähler basis transport | `TauCeti/RingTheory/Kaehler/FormallyEtale.lean`: `TauCeti.kaehlerBasisOfFormallyEtale`; `Kaehler/BaseChange.lean` | Generic degree-one basis transport already exists. R02's ordinary-forms contract should consume it. No complete de Rham DGA was identified here. |
| Existing Bocksteins | `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean`: `TauCeti.explicitBockstein1`; `Integral.lean`: `TauCeti.integralBockstein` | Continuous group-cohomology domains/codomains differ from regular-parameter DGA Bockstein. §9.4 is not a duplicate of them. |
| Scalar Koszul, completion and complete flatness | `TauCetiRoadmap/DerivedModuleAlgebra/README.md` §§0.K.1, 0.2, 1.1–1.3, 1.5, 1.7–1.9 | Existing targets are imported. §1.7's commuting-module-action bridge is distinct from the scalar linear-functional Koszul. The cochain extension has no actual owner yet: R02. |
| DG carriers and signs | `TauCetiRoadmap/DGAInfinity/README.md` Layers 0–1 | Associative carriers and cohomology exist as planned objects. Generic commutative carriers/quotients are overclaimed: R05. |
| Enhanced tensor/limits and algebra objects | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` §0.3 and E5:abstract | Relevant supplier sections exist; no q-Witt-specific target was found there. |
| Relative characteristic-p Frobenius | `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §§0.23a, 0.29, 4.1 | Étale relative Frobenius, local polynomial ranks and infinitesimal lift uniqueness exist. Arithmetic multi-prime Λ-perfection is distinct. |
| Big Witt, Λ-coalgebra, q-Witt, Jackson and framed q-Witt systems | Object searches across pinned trees, main/Completed roadmaps and the board | No matching existing complete owner identified. This is bounded negative search evidence, not an assertion about unread files. |

The two new open-roadmap heads were checked: ArithmeticDynamics at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` and ErdosProgressionPowers at `e101259371172a32b3dd13e926676ae33b6af5cd`. Their README scopes and object searches showed no competing big/q-Witt, arithmetic Λ, Jackson, Bockstein, de Rham or Koszul ownership. The large ArithmeticDynamics README was read through its exact-head Git blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`; the differing local package was not substituted for it.

### Supplier order and build dependencies

Every `*Needs:*` line, layer dependency list, exact supplier paragraph and plan prerequisite was read. All local `target:` references resolve to earlier targets; no local cycle or forward reference was found among the 51 targets. The prime-power proof is one simultaneous induction, with the previous exponent explicitly distinguished. No consumer is used as a supplier. Existing named suppliers are on main or in the permitted earlier list. No ownership move from a later roadmap was necessary. Proposed Part II contracts must still receive real positions and text under R02.

The prescribed dependency command could not inspect the package README: `packages/QWittVectors/README.md` does not exist. It exited 1 with a FileNotFoundError for that repository-relative path. The long machine-path traceback is omitted. Running the same check with `packages/QWittVectors/design/README.md` produced this exact diagnostic and exited 1:

```text
NOT IN ORDER: QWittVectors (insert it after its last supplier)
depcheck: 3 roadmaps, 12 edges, 1 problem(s)
```

There was no UPWARD or CYCLE line. That absence is not certification: the roadmap is missing from the order, and the small parsed graph does not resolve the five explicit gaps. The tooling and order were left unchanged.

## Not verifiable

- **Lean elaboration: not available.** The brief supplies no usable elaboration command, and neither `packages/QWittVectors/Suggested.lean` nor a design `Suggested.lean` is present. No Lean command was run. Imports, retained section hypotheses, elaborated signatures, proved mirrors of Checks, and the “sorry is the only warning” condition therefore cannot be certified. Absence of a file is not evidence that those requirements passed. In particular the README's claim of elementary Lean witnesses is unsupported by this submission.
- **Five external supplier contracts:** the mathematics is readable in the cited sources, but actual roadmap section ownership cannot be verified for R02. The generic commutative/quotient DGA interface also cannot be certified from the claimed supplier: R05. These are not inaccessible-paper cases and do not require a missing-source manifest.
- **Mechanical order certification:** unavailable until QWittVectors has an order entry and the gate's package README exists. See R04 and the exact diagnostic above.
- **Consumer section labels:** HabiroCohomologyFoundations §0.3 cannot be checked against absent consumer text. No mathematical prerequisite was accepted on that basis; remove the unverified label under R08.
- **Formal truth beyond the audit:** source verification and the explicit calculations cover the sample and the displayed adversarial cases, not proofs of all future Lean declarations. No sampled source was unreadable or paywalled. Negative library searches establish only that no duplicate was found in the inspected pinned files, trees and roadmap material.
