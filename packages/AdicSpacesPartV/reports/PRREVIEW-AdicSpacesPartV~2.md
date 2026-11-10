# Review of AdicSpacesPartV (pull request #2133 at 5aa51b7)

**Verdict:** needs changes

Incremental re-review of the 91 changed README lines since 666eee7 (`Suggested.lean` is unchanged). One finding, P3, nothing blocking: the plan's wording of one declared gap still disagrees with the README. Eight of the nine previous findings are fully repaired. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with `sorry` as the only warning.

## R01 (P3) — the plan still declares `gap:countable-resolution-invariants` for the "reduced" resolution functor

**Location.** `packages/AdicSpacesPartV/design/plan.json`, the `gaps` entry with slug `countable-resolution-invariants`: "labelling the steps of the §§7.5–7.6 reduced resolution functor". Against it, `TauCetiRoadmap/AdicSpacesPartV/README.md` line 140: "labelling the steps of the §§7.5–7.6 resolution functor".

**Claim.** A declared gap reads the same in the README and in the plan, and the plan's sentence is the one the intake announces to the supplier. Previous R01 asked for "reduced" to be dropped from this gap.

**Witness.** ResolutionOfSingularitiesCharacteristicZero §7.5 on main (README line 1100) states its functor for generically reduced schemes. Here, §5.3 (README line 906) applies that functor to "the generically reduced schemes Spec A_i", and on a non-quasi-compact X its *Needs:* (line 908) calls on this gap. A contract for a "reduced" functor leaves out exactly that case.

**Repair.** In the plan's `needs` for this slug, delete the word "reduced" so that the sentence matches README line 140 word for word. The README needs no change. Tested on the instance that separates the two wordings. Take X to be the disjoint union, over n ≥ 0, of Spa(K⟨x,y⟩/(y², xy)) and the curve y² = x^(2n+1). X is not quasi-compact. Its nonreduced locus is nowhere dense, but X is not reduced. So §5.3 needs a countable labelling of a functor applied to generically reduced, nonreduced charts. Once "reduced" is deleted, the plan's sentence covers this case.

## Previous findings

- R01 — partly repaired: README lines 138–150 now consume §7.5 "for every generically reduced noetherian quasi-excellent ℚ-scheme", and the generically-reduced gap is gone from both the README and the plan. The plan's countable gap still reads "§§7.5–7.6 reduced resolution functor" (R01 above).
- R02 — repaired: the compound gap is retired. README line 267 is *regular-map-maximal-local* (Tag 07C0) and line 269 is *regular-map-faithfully-flat-descent* (Tag 07NT). Composition is cited from ResolutionOfSingularitiesCharacteristicZero §7.0 (line 138). Each *Needs:* line (lines 282, 290, 304, 507) names only the clause it uses.
- R03 — repaired: `gap:regular-local-flat-transfer` is retired from the README and the plan. The ascent half is now the target *regular-local-flat-ascent* (line 265). The descent half is cited as `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` and is not restated.
- R04 — repaired: line 453 says "The route is Bartenwerfer's direct argument on a normal affinoid … (BARTENWERFER76, §3)". The dangling "separate target" is gone, and BARTENWERFER76 and LUTKEBOHMERT74 are added as uncertified references (lines 1094–1095).
- R05 — repaired: lines 21, 605, 607, 614 and 631 now say "set-valued functor on the category of finite extensions of K". The three remaining uses of "field-valued" (lines 45, 120, 583) describe values in a field, which is correct.
- R06 — repaired: lines 310, 317 and 326 write A^ν throughout. Ã now appears only for the canonical reduction (lines 687–705).
- R07 — repaired: line 915 reads "### 5.4 Surjectivity, density and connectedness of the resolution". The consumers (AdmissiblePairsAndPadicHodgeStructures, ClassicalAdicEtaleCohomologyPartII) cite the unchanged id *resolution-consequences*. No roadmap cites the old heading.
- R08 — repaired: line 430 cites "HK2 lines 2624–2629, proof of Theorem 9.1.3, p. 58". The full-dimension step is there, on page 58.
- R09 — repaired: the description now says "DiamondsAndVStacks D6.9 and AbelianSchemesAndArithmeticModuliPartII B2.10 are cited in Scope and ownership for comparison only … both are in open pull requests".

## Verified sound

