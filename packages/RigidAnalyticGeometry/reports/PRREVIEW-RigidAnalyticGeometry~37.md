# Review of RigidAnalyticGeometry (pull request #1808 at c9403e2)

**Verdict:** needs changes

Since the pin bump, Tau Ceti already contains most of Layers 1–2, much of Layers 3–4, §6.1 and §7.2, under `TauCeti/RingTheory/Affinoid/`, `TauCeti/AlgebraicGeometry/Rigid/Affinoid/`, `TauCeti/Topology/GTopology/` and `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean`. `Suggested.lean` still redefines these objects and states proved theorems with `sorry`. Meanwhile four headlines that the pin now makes statable are missing. Separately, Layer 8 has a target-level supply cycle with AdicSpacesPartII, and Layer 7 has a two-way supply with AdicSpacesPartIII.

## R01 (P1) — Supply cycle: §8.2 and §8.3 need AdicSpacesPartII R1.7, which R1.7 says they supply

- **Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 1032–1034, §8.2: "*Needs:* … AdicSpacesPartII R1.7 (classical-point contract)". Line 1057, §8.3: "*Needs:* … AdicSpacesPartII R1.7". Also lines 1023, 1044 (Sources) and 1096 (Layer 8 Dependencies). These lines are new in this pull request.
- **Claim.** §8.2 and §8.3 consume Part II R1.7.
- **Witness.** `TauCetiRoadmap/AdicSpacesPartII/README.md` (main) R1.7, *rigid-adic-comparison-functor*, line 9819: "Supplied by RigidAnalyticGeometry §§8.2–8.3". Its *Needs:* (line 9853) include "*classical-points-constructible-density* (RigidAnalyticGeometry §8.2)". That is a two-node cycle at target level. The depcheck does not catch it because it treats roadmaps on main as never upward.
- **Repair.**
  - Delete "AdicSpacesPartII R1.7" from the §8.2 and §8.3 *Needs:* lines, from both Sources lines and from the Layer 8 Dependencies.
  - The classical-point map is pinned: cite `TauCeti.ValuationSpectrum.maximalSpectrumToSpa` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237`), with injectivity from `eq_maximalSpectrumToSpa_iff` (line 261).
  - To make the whole Part II relation one-way (Part II R0.9 and R1 consume this roadmap), also replace the remaining Part II citations with pinned declarations:
    - §1.3/§1.4 "Part II R0.3": cite `TauCeti.Huber.CompletedTensor` (`RingTheory/Huber/TensorProduct/Completion.lean:73`) and `TauCeti.AffinoidPushout.completedTensorEquiv` (`RingTheory/Affinoid/Pushout/CompletedTensor.lean:187`).
    - §2.2 "Part II R0.4": cite `TauCeti.IsAffinoidAlgebra.supSeminorm_eq_smoothingFun` (`RingTheory/Affinoid/SpectralRadius.lean:140`).
  - Checked: after these edits no *Needs:* line of this README names AdicSpacesPartII, and every replacement is a pinned declaration.

## R02 (P2) — Two-way supply with AdicSpacesPartIII, and Part III's theorems re-planned as Layer 7 and §8.4

- **Location.** README lines 46, 303, 497, 626, 785–809, 876–897, 904–920 and 1067–1082, plus the `Suggested.lean` docstring lines 20–24. For example §7.4: "**Supplier contract: Part III R3.6.** For Kiehl-proper `f:X→Sp A` and coherent `F`, prove `M^i=H^i(X,F)` finite over `A`".
- **Claim.** Part III supplies §§1.3, 2.3, 7.1, 7.3, 7.4 and 8.4.
- **Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` (main):
  - line 112 lists "Dependencies: … RigidAnalyticGeometry (roadmap on main) Layers 1–8";
  - R3.6 *proper-cohomology-adic-completion* (line 11042) has *Needs:* "RigidAnalyticGeometry §7.5";
  - in this README, §7.5 needs §7.4, and §7.4 needs AdicSpacesPartIII R3.6.
