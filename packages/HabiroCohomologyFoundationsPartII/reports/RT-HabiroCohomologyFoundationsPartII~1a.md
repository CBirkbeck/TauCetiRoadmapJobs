<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/151#issuecomment-6321891308 -->
Red team round 1 pass a (codex) of 755e915

Verdict: needs_changes

1. **F01** (P3) Pull-request URLs remain in supplier citations

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:24–25.

   Claim: Supplier citations link to four numbered pull requests.

   Witness: The links end in `pull/1057`, `pull/1065`, `pull/1070`, and `pull/1044`; the package contract requires timeless roadmap-name and section citations.

   Exact repair text: Replace these four link labels and URLs with plain `PrismaticCohomology Layer 0`, `PrismaticCohomologyPartII Layer 3`, `PrismaticCohomologyPartIII §7.0`, and `AInfCohomology §AI.7.2`, respectively, updating section numbers after checking their current owners.

2. **F02** (P1) Central supplier contracts have no available owner or declared gap

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:55–83, especially `From HabiroCohomologyFoundations`, `From RefinedTraceMethods`, and `From HabiroRings`.

   Claim: These three roadmaps already supply the filtered carriers, algebraic pairs, descents, trace comparisons, spherical lifts, and relative Habiro rings needed by every layer.

   Witness: None of these three folders exists in main, Completed, the supplied sibling heads, or the merge order; open-PR searches for Habiro and RefinedTraceMethods find no such roadmap. No plan or gap declaration exists.

   Exact repair text: Retain each precise mathematical contract, but change every unsupported supplied claim into `What <Supplier> must provide (gap:<slug>): <the existing contract, with its hypotheses>`, with one slug per independently consumable contract and a matching `gaps` entry naming that supplier and section. Obtain the missing supplier roadmaps and establish their order before claiming their targets are supplied. Until the base exists, do not describe this Part II as extending an available base roadmap. In particular, separate the full framed theorem, resolution comparison, pair coherences, and derived commutative refinement into distinct contracts rather than an undifferentiated gap.

3. **F03** (P3) The library pins in the supplier contract are stale

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:49.

   Claim: The inspected pins are Mathlib `082e2d37…` and Tau Ceti `f7904748…`.

   Witness: lake-manifest.json pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the local library checkouts match these hashes.

   Exact repair text: Replace the parenthesis by `(Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039)`. Keep the API claims only against these pins.

4. **F04** (P3) None of the ten references is recorded in a source manifest

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:449–462.

   Claim: The ten fixed reference versions support the package's locators.

   Witness: The package contains no sources.toml; `git diff --stat origin/main...HEAD` lists README.md, Suggested.lean, metadata.toml, and review.json only.

   Exact repair text: Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and entries QH, KU, TC, GSWZ, Bu, BS, BMS2, HA, Pri, and Stacks. Record their fixed versions, authors, title, year, locators, cited targets, and the source service's retrieval, hash, licence and status metadata. Do not include local paths.

5. **F05** (P2) The prime-two quotient tower has the wrong compatibility parameter

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:231, `the tensor product of the y_i-compatible structures`.

   Claim: The constructed quotient structures are y_i-compatible at every prime.

   Witness: Bu line 412 defines compatibility relative to the chosen v; Bu lines 483–485 use v=4 because S/2 has no unital multiplication. Here p=2 uses v=y_i², not y_i.

   Exact repair text: Replace the quoted phrase by `the tensor product of the y_i-compatible quotient structures at odd p, and of the y_i²-compatible quotient structures at p = 2 (with quotient exponent α_i/2)`; make the same distinction in any uniqueness or tower API.

6. **F06** (P2) The genuine fixed-point limit includes an undefined zero index

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:372, `m ∈ ℕ, ordered by divisibility`.

   Claim: P_R is a limit over every natural m of genuine C_m-fixed points followed by residual circle fixed points.

   Witness: At m=0, C_m is not the finite subgroup of S¹ of order m. GSWZ line 261 explicitly indexes by positive integers; §4.2 likewise requires m≥1.

   Exact repair text: Replace the index by `m ∈ ℕ_{>0}, with transition maps from mn to m`. State this positive-index convention for every cyclonic divisibility limit in §§1.3 and 4.1.

