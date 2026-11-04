<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6387880891 -->
Review (claude) of 8eb87ad

Verdict: needs changes

1. **F01** (P2) `gap:dpH-full-faithfulness` asks PadicHodgeTheory for what it already provides

   - **Location.** `packages/GaloisSectionsPadicPeriodMaps/README.md` line 71, and the same slug in `packages/GaloisSectionsPadicPeriodMaps/design/plan.json` (`gaps`, first entry): "the functor D_pH from de Rham ℚₚ-representations to filtered discrete (φ,N,G_F)-modules is fully faithful and symmetric monoidal, with the comparison over F̄ and compatibility with restriction and finite induction." Line 522 relies on it.
   - **Claim.** The gap is not minimal, and it is pointed at the wrong owner. The following are already supplied: full faithfulness and the ⊗-structure at every finite Galois level; de Rham ⇔ potentially semistable; `D_pst` with restriction and the de Rham comparison. The only new step is assembling these over the colimit category `MF(φ,N,G_F)`, which this roadmap defines and owns in §2.1. A supplier earlier in the merge order cannot be asked to prove a statement about a carrier that its consumer defines.
   - **Witness.** `TauCetiRoadmap/PadicHodgeTheory/README.md`: §3.5 (`colmezFontainePst`, equivalence with finite Galois descent data; exact ⊗ full faithfulness), §5.1 (de Rham ⇔ potentially semistable), §5.3 (`D_pst`, restriction, de Rham comparison). Classical statement: bs line 464 (Theorem 2.9).
   - **Repair.**
     - Delete `gap:dpH-full-faithfulness` from `plan.json` `gaps` and from README line 71.
     - Add to §2.1 an owned target: "`D_pH` is a fully faithful ⊗-functor `Rep^dR_ℚₚ(G_F) → MF(φ,N,G_F)`, compatible with restriction and with finite induction". *Needs:* PadicHodgeTheory §§3.5, 5.1, 5.3, and ArithmeticGaloisRepresentations §1.12 (Shapiro, for induction).
     - Change line 522 accordingly.
     - Tested: take de Rham V and W that are semistable over a common finite Galois L/F. A morphism `D_pH(V) → D_pH(W)` restricts on `G_L`-invariants to a morphism of filtered (φ,N,Gal(L/F))-modules. By `colmezFontainePst` that morphism comes from a unique `G_F`-map V → W.

2. **F02** (P2) `gap:polyannulus-integral-local-systems` asks for an equivalence already on main

   - **Location.** README line 75, and `plan.json` `gaps` (third entry): "identify finite étale covers of Sp(R[1/p]) with the Galois category of finite étale R[1/p]-algebras and identify finite-rank integral local systems with continuous representations of its profinite fundamental group". Line 732 uses it.
   - **Claim.** The first clause is already proved on main. The second clause is assembled from existing sections. PadicHodgeTheory §7.3 (proper pushforward and de Rham pairs) is not where either belongs.
   - **Witness.** `TauCetiRoadmap/AdicEtaleGeometry/README.md` §A1.3, *finite-etale-local-to-global* (c): finite étale spaces over strongly sheafy `Spa(A)` ≃ `FÉt(A)^op`; `K_v⟨t^{±1}⟩` is strongly noetherian. Also InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (ℤₚ-local systems) and PadicHodgeTheory §7.2 (`LisseZpSheaf.ofEtale`).
   - **Repair.**
     - Add a contract "From `TauCetiRoadmap.AdicEtaleGeometry`" citing §A1.3 *finite-etale-local-to-global*. Cite InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 and PadicHodgeTheory §7.2 for the local-system clause.
     - Narrow this slug's `needs` to what remains: compatibility of the resulting `G_R`-representation with `G_R → G_F` and with fibres at F-points. Alternatively, delete the gap if §4.1 proves that compatibility.
     - Tested at n = 0, where R[1/p] = F: the cited equivalence specialises to `FÉt(F)` ≃ finite `G_F`-sets.

