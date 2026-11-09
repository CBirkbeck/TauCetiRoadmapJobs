# Review of RigidAnalyticGeometry (pull request #1808 at a96d197)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/RigidAnalyticGeometry/` is unchanged between c9403e2 and a96d197 (0 lines), and so is `lake-manifest.json`, so the pins are the same. I re-checked every finding of the previous review against this head, current main (28c3fca), the open heads and the pins. All fourteen still hold, and the gate still fails. They are restated below with the same numbers and the witnesses re-checked at this head.

## R01 (P1) — Supply cycle: §8.2 and §8.3 need AdicSpacesPartII R1.7, which says it is supplied by them

- **Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md`:
  - line 1033 (§8.2 *Needs:*): "AdicSpacesPartII R1.7"
  - line 1057 (§8.3 *Needs:*): "AdicSpacesPartII R1.7; [Huber-FR] §4."
  - line 1096 (Layer 8 Dependencies)
- **Claim.** §§8.2–8.3 consume Part II R1.7.
- **Witness.** `TauCetiRoadmap/AdicSpacesPartII/README.md` on main:
  - R1.7 starts at line 9806;
  - line 9819 says it is "Supplied by RigidAnalyticGeometry";
  - its *Needs:* (lines 9849–9853) list *classical-points-constructible-density* (RigidAnalyticGeometry §8.2).

  That is a two-node cycle. The depcheck does not test roadmaps that are both on main.
- **Repair.**
  - Delete "AdicSpacesPartII R1.7" from the §8.2 and §8.3 *Needs:* lines, from both Sources lines and from the Layer 8 Dependencies.
  - Cite the pinned classical-point map instead: `TauCeti.ValuationSpectrum.maximalSpectrumToSpa` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237`), with injectivity from `eq_maximalSpectrumToSpa_iff` (line 261).
  - To make the whole Part II relation one-way, also replace the other Part II citations with pinned declarations:
    - for "R0.3" (lines 321, 341, 389): `TauCeti.Huber.CompletedTensor` (`RingTheory/Huber/TensorProduct/Completion.lean:73`);
    - for "R0.4" (lines 469, 544): `TauCeti.IsAffinoidAlgebra.supSeminorm_eq_smoothingFun` (`RingTheory/Affinoid/SpectralRadius.lean:140`).

## R02 (P2) — Two-way supply with AdicSpacesPartIII, and Part III's theorems planned again in Layer 7 and §8.4

- **Location.** README line 46 (supplier-table row "AdicSpacesPartIII R3.1–R3.7"). Line 920 (§7.4): "*Needs:* AdicSpacesPartIII R3.6; §6.3 (Kiehl properness); §7.1 (Banach prerequisites)". Also lines 518, 544, 824, 897, 970 and 1081, and `Suggested.lean` docstring lines 20–21.
- **Claim.** Part III supplies §§1.3, 2.3, 7.1, 7.3, 7.4 and 8.4.
- **Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main:
  - line 112 lists "RigidAnalyticGeometry (roadmap on main) Layers 1–8" among its dependencies;
  - R3.6's *Needs:* (line 11042) is "RigidAnalyticGeometry §7.5";
  - in this README, §7.5 needs §7.4, and §7.4 needs R3.6.
- **Repair.** This roadmap supplies Part III, so it cites nothing from it.
  1. Delete the Part III restatements (§7.1 items 1–4, the quasi-Stein paragraph of §7.3, §7.4, §8.4) and replace them with one Scope sentence naming AdicSpacesPartIII R3.1–R3.7.
  2. Move §7.5 to R3.6, which already states it as *proper-cohomology-adic-completion*. Add the line "§7.5 → AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*".
  3. In §2.3, delete the almost-noetherian contract. Part III line 11176 owns it as `IntegralAffinoidPresentation.almost_noetherian` and `.fg_of_discrete`.
  4. In §1.3, own the complete field extension here: Conrad line 274, Lemma 1.1.5(1), p. 6.
  5. Remove Kiehl finiteness, Theorem B and proper GAGA from the docstring's list of this roadmap's headlines.

## R03 (P2) — `Suggested.lean` redefines objects that Tau Ceti already has at the pin

