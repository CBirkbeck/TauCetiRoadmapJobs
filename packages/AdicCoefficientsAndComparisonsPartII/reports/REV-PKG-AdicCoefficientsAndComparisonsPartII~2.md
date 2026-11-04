<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1109#issuecomment-6394830185 -->
Review (codex) of bdf5409

Verdict: needs_changes

1. **F01** (P1) The instability criterion is false when the characteristic exponent is one

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1153: “K is not stable exactly when some finite extension of K admits an immediate extension of degree p.”

   **Claim:** The equivalence holds under the standing convention that p is the residue characteristic exponent, including p = 1.

   **Witness:** K = C((t)) is discretely valued and stable. Its residue characteristic exponent is 1. The identity extension K/K is immediate of degree 1: the two sides are false and true.

   **Exact repair:** State the equivalence only for p > 1, or include p > 1 as a conjunct on its right. Retain the separate residue-characteristic-zero stability statement. Add the computed identity-extension negative control. temkin10 line 1750 uses the actual residue characteristic, treats zero separately, and line 1754 restricts the subsequent discussion to positive characteristic. On the witness the repaired right side is false. The degree-p tests for F₂((t)) and F₃((t)) remain unchanged.

2. **F02** (P1) Prime-supported component degrees are not preserved by arbitrary base change

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1264: “X′ → X is a projective P-alteration (generically a base change of the P-alteration Y′ → Y″).”

   **Claim:** A base change of a P-alteration has P-number degree at every generic source point, without a geometric-integrality or disjointness condition.

   **Witness:** E = Q(∛2), F = E(ω), P = {3}. E ⊗_Q E = E × F, with component degrees 1 and 2 over E. The original degree is 3.

   Take X″ = P¹_E over Y″ = Spec Q and Y′ = Spec E. The generic curve is smooth, integral and proper, as required, but not geometrically integral. All log structures can be trivial. The fibre product contains P¹_F, whose degree over P¹_E is 2, not a P-number. Saturation and a birational monoidal modification do not change this degree. The factorization follows by factoring T³ − 2 over the real field E: the quadratic factor has discriminant −3(∛2)².

   **Exact repair:** Add and own the general intermediate reduction that makes the generic curve geometrically integral before using componentwise degree preservation: normalize the curve/base as needed and replace the curve base by its normalization in the relative algebraic closure of its function field inside the curve's function field. State the resulting geometric-integrality and degree-preservation assertions, their hypotheses and their dependencies. Carry this condition through §5.6 and the induction. Do not cite SchemeAndStackFoundations §4.18's algebraically-closed-field fibration at arbitrary bases. On this example the replacement base is Spec E, P¹_E has geometrically integral generic fibre, and every finite base extension remains a single generic component of the original extension degree. Also audit §§6.3–6.8 for uses of this step. The end theorems need not be narrowed.

   Choosing one component is insufficient for general P. Let F = Q(x₁,…,x₅) with S₅ permuting independent variables, K = F^{S₅}, L = F^{S₄}, and E = F^{S₂×S₃}, where S₄ fixes one variable and S₂×S₃ preserves a partition into blocks of sizes 2 and 3. Then [L:K] = 5, while E ⊗_K L has field factors of degrees 2 and 3 over E, the two orbit sizes. Neither factor has degree a {5}-number. Thus simply discarding a component, which works for the cubic example, is not the general repair.

   The same unjustified componentwise inference occurs at ilo14 line 7646, Exposé X, proof of Theorem 3.5, Step 6. A source citation does not make it a valid inference.

3. **F03** (P1) Étale normal crossings are mistaken for strict normal crossings

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1034: “X is smooth over Y and the boundary is a relative snc divisor”.

   **Claim:** Regularity of X and log smoothness over a trivially logged field force a strict normal crossings boundary.

   **Witness:** In A²_C let D be y² = x²(x+1). The divisorial étale fs log scheme is log smooth. D is irreducible and nodal: its local dimension is 1, tangent dimension 2.

   Thus the boundary is normal crossings étale-locally, but its sole irreducible component is singular. The package's own §0.8 Check at line 341 already rejects this boundary as strict normal crossings.

   **Exact repair:** In the fs divisorial setting state the normal-crossings conclusion; require that the boundary is already strict normal crossings for the relative *strict* normal-crossings conclusion, as in §4.8 and ilo14 line 6965. Add the nodal cubic as a negative control here. The coordinate axes have two regular components and intersection codimension 2 and still satisfy the strict version. The irreducible node no longer satisfies its hypothesis.

4. **F04** (P1) Specialization-stable fixed loci need not be closed on arbitrary schemes

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:780, repeated at 786: “Inertia specializing ⇔ X^H closed for every H ≤ G.”

   **Claim:** This equivalence holds for the explicitly stated arbitrary scheme X.

   **Witness:** Glue two copies of Spec(∏ₙ F₃) along the open union U of their principal points. Let C₂ swap the copies. All specializations are identities; the fixed locus U is dense and nonclosed.

   Here D(eₙ) is the singleton corresponding to the nth coordinate, where eₙ is its idempotent. Their union is dense, because every nonempty basic clopen meets one of them, and proper because nonprincipal ultrafilters give additional points. Every prime is maximal. The swap is the identity on U and interchanges the two copies of each remaining point. Inertia therefore specializes, while X^{C₂} = U is not closed.

   **Exact repair:** Keep the action and inertia definitions on arbitrary schemes, but give the closed-fixed-locus equivalence under a noetherian hypothesis (or prove and state an adequate weaker hypothesis). Its applications in PA.4–PA.6 already have noetherian schemes. Add this non-quasi-separated negative control. For the noetherian control consisting of two points swapped by C₂ the fixed locus is empty and closed; the repaired equivalence gives true on both sides. The unrestricted claim at ilo14 lines 7175–7180 does not justify the stronger generality.

5. **F05** (P2) The stable-modification theorem cites the wrong alteration carrier

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1188 and 1198: “S be integral, quasi-compact and quasi-separated”; “§PA.0.3”.

   **Claim:** The existence theorem at arbitrary integral qcqs bases is stated using §0.3, which defines alterations between noetherian schemes.

   **Witness:** Let V be the rank-two valuation ring of k(x,y) with v(x) = (1,0), v(y) = (0,1), lexicographically ordered. Spec V is integral qcqs and nonnoetherian; its identity is outside §0.3.

   For example the ideal of elements with positive first value coordinate is not finitely generated: subtracting (0,1) from a candidate smallest value produces a smaller value still in the ideal. C = A¹_V with empty marking is already semistable, so the identity base change must be an available alteration.

   **Exact repair:** Explicitly use the general integral alteration carrier from SchemeAndStackFoundations §4.16 in §§5.3–5.4 and distinguish it from §0.3's noetherian generalization. The carrier `Formal.IsAlteration` in TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:2158 has properness, dominance and finiteness on a nonempty open, with no noetherian binder; its generically étale predicate is at 2170. Preserve the arbitrary qcqs theorem of temkin10 lines 136–155. For id_Spec V the three conditions are true on the whole base and the generic extension is separable of degree 1. This repair uses an existing owner, rather than a second alteration construction.

6. **F06** (P1) The Rumely proof route asserts a false Picard torsion input

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1424: “the torsion property of degree-zero Picard groups of relative curves over B that (a) and (b) guarantee”.

   **Claim:** Those base hypotheses make degree-zero line bundles on a projective relative curve torsion.

   **Witness:** Let E/F₅ be y² = x³+x+1 and R = O(E∖{O}). On E × Spec R, the generic-point section P gives O(P−O), of relative degree zero and infinite order.

   The discriminant is 4 modulo 5, so E is smooth. R is an excellent global Dedekind ring satisfying (a) and (b). If nP = O over Frac R, the multiplication map [n] on E would be constant on its generic point, contrary to its positive degree. The relative curve has total dimension two.

   **Exact repair:** State the actual intermediate input of moretbailly89 Théorème 2.3: for a separated finite-type B-scheme Z whose irreducible components are horizontal quasi-finite schemes or vertical curves, the subgroup of line bundles with degree zero on every proper vertical component is torsion under (T). Apply it to the relevant boundary schemes in the compactified-curve proof, not to the whole relative curve. Give this input a target/route and explicit dependency rather than silently treating the citation as a supplier. The hypotheses and definition are at moretbailly89 lines 175–189. On the counterexample the surface is excluded; on the vertical curve E/F₅ the degree-zero rational Picard group has 9 elements and is torsion. The Rumely existence theorem itself remains as stated.

7. **F07** (P3) The new analytic definitions still lack their individual Checks

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:1144–1168, especially “K is k-split” and “critical … special”.

   **Claim:** The repair of F06 supplies the required API and at least three discriminating Checks for every new definition.

   **Witness:** There are five Checks for the entire collection. None tests the k-split equality on a failing example; no Check computes a type-4 field or separates a critical nonspecial coset from a special one.

   **Exact repair:** Organize the definitions into readable groups with their own APIs and at least three discriminating Checks each. Cover analytic/one-dimensional fields and types, k-splitness, stability, generator types, special cosets, and the uniformization hypothesis. In particular, for a Gauss field over a finite extension k(α)/k with α outside the complete field k, the constant α has positive distance from k and distance zero from the algebraic closure: k-splitness fails. For algebraically closed k the two sets of approximation constants coincide. Add R01's characteristic-zero control. These are README Checks; no Lean padding is requested.

