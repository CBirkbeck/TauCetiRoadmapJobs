# Review of SchemeAndStackFoundationsPartII (package, round 2)

**Verdict:** needs changes

Six findings: two P1 supplier-name defects, three P2 ownership/minimality defects, and one P3 locator defect. The mathematical source sample passes. The acceptance file elaborates with only its two `sorry` warnings; neither admitted theorem is padding. The package is repairable without replacing its remaining mathematical scope.

### Previous findings, checked first

| Previous finding | Status and repaired passage | Verification and remaining pattern |
| --- | --- | --- |
| F01, missing integral-point supplier | **Repaired.** README:176: “supply an irreducible closed subscheme Y⊂X finite and surjective over Spec ℤ; equivalently an order R′ in a number field together with a point of X(R′).” | The named ClassicalSerreModularity contract replaces the missing PotentialModularity name. Its §I.0 distinguishes the number-field theorem from the integral step. DJ line 323 and line 362 require an integral point over a finite flat extension. The contract includes surjectivity, irreducibility and geometric generic irreducibility. On X=Spec ℤ it gives Y=X; Spec ℤ[1/2] fails surjectivity and is correctly excluded. |
| F02, redundant torsion arc contract and missing §6.4 | **Partly repaired.** README:180: “The hypercomplete form of this arc sheaf, which Layers 5 and 7 use, is stated at ArcTopologyAndDescent §11.5”. | The original torsion-arc and formal-glueing gaps are gone from README and plan. PrismaticCohomology §2.0 and Arc §11.5 now resolve. The same redundant-gap pattern survives for three other contracts: R02. The repair's reason for retaining them only checks PrismaticCohomology, although Arc already states them. |
| F03, wrong pins and stale declaration references | **Partly repaired.** README:45: “At the pinned Mathlib of the content repository's manifest; file and line numbers are those of that pin.” README:73: “Both live in the root namespace `AlgHom`, not under `TauCeti`.” | The stale hashes were removed correctly. Checked against Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. The root-namespace repair was not propagated: R04. One table locator remains wrong: R06. |
| F04, wrong location for perfect complexes/amplitude | **Repaired.** README:152: “§1.E.0 perfect complexes and Tor amplitude”. | Main DerivedModuleAlgebra §§0.10–0.13 supply cotangent base change, localization, smoothness and regular quotients; §1.E.0 supplies perfect finite models and amplitude. Both §2.3's Needs and Layer 2 Dependencies include it. For [ℤ --p→ ℤ], reduction gives H⁻¹=H⁰=𝔽_p; inverting p gives zero. |

No previous finding was marked “not actionable in this package.” The repair's separate merge-order observation is not re-raised as a request to edit the order: R01 concerns explicit duplicate targets at the current earlier owner's head, and is repaired by citations inside this package.

## R01 (P2) — Earlier Purity roadmap already owns several proposed layers

**Location.** `packages/SchemeAndStackFoundationsPartII/README.md:7`: “This Part II owns” the animated support comparisons, finite-ideal excision, fpqc hyperdescent and ample Brauer comparison. Also lines 96, 249, 467, 716, 754 and 1055.

**Claim.** The package plans these objects as its own and describes PurityForFlatCohomology solely as a downstream consumer.

**Witness.** PR #1840, `TauCetiRoadmap/PurityForFlatCohomology/README.md:197`: “Owned here and to be imported by later roadmaps.” Its following ownership list explicitly names SchemeAndStackFoundationsPartII. The actual matching statements, not just that ownership assertion, are:

| This package | Earlier owner at PR #1840 head | Matching mathematical content |
| --- | --- | --- |
| §§1.1–1.2 | §7.10, README:2488 | Positive-rank twisted bundle route and Br_Az(X)≃H²(X,𝔾_m)_tors for a scheme with an ample invertible sheaf. Same quasi-compact separated generality. |
| §§3.5, 3.7–3.8 | §3.2, README:1432 | Étale comparison, animated flat cohomology on opens, support fibres, fppf hyperdescent and Postnikov convergence. |
| §§3.10–3.11 | §3.3, README:1470 | Classical truncation and nil-ideal comparison, with the same degree distinctions. |
| §4.1 | §2.1, README:1342 | Perfect-affine positive-degree consequences of the Dieudonné fibre formula. |
| §§5.4–5.5 | §3.4, README:1503 | Primary cohomological dimension and derived mod-p comparison with supports. |
| §§6.2–6.4 | §3.5, README:1546 | Derived residue condition, finite-ideal excision and Noetherian local completion. |
| §§7.1–7.2 | §3.6, README:1577 | Fpqc hyperdescent and primary descent modulo p. |
| `gap:flat-cohomology-continuity` | §0.3, README:877 | Cohomology of qcqs inverse limits with affine transitions and finitely presented commutative groups; compatible supports with quasi-compact complement. This covers the requested finite-ideal and ordinary-algebra forms. |

PurityForFlatCohomology is at line 221 of `merge-order/ORDER.txt`, this package at line 257. Its head supplies these independently; the table is not inferred from an obsolete supplier gap back to this package. Searching the current main, board packages and indexed open heads by the mathematical objects found the overlap. HeightsRationalPointsAndObstructions §2.6d's narrower infinite-field result does not justify claiming the ample extension anew, because Purity §7.10 already has that extension.

