# Review of RigidAnalyticGeometry (pull request #1807 at 9562289)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/RigidAnalyticGeometry/` at `95622892ad5bdf3ffcb776cdad81d3a22ff7fd8f`. The push gate passes (every check 0, build OK). `Suggested.lean` elaborates with three `sorry` warnings and nothing else. The dependency check reports `depcheck: 238 roadmaps, 2317 edges, 0 problem(s)`, but R01 shows two section-level cycles it does not report.

## R01 (P1) — Two-way supply with AdicSpacesPartII and AdicSpacesPartIII, with section-level cycles

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 1433 and 1460 (§§8.2–8.3 *Needs:* "AdicSpacesPartII R1.7"), line 1333 (§7.5 *Needs:* "AdicSpacesPartIII R3.6"), supplier rows 78–79, and line 231: "Both roadmaps consume the classical algebra … the dependency is between theorem groups".

**Claim.** The README names AdicSpacesPartII (R0.3, R0.4, R0.5, R1.7) and AdicSpacesPartIII (R3.2–R3.7) as suppliers in its *Needs:* lines and its supplier table. Its Downstream consumers section (lines 1547–1560) lists both roadmaps as consumers, and both cite this roadmap in their own *Needs:* lines. Supply therefore runs in both directions, and two of the loops close at section level.

**Witness.** AdicSpacesPartII on main, lines 9849–9853 (R1.7 *Needs:* "*classical-points-constructible-density* (RigidAnalyticGeometry §8.2)"), and line 9922 ("Supplied by RigidAnalyticGeometry §8.3"). AdicSpacesPartIII on main, line 11042 (R3.6 *Needs:* "RigidAnalyticGeometry §7.5"). §8.2 → R1.7 → §8.2 and §7.5 → R3.6 → §7.5 are cycles.

**Repair.** Make this roadmap upstream of both, as its own Scope and Downstream sections intend.
1. Delete "AdicSpacesPartII R1.7" from the §8.2 and §8.3 *Needs:* lines and Sources (lines 1429, 1433, 1456, 1460), from the Layer 8 Dependencies (line 1514) and from the supplier-table row (line 78). R1.7 stays under Downstream consumers.
2. Delete the Part II R0.3/R0.4/R0.5 *Needs:* items of §§1.3, 1.4 and 2.2 (lines 538–539, 565, 629, 723, 810), together with the "compare with Part II R0.3" sentence (lines 516–517) and "Part II R0.3" in the §1.4 Sources (line 561). Those comparisons belong to Part II, the consumer. §1.3 can use the pinned `TauCeti.Huber.CompletedTensor`.
3. Cut the "Supplier contract: Part III …" blocks of §1.3 (lines 519–541), §7.1 items 1–4, §7.3 (coherence and quasi-Stein; keep the identity principle, which is owned here), §7.4 and §8.4, and the AdicSpacesPartIII supplier row. Under Scope and ownership, state that these are AdicSpacesPartIII R3.2–R3.7's and that Part III consumes this roadmap.
4. §7.5's only outside input is Kiehl's finiteness theorem from R3.6. Either move formal functions into AdicSpacesPartIII R3.6, with an old → new line for §7.5 (cited at AdicSpacesPartIII line 11042) and for §7.4 (cited at AdicSpacesPartIV line 446), or prove Kiehl's finiteness in §7.4 without a Part III input.

Then rerun the dependency check. It currently reports 0 problems for these lines, which is a false negative.

## R02 (P2) — Headlines statable at the pins are neither stated nor named as unstatable

**Location.** `Suggested.lean` lines 19–51 (module docstring). It lists §8.2 under "proved by the pinned Tau Ceti" and is silent on §1.2's excellence and on Layer 0's weak stability.

**Claim.** Three headline theorems of the README can be stated on pinned carriers with no new definition:
- Huber's constructible density of classical points (§8.2, line 1426), which AdicSpacesPartII consumes as *classical-points-constructible-density*;
- Kiehl's excellence of affinoid algebras (§1.2, lines 496–503), whose G-ring half is statable;
- Layer 0's end theorem, weak stability of the Gauss fraction field (line 274).

Only the classical-point map is pinned; density is not.