8. **F08** (P3) Scheme-theoretic images already exist at the pin

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/Suggested.lean:53: “scheme-theoretic image … carriers are absent”.

   **Claim:** The native scheme-image carrier is unavailable.

   **Witness:** Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:659 defines `AlgebraicGeometry.Scheme.Hom.image` as `f.ker.subscheme`; `imageι` is at 662 and `toImage` at 705.

   **Exact repair:** Remove scheme-theoretic image from the missing-carrier list and cite these native objects in the Mathlib contract where used. For Spec k → Spec k[ε]/(ε²), the image is the closed subscheme cut out by (ε), so this is the scheme-theoretic carrier, not merely a topological image. The other missing carriers still prevent the full headline from being stated; do not add a substitute theorem.

9. **F09** (P3) Several locators point to the wrong page or passage

   **Location:** packages/AdicCoefficientsAndComparisonsPartII/README.md:403, 417, 788, 853, 1398; packages/AdicCoefficientsAndComparisonsPartII/sources.toml:101, cjs entry.

   **Claim:** The listed pages/extraction lines locate the invoked results.

   **Witness:** cjs line 131 places Corollary 0.4 on printed page 5. temkin17 line 850 is §3.2.11; line 936 is §3.3.5. ilo14 line 7160 is Exposé X, not VI.

   **Exact repair:** Change cjs Corollary 0.4's page to 5, and grouped Theorems 0.1–0.3/Corollary 0.4 spans to pp. 3–5, including its manifest locator; the version numbering stays unchanged. In §3.3 point §3.2.11 to temkin17 line 850; retain line 936 only for §3.3.5. In §3.1 point Exposé VI §3.1 to ilo14 line 3263, retaining line 7160 for Exposé X. The dp23 proof invoked in §6.10 continues onto printed p. 9 (dp23 line 374), so cite pp. 8–9. Following these replacements reaches the precise claims used. No author-recorded manifest entry was changed during this review.

Nine findings: five P1, one P2 and three P3. The package is repairable. Its extension of the base roadmap has a coherent scope, and the dependency check finds no upward edge or cycle. Six blocking findings concern mathematical statements or the carriers used by them.

## Previous findings, checked individually

The previous review's F01–F12 and its repair report were read before the new pass. None was marked “not actionable in this package”. The excerpts below are from packages/AdicCoefficientsAndComparisonsPartII/README.md unless otherwise indicated. “Repaired” addresses the specific previous finding; it does not certify every new sentence surrounding the repair.

| Previous finding | Repaired passage and location | Assessment |
|---|---|---|
| F01: unsupported globally projective threefold resolution | 411: “in the proper sense”; 1230: “b remains a projective modification, and c is then proper”; 1260: “proper but not necessarily projective” | Repaired. The separated/proper and affine/projective distinctions match cp19. The obsolete unowned gap is absent. The newly expanded induction route has R02. |
| F02: noetherian Chow used over arbitrary A | 620: “§PA.0.7” and “§PA.0.5” replace the noetherian Chow input | Repaired. An integral tight model has one maximal point, so the non-separated Chow theorem applies over a rank-two valuation ring. |
| F03: vague/compound supplier gaps | 67: “X ×_S U → X₀ ×_S U an isomorphism”; 87: “when X is regular”; 95: “four statements about §0.10” | Repaired. Five slugs match design/plan.json; the statements have named suppliers and precise hypotheses. The four separately stated quotient/localization facts form one explicit interface, not an unspecified omnibus request. |
| F04: unparseable target headings | 128: “### 0.1 Residue characteristics of a scheme”; 1450: “### 6.12 de Jong's alteration theorem over a Dedekind base” | Repaired. Counted 63 numbered targets. |
| F05: duplicated paragraphs | 992: “### 4.3 Functorial saturated monoidal desingularization”; 1066: “### 4.8 Local forms of log smooth maps to points and traits” | Repaired. Each contains one statement/route, and the duplicated paragraphs in §§5.3, 5.6, 6.4–6.6 are absent. |
| F06: unowned/buried analytic and projection prerequisites | 1142: “One-dimensional analytic fields”; 1172: “Uniformization of one-dimensional valued and analytic fields”; 1418: “Rumely's theorem”; 1436: “Sections and linear projections” | Partly repaired. Ownership and build placement are explicit. The requested three discriminating Checks per definition are still absent (R07). New mathematical defects are R01 and R06. |
| F07: catalogue slugs and ambiguous references | 626: “§PA.1.8” dependencies resolve through §§0.5, 0.7, 1.1–1.7; 752: “Derived: separable variant” | Repaired. Renumbered references were followed to their new targets; no obsolete target slug is needed by a route. |
| F08: duplicate residue-degree/inertia/valuation carriers | 226: “f.residueDegree x”; 784: “SchemeInertia.decomposition” and “SchemeInertia.inertia”; 583: “ClassicalAdicEtaleCohomology §2.4” | Repaired. Native degree and supplier inertia specializations are explicitly reused. |
| F09: false claims that native carriers are missing | Suggested.lean 59: “properness, smoothness and the function-field degree exist”; 61: “regular local rings exist” | The four specified bullets are repaired. Searching the same pattern finds the remaining scheme-image claim in R08. |
| F10: incorrect consumers and unused supplier | 1474: “LogicAndDefinabilityInNumberTheoryPartII §2.1” and “EtaleDualityAndPerverseSheavesPartII Layers EQ.0, EQ.2 and EQ.6” | Repaired. Both board designs exist and consume these results. The base roadmap is no longer advertised as an upward consumer. |
| F11: projective morphisms/blow-ups lacked an owner | 116: “Consume Layer 2, projective morphisms, relative Proj” and “Layer 4, blow-ups” | Repaired. StableReduction's actual Layers 2 and 4 provide those objects. |
| F12: derived variants presented as verbatim source statements | 752, 917: “Derived: separable variant”; 296: Stacks tags 0815 and 081R | Repaired for the cited instances. Additional locator mistakes are grouped in R09. |

## Verified sound

Coverage: 191 computed rows cover all 63 targets, all 63 `*Needs:*` lines, seven layer dependency summaries, the conventions, supplier contracts, worked examples and every Lean docstring bullet were read. The computed tables below distinguish successful instances from refutations and dependency limitations. The earlier review was used only where its rows gave actual values, and the seeded targets and changed passages were rechecked directly. No source passage, algorithm, sorry'd data, set_option, or duplicate Lean declaration was introduced by the package. The source-cache content was treated as data.

### Seeded source verification

All fifteen sampled targets were compared with the available legal text, including theorem number, printed/internal page and hypotheses. All ten manifest works are readable and certified; none is marked unverified. Version notes identify the arXiv versions for ilo14 and temkin10 and the published temkin17 pagination.

| Target | Text opened | Hypothesis/content comparison |
|---|---|---|
| 0.4 P- and ℓ′-alterations | temkin17 lines 71–74, 249–271; ilo14 lines 6783–6787, 7288–7300, X §2 opening p. 148 and §3.3.1 p. 158 | Positive generic component degrees and prime support match; ℓ is prime and invertible in the ℓ′ applications. Arbitrary base change is not supplied by these definitions: R02. |
| 0.5 pseudo-projectivity | ilo14 lines 7223–7249, X §§3.1.6–3.1.8, pp. 157–158 | Local-isomorphism/quasi-projective factorization, base change, nonclosure under composition and proper-implies-projective match. |
| 0.12 threefolds | cp19 lines 93–102, Theorem 1.1 pp. 3–4; cjs lines 131–142, Corollary 0.4 p. 5 | Separated reduced qe dimension ≤3 gives proper resolution, projective over the chosen affine cover. The reduced boundary has dimension ≤2 in a regular excellent ambient scheme. F01 repaired; R09 fixes the page. |
| 1.2 pointed RZ | temkin17 lines 645–662, §§3.1.1–3.1.2 pp. 112–113 | Tight pointed modifications, locally ringed inverse limit, spectral topology and stalk colimit agree. |
| 2.1 tame/wild/unramified loci | temkin17 lines 770–776, 800–802, §§3.1.5, 3.2.7 pp. 115–116 | Restriction of valuations and henselian tameness agree; inseparability/defect are not discarded. |
| 2.5 field distillation | temkin17 lines 858–882, Theorem 3.2.12 pp. 117–118 | Finite extension, constructibly compact S and wild-prime support retained. Finite composita are taken inside the chosen maximal P-extension, not arbitrary extensions of P-number degree. |
| 3.3 wild primes | temkin17 lines 850–855, §3.2.11 p. 117, and 936–938, §3.3.5 p. 120 | Residual primes of wild valuations, finiteness and the inequality p ≤ degree agree. No false divisibility-by-global-degree claim. One extraction locator is R09. |
| 4.3 monoidal desingularization | ilo14 lines 4840–4856, VIII Theorem 3.3.15 p. 109; 4960–4982, Theorem 3.4.9 pp. 111–112 | Monoidally smooth means a local free-monoid extension; finiteness for qc schemes, localization and the log-regular condition on regularity conclusions are retained. |
| 4.8 local forms | ilo14 lines 6965–6970, X §2.3 Step 3 p. 152; 7127–7150, §2.6 Step 3 p. 155; 7692–7702, p. 166 | Strict boundary hypothesis and separate unit/branch exponents are present. The unit coordinate in π = u t^p is essential. The same strictness hypothesis was lost in §4.5 (R03). |
| 6.4 char(X) alterations | temkin17 lines 108–118, Theorem 1.2.5 p. 99; 1107–1117, §4.3.2 p. 124; cp19 lines 93–102 | The package deliberately separates the supported projective and separated/proper variants instead of copying the published overclaim. General inductive degree proof still has R02. |
| 6.5 morphisms | temkin17 lines 149–159, Theorem 1.2.9 p. 100; 1118–1120, §4.3.3 p. 124 | Maximal domination, finite type, regular sources, boundary diagram and separatedness for quasi-projectivity are tracked. Same proper/projective correction; R02 affects the route. |
| 6.8 one-dimensional base | ilo14 lines 6985–7001, X Theorem 2.4 p. 152; 7127–7150 p. 155 | Noetherian qe regular connected base, ℓ invertible, local monomial model, horizontal boundary and degree conditions agree. |
| 6.9 variety boundary | jannsen16 lines 1052–1059, Theorem 3.1 p. 24; primary ilo14 line 6790, X Theorem 2.1 p. 149 | Smooth quasi-projective source and snc boundary with degree prime to ℓ agree; primary input supplied through §6.7. |
| 6.11b sections/projections | dejong96 lines 1545–1603, §§8.1, 8.6 pp. 91–92; moretbailly89 lines 81–91, Theorem 1.7/§1.9 pp. 162–163 | Smooth locus dense on every fibre, global Dedekind base, finite base extension, sections meeting components and finite projection agree. Its Rumely proof input needs R06. |
| 6.12 Dedekind base | dejong96 lines 1551–1563, Theorem 8.2 p. 91; 1571–1611, §§8.5–8.6 pp. 91–92 | Global field, integral separated flat finite-type X, proper closed Z, projective regular compactification and local strict semistability agree. |