- **Location.** `Suggested.lean`:
  - line 67 `def IsAffinoidAlgebra`
  - line 148 `def pointNorm`
  - line 155 `def supSeminorm`
  - line 231 `def IsPresentationRing`
  - line 274 `def IsSlopeLE`
  - line 283 `def IsSlopeDecomposition`
- **Witness.** Each is already defined at the pin:
  - `TauCeti.IsAffinoidAlgebra` (`RingTheory/Affinoid/Basic.lean:30`)
  - `TauCeti.pointNorm` and `TauCeti.supSeminorm` (`RingTheory/Affinoid/SupSeminorm.lean:96, 103`)
  - `Polynomial.IsSlopeLE` (`Analysis/Normed/Unbundled/Slope.lean:64`)
  - `ContinuousLinearMap.IsSlopeDecomposition` (`Analysis/Normed/Operator/SlopeDecomposition.lean:51`)

  LocallyAnalyticDistributions (open head, README lines 253 and 860–862) consumes this file's copies by name.
- **Repair.**
  - Import the `TauCeti.RingTheory.Affinoid.*` modules and `TauCeti.Analysis.Normed.Operator.SlopeDecomposition`.
  - Delete the six definitions, and `IsStrictRadius` (line 71) with them.
  - State the remaining headlines on the pinned carriers. `integralClosure_finite` becomes `TauCeti.Ring.IsJapanese (TateAlgebra K n)` (`RingTheory/Japanese.lean:125`).
  - Cite the pinned names in §7.2 and in Downstream consumers.

## R04 (P2) — Four headlines that are statable at the pin are missing, and the docstring calls them not statable

- **Location.** `Suggested.lean` lines 18–26. For example: "classical Tate acyclicity and the sheaf property … (Layer 5): no `Sp A` with its rational basis and structure presheaf". Also: "excellence … no excellence predicate".
- **Witness.** Each of these carriers exists at the pin:
  - `TauCeti.AffinoidSubdomain.weakGTopology` (`AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`) and `.presheaf` (`Presheaf.lean:130`);
  - `TauCeti.Excellence.IsGRing` (`RingTheory/RegularLocalRing/GRing.lean:57`);
  - `TauCeti.rationalDomain`;
  - `maximalSpectrumToSpa`, used with `constructibleTopology`.

  None of the four theorems is proved at the pin.
- **Repair.** Add, with locators:
  - Tate acyclicity as `Presheaf.IsSheaf` of the weak G-topology (BGR 8.2.1; KiehlAB);
  - `IsGRing A` for affinoid `A` (Conrad lines 129–136);
  - Gerritzen–Grauert, stating that every affinoid subdomain is a finite union of rational domains (BGR 7.3.5);
  - constructible density of the classical points (HuberCV Corollary 4.2, line 818).

  Then rewrite the docstring list so that it names only `RigidSpace`, rigid analytification, the rigid–adic functor and J-2.

## R05 (P3) — Padding: eighteen sorried theorems are proved at the pin

- **Location.** `Suggested.lean` lines 79, 83, 88, 94, 100, 107, 121, 129, 158, 164, 171, 176, 182, 195, 200, 215, 236 and 297.
- **Witness.** On the pinned carriers, each closes with one `exact`. Examples:
  - `IsAffinoidAlgebra.exists_finite_injective` (`NoetherNormalization.lean:163`)
  - `isJacobsonRing` (`MaximalSpectrum.lean:53`)
  - `continuous_algHom` (`Continuity.lean:46`)
  - `isClosedEmbedding_of_finite_injective` (`FiniteMap.lean:61`)
  - `exists_pointNorm_eq_supSeminorm` (`MaximumModulus.lean:156`)

  The previous review's R05 has the full list.
- **Repair.** Delete them from `Suggested.lean`. The README keeps the statements and cites the pinned names.

## R06 (P3) — The README does not cite the pinned affinoid library, and plans it again as open targets

- **Location.** README lines 118–130 ("Existing library interfaces") name only the Tate-algebra basics and end with "Missing results are required in Tau Ceti in these interfaces." The targets of Layers 1–4, §6.1 and §7.2 are written as open work.
- **Witness.** The following are pinned:
  - `ContractiveRenorming.lean:60`
  - `Restricted.lean:73, 171`
  - `RationalFraction.lean:326`
  - `Subdomain/Flat.lean:62, 89`
  - `Subdomain/Cover.lean:59`
  - `Reduction.lean:127–382`
  - `SpectralRadius.lean:107`
  - `Slope.lean:83, 98`
  - `TauCeti/Topology/GTopology/*`
