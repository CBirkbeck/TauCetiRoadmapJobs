<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1109#issuecomment-6406244993 -->
Review (claude) of 290931e

Verdict: needs_changes

1. **F01** (P2) Surface resolvability narrowed from quasi-excellent to excellent

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md:401–407` ("Every noetherian excellent scheme S of dimension at most two is universally resolvable"); propagated to line 3 ("excellent bases of dimension at most two"), §PA.6.4(i) lines 1426 and 1428 ("or S is excellent with dim S ≤ 2") and §PA.6.5(i) lines 1446 and 1448.

   **Claim.** Universal resolvability (projective sense) of two-dimensional bases is asserted only for excellent S, and the headline §PA.6.4(i)/§PA.6.5(i) projective conclusions are restricted accordingly.

   **Witness.** temkin17 line 108 (Theorem 1.2.5: S quasi-excellent of dimension ≤ 3) and lines 94–102 (Remark 1.2.3: the published case is quasi-excellent surfaces, by Lipman); ilo14 line 7318–7322 (X Remark 3.3.4(ii): every qe scheme of dimension ≤ 2 is universally resolvable). The restriction comes from the route only: cjs lines 39–40 state Theorem 0.1 for excellent schemes. The general case is supplied by stacks, Resolution of Surfaces line 1880 (Tag 0BGP, Lipman: a two-dimensional integral noetherian Y has a projective resolution by normalized blow-ups when its normalization is finite, has finitely many singular points and has normal completions there), already in the manifest's cached chapters. A quasi-excellent scheme is G and J-2 and Nagata (SchemeAndStackFoundations §§0.20–0.21), so a two-dimensional qe integral Y satisfies all three conditions: finite normalization (Nagata), finitely many singular points (J-2 closed singular locus of codimension ≥ 2 on a normal surface), normal completions (G-ring). The resolved regular qe scheme is excellent (regular ⇒ Cohen–Macaulay ⇒ universally catenary; the README already uses this at line 422), so cjs Corollary 0.4 (cjs line 131) applies unchanged for the snc boundary.

   **Repair.** In §PA.0.11 replace "excellent" by "quasi-excellent" in the title, statement and hypotheses, and replace the first step of the route (CJS Theorem 0.1) by: on each two-dimensional integral component of Y_red apply Lipman's theorem (stacks Tag 0BGP, Resolution of Surfaces line 1880) with the three conditions supplied by SchemeAndStackFoundations §§0.20–0.21; components of dimension ≤ 1 use §PA.0.10; the regular qe Y₁ is excellent, and CJS Corollary 0.4 finishes as now. Then write "quasi-excellent with dim S ≤ 2" at lines 3, 1426, 1428, 1446, 1448, and add the stacks locator (Tag 0BGP) to the §PA.0.11 citation and to the stacks `locator` field of `sources.toml`. Tested: for S = Spec of a two-dimensional regular qe local ring the identity still works (degree 1, Z′ = exceptional curve after one blow-up as in the existing Check); for excellent S the new route gives the same conclusion as the old one; §PA.0.12 is unchanged, since it already argues through "regular qe ⇒ excellent" before invoking CJS Corollary 0.4.

2. **F02** (P3) Supplier contract asserts what gap:very-tame-local-quotient declares missing

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md:99` ("The quotient log sheaf is the invariant direct image.") and line 107 ("The action API consumed here includes … openness of its locus and the stated abelian-inertia conclusion").

   **Claim.** The two sentences present as supplied by LefschetzPencilsAndVanishingCycles §0.10 exactly the statements (a), (b), (c) that line 101 declares as the gap.

   **Witness.** LefschetzPencilsAndVanishingCycles README at its open head, §0.10 (the `veryTameQuotient` construction): the quotient "exists as an fs log-regular scheme and the quotient map is a Kummer étale cover"; it says nothing about `(q_*M_X)^G`, about openness of the very tame locus, or about abelian inertia. The gap declaration at line 101 is the correct form; lines 99 and 107 contradict it.

   **Repair.** Line 99: replace the sentence by "Its log structure is the subject of the gap below." Line 107: replace "openness of its locus and the stated abelian-inertia conclusion with admissibility and generic freeness" by "and, through the declared gap, openness of its locus and the abelian-inertia conclusion under admissibility and generic freeness". Checked against the supplier text: pointwise and global very tameness, implication to tameness, and the Kummer étale quotient are stated there and stay as consumed.