The added analytic targets were also read at temkin10 lines 284–465 (§2.1), 1746–1788 and 1990–2010 (§6.1), 2011–2047 (§6.2), 2333–2344 (§6.3), and the proof of Theorem 2.1.10 at line 2487. The three uniformization statements retain their different hypotheses; the missing p > 1 in the auxiliary criterion is R01. The new Rumely input was read at moretbailly89 lines 42–95, 175–189 and 291 onward; the theorem matches but the Picard proof input does not.

### Ownership, pinned APIs and supply direction

Object searches used the supplied board-package index, the main roadmap tree, board packages/designs, and the roadmap service's main/open-head index. Searched objects included alteration/degree, pointed Riemann–Zariski and model limits, tame inertia, log blow-ups, monoidal desingularization, stable modifications, analytic generators/special cosets, and Rumely/Moret-Bailly. The open-head search was performed using the supplied service; no unrelated pull request was sought. The three citation-resolver leads were resolved: the Logic consumer exists in its board design, and both VanishingCycles declarations exist in the supplied supplier head.

| Object/supplier | Current location actually resolved | Ownership conclusion |
|---|---|---|
| Existing base roadmap | TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md, L5, smoothAlterationPair | Ordinary smooth alteration pairs are the base endpoint. This Part II supplies prime-support control, arbitrary-rank tame distillation and its general geometric proof. |
| Approximation, Nagata/excellence | TauCetiRoadmap/SchemeAndStackFoundations/README.md §§0.9, 0.16–0.22 | Existing owner retained. Universal Japanese is distinguished from the noetherian Nagata predicate. |
| Quotients, modifications, alterations, SNC, curve fibrations | Same README §1.17 at 2657, §§4.11–4.13 at 5528–5680, §§4.16–4.20 at 6038–6411 | Integral alterations/SNC and de Jong's non-equivariant field/trait forms are imported. General/reducible supports and equivariant/global-base variants differ. The noetherian Chow hypothesis at 5625 is respected in §1.8. R05 identifies the missing general-carrier citation. |
| Geometric integrality of a curve fibration | Same README §4.18, generic_projection at 6197 and curve_fibration at 6207 | The latter is over an algebraically closed field; it does not repair R02 at arbitrary bases. |
| Projectivity, relative Proj, blow-ups, stable pointed curves | TauCetiRoadmap/StableReduction/README.md Layers 2, 3, 4, beginning at 354, 406, 468 | Imported, not duplicated. Non-proper curves and stability relative to a modification are the genuine extension. |
| Galois-normalization inertia | TauCetiRoadmap/EtaleCohomologyFoundations/README.md §F.0.A1, 285–299 | SchemeInertia is the specialization; arbitrary finite-group actions are the new domain. R04 limits one API equivalence. |
| Prime-supported and valued-field theory | packages/LocalFieldsRamificationPartII/design/README.md GF.0 (60–199), GF.1 (232–280), GF.2 (300–629), GF.5 (875–891), GF.6 (989–1005) | Imported local theory, including full versus separable P-closed exports. This package owns compact-set globalization, not those local constructions. |
| Log carriers and divisorial log regularity | TauCetiRoadmap/CrystallineCohomology/README.md CR.5:log-algebra.1–4, including divisorial/log-regular portion at §CR.5:log-algebra.4 | Actual supplied head read. The general non-fine closed-subset structure is the declared extension, and recovery is owned by §4.1 here. |
| Very tame quotients/Gabber | TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md §0.10, veryTameQuotient and equivariantLogResolution | Actual supplied head read, including separatedness/noetherian/qe/fs hypotheses. The new package adds non-separated inertia-specializing variants and functorial monoidal resolution. |
| Affine Zariski–Riemann model limit | TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md §2.4 | Actual supplied head read. It covers arbitrary A; PA.1 adds the pointed locally ringed comparison and stalks. |
| Analytic uniformization | Object searches for unramified generators, special cosets, type-4 fields | No second owner of temkin10's theorem found. Perfectoid/deep-ramification mentions do not provide this theorem. PA.5 is the owner. |
| Rumely/Moret-Bailly | TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md, Moret-Bailly target; merge position 198, versus this package at 122 | The consumed existence theorem moves to the earlier §6.11a here. The later approximation theorem is not an upward supplier; its specialization should consume this earlier owner. |
| Consumers | packages/LogicAndDefinabilityInNumberTheoryPartII/design/README.md §2.1; packages/EtaleDualityAndPerverseSheavesPartII/design/README.md EQ.0, EQ.2, EQ.6 | Exist in the board, as the package index/design context specifies. No missing-roadmap finding. |

The three main roadmaps read for shape were SchemeAndStackFoundations, StableReduction and EtaleCohomologyFoundations. The target has the prescribed summary, ownership, conventions, contracts, build paragraph, seven layers with Examples/Dependencies, consumers and references.

The pin revisions read from lake-manifest.json were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These declarations/definitions were opened, not inferred from declaration-name searches alone:

| Pinned file and line | Declaration and relevant content |
|---|---|
| Mathlib/AlgebraicGeometry/ResidueField.lean:45,147,151 | Scheme.residueField; Scheme.Hom.residueDegree uses Module.finrank, with totalized infinite value 0; identity degree 1. |
| TauCeti/AlgebraicGeometry/ResidueDegree.lean:47,65 | residueDegree_comp and residueDegree_pos_iff. Positivity requires finite residue extension; tower direction is degree(g) × degree(f). |
| Mathlib/AlgebraicGeometry/Noetherian.lean:277 | IsNoetherian includes local noetherianness and compactness, not separatedness. |
| Mathlib/AlgebraicGeometry/Normalization.lean:122,132,169,215 | normalization, toNormalization, fromNormalization, normalizationObjIso; finite normalization still needs the supplier's Nagata result. |
| Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean:161 | Scheme.Hom.isConstructible_image requires the finite-presentation/quasi-compact and target compact/quasi-separated hypotheses. |
| Mathlib/RingTheory/Unramified/LocalStructure.lean:376 | Algebra.IsEtaleAt.exists_isStandardEtale is for a finitely presented algebra étale at the chosen prime, not an arbitrary infinite valuation extension. |
| Mathlib/Topology/Spectral/ConstructibleTopology.lean:160 | compactSpace_withConstructibleTopology uses compactness, quasi-sobriety, prespectrality and quasi-separatedness. |
| Mathlib/RingTheory/Valuation/LocalSubring.lean:116 | LocalSubring.exists_le_valuationSubring gives a dominating valuation subring. |
| Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:274,330 | IsSeparated.valuativeCriterion is uniqueness; IsProper.eq_valuativeCriterion also tracks the finiteness/separation conditions. |
| Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:105,129 | isOpenMap_of_generalizingMap needs locally finite presentation; Flat.generalizingMap supplies generalization lifting. |
| Mathlib/RingTheory/RegularLocalRing/Defs.lean:51,92 | IsRegularLocalRing and IsRegularRing exist; they do not assert excellence. |
| TauCeti/AlgebraicGeometry/Scheme/RegularLocalRing.lean:50 | isRegularRing_iff_isRegularLocalRing_stalk requires an affine open and a noetherian ring of sections. |
| Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:659,662,705 | Scheme.Hom.image, imageι, toImage exist: R08. |
| TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73,212,241,253 | Arbitrary-rank valuation-relation carrier, comap, continuity and composition; it is not the pointed RZ locally ringed limit. |
| TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96,196 | Patch topology and its compactness. |
| TauCeti/AlgebraicGeometry/Quotient/Affine.lean:55,59 | Affine invariant quotient and projection. |
| TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:66,73,85 | Finite projection with finite-type hypotheses and equality of quotient points exactly along an orbit. |