- **Repair.** This roadmap supplies Part III, so it must cite nothing from it.
  1. Delete the Part III restatements: §7.1 items 1–4, the quasi-Stein paragraph of §7.3, §7.4, §8.4 and the Layer 5 sentence applying Part III R3.1. Replace them with one Scope sentence: coherent sheaves, Kiehl's Banach lemmas and proper mapping theorem, quasi-Stein theorems and proper GAGA are AdicSpacesPartIII R3.1–R3.7's. (§8.4 also has no source locator.)
  2. Move §7.5 to AdicSpacesPartIII R3.6, which already states it as *proper-cohomology-adic-completion*. Add the README line "§7.5 → AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*", because Part III cites §7.5.
  3. §2.3: delete the almost-noetherian contract, `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete`. Part III R3.6 owns them as `IntegralAffinoidPresentation.almost_noetherian` and `.fg_of_discrete` (line 11176).
  4. §1.3: drop the "Supplier contract: Part III R3.6" label. Either own the affinoid field extension here (its source is Conrad line 274, Lemma 1.1.5(1), p. 6) and note under Downstream consumers that Part III R3.6 should cite it, or delete it together with the §6.2 field-extension paragraph.
  5. Remove Kiehl's finiteness, Theorem B and proper GAGA from the `Suggested.lean` list of this roadmap's headlines.

## R03 (P2) — `Suggested.lean` redefines objects that Tau Ceti has at the pin

- **Location.** `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`:
  - line 67 `def IsAffinoidAlgebra`
  - line 148 `def pointNorm`
  - line 155 `def supSeminorm`
  - line 231 `def IsPresentationRing`
  - line 274 `def IsSlopeLE`
  - line 283 `def IsSlopeDecomposition`
- **Claim.** These are "the few definitions needed to state" the headlines.
- **Witness.** Each object is already defined at the pin:
  - `TauCeti.IsAffinoidAlgebra` (`TauCeti/RingTheory/Affinoid/Basic.lean:30`, same body)
  - `TauCeti.pointNorm` and `TauCeti.supSeminorm` (`RingTheory/Affinoid/SupSeminorm.lean:96, 103`)
  - `Polynomial.IsSlopeLE` (`Analysis/Normed/Unbundled/Slope.lean:64`)
  - `ContinuousLinearMap.IsSlopeDecomposition` (`Analysis/Normed/Operator/SlopeDecomposition.lean:51`)
  - the presentation ring is `(Subring.unitClosedBall _).map π.toRingHom` (`RingTheory/Affinoid/PowerBounded.lean:135`)

  The pinned definitions are not exposed, so the copies are not interchangeable: `example : IsAffinoidAlgebra K A ↔ TauCeti.IsAffinoidAlgebra K A := Iff.rfl` fails to elaborate. LocallyAnalyticDistributions §4.16 consumes the copies by name.
- **Repair.**
  - Import `TauCeti.RingTheory.Affinoid.*` and `TauCeti.Analysis.Normed.Operator.SlopeDecomposition`. Delete the six definitions, and delete `IsStrictRadius` (line 71), which only `weightedTate_isAffinoid_iff` uses.
  - State the remaining headlines on the pinned carriers. Use `TauCeti.Ring.IsJapanese (TateAlgebra K n)` (`RingTheory/Japanese.lean:125`) for `integralClosure_finite`, whose body restates that class's field.
  - In the README, §7.2 and Downstream consumers cite the pinned names, so LocallyAnalyticDistributions §4.16 can follow.
  - Tested: with these substitutions the file elaborates (scratch copy).

## R04 (P2) — Four headlines statable at the pin are missing, and the docstring's "not statable" reasons are false

- **Location.** `Suggested.lean` lines 18–26. For example: "classical Tate acyclicity and the sheaf property … (Layer 5): no `Sp A` with its rational basis and structure presheaf". And: "(§1.3): no completed tensor product". And: "excellence … no excellence predicate".
- **Witness.** Each of the following elaborates against the pin with `sorry` as the only warning (scratch probes):
  - **Tate acyclicity (sheaf form):** `Presheaf.IsSheaf (TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).grothendieckTopology (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A))` under `[Fact (TauCeti.IsAffinoidAlgebra K A)]` (`AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`, `Presheaf.lean:130`).
  - **G-ring half of excellence:** `TauCeti.Excellence.IsGRing A` (`RingTheory/RegularLocalRing/GRing.lean:57`).
  - **Gerritzen–Grauert:** every `U : TauCeti.AffinoidSubdomain K A` is a finite union of `TauCeti.rationalDomain K (g i) (f i)` with each `(g i, f i)` generating `⊤`.
  - **Huber's constructible density:** `@Dense _ (constructibleTopology _) (Set.range (maximalSpectrumToSpa K hA.isTopologicallyFiniteType))`.

  None of the four is proved at the pin (searched for `IsSheaf`, `IsGRing` and `constructibleTopology` under `RingTheory/Affinoid` and `AlgebraicGeometry/Rigid`; `Subdomain/Flat.lean:31` states that it avoids Gerritzen–Grauert). `TauCeti.Huber.CompletedTensor` exists at `RingTheory/Huber/TensorProduct/Completion.lean:73`.