**Exact repair.** Add an ordinary supplier contract for PurityForFlatCohomology with the sections above. Delete the duplicate targets and import their results wherever used; remove the redundant continuity gap from README and the plan's top-level gaps list. Retain genuinely additional interfaces, such as the animated point/cotangent work and complete/henselian/algebraization results, with their exact difference stated. Update Summary, Scope, build paragraph, headline docstring and Downstream consumers so this earlier roadmap supplies the shared foundations. Preserve or map any externally cited moved section numbers. Prune contracts used only by deleted proof routes. Do not move the supplier upward or make it depend on this package.

**Repair test.** On Spec ℝ, both ample comparisons give Br=Br′=ℤ/2, sending M₂(ℝ) to 0 and the quaternion algebra to 1. For ℤ→ℤ_p, the residue is 𝔽_p and higher Tor vanishes on both excision statements. For the split cover A→A×A, both hyperdescent comparisons contract by the same extra degeneracy. A scratch dependency check adding the proposed supplier reports `depcheck: 236 roadmaps, 2144 edges, 0 problem(s)`; no UPWARD or CYCLE.

## R02 (P2) — Three remaining Arc contracts ask for statements already supplied

**Location.** `packages/SchemeAndStackFoundationsPartII/README.md:188`, 190, 192: the contracts `gap:complete-etale-hyperdescent`, `gap:complete-valuation-product-basis`, `gap:integral-perfectoid-hyperdescent`.

**Claim.** ArcTopologyAndDescent must add these statements.

**Witness.** At PR #1755, `TauCetiRoadmap/ArcTopologyAndDescent/README.md:1552`, §11.5 already states all four completed/henselized and punctured torsion hyperdescent functors. Section 11.2 at line 1502 already supplies the complete valuation-product basis, including étale acyclicity of quasi-compact opens. Section 12.7 at line 1624 already supplies derived hyperdescent of the integral perfectoid ring, its tilt and A_inf. The hypotheses match the three contracts, including finite I and perfectoid terms throughout the hypercover. Arc is earlier in the order, at line 109.

**Exact repair.** Replace the three gaps with direct supplier citations to Arc §§11.2, 11.5, 12.7, stating the consumed hypotheses. Replace every use of the three gap slugs in Needs/Dependencies and remove their entries from the plan's top-level gaps list. No new Arc work is required for these statements.

**Repair test.** I=0 and an algebraically closed field k give the identity complete cover; constant torsion coefficients have H⁰=F, H>0=0. The empty valuation product is 0, with empty spectrum. On the identity perfectoid hypercover of 𝔽_p, the three descent objects are 𝔽_p, 𝔽_p and ℤ_p respectively. Each is exactly included in the cited supplier statement. The repair report's observation that PrismaticCohomology §2.0 does not supply them does not alter their existing ownership in Arc.

## R03 (P2) — Noetherian completion contract is already covered at the pins

**Location.** `packages/SchemeAndStackFoundationsPartII/README.md:110`: “its m-adic completion is faithfully flat, with C/m^n≃Ĉ/m^nĈ for n>0”; line 56 also says faithful flatness is not stated at the pin.

**Claim.** `gap:noetherian-completion-flat` requires a new SchemeAndStackFoundations export.

**Witness.** `TauCeti/RingTheory/AdicCompletion/Flat.lean:63` declares `AdicCompletion.faithfullyFlat_of_isLocalRing`. `TauCeti/RingTheory/AdicCompletion/Algebra.lean:59` declares `AdicCompletion.quotientMapPowAlgEquiv` for every finitely generated ideal and every n. Both names elaborate at the pinned Tau Ceti.

**Exact repair.** Delete this gap from README and the plan's gaps list. Cite these native declarations in the Tau Ceti supplier table and at surviving consumers. Use the inverse of `quotientMapPowAlgEquiv` for the displayed orientation. A Noetherian maximal ideal is finitely generated; pinned flatness gives the derived residue comparison. Correct the claim about absence at the pin (or explicitly restrict it to that one Mathlib declaration while supplying the Tau Ceti result).

**Repair test.** C=ℤ_(p) has completion ℤ_p, quotients ℤ/p^n on both sides, and Tor_i^C(C/m,Ĉ)=0 for i>0. For a field with m=0, completion and quotient comparisons are identities. The native statements cover both instances, with no new mathematical target.

## R04 (P1) — Retired namespace remains in three supplier citations

**Location.** `packages/SchemeAndStackFoundationsPartII/README.md:902`, 919, 1013: `TauCeti.AlgHom.mapValue`.

**Claim.** This is the pinned map supplying functoriality of group-valued points.

**Witness.** `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:64` opens the root `AlgHom` namespace; line 143 defines `AlgHom.mapValue`. The scratch `#check @TauCeti.AlgHom.mapValue` fails with `Unknown identifier`, while `#check @AlgHom.mapValue` succeeds. README:73 already records the correct name.

**Exact repair.** Replace all three stale qualified names by `AlgHom.mapValue`, matching the table and the implementation of `pointsAddFunctor`. Search the whole package for the retired prefix. No change to the theorem signatures is needed.