No second native log-scheme, SNC-boundary, pointed RZ locally ringed limit, excellence, or scheme-projectivity carrier was found. Existing Proj and affine blow-up charts do not supply the missing global predicates and constructions. There are zero declarations in this package's Lean namespace, hence zero duplicated fully qualified Lean names.

The five declared gaps are precise contracts with matching plan/README slugs and earlier named suppliers. Their additional content is respectively relative finite-presentation factorization, the maximal separable P-extension, a possibly non-fine closed-subset log structure, four explicit quotient/localization properties, and the log-blow-up universal property. Existing carrier specializations are comparisons, not replacement constructions. No gap is assigned to “none”; none is counted as an unowned prerequisite.

Mechanical dependency output, from the requested command with --movable:

```text
depcheck: 49 roadmaps, 560 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The mutual references in §§6.1–6.2 are a simultaneous induction on relative dimension: §6.1 at d uses the inheritance argument for the base of dimension d−1; they are not a new roadmap supply cycle. R02 concerns the mathematical induction step, which the graph check cannot detect.

### Lean acceptance, headlines and padding

The headline inventory is §§0.6–0.7, 0.10–0.12, 1.4, 1.6, 2.5–2.6, 3.6–3.7, 4.2–4.6, 5.2, 5.2b, 5.3–5.4, 5.6, and 6.1–6.12 including 6.11a–6.11b: flattening/Chow/resolution; pointed compactness/openness; field and scheme distillation; log modifications; analytic uniformization/stable modification; and the general, prime-to-ℓ, odd-degree, equivariant and arithmetic alteration theorems. Each appears by number and missing carrier in the module docstring.

| README headlines | Full-statement obstacle recorded in the docstring |
|---|---|
| 0.6 finite-type flattening; 0.7 non-separated Chow | Global admissible blow-ups/strict transforms and projective or pseudo-projective morphisms |
| 0.10 dimension-one universal resolution; 0.11 excellent surfaces; 0.12 separated threefolds in the proper sense | Excellence/quasi-excellence and SNC boundaries; projectivity in the first two |
| 1.4 compactness and valuative description; 1.6 openness of pointed restriction | Pointed locally ringed RZ spaces and their centre comparison |
| 2.5 finite-field-extension tame distillation; 2.6 its separable variant | Arbitrary-rank henselian tameness and P-closed extension interfaces |
| 3.6 alteration distillation; 3.7 its separable variant | Geometric alterations, valued tameness and the universally Japanese base condition |
| 4.2 normalized monoidal blow-ups; 4.3 functorial saturated monoidal desingularization | Fine/fs log schemes, log ideals, blow-ups and fans |
| 4.4 inertia-specializing Gabber modification; 4.5 equivariant log-smooth preparation; 4.6 relative non-separated modification | Log regularity, log smoothness, group-action charts and very tame quotients |
| 5.2 projectivity of stable modification | Non-proper multipointed curves, dualizing sheaves and relative ampleness |
| 5.2b analytic and valued-field uniformization, all three variants | Analytic-field types, general henselian unramifiedness and normal projective curve models |
| 5.3 existence/uniqueness; 5.4 equivariance of stable modification | Multipointed curves, stable modifications and general generically étale alterations |
| 5.6 prime-supported resolution of relative curves | Universal resolvability, strict transforms and log-smooth pairs |
| 6.1 P-altered desingularization of morphisms; 6.2 inheritance; 6.3 perfect-field separable resolution | Quasi-excellence, SNC, projective alterations and log-smooth resolution diagrams |
| 6.4 char(X)-alterations; 6.5 char(S)-alterations of morphisms; 6.6 source refinement | The same geometric interfaces; scheme-theoretic image itself is native (R08) |
| 6.7 Gabber over a field; 6.8 Gabber over a one-dimensional base; 6.9 smooth variety alteration with boundary | Projective/quasi-projective geometry, relative SNC and log monomial models |
| 6.10 odd-degree regular DVR-model alteration | Excellence and projective morphisms |
| 6.11 equivariant de Jong alteration | Group-equivariant alteration and G-strict SNC compactification |
| 6.11a Rumely integral points | Excellence of the base ring |
| 6.11b sections and projections | Projective-space linear subspaces/projections over a general base |
| 6.12 de Jong over a global Dedekind base | Projective alteration compactifications and strict semistable pairs |

The authorized `lake env lean` elaboration of packages/AdicCoefficientsAndComparisonsPartII/Suggested.lean, run from the content checkout, exited 0 with no diagnostics. There is one `import Mathlib`, no TauCeti import needing a targeted build, no declarations, no sorry'd data and no set_option. Consequently the requested per-declaration `#check @name` comparison and one-tactic padding probes have empty domains: zero signatures, zero sorried theorems, zero padding. There was no admitted stand-in. The complete headlines still require missing substantial carriers; R08 corrects one inaccurate explanation without changing that conclusion.

### Computed adversarial pass

Each row records an actual instantiated value or truth value, not just a locator. “Pass” means that instance agrees; it is not a formal proof of the general theorem. Rows marked “route” retain a valid target but record an unresolved proof input. The same models are reused across layers so that conventions can be compared directly. Empty schemes are allowed where the statement permits them; fields and integral schemes are nonzero by hypothesis. No floating-point computation, division-by-zero convention, out-of-range indexing, determinant sign or complex period normalization occurs in a target here.