3. **F03** (P2) `gap:symplectic-faltings-finiteness` is compound and false as worded

   - **Location.** README line 89, and `plan.json` `gaps` (sixth entry): "provide GSp-irreducibility as absence of a nonzero stable isotropic subspace and finiteness up to symplectic isomorphism of rank-2d representations unramified and pure of weight n outside S whose Frobenius eigenvalues are algebraic integers of degree over ℚ at most B".
   - **Claim.**
     - The sentence bundles a definition with a theorem.
     - Its finiteness clause ranges over all rank-2d symplectic representations, with no GSp-irreducibility or semisimplicity hypothesis. Read that way, it is false.
     - §§7.1–7.2 consume it, at lines 1135 and 1168.
   - **Witness.** K = ℚ(i), p odd, S = {places above p∞}, n = 0, d = 1, B = 1: dim `Hom(G_{K,S}, ℚₚ)` ≥ 2, so unipotent `[[1,λ],[0,1]]` (λ on distinct lines) are infinitely many non-isomorphic symplectic representations with polynomial `(X−1)²`. bs lines 374–379 assume GSp-irreducibility.
   - **Repair.**
     - Replace the `needs` with: "For every number field L, prime p, finite S ⊇ {p, ∞} and integers n ≥ 0, d > 0, B ≥ 1, there are finitely many isomorphism classes of GSp-irreducible symplectic representations (V, L, ω) of `G_L` with V of rank 2d, unramified and pure of weight n outside S, whose Frobenius eigenvalues outside S are algebraic integers of degree ≤ B over ℚ. The case B = 2d contains the integer-polynomial case."
     - Keep the definition of GSp-irreducibility in this roadmap (§6.8 already gives it).
     - Tested: the unipotent family above is excluded, because the line `ℚₚe₁` is stable and isotropic.

4. **F04** (P3) The `Suggested.lean` docstring uses Betts–Stix numbers that collide with README sections, and omits §9.3

   - **Location.** `packages/GaloisSectionsPadicPeriodMaps/Suggested.lean` lines 12, 13, 16–18 and 20. One example: "Selmer sections localise into the Lawrence–Venkatesh locus (Theorem 7.1)". README line 1415 does the same: "With Theorem 7.1 and Lemma 6.4".
   - **Claim.** The bare numbers are Betts–Stix's, but they read as README sections, and README §§6.5, 6.7 and 7.1 are other targets. In addition, the headline of README §9.3 (finiteness at self-conjugate places over any K) is neither stated nor named as not statable.
   - **Witness.**
     - README line 1129 is "### 7.1 The finite sets T_i…".
     - Line 1054 is "### 6.7 The algebra of a fibre…".
     - Line 1012 is "### 6.5 Rational points lie…".
     - Line 1431 is "### 9.3 Finiteness of Selmer localisations at self-conjugate places".
   - **Repair.**
     - Cite README sections, with the source number in parentheses: §1.8 (Betts–Stix Theorem 7.1), §2.4 (Proposition 2.16), §§3.2, 3.4, §4.3, §§4.4–4.5 and 5.3, §6.8 (Proposition 6.7), §§7.4–7.8, §§8.4–8.5, §9.1 (Theorem 6.5).
     - Add a bullet for §9.3. It lacks the same carriers as Theorem A.
     - At README line 1415, write "With §1.8 and §6.4".
     - Tested: each reference then resolves to the intended heading.

5. **F05** (P3) Catalogue labels and provenance remarks are left in the README

   - **Location.**
     - Line 777: "(P8)".
     - Lines 973 and 991: "this theorem's E3".
     - Line 992: "provided by LV.3 … in SPM.7 and SPM.8".
     - Line 845: "the period variety of LV.3".
     - Line 1050: "(an observation not made in the source)".
   - **Claim.** These are design-catalogue or errata identifiers that the README never defines, plus a process remark. This breaks the timeless-style and standard-vocabulary rules.
   - **Witness.** The README defines no "P8", "E3" or "SPM". Its layers are named "Layer 7" and "Layer 8".
   - **Repair.**
     - Line 777: replace "(P8)" with "(PadicHodgeTheory §7.3)".
     - Lines 973 and 991: replace "this theorem's E3" with "properness of Y".
     - Line 992: write "MordellLawrenceVenkatesh §3.18" and "Layers 7 and 8".
     - Line 845: write "MordellLawrenceVenkatesh §3.8".
     - Line 1050: delete the parenthetical.
     - Tested: a search of the README for `SPM.`, `E3` and `(P8)` then finds nothing.