7. **F07** (P3) Several arithmetic Checks have no Lean mirror

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:242–250; packages/HabiroCohomologyFoundationsPartII/Suggested.lean:42–62.

   Claim: The README tests E1 at (2,3), (2,6), (3,1), and excludes exponent one at every prime.

   Witness: The sole E1 numerical example tests only (2,2), (2,5), (2,4), and (3,2). Neither other example supplies the omitted negative and positive cases or the universal exponent-one test.

   Exact repair text: Extend the existing E1 numerical conjunction with `¬ E1QuotientExponent 2 3 ∧ E1QuotientExponent 2 6 ∧ ¬ E1QuotientExponent 3 1`; extend its other proved example with `∀ p : ℕ, ¬ E1QuotientExponent p 1`. Keep at most two examples per definition. Add the concrete localization-unit Check of §4.1 to a second proved example for TraceInversion, or incorporate it into its existing example.

8. **F08** (P2) The étaleness milestone is easy to state but absent from Lean

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:383; packages/HabiroCohomologyFoundationsPartII/Suggested.lean:94–109.

   Claim: `TraceInversion.etale` is a named Layer 4 target asserting that the localized integers are étale over ℤ and finite étale over ℤ[1/Δ].

   Witness: `Algebra.Etale`, `NumberField.RingOfIntegers`, `Localization.Away`, and `TraceInversion` all exist at the current pins or in the file; no spectral or filtered carrier is needed for its absolute étale conclusion.

   Exact repair text: Add the representative statement, with a mathematics docstring, `theorem TraceInversion.etale {F : Type*} [Field F] [NumberField F] {Δ : ℤ} (h : TraceInversion F Δ) : Algebra.Etale ℤ (Localization.Away (Δ : 𝓞 F)) := by sorry`. Keep the finite étale strengthening in the README with its localized scalar map explicit, and mirror that strengthening too once its canonical algebra instance is fixed.

9. **F09** (P2) Perfect-regular presentations need not be torsion free

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:237, `In this range the hypothesis of §2.2 holds`.

   Claim: The exponent condition and a perfect-regular presentation supply every hypothesis of the naive-filtration criterion.

   Witness: Take p=3, A=B=ℤ₃, x=3, α=2. Then R=ℤ/9 has a perfect-regular presentation and E1QuotientExponent 3 2, but R is not 3-torsion free. QH lines 2754–2758 do not include torsion-freeness in that definition.

   Exact repair text: Keep the general spherical-lift assertion, but replace the following sentence by `If, in addition, R is p-torsion free, this lift supplies the remaining hypothesis of perfectedLiftNaive in §2.2; that criterion recovers the higher-power conclusion in this exponent range.` Add ℤ₃/9 as a negative-control Check for this implication.

10. **F10** (P2) The finite-coefficient Check omits its exponent range and zero exception

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:297, `ℤ/m is not torsion free. Its pair is HabiroCohomologyFoundations §5.26`.

   Claim: Every finite-coefficient ring is excluded from §2.3 and has the pair supplied by §5.26.

   Witness: For m=1, ℤ/m=0 is torsion free and admits the zero identity-cover input. The stated §5.26 contract at README:66 only supplies powerful coefficients; TC lines 1262–1265 and 1370 restrict the trace calculation to high-powered m.

   Exact repair text: `For m > 1, ℤ/m is not torsion free and is outside this theorem. For powerful m, the algebraic pair is supplied by HabiroCohomologyFoundations §5.26. For high-powered m in the sense of §2.1, RefinedTraceMethods §7.6 supplies its completed trace description. For m = 1 the zero ring is an identity-cover input; its pair and descent are the zero-ring Checks of Layer 1.`