| Statement | Instances tried | Computed values on the two sides / hypothesis and conclusion | Result | Change |
|---|---|---|---|---|
| Conventions: positive P-number, ℓ′ | P empty; n = 0,1,2; ℓ = 2,3 | P-number(0)=false, P-number(1)=true, P-number(2)=false; gcd(2,2)=2, gcd(2,3)=1 | Pass | None |
| Conventions: characteristic sets | Spec Q, Spec F₂, Spec Z_(3), empty scheme | Sets are respectively empty, {2}, {3}, empty; 2 is a unit in Q and is zero in F₂ | Pass | None |
| Conventions: restriction direction | Q(i)/Q at (1+i) | Z[i]_(1+i) ∩ Q = Z_(2); target is a subring of Q, not Q(i) | Pass | None |
| Conventions: additive sign | u^p−u=t⁻¹, v(t)=1, p=2,3 | p v(u)=−1; v(u)=−1/2,−1/3, respectively | Pass | None |
| Conventions: monomial chart | xy=π versus x^p y^p=π | Z²/⟨(1,1)⟩=Z; Z²/⟨(p,p)⟩=Z⊕Z/p | Pass | None |
| Conventions: finite degree, no junk finrank | Q(i)/Q; Q(t)/Q | Degrees 2 and totalized 0; only the finite extension qualifies at an alteration's maximal point | Pass | None |
| Normalization carrier and identity | Z in Q(i); cusp in k(t); normal DVR in its own fraction field | Integral closures Z[i], k[t], DVR; generic degrees 2,1,1 | Pass | None |
| Normalization includes inseparability | F_p[t] in F_p(t^(1/p)), p=2,3 | Integral closure F_p[t^(1/p)]; degrees 2,3, separability false | Pass | None |
| Finite-presentation factorization contract | A/I, I not finitely generated; qc U=Spec A∖V(I) | Choose finitely many f_i∈I covering U, J=(f_i); A/J finitely presented, A/I its closed quotient, both restrictions to U empty | Pass | None |
| Maximal separable P-extension contract | P empty; separably closed imperfect characteristic 2 field | Separable finite degrees all 1; adjoining a missing square root has degree 2 and is excluded by separability | Pass | None |
| Closed-subset log contract | Axes; codimension-two origin in regular A² | Axes give units·x^a y^b; origin gives only units by extension across codimension two | Pass | None |
| Very tame versus tame | Sign on A²_C with empty boundary; with axes | At 0 inertia order 2 in both; strict-log stratum has dimension 2 versus 0; very tame false versus true | Pass | None |
| Very tame quotient invariant sheaf | Sign on axes pair | Invariants u=x²,v=xy,w=y², uw=v²; quotient monoid has lattice index 2, matching inertia order 2 | Pass | None |
| Very tame openness/localization | Same action with trivial log structure | Very tame locus=A²∖{0}, open; strict localization at 0 keeps the nontrivial two-dimensional action | Pass | None |
| Log-blow-up universal property | Unit ideal; a principal invertible log ideal | Already invertible, so universal factorization is the identity in both cases | Pass | None |
| 0.1 characteristic membership/unit iff | Spec Z[1/6]; Spec F₃ | Characteristic sets primes other than 2,3 and {3}; corresponding prime elements are exactly the nonunits | Pass | None |
| 0.1 empty/Q-scheme iff | Empty scheme; Spec Q; Spec Z_(2) | Characteristic set empty,true Q-structure; empty,true; {2},false | Pass | None |
| 0.1 morphism inclusion and surjective equality | Spec F₂→Spec Z; normalization Spec Z[i]→Spec Z | {2}⊆all primes; both normalization/source and base have all primes | Pass | None |
| 0.1 finiteness of omitted primes for dominant finite type maps | Spec Z[1/6]→Spec Z | Omitted prime set={2,3}, cardinality 2; generic characteristic remains zero | Pass | None |
| 0.2 maximal domination versus dominance | A¹ ⊔ Spec k→A¹, second component sent to 0 | Image is all A¹, so dominant; maximal source point of second component maps to nongeneric 0, so not maximal domination | Pass | None |
| 0.2 maximal domination versus surjectivity | One component of two crossing lines→union | Generic point maps to a generic point; misses the other generic point: maximal domination true, dominance/surjectivity false | Pass | None |
| 0.2 identities, composition, empty source | Identity; composed component inclusion; empty→X | Generic-point images stay generic in the first two; empty maximal-point condition is true, surjectivity onto nonempty X false | Pass | None |
| 0.3 alteration definition | Cusp normalization; P¹→Spec k | Cusp: proper, onto, generic degree 1; P¹ generic fibre dimension 1, so not generically finite | Pass | None |
| 0.3 generic finiteness and composition | Q⊂Q(i)⊂Q(i,√2) | Degrees 2,2; composite 4; all generic fibres finite | Pass | None |
| 0.3 reduction/normalization versus modification | Spec k→Spec k[ε]/(ε²) | Proper onto, residue degree 1; no dense open isomorphism on this one-point nonreduced scheme | Pass | None |
| 0.4 P-alteration and prime-to-ℓ | Spec Z[i]→Spec Z, P={2} | Degree 2: P-alteration true, 3′ true, 2′ false | Pass | None |
| 0.4 componentwise degree and multiplicativity | Two identical quadratic components; biquadratic tower | Component degrees (2,2), not total 4; tower at each point gives 2×2=4 | Pass | None |
| 0.4 support monotonicity | Degree 6, P={2,3}⊆{2,3,5} | Support={2,3}; membership true for both, false for {2} | Pass | None |
| 0.4 separability | Frobenius A¹_Fp→A¹_Fp, p=2,3 | Generic degree p, derivative 0; P={p} true, separable false | Pass | None |
| 0.4 degree one iff modification, integral condition | Cusp normalization; dual-number reduction | Integral cusp: both true; dual numbers: degree one true, modification false, integral hypothesis false | Pass | None |
| 0.5 pseudo-projectivity versus separatedness | Doubled affine line→A¹ | A local isomorphism, hence pseudo-projective; two origins violate separatedness, so not quasi-projective | Pass | None |
| 0.5 base change and proper case | Identity of P¹; base change to F₂ | Local-isomorphism factor=id, projective factor=P¹; both proper and projective before/after base change | Pass | None |
| 0.5 composition failure | Doubled A²; blow up only one origin | Composite has centres of a common arc of residue transcendence degrees 1 and 0; a local-isomorphism factor into a separated scheme would identify equal residue fields, impossible | Pass, negative example | None |
| 0.6 strict transform/flattening | Bl₀ A²→A², blow up the same ideal on base | Strict transform of the birational graph is the diagonal, hence id and flat; it is unchanged away from 0 | Pass | None |
| 0.6 admissibility/degeneracy | Unit ideal; already flat identity; U empty | Blow-up of unit ideal=id; identity is flat; agreement over empty U imposes no condition | Pass | None |
| 0.7 non-separated Chow | Doubled line over A¹; integral model over rank-two V | First already pseudo-projective, identity modification works; second has one maximal point, satisfying the finite-generic-point hypothesis without noetherianness | Pass | None |
| 0.8 SNC support and empty boundary | Coordinate axes; empty divisor in A² | Branch codimensions 1, intersection codimension 2; empty family gives empty support | Pass | None |
| 0.8 excludes nondivisors | Origin in A² | Codimension 2, so not a divisor support despite lying in V(xy) | Pass | None |
| 0.8 strictness | Irreducible nodal cubic | One component, local dimension 1 and tangent dimension 2: component not regular, so strict SNC=false | Pass | Reuse in R03 |
| 0.8 intersection multiplicity/control | Three distinct lines through 0 | Threefold intersection codimension 2, expected 3: SNC=false | Pass | None |
| 0.8 subfamilies and smooth pullback | One axis; axes×A¹ | Codimensions 1 and (1,1,2), respectively; both satisfy the required component conditions | Pass | None |
| 0.9 projective versus proper universal resolvability | Field; empty scheme | Finite field schemes reduce/normalize to finite products of fields, degree 1, projective; empty case has empty resolution | Pass | None |
| 0.9 non-qe DVR negative control | Non-Japanese DVR with nonfinite normalization A′ in finite K′ | A′ not finite; a proper normal resolution would force A′ inside finite Γ of a proper normal component and hence finite, contradiction | Pass, negative example | None |
| 0.9 P monotonicity and separable implication | Identity resolution of regular pair | Generic degree 1 has empty prime support and separable extension; satisfies every P in both senses | Pass | None |
| 0.10 dimension ≤1 | Spec Z with boundary primes 2,3; cusp curve | Identity preserves disjoint regular prime divisors; cusp normalization degree 1 gives smooth curve and distinct boundary points | Pass | None |
| 0.11 excellent surfaces | Blow up origin in regular A² | Exceptional divisor P¹ is regular of codimension 1; degree 1 and projective | Pass | None |
| 0.12 separated proper/affine projective | Spec Z_p[[u,v]], empty boundary; doubled plane over Z | First dimension 3, identity projective; second dimension 3 but not separated, so excluded | Pass | Locator R09 |
| 0.12 boundary resolution | Regular threefold with reduced closed subset of dimension ≤2 | Ambient is excellent; CJS boundary theorem has dimension bound 2; origin blow-up gives exceptional P², codimension 1 | Pass | None |
| 1.1 pointed/tight schemes | Spec F₂→Spec Z; G_m→A¹ | Closed immersion is proper and schematically dominant onto its image, hence tight; open G_m is not proper over A¹, so not tight | Pass | None |
| 1.1 pointed modifications/cofiltering | Identity; two blow-ups over one integral base | Identity degree 1; closure of diagonal generic point in product is proper and dominates both, generic degree 1 | Pass | None |
| 1.2 pointed locally ringed limit | DVR R with fraction field K | RZ has centres η,s and stalks K,R; identity model already realizes both | Pass | None |
| 1.2 nonnoetherian stalks | Rank-two valuation ring V | Three centres with stalks K,V_p,V; V is nonnoetherian, so no hidden noetherian-stalk requirement | Pass | None |
| 1.2 reduced/integral tight model | Spec K itself | One point, stalk K; limit of identity models gives the same locally ringed point | Pass | None |
| 1.3 valuation plus centre | Doubled line and its function field | The t-adic valuation has two distinct centres; a valuation ring alone would identify two different pointed points | Pass | None |
| 1.3 separatedness gives uniqueness | A¹ and k(t), t-adic valuation | Exactly one centre 0; at infinity there is no centre on A¹ | Pass | None |
| 1.3 centre/stalk domination | DVR pair | Generic stalk K dominated by K; closed stalk R dominated by R; maximal ideals pull back to 0 and m respectively | Pass | None |
| 1.4 Zariski compactness and constructible compactness | DVR RZ; finite-field point | Two-point specialization space versus discrete two-point patch; both compact; field case one point in both | Pass | None |
| 1.4 valuation description | V rank two | Valuations centred on Spec V are overrings V,V_p,K; three model-limit points, same three stalks | Pass | None |
| 1.5 restriction, identity and composition | Q⊂Q(i)⊂Q(i,√2) | (W∩Q(i))∩Q=W∩Q; identity restriction W∩L=W | Pass | None |
| 1.5 prolongations/fibres | Q(i)/Q at 2 and 5 | One prolongation above 2; two above 5; both restrict to the same respective local DVR | Pass | None |
| 1.6 openness | Q(i)/Q, invert 5 | Basic open excluding the two 5-adic prolongations maps to Val_Q excluding Z_(5), exactly the basic open 1/5∈V | Pass | None |
| 1.6 finite-presentation route condition | Infinite field extension Q(t)/Q versus finite Q(i)/Q | First has infinite degree and fails finite extension/presentation step; second degree 2 meets it | Pass | None |
| 1.7 absolute space/tautological subrings | F_q; Q | F_q has only its trivial valuation ring; Q has Q and Z_(p) for each prime p | Pass | None |
| 1.7 separated converse is not asserted | A fixed F_p-point of doubled line | Its pointed Val space has one point and forgetting centre is injective, although the ambient scheme is nonseparated | Pass | None |
| 1.7 open subsets/centres | Spec Z[1/6] pointed by Q | Valuation rings with centres are Q and Z_(p), p≠2,3; precisely those containing Z[1/6] | Pass | None |
| 1.8 affine comparison | A=Z, K=Q; A=rank-two V, K=Frac V | Both constructions give {Q,Z_(p)} in the first case and {K,V_p,V} in the second | Pass | None |
| 1.8 projective-model cofinality | Tight integral qcqs finite-type model over rank-two V | One maximal point; non-separated Chow plus properness makes a dominating projective model; no use of noetherian Chow | Pass | None |
| 2.1 tame/unramified/wild partition | Q(i)/Q at 2,3,5 | (e,f)=(2,1),(1,2),(1,1); wild,true only at 2; unramified and tame true at 3,5 | Pass | None |
| 2.1 identity and inseparability | L=K; F_p(t^(1/p))/F_p(t) with trivial valuation | Identity e=f=1, unramified; inseparable residue extension degree p fails tame despite e=1 | Pass | None |
| 2.1 Artin–Schreier wildness | u^p−u=t⁻¹ at t=0, p=2,3 | v(u)=−1/p, e=p, f=1; separable derivative −1, but wild=true | Pass | None |
| 2.2 S-tameness and empty set | Q(i)/Q, S={valuation over 2}, S empty | Universal tame test false and true respectively | Pass | None |
| 2.2 P-tameness and support | Same extension, P={3}, {2}, empty | True, false, true respectively, since wild primes={2} | Pass | None |
| 2.2 base-characteristic condition | Purely inseparable F_p(t^(1/p))/F_p(t), P empty | P-tameness vacuous; no map Spec F_p(t)→Spec Q, so the unqualified arithmetic-base interpretation is invalid and not used | Pass | None |
| 2.2 restriction/monotonicity | Tame set at 3,5 and subset {3} | Tame at both points=true; restricted assertion=true; enlarging to include 2 makes it false | Pass | None |
| 2.3 tower iff, tame | Q⊂Q(i)⊂Q(i,√3), valuation over 3 | First e=1,f=2, second e=2,f=1; composite e=2,f=2, residue characteristic 3: both stages and composite tame | Pass | None |
| 2.3 tower iff, unramified | Same tower; unramified tower of finite fields | First tower has ramified second step and composite, both conjunction and conclusion false; finite-field tower gives degrees 2×3=6, all e=1 and unramified | Pass | None |
| 2.3 tame base change/compositum | L=Q(i), K′=L | Composite field L/K′ is identity: e=f=1, tame; this field-compositum statement is distinct from R02's all-components degree claim | Pass | None |
| 2.4 openness of tame and unramified loci | Q(i)/Q | Both loci are Val_Q(i) minus the single valuation over 2; this is the open 1/2∈V | Pass | None |
| 2.4 minimal-polynomial proof repair | f(T)=T(T−1), a=0 | f′(a)=−1 is a unit, but minimal polynomial g=T has degree 1 versus degree(f)=2; g′(0)=1 | Pass: package uses corrected route | None |
| 2.5 compact-set distillation | Q(i)/Q, all valuations | P={2}; choose K′=L′=Q(i); base degree 2, relative tame degree 1 | Pass | None |
| 2.5 empty and inseparable cases | S empty; L=F_p(t^(1/p)) | Empty case K′=K; inseparable case choose K′=L′=L, base degree p, relative degree 1 tame | Pass | None |
| 2.5 finite composita in chosen P-extension | Q(i), Q(√2) inside a maximal 2-extension containing Q(ζ₈) | Subfield degrees 2,2; compositum Q(ζ₈) has degree 4, again a power of 2 | Pass | None |
| 2.6 separable distillation | AS extension at p=2,3; P empty and separable unramified extension | Choose K′=L gives separable base degree p and relative degree 1; already tame case uses base degree 1 | Pass | None |
| 3.1 decomposition versus inertia | Z[i]/Z at (1+i), (2+i), (3) | (order D,order I)=(2,2),(1,1),(2,1), agreeing with SchemeInertia | Pass | None |
| 3.1 inertia at nonclosed points | Sign on A²_C | Origin inertia C₂; every other scheme point has inertia 1, even when its underlying point is stabilized nontrivially | Pass | None |
| 3.1 whole-group order is insufficient | S₃ acting freely on six F₂-points | Group order 6=0 in F₂, inertia order 1=1; tame=true | Pass | None |
| 3.1 characteristic-p free action | C_p translations on A¹_Fp | Inertia=1 everywhere; at irreducible T^p−T−a, a≠0, decomposition order p and inertia 1 | Pass | None |
| 3.1 inertia specialization negative example | Doubled origin with fixed punctured axis and swapped origins | Generic fixed-axis inertia order 2; special origin order 1; inclusion false and fixed locus not closed | Pass | None |
| 3.1 fixed-locus iff on arbitrary X | Stone-spectrum gluing of R04 | All specialization inclusions true; fixed locus U dense proper, so closed=false | Fail | R04 |
| 3.1 admissible quotient and finiteness | Sign action on k[x,y], char k≠2 | Invariants k[u,v,w]/(uw−v²); x,y integral over invariants, finite generating set gives finite quotient map | Pass | None |
| 3.1 trivial group and identity | G=1 on arbitrary X | Inertia order 1, fixed scheme X, quotient X; all three action predicates true | Pass | None |
| 3.2 Galois alteration versus cover | Frobenius over F_p, G=1 | Invariant field extension purely inseparable of degree p: Galois alteration=true, separable Galois covering=false | Pass | None |
| 3.2 invariants exclude arbitrary extension | Q(∛2)/Q with trivial automorphism group | Degree 3, characteristic 0, invariant extension not purely inseparable: not a Galois alteration for G=1 | Pass | None |
| 3.2 tame covering | Z[i]/Z; invert 2 | Quotient Z in both; closed-point inertia at 2 order 2 makes first wild; after inversion all inertia orders 1 | Pass | None |
| 3.3 wild-prime set | Z[i]/Z; Frobenius F_p(t); t↦t² on A¹_Q | Sets {2}, {p}, empty respectively | Pass | None |
| 3.3 bound is inequality, not divisibility | T³−T−2 over Q at 2 | Discriminant −104; local factor degrees 1+2 with wild quadratic factor; 2≤3 but 2 does not divide 3 | Pass | None |
| 3.3 modifications have no wild primes | Cusp normalization | Function-field extension identity, degree 1, all valued extensions identity; wild set empty | Pass | None |
| 3.4 tame cover after modification | Q(i) over Z[1/2] | Normalization Z[i,1/2] already a finite étale cover, so modification=id and all inertia orders 1 | Pass | None |
| 3.4 tameness is not invertibility of group order | Q(ζ₃) over Z[1/3] | Group order 2, characteristic-2 fibres present; extension unramified there, inertia 1, so tame | Pass | None |
| 3.5 Galois-closure iff | Q(∛2), S₃ closure; T excluding 2,3, or empty | Outside discriminant primes both unramified=true; empty T gives true on both; including a wild 3-adic prolongation gives false on both | Pass | None |
| 3.6 alteration distillation | Z[i]/Z | Choose X′=Y′=Spec Z[i]; base P={2} degree 2; upper cover identity degree 1 | Pass | None |
| 3.6 inseparable input | Frobenius A¹_Fp→A¹_Fp | Choose X′=Y′=source; base degree p and upper G=1 tame identity | Pass | None |
| 3.7 separable variant | Gaussian example; AS p=2,3 | Base separable degree 2 or p; upper identity is separable/tame; no forced purely inseparable step | Pass | None |
| 4.1 log regular pair/rank formula | Axes in A²; trivial log on smooth A^d | Dimensions 2=0+rank(N²) and d=d+rank(0) | Pass | None |
| 4.1 log regular need not mean regular | uw=v² toric surface with toric boundary | Dimension 2=0+rank(P^gp)=2, log regular=true; tangent dimension 3>2, scheme regular=false | Pass | None |
| 4.1 exact boundary/recovery | (A²,{0}) | Boundary log structure is O×, nontriviality locus empty≠{0}; therefore this is not the claimed log regular pair with that exact boundary | Pass | None |
| 4.1 non-fine boundary | Cusp with origin boundary | Functions t²+a t³ have order 2 and pairwise different classes modulo local units; infinitely many indecomposable classes, so not fine | Pass | None |
| 4.2 normalized monoidal blow-up | uw=v², ideal (u,w) | u-chart has v²=u²s; normalization puts z=v/u, s=z², giving regular k[u,z] | Pass | None |
| 4.2 underlying blow-up and saturation | Same chart | Unsaturated chart is not normal; normalized ring k[u,z] has the same fraction field, generic degree 1 | Pass | None |
| 4.2 identity and localization | Unit ideal; invertible log ideal; product with A¹ | Blow-up identities in first two; third has normalized chart k[u,z,t], equal to strict smooth pullback | Pass | None |
| 4.3 monoidally smooth definition | P→P; P→P⊕N | Added free ranks 0 and 1; characteristic free factor records precisely these ranks | Pass | None |
| 4.3 desingularization/log regular restriction | Free monoid N^r; cusp with trivial log | Free chart requires zero subdivisions; cusp has monoid 0 already free but remains singular, so underlying regularity cannot omit log regularity | Pass | None |
| 4.3 nc versus strict nc | Nodal boundary versus axes | Étale branch ranks both 2 at crossing; global component counts 1 and 2; only axes are strict | Pass | Apply same distinction in R03 |
| 4.4 absolute Gabber modification | Sign on A²_C with empty boundary | Blow-up at 0: exceptional P¹, action trivial on it, normal coordinate sign; inertia acts trivially on characteristic N and stratum, so very tame | Pass | None |
| 4.4 modification need not be log smooth | Same blow-up to trivially logged A² | Exceptional fibre positive-dimensional with log point N→0; underlying birational blow-up not smooth, and the asserted log-smooth-over-target conclusion is absent | Pass | None |
| 4.5 preparation chart | G=1, axes pair over C | Chart 0→N², group cokernel Z² torsion 0; chart map is identity A²→A², smooth and étale | Pass | None |
| 4.5 regularity implies strict boundary | Nodal cubic from R03 | Regular X=true, log smooth=true; strict SNC=false by tangent dimension 2 versus curve dimension 1 | Fail | R03 |
| 4.6 relative Gabber/quotient | Sign axes pair over C; trivial G | Quotient uw=v² log regular; normalized monoidal charts regular; for G=1 quotient and modification can be identity | Pass | None |
| 4.7 deleting intermediate horizontal boundary | Axes pair over point; remove one or both axes | Remaining monoids N and 0; chart maps yield smooth coordinate models in both cases | Pass | None |
| 4.7 vertical containment is necessary | xy=π over logged trait, delete V(y) | Preimage of V(π) includes V(y), so containment hypothesis=false; missing branch would prevent the log morphism | Pass, negative control | None |
| 4.8 field form | Axes in A² over k | Underlying map smooth of relative dimension 2, branches smooth codimension 1 and crossing codimension 2 | Pass | None |
| 4.8 trait model and horizontal/total boundary | xy=π | Branch exponents (1,1), gcd(p,1,1)=1; total boundary two vertical branches, horizontal boundary empty | Pass | None |
| 4.8 unit exponents matter | π=u t^p, u invertible | Group map 1↦(1,p); cokernel Z, torsion 0 even in characteristic p; omitting u would incorrectly produce torsion Z/p | Pass | None |
| 4.8 bad torsion control | π=x^p y^p | Group cokernel Z⊕Z/p, gcd(p,p,p)=p; chart criterion fails in residue characteristic p | Pass | None |
| 5.1 multipointed curve/semistability | uv=π with empty or disjoint smooth marking | Generic fibre smooth; special fibre two branches with completed equation uv=0; node-marking violates smooth-marking condition | Pass | None |
| 5.1 cusp versus node | y²=x³; uv=0 | Cusp has one branch and δ=1; node two branches and δ=1; cusp is not an ordinary double point | Pass | None |
| 5.1 relative stability | Contracted P¹ with 1,2,3 special points | Dualizing-plus-marking degrees −1,0,1; stable exactly for the third | Pass | None |
| 5.1 identity modification | Unmarked P¹→itself | No contracted components, hence stable; absolute dualizing degree −2 does not disqualify relative stability | Pass | None |
| 5.1 étale marking split | Two conjugate marked points after finite étale base extension | Marking degree 2 becomes two disjoint degree-one sections; ordering requires the split base | Pass | None |
| 5.2 ampleness iff stability | Contracted rational component, m=1,2,3 | Degree m−2=−1,0,1; ample on contracted P¹ iff degree>0, agreeing with stability | Pass | None |
| 5.2 projectivity and identity | Identity of semistable unmarked P¹ | Relative fibres points, any invertible sheaf relatively ample; id projective despite absolute degree −2 | Pass | None |
| 5.2a analytic field and henselian uniqueness | Q_p, C((t)); rational field Q with p-adic norm | First two complete height one, unique finite prolongation; Q not complete, so not an analytic field by the definition | Pass | None |
| 5.2a topological generation/one-dimensionality | Gauss completion k(T); K=k | Closure of k(T) is K in first case, extension degree 1; in second no element lies outside the completed algebraic closure of k | Pass | None |
| 5.2a type 2 | Algebraically closed k, Gauss radius 1 | Value quotient rational rank E=0, residue transcendence F=1, E+F=1 | Pass | Checks still R07 |
| 5.2a type 3 | Gauss radius r outside divisible hull of values | E=1,F=0, sum=1; finite extension changes value index/residue degree but neither rational rank nor transcendence degree | Pass | Checks still R07 |
| 5.2a type 4 | Nested closed discs over C_p, empty intersection, radii with positive limit | Immediate one-dimensional completion has unchanged value group and residue field: E=0,F=0; sum=0 | Pass | Add Check under R07 |
| 5.2a k-split | k algebraically closed; Gauss field over Q_p(√p), constant α=√p | First infima identical; second inf over Q_p is p^(−1/2), inf over algebraic constants 0 | Pass, negative definition control | Add Checks under R07 |
| 5.2a stable/defectless | Q_p and its unramified quadratic extension | e=1,f=2, [L:K]=2, ef=2; testing only e would give false | Pass | None |
| 5.2a instability criterion | K=C((t)), p=1 | Stable=true; immediate degree-one identity exists=true; “not stable”=false | Fail | R01 |
| 5.2a generators | Gauss K over algebraically closed k, z=T | K/closure(k(T)) has degree=e=f=1; unramified=true and tame=true; z∈k would give wrong transcendence degree and is excluded | Pass | None |
| 5.2a S subgroup and split coset | F_p((t)), a=0, b=0, p=2,3 | (c+d)^p=c^p+d^p; 0 lies in S; zero coset split=true, critical=false | Pass | None |
| 5.2a critical special coset | b=t⁻¹, a=0, s=‖t‖⁻¹ | Norm minimum ‖t‖⁻¹ attained; p∤−1 prevents cancellation; split=false, critical=true, special=true | Pass | None |
| 5.2a noncritical control | b=t^(−m), p∤m, m>1, a=0, s=1 | Infimum=‖t‖^(−m)>1, so nonsplit=true but critical=false | Pass | Add Check under R07 |
| 5.2a stability/special-coset criterion | F_p((t)); C((t)) | First discretely valued stable=true and every relevant minimum attained; second p=1 makes stated disjunction true, consistent with stability | Pass | None |
| 5.2a deep ramification | Completion of Q_p(p^(1/p^∞)); completion of maximal tame Q_p extension | Value groups Z[1/p] and Z_(p); Frobenius onto modulo p in first, second not p-divisible | Pass | None |
| 5.2a uniformization hypothesis | Algebraically closed analytic k; discretely valued Q_p | First residue algebraically closed and value group divisible; Q_p residue F_p and value Z, so alternative hypothesis fails | Pass | None |
| 5.2b(i) generator and stability | Gauss and irrational-radius fields over algebraically closed k of residue characteristic 3; adjoin √T | Generator T gives degree 1; quadratic extensions have (e,f)=(1,2),(2,1), respectively, both ef=degree=2 | Pass | None |
| 5.2b(i) special coset contains tame generator | Gauss K over algebraically closed analytic k of characteristic p; b=T,a=0,s=1 | Residue T is not a pth power; infimum norm is 1, attained at T; T generates with relative degree 1 | Pass | None |
| 5.2b(ii) generator perturbation | Gauss T and T+c, ‖c‖<1 | Same residue T and same generated rational field for c∈k; relative degree 1 on both | Pass | None |
| 5.2b(ii) residue generator | Gauss T; algebraic constant | First residue transcendence 1, extension degree 1 separable; constant residue transcendence 0, excluded | Pass | None |
| 5.2b(ii) dimension-zero boundary case | K=k algebraically closed, y=0, x=0 | Closure(k(y))=k=K, unramified degree 1; every x′∈K gives the same field | Pass | None |
| 5.2b(iii) two composed-valuation cases | k trivially valued, K=k(t), trivial or t-adic valuation | First k·K°=K, choose separating parameter t; second k·K°=k[t]_(t), smooth centre 0, t is uniformizer; extension K/k(t) degree 1 | Pass | None |
| 5.3 existence at nonnoetherian base | A¹_V, rank-two V | Already semistable, identity base change degree 1; §0.3 noetherian carrier does not apply | Carrier mismatch | R05 |
| 5.3 minimality/uniqueness | Already semistable curve; extra blow-up producing exceptional P¹ | Stable modification is id; extra semistable modification factors through it uniquely; exceptional degree ≤0 prevents extra stable model | Pass | None |
| 5.4 equivariance/cocycle | uv=π, swap u,v; G=1 | Existing semistable model fixed, swap lifts to itself and square=id; trivial group's lift=id | Pass | None |
| 5.5 log smooth curve | uv=π over logged trait | Characteristic map N→N² diagonal, cokernel Z; regular log total dimension formula holds | Pass | None |
| 5.5 missing-base-boundary control | Nodal curve over trivially logged field, no markings | Smooth-off-W hypothesis with W empty=false; normalization not silently substituted, so no false log-smooth claim | Pass | None |
| 5.6 relative resolution/projectivity senses | Smooth curve with empty boundary over regular S | a=b=id, degrees 1; both proper/projective senses hold | Pass | None |
| 5.6 char(X) refinement with unused fibres | S=Spec Z_(2) ⊔ Spec Q, X=A¹_Q, P empty | char(S)={2}, char(X)=empty; active component degree 1 and unused regular component id, so conclusion holds | Pass | None |
| 5.6 generic base-change degree | Smooth P¹_E over Q, E=Q(∛2) | After base change E, component degrees 1,2 although base degree 3 | Route limitation | R02 |
| 6.1 diagram/boundary equality | f=id regular S, Z SNC | a=b=id, f′=id, W′=Z′=Z; both unions equal Z | Pass | None |
| 6.1 boundary union must be divisor | Origin Z in A², larger boundary axes | Z codimension 2 is not a sub-divisor of axes; preliminary blow-up makes inverse image exceptional Cartier divisor of codimension 1 | Pass: repair present | None |
| 6.1 induction degree | P={3}, P¹_E/Q and E/Q base change | Original degree 3 versus factor degrees (1,2); factor 2 violates P support | Fail in route | R02 |
| 6.1 component selection cannot repair general P | S₅ rational-function example of R02, P={5} | Total degree 5; H=S₂×S₃ orbits have sizes 2,3; neither component degree is a power of 5 | Fail in route | R02 |
| 6.1 P empty/perfect-field case | Q-variety, identity on smooth pair | Degree support empty forces degree 1; smooth identity realizes it with separability=true | Pass | R02 still required generally |
| 6.2 inheritance | Regular ambient A² and Z={0} | Blow-up degree 1, exceptional divisor regular; projective composite remains projective, proper composite remains proper | Pass | None |
| 6.3 perfect-field separability | F₂,F₃ and smooth pair; Frobenius negative control | Identity degree 1 separable; Frobenius degree p inseparable, so cannot witness the separable conclusion | Pass | General route R02 |
| 6.4 projective/proper split | Base Spec Z; base Spec Z_p[[u,v]] | Dimensions 1,3; first projective guarantee, second separated/proper guarantee; identity regular examples meet each | Pass | General route R02 |
| 6.4 nonreduced input | Spec Q[ε]/(ε²), Z empty | Reduced point regular, proper/projective, generic residue degree 1 supported on empty char set | Pass | None |
| 6.5 separatedness and pseudo-projectivity | Smooth variety over k; doubled affine line | Separated variety permits quasi-projective output; doubled line permits pseudo-projective but no automatic quasi-projective conclusion | Pass | General route R02 |
| 6.5 perfect field base | S=Spec k perfect, X smooth | a=id, b=id separable degree 1; both source and base regular and boundary empty | Pass | None |
| 6.6 char(X) source refinement | S=Spec Z_(2), X=Spec Q | char(S)={2}, char(X)=empty; choose id base/source, relative source degree 1, finite-type open immersion | Pass | General route R02 |
| 6.7 ℓ′ field alteration | k=F₃, ℓ=2; k=Q, ℓ=2 | Permitted p-power degrees 3^n are odd; characteristic zero purely inseparable base extension has degree 1 | Pass | General route R02 |
| 6.7 imperfect field boundary | k=F_p(a), boundary T^p−a on A¹, ℓ≠p | Purely inseparable base degree p allowed; over k(a^(1/p)) reduced boundary is one rational smooth point | Pass | None |
| 6.8 local trait form | xy=π with ℓ≠residue characteristic | Degree 1 prime to ℓ; exponents (1,1), horizontal boundary empty and total boundary two components | Pass | General route R02 |
| 6.8 invertibility of ℓ | Mixed characteristic p trait, ℓ=p | ℓ=0 in residue field, invertibility=false, so theorem does not claim a p′ resolution here | Pass | None |
| 6.9 connected/irreducible source | Smooth source over field with integral target | Connected regular components are disjoint irreducible components; chosen dominating component retains its positive ℓ′ generic degree | Pass | None |
| 6.10 odd degree and trace | Degree 3 or 2 on coefficients Z/2 | Multiplication by 3=identity; multiplication by 2=zero; only odd-degree result supplies the retraction | Pass | None |
| 6.10 no separability overgeneralization | Purely inseparable cubic in characteristic 3 | Degree 3 odd, separability=false; theorem does not add separability | Pass | Locator R09 |
| 6.11 equivariant compactification | G=C₂ on P¹_C, z↦−z, boundary {0,∞} | Choose identity alteration/group surjection; invariant fields both C(z²), invariant extension degree 1; boundary orbits are disjoint regular points | Pass | None |
| 6.11 trivial group | Smooth projective pair with G=1 | Group kernel=1, invariant extension degree 1 purely inseparable, compactification identity | Pass | None |
| 6.11a Rumely surjectivity | Spec Z[1/2]→Spec Z | Fibre over 2 empty; integral point would make 2 a unit in integral closure, impossible | Pass, negative control | None |
| 6.11a existence/finite closed subscheme | A¹_Z; conic x²+y²=−1 | Zero section degree 1; conic has no real/Z point but (i,0) over Z[i], degree 2 finite horizontal subscheme | Pass | None |
| 6.11a Picard proof input | E×Spec O(E∖O), E/F₅ in R06 | Relative degree of O(P−O)=0, order infinite; base (a),(b)=true | Fail | R06 |
| 6.11a corrected one-dimensional input | Vertical E/F₅ | Eight affine rational points plus O=9; Pic⁰(E)(F₅) order 9 and torsion | Pass for proposed repair | R06 |
| 6.11b sections and fibre components | P^d_S, d≥1 | Every fibre has one component; one standard section meets it, smoothness=true | Pass | None |
| 6.11b projection dimension and d=N | Standard P^d embedding | Centre dimension N−d−1=−1 means empty centre, not truncated natural subtraction; π=id, degree 1, étale=true | Pass | None |
| 6.11b centre/tangent avoidance | General d-dimensional fibre in P^N | (N−d−1)+d=N−1<N, so general centre misses fibre and each finitely many tangent d-planes | Pass | Rumely input R06 |
| 6.11b finite projection/étale open | Standard P^d case; chosen smooth section | Projection fibres points, degree 1; differential rank d at section, non-étale locus empty in standard case | Pass | None |
| 6.12 arithmetic alteration and boundary | Smooth projective P^d_S with coordinate SNC boundary | S₁=S, alteration/compactification=id, degree 1, generic smooth locus all S; boundary intersections have their coordinate codimensions | Pass | None |
| 6.12 strict semistability local control | uv=π at bad fibre in a semistable compactification | Multiplicities (1,1), completed equation uv−π; special fibre reduced with two transverse branches | Pass | General route needs R06 |