**Gate, dependency check, Lean.** I reran the gate at this head; every scanner is 0, ending `source-material=0 OK`. My run printed no `build` field, so for the build I rely on the worker's gate, which shows `build=0 OK`. Dependency check: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The one new edge is Layer 0 → ResolutionOfSingularitiesCharacteristicZero §7.0, a roadmap on main that is earlier in the order. Its §7.0 needs only SchemeAndStackFoundations §0.21 and Mathlib, so there is no cycle. `lake env lean` on `Suggested.lean` gives three `declaration uses sorry` warnings and nothing else. A scratch file with `#check @` on all four declarations gives types identical to the previous round. No binder is lost; the `of` error in `scratch/signatures.md` is an artefact of the tool's parsing. `git diff 666eee7 5aa51b7` touches only `TauCetiRoadmap/AdicSpacesPartV/README.md`; nothing outside the folder changes. `scratch/overlaps.md`: no other pull request changes this folder, and no cited id is dropped. No other roadmap cites the three retired gap slugs.

**Pull-request description.** Its claims match the head: five declared gaps, the three §0.5 lemmas, composition from §7.0, and four named roadmaps not on main. Checked on main: DiamondsAndVStacks, AbelianSchemesAndArithmeticModuliPartII, AdmissiblePairsAndPadicHodgeStructures and ClassicalAdicEtaleCohomologyPartII are absent. The ten suppliers (AdicSpacesPartII, AdicSpacesPartIII, AdicEtaleGeometry, RigidAnalyticGeometry, SchemeAndStackFoundations, StableReduction, ResolutionOfSingularitiesCharacteristicZero, ReductiveGroups, ReductiveGroupsPartII, LieGroupoidsPoisson) are all present.

**Ownership of the three new §0.5 lemmas.** Searched main and every open head (`roadmaps grep`) for Tags 031E, 07C0, 07NT and 10.112.8, and by object: regular closed fibre, faithfully flat descent of regular maps, locality at maximal ideals. No roadmap states any of the three lemmas. Some roadmaps use them in passing without owning them: PurityForFlatCohomology line 1041, DeformationAndDerivedPatchingAlgebra line 972, SchemeAndStackFoundations at its open head line 1870 (that one is Cohen–Macaulay ascent).

SchemeAndStackFoundations §0.21 does not state them, either on main (lines 1548–1619) or at its open revision (lines 2050–2135). ResolutionOfSingularitiesCharacteristicZero §7.0 on main (lines 959–965) states regular morphisms of schemes, the affine comparison with §0.21's `Excellence.RegularAlgebraMap`, composition with "locally noetherian fibres for the composite", smoothness and completion. Its Zariski locality is not locality at maximal ideals. Tau Ceti at the pin has none of the three either: `RegularAlgebraMap.lean` has only `of_smooth`, `of_isLocalization`, `localization`, the algebra-equivalence lemma, base-ring bijection and completion. So the Scope claim at line 16 holds, and this roadmap is a legitimate owner.