- **Repair.** Add a "From Tau Ceti" contract that lists these declarations with their files. Say in Scope that they are already in the library, and delete the targets they discharge.

## R07 (P3) — Gate: `letI` in theorem signatures

- **Location.** `Suggested.lean` line 90 (`exists_finite_injective`) and line 133 (`isClosedEmbedding_of_finite_injective`).
- **Witness.** The gate's `statement-hygiene` check at this head reports both lines. Rule: no `letI`/`haveI` in a signature.
- **Repair.** Use `AlgHom.Finite`, as the pinned statements do. Both theorems are deleted under R05 anyway.

## R08 (P3) — Gate: edits outside the pull request's folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`, one line each.
- **Witness.** `git diff --stat origin/main...HEAD` without the fifteen folders this pull request declares lists exactly these two files. The gate's `outside-folder` check reports them.
- **Repair.** Revert both one-line edits, or move them to a pull request that owns those folders.

## R09 (P3) — A conflicting open revision, with no stated order

- **Location.** The merge-order paragraph of the pull request description: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**."
- **Witness.** The overlap index of 2026-11-09: "#1808 and #1854 conflict in … `TauCetiRoadmap/RigidAnalyticGeometry/README.md`, `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`". #1854 is open at 30817b1.
- **Repair.** State in that paragraph which of #1808 and #1854 is rebased on the other.

## R10 (P3) — Locators that do not support the statement as written

1. **§7.5, line 940.** It cites "[Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7". The formal-functions isomorphism is KiehlE line 809, Theorem 3.7, p. 210. **Repair:** cite that theorem.
2. **§7.3, line 895.** It cites "[Conrad] §§1–2". **Repair:** cite KiehlAB line 601 (Def. 2.3), line 615 (Satz 2.4) and Conrad line 554 (Lemma 2.1.4, p. 12).
3. **§7.2 and `Suggested.lean` lines 273, 279.** They cite "[Urban] 2.3.1". Urban line 869 defines slope decompositions over a finite L/ℚ_p only. **Repair:** say the affinoid version is this roadmap's extension. Also, the 2.3.2–2.3.3 cited for the projector are functoriality and uniqueness (lines 883, 900).
4. **§2.3, line 511, and `Suggested.lean` line 211.** They cite FK B.1.3(1), but FK line 10032 does not contain the reduced-quotient criterion. **Repair:** cite it for the boundedness step only.
5. **§6.3, lines 736–742.** Kiehl properness is defined "over each admissible affinoid of the base", but KiehlE line 500 (Def. 2.3, p. 202) asks for some admissible affinoid covering. **Repair:** define it as the source does, or cite the theorem that the two agree.

## R11 (P3) — RestrictedPowerSeries cited for statements it does not make

- **Location.** README lines 164–166: "RestrictedPowerSeries §§2.4 and 5 (Gauss norm, polynomial density, reduction, evaluation, …". Lines 248–249: "RestrictedPowerSeries Layer 4 (restricted series over Banach rings, `A⟨X⟩`)".
- **Witness.** `TauCetiRoadmap/RestrictedPowerSeries/README.md` on main:
  - Gauss norm and density are §1.1 (line 247), evaluation §2.1 (306) and reduction §3.3 (424);
  - §2.4 is "Identity and maximum principles" (364);
  - Layer 4 is "Weierstrass theory over Banach rings" (452).
- **Repair.** Cite §§1.1, 2.1, 2.4, 3.3, Layer 4 and §5 item by item, and add §§1.1, 2.1 and 3.3 to the supplier-table row.

## R12 (P3) — Backticked names of this roadmap's own that nothing declares

- **Location.** README lines 49–50, 698, 805, 825 and 1129–1130: `Sp`, `RigidSpace`, `RigidSpace K`, `rigidToAdic`.
- **Witness.** None of them is declared in `Suggested.lean` or in the pinned Tau Ceti.
- **Repair.** Write them in prose or in italics, for example "the rigid category of §6.2" or "the functor r of §8.3".