**Witness.** The following statements elaborate at the pin (scratch probe, `sorry` the only warning): `@Dense _ (constructibleTopology _) (Set.range (TauCeti.ValuationSpectrum.maximalSpectrumToSpa K hA.isTopologicallyFiniteType))`, `TauCeti.Excellence.IsGRing A` (`TauCeti/RingTheory/RegularLocalRing/GRing.lean:57`) and `TauCeti.IsWeaklyStable (TauCeti.MvPowerSeries.GaussFractionField (Fin n) K (fun _ ↦ 1))`. `exact?` closes none of them.

**Repair.** Add these three theorems with docstrings and locators: Huber-CV Corollary 4.2, p. 473; Conrad Theorem 1.1.3 with §1.1; BGR §5.3.1. Import `TauCeti.AlgebraicGeometry.AdicSpace.Spa.MaximalIdealPoint`, `TauCeti.RingTheory.Affinoid.TopologicallyFiniteType`, `TauCeti.RingTheory.RegularLocalRing.GRing`, `TauCeti.Analysis.Normed.Field.WeaklyStable` and `TauCeti.RingTheory.MvPowerSeries.TateAlgebra.FractionField`. In the docstring, name the J-2 half of excellence as not statable: there is no J-2 predicate at the pin, only `TauCeti.Excellence.regularLocus`. Remove "§8.2" from the pinned list.

## R03 (P2) — §6.3 defines Kiehl properness more strongly than every source, and gives no input for the reconciling step

**Location.** README lines 1054–1057: "over each admissible affinoid of the base, the inverse image has two finite affinoid covers … Prove its local nature on the base".

**Claim.** Kiehl, Bosch and BGR, as Temkin records it, define properness by the existence of one admissible affinoid covering of the base. "Over each admissible affinoid" is the stronger notion. Proving that it is local on the base, and that the base-change law holds for it, needs the Berkovich route. §6.3's *Needs:* line names that route only for the composition law.

**Witness.** Kiehl-E Definition 2.3 (line 500–504): "es eine zulässige offene affinoide Überdeckung … von Y gibt"; Bosch Definition 8(ii) (line 4959): "There exist an admissible affinoid covering"; Temkin line 788–791 cites BGR 9.6.2/2 in the same existential form.

**Repair.** Define Kiehl properness with "there exists an admissible affinoid covering `(Yⱼ)` of the base such that over each `Yⱼ` …", as the sources do. If the every-affinoid form is kept as a theorem, add [Temkin] Theorem 5.1 with Corollary 4.5 (general `K`) or [Lütkebohmert] Theorem 3.1 (discretely valued `K`) to §6.3's *Needs:* for it, as for the composition law.

## R04 (P2) — Two Checks are false as stated (missing hypothesis)

**Location.** README line 571: "Denominator one gives back `A`". Line 1084: "A closed point is not an affinoid open subdomain."

**Claim.** With `g = 1`, `A⟨f/1⟩ = A⟨T⟩/(Tᵢ − fᵢ)` is the Weierstrass domain `{|fᵢ| ≤ 1}`. That is `A` only when every `|fᵢ|sup ≤ 1`. A closed point is an affinoid subdomain whenever it is isolated.

**Witness.** `A = K⟨T⟩`, `f = T/ϖ`: `A⟨S⟩/(S − T/ϖ) ≅ K⟨S⟩` via `T = ϖS`, the disc `|T| ≤ |ϖ|`. The point of `Sp K` is all of `Sp K`, and the isolated point of `Sp(K⟨T⟩×K)` is a subdomain.

**Repair.** Line 571: "Denominator one with power-bounded numerators (`|fᵢ|sup ≤ 1`) gives back `A`; `f = T/ϖ` on `K⟨T⟩` gives the disc `|T| ≤ |ϖ|`." Line 1084: "The origin of the unit disc is not an affinoid subdomain (affinoid subdomains are open in the canonical topology), whereas the point of `Sp K` is."

## R05 (P2) — A supporting target of the excellence theorem is vacuous

**Location.** README line 500: "a nonempty regular locus in every affinoid domain".

**Claim.** In a domain `A` the generic point `(0)` is always in the regular locus, since `A_(0)` is a field. As written, the target holds for every domain and does not give the openness that excellence (J-2) needs.