3. **F03** (P3) CrystallineCohomology sub-targets cited by invented slugs

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md` lines 970, 1000, 1027, 1061, 1075, 1089, 1108, 1116, 1324, 1370, 1378, 1394, 1611, e.g. "CR.5:log-algebra.1–4 (log-smooth-chart-criterion)", "(integral-log-fiber-product)", "(saturated-monoid)".

   **Claim.** The parenthetical names read as the supplier's target names.

   **Witness.** CrystallineCohomology README at its open head, Layer CR.5:log-algebra.1–4: its targets are named "Associated log structures", "Fine monoids", "Saturated monoids", "Log charts", "Kummer morphisms", "Log fiber products", "Log smooth morphisms", "Kato chart criterion", "Divisorial log structures", "Log regular schemes" (with `LogCrystalline.IsLogRegular.trivial_iff`), "Log smoothness over log regular schemes", "Logarithmic Abhyankar lemma". None of the twelve slugs used here occurs in that layer (zero matches for each). The objects exist; only the names do not.

   **Repair.** Replace each slug by the supplier's target name: (log-structure) → (Associated log structures); (fine-monoid) → (Fine monoids); (saturated-monoid) → (Saturated monoids); (log-chart) → (Log charts); (kummer-morphism) → (Kummer morphisms); (integral-log-fiber-product) → (Log fiber products); (log-smooth) → (Log smooth morphisms); (log-smooth-chart-criterion) → (Kato chart criterion); (divisorial-log) → (Divisorial log structures); (log-regularity) → (Log regular schemes); (log-smooth-over-log-regular) → (Log smoothness over log regular schemes); (log-abhyankar) → (Logarithmic Abhyankar lemma); and at line 955 "trivial-log comparison" → `LogCrystalline.IsLogRegular.trivial_iff`.

4. **F04** (P3) Cusp Check gives a reason that fails over finite fields

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md:964` ("(Spec k[x², x³], {x = 0}) is not log regular: the associated log structure is not fine").

   **Claim.** The boundary log structure of the cusp is never fine.

   **Witness.** In the strict local ring at the origin, units of the normalization modulo units of the cusp are classified by the t-coefficient, giving (k, +). The characteristic monoid is {0} ∪ {(n, a) : n ≥ 2, a ∈ k} with componentwise addition. For k = F₂ it is generated by (2,0), (2,1), (3,0), (3,1), since (n, a) = (2, a) + (n − 2, 0) for n ≥ 4: finitely generated, hence fine, though not saturated (2·(1,0) = (2,0) with (1,0) absent). Only for infinite k are the indecomposables (2, a) infinite in number. The paragraph at line 968 already says "over an infinite field k"; the bullet does not.

   **Repair.** Rewrite the bullet: "(Spec k[x², x³], {x = 0}) is not log regular: the cusp is not normal. Over an infinite k the boundary log structure is not even fine; over a finite field it is fine but not saturated." Tested on F₂ (four generators, (1,0) in the group but not the monoid) and on an infinite k (indecomposables (2, a), a ∈ k).

5. **F05** (P3) Two board designs cite this roadmap under the name PrimeToDegreeAlterations

   **Location.** `packages/AdicCoefficientsAndComparisonsPartII/README.md:9` (Scope and ownership) and line 1615 ("LogicAndDefinabilityInNumberTheoryPartII §2.1 consumes the odd-degree regular model of §PA.6.10").

   **Claim.** The downstream consumer and the GF supplier can resolve their citations to this roadmap.

   **Witness.** `packages/LogicAndDefinabilityInNumberTheoryPartII/design/README.md:503` ("The odd-degree alteration is the PrimeToDegreeAlterations supplier contract") and line 55; `packages/LocalFieldsRamificationPartII/design/README.md:140, 218, 428, 591, 1045` ("PrimeToDegreeAlterations should import GF.2 for extension predicates"). The roadmap service reports "no match on main or in any open roadmap pull request" for PrimeToDegreeAlterations. This README's subtitle is "prime-to-degree alterations", so the alias is this roadmap.

   **Repair.** Add one sentence at the end of the first paragraph of Scope and ownership: "LocalFieldsRamificationPartII and LogicAndDefinabilityInNumberTheoryPartII refer to this roadmap as PrimeToDegreeAlterations; that alias resolves here." (LocalFieldsRamificationPartII line 1045 records its own alias the same way.) The downstream sentence at line 1615 is otherwise accurate: §2.1 of that design exists (line 491) and uses the odd-degree alteration.

Five findings: one P2 and four P3. All four findings of the previous round are repaired (table below). The new blocking finding is a narrowing of the surface-resolution input below what the sources state; it is repaired by a route change inside §PA.0.11 using material already cached in the manifest.

## Verified sound

### Previous findings, checked one by one