## R13 (P3) — §7.3's classical identity principle has no Checks

- **Location.** README lines 882–886: "On a connected normal rigid space, any nonempty admissible open is analytically Zariski dense."
- **Repair.** Add these Checks:
  - on `Sp K⟨T⟩`, a function that vanishes on `|T|≤|ϖ|` is zero;
  - on `Sp K⟨x,y⟩/(xy)`, `x` vanishes on `|y|≥|ϖ|` without being zero, so normality is needed;
  - on `Sp(K×K)`, `(1,0)` vanishes on one component, so connectedness is needed;
  - `K⟨T⟩/(T)` restricts to zero on `|T|≥|ϖ|`, so the statement fails for coherent sheaves.

## R14 (P3) — Reference link mislabelled

- **Location.** README line 1153: "[Author text](https://www.math.purdue.edu/~tongliu/seminar/rigid/Bosch.pdf)".
- **Witness.** Bosch lines 5 and 40–47: this is the copyrighted Springer LNM 2105 volume hosted on a third party's seminar page, not an author text.
- **Repair.** Cite DOI 10.1007/978-3-319-04417-0.

## Previous findings

- R01 — not repaired: README line 1033, "AdicSpacesPartII R1.7", unchanged; AdicSpacesPartII line 9819 still says "Supplied by RigidAnalyticGeometry".
- R02 — not repaired: README line 920, "*Needs:* AdicSpacesPartIII R3.6; §6.3 (Kiehl properness)", unchanged; Part III R3.6 still needs §7.5.
- R03 — not repaired: `Suggested.lean` line 67 `def IsAffinoidAlgebra` and lines 148, 155, 231, 274, 283 unchanged.
- R04 — not repaired: `Suggested.lean` lines 18–26 still say "no `Sp A` with its rational basis and structure presheaf".
- R05 — not repaired: the eighteen sorried theorems at lines 79–297 are unchanged.
- R06 — not repaired: README lines 118–130 still end with "Missing results are required in Tau Ceti in these interfaces."
- R07 — not repaired: the gate still reports `letI` at `Suggested.lean` lines 90 and 133.
- R08 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still changed.
- R09 — not repaired: the merge-order paragraph still names only #1101 and #1807; #1854 still conflicts.
- R10 — not repaired: line 940 still has "[Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7"; lines 895, 511 and 736–742 are unchanged.
- R11 — not repaired: lines 164–166 still read "RestrictedPowerSeries §§2.4 and 5 (Gauss norm, polynomial density, reduction, evaluation".
- R12 — not repaired: lines 49–50 still have "`Sp`, … `RigidSpace`, rigid analytification and `rigidToAdic`".
- R13 — not repaired: lines 882–886 still have no Checks.
- R14 — not repaired: line 1153 still has "[Author text](https://www.math.purdue.edu/~tongliu/seminar/rigid/Bosch.pdf)".

## Verified sound

**Scope of this round.**
- `git diff c9403e2 a96d197` is empty for `TauCetiRoadmap/RigidAnalyticGeometry/` and for `lake-manifest.json`. There are no changed passages, so no statement needed a new review and the seeded sample has no target inside a change.
- The two commits since c9403e2 touch only BordismFormalGroups and LocalPurity. This roadmap neither cites them nor is cited by them for any changed id.

**Gate and build.**
- Ran `lake env lean` on `Suggested.lean`: exit 0, 22 warnings, all `declaration uses sorry`.
- Re-ran the full gate:
  - `statement-hygiene=2` (lines 90, 133);
  - `outside-folder`: the raw list has 28 entries; without the pull request's own folders, 2 remain (R08);
  - all other counters are 0;
  - result: FAIL.
- Compared the 9 binders flagged in the signature listing. All are on `def`/`abbrev`s that do not need `[CompleteSpace K]`/`[IsUltrametricDist K]`:
  - `weightedTate`, `TateAlgebra`, `IsAffinoidAlgebra`, `IsStrictRadius`, `pointNorm`, `supSeminorm`, `IsPresentationRing`, `IsSlopeLE`, `IsSlopeDecomposition`.

  The pinned counterparts do not carry those binders either. All 22 theorems keep `[CompleteSpace K]`.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2330 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. R01 and R02 are mutual citations between roadmaps on main, which the tool does not test.