6. **F06** (P3) Duplicate and restating Checks, a malformed §7.6, and §6.6 below three Checks

   - **Location and witness.**
     - Duplicate Check pairs (README line numbers): 180/184, 181/185, 230/234, 233/236, 263/267, 326/332, 328/333, 358/362, 387/391, 478/482, 575/580, 652/657, 960/965, 1048/1050 and 1304/1308.
     - Checks that restate API bullets: 235 = API 224; 547 = API 533; 581 = API 569; 964 = API 955.
     - §7.6, lines 1238–1240: `**Checks.**` is followed only by the *Needs:* line, formatted as a bullet.
     - §6.6 (the definition of the non-symplectic locus): after the duplicate at 1048/1050, it has two discriminating Checks (1048, 1049). Lines 1046–1047 only compute `d_q`.
   - **Repair.**
     - Delete the second line of each duplicate pair and the restating Checks.
     - In §7.6, move the *Needs:* line out of the list, and add Checks at r = 3, d = 1 (dimension count 3 = 3, so no conclusion) and at d = 1, r = 4 (the four lines span(e), span(f), span(e+f), span(e+2f) admit no common half-meeting isotropic line).
     - In §6.6, add this Check: for d = 2 and V = W₁ ⊕ W₂ with W₁ ≇ W₂ absolutely irreducible rank-two symplectic pieces, and c ∈ ℚₚ^× a non-square, the forms ω₁ ⊕ ω₂ and ω₁ ⊕ cω₂ give isomorphic algebra–module pairs but non-isomorphic symplectic pairs. Computed: a symplectic isomorphism would need scalars a₁, a₂ with a₁² = c·a₂², which is impossible.

7. **F07** (P3) §3.1 states reflexivity as a fact; §9.2 wording

   - **Location.** Line 642: "v is conjugate to itself." (listed as an API fact). Line 1425: "a place over an inert prime of the maximal CM subfield".
   - **Claim.** Read as a fact, line 642 is false. It contradicts the Check at line 658. Line 1425 does not say in which extension the prime is inert.
   - **Witness.** In ℚ(i), the place (2+i) is not conjugate to itself (line 654).
   - **Repair.**
     - Line 642: "v is self-conjugate when v is conjugate to itself."
     - Line 1425: "a place of K above a prime of E_K⁺ inert in E_K".
     - Tested on (2+i): the fact no longer asserts it.

8. **F08** (P3) MordellLawrenceVenkatesh §4.3 is mislabelled and missing from the contract; doubled name

   - **Location.**
     - Line 600: "MordellLawrenceVenkatesh §4.3 (crystalline specialisation)".
     - Line 785 cites it for crystalline transport.
     - Line 83 (the MordellLawrenceVenkatesh contract) does not list §4.3.
     - Line 321 reads "MordellLawrenceVenkatesh:MordellLawrenceVenkatesh".
   - **Witness.** In the MordellLawrenceVenkatesh README at the head of its pull request, §4.3 is "Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension". Crystalline transport is in §2.11 and §§4.1–4.2.
   - **Repair.**
     - Line 600: "MordellLawrenceVenkatesh §4.3 (Frobenius-centralizer orbits)".
     - Line 785: cite §§2.11 and 4.1–4.2.
     - Add §§2.11 and 4.1–4.3 to the line-83 contract.
     - Line 321: fix the doubled name.

9. **F09** (P3) §0.5(a) is narrower than its source

   - **Location.** Line 274: "Let K be a number field and X a smooth projective geometrically connected K-variety. (a) An adelic point (P_u)_u ∈ X(A_K) lies in…".
   - **Witness.** hs lines 391–410 (Theorem 2.1) hold for any geometrically connected variety over a number field, with families of local points and S of Dirichlet density 0 (hs lines 11–12).
   - **Repair.**
     - State (a) for geometrically connected, separated X of finite type, and adelic points (P_u). This is the domain of the étale descent set in HeightsRationalPointsAndObstructions §3.5.
     - Keep "smooth projective curve of genus ≥ 1" in (b).
     - Tested on `G_{m,K}` (not proper): (a) is hs Theorem 2.1 (i)⇔(iii) with U trivial and S = ∅.

10. **F10** (P3) The modified adeles are already used by an earlier roadmap

   - **Location.** Line 9: "this roadmap owns the modified archimedean quotient". §0.4, line 242.
   - **Witness.** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md` §3.17d already states a theorem "on modified adeles (archimedean factors replaced by components)".
   - **Repair.** Import the modified adelic carrier from HeightsRationalPointsAndObstructions §3.17d in the scope paragraph and in §0.4. Keep the f-cov locus and its comparison with sections as owned here. No statement changes.

Ten findings: three P2 (all three are declared supplier gaps that are either not minimal or false as worded) and seven P3. The mathematics of the 58 targets survived the adversarial pass. All 15 sampled locators check out against the texts, and the pass found six new source issues, listed at the end. `Suggested.lean` elaborates cleanly, and its claim that no headline is statable at the pins holds up.

## Verified sound

### Elaboration of `Suggested.lean`

- Ran `lake env lean` on `packages/GaloisSectionsPadicPeriodMaps/Suggested.lean` from the content checkout at fe54001. Exit status 0, no messages.
- The file declares nothing, so there is no `sorry` warning.
- It has a single `import Mathlib`, no `TauCeti.*` imports and no `set_option`.
- The docstring title and namespace are in the required form.
- There were no declarations for the `#check @name` comparison or the one-tactic padding probe, so there is no padding.