| Previous finding | Repaired passage (quoted ≤ 40 words) | Independent check | Status |
|---|---|---|---|
| F01 (P1) semistable comparison | README:1140 "the semistable pair gives a pointed prestable family in the terminology of StableReduction Layer 3; its stronger semistability predicate need not hold"; also lines 20, 122, 1153, 1159, 1172 | `TauCetiRoadmap/StableReduction/README.md:116–120`: SemistableFamily needs genus ≥ 1 and no rational tails; lines 406–416: prestable = proper, nodal, pure relative dimension one, geometrically connected; pointed = disjoint sections in the smooth locus. Unmarked P¹: genus 0, deg ω = −2, prestable true, supplier-semistable false, identity contracts nothing. E ∪ P¹ at one node: genus 1+0+0 = 1, degrees 2·1−2+1 = 1 and −2+1 = −1, sum 0 = 2·1−2 | Repaired |
| F02 (P2) empty log ideal | README:977 "The modification conclusion further requires I to have a nonempty stalk at every geometric point; equivalently … I O_X is the unit ideal at every generic point"; API line 984; Checks 994–995 | ilo14 line 4451 restricts monoidal blow-ups to nonempty ideals. Empty ideal on Spec F₂: Rees positive part 0, Proj = ∅, projective but not dominant. Two F₂-points with ideal empty on one: blow-up has 1 of 2 points. Equivalence both ways: nonempty stalk at a generic point gives a unit; an empty stalk is empty on the coherent chart's localization, hence at the generization | Repaired |
| F03 (P3) monoidal smoothness API | README:1007 definition with first-factor inclusion; API 1009–1013; Checks 1021–1023 | ilo14 line 4847 (VIII 3.3.14) matches. Characteristic maps 0→0, ℕ→ℕ² (1↦(1,0)), ×2 on ℕ in characteristic 3: cokernels 0, ℤ, ℤ/2; predicate true, true, false; composition adds r | Repaired |
| F04 (P3) process wording | README:1200 "the conjunction of p > 1 with the existence of an immediate degree-p extension has value false" | C((t)): p = 1, identity immediate of degree 1; conjunction false; stable true (temkin10 line 1750) | Repaired |

No finding was marked not actionable.

### Principles

No route-specific shortcut (arbitrary residue primes, arbitrary-rank valuations, inseparable extensions, non-separated sources retained), no re-planned roadmap (Part II of AdicCoefficientsAndComparisons, which stops at L5/smooth-alteration-pairs, head line 1699, with no prime control), no upward or cyclic supply (depcheck below), no copied passage, no algorithm, no sorry'd data, no `set_option`. R01 is the one place where the stated generality falls below the sources.

### Seeded source sample (15 targets)