**Witnesses re-checked at this head.**
- On main:
  - AdicSpacesPartII lines 9806, 9819 and 9849–9853;
  - AdicSpacesPartIII lines 112, 604, 11042 and 11176;
  - RestrictedPowerSeries section headings at lines 247, 306, 364, 424 and 452.
- At the open head of LocallyAnalyticDistributions: README lines 253, 860–862 and 3110.
- The open-PR index for #1807 (62d686c) and #1854 (30817b1).

**Pinned declarations re-opened.** All under `TauCeti/`:
- `RingTheory/Affinoid/Basic.lean:30`
- `RingTheory/Affinoid/SupSeminorm.lean:96, 103`
- `Analysis/Normed/Unbundled/Slope.lean:64`
- `Analysis/Normed/Operator/SlopeDecomposition.lean:51`
- `RingTheory/Affinoid/NoetherNormalization.lean:163`
- `RingTheory/Affinoid/MaximalSpectrum.lean:53`
- `RingTheory/Affinoid/Continuity.lean:46`
- `RingTheory/Affinoid/FiniteMap.lean:61`
- `RingTheory/Affinoid/MaximumModulus.lean:156`
- `AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237, 261`
- `AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`
- `AlgebraicGeometry/Rigid/Affinoid/Presheaf.lean:130`
- `RingTheory/RegularLocalRing/GRing.lean:57`
- `RingTheory/Huber/TensorProduct/Completion.lean:73`
- `RingTheory/Japanese.lean:125`

**Adversarial table.** No statement changed, so every row is carried forward from the previous review (PRREVIEW-RigidAnalyticGeometry_r37, at c9403e2), with its computed values. "Pinned" means proved at the pin (R05).