11. **F11** (P2) Perfect coverage and relative perfection are assigned to the wrong owner

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:22, 81, 105, 130, 236.

   Claim: HabiroRings HR.1 supplies perfectly covered Λ-rings, and no direct QWittVectors contract is needed for these inputs.

   Witness: TauCetiRoadmap/QWittVectors/README.md:326–388 at its supplied head owns `ArithmeticLambdaRing.perfection`, `ArithmeticLambdaRing.IsPerfectlyCovered`, and `ArithmeticLambdaAlgebra.IsRelativelyPerfect`, including the toric examples and torsion-freeness.

   Exact repair text: Add `QWittVectors §§2.1–2.5 supplies arithmetic Λ-rings, their perfection, perfect coverage, and relative perfection, with the named APIs ArithmeticLambdaRing.perfection, ArithmeticLambdaRing.IsPerfectlyCovered, and ArithmeticLambdaAlgebra.IsRelativelyPerfect.` Repoint these parts of the supplier table and §§1.1, 2.1 Needs lines to QWittVectors. Leave only Habiro completion and gluing with HabiroRings; do not ask a gap supplier to rebuild these objects.

12. **F12** (P3) Proved examples lack declaration docstrings

   Location: packages/HabiroCohomologyFoundationsPartII/Suggested.lean:40–42, 48–49, 56–58, 79–80.

   Claim: These four examples are the package's discriminating tests.

   Witness: All four have only `--` comments. The required file form calls for a mathematics docstring on every declaration.

   Exact repair text: Convert the existing explanatory comments immediately preceding the four examples to `/-- ... -/` docstrings, preserving their mathematical content and incorporating the missing tests from R07.

13. **F13** (P3) The degree-zero Check only repeats the scope restriction

   Location: packages/HabiroCohomologyFoundationsPartII/README.md:426, `numberFieldTraceExports_degreeZero`.

   Claim: Saying that a ring isomorphism supplies no higher-module comparison is a discriminating Check of the construction.

   Witness: The sentence makes no evaluation or comparison on an input. Replacing P_R by any ring with no specified higher modules would pass the same sentence.

   Exact repair text: Remove this bullet from Checks and retain its content in the scope paragraph at line 31. The other six Checks in §4.2 remain; this sentence does not count toward the required discriminating tests.

## Verified sound

Read all 462 README lines and all 111 Lean lines. Audited 8 Lean declarations (3 definitions, 4 examples, 1 theorem), all 5 bold target blocks, all unbolded named operations and laws, and all 51 README Check bullets. Verified 103 distinct source locators in 10 legally retrieved works, as enumerated below. Checked 24 distinct supplier sections/layers across 7 available owners, and searched all 6 supplied sibling heads by object. Three other claimed supplier groups could not be certified (R02).

The Lean assertions are mathematically true with their written binders. The file uses one `import Mathlib`, real definition bodies, proved examples, and explicit field/number-field instances; there is no admitted data, `set_option`, `True` stand-in, `lemma` declaration, or forced spectral signature. No Lean command was run. The five bold spectral/filtered targets cannot be represented honestly on the pinned carriers; the omitted arithmetic milestone is R08.

The following tables record the adversarial pass, including failures. A source-supported formula does not certify its unavailable roadmap supplier: R02 applies to every row that consumes those suppliers.

| Lean declaration and line | Section; variable and instance context | Instances tried and result | Change |
| --- | --- | --- | --- |
| `E1QuotientExponent`, 32 | Layer 2; p α : ℕ; no instances | p=0,1,2,3; α=0,1,2,3,4,5,6. Total nonprime branch agrees with the explicitly documented convention; prime-two parity is retained. | R07 tests; R05 spectral compatibility wording |
| `E2QuotientExponent`, 37 | Layer 2; p α : ℕ; no instances | p=0,2,3; α=0,2,3,4,6,7. All stated truth values hold. | None to definition |
| `example`, 42 | Layer 2; closed | E1(2,2)=false, E1(2,5)=false, E1(2,4)=true, E1(3,2)=true. | R07, R12 |
| `example`, 49 | Layer 2; p α : ℕ; h : E2 p α | At p=2 the same parity and 6≥4 give E1; otherwise 3≥2. No primality hypothesis is needed. | R07, R12 |
| `example`, 58 | Layer 2; closed | E2(2,4)=false, E2(2,7)=false, E2(2,6)=true, E2(3,2)=false, E2(3,3)=true. | R12 |
| `TraceInversion`, 76 | Layer 4; F : Type u; Field F; NumberField F; Δ : ℤ | ℚ with Δ=6,1,0,−6; ℚ(i) with Δ=6,12. The predicate concerns Δ and is deliberately not intrinsic to its localization. | None to definition |
| `example`, 80 | Layer 4; closed; canonical instances on ℚ | Discriminant 1; 6 accepted; 1 rejected by divisibility; 0 and −6 rejected by positivity. | R07, R12 |
| `TraceInversion.isUnit_two_three`, 94 | Layer 4; F : Type u; Field F; NumberField F; Δ : ℤ; h : TraceInversion F Δ | Δ=6 and arbitrary admissible multiples: Δ is a unit, hence its divisor 6 is a unit; commuting factors 2 and 3 are units. No instance silently drops. | None to theorem |