**Repair test.** For the trivial coordinate Hopf algebra R, points over A consist of its unique structure map. Root `AlgHom.mapValue` sends this singleton to the singleton over B; `mapValue_id` and `mapValue_comp` give the required identity and composition. The purported prefixed declaration cannot even be checked. P1 follows the specified missing-supplier-declaration rule, not a claim that the functor is mathematically false.

## R05 (P1) — Henselization supplier name has been retired to native Tau Ceti

**Location.** `packages/SchemeAndStackFoundationsPartII/README.md:84`, 114, 948, 1013: SchemeAndStackFoundations §0.13 `henselization_noetherian`.

**Claim.** That section/declaration supplies Noetherian henselization and faithful flatness of its completion.

**Witness.** On main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1197` (§0.13) has no such declaration; its ownership list at line 175 and supplier list at line 510 instead refer to native henselization. The same retired name is absent from its provided open head. `TauCeti/RingTheory/Henselization/Noetherian.lean:72` supplies `TauCeti.Henselization.isNoetherianRing`, and line 62 supplies `TauCeti.Henselization.faithfullyFlat_adicCompletion`.

**Exact repair.** Replace all four citations by the two native names in a Tau Ceti contract. Cite `TauCeti.Henselization.completionEquiv`, `TauCeti/RingTheory/Henselization/Quotient.lean:155`, when identifying the henselization's completion with the original ring's completion. Keep `gap:henselized-formal-fibres` for the genuinely additional geometric regularity assertion; do not enlarge it to duplicate the native results.

**Repair test.** All three native names pass `#check` at the pin. For C=ℤ_(p) and I=(p), the henselization is Noetherian, its completion is ℤ_p, and the map is faithfully flat; for I=0 the henselization and completion are C. The replacement has precisely the Noetherian hypotheses consumed by the proof route. The missing identifier is not evidence that the mathematical prerequisite is unavailable.

## R06 (P3) — Henselian-pair locator points at the local-ring definition

**Location.** `packages/SchemeAndStackFoundationsPartII/README.md:54`: `HenselianRing` at `Mathlib/RingTheory/Henselian.lean:94`.

**Claim.** Line 94 is the pinned definition of the pair predicate.

**Witness.** `Mathlib/RingTheory/Henselian.lean:81` defines `HenselianRing`; line 94 is the documentation immediately before `HenselianLocalRing` at line 95.

**Exact repair.** Change the locator to line 81. Keep the correct explanation that locality is not part of `HenselianRing`.

**Repair test.** (ℤ,0) satisfies the pair condition: 0⊂Jac(ℤ), and a root modulo 0 is already an exact root. ℤ is not local. This separates the two declarations and confirms that line 81 is the intended one.

## Verified sound

### Scope of the review and source sample

Read all 47 numbered targets, all 50 Needs lines (including supplier/route lines), the convention block, API bullets, Checks, layer dependencies and all four package files. Read the earlier review and repair, the package index, overlap report, unresolved-citation leads, signature leads and library near-matches. Reviewed the changed passages afresh and searched the remaining package for the repaired patterns. The previous table was used only as an aid where it contained computed values; it was not used to certify an uncomputed section.

All 15 seeded targets were checked against the locally held legal texts at their locators. None is flagged unverified in the package. There are nine source keys, and every directly cited work has a manifest entry; no new source fetch or manifest edit was necessary. The following locators are for the version actually recorded in that manifest, not assumed published pagination.

| Seeded target | Text opened | Hypotheses, numbering and pages checked |
| --- | --- | --- |
| 1.2 | DJ Theorem 1.1, p.1, line 8 | Ample invertible sheaf; quasi-compact separated interpretation; comparison with torsion H², not all H². |
| 2.2 | CS24 §5.1.11 and Proposition 5.1.12, p.52, line 2149 | Identity pullback, additive linearization and mapping description for flat affine commutative groups. |
| 2.4 | CS24 Theorem 5.1.13 and Remark 5.1.14, pp.52–53, line 2171 | Square-zero extension by a connective module; fibre statement in connective objects, with the stated shift. Not confused with the untruncated cohomology supplier contract. |
| 3.2 | CS24 §5.2.1, p.53, line 2200 | Flat module and arbitrary animated module; homotopy tensor formula and base change. Source's index slip recorded below. |
| 3.3 | CS24 Lemma 5.2.2, pp.53–54, line 2216 | Surjective π₀-map with nilpotent kernel; derived base change, not ordinary tensor alone. |
| 3.5 | CS24 Proposition 5.2.4, p.54, line 2256 | Equivalence of étale algebra categories, including higher homotopy of the lifted algebra; no map π₀A→A presumed. |
| 3.7 | CS24 §5.2.5, p.55, line 2279; Corollary 5.3.8, p.61, line 2560 | Cohomology on opens by slice-site limit and support as restriction fibre. |
| 3.9 | CS24 Corollary 5.2.7, p.56, line 2345 | Compatible inverse tower becoming correct on each prescribed truncation, and both stated coefficient classes. |
| 3.11 | CS24 Corollary 5.2.10, p.57, line 2378 | Nil ideal, without a uniform nilpotence exponent; exact degree bounds for smooth and finite locally free coefficients. |
| 3.12 | CS24 proof of Claim 5.3.5.3 and footnote 24, p.59, line 2459 | The proof's étale-neighborhood excision step also applies to fppf cohomology. The support restriction must be an isomorphism of schemes, not just a homeomorphism. |
| 5.5 | CS24 Corollary 5.3.8, pp.61–62, line 2560 | Both π₀-rings p-henselian, derived mod-p equivalence, p-primary finite locally free coefficient, and arbitrary open containing D(p). |
| 8.1 | CS24 Lemma 5.6.2, p.71, line 2960 | Derived completeness implies the henselian-pair assertion; no false ordinary completeness assertion for π₀. |
| 8.7 | CS24 Remark 5.6.8, p.76, line 3181 | Countable henselization versus uncountable completed unit quotient in characteristic p. |
| 9.1 | BC22 Lemma 2.1.3, pp.6–7, line 253 | Finitary set-valued functor, Noetherian henselian pair, geometrically regular completion map; injectivity and comparison of nonempty residue fibres. |
| 9.2 | CS24 Corollary 5.6.9, p.76, line 3190 | Arbitrary henselian pair and finite locally free commutative group: surjective in degree 1, bijective from degree 2. |

