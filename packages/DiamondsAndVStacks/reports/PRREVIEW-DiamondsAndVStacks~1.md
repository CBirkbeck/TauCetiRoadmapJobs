# Review of DiamondsAndVStacks (pull request #820 at 7c7453f)

**Verdict:** needs changes

The gate fails on two rules (`imports`, `residue`), so the roadmap cannot be accepted at this head whatever else holds. Four findings are blocking (R01–R04); the rest are the author's to take or leave. Previous AI review: none.

## R01 (P2) — `Suggested.lean` imports another roadmap's module

**Location.** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean` line 8: "import TauCetiRoadmap.PerfectoidSpaces.Suggested".

**Claim.** The gate rule `imports` (worker's gate at 7c7453f) refuses any import other than `Mathlib` and `TauCeti.*` modules; the binding principle is that the acceptance test is stated against the pinned Mathlib and Tau Ceti only, never against a roadmap module.

**Witness.** Eleven declarations elaborate only through that import: `isAffinoidPerfectoid_of_isTotallyDisconnected`, both flatness theorems, `perfdToTop`, `vTopology`, `singleton_mem_vPrecoverage_iff_surjective`, `structurePresheaf` and its sheaf theorems, `additiveStructureSheaf`, `structureSheaf_v_H0`, `structureSheaf_v_acyclic`, `isSheaf_yonedaPresheaf`; their carriers `Perfd`, `isAffinoidPerfectoid`, `IsPerfectoidTateRing` are `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` lines 820, 795, 374 on main, not pinned library declarations. The Berkeley-style "Depends on #815 ... imports the `Suggested.lean` files" model in the pull-request text is exactly what the rule excludes.

**Repair.** Delete the import. For each of the eleven declarations either restate it on a native carrier (the two flatness theorems only need Tau Ceti's `Pair`, `spa`, `IsTateRing`, `IsPseudoUniformizer` plus a local predicate for "perfectoid Tate ring", which is a heavy definition and so a README target) or drop it and name it in the module docstring as not statable at the pins because the perfectoid carriers are missing. The sheaf-and-subcanonicity pair (ECD Theorem 1.2, first half) is a headline: say in the docstring that it lacks the category of perfectoid spaces at the pins. Keep `vPrecoverage` (it is generic over any `C ⥤ TopCat`).

## R02 (P2) — the v-cohomology headlines assume a sheafification that does not exist on the big site

**Location.** `Suggested.lean` lines 312–325, `structureSheaf_v_H0` and `structureSheaf_v_acyclic`, hypothesis "[HasSheafify (vTopology.{u} p) AddCommGrpCat.{u}]".

**Claim.** ECD Theorem 1.2 and Proposition 8.8 are stated for small sheaves on the κ-small site `Perfd_κ` (ECD line 1606, Definition 8.1; line 1758, Theorem 8.7 "small sheaves"; README Conventions: "The big pro-étale and v-topologies restrict to these subcategories in D2.1–D2.2"). The Lean states them on all of `Perfd.{u} p` and pays with an instance hypothesis.

**Witness.** Mathlib's only general sheafification instance, `Mathlib/CategoryTheory/Sites/LeftExact.lean` lines 308–311, needs `∀ X, Small.{t, max u v} (J.Cover X)ᵒᵖ`; for `Perfd.{u} p : Type (u+1)` with `Category.{u}` and coefficients `AddCommGrpCat.{u}` the covering sieves are not `u`-small, so no instance is available and the theorems can never be applied: the hypothesis stands in for the cutoff. (`splitCoverCharacterisation` and `isFlasque_constantSheaf` carry the same hypothesis harmlessly: `Opens X` is small and Mathlib supplies it.)

**Repair.** State the two cohomology clauses on a small site (a κ-small full subcategory with an `EssentiallySmall.{u}` hypothesis, which is what ECD Proposition 8.2 proves is harmless), or drop them and name "H^0_v = R, H^{>0}_v(X, O) = 0" in the docstring as not statable because the small v-site carrier is missing. Keep `isSheaf_structurePresheaf` and `vTopology_subcanonical`, which are honest `Prop`s on any site (subject to R01).

## R03 (P2) — `snRing` and `snMap` are sorry'd data by another name

**Location.** `Suggested.lean` lines 484–494: "def snRing (A) ... := (exists_seminormalization A).choose" and "def snMap ... := ....choose_spec.choose", with `exists_seminormalization` sorried at line 481.

**Claim.** The rule is no sorry'd data and nothing that mentions it; a carrier extracted by `Classical.choose` from a sorried existence proof is data whose definition rests on `sorry`.

**Witness.** `#print axioms snRing` in my probe elaboration: "depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]". The three theorems about it then close in one term each, verified by elaboration: `snRing_seminormal := (exists_seminormalization A).choose_spec.choose_spec.1`, `snMap_subintegral := ....2`, `snMap_isIntegral := (snMap_subintegral A).1`. Nine declarations mention `snRing`/`snMap` (lines 485–532).