**Witness.** Conrad line 147 states the needed input as "the regular locus in Spec(A) for an affinoid domain A contains a non-empty open set". For `A = K⟨T⟩`, `(0)` lies in `regularLocus A` with no theorem needed.

**Repair.** "the regular locus of every affinoid domain contains a nonempty open subset of `Spec A` ([Conrad] §1.1, p. 3)", stated with the pinned `TauCeti.Excellence.regularLocus` (`TauCeti/RingTheory/RegularLocalRing/Locus.lean:61`).

## R06 (P3) — Results proved at the pin are listed as open targets

**Location and witness**, each a "Prove/Construct" sentence of the README against a declaration resolved at the pin:
- §1.1 line 397, closedness of ideals: `TauCeti.Huber.IsTopologicallyFiniteType.isClosed_ideal` (`TauCeti/RingTheory/Huber/TopologicallyFiniteType/Complete.lean:105`) with the pinned `TauCeti.IsAffinoidAlgebra.isTopologicallyFiniteType`.
- §0.2 line 339, the Gauss-normed `Frac(Tₙ)`: `TauCeti.MvPowerSeries.GaussFractionField` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/FractionField.lean:58`).
- §1.2 line 498, regularity of Tate algebras at maximal ideals: `TauCeti.MvPowerSeries.isRegularLocalRing_localization_atPrime_of_isMaximal_isRestricted_subring` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Regular.lean:144`).
- §1.4 lines 558–560, density of `A[g⁻¹]` and the completion of the localisation (the Huber rational localisation): `TauCeti.RationalFraction.denseRange_awayLift` (`RationalFraction.lean:439`) and `TauCeti.RationalFraction.completionLocEquiv` (`:326`).
- §2.1 line 652, the monic bound: `TauCeti.IsAffinoidAlgebra.supSeminorm_le_iSup_coeff_rpow_of_eval_eq_zero` (`SupSeminorm.lean:499`).
- §2.3 line 743, BGR 6.3.1/4–5 and the injectivity half of 6.3.1/6: `AlgHom.comap_ker_reductionMap_eq_radical`, `AlgHom.ker_reductionMap_eq_radical_map`, `AlgHom.injective_reductionMap_iff_ker_le_nilradical` and `AlgHom.injective_of_injective_reductionMap` (`Reduction.lean:272, 314, 327, 350`).
- Layers 3–4 line 833, transitivity: `TauCeti.IsAffinoidSubdomainMap.comp` (`Subdomain/Basic.lean:281`); the subdomain form of `A/𝔪ⁿ` is `quotientPowAlgEquiv` (`:158`).
- §6.1 lines 967–974, bases, the §9.1.2 enhancement with its universal property, and sheaf extension: `TauCeti.GTopology.isTopologicalBasis_range` (`Basic.lean:167`), `saturated_finestSlightlyFiner`, `SlightlyFiner.exists_continuousMap_finestSlightlyFiner`, `SlightlyFiner.isDenseSubsite` and `SlightlyFiner.sheafEquiv` (`SlightlyFiner.lean:147, 213, 247, 282`).
- §§7.1–7.2 and Scope line 51, `IsCompletelyContinuous` attributed to CompactOperators: pinned as `ContinuousLinearMap.IsCompletelyContinuous` (`TauCeti/Analysis/Normed/Operator/CompletelyContinuous.lean:103`).

**Repair.** Replace each "Prove/Construct" by a citation of the pinned name, add the names to the Tau Ceti supplier paragraph, and keep as targets only the parts not pinned: §2.3's strictness clause of 6.3.1/6, and the stalk form in Layers 3–4.

## R07 (P3) — RestrictedPowerSeries cited at the wrong sections, and once for a statement it does not make

**Location.** README lines 293–296 (§0.1: "Use RestrictedPowerSeries §§2.4 and 5 for the … Gauss norm, polynomial density, coefficient reduction …, bounded evaluation and substitution, … Zariski-dense maximum locus"); lines 186–192; line 433 ("RestrictedPowerSeries Layer 4 (restricted series over Banach rings)").