### Statability of the headlines

- **Headline inventory from the README:** §0.5, §1.8, §2.4, §§3.2/3.4, §4.3, §§4.4–4.5/5.3, §6.8, §§7.4–7.8, §§8.4–8.5, §9.1, §9.3, §9.4 (Theorem A) and §9.5 (Theorem B). Mordell (§9.2) is owned by MordellLawrenceVenkatesh LV.11.
- **Pin check:**
  - Mathlib has no étale fundamental group of a scheme at the pin: no `PreGaloisCategory` instance under `Mathlib/AlgebraicGeometry`. `Mathlib/CategoryTheory/Galois` is abstract only.
  - Mathlib has no de Rham representations or `D_dR`. `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75,88` provides only the period rings `BDeRhamPlus` and `BDeRham`.
  - Tau Ceti has no étale cohomology and no p-adic Hodge carriers.
- **Conclusion:** none of the headlines is statable without heavy constructions or ad hoc stand-ins. The docstring's position holds, apart from R04.

### Dependency check

`tauceti-roadmap … gate --depcheck … --name GaloisSectionsPadicPeriodMaps --movable` printed:

    depcheck: 34 roadmaps, 320 edges, 0 problem(s)

There are no UPWARD, CYCLE or `moved:` lines. GaloisSectionsPadicPeriodMaps sits at line 208 of `ORDER.txt`, after AnabelianGeometryAndNonabelianChabauty (198) and MordellLawrenceVenkatesh (175). Every supplier is on main or in the allowed list.

### Library declarations opened at the pins (14)