| Bold target and README line | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `quotientLift`, 225 | Empty sequence; y=0 and y=1; T=0; p=2,3; boundary exponents | Empty tensor is T, unit quotient is zero, and no regularity is needed for the derived quotient theorem. The stated sufficient bounds follow from Burklund with v=y or v=y². | R05 |
| `perfectedLiftNaive`, 256 | Zero ring; perfect base; p=2,3; exponent one; toric x−1; p-torsion quotient ℤ₃/9 | The theorem itself retains p-torsion-freeness and completed faithful-flat descent. ℤ₃/9 is excluded, contrary to the preceding corollary's unconditional application. | R09 in §2.1; R02 supply |
| `tracePair_quasiRegular`, 285 | Identity cover; zero ring; rational non-lci algebra; ℤ/m; polynomial ring | The global cotangent and all-prime torsion-free restrictions are substantive; the finite-coefficient Check loses the m=1 case and the supplier's exponent range. Pair-coherence claims still depend on unavailable definitions. | R10; R02 supply |
| `canonicalFramedTrace`, 325 | d=0,1,2; ℚ(i)/ℚ; ℤ[x]; ℤ[x,y]; ℚ[x±1]; zero map versus specified counit | Source's specified comparison and prime-inversion domain agree. The polynomial line survives at 2; its tensor square requires inverting 2. The full framed and resolution contracts cannot be checked in the absent supplier. | R02 supply |
| `numberFieldTraceExports`, 397 | m=0,1; Δ=0,1,6,12,108; ℚ, ℚ(i), ℚ(∛2); p=2,3,5,7; identity embeddings | Transport uses ε inverse in the correct direction; Frobenius acts on coefficients. The zero index is undefined in P_R; completed terms at inverted primes vanish. | R06; R02 supply |