- **Repair.**
  - Add these four theorems, in the forms above, with locators: BGR 8.2.1 and Kiehl-AB; Conrad lines 129–136 (§1.1, p. 3, which attributes the characteristic-p case to Kiehl); BGR 7.3.5; HuberCV Corollary 4.2 (HuberCV line 818).
  - Rewrite the docstring list so it names only headlines that really have no pinned carrier: `RigidSpace`, rigid analytification, the rigid–adic functor, and J-2 for the rest of excellence.

## R05 (P3) — Padding: eighteen sorried theorems are proved at the pin

- **Location.** `Suggested.lean` lines 79, 83, 88, 94, 100, 107, 121, 129, 158, 164, 171, 176, 182, 195, 200, 215, 236 and 297.
- **Witness.** In a scratch copy with the pinned carriers of R03, each of these closes with one `exact` of a pinned lemma, or `haveI` plus one lemma. Pinned names, all under `TauCeti/RingTheory/Affinoid/` unless noted:
  - `IsAffinoidAlgebra.isNoetherianRing` (FiniteQuotient.lean:43)
  - `isJacobsonRing` (MaximalSpectrum.lean:53)
  - `exists_finite_injective` (NoetherNormalization.lean:163)
  - `finite_quotient_of_isMaximal` (MaximalSpectrum.lean:46)
  - `height_eq_ringKrullDim_of_isDomain` (KrullDimension.lean:97)
  - `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm` (Polyradius.lean:68; repackaging the right-hand side takes three lines)
  - `continuous_algHom` (Continuity.lean:46)
  - `isClosedEmbedding_of_finite_injective` (FiniteMap.lean:61; more general)
  - `bddAbove_range_pointNorm` (SupSeminorm.lean:302)
  - `exists_pointNorm_eq_supSeminorm` (MaximumModulus.lean:156)
  - `supSeminorm_pow` (SupSeminorm.lean:360)
  - `supSeminorm_eq_zero_iff` (SupSeminorm.lean:385)
  - `exists_supSeminorm_pow_eq_norm` (ValueGroup.lean:79)
  - `isPowerBounded_iff_supSeminorm_le_one` (PowerBounded.lean:169)
  - `isTopologicallyNilpotent_iff_supSeminorm_lt_one` (PowerBounded.lean:197)
  - `mem_iff_supSeminorm_le_one_of_isReduced_quotient` (PowerBounded.lean:250; weaker hypotheses)
  - `AlgHom.isIntegral_map_unitClosedBall_iff_supSeminorm_le_one` (PowerBounded.lean:135)
  - `ContinuousLinearMap.IsSlopeDecomposition.exists_projection` (`TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean:89`)
- **Repair.** Delete them from `Suggested.lean`. The README keeps the statements and cites the pinned names (R06).

## R06 (P3) — The README does not cite the pinned affinoid library and plans it again as open targets

- **Location.** README lines 118–130 ("Existing library interfaces"), which name only the Tate-algebra basics and say "Missing results are required in Tau Ceti". The Layer 1–4, §6.1 and §7.2 targets are written as open work.
- **Witness.** Besides the R05 list, the following are pinned:
  - contractive renorming (`ContractiveRenorming.lean:60`)
  - `A⟨X⟩` and its universal property (`Restricted.lean:73, 171`)
  - rational and Laurent fractions with the adic comparison `completionLocEquiv` (`RationalFraction.lean:326`)
  - flatness of subdomains and faithful flatness for finite covers (`Subdomain/Flat.lean:62, 89`)
  - the covering criterion (`Subdomain/Cover.lean:59`)
  - the reduction functor (`Reduction.lean:127–382`)
  - spectral radius (`SpectralRadius.lean:107`)
  - affinoid slope tests (`Slope.lean:83, 98`)
  - G-topologies, points, gluing and pasting (`TauCeti/Topology/GTopology/*`)