| Declaration | File and line at the pin |
| --- | --- |
| `Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` |
| `Field.absoluteGaloisGroup.map` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:87` |
| `ContinuousMonoidHom` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57` |
| `ConnectedComponents` | `Mathlib/Topology/Connected/Clopen.lean:510` |
| `IsDedekindDomain.HeightOneSpectrum.adicCompletion` (a structure) | `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:602` |
| `LinearMap.IsAlt` | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286` |
| `LinearMap.Nondegenerate` | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595` |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` |
| `NumberField.IsCMField` | `Mathlib/NumberTheory/NumberField/CMField.lean:69` |
| `NumberField.IsCMField.ringOfIntegersComplexConj` | `Mathlib/NumberTheory/NumberField/CMField.lean:236` |
| `IntermediateField` | `Mathlib/FieldTheory/IntermediateField/Basic.lean:52` |
| `MulAction.orbit` | `Mathlib/GroupTheory/GroupAction/Defs.lean:49` |
| `Nat.forall_exists_prime_gt_and_eq_mod` (hypothesis `IsUnit a`) | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442` |
| `hasSum_zeta_four` (n = 0 term is 1/0⁴ = 0) | `Mathlib/NumberTheory/ZetaValues.lean:457` |
| `TauCeti.Symplectic.groupScheme` | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122` |

The README describes each one correctly.

### Cross-roadmap citations resolved (21 suppliers)

- **Open pull requests, at their heads:**
  - AnabelianGeometryAndNonabelianChabauty §7.1, at #1021. Sect, κ, the field-general injectivity criterion, finite-separable restriction only, and the section conjecture as a proposition all match the contract.
  - InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.0.3, IG.1.3, at #850.
  - ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1, at #856.
  - HeightsRationalPointsAndObstructions §§2.3, 2.4, 2.11a, 3.1–3.5, at #1017. Its twist convention "fibre splits iff eval(x) = τ" matches.
  - PadicHodgeTheory §§3.2–3.5, 5.1, 5.3, 7.1–7.5, 8.1–8.2, at #1062. Its convention gives ℚₚ(1) weight +1 and jump −1, so the README's sign adapter is right.
  - CohomologyComparisons §§6.4–6.7, at #1064. HT(ℚₚ(1)) = +1 at its line 152.
  - MordellLawrenceVenkatesh §§0.4–0.5, 0.9–0.12, 0.18, 1.2, 1.4–1.16, 2.1–2.4, 3.1–3.19, 4.3, 7.1, 7.4, 8.13–8.14, LV.10 and LV.11, at #1231. §4.3 is the exception noted in R08.
  - AbelianSchemesAndArithmeticModuli §§A3.5, A3.7, A4.3, A4.4, A6.30, A6.31, at #849.
  - AlgebraicModuliForArithmeticGeometry §1.3, at #853.
  - ComplexComparisonPartII §§C5.2, C6.0, C6.2, at #848.
  - EtaleDualityAndPerverseSheaves §0.3 (its paragraph "Poincaré duality on a smooth curve…") and §0.5, at #1040.
  - ArithmeticGaloisDuality §R02.3 (Hermite is in R02.3.1), at #858.
  - WeightsInEtaleCohomology R34.1 and R34.2, at #1001.
  - AnalyticNumberTheoryPartI §0.32 (Siegel–Walfisz), at #1126. No roadmap states a least-prime bound, so the Linnik gap is genuine.
- **On main:**
  - AdicSpacesPartII Layer R1.
  - ClassFieldTheory Layers 7 and 11. Its §2.6 convention is arithmetic Frobenius with `χ_cyc(Art(u)) = N(u)⁻¹`, which matches the README Check at u = 4 over ℚ₃ (value 1/4).
  - GlobalNumberFields Layers 2, 7 and 8.
  - LocalFieldsRamification Layers 0, 2 and 4.
  - LocalGaloisGroups Layer 7 (generator rank N+2).
  - ReductiveGroups Layers 0 and 3.
  - Chebotarev Layers 10, 13 and 14.

### Declared gaps (9)

- All 9 slugs match between `plan.json` and the README.
- Six are precise and minimal:
  - `horizontal-pst-specialisation`: PadicHodgeTheory §7.3 has de Rham pairs but no Shimizu specialisation.
  - `model-free-polarised-fibres`: MordellLawrenceVenkatesh §2.4 needs a good model.
  - `model-free-period-maps`: MordellLawrenceVenkatesh §§3.12–3.19 work at residue discs of K-points.
  - `four-isotropic-lagrangians`: MordellLawrenceVenkatesh §7.4 has r ≥ 5 without isotropy, which is bs Remark 6.19's comparison.
  - `kodaira-parshin-local-fibres`.
  - `linnik-polynomial-least-prime`.
- The other three are R01–R03.

### Sources: the seeded sample (15 of 15 verified)

The author flagged no locators as unverified. Each sampled target was checked for theorem number, page and hypotheses:

| README target | Source locator | Notes |
| --- | --- | --- |
| §1.2 | bs Example 4.5, §4.1.1, (4.1), Lemma 4.2 (lines 1679–1757); Remark 6.6 (line 2340) | |
| §1.6 | bs Proposition 7.2 (line 2894) | |
| §5.3 | bs Proposition 4.11 (line 1921), Lemma 4.8, Remark 4.9 | |
| §6.1 | bs Definitions 1.2 and 6.2 (lines 89, 2247), Remark 6.3 | The README's Artin variant uses finite image; the source uses weight 0 and integrality. Both give the same locus, and the README says so. |
| §6.4 | bs Lemma 6.4 with footnotes 20–21 (lines 2266–2289) | |
| §6.7 | bs Remark 6.6 | |
| §7.1 | bs Definition 6.11 (line 2472) and the proof of Proposition 6.9 (line 2511) | The README's enlargement repairs a source gap (Source issues). |
| §7.2 | bs Lemma 6.12 (line 2481) | |
| §7.7 | bs Proposition 6.15 (line 2548) | |
| §8.3 | bs proof of Proposition 6.20 (lines 2714–2725) | |
| §8.4 | bs Proposition 6.20 (line 2679) | |
| §8.5 | bs Corollary 6.22 (line 2734) | |
| §8.6 | bs Remark 6.23 (lines 2746–2806) and Remark 1.3 | |
| §9.2 | bs lines 2281–2286 | |
| §9.5 | bs Theorem B (line 66) | |

Also checked: every other bs locator in the README, by its page marker (pp. 1–56); hs Theorem 2.1 and Remarks (1) and (4) (lines 391–445); stoll §2 (line 127), Definitions 5.2 and 5.4, Lemma 5.8, Proposition 5.9 and Conjecture 9.1 (line 1536); stix08 Theorem 45 and Remark 46 (lines 1109–1122).

Already-recorded design errata that I confirmed at their locators and do not repeat below: E4, E5 (bs line 1861), E6, E7 (bs line 2600), E8 (bs line 2780) and E11 (bs lines 718–719).

### Ownership

- **Method:**
  - `roadmaps grep` over main and all 338 open roadmap pull requests at their heads, by object: Betts, Harari, Selmer section, self-conjugate, polyannulus, filtered discrete, `D_pH`, f-cov, finite descent, Kodaira–Parshin, section conjecture, symplectic pair, Lawrence–Venkatesh locus, principal trichotomy, model-free. This covers the named open-work set in the brief.
  - The local board packages.
  - Two indexed board packages fetched at their heads: LawrenceVenkateshMethod (9ee7ac3, a consolidation design with no own layers) and PadicHodgeTheoryPartII (6502997). Neither has any overlap.
  - MordellLawrenceVenkateshPartII (design in the board checkout) covers higher-dimensional Lawrence–Sawin material only.
- **Result:** no other owner of section restriction, Selmer sections, symplectic pairs, filtered discrete modules, the LV loci, self-conjugate places or model-free transport.
- **Declared variants** of MordellLawrenceVenkatesh §§1.10–1.15 and §7.1 (the self-conjugate, ramified and threshold-4 versions) are stated as variants in scope line 11. The only other overlap is R10.

### Adversarial table (one row per statement, with computed values)

| § | Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Conv. | HT number = jump; ℚₚ(1) ↦ −1 | ℚₚ(1); ℚₚ⊕ℚₚ(−1) | (C_p(r)⊗ℚₚ(1))^G ≠ 0 iff r = −1; jumps 0,1, weights 0,2, Frobenius 1,q | holds; agrees with bs footnote 7 | none |
| Conv. | Nφ = pφN | φe=e, φf=pf, Nf=e | Nφ(f) = pe = pφN(f); reversed relation gives p²e ≠ e | holds | none |
| Conv. | inverse transport | T = [[1,0],[a,1]], F¹ = ⟨e₁⟩ | T⁻¹e₁ = e₁−ae₂; a=1 gives (1:−1), pushforward (1:1) | holds; bs Def 3.1 | none |
| Conv. | arithmetic reciprocity | ℚ₃, u = 4 | χ_cyc(Art 4) = N(4)⁻¹ = 1/4 | matches ClassFieldTheory §2.6 | none |
| 0.1 | res_u well defined | real G_m, C₂ inversion | (k,1)(a,c)(k,1)⁻¹ = (a+2k,c); (2,c) ~ (−2,c) via k=−2; classes a mod 2, i.e. ℝ^×/ℝ^×² | holds | none |
| 0.2 | p-adic injectivity | A(ℚₚ) profinite; ℝ | a ∈ ∩nA, finite quotient of exponent e kills a; E(ℝ)⁰ ≅ ℝ/ℤ divisible, so ℝ fails | holds only p-adically, as stated | none |
| 0.3 | Selmer at all places | Y(ℝ)=∅; Spec K; E/ℚ full 2-torsion | Sel = ∅; one point; 4 distinct localisations | holds | dups (R06) |
| 0.4 | X(A)_• and f-cov | P¹; E/ℚ, Δ>0; lifting along finite étale | P¹: whole set (stoll Lemma 5.8(1)); 2 archimedean points for y²=x³−x; a component maps onto a component (open + closed), so image of X(A)^ét = f-cov | holds | R10 |
| 0.5 | Harari–Stix | S = ∅, hs Thm 2.1 | (i)⇔(iii) with U trivial; (b): c ↦ (P_u) with κ(P_u)=res_u c, both directions | holds | R09 |
| 1.1 | symplectic pairs, Σ_A | ℚ_{p²}; ℚₚ[ε]/(ε²); ω=0; L=ℚₚ² | #Σ = 0 vs dim 2; #Σ = 1 vs dim 2; not perfect; rank of L is 2 | holds | dups |
| 1.2 | fibre pair | Y′=Y; degree-δ cover | Σ = Y′_y(F̄), #Σ = δ; A = ℚₚ^Σ split | holds | dup |
| 1.3 | relative pair | Legendre | rank 2; ∧²R¹ = ℚₚ(−1); monodromy Γ(2), Zariski dense in SL₂ | holds | dup |
| 1.4 | section pair class | constant Y×A₀; s ↦ γsγ⁻¹ | pair (ℚₚ, H¹(A₀)) for all s; γ intertwines all three actions | holds | none |
| 1.5–1.6 | local restriction | s = s_y global; finite étale Z | ρ∘s_y ≅ 𝕃_ȳ; G_u-set Z_{y_u}(K̄_u); bs Prop 7.2 | holds | none |
| 1.7 | adelic LV locus | constant family; Y(A_K)=∅ | every adelic point; empty | holds | dup |
| 1.8 | Sel ⊆ LV | s = κ(y) | gives Y(K) ⊆ locus; bs Thm 7.1 | holds | none |
| 2.1 | MF, restriction/induction | index-2 induction | Ind1⊗Ind1 dim 4 vs Ind1 dim 2, so lax; Res Ind 1 = 1^{⊕r} for normal G_w | holds | R01 |
| 2.2 | End/Aut/Aut^GSp | unit; K_v=ℚ_{p²}, D=ℚₚⁿʳ; ordinary E; D=0 | ℚₚ; G_v-equivariant scalars ℚ_{p²}, φ cuts to ℚₚ; End=ℚₚ×ℚₚ, dim 2 ≤ 4; Aut=1, Aut^GSp=G_m | holds | dup |
| 2.3 | orbit lemma | G_m² on P¹ | 3 orbits: (1:0), (0:1), xy≠0 | holds | none |
| 2.4 | dim bounds | d=1 | ≤1, equal for 1; GSp₂: 1·3+1 = 4 = dim GL₂ | holds | none |
| 3.1 | conjugate places | ℚ(i): 3, 5, 2; ℚ(2^{1/3}) | 3 inert, self-conjugate and friendly; (2±i) swapped; (1+i) self-conjugate but ramified; odd degree, no CM | holds | R07 |
| 3.2 | r_v + r_v′ = n | χ_cyc⁻¹; ℚ(i), p=5 CM characters; p≡3 mod 4 ℚ̄ₚ-valued | 1+1=2; (1,0),(0,1) sum 1; odd n at a self-conjugate place, so ℚₚ-coefficients are needed | holds | none |
| 3.3 | χ|G_v = χ₀χ_cyc^{−n/2} | χ_cyc⁻¹ | χ₀ = 1, n = 2 | holds | none |
| 3.4 | weighted HT sum | abelian variety, g; V=0 | g = 1·1·2g/2; 0 = 0 | holds | none |
| 4.1–4.3 | horizontal transport | constant pair; residue field 𝔽₂ | T = id; no third residue in 𝔽₂, one exists in 𝔽₄, 𝔽₈; gcd(2,3)=1 generates G_v | holds; bs Lemma 3.23 | none |
| 4.4–4.5 | period control | y = y₀; shear a=1 | Hodge point; (1:−1) | holds; bs Thm 3.3, Prop 3.5 | R08 |
| 5.1 | pH pair | elliptic E | pairing into 1⟨−1⟩, jump 1 | holds | none |
| 5.2 | M^{≤1}(Φ) | ω(e₁,f₁)=1, Φ=⟨e₁,f₁⟩ | F¹⊗F¹ → F² = 0 fails | holds | dups |
| 5.3 | period diagram | same period value | same class | holds; bs Prop 4.11 | none |
| 5.4 | Weil-restricted product | degrees 1, 2, d=1 | dim 1+2 = 3 | holds | none |
| 6.1 | S-good | ℚₚ⊕ℚₚ(−1); H¹(E)(1); √2 factors; ℚ₇ ζ₃ on dual numbers | weights 0,2; weight −1, HT {−1,0}; (X−√2)(X+√2) = X²−2; trace 1+ζ₃ ∉ ℚ | holds | none |
| 6.2 | LV_{X,S} | constant family | equals Y(K_v) | holds | dup |
| 6.3 | period-domain criterion | Legendre over P¹∖{0,1,∞}, points p^{−n} | infinite set, finite on every closed disc, so properness is needed | holds | R05 |
| 6.4 | interpolants are S-good | y ∈ Y(K) | Y proper ⇒ y_u extends to O_u; H¹ unramified and pure 1 | holds | none |
| 6.5 | Y(K) ⊆ LV | — | bs lines 2281–2286 | holds | none |
| 6.6 | LV° ⊇ LV; q values | g = 3 | d_23 = 2.5·22 = 55, d_11 = 25; d=1: f_L := ∧²f_V∘ω_E⁻¹ | holds | R06 |
| 6.7 | Σ = Y′(K̄_v) | one point of degree 4 | one orbit of size 4 | holds | none |
| 6.8 | trichotomy with #Σ | A = ℚₚ[ε]/(ε³), V = A⊗H¹(E), d=1 | README (c): 1 ≥ 1/2 holds; the source's dim-A form 1 ≥ 3/2 fails | README correct (source error) | none |
| 6.9 | types (a)–(c) | A=ℚₚ; degree-5 field; ordinary H¹ | (c) holds, (a) impossible; size 0, not (c); stable line unramified, weight 0 | holds | none |
| 7.1 | bounded-degree T_i | δ=1; non-CM E | L = K, B = 2d_i; H¹ irreducible, hence in T_i | holds; repairs a source gap | none |
| 7.2 | T_i finite | — | Hermite × finitely many weight-1 Weil numbers of degree ≤ B × Faltings | holds given R03 | R03 |
| 7.3 | Weil-restriction non-density | (d,r) = (1,4), (1,3), (2,4) | 3<4; 3=3; 10<12 | holds | none |
| 7.4 | type (a) period locus | residue degrees < 4 | empty | holds | none |
| 7.5, 7.8 | finiteness under full monodromy | Kodaira–Parshin | bs Cors 6.10, 6.16 | holds | none |
| 7.6 | type (b) factor | plane, 4 lines | no common line (already for r=2) | holds | R06 |
| 7.7 | type (b) period locus | — | bs Prop 6.15 with M^{≤1} | holds | none |
| 8.1 | size_v | L₃⊔L₄; 4 fixed → fixed⊔4-orbit; S₃ | 3/7; 1 > 1/5; 0 and 1 | holds | dup |
| 8.2 | n_v = 7 for v∤6 | ℚ₅; ℚ₂ | 3+1+3 = 7; ℚ₂: 7+4 = 11 | holds | none |
| 8.3 | small-orbit count | g=2, k=5, q_v=7 | gcd(5,6), gcd(5,48), gcd(5,342) all 1; 7·25 = 175 of 625 | holds | none |
| 8.4 | no type (c) | q=83 at q_v=5 | forbidden {3,5,31}; 82 = 2·41; 63/13448 ≈ 0.0047 < 1/124 ≈ 0.0081; ζ(4) ≈ 1.0823 < 9/8; 5⁻¹ ≡ 33 mod 41 | holds | none |
| 8.5 | q exists | q_v = 2 | odd primes {3,7}; q=11 meets (1); needs q−1 ≥ 9·11 = 99 | holds | none |
| 8.6 | coverage comparison | g=3, q=11, n_v=2 | 2·ζ(6)·8/10³ ≈ 0.0163 < 1/26; q = 23 is minimal for (2°) because 3,5,7 always divide q_v∏_{i≤7}(q_v^i−1) | holds | none |
| 9.1 | LV finite at self-conjugate v | — | trichotomy + 7.5 + 7.8 + 8.4 | holds | none |
| 9.2 | Mordell | elliptic curve, positive rank | excluded by genus | holds | R07 wording |
| 9.3–9.5 | Selmer image finite; Theorems A, B | ℚ, p = 2, bad reduction | every place self-conjugate; with 0.5(b) | holds | R04 |
| 9.6 | LV as obstruction | — | bs Remark 1.3 and footnote 1 | holds | none |

## Not verifiable

- The published Annals text (DOI 10.4007/annals.2025.201.1.2) is paywalled, so its numbering was not compared. The manifest and the README use arXiv v1 throughout, and its version note says so.
- Texts not in the manifest were not opened: Lawrence–Venkatesh 2020, Shimizu 2020, Fontaine 1994, Berger 2002 and Scholze 2013. Claims resting on them (the inputs to bs Theorem 3.22, and bs Theorem 2.9) were checked only as bs states them.
- Of the 34 board packages in the index, only LawrenceVenkateshMethod and PadicHodgeTheoryPartII were read at their heads. The others were screened by name and through the local board checkout.
- AdicEtaleGeometry *finite-etale-local-to-global* was read at the statement level only. The strong sheafiness of `K_v⟨t^{±1}⟩` is the standard strongly-noetherian fact and is not cited in the README.

## Source issues

- **Error** in bs at Proposition 6.7(c) and proof (= Proposition 1.8(c)), pp. 46–47 and 6: the source says (c) gives at least dim A/(d+1) small points, deduced from #Σ ≤ dim A; it should be #Σ_A/(d+1) (or assume A split); false for A=ℚₚ[ε]/(ε³), V=A⊗H¹(E); affects a stated result.
- **Gap** in bs at proof of Proposition 6.9 with Definition 6.11, pp. 48–49: the source says the fibre V_ψ of an S-good pair meets Definition 6.11, whose integrality means integer Frobenius polynomials; it should allow algebraic-integer eigenvalues of bounded degree (fibres need not be rational); affects the proof.
- **Gap** in bs at proof of Proposition 2.16(1), p. 12: the source says averaging over G_v yields the trace from ℚₚⁿʳ to ℚₚ; it should also use commutation with φ, since G_v only reaches the fixed field K_{v,0}; affects the proof.
- **Misprint** in bs at §6.3, definition before Proposition 6.15 (p. 49) and its proof (p. 51): the source says M¹(Φ) is isomorphic to the pair (D_pH(A), D_pH(V)); it should be the pair M^{≤1}(Φ); affects nothing.
- **Gap** in bs at Remark 6.23(I), p. 54: the source says choosing r₀ above the odd prime divisors of [K′:ℚ] makes K′ disjoint from ℚ(ζ_{q−1}); it should also take r₀ above every prime ramified in K′ (a quadratic ℚ(√r) is otherwise possible); affects the proof.
- **Misprint** in bs at proof of Proposition 6.20, p. 52: the source says size_v of the fibre of Y over y; it should be the fibre of the finite étale base Y′_q over y; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8eb87ad", "job": "REV-PKG-GaloisSectionsPadicPeriodMaps", "model": "opus", "worker": "fable-rev66"} -->