| Target | Locator opened | Hypotheses and support |
|---|---|---|
| 0.3 | temkin17 lines 978–981 (§4.1.2, p. 121); ilo14 line 7288–7292 (X 3.3.1, p. 158) | Proper, surjective, maximally dominating, generically finite; Nor(S_red) → S for qe S. Equivalence with SchemeAndStackFoundations §4.16 for integral schemes: quasi-finite locus V open, U = S ∖ f(X ∖ V) nonempty, f⁻¹(U) → U proper quasi-finite hence finite |
| 0.7 | ilo14 lines 7246–7269 (X Prop. 3.1.8, Lemma 3.1.9, pp. 157–158) | qcqs, finite type, finitely many maximal points; projective modification, even a blow-up with nowhere dense support; pseudo-projective target. Matches verbatim in content |
| 0.9 | temkin17 lines 986–991 (§4.1.4, p. 121: proper sense); ilo14 lines 7304–7312 (X 3.3.3, p. 159: projective sense); ilo14 lines 7326–7332 (3.3.4(iv) counterexample) | Both senses stated with their sources. Non-Japanese DVR Check re-derived: Γ(Y′₀, O) is a finite A-module, integrally closed in k(Y′₀), contains A[y], hence contains A′; contradiction |
| 1.5 | temkin17 lines 686–706 (§3.1.5, pp. 113–114) | Restriction through Spec(O ∩ K); tight modifications cofinal; unique factorization by schematic dominance and separatedness; compatibility via valuative criterion |
| 1.7 | temkin17 lines 760–768 (§3.1.7, p. 115) | Val_K(Spec Z) = all valuation rings; image compact; ψ continuous and open by Lemma 3.1.6. The source's "if and only if separated" is not copied (doubled line: injective true, separated false) |
| 2.2 | temkin17 lines 779–799 (§§3.2.2–3.2.6, p. 116) | S-tame, X-tame, P-tame, char(S); modification invariance; Lemma 3.2.5 and Remark 3.2.6 supply the P-closed exports. The Spec Z_{P′} comparison is restricted here to char K = 0 or char K ∈ P (source issue below) |
| 2.5 | temkin17 lines 858–882 (Thm 3.2.12 and proof, pp. 117–118) | Finite L/K, constructibly compact S, P = char(S^w), K′ ⊆ K̄, L′ = LK′; proof route identical (compactness, open tame locus, composite of finitely many K_x) |
| 4.1 | ilo14 lines 3050–3078 (VI 1.2–1.4, p. 69), 3082–3091 (1.5), 7271–7275 (X 3.2.1, p. 158); temkin17 lines 126–135 (§1.2.7, pp. 99–100) | Log regular pair = Nizioł's O_X ∩ j_*O_U^×, fs, log regular, Z the non-triviality locus; converse VI 1.4; rank strata regular of codimension i (VI 1.5); cusp non-example (see R04) |
| 4.2 | ilo14 lines 4913–4925 (VIII Lemma 3.4.3), 4931–4955 (3.4.5, Lemma 3.4.6, pp. 110–111), 4761–4806 (3.3.7–3.3.11), 4451 (3.1.19 nonempty ideals) | Bijection log ideals ↔ monoidal ideals; Bl^{nor} comparison; strict pullback; Tor vanishing via Kato 6.1(ii). Projectivity and modification clauses are this README's additions with the hypotheses of F02 |
| 4.4 | ilo14 lines 3681–3699 (VIII Thm 1.1, p. 85), 7186–7222 (X 3.1.5 and proof, pp. 156–157) | Separated weakened to inertia specializing; projective modification, boundary f⁻¹(Z ∪ T), very tame; four-stage proof (local construction, specialization with G_x ⊆ G_y, atomic tower descent, uniform normalization bound). Quasi-excellence as in VIII 1.1 |
| 5.2 | temkin10 lines 104–134 (Thm 1.1 and proof, p. 3) | Any multipointed S-curve with a semistable modification; C-ampleness ⇔ stable; fibrewise check, base change of ω, classical stability of (Z, D ⊔ E) |
| 5.6 | temkin17 lines 999–1021 (Thm 4.2.1, pp. 121–122), 1022–1075 (proof); ilo14 lines 7345–7362 (X Thm 3.4, pp. 159–160) | Temkin's statement has char(X) ⊆ P; ILO's has ℓ invertible on S. The README's primary form (char(S) ⊆ P) and variant (char(X) ⊆ P, via shrinking to S₀) cover both; Temkin's Step 4 needs that shrinking (source issue below) |
| 6.6 | temkin17 lines 1121–1129 (Remark 4.3.4, p. 124) | "char(X)-alteration of a subscheme of X ×_S S′", outline only; the README's compositum-degree formulation [L : FE] is the precise content (residue field of the image point in X ×_S S′ is the compositum) |
| 6.8 | ilo14 lines 6985–7001 (X Thm 2.4, p. 152), 7692–7710 (3.5.3, pp. 165–166) | Separated integral noetherian excellent regular S of dimension 1, X separated flat finite type, ℓ invertible, (i)–(iii) as stated including gcd(p, a, b) = 1 and the sub-divisor clause |
| 6.11b | dejong96 lines 1545–1550 (§8.1, p. 91), 1582–1603 (§8.6, p. 92); moretbailly89 lines 81–91 (Thm 1.7, §1.9, pp. 162–163) | Sections through every fibre component via Rumely applied to sm(X/S) ∖ (X_s ∖ C); projection from an (N−d−1)-plane missing X and the tangent spaces at the sections; finite, étale along the sections; (T) holds for localizations of rings of integers and of affine curves over finite fields |

Stacks locators also opened: 0815 (flat line 4197), 081R (flat line 4250), 052A (morphisms line 2282, Proposition 28.1), 0BI4 (resolve line 1918), 0BGP (resolve line 1880), 0BIC (resolve line 2016), 04KV (varieties line 528), 020H (varieties line 886), 0C45 (varieties line 4034), 037J (fields line 1718), 05K0 (more-morphisms line 6247). Also reopened: temkin17 lines 903–933 (Lemma 3.3.4), 939–958 (Thm 3.3.6), 960–968 (Lemma 3.3.7), 850–855 (3.2.11 bound), 1078–1104 (Thm 4.3.1), 108–118 (Thm 1.2.5), 149–160 (Thm 1.2.9); cjs lines 38–44, 131–140. No author-flagged unverified locator exists; no fetch or manifest change was needed.

### Pinned library audit by object

Content main `23968d2`; Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lake-manifest, confirmed by `git rev-parse` in both packages).