Also checked CS24 Corollary 5.6.10, p.76, line 3209 for the second Lean headline, and BC22 §2.1.1, p.5, line 214 for the nonunital henselian criterion. DJ Claim 3.22, pp.8–9, line 323 and line 362 supports the repaired integral Skolem route. No sampled statement needs a missing hypothesis or a narrower mathematical scope.

### Computed adversarial table

Each row gives actual values, including negative controls; “identity” below means the specified map on the displayed group or complex. These computations test statements and conventions, not merely elaboration. The complete working ledger has a row for each of the 47 numbered sections; this report retains the seeded sample, headlines, definitions supporting them and every finding's mathematical instance.

| Statement | Instances tried | Computed left and right sides | Result / change |
| --- | --- | --- | --- |
| Conventions: V−1 and shifts | G=ℤ/p and μ_p over 𝔽_p; A=k⊕k[1] | V−1 is 0 for ℤ/p, giving H⁰=H¹=𝔽_p; it is −1 for μ_p, giving 0. For G_a(A), H⁻¹=k,H⁰=k. | Signs and cohomological indexing agree. |
| Conventions: Koszul quotient/supports | A=ℤ/p²; I=1 and I=0 | A/^Lp has π₀=π₁=𝔽_p, ordinary A/p has π₁=0. Support at I=1 is fib(id)=0; at I=0 it is RΓ(A,G). | No underived substitution or reversed support. |
| 1.1, repaired Skolem route | Neutral B𝔾_m over ℙ¹_ℤ; X=Spec ℤ | Standard character has weight 1, trivial character 0; weight (n+1)−n=1. Integral point uses the rank-one order ℤ. Rank-zero End is 0, not Azumaya over ℤ. | Positive rank and weight correction survive; ownership R01. |
| 1.2, ample comparison | X=Spec ℝ | Br_Az=Br′=ℤ/2; split M₂ has class 0, quaternion algebra class 1 on both sides. | Correct theorem, duplicate R01. |
| 2.1–2.2, points and identity cotangent | G_a,G_m; μ_p over 𝔽_p | C_Ga=C_Gm=R[0]; C_μp=[𝔽_p --0→ 𝔽_p], H⁻¹=H⁰=𝔽_p. G_a(k⊕k[1]) has π₁=k, versus 0 for π₀-only evaluation. | Definitions exclude the discrete wrong model. |
| 2.3, amplitude repair | μ_p over ℤ, then mod p or invert p | [ℤ --p→ ℤ] reduces to two copies of 𝔽_p with zero differential; after inverting p it is acyclic. For h=id, dh+hd=p. | Cotangent suppliers and shift checked. |
| 2.4, point deformation | G_m over k[ε]/ε²→k; M=0 | Kernel is 1+εk≃k; RHom(k,k)=k gives the tangent fibre. M=0 gives zero fibre and identity comparison. | Correct connective fibre and obstruction shift. |
| 3.1, 3.3, flatness criterion | A=k⊕k[1], M=k; ℤ/4→𝔽₂,M=𝔽₂ | First case: π₁(A)⊗k=k but π₁M=0, so not flat. Second: Tor_i^(ℤ/4)(𝔽₂,𝔽₂)=𝔽₂ for every i≥0, so neither side passes flatness. M=A is rank-one flat on both sides. | Nilpotent criterion is derived; no π₀-only test. |
| 3.2, tensor formula | M=ℤ_p,N=ℤ/p over ℤ; M=k,N=k[1] | First derived tensor has H⁰=𝔽_p and higher Tor 0; graded formula gives the same. Second gives π₁=k on both sides. | Formula correct. |
| 3.5, étale equivalence | A=𝔽_p⊕𝔽_p[1], finite separable 𝔽_q | Lift A⊗𝔽_q has π₀=π₁=𝔽_q and L=0. Identity étale object is A, not π₀A. Zero ring gives the trivial category. | Correct equivalence; R01 ownership. |
| 3.6, henselization | I=0 and I=1 | At 0, A=k⊕k[1] is fixed, including π₁=k. At 1, Jacobson containment forces target 0; henselization is 0. | Universal direction and derived content correct. |
| 3.7, supports | G_a on k[t], I=(t),(t²),0,1 | H⁰_(t)=0; H¹_(t)=k[t,t⁻¹]/k[t]; (t²) gives the same. I=0 gives full cohomology; I=1 gives 0. | Correct geometric fibre; R01 ownership. |
| 3.8–3.9, towers | A_n=τ≤n(k⊕k[1]); split Čech cover | Tower is constant A from n=1, hence both sides have H⁻¹=k,H⁰=k for G_a. Split cover contracts to these same groups. Zero tower gives 0=0. | Truncation compatibility tested, not assumed for arbitrary towers. |
| 3.10–3.11, truncation/nil ideals | μ_p on 𝔽_p⊕𝔽_p[1]; μ_p on dual numbers | First H⁰ is 𝔽_p versus 0 on π₀: only surjectivity is valid there. Dual numbers give kernel 1+ε𝔽_p≃𝔽_p in H¹→H¹(𝔽_p)=0; H²=0 on both. | Stated degree distinctions correct; R01 ownership. |
| 3.11, genuinely nil ideal | A=𝔽_p[x_i]/(x_i^p), I=(x_i) | Every element of I is nilpotent, but products of arbitrarily many distinct x_i remain nonzero. H¹(A,α_p) contains each x_i; H¹(A/I,α_p)=0; H²=0 on both. | No uniform nilpotence added. |
| 3.12, étale neighborhood | ℤ→ℤ[1/(1+p)], I=(p); 𝔽_p[t]→𝔽_(p²)[t] | First residue map is 𝔽_p→𝔽_p identity. Second has residue dimensions 1→2 and fails the required isomorphism, even though both support spaces have one point. I=1 gives 0=0. | Scheme-theoretic hypothesis discriminates. |
| 4.1, perfect affine vanishing | ℤ/p, μ_p, α_p over 𝔽_p | ℤ/p has H⁰=H¹=𝔽_p,H≥2=0; μ_p and α_p have all H≥0=0. | Does not incorrectly kill H¹; R01. |
| 5.4–5.5, primary comparisons | μ_p over ℤ_p; ℤ_p→ℤ_p×ℚ_p | Odd p: H¹=ℤ/p,H≥2=0; p=2: H¹=(ℤ/2)²,H²=0. Product map has identical derived mod-p reduction but p is not Jacobson in the second factor. | Henselian condition excludes wrong comparison; R01. |
| 6.2–6.4, residue/excision/completion | ℤ→ℤ_p; ℤ/p²→𝔽_p; field with m=0 | First derived residue is 𝔽_p, higher Tor 0. Second has Tor₁=𝔽_p and fails. Field completion is itself. At I=1 support complexes are both 0. | Correct derived hypothesis; R01/R03. |
| 7.1–7.2, fpqc descent | A→A×A; ℤ_p→𝔽_p | Split augmented Čech complex contracts. For A=𝔽_p,G=ℤ/p its H¹ remains 𝔽_p. Second map's derived mod-p target has π₁=𝔽_p, so is not flat over 𝔽_p. | No false cover or positive-degree vanishing; R01. |
| 8.1, complete implies henselian | ℤ_p; (ℤ,(p)); I=0,1 | ℤ_p is complete and henselian; p∉Jac(ℤ)=0. I=0 preserves k⊕k[1]; I=1 derived completeness forces 0. | No ordinary π₀-completeness overclaim. |
| 8.5–8.6, continuity | Empty tuple; ℤ_p with μ_p, odd p | Empty tuple gives constant tower. For n≥2, μ_p(ℤ/p^n) has p elements but at each fixed level the transition images eventually equal {1}; lim¹H⁰=0 and lim H¹=ℤ/p. | Derived limits and ordinary comparison distinguished. |
| 8.7, failure of H¹ continuity | 𝔽_p{t}→𝔽_p[[t]] | Source units modulo pth powers are countable; u_h=1+t h(t^p) gives distinct target classes for distinct h, hence uncountably many. H²(−,μ_p)=0 on both sides. | Sharp negative control for §9.3. |
| 9.0, points/sheaf/Ext definitions | Trivial Hopf algebra; α_p on 𝔽_p[t] | Trivial group has one point, zero abelian sheaf and all Ext groups zero. α_p gives H¹=𝔽_p[t]/𝔽_p[t^p], with t nonzero. Ext⁰ gives G(A). | Excludes constant-zero and wrong-topology models. R04 changes name only. |
| 9.0, nonunital henselian predicate | B′=0; B′=ℤ; B′=3ℤ_(3) | 0 passes with all coefficients/root corrections 0. ℤ fails at x=−1. In 3ℤ_(3), quasi-inverses exist, but T(T−1)−3 has discriminant 13 and no rational root. | Both clauses necessary; finite indices include all coefficients. |
| 9.1, finitary completion | I=0; ℤ_(p)^h→ℤ_p, F(C)=C | I=0 gives identity. The ring map is injective; residue element 1 has lift 1 on both sides. Constant two-element functor also gives identity. | Does not assert arbitrary functor surjectivity. |
| 9.2, Lean headline | α_p over 𝔽_p[[t]], I=(t); I=0 | H¹ source contains t, target H¹=0: surjective but not injective. H²=0=0. I=0 gives identity in every degree. | Exact degree bounds and henselian hypothesis retained. |
| 9.3, Lean headline | Discrete B, B′=0; 𝔽_p{t} with B′=tB | Discrete completion is B, map identity. In the second case completion is 𝔽_p[[t]], H² μ_p is 0 on both sides, while the §8.7 H¹ map fails. | Full topology and n≥2 matter. |
| 10.1–10.2, adic descent | A=𝔽_p,I=0,M=𝔽_p[1]; split cover; I=1 | Shifted M has π₁=𝔽_p and is not flat over A, whereas M=A and M=0 pass. Split cover contracts the support fibre. I=1 gives 0=0. | Wrong shifted module excluded; empty tuple recovers fpqc descent. |
| 10.2, support duality route | T=ℤ_p, parameter p | Dual Koszul [ℤ_p --p^n→ ℤ_p] has H¹=ℤ/p^n; filtered colimit is ℚ_p/ℤ_p, equal to H¹_(p)(ℤ_p,G_a). H⁰=0 on both sides. | Geometric supports, not an unjustified ordinary-quotient replacement. |
| R02 contracts | k algebraically closed,I=0; A=𝔽_p perfectoid | Identity-cover cohomology is F in degree 0, zero higher; perfectoid descent objects are 𝔽_p, 𝔽_p, ℤ_p. Empty product spectrum is empty. | Existing Arc statements cover exact tests. |
| R05–R06 supplier predicates | C=ℤ_(p),I=(p); (ℤ,0) | Henselization completion is ℤ_p, quotient ℤ/p^n; (ℤ,0) has exact root lifting but ℤ has many maximal ideals. | Native replacements preserve results; pair/local locator distinguished. |