**Witness.** In RestrictedPowerSeries at this head: Gauss norm and density are §1.1 (line 247), evaluation and substitution §§2.1–2.2, reduction §3.3 (line 424); Layer 4 is "Weierstrass theory over Banach rings" (line 452); `grep -i zariski` finds nothing.

**Repair.** Cite §1.1, §§2.1–2.2, §2.4, §3.3, Layer 4 and §§5.1–5.4 for those items respectively, and §§0.1 and 1.1 for restricted series over Banach rings. Drop the Zariski-dense maximum locus from the imported list; the Check at line 734 does not need it as an import.

## R08 (P3) — Locators that do not support the statement as written

- README line 1427: "Constructible subsets are determined by their classical traces" is Huber-CV **Corollary 4.3** (Huber-CV line 823, p. 473), which line 1429 does not cite. Add it.
- README line 773: "proved by [FK] B.1.3(1)'s boundedness argument". FK states B.1.3 without proof (FK line 10031, "The following propositions are easy", □ at line 10036). Write "using [FK] Chapter 0, Appendix B, Proposition B.1.3(1) (p. 236 of arXiv v5)", and make the References entry give the chapter and version.
- `Suggested.lean` line 104: "Kiehl-AB Hilfssatz 1.3" is Tate's Laurent-refinement step (Kiehl-AB line 209), not the acyclicity theorem. Write "Kiehl-AB §1 (Hilfssatz 1.3 reduces to Laurent covers)".
- README lines 1279–1286: the finite flat and field-extension base changes are not in Kiehl-E Satz 3.5, which covers affinoid subdomains only (Kiehl-E line 747–749). Cite [Conrad] Lemma 1.1.5 for the field extension, and note that the finite flat case follows from flatness of `A → B` on the Čech complex.

## R09 (P3) — Definitions without Checks, and one Check with a wrong justification

**Location.** README line 1045: "Define quasi-compact and quasi-separated morphisms … and separatedness by the diagonal closed immersion" has no Check. Line 870: "forces the unit-ideal condition by Jacobsonness".

**Witness.** None of the four §6.3 Checks (lines 1080–1088) tests quasi-compactness, quasi-separatedness or separatedness. In line 870, a common zero of the `gᵢ` exists at any maximal ideal containing `(g₀,…,gₘ)`; the Jacobson property is not used.