## Not verifiable

- No cited text was inaccessible: all ten manifest sources were available legally in the supplied cache. No missing-reference request or new manifest entry was needed.
- No Lean proof of a headline is present to verify. The empty signature file elaborates; that verifies its syntax/import environment only. The mathematical checks above do not claim to prove the general headline theorems.
- The five supplier gaps are declared future contracts, not implemented results certified by this review. Their precision, ownership, minimal scope and matching plan/README declarations were checked. Their present absence is not a finding.

## Source issues

- **Error** in ilo14 at Exposé X, Lemma 3.1.3, p. 156: the source says specialization-stable fixed subschemes are closed without a finiteness condition; it should be restricted to noetherian schemes or another setting excluding the Stone-spectrum example; affects a stated result.
- **Gap** in ilo14 at Exposé X, proof of Theorem 3.5, Step 6, p. 165: the source says generic base change preserves every component's prime-to-ℓ degree; it should be accompanied by a geometric-integrality argument or justified component selection; affects the proof.
- **Gap** in temkin17 at §4.3.2, p. 124, and Theorem 1.2.5, p. 99: the source says Cossart–Piltant supplies globally projective resolution for arbitrary quasi-excellent threefolds; it should be supplemented with arguments for global projectivity and non-separated schemes beyond cp19's stated result; affects a stated result.
- **Error** in temkin17 at §4.1.4, p. 121: the source says universal resolvability requires only proper resolving alterations, whereas later conclusions demand projective ones; it should be split into proper and projective notions with corresponding conclusions; affects a stated result.
- **Gap** in temkin17 at proof of Lemma 3.2.10, p. 117: the source says the monic polynomial from an étale presentation is the element's minimal polynomial; it should be replaced by the minimal polynomial, establishing its unit derivative by factorization; affects the proof.
- **Misprint** in temkin17 at proof of Lemma 3.2.10, p. 117: the source says an earlier part of this argument belongs to a theorem; it should be a reference to the first part of this lemma; affects nothing.
- **Misprint** in temkin17 at proof of Lemma 3.3.7, p. 120: the source says the forward implication is immediate and interchanges the induced valuation set and final compositum; it should be the reverse implication that is immediate, with induced valuations in S and final compositum L′; affects nothing.
- **Gap** in ilo14 at Exposé X, proof of Theorem 3.5, Step 3, p. 163: the source says a closed subset contained in an snc divisor is a subdivisor; it should be preceded by making the prescribed inverse image a Cartier support, for example by blowing up; affects the proof.
- **Misprint** in ilo14 at Exposé X, proof of Theorem 2.4, §2.6 Step 3, p. 155: the source says the unit and branch factors have ranks opposite to those in its subsequent direct sum; it should be consistent assignments of the unit and branch ranks in both formulas; affects nothing.

The four package inputs were left unchanged. The only deliverables written in the package are this report and review.json.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bdf540978eab50269d114446811b2ed82014d6e2", "job": "REV-PKG-AdicCoefficientsAndComparisonsPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