### Pinned API and acceptance-test audit

Opened the declaration bodies and their namespace/variable context, rather than accepting search names. The 22 primary supplier-table rows resolve; R06 is the one incorrect primary line locator. Additional declarations inside rows and the implementation were also opened. Representative exact evidence covering all rows:

| Native declaration(s) | Pinned file and line | What is and is not provided |
| --- | --- | --- |
| `Algebra.FinitePresentation`; `Module.FaithfullyFlat` | `Mathlib/RingTheory/FinitePresentation.lean:44`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:64` | Finite presentation; flatness plus faithfulness, not just flatness. |
| `AlgebraicGeometry.Scheme.fppfTopology`, `.fpqcTopology` | `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54`, 76 | Native scheme sites with their covering conditions. |
| `HenselianRing`; `IsAzumaya` | `Mathlib/RingTheory/Henselian.lean:81`; `Mathlib/Algebra/Azumaya/Defs.lean:60` | Pair includes Jacobson containment and lifting, not locality. Azumaya includes projective, finite and faithful, not merely the multiplication isomorphism; it is a ring-algebra predicate, not a scheme Brauer group. |
| `AdicCompletion.flat_of_isNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378` | Flatness; Tau Ceti's additional faithful-flat/quotient declarations are in R03. |
| `CategoryTheory.HasExt`, `CategoryTheory.Abelian.extFunctor` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55`, 437 | Universe-controlled Ext and its bifunctor. The explicit instance is a real native condition. |
| `CategoryTheory.presheafToSheaf` | `Mathlib/CategoryTheory/Sites/Sheafification.lean:74` | Sheafification, not a new fppf site. |
| `AddCommGrpCat.free`, `AddCommGrpCat.uliftFunctor` | `Mathlib/Algebra/Category/Grp/Adjunctions.lean:54`; `Mathlib/Algebra/Category/Grp/Basic.lean:491` | Free abelian group and generated additive universe lift. |
| `CategoryTheory.Sheaf.cohomologyPresheafFunctor` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:70` | Ext-from-free-representable cohomology model. Package specializes it to native finite flat group coefficients and handles universe lifting; it does not re-plan general sheaf cohomology. |
| `UniformSpace.Completion`, `.algebra` | `Mathlib/Topology/UniformSpace/Completion.lean:291`; `Mathlib/Topology/Algebra/UniformRing.lean:198` | Separated completion of the supplied uniform structure and its algebra map; no Hausdorff hypothesis silently added. |
| `TauCeti.CommAlgCat.fppfTopology` | `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61` | Affine fppf site used by both headlines. |
| `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`, `.pointsFppfSheaf` | `TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:57`, 72 | Points sheaf; native group-valued object, requiring the commutative/additive adapter in §9.0. |
| `AlgHom.mapValue`, `.convCommGroupOfSemiring` | `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`, 232 | Correct root namespace, convolution and functoriality; identity/composition at 167/200. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`, `.coordinateHopfAlgebra`, `.cartierDual` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:122`, 298, 321 | Actual finite locally free commutative group carrier and finite projective cocommutative Hopf coefficients. |
| `.cartierDualBaseChangeNatIso` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:172` | Arbitrary base-change compatibility. |