**Library declarations opened at the pins** (all newly cited names exist as stated):
- Mathlib: `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown` (`RingTheory/Ideal/KrullsHeightTheorem.lean:484`, needs `[IsNoetherianRing S] [Algebra.HasGoingDown R S]`); `Algebra.HasGoingDown.of_flat` (`RingTheory/Ideal/GoingDown.lean:154`); `Module.flat_of_isLocalized_maximal` (`RingTheory/Flat/Localization.lean:66`, maximal ideals of the algebra S); `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:52`) with `of_spanFinrank_maximalIdeal_le` (`:64`); `IsRegularRing` (`:93`, noetherian, every prime localization regular, so the zero ring is regular).
- Tau Ceti: `TauCeti.isRegularRing_iff_localization_maximal` (`RingTheory/RegularLocalRing/Maximal.lean:31`, noetherian hypothesis); `IsNoetherianRing.of_faithfullyFlat` (`RingTheory/Flat/Noetherian.lean:25`, root namespace, Tau Ceti); `TauCeti.IsRegularLocalRing.of_flat_of_map_maximalIdeal_eq` (`RegularLocalRing/Flat.lean:66`); `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` (`:54`); `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` (`Descent.lean:55`); `TauCeti.Excellence.RegularAlgebraMap` (`RegularAlgebraMap.lean:54`, flat with `GeometricallyRegular` fibres); `TauCeti.Excellence.GeometricallyRegular` (`GeometricallyRegular.lean:70`, noetherian plus regular base change to every finite purely inseparable L in k's universe).

The routes of the three lemmas use these with the hypotheses they have.

**Sources read at the changed locators.**
- CONRAD10: line 160 is Theorem 2.1.1 (Bartenwerfer) on p. 4, for any normal rigid space, a nowhere dense analytic set and bounded h. Lines 155–156 attribute it to Lütkebohmert, Thm 1.6 (geometrically normal case) and Bartenwerfer, §3 (general case, by an independent method). Lines 157–159 describe the reduction through ground-field extension and excellence.
- CONRAD99: line 1192 is Theorem 3.3.6 (stability of the normalization after a large enough p^(−n) extension).
- HK2: lines 2624–2629 (p. 58) for §1.6; lines 691–699 (p. 15) for §§3.1–3.2. HK2's rigid analytic points are morphisms Spd L′ → S, so "set-valued functor" is the right object.
- STACKS, read online: Tag 031E (Lemma 10.112.8: local noetherian, R regular, S/m_R S regular, flat ⟹ S regular); Tag 07C0 (Lemma 15.42.2: Λ noetherian; item (3) quantifies over maximal m′ ⊂ Λ "lying over m in R" and does not require m to be maximal, as README line 267 says); Tag 07NT (Lemma 15.42.7: A → C regular, B → C flat and surjective on spectra); Tag 07QI (Lemma 15.42.4: composition when the fibre rings of A → C are noetherian, which README line 138 secures by taking C noetherian).
- Tag 00OF remains in the References line. It is the statement of the Tau Ceti descent theorem that §0.5 cites, so the entry is not wrong.

**Seeded sample where the change touches it.** §1.1 (symbol only; CONRAD99 lines 406, 435 unchanged), §1.7 (CONRAD10 line 160, above), §2.1 (route now uses *regular-local-flat-ascent*; no locator change), §3.2 (HK2 line 699), §5.3 (route now names the generically reduced charts; TEMKIN12 locators unchanged and verified in round 1).

**Declared gaps.** The README and the plan agree on the five slugs. Each has a named supplier and states a single statement. `complete-local-formal-smoothness-regular`: its three new Checks are correct (below), and it is not provided by §0.21 or Tau Ceti. `countable-resolution-invariants`: R01 above.

**Adversarial table.** Statements the diff leaves untouched carry the rows of the previous report (PRREVIEW-AdicSpacesPartV~1, "Adversarial table"). Those are the headlines `gaussPoint_mem_closure_rationalPoints`, `IsUnitGaussPoint`, `analytic_constantRank` and `analytic_germ_eq_zero_of_subfield`, plus §§0.1, 0.2, 0.3, 1.4, 1.6 (statement unchanged, locator repaired), 2.3, 2.4, 3.3, 3.4, 4.3, 4.7, 6.4 and the inversion contract. Rows for the changed statements, with computed values:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| *regular-local-flat-ascent* (line 265) | K[x]_(x) → K[x,y]_(x,y); K → K[ε]/(ε²); non-flat K[t]_(t) → K[t,y]_(t,y)/(ty); field fibre K[t]_(t) → K[[t]] | First: d = 1, closed fibre K[y]_(y) with e = 1, dim S = 2, m_S = (x, y) has 2 generators: regular. Second: fibre K[ε]/(ε²) not regular, hypothesis fails, S has dim 0 and embedding dim 1. Third: fibre K[y]_(y) regular but y·t = 0 (not flat), dim S = 1 < d + e = 2, m_S needs 2 generators: node, not regular. Fourth: e = 0, agrees with Tau Ceti `of_flat_of_map_maximalIdeal_eq` | true; flatness and fibre hypothesis both needed |
| *regular-map-maximal-local* (line 267) | B = K × K[ε]/(ε²) over K; B = 0; ℤ → ℚ[ε]/(ε²) | First: localizations K (regular) and K[ε]/(ε²) (not), and K → B not regular: both sides false. Zero ring: no maximal ideal; RegularAlgebraMap A 0 holds (flat, fibre 0 regular): both true. Third: the maximal ideal (ε) contracts to (0) ⊂ ℤ, which is not maximal; ℚ → ℚ[ε]/(ε²) not regular, matching ℤ → ℚ[ε]/(ε²) not regular. With m required maximal the right side would be vacuously true | "need not be maximal" is necessary; matches 07C0 |
| *regular-map-faithfully-flat-descent* (line 269) | cusp B = K[t², t³] → C = K[t, t⁻¹]; K → K[x]_(x) → K[[x]] | First: K → C smooth, B → C flat, misses the origin; K → B not regular at the origin: faithful flatness needed. Second: K → K[[x]] regular in every characteristic (L ⊗_K K[[x]] = L[[x]]); K[x]_(x) → K[[x]] faithfully flat; conclusion K → K[x]_(x) regular (localization of smooth): true | consistent |
| Formal-smoothness contract Checks (lines 126–130) | K → K[[T]]; K → K[ε]/(ε²); ℤ_p → ℤ_p[[T]] | First: one fibre K[[T]], L ⊗_K K[[T]] = L[[T]] regular. Second: m_B² = 0, so every map is continuous; lifting ε ↦ t from K[t]/(t²) to K[t]/(t³) gives (t + ct²)² = t² ≠ 0, so no lift; not regular (fibre nonreduced). Third: flat (torsion-free over a DVR); fibres 𝔽_p[[T]] (regular over the perfect field 𝔽_p) and ℤ_p[[T]][1/p] (regular, characteristic 0); (p, T)-adic completion of smooth ℤ_p[T] | Checks correct; mixed characteristic covered |
| §7.0 composition as consumed (line 138) | K → K[t]_(t) → K[[t]]; A_m → Â_m → B̂_n | First: both regular, composite fibre K[[t]] noetherian, composite regular. Second: B̂_n noetherian, so 07QI's noetherian-fibre hypothesis holds | consistent with §7.0 on main |
| *affinoid-localization-regular*, rerouted (lines 278–282) | Laurent domain K⟨T⟩ → K⟨T, T⁻¹⟩ at T = 1 | n = (T − 1) contracts to the maximal (T − 1), Â_m ≅ B̂_n ≅ K[[T − 1]]. A_m → B̂_n regular, B_n → B̂_n faithfully flat, so A_m → B_n regular; 07C0 then gives A → B regular | route complete with the new names |
| §2.1 smooth pullback (line 507) | projection Y = X × disc → X, X the cusp, y over the origin | Closed fibre of O_(X,x) → O_(Y,y) is a regular local ring of dim 1. Y has dim 2 and embedding dim 3, so singular, and X is singular at the origin: Sing(Y) = f⁻¹Sing(X). Away from the origin, ascent: 1 + 1 = 2 | consistent |
| §1.1 symbol (lines 310, 317, 326) | cusp; K⟨T⟩ | Cusp: A^ν = K⟨t⟩. K⟨T⟩: A^ν = A, while Ã = k̃[T] (Layer 4), so the symbols are now distinct | consistent |
| §1.7 route (line 453) | idempotent on a disconnected X − Z; 1/T on the punctured disc | Idempotent: bounded by 1, extension e with e² − e = 0 on the dense complement, hence on X. 1/T: \|π\|^(−n) at πⁿ, unbounded | statement and route consistent; the theorem is CONRAD10 Thm 2.1.1 |
| §§3.1–3.2 set-valued functor (lines 605–631) | X = Spa L, L/K Galois of degree n; L = K | X(L) = Hom_K(L, L), a set of n elements; an embedding L → M sends X(L) → X(M) (covariant). X(K) = rational points | the corrected noun is the right object |
| §5.3 charts (line 906) | A = K⟨x,y⟩/(y², xy) | A[1/x] = K⟨x⟩[1/x] is reduced, so A is generically reduced and in the scope of §7.5. The blow-up of (x, y) gives x-chart K⟨x⟩ and an empty y-chart | consistent |
| Countable gap (line 140 against the plan) | the disjoint union of R01 | README wording covers the nonreduced charts; the plan's "reduced functor" wording does not | R01 |

**Proof route of §1.7.** The route names Bartenwerfer's §3 argument, which was one of the two repairs the previous report offered. The source is uncertified. That this argument needs no geometric normality rests on CONRAD10 lines 156–157.

## Not verifiable

- BARTENWERFER76 (§3) and LUTKEBOHMERT74 (Theorem 1.6): recorded as uncertified, so not read. Their locators and the attribution are checked only against CONRAD10 lines 155–156.
- SCHNEIDER11: uncertified, cited by locator only (unchanged since the previous round).
- STACKS Tag 07PM was not re-read this round. Its attribution is unchanged, and the previous round read it.

## Source issues

- none