**Repair.** Delete `snRing`, `snMap`, `snRing_seminormal`, `sn_lift`, `snMap_subintegral`, `snMap_isIntegral`, `snMap_fieldPoints`, `snMap_bijective`, `sn_compare`, `snRing_localization`. Keep `exists_seminormalization`, `subintegral_lift` and `subintegral_bijective_of_seminormal`, which already carry the universal property and the uniqueness up to unique isomorphism for any subintegral map to a seminormal ring; the README's "seminormalization-ring" and "fixed-rings-and-restriction" contracts (lines 440–446) then point at those three. The seminormalization itself is a README target with its intended signature.

## R04 (P2) — D0.26 re-plans SchemeAndStackFoundations' 2-fibre products and quotient stacks

**Location.** README lines 2099–2427 (D0.26), with the local-supplier table at lines 408–413.

**Claim.** D0.26 says the constructions are "§1.18's and §1.21's exports at `(Perf, v)`, not local declarations", then specifies the construction: restriction via `CatCommSqOver.transform`, `twoFibreProductFst/Snd/ObjEquiv/Comparison/UniversalFunctor`, `Stack.SheafGroupoid`, `quotientInclusion`, `quotientAtlas` ("quotientInclusion followed by toStackification"), `GroupoidDescentData`, `groupoidDescentDataCategory`, `quotientDescentFunctor`, `quotient_descent`, `isoClasses`, `arrowPresheaf`, with about 70 Checks on their internals (`booleanRestriction_true`, `quotientInclusion_object ... by rfl`, `Stack_toStackification_bot_identity`, which even prescribes the supplier's choice on the trivial topology).

**Witness.** SchemeAndStackFoundations on main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §1.18 (line 2745 ff.) commissions `Stack.twoFibreProduct` "with `.fst`, `.snd`, `.iso`, `.lift` and its 2-universal property" and names "DiamondsAndVStacks D0.26 is the `(Perf, v)` instance"; §1.21 (line 2951 ff.) commissions `Stack.quotient J (X, R)` with `.π`, the equivalence `R ≃ X ×_{[X/R]} X`, `.desc` and the isomorphism-class sheaf. Two roadmaps therefore plan the same object.

**Repair.** Reduce D0.26 to the comparison statements on `(Perf, v)` and `(Perfd, v)` (the v-site specialisation, the groupoid-quotient facts of ECD Proposition 11.3(ii)–(iii) stated against §1.21's `Stack.quotient.π` and `.desc`), delete the carrier recipes and the per-construction Check blocks, and move any genuinely missing generic statement (`quotient_descent` for category-valued targets, `quotient_isSheaf_iff`) to a declared gap on SchemeAndStackFoundations §1.21 rather than a local construction. Same for the D0.25 local-supplier rows that list `Stack.stackification_of_isStack` and `Stack.stackificationDiscreteEquiv` as "Local supplier (suggested)" while the text calls them §1.18 exports.

## R05 (P3) — gate residue

**Location.** README line 6255: "allows every later construction to be checked v-locally".

**Claim.** The gate's `residue` rule matches the phrase "to be checked". The sentence is mathematics, not process, but the rule is mechanical and the gate fails on it.

**Repair.** Rephrase, e.g. "allows every later construction to be verified v-locally".

## R06 (P3) — padding in `Suggested.lean`

**Location.** `Suggested.lean`: `IsSpectralSubmersion.of_quotient` (line 123), `categoricalPullback_interval_noninvertible` (43), `s3_10_large_group_escape` (337), `compHaus_large_cube_dense`, `_not_closed`, `_small_preimage` (347–359), `s4_11_large_profinite_quotient` (363), `small_finset_arrow_iff` (372), `padicInteger_denseOrbitQuotient` (403), the examples at 161–163 and 385–387, and the affine API lemmas `IsSeminormalRing.iff_unique`, `.prod_iff`, `.eqLocus`, `.of_isIntegrallyClosed`, `Affine.normal_finiteProduct` (430–458).

**Claim.** None is a headline theorem; the docstring itself calls the file "representative target signatures ... not an exhaustive checklist", the catalogue model the brief rejects.

**Witness.** `of_quotient` closes with the single term `⟨hf.surjective, hs, fun _ hU _ => hf.isOpen_preimage.mp hU⟩` (elaborated in my probe). The README labels the others "boundary theorem", "the category-valued boundary Check" (line 2425), "the size obstruction" (line 5987) or a Check (`s0_16_closed_relation_needed`, `dense_orbits`). The two examples at 161–163 and 385–387 are degenerate-case checks (`¬ IsCutoffCardinal ℵ₀`, `IsEmpty (BerkovichSpectrum R 0)`).

**Repair.** Delete them from `Suggested.lean`; the README keeps each as a target or Check. The file then states the headlines that survive R01–R03 (spectral quotient criterion, Hochster, inverse topology, Fargues' characterisation, `isFlasque_constantSheaf`, cutoff cardinals, the v-sheaf theorems, the Berkovich quotient, `connectedComponents_mk_quotient_eq_iff`, `exists_seminormalization`, `subintegral_lift`).

## R07 (P3) — the module docstring does not name the unstatable headlines

**Location.** `Suggested.lean` lines 10–27.

**Claim.** The form rule asks the docstring to say which headline theorems are not statable at the pins and what each lacks. It says generically that "diamonds, their underlying spaces, spatial diamonds, marked untilts and `Spd`" are README-only.

**Repair.** Add one sentence per headline: ECD Theorem 1.5 (`Y_ét ≃ Y^◇_ét`) lacks diamonds and `Spd`; full faithfulness of diamondification on seminormal rigid spaces lacks `Rigid.Space` and the diamond functor; the `O⁺` almost-acyclicity clause of Theorem 1.2 lacks the integral sheaf and the almost category; and (after R01/R02) which clauses of Theorem 1.2 lack the perfectoid carrier or the small v-site. Replace "representative target signatures" by "target signatures".

## R08 (P3) — supplier names that do not exist where cited

**Location.** README lines 848–851 and 164–168: "`Stacks.stackification`, `Stacks.twoFiberProduct`, `Stacks.quotientStack`, `Stacks.actionQuotient`"; line 819: "`TauCetiRoadmap.AdicEtaleGeometry.CAff`".

**Witness.** SchemeAndStackFoundations on main names them `Stack.stackification`, `Stack.twoFibreProduct` (generic) with `twoFiberProduct` (fppf), `Stack.quotient` (generic) with `quotientStack` and `actionQuotient` (fppf); no `Stacks.`-prefixed name occurs in its README (0 matches) and D0.25 itself uses the `Stack.` names. AdicEtaleGeometry's README line 176 puts `CAff` and `YonedaAdicSpace` "under Tau Ceti's root namespace", not under `TauCetiRoadmap.AdicEtaleGeometry`.

**Repair.** Use the supplier's names: `Stack.stackification`, `Stack.twoFibreProduct`, `Stack.quotient` (and `quotientStack`, `actionQuotient` only when the scheme instance is meant); cite `CAff` as AdicEtaleGeometry §A1.16's target without the roadmap namespace prefix.

## R09 (P3) — D0.5 cites a locator that supports only the existence of the inverse topology

**Location.** README lines 998–1009, "([KL15] §8.1, Def. 8.1.4, p. 157, whose final sentence names this other spectral topology ...)".

**Witness.** KL15 line 6183–6188 (p. 157): the definition's last sentence says there is another spectral topology whose quasicompact opens are the complements of the original ones, citing "[76, Proposition 8]" (Hochster 1969). The five properties stated here (spectrality, reversal of specialisation, involutivity, same constructible topology, spectrality of maps) are Hochster's, not KL15's.

**Repair.** Cite Hochster, "Prime ideal structure in commutative rings", Trans. AMS 142 (1969), Proposition 8, as the primary source (uncertified if not readable), keeping KL15 for the naming.

## R10 (P3) — Checks that do not discriminate

**Location.** Across the README (266 `**Checks.**` blocks, 1425 bullets), e.g. lines 1352–1356 "`Cofiltered_countableSequence_two` — the selected sequence takes stage 2 to 2", "`..._zero` — stage 0 is 0"; line 2387 "`quotientInclusion_object` — The section `x` maps to `x`, by `rfl`"; line 2259 "`twoFibreProductFst_naturality` — ... identity naturality isomorphism, by `rfl`"; the `definition_*_2` bullets that only restate the empty case (`definition_Assembly_2`, `definition_TwoFibreHom_2`, `definition_toBase_2`).

**Claim.** A Check must say what a plausible wrong definition gets wrong; "x maps to x by rfl" and "stage 0 is 0" hold for every candidate. They also fall with R04 where they test supplier internals.

**Repair.** Keep the computed and negative-control Checks (the Sierpiński, Stone–Čech, `ℤ_p/ℤ`, Arc 2.18, cusp, `ℶ_ω` ones are good); delete bullets that no wrong definition fails, and the blocks attached to constructions removed under R04.

## Verified sound

**Gate and dependency direction.** The worker's gate at 7c7453f fails on `residue` (R05) and `imports` (R01) and passes the other 25 rules including the targeted build. My run of the dependency check: `depcheck: 156 roadmaps, 1069 edges, 0 problem(s)`, no UPWARD or CYCLE line. DiamondsAndVStacks is at line 16 of the merge order, after all fourteen named suppliers. `git diff --stat origin/main...HEAD` outside the roadmap folder: empty.

**Elaboration and signature check.** I elaborated a copy of `Suggested.lean` with `#check @name` for all 66 declarations plus six one-tactic probes (`lake env lean`, exit 1 only on my deliberate probe of a non-existent `Sheaf.H'.equiv₀`; every file declaration elaborates with `sorry` the only warning). Every elaborated type agrees with its README statement; no section variable is lost (the two flatness theorems carry all 14 ring binders explicitly; `isSpectralSubmersion_limMap` carries both transition-map hypotheses; `nonempty_t2Quotient_spa_homeomorph` carries completeness and Hausdorffness as the README says). Four probes closed (R03, R06); `IsSeminormalRing.iff_unique` did not close in one tactic.

**Seeded sample, each locator opened at the text.**
- Profinite connected-component space (D0.6): ECD line 1222 (p. 30, proof of Lemma 7.2) uses "as π₀X is profinite" without proof, line 1253 Lemma 7.3(i); statement supported.
- Spectral quotient criterion (D0.9): ECD line 503, Lemma 2.9, p. 12, hypotheses (spectral X, pro-constructible R, generalizing projections, basis of opens with quasicompact preimage) match `spectralSpace_quotient`; Lemma 2.10 line 525 (open case) and Remark 2.8 line 497 match.
- Cohomology of limits of coherent topoi (D0.21): see Not verifiable (SGA 4).
- Geometric carrier Checks (lines 3690–3712): the rank-two plus ring `C⁺ = {x ∈ O_C : x̄ ∈ V}` contains 1 and ϖ (residues 1 and 0) and excludes a unit lifting `a ∉ V`; consistent with ECD p. 14.
- Pro-étale/étale comparison and structure sheaves (D2.5): ECD line 1700, Proposition 8.5 (i)–(iii), pp. 41–42; the almost-only clause for `O⁺` matches (iii).
- Descended subsets cut out by functions (D3.2): ECD line 1840, Lemma 9.4, p. 45, hypotheses (totally disconnected affinoid base, surjective affinoid cover, preimage an intersection of `{|g| ≤ 1}`) match.
- Pro-étale implies quasi-pro-étale (D3.6): ECD line 2067, Proposition 10.3, p. 50: étale/finite étale iff, and quasi-pro-étale iff pro-étale over a strictly totally disconnected base; the README's one-directional general clause is weaker than the source, as it says.
- v-local nature of morphism classes (D3.9): ECD line 2175, Proposition 10.11 (o)–(v), pp. 52–53; the separatedness in (iv)–(v) is kept.
- Compact Hausdorff spaces embed (D4.6): ECD line 2384, Example 11.12, p. 58; underlying space T, presentation by the Stone–Čech cover with closed relation.
- Cofiltered limits and finite-stage comparisons (D5.3): ECD lines 2606, 2644, 3043 (Lemma 11.22, Proposition 11.23, Lemma 12.17), pp. 63–64, 73; the κ-smallness clause and the three étale classes match.
- Localization of a spatial diamond (D5.8): ECD line 2848 (Lemma 11.31, the localization used in its proof) and line 2562 (Proposition 11.20, pro-constructible generalizing image of a qc injection).
- Spatial v-sheaf criterion (D5.11): ECD line 3095, Theorem 12.18, p. 75, Remark 12.19, Proposition 12.20 (line 3122), Lemma 12.21 (line 3150); hypothesis is surjectivity of |f| only, as stated.
- Maps representable in diamonds (D5.12): ECD line 3185, Proposition 13.4 (i)–(v), p. 77; the three descent statements and their differing locality conditions match exactly.
- Descent of marked untilts (D6.2): ECD line 3653, Lemma 15.1 (i)–(ii), p. 89; the Witt-coordinate convention Check recomputed below.
- Geometric diamondification contracts (line 10235): ECD Theorem 3.18/Definition 3.19 (p. 18) and Corollary 3.20 (p. 19) cited for tilting and gluing; the contract only restates the supplier's tilt and open-immersion interfaces.

Also opened: Arc lines 464–518 (Definition 2.14, Remark 2.15, Lemma 2.17, Remark 2.18, pp. 12–13) for D0.11–D0.12; BS15 lines 222–225 and 238–239 (Definition 2.1.1, Lemma 2.1.4, p. 6) for D1.7; KL15 line 6183 (Definition 8.1.4, p. 157); KL16 lines 730–770 (Definition 1.4.1, Remark 1.4.2, Lemma 1.4.5, pp. 19–20); GLX lines 653–674 (Lemma 3.2, pp. 16–17); Stacks morphisms lines 5319–5496 (0EUL, 0EUM, 0EUQ, 0EUR, 0EUS, 0H3G), algebra lines 3999–4003 (030C), cohomology line 1546 (02UW), categories line 3075 (02X9); ECD lines 781–813 (Lemma 4.1 with proof), 1199–1290 (7.1–7.5), 1381 (7.12), 1582 (7.23), 1606 (8.1), 1758 (8.7), 1780 (8.8), 2200–2202 (T̲ is a v-sheaf, p. 53), 2206 (10.13), 2676 (11.24), 3261–3294 (13.7–13.10), 4124 (18.1), 135 (1.5), 3741 (15.6).

**Adversarial table** (statement; instances; values on each side; result).

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `inverseTopology` | Spec of a DVR; discrete ℕ | opens ∅,{η},X ↦ dual opens ∅,{s},X; η⤳s becomes s⤳η; on ℕ the dual is the cofinite topology, ℕ irreducible closed with no generic point | true for spectral X; non-example shows the hypothesis is needed |
| `spectralSpace_quotient` | R = diagonal; R = X×X on X = ∅ and X ≠ ∅; R = β([0,1]_disc) ×_{[0,1]} β | quotient X with basis of qc opens; ∅ with basis {∅}; point with basis {pt}; [0,1] has only ∅ and [0,1] as compact opens, no basis | hypotheses exactly ECD 2.9; non-example correct |
| `spectralSpace_iff_nonempty_homeomorph_primeSpectrum` | ∅, point, Sierpiński | Spec 0, Spec k, Spec DVR; a finite ring is Artinian so its spectrum is discrete | true; ring in universe u is fine (Hochster's ring has size ≤ 2^{|X|}) |
| `t2Space_connectedComponents` | Sierpiński; Spec(∏_ℕ fields) | one component (point); X = βℕ already profinite | true |
| `t2Space_quotient_of_isClosed` | Cantor → [0,1]; ℤ_p with the ℤ-translation relation | closed kernel, quotient [0,1] Hausdorff; relation not closed (ℤ dense), quotient indiscrete | hypothesis necessary, witnessed |
| `IsSpectralSubmersion` and `.iff_constructible` | identity; X_cons → X for Spec of a DVR; Arc 2.18 | identity passes; {s} has preimage a qc open of the discrete X_cons, {s} not open in X: fails; Arc map is a submersion, not a quotient map | definition matches Arc 2.14; constructible restriction loses nothing (U = f(f⁻¹U), Y∖U = f(X∖f⁻¹U) both patch-closed) |
| `IsSpectralSubmersion.of_quotient`, `.comp` | any quotient map; g∘f | of_quotient is a one-term proof; for comp, g⁻¹U = f(f⁻¹(g⁻¹U)) is compact as the image of a compact set, so g's descent applies | true; of_quotient is padding |
| `isSpectralSubmersion_limMap` | constant system; Arc 2.18 system | limit map = f; limit is a submersion, not a quotient map | true (Arc 2.17 argument is purely topological) |
| `isFlasque_constantSheaf` | Spec DVR; two-point discrete; S¹ | sections A on {η} and X, 0 on ∅, restriction id; A(X) = A×A still flasque; on S¹ restriction ℤ → ℤ×ℤ to two arcs not onto, H¹ = ℤ | true under irreducibility; non-examples correct |
| `IsCutoffCardinal`, `exists_isCutoffCardinal_gt` | ℵ₀; ℶ_ω; ECD 4.1 (i)–(iii) | ℵ₀ < ℵ₀ false (proved example); cof(ℶ_ω) = ω fails clause 3 and the only strong limit below ℶ_ω is ℵ₀; clauses match ECD lines 782–786 | true |
| `OpenCoversSplit`, `openCoversSplit_iff` | ℝ with two half-lines; profinite S; connected space with two closed points | no locally constant choice; clopen partition exists; cover by the two complements has no section | true (ECD 7.2 (i)⇔(ii)) |
| `splitCoverCharacterisation` item 3 vs ECD 7.2(iii) | two-point discrete space | Γ(1⊔1) has 4 elements, Γ(1)⊔Γ(1) has 2 | the README's epimorphism form is the true one; source issue below |
| `isTotallyDisconnected` | ⊔_ℕ points; perfectoid disc; S × Spa(C,O_C) | covers split but not compact; qcqs, connected, many closed points; qcqs with π₀ = S | definition = ECD 7.1 |
| `IsWLocalSpace`, `.isHomeomorph_connectedComponentsMk` | Sierpiński; discrete ℕ; Spa(K,K⁺) | closed points {s} closed, components one, map a bijection of singletons; ℕ not spectral; one closed point | BS15 2.1.1, 2.1.4 |
| `flat_quotientMap_of_openCoversSplit` and faithful variant | φ = id; S = 0; Spa(L,L⁺) → Spa(K,K⁺) | R⁺/ϖ over itself; 0 flat, faithfully flat iff spa PR.plus = ∅; L⁺ torsion-free over the valuation ring K⁺ | ECD 7.23, p. 38 |
| `vPrecoverage`, `singleton_mem_vPrecoverage_iff_surjective` | ∅ → X ≠ ∅; empty family on ∅; Y qc, X qs | U = X has no finite image cover; J = ∅ covers ∅; surjective f with qc Y and qs X has f⁻¹U quasicompact (diagonal of X quasicompact) so U = f(f⁻¹U) | definition = ECD 8.1(iii); `Presieve.uncurry` at `Mathlib/CategoryTheory/Sites/Sieves/Presieve.lean:400` is the sigma type the index needs |
| `structurePresheaf` on ∅ | proved example | terminal value, 0 = 1 | correct |
| `structureSheaf_v_H0`, `structureSheaf_v_acyclic` | universe check of `HasSheafify` | needs `Small.{u} (J.Cover X)ᵒᵖ` for objects in `Type (u+1)`: unavailable | R02 |
| `isSheaf_yonedaPresheaf` | T = point; T = {0,1} discrete | one section; sections are clopen partitions of |X|, which glue because |⊔Y_i| → |X| is a quotient map | ECD p. 53 |
| `BerkovichSpectrum` | ϖ = 0; ϖ = 1 with R ≠ 0; R = 0; change of ϖ' | α(0) = 0 ≠ 1/2 (proved); α(1) = 1 ≠ 1/2; no `MulRingSeminorm` on the zero ring since f 1 = 1 ≠ 0 = f 0; exponent s = log 2 / (−log α(ϖ')) > 0 since 0 < α(ϖ') < 1 | empty cases as the README says |
| `nonempty_t2Quotient_spa_homeomorph` | rank-two Spa(C,C⁺); general Tate R; R = K[ε]/ε² | Sierpiński has T2Quotient a point = M(C); x ↦ rank-one generalisation is continuous: {x : \|f(x₁)\| > r} is the complement of the closure of a rational subset, {< r} a union of rational subsets (strict inequality in the rank-one quotient); ε is killed by every seminorm | true for every complete Hausdorff Tate pair; ECD states only the perfectoid case and the README argues the general one |
| `padicInteger_denseOrbitQuotient` | invariant open U ∋ a | U ⊇ a + pⁿℤ_p + ℤ = ℤ_p; ℤ_p/ℤ uncountable | true; padding (R06) |
| `connectedComponents_mk_quotient_eq_iff` | G trivial; G = ℤ_p on itself; G = ℤ (not compact) on ℤ_p | identity; one component both sides; ℤ_p/ℤ has one component while ∃g,[g·x]=[y] fails: compactness is needed and present; for compact G on spectral X, stabilisers of clopens are open subgroups, so finite unions of translates are invariant clopens separating orbits and π₀(X)/G is profinite | true as stated (GLX's unrestricted form is false, source issue) |
| `IsSeminormalRing`, `.iff_unique` | ℤ; ℤ/4; k[t²,t³]; A×B; eqLocus | ℤ: integrally closed domain; ℤ/4: x=y=0 has roots z=0 and z=2 (2²=2³=0), uniqueness fails; cusp: x=t³,y=t² need z=t ∉ A; componentwise; (u−v)³ = u³−3u²v+3uv²−v³ = 0 in reduced B when u²=v², u³=v³ | matches Stacks 0EUL (x³=y² ↔ our x²=y³ after renaming) and KL16 1.4.1 |
| `Affine.normal_finiteProduct` | zero ring; k × k | n = 0; two fields | Stacks 030C (reduced + finitely many minimal primes follow from Noetherian + normal localisations) |
| `IsSubintegral`, `subintegral_lift`, `subintegral_bijective_of_seminormal` | k[ε]/ε² → k; identity | integral, Spec bijective, residue iso, so (k[ε])^sn = k and maps to reduced T kill ε; identity trivially | KL16 1.4.5, Stacks 0EUR(3)–(4), 0H3G(3) |
| `snMap_fieldPoints` | K imperfect | Spec bijection plus residue isos give a bijection on K-points | true but deleted under R03 |
| `small_finset_arrow_iff`, cube and escape theorems | I = Empty; I = Type; finite-support points; all-ones point; block g_n | one arrow, small; singleton identity arrows inject Type; dense; not closed; h(n) = g_n → 0 coordinatewise | true; padding (R06) |
| `categoricalPullback_interval_noninvertible` | Fin 2 preorder category | (0,*,iso) → (1,*,iso) exists, 0 ⟶ 1 not invertible | true; padding |
| D0.6 Check `s0_6_clopens_of_x_not_of_patch` | Sierpiński | clopens of X: 2; of X_cons: 4 | correct |
| D0.18 Check | discrete ℕ, F_j supported on [0,j] | ⊕_ℕ ℤ → ∏_ℕ ℤ not onto | correct |
| D1.8 w-localization | rank-two Spa(C,C⁺); Spec ℤ | points (s,s),(s,η),(η,η), counit 2:1 over η; label (2) open in X_cons, image {(0),(2)} not Zariski open | correct; ECD 7.12 misprint recorded |
| D6.2 Witt convention | p odd; p = 2 | S₁ for (0,1,…)+(−ϖ,0,…) is 1; for p = 2, −[ϖ] = (ϖ,ϖ²,ϖ⁴,…) and S₁ = 1+ϖ² | the README's values are right |
| D5.16 counterexample to GLX 3.2 | X = ℤ_p̲ × Spa(C), K = ℤ | |F/K| = ℤ_p/ℤ indiscrete, π₀ one point, while π₀(F)/K = ℤ_p/ℤ uncountable | correct |
| D5.3 Check `empty_diagram` | empty diagram | limit is the final sheaf, not a diamond (Berkeley line 5602: Spd of a discrete field is not a diamond, not analytic) | correct, though cited to D2.4 rather than Berkeley |

**Library declarations opened at the pins** (file:line): `IsCompactOpenCovered` `Mathlib/Topology/Sets/CompactOpenCovered.lean:34`, `.of_finite_of_isSpectralMap` `:155`; `Precoverage` `Mathlib/CategoryTheory/Sites/Precoverage.lean:46`; `Presieve.uncurry` `Mathlib/CategoryTheory/Sites/Sieves/Presieve.lean:400`; `Sheaf.H` and `Sheaf.H'` `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56,84` (no degree-zero equivalence for `H'` at the pin, so `structureSheaf_v_H0` is not one-tactic); `HasExt` `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55`; the `HasSheafify` instance `Mathlib/CategoryTheory/Sites/LeftExact.lean:308`; `GeneralizingMap` `Mathlib/Topology/Inseparable.lean:364`; `IsSpectralMap` `Mathlib/Topology/Spectral/Hom.lean:42`; `constructibleTopology` `Mathlib/Topology/Spectral/ConstructibleTopology.lean:42`; `T2Quotient` `Mathlib/Topology/Separation/Hausdorff.lean:417`; `PadicInt.denseRange_intCast` `Mathlib/NumberTheory/Padics/RingHoms.lean:512`; `IsNonarchimedean` `Mathlib/Algebra/Order/Ring/Basic.lean:100`; `Cardinal.IsStrongLimit` `Mathlib/SetTheory/Cardinal/Order.lean:439`; `TopCat.Presheaf.IsFlasque` `Mathlib/Topology/Sheaves/Flasque.lean:48`; `constantSheaf` `Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:64`; `TopCat.Sheaf.isTerminalOfEqEmpty` `Mathlib/Topology/Sheaves/SheafCondition/Sites.lean:231`; `CategoricalPullback` `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean`; Tau Ceti `IsPseudoUniformizer` `TauCeti/RingTheory/Huber/Basic.lean:165`, `IsTateRing` `:192`, `spa` `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101`, `comap` `.../ValuationSpectrum/Basic.lean:212`, `PreAdicSpace.forgetToTop` `.../PreAdicSpace/Hom.lean:147`, `isSheafy` `.../PreAdicSpace/Sheaf.lean:35`, `TopCommRingCat.isCompleteSeparated_of_completeSpace_of_t0Space` `TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.lean:103`, `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` `TauCeti/Topology/Sheaves/Flasque.lean:156`, `IsProConstructible` `TauCeti/Topology/Spectral/ProConstructible.lean`. No `inverseTopology`, `IsSpectralSubmersion`, cutoff cardinal, `OpenCoversSplit`, w-local, Berkovich spectrum or seminormal predicate exists in Mathlib or Tau Ceti at the pins (grep of both trees), so this roadmap owns them.

**Cross-roadmap citations resolved on main.** AdicSpacesPartII R0.0 (line 518), R0.18 (7158), R0.19.1–R0.19.10 (7466–8005) with `IsLocallySpectralSpace`/`IsLocallySpectralMap` in its `Suggested.lean` lines 104, 126 and `Topos.IsQuasicompact`, `Topos.IsAlgebraic` as README targets of R0.19.10; `TateNormDatum`/`tateNorm` (its lines 384, 2280). AdicEtaleGeometry A1.12 (4752), A1.16 (5886), A4.2–A4.5, A4.7 (9246–9818); `AdicSpace.IsFiniteEtale` and `AdicSpace.IsEtaleLocalDescription` in its `Suggested.lean` lines 491, 501. AdicSpacesPartIII R2.1, R2.4 (4122, 4986), R3.9 with `Huber.GelfandSpectrum` (661), layer F0 (682). SchemeAndStackFoundations §§1.15, 1.18, 1.20, 1.21, 2.1–2.5 (2502–3388) with `NonabelianH1`, `leray_spectral_sequence`, `cech_to_cohomology`, `flasque_cech_vanishing`, `cohomology_filtered_colimits` present. PerfectoidSpaces P1.6, P1.32, P2.5, P2.12, P3.19, P4.19, P5.6–P5.7, P6.1–P6.4, P6.9–P6.17, P7.11, P7.16 all present; `IsKappaSmall` (Suggested.lean 1300), `HasKappaSmallPresentation` (1384), `ProKappa` (1391), `completion_cardinality_bound`, `finiteEtale_spa_iff` declared; `discPair`, `globalSections`, `globalSectionsAffinoidEquiv_spec`, `spaTiltHomeomorph`, `tiltHomeomorph`, `prodProfinite`, `PairCat`, `proFlatten` are README targets there (the 12 leads of the worker's citation list are all of this kind, so none is missing). ResolutionOfSingularitiesCharacteristicZero (open pull request, read through `roadmaps show`) §§7.1–7.8 with `resolution_affinoid`, `qeResolution`, `qeResolution_regularFunctorial`, `fieldResolution_regularPullback`, `qeLocalFormalReduction`, `supportedFormalTower_algebraizes`, `thickFibre_resolutionComparison`, `resolution_field` present; its own table lists DiamondsAndVStacks as the consumer of `resolution_affinoid`. PerfectoidTowers, DiamondEtaleCohomology and FarguesFontaineDiamonds are cited only as consumers (merge order lines 17, 85). No declared gaps and no `design/plan.json`.

**Ownership against open pull requests.** Searched the 376 open roadmap pull requests and main for the objects (inverse topology, spectral submersion, cutoff cardinal, w-local, split open covers, Berkovich spectrum, seminormality, subintegrality). Only CommRingFactorizationSystems (another author's open pull request, not yet in the merge order) also declares `IsSeminormalRing`, `IsSeminormalRing.of_isIntegrallyClosed`, `snRing`, `snMap`, `sn_lift` in its `Suggested.lean` (lines 892–1126, under its own namespace, `snRing` sorried there). This roadmap is placed at line 16 and its scope section claims ownership of the affine seminormality API with factorization systems as a consumer, so the duplication is for that pull request to resolve by citing D6.9; it is recorded here, not raised against this head. Ownership against open pull requests whose files the brief did not provide was otherwise not checked.

**Other checks.** The twelve `Lean:` lines name only declarations that exist (gate `readme-ids-missing=0`); every Lean name appears in the README. The generality of each Lean statement equals the README's except as recorded in R02. `padicInteger_denseOrbitQuotient`, `OpenCoversSplit`, `IsWLocalSpace`, `IsCutoffCardinal`, `IsSeminormalRing`, `IsSubintegral`, `IsSpectralSubmersion`, `vPrecoverage`, `BerkovichSpectrum`, `inverseTopology`, `isTotallyDisconnected`, `structurePresheaf` have real bodies on native carriers; `snRing`/`snMap` do not (R03).

## Not verifiable

- [SGA 4 VI] Exp. VI §8.7 (Theorem 8.7.3, Corollary 8.7.7, §8.7.1) for D0.21 and §5 (Cor. 5.2, Lem. 5.4) for D0.18: the only copy the roadmap cites is a retyped transcription on a personal page at Cornell, which the sources service does not classify as a legal source and which I did not override; Springer's edition is not open. The statements as described (cohomology of a cofiltered limit of coherent topoi with coherent transition morphisms is the colimit of the stage cohomologies) agree with the standard form of these results, but the locators and hypotheses were not read at the text.
- [Huber96] Definition 1.6.5, Proposition 1.6.7, §2.1, Proposition 2.1.4 (supplier contracts for AdicEtaleGeometry, lines 142–147 and 879–884): a Vieweg book, no open copy; not read.
- The primary source for the inverse topology (Hochster 1969, see R09) is not cited, so nothing was read.

## Source issues

- **Misprint** in ECD at Proposition 7.12, printed page 34: the source says the inclusion of w-local spaces admits a left adjoint X ↦ X^wl; it should be a right adjoint, as its universal property and counit X^wl → X and BS15 Lemma 2.1.10 show; affects nothing.
- **Error** in ECD at Lemma 7.2 (iii), printed page 29: the source says global sections on sheaves of sets commutes with all finite colimits when open covers split; it should say it preserves epimorphisms (or coequalizers, which is what the proof shows), since on the two-point discrete space Γ(1 ⊔ 1) has four elements and Γ(1) ⊔ Γ(1) two; affects a stated result.
- **Error** in GLX at Lemma 3.2, printed page 16: the source says π₀(F/K) = π₀(F)/K for a locally profinite K acting on a small v-sheaf F; it should carry a total-disconnectedness hypothesis on the component-orbit space, since for ℤ translating ℤ_p̲ × Spa(C) the quotient's component space is a point while π₀(F)/K is the uncountable indiscrete ℤ_p/ℤ (the proof's "π₀ commutes with colimits" uses a left adjoint that π₀ with the quotient topology is not); affects a stated result.