Ran `lake env lean` on the actual `packages/SchemeAndStackFoundationsPartII/Suggested.lean` from the content checkout, passing its absolute filename to Lean: exit 0, exactly two `declaration uses sorry` warnings, no other warnings. Required imported object files were available. No broad build, cache operation, pin change or package edit was made.

A separate copy with `#check @name` for all six declarations elaborated. Binder comparison:

| Declaration | Retained data/hypotheses |
| --- | --- |
| `pointsAddFunctor` | R, CommRing R and native finite locally free commutative G; values are actual algebra maps with convolution. |
| `coefficientSheaf` | Same R,G; value universe raised from u to u+1. |
| `flatCohomology` | Same R,G; n; explicit `HasExt` and Ext universe w. |
| `flatCohomology_henselian_invariance` | R, CommRing, HasExt, ideal I and `HenselianRing R I`, G,n; separate implications for 1≤n and 2≤n. |
| `IsHenselianNonunitalSubring` | B, CommRing B and the actual nonunital subring; both quasi-inverse and polynomial clauses have real bodies. |
| `flatCohomology_algebraization` | UniformSpace, IsUniformAddGroup, IsTopologicalRing, HasExt, B′, openness, henselian predicate, open-ideal neighborhood basis, G,n and 2≤n. |

No binder was lost and no signature changes are requested. The universe probe finds sheafification at u+1 and fails to synthesize it at u, as the docstring says. `HasExt.standard` exists; the parameter is not an empty stand-in. All six own backticked names appear in README and are declared; the false library prefix is separately R04.