| Declaration | File:line at the pin | What it does and does not supply |
|---|---|---|
| `Scheme.Hom.residueDegree`, `residueDegree_id`, `residueDegree_eq_finrank` | Mathlib/AlgebraicGeometry/ResidueField.lean:147, 152, 377 | ℕ-valued; 0 for infinite extensions; README uses it only at maximal points of alterations |
| `Hom.image`, `Hom.imageι`, `Hom.toImageAux`/`toImage` | Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:659, 662, 687 | Image is the kernel-ideal subscheme with factorization X → image → Y |
| `Hom.normalization`, `toNormalization`, `fromNormalization`, `normalizationObjIso` | Mathlib/AlgebraicGeometry/Normalization.lean:122, 132, 169, 215 | Relative normalization; finiteness not included |
| `IsEtaleAt.exists_isStandardEtale` | Mathlib/RingTheory/Unramified/LocalStructure.lean:376 | Finite presentation and étaleness at a prime |
| `compactSpace_withConstructibleTopology` | Mathlib/Topology/Spectral/ConstructibleTopology.lean:160 | Needs compact, quasi-sober, prespectral, quasi-separated |
| `LocalSubring.exists_le_valuationSubring` | Mathlib/RingTheory/Valuation/LocalSubring.lean:116 | Dominating valuation subring, any rank |
| `IsProper.eq_valuativeCriterion`, `IsSeparated.valuativeCriterion` | Mathlib/AlgebraicGeometry/ValuativeCriterion.lean (header lines 21–24; statements from 231) | Existence/uniqueness with qc, qs, finite-type packaged |
| `Flat.generalizingMap`, `isOpenMap_of_generalizingMap`, `Hom.isConstructible_image` | Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:129, 105; FinitePresentation.lean:161 | Openness needs local finite presentation; Chevalley needs qc map and qcqs target |
| `algebraicClosure` | Mathlib/FieldTheory/AlgebraicClosure.lean:39 | Relative algebraic closure as intermediate field |
| `IsRegularLocalRing`, `IsRegularRing` | Mathlib/RingTheory/RegularLocalRing/Defs.lean:51, 92 | Noetherian regular predicates only |
| `IsNoetherian`, `IsProper`, `IsFinite`, `IsDominant`, `Flat`, `Etale`, `Smooth`, `IsSeparated` | Noetherian.lean:277; Morphisms/Proper.lean:41; Finite.lean:40; UnderlyingMap.lean:216; Flat.lean:42; Etale.lean:39; Smooth.lean:59; Separated.lean:43 | Standard predicates; IsNoetherian does not include separatedness |
| `TauCeti.ValuationSpectrum`, `comap` | TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73, 212 | Valuative relations on any ring |
| `patchTopology`, `compactSpace_patchTopology` | TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean (module header lines 40, 47) | Compact witness topology |
| `residueDegree_comp`, `residueDegree_pos_iff` | TauCeti/AlgebraicGeometry/ResidueDegree.lean:47, 65 | Tower law and positivity iff finite |
| `AffineInvariantQuotient.projection`, `isFinite_projection`, `isFinite_projection_of_finiteType` | TauCeti/AlgebraicGeometry/Quotient/Affine.lean:59; FiniteGroup/Affine.lean:66, 73 | Finite-type hypothesis over invariants retained |
| Absent at the pins (recursive grep of both libraries) | — | no log-structure, excellent/quasi-excellent, Nagata, projective-or-quasi-projective-morphism, strict-normal-crossings or tame-ramification predicate; Tau Ceti's only `IsProjective` hits are module-theoretic |

### Supplier resolution, ownership and direction

| Supplier / object | Resolved where | Conclusion |
|---|---|---|
| AdicCoefficientsAndComparisons L5/smooth-alteration-pairs | head, README line 1699 | Base roadmap stops at smooth alteration pairs without prime control; this Part II is the extension |
| SchemeAndStackFoundations §§0.9, 0.16–0.22, 1.17, 2.4, 2.6, 2.11, 3.3–3.6, 4.11–4.20 | main, README lines 848, 1099–1462, 2624, 3364, 3437, 3656, 4713–4905, 5528–6411; names `genericDegree`/`genericDegree_comp` 6043–6046, `flattening_by_blowup` 5617, `chow_lemma` 5625, `resolution_of_curves` 5656, `bertini_smoothness` 5680, `finiteGroupQuotient_projective` 2643, `alteration_theorem` 6374; Suggested.lean `Formal.IsAlteration` 2158 (namespace `Formal` from 1973; fields isProper, isDominant, generically_finite), `IsAlteration.IsGenericallyEtale` 2170 (needs IsIntegral on both), `IsQuasiExcellentRing.isNagata` 322, `IsStrictNormalCrossings` 2242 | All cited names exist; the integral alteration carrier has no noetherian binder, as the README says |
| StableReduction Layers 2–4 | main, README lines 112–120, 354–392, 406–419, 468–475 | Terminology, dualizing degree formula, prestable/pointed definitions and blow-ups as cited; base convention (lines 91–101) keeps definitions base-general |
| EtaleCohomologyFoundations §F.0.A1 `SchemeInertia` | main, README lines 284–299 | Decomposition/inertia for finite Galois normalizations |
| AlgebraicCurves constant field | main, README lines 115–119 | Uses `algebraicClosure`; no competing carrier |
| LocalFieldsRamificationPartII GF.0/GF.1/GF.2/GF.5/GF.6 targets | board design README lines 60, 91, 152, 199, 232, 300, 407 (`IsTame.baseChange` 417), 601, 629, 875, 891, 989, 1005 | Every cited slug exists; "tame base change" is `IsTame.baseChange`; its lines 140, 218, 428, 591, 1045 cite this roadmap as PrimeToDegreeAlterations (R05) |
| CrystallineCohomology CR.5:log-algebra.1–4 | head, README lines 7525, 7749, 7879, 7975; targets Divisorial log structures (M_D = O_X ∩ j_*O_U^× for snc D), Log regular schemes (`IsLogRegular.trivial_iff`), Log smoothness over log regular schemes, Logarithmic Abhyankar lemma, Kato chart criterion, Log fiber products | Objects exist; slugs do not (R03). Gap closed-subset-log-structure asks for the general reduced-X form, which the supplier states only for snc D |
| LefschetzPencilsAndVanishingCycles §0.10 | head, README lines 697–830: `veryTameQuotient` 729, `galoisSemistableAlteration`, `equivariantLogResolution` 781 (absolute and relative, separated qe), `regularLogResolution` 810 | Supplier statements match the contract except the two sentences of R02; gaps (a)–(d) and the log-blow-up universal property are indeed absent there |
| ClassicalAdicEtaleCohomology §2.4 | head, README line 918 | Homeomorphism of {V ⊇ s(A)} with the limit of integral projective models |
| LogicAndDefinabilityInNumberTheoryPartII §2.1; EtaleDualityAndPerverseSheavesPartII | board designs, lines 491/503 and 21 mentions | Outgoing consumers only |
| Merge order | ORDER.txt: SchemeAndStackFoundations 2, LocalFieldsRamificationPartII 14, EtaleCohomologyFoundations 20, CrystallineCohomology 23, LefschetzPencilsAndVanishingCycles 64, ClassicalAdicEtaleCohomology 65, AdicCoefficientsAndComparisons 121, this roadmap 122; StableReduction and AlgebraicCurves on main | All suppliers earlier or on main |