| Other definition/operation/law family | Instances tried and result | Change |
| --- | --- | --- |
| Rees grading, filtered quotient, chosen-pair convention (35–41) | Unit filtration gives ℤ at nonpositive degrees and zero at positive degrees after /β; degreewise /h fails. Shearing π₂ to filtration degree one and βt=h are consistent. These are supplier conventions, not new owned constructions. | R02 supply |
| `TraceInput`, morphisms, `forget`, `lifts`, `localChoice` (105–114) | Identity and composition of same-branch diagrams remain same-branch; mixed-branch ring identity is excluded by the stated category. Rational non-lci input is excluded despite zero local completions. | R02, R11 |
| `TraceInput.ofSpherical`, `.ofEtale`, `.ofFramed`, `.ofIdentityCover`, `.unit` (115–119) | ℤ[1/2][x], ℤ[x], ℚ(i), identity base, zero ring. Global cotangent amplitude, prime-two branch and torsion-freeness are retained. | R02, R11 |
| `tracePair`, `_map`, `_map_id`, `_map_comp`, `_completion`, `_modBeta`, `_rational`, `_pRational`, `_etale` (134–148) | Zero ring and nontrivial étale ℚ-algebra distinguish the pair from its completion; identity/composition follow from the specified diagram maps. Rational and p-adic rational clauses remain separate. | R02 supply |
| `tracePair_multiplicative`, `traceHabiro_multiplicative` (146, 186) | E₂ input at an odd prime gives E₁; E∞ gives E∞; E₁-cover branch uses the supplied preimage description. No converse or unrestricted uniqueness is asserted. | R02 supply |
| `traceHabiro`, `_map`, `_hCompletion`, `_partialCompletion`, `_qWittGraded`, `_smooth` (164–185) | m=1, n dividing m, R=0, R=ℤ[x]. Completion direction is from m to n; h-completion is q-Hodge; mod h of the line has zero differential and its Bockstein is de Rham. | R02 supply |
| `traceHabiro_pairEquiv`, `_periodic`, `_cyclonic` (187–189) | Identity equivalence; zero ring; invert 2; E₂ versus E∞ lift. The cyclonic assertion retains its 2-unit and multiplicative-level restrictions. | R02 supply |
| `quotientLift_framed`, `_identityCover`, `_perfected`, `_moore` (235–238) | Empty/regular sequences, exponent-one obstruction, ℤ₃/9, base change x↦p, m=1,9,16,64 versus 8,32,12. Identity-cover corollary has torsion-freeness; perfected corollary does not. | R09; R02 supply |
| `perfectedLiftNaive_qReg` (272) | Rational algebra, including a rational non-lci algebra; zero local completions | This algebraic corollary need not satisfy the separate global TraceInput amplitude condition; it retains the rational corner. | R02 supply |
| Coordinate q-derivative and filtration (315–321) | x and x²: derivatives 1 and (1+q)x; h→0 recovers 1 and 2x. Étale flatness preserves coordinate regularity, justifying division by hx_k. | R02 supply |
| `canonicalFramedTrace_pair`, `_habiro`, `_einfty` (335) | d=0 and d=1; chosen framing; identity comparison | Transport requires the specified enhanced equivalence, not the ordinary product on the displayed q-complex. | R02 supply |
| `TraceInversion`, `.isUnit_two_three`, `.etale` (361–383) | Δ=6 versus 1,0,−6; Gaussian Δ=6 versus 12; cubic Δ=108 | Arithmetic predicate and unit theorem hold. Discriminant inversion gives the stated étaleness with the two bases distinguished. | R07, R08 |
| `genuineRealisation`, `.epsilon` (370–383) | m=1 and m=0; periodic versus connective coefficients; π₀ after versus before limit | Source specifies genuine fixed points, then residual homotopy fixed points, then limit, then π₀. | R06; R02 supply |
| `numberFieldTraceExports`, `_cyclotomic`, `_taylor`, `_transition`, `_equalizer`, `_hCompletion`, `_naturality` (397–416) | m=1; p dividing Δ; Gaussian Frobenius at 7; split cubic at 5; identity and composable embeddings with common Δ | Inverse transport and prime-edge direction agree with GSWZ; full coefficient tensor preserves both cubic factors. Naturality is explicitly a target rather than attributed to an objectwise corollary. | R02 supply |

The 51 Check bullets were assessed as follows. Rows group only consecutive bullets; every bullet is included.

| README lines; count | Check instances and result | Change |
| --- | --- | --- |
| 123–128; 6 | Spherical absolute and inverted-two inputs pass; polynomial requires separate E₁ cover at 2; ku-lift is insufficient; rational square-zero algebra is not lci; mixed branch is excluded. | Supplier claims remain R02 |
| 152–156; 5 | Unit filtered quotient, zero ring's rational corner, ℚ(i) pullback cohomology, polynomial step weights, and stated multiplicative levels agree with the constructions. | Supplier claims remain R02 |
| 193–198; 6 | Étale descent, unit filtration, q-Hodge versus q-de Rham on x², ku obstruction, m=1 derived reduction, and zero descent distinguish the stated objects. At q=1 the two x² differentials give 0 and 2x dx. | Supplier claims remain R02 |
| 242–244; 3 | E1 boundary values at 2 and 3 are correct. | R07 missing mirrors |
| 245–247; 3 | E2 boundary values and E2⇒E1 are correct, including nonprime inputs for the arithmetic implication. | None mathematically |
| 248–250; 3 | S/8 demonstrates sufficiency only; 1 satisfies the empty-prime-divisor condition; 9,16,64 pass and 8,32,12 fail; exponent one fails the E1 predicate. | R07 arithmetic mirror; R02 spherical obstruction supply |
| 276–279; 4 | Higher-power comparison is valid under §2.2's standing torsion-free assumption; toric second divided power specializes to (x−1)²/2; exponent-one and rational-corner controls work. | R09 must not discard the standing assumption |
| 295–298; 4 | Toric and fourth-power identity covers agree with the hypotheses; square needs 2 inverted for this route; polynomial ring is not relatively semiperfect. Finite-coefficient assertion fails at m=1 and omits its range. | R10 |
| 339–343; 5 | d=1 and d=0 agree; the derived mod-h line has H⁰=ℤ[x] versus H⁰(M)/h=ℤ; d=2 requires 2 inverted; Laurent qdR and completed qΩ differ. For x², the Bockstein class is (1+q)x dx. | Supplier claims remain R02 |
| 387–391; 5 | Rational, positivity, Gaussian and cubic inversion tests are correct; the fixed-point order is the one in KU. In ℚ(i), −4 divides 12 but not 6. | R07 missing unit example; R06 indexing |
| 420–426; 7 | Rational completion and m=1 reduction pass; τ₁ kills other localization components; i⁷=−i detects twisting; mod-5 cubic factorization and irreducible quadratic pass; (1,0,…) fails the p=5 edge; Δ=1 fails the predicate. Last bullet is not a mathematical test. | R13; supplier claims remain R02 |