The Summary has seven headlines. §9.2 and §9.3 are both stated in Lean. The docstring explicitly names §1.2, §6.3, §7.1, §8.5 and §10.2 as unavailable and identifies their missing carriers. Native `IsAzumaya` and the available line-bundle machinery do not supply a scheme Azumaya Brauer group. Animated rings and their flat cohomology/support complexes are roadmap inputs, not native carriers at these pins. Thus no additional statable headline was found omitted. R01 requires updating this list when ownership is corrected.

Both sorried theorems were probed individually in a scratch copy with `simp` required to close the goal, `rfl`, and `infer_instance`; all failed. The near-match list and object searches supply no single native lemma proving either conclusion. Neither theorem is a boundary case, a computed value, an API law or a README Check. The four definitions are the simple native-carrier definitions those two headlines need. There are no sorry'd data, Prop-valued stand-ins, `set_option`, admitted examples, `lemma` declarations or extra API theorems. The module-system `public import Mathlib` and the two individual used Tau Ceti imports elaborate; they introduce no roadmap imports.

### Ownership, suppliers, gaps and shape

The board package index was read before resolving missing-roadmap leads. The eight precomputed citation leads are not eight findings: PerfectoidQuotientsPartII exists in the board and is earlier in the order; the Brauer, prismatic and derived-de-Rham names belong to the explicitly cited supplier roadmaps, not the pinned library. `SchemeBrauerGroup.toH2` in its gap is the requested class-map interface, not a falsely claimed existing native declaration. The actual stale references are R04–R05.

Resolved supplier sections at main, or at the supplied open head for new roadmaps. Locations below are representative entry points to the full cited ranges; open-head line numbers exclude the tool's synthetic provenance header.

| Supplier | Resolved sections / evidence |
| --- | --- |
| SchemeAndStackFoundations, main | §§0.9, 0.12–0.15, 0.21 at README:1026, 1160, 1197, 1240, 1272, 1548; §§1.13–1.15 at 2521, 2561, 2604; §§1.18–1.22 at 2849, 2923, 2949, 3055, 3092; §§2.1–2.7, 2.9–2.11, 2.15, 2.22 at 3374, 3420, 3442, 3477, 3501, 3554, 3613, 3719, 3772, 3795, 4001, 4604; Layer 4 at 5272. R05 concerns the removed name, not absence of §0.13. |
| DerivedModuleAlgebra, main | §0.K.1 at README:649; §0.5 at 1339; §§0.10–0.13 at 1533, 1553, 1570, 1588; §§1.1–1.9 at 1865, 2024, 2064, 2142, 2160, 2248, 2359, 2399, 2438; §1.E.0 at 2472. §1.9's ordinary p-complete bounded-torsion Čech result is weaker than the declared animated finite-tuple hypercover contract. |
| EnhancedDerivedSheaves, main | E1.3 at README:549, E3.2 at 1153, E2:towers.1 at 1294; animation .1–.4 at 1900, 1949, 1978, 1994; E2.3/E2.7 at 2125/2375; cotangent-export.1 at 2869. The uniform lower cohomological bound on the totalization exchange is retained in §10.2. |
| AlgebraicVectorBundles, main | README:346 gives the old L0A–L0C mapping to Layers 1–3/native operations. This is a valid old-to-new map, not drift. |
| ReductiveGroupsPartII, main | RG2.0a.1–.3: affine Weil restriction and base change, with smooth restriction in .2; entry at README:963 and smoothness at 1178. The classical group-category adapter is a distinct declared contract. |
| PerfectoidQuotientsPartII, board | `packages/PerfectoidQuotientsPartII/README.md:814`, 846, 883 resolve Q7.1–Q7.3, including the ind-fppf/ind-syntomic stability API. |
| PrismaticCohomologyPartIII, PR #1070 | `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:105`, §6.0: perfect Dieudonné, p-continuity and principal excision, plus the proof-route constructions. The four missing export contracts are distinguished from these stated headlines. |
| PrismaticCohomology, PR #1057 | `TauCetiRoadmap/PrismaticCohomology/README.md:2279`, §2.0, supplies torsion arc descent, excision, formal glueing and punctured henselian comparison. |
| ArcTopologyAndDescent, PR #1755 | §§11.2, 11.5, 12.7, lines in R02. Ordinary hypercomplete upgrade is also explicitly in §11.5. |
| HeightsRationalPointsAndObstructions, PR #1017 | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:953`, 965, 979, 994 resolve §§2.6a–d: twisted-module calculus, stabilization, affine comparison and infinite-field extension. |
| ClassicalSerreModularity, PR #1020 | `TauCetiRoadmap/ClassicalSerreModularity/README.md:401`, §I.0, field-form Moret-Bailly and integral proof step; the additional integral export is correctly declared. |
| DerivedDeRhamCohomology, PR #868 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:899`, §1.22, `DerivedDeRham.completionExchanges`. |
| PerfectoidQuotients, PR #1042 | `TauCetiRoadmap/PerfectoidQuotients/README.md:548`, 782, 831, 920 resolve §§0.1, 0.4–0.6. |
| AlgebraicModuliForArithmeticGeometry, PR #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1862`, 1936, 2063, 2301, 2466, 2836, 3233, 3790 resolve Layer 4 §§4.1–4.8; banded gerbes and H² classification are explicitly supplied. |