Ownership by object (roadmap service grep over main and the indexed open heads, plus the board packages) found no second owner of pointed Riemann–Zariski spaces, tame distillation, non-proper stable modification, monoidally smooth functoriality, inertia-specializing Gabber modification, Rumely with boundary Picard torsion, or the arithmetic sections/projections. The empty `Suggested.lean` namespace cannot collide. The five gap slugs in `design/plan.json` equal the five README contracts (lines 69, 81, 93, 101, 105); each names its supplier and section; none asks for what the supplier already has (the closed-subset log structure is stated by CrystallineCohomology only for snc D on regular X).

Dependency check (authorized command, with `--movable`):

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Citation resolver: one lead (LogicAndDefinabilityInNumberTheoryPartII §2.1), resolved to the board design at line 491; no Lean-name lead.

### Headline theorems, Lean form and padding

`lake env lean` on `packages/AdicCoefficientsAndComparisonsPartII/Suggested.lean` from the content checkout: exit 0, no output (no warning, no `sorry`), 3.9 s; single `import Mathlib`, no TauCeti module to build. The file declares nothing, so the `#check` signature audit and the one-tactic padding probe have empty domains. Every headline family of the README (0.6, 0.7, 0.10–0.12, 1.4, 1.6, 2.5, 2.6, 3.6, 3.7, 4.2–4.6, 5.2, 5.2b, 5.3–5.4, 5.6, 6.1–6.12 including 6.11a and 6.11b) is named in the module docstring with the missing carrier; the greps above confirm that none of those carriers (log schemes, excellence, projective morphisms, snc divisors, henselian tameness, alterations) exists at the pins, and that the native objects named as existing (`residueDegree`, `image`, `IsProper`, `Smooth`, `functionField`, `IsRegularLocalRing`) do. No stand-in is stated.