| Statement | Instances | Values computed | Result (carried from r37) |
|---|---|---|---|
| `IsAffinoidAlgebra` | 0; `K`; `K⟨T⟩/(T²)` | `T₀→0`, `T₀=K`, the quotient map is surjective in each case | true; duplicate (R03) |
| `IsStrictRadius` | `p^(−1/2)` over ℚ_p; `r=0` | `(p^(−1/2))²=|p|` with m=2; `0<r` excludes 0 | true |
| `integralClosure_finite` | n=0; `Frac T₁(√T)`; char p, `T^(1/p)` | closure is `L`; `K⟨S⟩` with S²=T, rank 2; `K⟨T^(1/p)⟩`, rank p | true; restate as `IsJapanese` |
| `exists_finite_injective` | 0; cusp; `K×K` | no injective `T_d→0` (hypothesis needed); cusp is free on 1, Y over `K⟨X⟩`; `K→K×K` is finite with d=0 | true; pinned |
| `finite_residue` | `ℚ_p⟨T⟩/(T²−p)` | residue field `ℚ_p(√p)`, dimension 2 | pinned |
| `height_eq_…_of_isDomain` | `K`; `K⟨T⟩×K` | height 0 = dim 0; ht(`K⟨T⟩×0`) = 0 ≠ dim 1, so the domain hypothesis is needed | pinned |
| `weightedTate_isAffinoid_iff` | n=0; ρ=`p^(−1/2)` | both sides true; `S↦T²/p` has weighted norm 1; coefficients `|a_{2k}|p^(−k)→0` | pinned |
| `continuous_algHom_…` | `K×K` | `⋂ₙ(K×0)ⁿ = K×0 ≠ 0`; closed graph | pinned |
| `isClosedEmbedding_…` | `K⟨T⟩→K⟨T/ϖ⟩` | injective with dense, non-closed image; not finite, so finiteness is needed | pinned |
| `pointNorm`/`supSeminorm` | 0; `K×K` at `(a,b)` | `⨆∅=0`; the points give `|b|` and `|a|`, so the sup is the max | duplicate (R03) |
| `supSeminorm_pow` | n=0 on 0; ℚ_p(√p) with n=2 | LHS 0 vs RHS 1 (`hn` needed); `p^(−1)=|p|` | pinned |
| `supSeminorm_eq_zero_iff` | `K⟨T⟩/(T²)` | `T` is nilpotent with sup 0 | pinned |
| `exists_uniform_valueGroup_exponent` | `ℚ_p⟨T⟩/(T²−p)` | sup of T is `p^(−1/2)`; m=1 fails, m=2 gives `|p|` | pinned |
| `powerBounded_iff`/`topologicallyNilpotent_iff` | in `ℚ_p⟨T⟩`: T, T/p, pT | sups 1, p, 1/p; power-bounded yes/no/yes; topologically nilpotent only pT | pinned |
| `banachFunctionAlgebra` | `K⟨T⟩/(T²)`; `K×K` with max norm | `‖T‖=1` but sup 0 (`IsReduced` needed); C=1 | true; not pinned (keep) |
| `mem_iff_…_of_isReduced` | `ℤ_p⟨T⟩` with ϖ=p; `ℚ_p⟨T,S⟩/(S²−p²T)` | `𝔽_p[T]` is reduced, so B=A°; `S/p∉B` but `(S/p)²=T` | pinned |
| `integral_iff_…` | 0; the same quadratic; `K⟨T⟩/(T²)` | `{0}`; `S/p` is a root of `X²−T` with sup 1; `cT` nilpotent with sup 0 | pinned |
| `exists_fg_smul_le_…` | ℂ_p, `𝒪`, N=𝔪, ε=½ | `N'=x𝒪` with ½<\|x\|<1; ε=1 would force 𝔪 finitely generated | true; Part III's (R02) |
| `isNoetherian_…_discrete` | ℚ_p; ℂ_p | quotient of `ℤ_p⟨X⟩`; the hypothesis fails for ℂ_p | true; Part III's |
| `IsSlopeLE` | `X−c` with 0<\|c\|<1, r=1; `1−cT`; Q=0 | root c fails; root `1/c` passes; root 0 fails | sound; duplicate |
| `IsSlopeDecomposition`/`exists_projection` | `c·id` with \|c\|=r; U=0; M=0 | M₁=M via `X−c`; M₁=0; trivial | duplicate; the projector unpacks the definition |
| §1.3 field extension | `A=K⟨T⟩`, `M=A/(T)` | `L⟨T⟩/(T) = L = K⊗̂L` | matches Conrad Lemma 1.1.5(1) |
| §2.1 monic bound | `f²−p=0` | bound `p^(−1/2)` attained; exponent 1 would give `p^(−1)` | Check correct |
| §2.2 annulus | `XY=c` | sup X = 1, sup XY = \|c\| ≠ 1·1 | Check correct |
| §6.1 cover | closed disc = open disc ∪ circle | gluing 0 and 1 contradicts the identity principle | Check correct |
| §7.1 `h(Σaₙ Tⁿ)=Σaₙϖⁿ Tⁿ` | truncation at N | `‖h−h_N‖≤|ϖ|^N`; cokernel K | Checks correct |
| §7.2 convention | r=\|p\|^h | `\|λ\|≥\|p\|^h ⟺ v(λ)≤h` | consistent |
| §7.5 filtration | a=0; a=1; id of Sp A | `R₀=M`, `Rₙ=0`; `Rₙ=M`; `Rₙ=aⁿM` | matches KiehlE Theorem 3.4 |
| §8.2 | `L_A` | same definition as HuberCV line 766 | sound |

**Cross-roadmap citations.** The citation resolver finds no unresolved citation or Lean name. The overlap report lists no id this README cites that an open pull request drops, no id that only an open revision defines, and no dropped id of this roadmap.

**Ownership against open pull requests.** By object, for the slope interfaces (LocallyAnalyticDistributions at its open head; CompactOperators §4.3 on main) and the rigid carriers (AdicSpacesPartII). The R03 duplicates are with the pinned Tau Ceti, not with another roadmap.

**Remark on untouched text.** None beyond the carried findings.

## Not verifiable

- **[BGR]** is recorded as uncertified (paywalled) and was not read. The previous report lists its locators for §§0.2, 1.4, 1.5, 2.1, 2.2, 2.3, 6.1 and the `Suggested.lean` docstrings.
- **§8.4 (Proper GAGA)**, a seeded target, gives no source locator, so there is nothing to check (R02).
- **[Huber-FR] Proposition 4.5** (§8.3, a seeded target) was not read in this incremental round: the passage is unchanged and the previous review did not read it either.

## Source issues

- none