Object searches used the roadmap service over main and indexed open heads, and the board's packages, not only declaration-name grep. All five closest overlap heads were opened: PurityForFlatCohomology, ArcTopologyAndDescent, PrismaticCohomologyPartIII, PrismaticCohomology and PrismaticCohomologyPartII. The latter's prismatic/perfectoid constructions do not supply an alternative owner for the remaining henselian/topological headlines. R01 records the actual shared ownership found. The supplied overlap report lists no competing PR changing this folder, no dropped cited IDs, and no IDs defined only by an open revision. No additional numbering/merge conflict was found in the resolved citations. Main-roadmap suppliers were resolved on main, not silently replaced by an open revision.

All 28 gap slugs match between the README supplier subsections and `design/plan.json`; each has a named supplier, section and quantified needs. Five gaps are nonminimal: the continuity gap in R01, three in R02 and completion gap in R03. The remaining 23 are not treated as missing/unowned prerequisites merely because their supplier has yet to export them. Their differences from present inputs were checked: group Ext versus torsor H¹; smooth-stack lifting and nonsmooth torsor/H² cases; Cauchy algebraization without countability; punctured H² without flatness; nonconstant p-primary étale sheaves; torsor diagrams and complete torsor effectivity; group-category adapter and cotangent linearization; ample global generation and Brauer-class injectivity; geometrically regular henselized formal fibres; animation composition and general Postnikov square-zero classification; weakly-proregular adic-flat limits, finite-tuple complete-module hyperdescent and geometric Koszul supports; the Bégueri/cohomology/deformation/perfection exports; and integral Skolem. No supplier=`none` or new vague free predicate was found. The related outputs within these contracts belong to the same precise construction, rather than unrelated requests.

The prescribed dependency check on the unchanged package prints:

```
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This is not an ownership certificate: it cannot see the missing Purity supplier edge before R01 is fixed. The additional-supplier scratch test is reported in R01. No merge-order file was edited.

Read main DerivedModuleAlgebra, EnhancedDerivedSheaves and AlgebraicVectorBundles for shape. This package has the required Summary, Scope, Conventions, supplier contracts, build paragraph, mathematical layers, Examples/Dependencies endings, consumers and references. Definition sections retain prose APIs and at least three discriminating Checks; §9.0 has controls for each of its four native-carrier definitions. The order is explained by explicit needs, including the independent henselian H² input before continuity. The ample Brauer layer preceding the animated construction is not the source's chapter arrangement. No layer is named after a source chapter or says to follow its exposition. No computational algorithm, source passage copying, process date, PR number, machine path or HTML anchor was found in the roadmap/Lean text. The remaining concern is mathematical ownership, not thin exposition or missing Checks. `metadata.toml` is consistent with the algebraic-geometry topic.

## Not verifiable

No seeded locator was unreadable, and no new source request is pending. This review did not independently reconstruct proofs from external works cited inside CS24/DJ/BC22 (for example their Illusie, Lurie, SGA and Moret-Bailly references); their use here is through the named sources, supplied sections and explicit contracts. Availability of a declared contract is not claimed as an existing proof at the pins.

The computations above are adversarial mathematical tests, not formal proofs of all README targets. Only elaboration, the signature probes and the stated tactic/name probes were checked by Lean. Ownership searching covered the provided main/board/indexed-head corpus; it is not a claim about inaccessible or unindexed work.

## Source issues

- **Misprint** in CS24 at §5.2.1, printed page 53, line 2212: the source says the graded homotopy tensor equals a tensor involving one unbound degree i; it should be graded homotopy on both sides, or degree i on both sides; affects nothing.
- **Misprint** in CS24 at Example 5.6.7, printed page 75, line 3166: the source introduces the displayed comparison only for i≥2, then asserts surjectivity for i≥1; it should introduce the comparison for i≥1; affects nothing.