### Computed adversarial evidence

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 alteration predicate vs §4.16 carrier | cusp normalization; Frobenius of A¹ over F₂, F₃; P¹_k → Spec k; A¹ ⊔ pt → A¹; ∅ → S | degrees 1; 2; 3; generic fibre of dimension 1 (not finite); extra maximal point ↦ origin (maximal domination false); surjective false for S ≠ ∅. Integral comparison: V = quasi-finite locus open, U = S ∖ f(X∖V) ∋ η, f⁻¹(U) → U finite | Pass | None |
| 0.7 non-separated Chow | doubled-origin plane over k | 1 maximal point; two charts into P² give a local isomorphism, X′ = X; its blow-up at one origin is not pseudo-projective (two DVR maps, closed points η and o₂) | Pass | None |
| 0.9 proper vs projective sense | Spec k; non-Japanese DVR A | finite reduced alteration is a product of fields, Z = ∅; A′ ⊆ Γ(Y′₀,O) finite over A contradicts non-finiteness, in both senses | Pass | None |
| 0.11 surface resolvability hypothesis | qe but not necessarily excellent 2-dimensional Y | Lipman conditions: normalization finite (Nagata), singular points finite (J-2 + normal ⇒ codimension ≥ 2), completions normal (G-ring); regular qe ⇒ excellent for Cor 0.4 | Fail (narrowing) | R01 |
| 1.5 restriction map | Z[i]_(1+i); the two primes over 5; M/L/K | 2 = −i(1+i)² so v(2) = 2 > 0, image Z_(2); fibre over Z_(5) has 2 elements; (O∩L)∩K = O∩K | Pass | None |
| 1.7 absolute space | Q; F_q; Spec Z[1/6]; doubled line with fixed F₂-point | {Q} ∪ {Z_(p)}; one ring (roots of unity have trivial valuation); Z_(2), Z_(3) removed; injective true, separated false | Pass | None |
| 2.2 P-tameness vs Spec Z_{P′} | Q(i)/Q at 3 and 2; F₂(t)(t^{1/2})/F₂(t), P = ∅ | e = 1 at 3 (tame), e = 2 at 2 (wild): 3-tame true, 2-tame false; P-tame vacuously true but no map Spec L → Spec Q, so the hypothesis "char K = 0 or char K ∈ P" is needed and present | Pass | Source issue |
| 2.5 distillation | Q(i)/Q, S = Val_L; S = ∅; u^p − u = t⁻¹, p = 2, 3 | P = {2}, K′ = Q(i) of degree 2, L′/K′ degree 1; P = ∅, K′ = K; v(u) = −1/p, e = p, P = {p}, K′ = L of degree p | Pass | None |
| 3.3 wild bound | T³ − T − 2 at 2 | discriminant −104, local degrees 1 + 2, 2 ≤ 3 but 2 ∤ 3 (temkin17 line 854 agrees: bound, not divisibility) | Pass | None |
| 3.6 separability step | X-tame L′/K′ | Val_L(X)′ contains the trivial ring L; tameness there is separability, so the Galois closure step is legitimate | Pass | None |
| 4.1 log regular pairs | (A², V(xy)); (Spec Z, ∅); A₁ cone with V(v); (A², {0}); cusp | 2 = 0 + 2; rank 0; 2 = 0 + rank 2 with embedding dimension 3; codimension 2 ≠ 1; cusp monoid {(n,a): n ≥ 2} f.g. iff k finite, never saturated, cusp never normal | Pass except Check wording | R04 |
| 4.2 normalized blow-ups | A₁ ideal (u,w); empty ideal on Spec F₂; two F₂-points; unit ideal | chart v² = u²s, normalization adds z = v/u with z² = s, degree 1; Proj = ∅; 1 of 2 points kept; identity | Pass | None |
| 4.3 monoidal smoothness | strict closed point; axes projection; square map in characteristic 3 | cokernels 0, ℤ, ℤ/2; r = 0, 1, none; Kummer étale (2 invertible) but not monoidally smooth | Pass | None |
| 4.4 inertia-specializing Gabber | ±1 on (A², ∅), char ≠ 2; G = 1 | Z ∪ T = {0}, h = blow-up, boundary E, inertia 2 trivial on ℕ and on E, very tame; chart ℕ → O_{P¹}, 1 ↦ 0 not log smooth; identity satisfies the G = 1 case | Pass | None |
| 5.1 comparison with StableReduction | unmarked P¹; E ∪ P¹ | genus 0 / 1; degrees −2 / (1, −1); prestable true; supplier semistability false; identity contracts 0 components | Pass | None |
| 5.2 projectivity | identity of (P¹, ∅); blow-up of a smooth special-fibre point of A¹_R; contracted P¹ with 3 special points | fibres points; exceptional degree −2 + 1 = −1 ≤ 0 not ample; degree −2 + 3 = 1 ample | Pass | None |
| 5.2a stability guard | C((t)) | p = 1, immediate degree-1 extension exists, conjunction with p > 1 false, stable true | Pass | None |
| 5.6 char(S) vs char(X) | S = Spec Z_(2) ⊔ Spec Q, X = A¹_Q, P = ∅ | char(S) = {2} ⊄ P, char(X) = ∅ ⊆ P; identity solution; Temkin's Step 4 would produce a P^w_{S̄/S} ⊆ char(S) alteration without the S₀ shrinking | Pass | Source issue |
| 6.1 induction and degrees | d = 0, 1; identity on regular S with snc Z; tower D/E/F | d = 0 avoids d − 1; Z′ = Z ∪ Z = Z; [D:F] = [E:F][D:E] with saturation degree 1 | Pass | None |
| 6.2 inheritance | regular 2-dimensional local S, Z = closed point | without blow-up b⁻¹(Z) is a point (codimension 2); after Bl_Z the preimage is Cartier | Pass | None |
| 6.3 perfect field | F₂, F₃; Frobenius | separable identity degree 1; Frobenius degree p but derivative 0, excluded | Pass | None |
| 6.4 absolute theorem | Spec Q[ε]/ε²; S = Spec Z; S = Spec Z_p[[u,v]]; S qe surface | reduction degree 1; dim 1 projective clause; dim 3 proper clause; dim 2 clause narrowed to excellent | Fail (narrowing) | R01 |
| 6.5 morphism theorem | identity on regular pair; field base | Z ∪ Z = Z; a = id, b separable | Pass (hypothesis as in 6.4) | R01 |
| 6.6 source refinement | F = E = L; cubic A/Q with A ⊗ A | [L : FE] = 1; components of degrees 1, 2 over A, so the compositum formulation, not base change, carries prime support | Pass | None |
| 6.7 field theorem | F₃, ℓ = 2; Q, P = ∅ | degrees 3ⁿ odd; degree 1 in characteristic 0 | Pass | None |
| 6.8 one-dimensional base | xy = π, ℓ invertible; ℓ = p | Σ = {(p)}, exponents (1,1), gcd(p,1,1) = 1; ℓ = p excluded by hypothesis | Pass | None |
| 6.9 variety form | smooth quasi-projective X with snc Y | identity, degree 1, π⁻¹(Y)_red = Y | Pass | None |
| 6.10 odd degree | degrees 3 and 2 on Z/2 and Z/4 | 3 ≡ 1 mod 2 and 3·3 ≡ 1 mod 4 (unit); 2 ≡ 0 mod 2 (no retraction) | Pass | None |
| 6.11 equivariant de Jong | G = 1 on P¹ with Z a point; C₂ by z ↦ −z | identity, invariant field unchanged; C(z²) on both sides, inseparable degree 1 | Pass | None |
| 6.11a Rumely | Spec Z[1/2] → Spec Z; A¹_R; x² + y² = −1 over Z | not surjective, 2 would be a unit in R′; zero section; point (i, 0) over Z[i] | Pass | None |
| 6.11a boundary Picard | E: y² = x³ + x + 1 over F₅; P¹_{F₅}; E × Spec F₅[ε]/ε² | values 1,3,1,1,4 give 2,0,2,2,2 affine points, 9 total; Pic⁰(P¹) = 0, O(1) excluded; kernel H¹(E,O) = F₅ killed by 5, exponent divides 45 | Pass | None |
| 6.11b sections and projections | P^d_S, N = d | centre of relative dimension −1 is empty; π = id; one section; S′ = S | Pass | None |
| 6.12 arithmetic de Jong | smooth projective X/S, Z = ∅ | S₁ = S, φ₁ = id, boundary ∅ | Pass | None |
| Gap very-tame-local-quotient vs contract text | supplier §0.10 text | supplier states fs log regular quotient and Kummer étale projection only; (q_*M_X)^G, openness, abelian inertia absent | Inconsistent sentences | R02 |
| Gap closed-subset-log-structure | snc D on regular X | supplier's M_D is already O_X ∩ j_*O_U^× for snc D, so (b) is definitional; (a) for arbitrary reduced X and nowhere dense Z is not supplied | Gap precise and minimal | None |
| Gap finite-type-fp-factorization | id X with U = X | closed immersion id, X_U → X₀,U = id | Precise | None |
| Gap maximal-separable-p-extension | P = ∅ | top field K, degrees 1 | Precise | None |
| Gap log-blowup-universal-property | unit and principal ideals; empty ideal | identity, degree 1; empty blow-up, universal but not a modification | Precise | None |