**Repair.** Add three Checks to §6.3:
- the punctured disc over `Sp K` is not quasi-compact;
- two closed discs glued along the open disc are not quasi-separated (§8.3's example);
- `ℙ¹` is separated, while the line with doubled origin is not (Conrad line 1563).

In line 870, replace "by Jacobsonness" with "since every proper ideal lies in a maximal ideal".

## R10 (P3) — An open pull request rewrites this README differently, with no stated order

**Location.** Pull-request description, merge-order paragraph: it orders only #1101 and the stacked #1808.

**Witness.** The overlap index of open pull requests lists #1854 ("Cut the dependency loops main acquired after the pin bump") as changing this roadmap. Its `RigidAnalyticGeometry/README.md` has 946 lines against this head's 1633, a 1539-line diff.

**Repair.** State in the merge-order paragraph whether #1854 is rebased on this pull request or the reverse. Do not restate the targets that the other one changes.

## R11 (P3) — House shape and timelessness

- `## Conventions` (line 236) follows `## Exact supplier contracts` (line 69). Move it before.
- `## Layers 3–4` (line 816) and `## Layer 5` (line 890) have no `### k.n` subsections. Split Layers 3 and 4, for example 3.1 affinoid spaces, 4.1 subdomains and covers, 4.2 local rings.
- Line 916: "the higher Čech vanishing and the module form are README targets; the sheaf form is the stated headline" is the README describing itself. Write "the sheaf form is stated in `Suggested.lean`".
- Line 1622: "Coordinate integration with the author" is process narrative. Delete it.

## Verified sound

**Gate and build.** The worker's push gate at this head: every check passes. `lake env lean …/Suggested.lean`: exit 0, three `declaration uses sorry` warnings (lines 76, 93, 111). `#check @` of the three declarations: `isJapanese_of_isAffinoidAlgebra` keeps `[IsDomain A]`, `banachFunctionAlgebra` keeps `[IsReduced A] [CompleteSpace A] [IsUltrametricDist A]`, and `isSheaf_affinoidSubdomain_presheaf` keeps `[Fact (IsAffinoidAlgebra K A)]`. Each matches its README statement (§1.2 line 463, §2.2 line 700, Layer 5 line 898). Imports: `import Mathlib` plus three pinned `TauCeti.*` modules. No `set_option`, `lemma` or sorry'd data.

**One-tactic padding probe.** On a scratch copy, `infer_instance` and `exact?` fail on all three theorems. None is padding.

**Dependency check (verbatim).** `depcheck: 238 roadmaps, 2317 edges, 0 problem(s)` (but see R01).

**Library declarations opened at the pin.** All 70 backticked Tau Ceti and Mathlib names of the README resolve. 65 resolve by `#check` in one scratch file. Five resolve in source because their modules had no object files: `TauCeti.IsWeaklyStable`, `isWeaklyStable_of_perfectField` and `isWeaklyStable_of_completeSpace` (`TauCeti/Analysis/Normed/Field/WeaklyStable.lean:36, 47, 55`, later built and checked), `TauCeti.Huber.CompletedTensor` (`TauCeti/RingTheory/Huber/TensorProduct/Completion.lean:73`) and `ContinuousLinearMap.IsCompletelyContinuous` (`…/Operator/CompletelyContinuous.lean:103`). Bodies read:
- `AffinoidSubdomain` and `presheaf` (`Rigid/Affinoid/Presheaf.lean:45, 130`, valued in `CommAlgCat K`);
- `weakGTopology` and `weakGTopology_covers_empty_iff` (`Site.lean:63, 99`);
- `IsJapanese` and `IsJapanese.of_finite` (`Japanese.lean:125, 228`);
- `supSeminorm` and `supSeminorm_le_norm` (`SupSeminorm.lean:103, 323`);
- `exists_supSeminorm_pow_eq_norm` (`ValueGroup.lean:79`; `∃ m ≥ 1, ∀ f`, as README line 689 says);
- `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm` (`Polyradius.lean:68`; matches line 582);
- `isIntegral_map_unitClosedBall_iff_supSeminorm_le_one` and `mem_iff_supSeminorm_le_one_of_isReduced_quotient` (`PowerBounded.lean:135, 250`; hypotheses exactly as lines 751–772);
- `maximalSpectrumToSpa` and `range_maximalSpectrumToSpa` (`MaximalIdealPoint.lean:237, 274`);
- `exists_norm_pow_le_mul_supSeminorm_pow` (`SpectralRadius.lean:70`; per-element constant only, so the uniform headline is not pinned);
- Mathlib `constructibleTopology` (`Mathlib/Topology/Spectral/ConstructibleTopology.lean:43`).

**Cross-roadmap citations resolved (42).**
- RestrictedPowerSeries §§1.1, 2.1, 2.4, 3.3, 5.1–5.4, 6.2 and Layer 4 at this head (numbering issues in R07).
- PadicFunctionalAnalysis §1.2 (line 348), Layer 1 / §1.4 (line 378), and §§2.1, 2.2, 2.4 (lines 416, 430, 471), at this head.
- CompactOperators §0.1 (line 151), §3.1 (615) and §3.4 (739).
- SchemeAndStackFoundations §0.20 (line 1302) and §0.21 (1394), at this head.
- AdicSpaces §§1.3, 3.1 and 5.2, Layer 4 and Layer 5.
- AdicSpacesPartII R0.3 (1769), R0.4 (2270), R0.5 (2759), R0.9 (4071) and R1.7 (9806).
- AdicSpacesPartIII R3.1 (9136), R3.2 (9594), R3.3 (9870), R3.4 (10053), R3.6 (10472) and R3.7 (11218), with targets *surjection-small-perturbation* (line 600), *almost-noetherian-integral-affinoid-modules* (602) and *affinoid-completed-field-extension* (607).
- AdicSpacesPartIV F1.1 (2998) and R5.7 (2165).
- LocallyAnalyticDistributions §4.16 at the #854 head (lines 253, 860).

**Ownership against open heads.** I searched every open head for: Banach function algebra; affinoid + Japanese; Tate acyclicity; rigid analytification; Kiehl proper mapping; weakly stable. This roadmap is the only owner of the first, second and last. RestrictedPowerSeries on main (line 75) defers weak stability and the Japanese property to it. Kiehl's theorem is uniformly AdicSpacesPartIII R3.6's (#1002 line 455, #1084 line 2859), which supports R01's repair 3.

**Source sample verified against the text.**

| Target | Locator | Read at | Verdict |
| --- | --- | --- | --- |
| 1.2 height formula | Conrad Lemma 2.1.5 | Conrad line 570, p. 12 | statement and hypotheses match |
| 1.2 Kiehl criterion | Conrad Thm 1.1.1 | line 156, p. 4 | matches |
| 1.2 excellence inputs | Conrad §1.1 | lines 142–148, p. 3 | match, except "open" (R05) |
| 1.3 field extension | Conrad Lemma 1.1.5 | line 274, p. 6 | matches (faithful flatness, `A′⊗M ≅ A′⊗̂M`) |
| 2.3 reduced quotient | FK B.1.3(1) | FK line 10032, p. 236 | an ingredient, stated without proof (R08) |
| 6.2 field extension | Conrad §3.1 records BGR 9.3.6 | line 821 | matches |
| 6.2 rigid spaces | Bosch §5.3 | Bosch line 3943, p. 103 | matches |
| 6.3 inner relation | Bosch Def 6; Kiehl-E Def 2.1 | Bosch line 4933 p. 131; Kiehl-E line 475 p. 202 | match (single `ε∈√|K×|`) |
| 6.3 properness | Bosch Def 8; Kiehl-E Def 2.3 | Bosch line 4956; Kiehl-E line 500 | existential form (R03) |
| 6.3 composition | Lütkebohmert Cor 3.2 | line 413, p. 350; complete DVR standing hypothesis at line 109 | matches |
| 6.3 composition | Temkin Cor 4.5–4.6 | lines 792, 806, pp. 18–19 | match (Hausdorff; interior formula) |
| 7.4 finiteness, subdomain | Kiehl-E Satz 2.6, Satz 3.5 | lines 626, 747, pp. 205, 209 | match (R08 for flat and field cases) |
| 7.5 filtration | Kiehl-E Thm 3.4 | line 647, p. 206 | `R_k` and null systems match |
| 7.5 formal functions | Kiehl-E Thm 3.7 | line 809, p. 210 | matches (induction on generators) |
| 7.3 quasi-Stein | Kiehl-AB Def 2.3, Satz 2.4 | lines 601, 615, pp. 270–271 | match |
| 8.1 absolute | Conrad App. A (A.1.2, A.1.3) | lines 1531, 1580, pp. 31–33 | match |
| 8.1 relative | Conrad-RA Ex. 2.2.11 | line 854, pp. 1069–1070 | final object, points, completions and finite `C`: match |
| 8.2 density | Huber-CV Thm 4.1, Cor 4.2 | lines 775, 818, pp. 472–473 | `L_A` identical to README line 1423; Cor 4.3 missing (R08) |
| 8.3 functor | Huber-FR Prop 4.5 (i)–(v) | line 1436, p. 543 | every clause matches |
| 7.2 slopes | Urban §2.3 | line 868 | matches |

**Adversarial table** (values computed by hand; `ϖ` with `0<|ϖ|<1`).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `isJapanese_of_isAffinoidAlgebra` | `A=K`; `A=K⟨T⟩`, char `p`, `L=Frac(T₁)(T^(1/p))`; cusp; `K⟨T⟩×K`; `A=0` | `K`: closure of `K` in finite `L` is `L`, finite; `K⟨T⟩[S]/(Sᵖ−T)=K⟨S⟩`, free of rank `p`; cusp free of rank 2 over `K⟨X⟩`, so `of_finite` applies; the last two are excluded by `[IsDomain A]` | true | none |
| `banachFunctionAlgebra` | `K⟨T⟩/(T²)`; `K×K` with max norm; `A=0`; `K⟨T⟩` with `2‖·‖_Gauss` | `‖T‖=1`, `|T|sup=0`, excluded by `IsReduced`; `‖(a,b)‖=|(a,b)|sup`, `C=1`; `0≤C·0`; `2‖f‖≤2|f|sup`, `C=2>1`, so `∃ C` is needed | true | none |
| `isSheaf_affinoidSubdomain_presheaf` | `A=0`; Laurent cover of `Sp K⟨T⟩`; one-member cover | the empty cover forces `sections ⊥ = 0`, and it is `0`; `Σ_{n∈ℤ} aₙTⁿ` on `|T|=|ϖ|` splits into `n≥0` and `n<0` parts, so gluing and `H¹=0` hold; trivial | true | none |
| §0.1 Checks | `p+T²` over `ℚ_p`; `p+T+pT²` | Gauss norm 1, `|1+p|=1`, value at 0 `=p⁻¹`; reduction `T` | true | R07 (locators) |
| §0.2 example | `T₁[√T]` | `K⟨T⟩[S]/(S²−T)=K⟨S⟩`, normal and free of rank 2 | true (also in char 2) | none |
| §1.1 Checks | dual numbers; `K×K` | residue norm `‖T‖=inf‖T+T²g‖=1`, `T²=0`; `𝔪₁ⁿ=0×K≠0`, `𝔪₁∩𝔪₂=0` | true | R06 (ideal closedness pinned) |
| §1.2 Checks | cusp; `ℚ_p⟨T⟩/(T²−p)`; `K⟨T⟩×K` | `Y²−X³` is `Y`-distinguished of degree 2, dimension 1; field `ℚ_p(√p)`, `|T(x)|=p^(−1/2)`; `ht(K⟨T⟩×0)=0` against `dim 1` | true | none |
| §1.2 "nonempty regular locus" | any affinoid domain | `(0)` regular, since `A_(0)` is a field | vacuous | R05 |
| §1.4 "denominator one" | `A=K⟨T⟩`, `f=T/ϖ`; `f=T` | `K⟨S⟩` (disc `|T|≤|ϖ|`) `≠A`; `A⟨S⟩/(S−T)=A` | false without `|f|sup≤1` | R04 |
| §1.4 unit-ideal Check | `g=f=0` | `A⟨S⟩/(0)=A⟨S⟩`, `g` not inverted | true | none |
| §1.5 criterion | `ρ=p^(−1/2)` over `ℚ_p`; `ρ∉p^ℚ` | `ρ²/|p|=1`; `ℚ_p⟨S,T⟩/(T²−pS)≅T_{1,ρ}` (even/odd split, `|a_{2k}pᵏ|=|a_{2k}|ρ^{2k}→0`); excluded | true | none |
| §2.1 Checks | `K×K`; monic `X²−p` | `|(1,0)(0,1)|sup=0≠1=|(1,0)|sup·|(0,1)|sup`; bound `|p|^(1/2)=p^(−1/2)`, attained, while exponent 1 gives `p⁻¹<p^(−1/2)` | true | R06 (bound pinned) |
| §2.2 multiplicativity | annulus `XY=c` | domain; `|X|sup=|Y|sup=1`, `|XY|sup=|c|<1`; `X̃Ỹ=0` in `Ã` | true, consistent with the "`Ã` domain" criterion | none |
| §2.3 Checks | `ℚ_p⟨T,S⟩/(S²−p²T)≅ℚ_p⟨U⟩`; `ℤ_p`, `ϖ=p²` | `B=ℤ_p⟨U²⟩⊕pUℤ_p⟨U²⟩`, `S/p=U∉B`, `B/pB=𝔽_p[T][S]/(S²)`; `ℤ/p²` nonreduced although `B=A°` | true | R06, R08 |
| Layers 3–4 | `K⟨T⟩`, `𝔪=(T)`; Laurent cover | `A/𝔪ⁿ=K[T]/(Tⁿ)`; intersection is the circle | true | R06, R09 |
| Layer 5 Checks | Laurent sequence; `{U}`; `A=0` | exact including `H¹`; `0→A→A→0`; `F(∅)=0` | true | none |
| §6.1 Checks | `ℕ` with finite covers; constant `ℤ` on 2 points | bounded functions glue on finite covers, but `f(n)=n` fails for singletons; sheafification `ℤ×ℤ` against `F(X)=ℤ` | true | R06 |
| §6.2 Checks | open disc ∪ circle; `|T|ⁿ≤|ϖ|` | gluing gives `f∈K⟨T⟩`, `f=0` on `|T|<1` (infinitely many zeros) and `f=1` on `|T|=1`: contradiction; radii `|ϖ|^(1/n)→1` | true | none |
| §6.3 inner relation | unit disc in itself; `ℙ¹` | generators `<1` force `A₀↦K̃` in `Ã=K̃[T]`, so `T̃` would be integral over `K̃`: false; `ϖT` has sup `|ϖ|<1` on the unit disc | true | none |
| §6.3 closed point Check | `Sp K`; `Sp(K⟨T⟩×K)` | the point is all of `Sp K`; the isolated point is a subdomain | false as stated | R04 |
| §6.3 properness definition | sources | "each affinoid" against "exists a covering" | stronger, route missing | R03 |
| §7.1 Checks | `h(ΣaₙTⁿ)=Σaₙϖⁿ Tⁿ` | truncation error `≤|ϖ|^N`; `(id−h)` has coefficients `aₙ(1−ϖⁿ)`, `|1−ϖⁿ|=1` for `n≥1`, so image `TK⟨T⟩` and cokernel `K` | true | R01 (contract) |
| §7.2 Checks | `c·id`, `|c|=r`; `X−c` against `1−cT` | root `c` with `|c|=r≥r`; roots `c<1` fail and `1/c>1` pass | true | none |
| §7.4 non-flat base change | `ℙ¹_{K⟨t⟩}`, `F=I_P(−1)` | `H⁰(X,F)=0`; `I_P/tI_P≅𝒪(−P)⊕k_P` (`x̄` free over `R/t`, `t̄` killed by `(t,x)`), fibre `𝒪(−2)⊕k_P`, `H⁰=K≠0` | true | R01, R08 |
| §7.5 filtration | `a=0`; `a=1`; `X=Sp A`, `i=0` | `R₀=M`, `Rₙ=0` (`d=1`, and also `d=0`); `F/F=0`, `Rₙ=M`; `Rₙ=aⁿM`. `aRₙ⊆R_{n+1}` via `·a: F/aⁿF→F/a^{n+1}F` | true | R01 |
| §8.1 Checks | `y²=x²(x+1)`; finite `A` | algebraic local domain; analytic branches `y=±x√(1+x)` (char ≠ 2); `Sp A=Spec A` (Conrad-RA line 859) | true | none |
| §8.2 Checks | `A=0`; Gauss point | `Spv 0=∅` (`v(1)=1≠0=v(0)`); support `0` not maximal, consistent with `range_maximalSpectrumToSpa` | true | R01, R02, R08 |
| §8.3 | Huber-FR 4.5 | (i) topos equivalence, (ii) fully faithful, (iv) quasi-separated equivalence, (v) affinoid iff affinoid | true | R01 |
| §8.4 | contract only | no locator other than Part III R3.7 | owned by Part III | R01 |
| R02 candidates | three statements | elaborate; `exact?` fails | statable and not padding | R02 |

## Not verifiable

- **[BGR]** is recorded as `uncertified` (paywalled) and is settled. Every BGR locator was taken at its number without the text: 2.3.2/7, 3.5.1–3.5.3, 3.7.5, 3.8.1/7, 3.8.3/7, 4.1/3–4, 4.4/2, 5.3.1/1, 6.1.1–6.1.5, 6.2.1–6.2.4, 6.3.1/3–6, 6.3.4–6.3.5, 7.2, 8.2, 8.2.1/1, 9.1.2–9.1.3, 9.3, 9.3.6. The sampled §§1.1, 1.4, 1.5 and 6.1 rest on BGR alone. I checked their statements against the pinned declarations instead. BGR 9.3.6 and 9.6.2/2 are corroborated through Conrad line 821 and Temkin line 788.
- **Kiehl-E and Lütkebohmert** are OCR scans. The conclusion of Kiehl-E Satz 2.6 (line 627) is garbled; the reading "`H^r(X,F)` is a finite `A`-module" comes from the reversed text and §2's context.

## Source issues

- none