- **Repair.**
  - Add a "From Tau Ceti" contract listing these declarations with their files.
  - Say in Scope that they are already in the library.
  - Delete the targets they discharge, keeping only what the pin lacks.

## R07 (P3) — Gate: `letI` in theorem signatures

- **Location.** `Suggested.lean` line 90 (`exists_finite_injective`) and line 133 (`isClosedEmbedding_of_finite_injective`).
- **Witness.** gate `statement-hygiene`, rule quoted in the gate output.
- **Repair.** Use `π.Finite` / `φ.Finite` (`AlgHom.Finite`), as the pinned statements do. Both theorems are deleted under R05 anyway.

## R08 (P3) — Gate: edits outside the pull request's folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.
- **Witness.** gate `outside-folder`. Neither folder is among the folders this pull request declares as its own.
- **Repair.** Revert both one-line edits, or move them to a pull request that owns those folders.

## R09 (P3) — Conflicting open revision with no stated order

- **Location.** The pull request description's merge-order paragraph names #1101 and #1807 only.
- **Witness.** The overlap index of the open heads (2026-11-08): "#1808 and #1854 conflict in … `TauCetiRoadmap/RigidAnalyticGeometry/README.md`, `…/Suggested.lean`". The #1854 head rewrites the supplier table and the Summary differently.
- **Repair.** State in the merge-order paragraph which of #1808 and #1854 is rebased on the other.

## R10 (P3) — Locators that do not support the statement as written

1. §7.5, line 940, cites "[Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7" for the general-ideal formal-functions isomorphism. That isomorphism is KiehlE line 809, Theorem 3.7, p. 210. The argument preceding it is the proof of Satz 3.5 (subdomain base change). **Repair:** cite Theorem 3.7, p. 210.
2. §7.3, line 895, cites "[Kiehl-AB]; [Conrad] §§1–2". **Repair:** cite KiehlAB line 601 (Definition 2.3) and line 615 (Satz 2.4), pp. 270–271, for quasi-Stein spaces, and Conrad line 554 (Lemma 2.1.4, p. 12) for the identity principle.
3. §7.2 and `Suggested.lean` lines 273 and 279 cite "[Urban] 2.3.1". Urban line 869 defines slope decompositions only for vector spaces over a finite extension L/ℚ_p. **Repair:** say the affinoid-module predicate is this roadmap's extension of it. The docstring of line 296 cites "[Urban] 2.3.2–2.3.3" for the projector, but those are functoriality and uniqueness (Urban lines 883 and 900).
4. §2.3, line 511, and `Suggested.lean` line 211 cite FK B.1.3(1). FK line 10032 states only "f power-bounded iff A₀[f] is a ring of definition", without proof. The reduced-quotient criterion is not there. **Repair:** cite it as the boundedness step only, or cite the pinned `Huber.isPowerBounded_iff_mem_of_isReduced_quotient`.
5. §6.3, lines 736–742, defines Kiehl properness "over each admissible affinoid of the base" and cites [Kiehl-E] §2. KiehlE line 500 (Definition 2.3, p. 202) asks for some admissible affinoid covering of the base. **Repair:** define it as the source does, or cite the theorem that the two agree.

## R11 (P3) — RestrictedPowerSeries cited for statements it does not make

- **Location.** README lines 164–166: "*Needs:* RestrictedPowerSeries §§2.4 and 5 (Gauss norm, polynomial density, reduction, evaluation, …)". Also lines 248–249: "RestrictedPowerSeries Layer 4 (restricted series over Banach rings, `A⟨X⟩`)".
- **Witness.** `TauCetiRoadmap/RestrictedPowerSeries/README.md` (main): the Gauss norm and polynomial density are §1.1, evaluation is §2.1, reduction is §3.3, and §2.4 is "Identity and maximum principles". Layer 4 is "Weierstrass theory over Banach rings"; `A⟨X⟩` is §§0.1/1.1.
- **Repair.** Cite RestrictedPowerSeries §§1.1, 2.1, 2.4, 3.3, Layer 4 and §5 item by item, and add §§1.1, 2.1, 3.3 to the supplier-table row.

## R12 (P3) — Backticked names of this roadmap's own that nothing declares