## Not verifiable

- Ownership against the open pull requests the brief lists without checkout paths was checked only through the roadmap service's indexed heads (index of 2026-10-26); no separate checkouts were read.
- The five declared gaps are future contracts; their precision and placement were checked, not their eventual implementation.
- `Suggested.lean` has no declarations, so elaboration certifies only the import, docstring and namespace, not any mathematics.

## Source issues

- **Gap** in temkin17 at proof of Theorem 4.2.1, Step 4, p. 122: the source says tame distillation of the base alteration yields a P-alteration; the wild primes set it produces lies in char(S), while only char(X) ⊆ P is assumed, so a prior restriction to an open S₀ with char(S₀) = char(X) is needed; affects the proof.
- **Gap** in temkin17 at §3.2.4, p. 116: the source says P-tameness of L/K equals Spec(Z_{P′})-tameness for every algebraic extension; the pointed scheme exists only when char K is zero or lies in P; affects nothing.
- **Gap** in temkin17 at §1.2.7, pp. 99–100: the source says the cusp's boundary monoid is not finitely generated because of the elements x² + a x³; this needs k infinite, since over a finite field the stalk is finitely generated though not saturated; affects nothing.
- **Gap** in ilo14 at Exposé X, Remark 3.3.4(ii), p. 159: the source says every quasi-excellent scheme of dimension at most two is universally resolvable, citing Cossart–Jannsen–Saito, whose theorems assume excellence; the quasi-excellent case needs Lipman's theorem; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "290931e65d6592c94a99483d4cd0f445f141d19d", "job": "REV-PKG-AdicCoefficientsAndComparisonsPartII~4", "model": "fable", "worker": "chris-i"} -->