Source-locator audit: entries list distinct inspected locators; a range denotes each numbered item in it. These counts certify reading the relevant statement and its hypotheses, not independent formal proofs of the cited papers.

| Source ID | Count | Verified locators and line anchors |
| --- | --- | --- |
| QH | 32 | 1.19 (line 371), 1.22 (line 413), 2.9 (line 674); 3.1–3.3 (lines 850–940), 3.5–3.9 (lines 972–1022), 3.11–3.13 (lines 1089–1174); 4.4, 4.6–4.7 (lines 2501–2556), 4.17–4.18 (lines 2743–2769), 4.21–4.29 (lines 2813–3043), 4.31 (line 3075); A.12 (line 3452), A.14 (line 3514), Appendix B p.77 q-Pochhammer convention (line 3569). |
| KU | 44 | 1.2, 1.4 (lines 78–95), 1.9, 1.11 (lines 172–188), 1.14–1.15 (lines 292–312); 3.1–3.2 (lines 973–988), 3.10–3.11 (lines 1117–1123); 4.4–4.9 (lines 1505–1606), 4.14–4.18 (lines 1796–1949), 4.18a (line 2103), 4.21–4.23 (lines 1986–2088), 4.25–4.29 (lines 2107–2162); 5.43, 5.62–5.63 (lines 3142, 3548–3556); 6.1 (line 3611), 6.7–6.15 (lines 3678–3880); A.1 (line 3902). |
| TC | 6 | 3.3–3.8, lines 1262–1370. The printed finite-coefficient rational-corner argument is not accepted; README:445 already corrects it. |
| GSWZ | 4 | Definition 1.1 (line 260), equation (13) (line 273), footnote 1 (line 262), Remark 1.2 (line 311). The Gaussian twisting test uses an order-two Frobenius. |
| Bu | 7 | Theorems 1.1 (line 27), 1.4 (line 50), 1.5 (line 57); footnote 4 (line 86); Definition 5.1 (line 412); Remarks 5.5 and 5.7 (lines 474, 483). |
| BS | 4 | Theorem 15.3 (line 3898), Proposition 15.7 (line 3960), Lemma 16.10 (line 4148), Theorem 16.22 (line 4378). The available supplier retains its corrected quotient-completeness hypothesis. |
| BMS2 | 1 | Theorem 1.12, lines 252–297: double-speed filtration, completed prismatic coefficients and twists. |
| HA | 1 | Theorem 7.5.0.6, line 52724: spectral étale lifting through π₀. |
| Pri | 3 | Definition 1.1, Remark 1.2, Lemma 1.3, lines 93–111: toric operators, localization and normalized generators. |
| Stacks | 1 | Tag 07L7, Example 60.19.1, line 1728: the cosimplicial free-coordinate module calculation. |

The sign correction in README:446 passes the n=1 test: denominator 1−q is the negative of q−1. Its normalized second divided power and the distinction between q-derivative and h times q-derivative also pass. KU's incorrect citation to QH 3.12 is corrected to 3.13 in README:444. The resolution comparison in KU Remark 3.10 is only indicated there; the package correctly needs a separate theorem, but its claimed owner is unavailable (R02).

Available supplier checks used these versions and relative file locators:

| Supplier | Version and checked contract |
| --- | --- |
| QWittVectors | Supplied head; TauCetiRoadmap/QWittVectors/README.md §§2.1–2.5, especially lines 326–388. Arithmetic perfection and perfect coverage already have this owner. |
| HabiroCyclotomicCompletions | bf8812fbc41f0e74dca5b0ed5ae5a87c936707b4; TauCetiRoadmap/HabiroCyclotomicCompletions/README.md §§1.4, 2.3, 5.1, 5.3 (lines 575, 869, 1915, 2131). In particular lines 2133–2160 supply the localized component factors and noninjective global Taylor map. |
| StableHomotopyKTheory | 8b81fab0d6464d52bbe253bd9fd7f1ee5345efa5; TauCetiRoadmap/StableHomotopyKTheory/README.md:2638, §7.32. Uniqueness is for v-compatible quotients. |
| PrismaticCohomology | 699c8cb13afaff25ca357fc102bb972f12a79469; TauCetiRoadmap/PrismaticCohomology/README.md:304, Layer 0, including δ-rings. |
| PrismaticCohomologyPartII | d277f0728fa1513469b4e941f3a30060cb993f6c; TauCetiRoadmap/PrismaticCohomologyPartII/README.md §§3.1, 3.13–3.16, 3.20–3.23, 5.7–5.8 (lines 162, 489–689, 1746–1794). Frobenius twist, completion and q-PD hypotheses are explicit. |
| PrismaticCohomologyPartIII | 202bcbf99eab9cf63ba4c11c3f9bbfbc382ed272; TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:858, §7.0. Completed coefficients and twists are retained. |
| AInfCohomology | 839809fce0198b3adb92fa52e094aac3df47c5ab; TauCetiRoadmap/AInfCohomology/README.md:3821, §AI.7.2, with trace unfolding at lines 3959–3970. |

The other five supplied sibling heads have no matching Habiro/trace objects in their package files. Main and Completed were searched by the relevant objects and supplier names. The pinned-library searches found no replacement Habiro, q-Hodge, spherical-lift, THH or cyclonic carrier. They did find the arithmetic APIs used here, including Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36 and :75, Mathlib/RingTheory/Etale/Basic.lean:205, Mathlib/RingTheory/Smooth/Basic.lean:539, Mathlib/RingTheory/Localization/Away/Basic.lean:82, Mathlib/Algebra/Divisibility/Units.lean:129, Mathlib/Algebra/Group/Commute/Units.lean:74, Mathlib/Algebra/Divisibility/Hom.lean:31, and Mathlib/Data/Int/Cast/Lemmas.lean:333. The actual library commits are recorded in R03.

Mechanical dependency-check output, unchanged README:

```text
NOT IN ORDER: HabiroCohomologyFoundationsPartII (insert it after its last supplier)
depcheck: 7 roadmaps, 48 edges, 1 problem(s)
```

The command exited 1. It emitted no UPWARD or CYCLE line. The not-in-order line is not raised as a finding, as instructed; it does not certify the unavailable suppliers of R02. No ownership move from a later roadmap was needed. The QWittVectors correction points to an earlier owner.

The head diff contains only four files inside packages/HabiroCohomologyFoundationsPartII: README.md, Suggested.lean, metadata.toml and review.json, totaling 582 inserted lines. No computational algorithm or instruction injection was found in the package. The review changed no tracked package file and ran no build, git mutation, or posting operation.

## Not verifiable

- Exact declarations, sections, hypotheses and dependency direction for HabiroCohomologyFoundations, RefinedTraceMethods and HabiroRings: no readable roadmap head or matching declared-gap registry was available. This includes the framed prime-two resolution equivalence, full diagonal completion, all pair coherences and the naturality interface. Source mathematics cannot establish that a roadmap owns these APIs (R02).
- Lean elaboration and elaborated `#check @…` output: no Lean commands were authorized by the read-only pass. The audit checked source signatures and the pinned declarations statically; it does not claim a build result.
- Full implementation-level functoriality and independence of arbitrary gluing choices: the category and supplier coherence carriers are not defined in the package or pinned libraries. Their stated proof routes were checked against the source constructions, but cannot be certified as typed statements without the missing suppliers.

All ten cited works were retrieved legally through the sources service. No missing legal text, paywall waiver, or additional reference request remains.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "755e9152285c70663256e030417614440f0c3ac2", "job": "RT-HabiroCohomologyFoundationsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