- **Location.** README lines 49–50, 698, 805, 825 and 1129–1130: `Sp`, `RigidSpace`, `RigidSpace K`, `rigidToAdic`.
- **Witness.** None of them is declared in `Suggested.lean` or at the pinned Tau Ceti (searched for `structure`/`def` of these names).
- **Repair.** Write them in prose ("the affinoid space `Sp A` of Layers 3–4" is fine as notation; "the rigid category of §6.2"; "the functor r of §8.3"), or in italics.

## R13 (P3) — §7.3's classical identity principle has no Checks

- **Location.** README lines 882–886, a target this roadmap owns and supplies to AdicSpacesPartII R1.9.
- **Repair.** Add Checks:
  - on `Sp K⟨T⟩`, a function vanishing on `|T|≤|ϖ|` is zero;
  - on the connected, non-normal `Sp K⟨x,y⟩/(xy)`, `x` vanishes on the admissible open `|y|≥|ϖ|` without being zero, so normality is needed;
  - on `Sp(K×K)`, `(1,0)` vanishes on one component, so connectedness is needed;
  - `K⟨T⟩/(T)` restricted to `|T|≥|ϖ|` is zero, so the statement fails for coherent sheaves.

## R14 (P3) — Reference link mislabelled

- **Location.** README line 1153: "[Author text](https://www.math.purdue.edu/~tongliu/seminar/rigid/Bosch.pdf)".
- **Witness.** Bosch line 5 and lines 40–47: the file is the copyrighted Springer LNM 2105 volume, hosted on a third party's seminar page. It is not an author text.
- **Repair.** Cite DOI 10.1007/978-3-319-04417-0.

## Verified sound

**Gate and build.**
- Re-ran the gate text checks. They give the same statement-hygiene hits, and the same two outside-folder files once the pull request's own folders are excluded.
- `lake env lean` on `Suggested.lean` exits 0 with 22 warnings, all `declaration uses sorry`.
- Compared all 31 elaborated signatures (the worker's `#check @name` listing) with the README. The flagged "dropped" binders are only on `def`/`abbrev`s that do not need them, which matches the pinned definitions. All 22 theorems keep `[CompleteSpace K]`.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2357 edges, 0 problem(s)`. No UPWARD or CYCLE line. R01 and R02 are mutual citations between roadmaps on main, which the tool does not test.

**Adversarial table** (computed values; "pinned" means proved at the pin, R05):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `IsAffinoidAlgebra` | 0; `K`; `K⟨T⟩/(T²)` | `T₀→0`, `T₀=K`, quotient map all surjective | true; duplicate (R03) |
| `IsStrictRadius` | `p^(−1/2)`/ℚ_p; `r=0` | `(p^(−1/2))²=|p|`, m=2; `0<r` excludes 0 | true |
| `integralClosure_finite` | n=0; `Frac T₁(√T)`; char p `T^(1/p)` | closure `L`; `K⟨S⟩`, S²=T, rank 2; `K⟨T^(1/p)⟩` rank p | true; restate as `IsJapanese` |
| `exists_finite_injective` | 0; cusp; `K×K` | 0 has no injective `T_d`→0 (hyp. needed); cusp free on 1,Y over `K⟨X⟩`; `K→K×K` finite, d=0 | true, pinned |
| `finite_residue` | `ℚ_p⟨T⟩/(T²−p)` | residue `ℚ_p(√p)`, dim 2 | pinned |
| `height_eq_…_of_isDomain` | `K`; `K⟨T⟩×K` | ht 0 = dim 0; ht(`K⟨T⟩×0`)=0 ≠ dim 1 (domain needed) | pinned |
| `weightedTate_isAffinoid_iff` | n=0; ρ=`p^(−1/2)` | both sides true; `S↦T²/p` has weighted norm `p^(−1)/p^(−1)=1`, `T_ρ≅ℚ_p⟨S,T⟩/(T²−pS)`, coefficients `|a_{2k}|p^(−k)→0` | pinned |
| `continuous_algHom_…` | `K×K` | `⋂ₙ(K×0)ⁿ=K×0≠0`, `(K×0)∩(0×K)=0`; closed graph | pinned |
| `isClosedEmbedding_…` | `K⟨T⟩→K⟨T/ϖ⟩` | injective, dense non-closed image, not finite (finiteness needed) | pinned |
| `pointNorm`/`supSeminorm` | 0; `K×K`, `(a,b)` | `⨆∅=0`; points give `|b|`,`|a|`, sup `max` | duplicate (R03) |
| `supSeminorm_pow` | n=0 on 0; ℚ_p(√p), n=2 | LHS 0 vs RHS 1 (`hn` needed); `p^(−1)=|p|` | pinned |
| `supSeminorm_eq_zero_iff` | `K⟨T⟩/(T²)` | `T` nilpotent, sup 0 | pinned |
| `exists_uniform_valueGroup_exponent` | `ℚ_p⟨T⟩/(T²−p)` | sup T `=p^(−1/2)`: m=1 fails, m=2 gives `|p|` | pinned |
| `powerBounded_iff`/`topologicallyNilpotent_iff` | `ℚ_p⟨T⟩`: T, T/p, pT | sup 1, p, 1/p: p.b. yes/no; t.n. only pT | pinned |
| `banachFunctionAlgebra` | `K⟨T⟩/(T²)`; `K×K` max norm | `‖T‖=1`, sup 0 (`IsReduced` needed); C=1 | true, not pinned (keep) |
| `mem_iff_…_of_isReduced` | `ℤ_p⟨T⟩`, ϖ=p; `ℚ_p⟨T,S⟩/(S²−p²T)` | `𝔽_p[T]` reduced gives B=A°; image B: S nilpotent mod p, `S/p∉B`, `(S/p)²=T` | pinned |
| `integral_iff_…` | 0; same quadratic; `K⟨T⟩/(T²)` | `{0}`; `S/p` root of `X²−T`, sup 1; `cT` nilpotent, sup 0 | pinned |
| `exists_fg_smul_le_…` | ℂ_p, `𝒪`, N=𝔪, ε=½ | `N'=x𝒪`, ½<\|x\|<1, `c𝔪⊆x𝒪` for \|c\|≤½; ε=1 would force 𝔪 f.g. | true; Part III's (R02) |
| `isNoetherian_…_discrete` | ℚ_p (ρ=1/p); ℂ_p | quotient of `ℤ_p⟨X⟩`; hypothesis fails for ℂ_p | true; Part III's |
| `IsSlopeLE` | `X−c`, 0<\|c\|<1, r=1; `1−cT`; Q=0 | root c fails; root `1/c`, `\|1/c\|>1`, passes; root 0, norm 0<r, fails | sound; duplicate |
| `IsSlopeDecomposition`/`exists_projection` | `c·id`, \|c\|=r; U=0; M=0 | M₁=M via `X−c`; M₁=0 since unit `Q(0)` kills it; trivial | duplicate; projector unpacks def |
| §1.3 field extension | `A=K⟨T⟩`, `M=A/(T)` | `L⟨T⟩/(T)=L=K⊗̂L` | matches Conrad L.1.1.5(1) |
| §2.1 monic bound | `f²−p=0` | bound `|p|^(1/2)=p^(−1/2)` attained; exponent 1 gives `p^(−1)` (false) | Check correct |
| §2.2 annulus | `XY=c` | \|x\|∈[\|c\|,1]; sup X=1, XY=\|c\| ≠ 1·1 | Check correct |
| §2.3 non-example | `ℚ_p⟨T,S⟩/(S²−p²T)` | `S=p·g` would need g₁=1/p, so `S/p∉B` | Check correct |
| §6.1 cover | closed disc = open disc ∪ circle | gluing 0,1 contradicts identity principle | Check correct |
| §7.1 `h(Σaₙ Tⁿ)=Σaₙϖⁿ Tⁿ` | truncation N | `‖h−h_N‖≤|ϖ|^N`; `(1−ϖⁿ)` unit for n≥1, image `TK⟨T⟩`, coker K; `f=e=id_K` gives 0 | Checks correct; matches KiehlE Def 1.1, Satz 1.2, L.1.3, Satz 1.4 |
| §7.2 convention | r=\|p\|^h | `\|λ\|≥\|p\|^h ⟺ v(λ)≤h`; roots of Urban's `Q*` | consistent |
| §7.5 filtration | a=0; a=1; id of Sp A | `R₀=M`, `Rₙ=0` (d=0 or 1); `Rₙ=M`; `Rₙ=aⁿM` | matches KiehlE Thm 3.4 |
| §8.2 | `L_A` | same definition as HuberCV line 766; density HuberCV Cor 4.2 | sound |

**Sampled locators verified against the text:**
- §1.2/§1.3: Conrad lines 274 (L.1.1.5), 570 (L.2.1.5), 156 (Thm 1.1.1), 201 (Thm 1.1.3).
- §2.3: KiehlE line 878 (Satz 5.1, p. 212), matching the Lean statement including the quotient-of-`V⟨X⟩` case and the discrete case (line 863).
- §7.1: KiehlE lines 315, 328, 333, 372; Bosch §§6.3–6.4 (published LNM 2105 numbering, as the README claims; Bosch lines 4859–5518).
- §7.4: KiehlE line 747 (Satz 3.5, subdomain base change).
- §7.5: KiehlE line 647 (Thm 3.4).
- §7.3: KiehlAB lines 601 and 615.
- §8.2: HuberCV lines 775 and 818.
- §2.3: FK line 10032.
- §7.2: Urban lines 869–903.

**Pinned declarations opened.** All those named in R03–R06, plus:
- Mathlib `Ideal.exists_pow_inf_eq_pow_smul` (`RingTheory/Filtration.lean:389`) and `Submodule.projectionOnto` (`LinearAlgebra/Projection.lean:125`);
- Tau Ceti `MvPowerSeries.norm_eq_gaussNorm` (`TateAlgebra/Basic.lean:216`), `Huber.powerBoundedSubring` and `topologicallyNilpotentIdeal` (`Huber/PowerBounded.lean:456, 598`), `MvPowerSeries.isNoetherianRing_isRestricted_subring` (`TateAlgebra/Groebner.lean:427`), `finite_quotient_of_surjective` (`TateAlgebra/Nullstellensatz.lean:135`), `IsAffinoidAlgebra.supSeminorm_le_norm`, `isUniversallyCatenary`.

**Cross-roadmap citations resolved.**
- RestrictedPowerSeries §§0.1, 1.1, 2.1, 2.4, 3.3, Layer 4, 5.1–5.4 (main).
- PadicFunctionalAnalysis §§0.4, 1.2, 1.4, 2.1, 2.2, 2.4 (this head).
- CompactOperators §0.1 (`IsCompletelyContinuous`), §§3.1, 3.4, 4.3 (main).
- SchemeAndStackFoundations §§0.20, 0.21 (this head).
- AdicSpaces §3.1 and Layers 1–5 (Completed).
- AdicSpacesPartII R0.3, R0.4, R0.9, R1.7, R1.9 (main).
- AdicSpacesPartIII R3.1, R3.3, R3.4, R3.6 slugs, R3.7 (main).
- AdicSpacesPartIV F1.1, R5.7 (main).
- LocallyAnalyticDistributions §4.16 (open head).
- No id of this roadmap is dropped. Ownership against open pull requests was checked by object for the slope interfaces (LocallyAnalyticDistributions, CompactOperators §4.3) and the rigid carriers (AdicSpacesPartII).

## Not verifiable

- **[BGR]** is recorded as uncertified (paywalled). Not read:
  - §0.2: 2.3.2/7, 3.5.1–3.5.3, 5.3.1/1, 4.1/3–4, 4.4/2
  - §1.4: 6.1.4–6.1.5, 7.2
  - §1.5: 6.1.5
  - §2.1: 3.8.1/7, 6.2.2/4
  - §2.2: 3.8, 3.8.3/7, 6.2.1–6.2.4
  - §2.3: 6.3.1/4–6, 6.3.4–6.3.5
  - §6.1: 9.1, 9.1.2, 9.1.3
  - the `Suggested.lean` docstrings: 3.7.3, 3.7.5, 6.1.1–6.1.5, 6.2.1–6.2.4, 6.3.4

  HuberCV line 761 and Conrad line 574 quote 6.1.2 Corollary 3 and 6.1.2/2 consistently with the README.
- **§8.4** gives no source locator, so there is nothing to check (R02).
- **[Huber-FR] Proposition 4.5** (§8.3) was not in the sample and was not read.

## Source issues

- **Gap** in KiehlE at Satz 5.1, p. 212: the source asserts that the case of a general V-subalgebra defining the topology reduces easily to quotients of `V⟨X⟩`, but does not prove it; it should either prove the reduction or state Satz 5.1 for quotients of `V⟨X⟩` only; affects nothing.
