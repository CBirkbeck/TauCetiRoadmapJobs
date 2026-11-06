# Review of RigidAnalyticGeometry (pull request #1807 at e752fe8)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `4f06ba2`: `git diff 4f06ba2..e752fe8 -- TauCetiRoadmap/RigidAnalyticGeometry` is empty, `lake-manifest.json` is unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), and the pull request's changes since then are in `TauCetiRoadmap/BordismFormalGroups/` and `TauCetiRoadmap/ClassifyingSpaces/`, neither of which mentions this roadmap or anything it consumes. So nothing the previous review found is repaired; each witness was re-checked at this head rather than remembered. Three of the four previous findings stand (R01–R03 below). The fourth (the Japanese-ring name) is withdrawn: its witness was wrong, the pinned class is `TauCeti.Ring.IsJapanese`, which the README's `Ring.IsJapanese` names by suffix. Since the previous review the manifest `sources.toml` has gained certified entries `Temkin` (Corollary 4.5, author-page copy) and `Lutkebohmert` (Corollary 3.2, GDZ), so R02's repair now has exact locators.

## R01 (P2) — `Suggested.lean` restates theorems the pinned Tau Ceti proves, and states the rest on private copies of native carriers

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 10–25 (docstring: "states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`"), the nine definitions at lines 47–63, 115–122, 209, 252–270, and the twenty sorried theorems; `README.md` lines 110–123 ("Existing library interfaces").

Claim: the twenty theorems are headline theorems the finished roadmap will prove, and the nine definitions are the simple definitions needed to state them.

Witness, re-run at this head: the pinned Tau Ceti `2fd255d9` has `TauCeti/RingTheory/Affinoid/` (29 files), `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean`, `TauCeti/Analysis/Normed/Unbundled/Slope.lean`, `TauCeti/Topology/GTopology/` and `TauCeti/AlgebraicGeometry/Rigid/Affinoid/`. `TauCeti.IsAffinoidAlgebra` (`Affinoid/Basic.lean:30`), `TauCeti.pointNorm` and `TauCeti.supSeminorm` (`Affinoid/SupSeminorm.lean:96,103`), `Polynomial.IsSlopeLE` (`Unbundled/Slope.lean:64`) and `ContinuousLinearMap.IsSlopeDecomposition` (`SlopeDecomposition.lean:51`) have the bodies of the roadmap's `IsAffinoidAlgebra`, `pointNorm`, `supSeminorm`, `IsSlopeLE` and `IsSlopeDecomposition`. A scratch copy of `Suggested.lean` importing `TauCeti.RingTheory.Affinoid.{PowerBounded, FiniteQuotient, MaximalSpectrum, NoetherNormalization, KrullDimension, MaximumModulus, ValueGroup, FiniteMap}`, with three conversion helpers (`unfold IsAffinoidAlgebra` into `TauCeti.isAffinoidAlgebra_iff`; `pointNorm` into `TauCeti.pointNorm_eq_spectralNorm` along `Ideal.Quotient.mkₐ`; `supSeminorm` into `TauCeti.supSeminorm_eq_iSup`), closes twelve of the twenty theorems with one native theorem each, elaborated with `lake env lean` with no error:

| Roadmap theorem | Native theorem at the pin (`TauCeti/RingTheory/Affinoid/`) |
| --- | --- |
| `isNoetherianRing` | `IsAffinoidAlgebra.isNoetherianRing` (`FiniteQuotient.lean:43`) |
| `isJacobsonRing` | `IsAffinoidAlgebra.isJacobsonRing` (`MaximalSpectrum.lean:53`) |
| `finite_residue` | `IsAffinoidAlgebra.finite_quotient_of_isMaximal` (`MaximalSpectrum.lean:46`) |
| `height_eq_ringKrullDim_of_isDomain` | `IsAffinoidAlgebra.height_eq_ringKrullDim_of_isDomain` (`KrullDimension.lean:97`) |
| `bddAbove_pointNorm` | `IsAffinoidAlgebra.bddAbove_range_pointNorm` (`SupSeminorm.lean:302`) |
| `exists_pointNorm_eq_supSeminorm` | `IsAffinoidAlgebra.exists_pointNorm_eq_supSeminorm` (`MaximumModulus.lean:156`) |
| `supSeminorm_pow` | `IsAffinoidAlgebra.supSeminorm_pow` (`SupSeminorm.lean:360`) |
| `supSeminorm_eq_zero_iff` | `IsAffinoidAlgebra.supSeminorm_eq_zero_iff` (`SupSeminorm.lean:385`) |
| `exists_uniform_valueGroup_exponent` | `IsAffinoidAlgebra.exists_supSeminorm_pow_eq_norm` (`ValueGroup.lean:79`) |
| `powerBounded_iff` | `IsAffinoidAlgebra.isPowerBounded_iff_supSeminorm_le_one` (`PowerBounded.lean:169`) |
| `topologicallyNilpotent_iff` | `IsAffinoidAlgebra.isTopologicallyNilpotent_iff_supSeminorm_lt_one` (`PowerBounded.lean:197`) |
| `isClosedEmbedding_of_finite_injective` | `IsAffinoidAlgebra.isClosedEmbedding_of_finite_injective` (`FiniteMap.lean:61`, source noetherian via `isNoetherianRing`) |

The review at `4f06ba2` closed three more the same way up to unpacking (`exists_finite_injective` by `NoetherNormalization.lean:163`, `weightedTate_isAffinoid_iff` by `Polyradius.lean:68`, `integral_iff_supSeminorm_le_one` by `PowerBounded.lean:135`) and found two native by object with a convention change (`mem_iff_supSeminorm_le_one_of_isReduced` by `PowerBounded.lean:250`, `IsSlopeDecomposition.exists_projection` by `SlopeDecomposition.lean:89`); those declarations and the file are byte-identical now, so that stands. Only `banachFunctionAlgebra`, `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete` are absent at the pin (no `IsReduced` norm-equivalence theorem and no Kiehl Satz 5.1 under `TauCeti/`). The docstring's claim is therefore false for seventeen declarations, and the three true headlines are stated through private copies of `TauCeti.IsAffinoidAlgebra`, `TauCeti.supSeminorm` and the presentation ring, which the house rule on existing Tau Ceti APIs excludes.

Repair (unchanged from the previous review, re-tested on the scratch copy): import `TauCeti.RingTheory.Affinoid.PowerBounded`; delete the nine definitions and the seventeen theorems above; keep the three absent headlines on the native carriers (`TauCeti.IsAffinoidAlgebra K A`, `TauCeti.supSeminorm K f`, and `(Subring.unitClosedBall (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom` for the presentation ring); rewrite the docstring to say three headlines are stated and the Layer 1–2 and §7.2 theorems are Tau Ceti's at the pin. In the README, turn every backticked own name that leaves the file (lines 175–176, 192, 204, 209, 213, 283–284, 300–304, 333–334, 339–340, 344, 379–380, 392–394, 399, 613–614) into prose or the pinned name, and make "Existing library interfaces" (lines 110–123) and the `From Tau Ceti` contract name `TauCeti/RingTheory/Affinoid/`, `TauCeti/Topology/GTopology/`, `TauCeti/AlgebraicGeometry/Rigid/Affinoid/` and `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean` with what each supplies.

## R02 (P3) — §6.3's composition law for Kiehl-proper morphisms has no source among those the README cites

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 549–553, "Prove its local nature on the base, composition and base-change laws, and properness of finite morphisms … Sources: [Bosch] §6.3; [Kiehl-E] §2."; `## References` lines 894–927 (no Lütkebohmert, no Temkin).

Claim: [Bosch] §6.3 and [Kiehl-E] §2 support the composition law.

Witness: Bosch lines 4962–4968 say base change and fibre products are easy but composition of proper morphisms is difficult and refer to Lütkebohmert for discretely valued `K` and Temkin in general; Kiehl-E lines 505–512 list only products, finite base-field extension and finite morphisms. The statement is true: Lutkebohmert line 413, Corollary 3.2 (§3, journal p. 351), proves it over a complete discrete valuation ring (its standing hypothesis, line 109); Temkin lines 792–800, Corollary 4.5 (§4, preprint p. 18), identifies Kiehl properness with Berkovich properness for Hausdorff strictly analytic spaces over any `K`, and Corollary 4.6 (lines 806–815) gives the interior formula from which composition follows. Both texts are now in the manifest as certified entries `Temkin` and `Lutkebohmert`, but the README neither lists them under References nor cites them at the claim.

Repair: add to `## References` the entries **[Lütkebohmert]** W. Lütkebohmert, *Formal-algebraic and rigid-analytic geometry*, Math. Ann. 286 (1990), 341–371 (GDZ), and **[Temkin]** M. Temkin, *On local properties of non-Archimedean analytic spaces*, Math. Ann. 318 (2000), 585–607, doi:10.1007/s002080000123; and extend the §6.3 Sources line to "[Bosch] §6.3; [Kiehl-E] §2; [Lütkebohmert] Corollary 3.2 (discretely valued `K`); [Temkin] Corollaries 4.5–4.6 (general `K`, through the comparison with Berkovich properness)", saying in the sentence that the composition law is proved through that comparison, not from the inner-cover definition alone.

## R03 (P3) — Broken link to the AdicSpaces roadmap

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 33, "[AdicSpaces](../AdicSpaces/README.md)".

Claim: the AdicSpaces roadmap lives at `TauCetiRoadmap/AdicSpaces/`.

Witness: on main (`eaf17b10`) `TauCetiRoadmap/AdicSpaces/` does not exist; the roadmap is archived at `Completed/AdicSpaces/README.md`. Line 33 is the only link to it in the file.

Repair: write `[AdicSpaces](../../Completed/AdicSpaces/README.md)`.

## Previous findings

Folder unchanged since `4f06ba2`; each witness re-checked at this head and at the unchanged pin.

- R01 — not repaired: `Suggested.lean` still declares the nine definitions and twenty theorems; twelve closed by native theorems in a fresh probe at this head (R01 above).
- R02 — not repaired: lines 549–553 still cite only "[Bosch] §6.3; [Kiehl-E] §2"; the References list has no Lütkebohmert or Temkin entry (R02 above, now with locators).
- R03 — not repaired: line 33 still links `../AdicSpaces/README.md`, absent on main (R03 above).
- R04 — not repaired by an edit, and withdrawn: the witness was wrong. `TauCeti/RingTheory/Japanese.lean` opens `namespace TauCeti.Ring` (line 110) and declares `class IsJapanese` (line 125), so the pinned name is `TauCeti.Ring.IsJapanese`, which the README's `Ring.IsJapanese` (line 32) names by suffix, and SchemeAndStackFoundations §0.20 on main (line 1305) names it the same way. No change is needed; the gate's `readme-ids-missing` check agrees.

## Verified sound

**Change set.** `git diff --stat 4f06ba2..e752fe8 -- TauCetiRoadmap/RigidAnalyticGeometry` empty; `lake-manifest.json` and `lean-toolchain` unchanged; `git diff --stat origin/main...HEAD` excluding the thirteen folders the brief names as the pull request's own is empty; the pull request's diffs of `BordismFormalGroups/` and `ClassifyingSpaces/` since `4f06ba2` contain no occurrence of "RigidAnalytic" or "Affinoid".

**Gate at this head** (run from the worktree): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=17 source-material=0`; the 17 outside-folder files are in the pull request's own folders, which the brief lists as data, so they are not a finding; the worker's run of the same gate records `build=0`. Dependency check:

```
depcheck: 240 roadmaps, 2350 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean`: 20 `declaration uses sorry` warnings and nothing else. The worker's `#check @name` file for all 29 declarations elaborates; the 9 "dropped binder" leads are the defs and abbrevs that drop only `[CompleteSpace K]` or `[IsUltrametricDist K]`, which their bodies do not use (`weightedTate`, `TateAlgebra`, `IsAffinoidAlgebra`, `IsStrictRadius`, `pointNorm`, `supSeminorm`, `IsPresentationRing`, `IsSlopeLE`, `IsSlopeDecomposition`); every theorem keeps both. Each elaborated type matches its README statement as at `4f06ba2`. The native-lemma probe is R01's witness (12 closed, 0 errors).

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`): the twelve native theorems of the R01 table, `TauCeti.isAffinoidAlgebra_iff` (`Affinoid/Basic.lean:35`), `TauCeti.pointNorm_eq_spectralNorm` (`SupSeminorm.lean:129`), `TauCeti.supSeminorm_eq_iSup` (`SupSeminorm.lean:267`), `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm` (`Polyradius.lean:68`), `AlgHom.isIntegral_map_unitClosedBall_iff_supSeminorm_le_one` (`PowerBounded.lean:135`), `mem_iff_supSeminorm_le_one_of_isReduced_quotient` (`PowerBounded.lean:250`), `ContinuousLinearMap.IsSlopeDecomposition.exists_projection` (`SlopeDecomposition.lean:89`), `TauCeti.Ring.IsJapanese` (`Japanese.lean:110,125`). `grep` for `banachFunctionAlgebra`, `exists_fg_smul_le_of_presentation`, `isNoetherian_of_presentation_of_discrete` and "Satz 5.1" under `TauCeti/` is empty, so the three kept headlines remain absent at the pin.

**Cross-roadmap citations resolved on main `eaf17b10`** (all at the same lines as on `ffac5139`): AdicSpacesPartII R0.3 (1769), R0.4 (2270), R0.5 (2759; *completed-tensor-banach-module* 2789), R0.9 (4071), R1.1 (8427), R1.7 (9806); AdicSpacesPartIII R3.1–R3.6 (9136, 9594, 9870, 10053, 10179, 10472), *surjection-small-perturbation* (9884), supplier rows 599–609 for *completely-continuous-finite-cokernel*, *proper-cohomology-adic-completion* and *proper-gaga*; AdicSpacesPartIV R5.7 (2165), F1.1 (2998), 46 citations of this roadmap; RestrictedPowerSeries §2.4 (364), Layers 4–6 (452–608), §5.4 (587); PadicFunctionalAnalysis Layers 0–2 (190–384), §1.2 (343), §2.2 (400), §2.4 (457), and the pull request's own PadicFunctionalAnalysis diff touches only lines 915–1053, outside what this roadmap consumes; CompactOperators Layers 0–3 (149–613), §3.1 (615); SchemeAndStackFoundations §0.20 (1302), §0.21 (1394), both unchanged by the pull request's SchemeAndStackFoundations diff. The supplier table (lines 27–34) names only roadmaps on main; LocallyAnalyticDistributions appears only under Downstream consumers.

**Sources at their locators**, incremental: the seeded sample falls in no changed passage, so the locator checks of the review at `4f06ba2` stand; re-opened at this head: Kiehl-E Satz 5.1 (line 878), Huber-FR Proposition 4.5 (line 1436), Urban 2.3.1 (line 869), Bosch Definition 8 and the composition remark (lines 4956–4968), Lutkebohmert Corollary 3.2 (line 413, standing DVR hypothesis line 109), Temkin Corollaries 4.4–4.6 (lines 773–815).

**Adversarial table.** No statement changed since `4f06ba2`; every row below is carried from that review, with its instances and values, re-read against the unchanged file.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsAffinoidAlgebra` | zero algebra; `K`; `K⟨T⟩/(T²)` | `0`: surjection from `T₀ = K`; `K`: `n = 0`; nilpotents kept | matches `TauCeti.IsAffinoidAlgebra` body (carried from the review at 4f06ba2, re-run in the probe) | R01 |
| `exists_finite_injective` | `A = 0`; cusp | `0`: no injection (excluded by `Nontrivial`); cusp finite over `K⟨X⟩`, `d = 1` | native (carried) | R01 |
| `height_eq_ringKrullDim_of_isDomain` | `K⟨T⟩×K`; `T² − p` | `K⟨T⟩×0` height 0 in dimension 1, excluded by `IsDomain`; `(T²−p)` height 1 = dim | native, Conrad 2.1.5 (carried) | R01 |
| `weightedTate_isAffinoid_iff` | `n = 0`; `ρ = p^(−1/2)`; `ρ ∉ p^ℚ` | vacuous both sides; `m = 2, c = p`; `|X|sup = ρ`, no power in `|K×|` | both directions, native (carried) | R01 |
| `IsStrictRadius` | `r = 1`, `p^(−1/2)`, `0` | `1 = ‖1‖`; `(p^(−1/2))² = ‖p‖`; `0` excluded | matches `√|K×|` (carried) | R01 |
| `supSeminorm_pow`, `_eq_zero_iff` | zero ring; `n = 0`; `K⟨T⟩/(T²)`, `f = T` | `0 = 0`; `|1|sup = 0 ≠ 1`, so `0 < n` needed and present; `|T|sup = 0`, `T² = 0` | holds, native (carried) | R01 |
| §2.1 Check `K×K` | `(1,0)`, `(0,1)` | `|(1,0)|sup = 1`, product `0`, `1·1 = 1` | submultiplicative only (carried) | none |
| §2.1 Check `ℚ_p⟨T⟩/(T²−p)` | one point | residue field `ℚ_p(√p)`, `|T|sup = p^(−1/2) ∉ |ℚ_p×|` | as stated (carried) | none |
| `exists_uniform_valueGroup_exponent` | `A = 0`; nilpotent `f`; `T² − p` | `m = 1, c = 0`; `c = 0`; `m = 2`, `c = p` | native, `1 ≤ m` is `0 < m` by `exact` (re-run) | R01 |
| `powerBounded_iff`, `topologicallyNilpotent_iff` | `p`, `T` in `ℚ_p⟨T⟩`; zero ring | `|p| < 1`, `pⁿ → 0`; `|T|sup = 1`, bounded, not `→ 0`; `0 ≤ 1`, `0 < 1` | native (re-run) | R01 |
| `banachFunctionAlgebra` | zero ring; `K⟨T⟩` | `C = 1`, `0 ≤ 0 ≤ 0`; `|f|sup = ‖f‖` | holds; absent at the pin (carried) | keep (R01) |
| `mem_iff_supSeminorm_le_one_of_isReduced` | zero ring; `ℤ_p ⊂ ℚ_p`, `ϖ = p`; `ϖ = p²`; `π(ℤ_p⟨T,S⟩) ⊂ ℚ_p⟨T,S⟩/(S²−p²T)` | `B = 0`, `ϖ = 0` unit, `0 ≤ 1`; `𝔽_p` reduced; `ℤ/p²` nonreduced, excluded; `S/p ∉ B`, `B/pB = 𝔽_p[T,S]/(S²)` nonreduced, excluded | holds; native with `IsLeftRegular` (carried) | R01 |
| `integral_iff_supSeminorm_le_one` | `T² − p`, `S = π(ℤ_p⟨T⟩)`, `a = T` | `T² = p ∈ S`; `|T|sup = p^(−1/2) ≤ 1` | native (carried) | R01 |
| `exists_fg_smul_le_of_presentation` | `N = 0`; `M = 𝒪_{ℂ_p}`, `N = 𝔪`, `ε < |x| < 1` | `N' = 0`; `N' = x𝒪`, `c𝔪 ⊆ x𝒪` for `|c| ≤ ε` | Kiehl Satz 5.1 line 881; absent at the pin (carried) | keep (R01) |
| `isNoetherian_of_presentation_of_discrete` | `ℚ_p`; `ℂ_p` | `ρ = |p|`; no `ρ < 1`, `𝒪_{ℂ_p}` not noetherian | hypothesis is discreteness (carried) | keep (R01) |
| `IsSlopeLE` | `Q = 0`; `Q = 1`; `X − c`, `|c| < 1 = r`; `1 − cT` | root `0`, fails; no roots, holds; `|c| < r`, fails; root `1/c`, `|1/c| > 1`, passes | matches §7.2 Checks and `Polynomial.IsSlopeLE` (carried) | R01 |
| §7.2 convention vs Urban 2.3.1 | `r = |p|^h`, monic annihilator | roots of `Q*` are eigenvalues `λ` with `v(λ) ≤ h` iff `|λ| ≥ r` | direction agrees (re-read at Urban line 869) | none |
| `IsSlopeDecomposition` wrong models | `M₁ = 0`; `c·id`, `|c| = r`; `|μ| < r` eigenvector in `M₁` | `Q = 1`; `Q = X − c`, constant term `−c` unit, `M₂ = 0`; annihilator root `μ` fails `IsSlopeLE` | summands determined, Urban 2.3.3 (carried) | R01 |
| `exists_projection` | `M₁ = 0`; `M₂ = 0` | `P = 0`; `P = id` | holds; native (carried) | R01 |
| §6.2–6.3 Checks | disc + circle; `|T|ⁿ ≤ |ϖ|`; unit disc in itself; finite affinoid | not admissible; radii `|ϖ|^(1/n) → 1`; `K⟨T⟩` not finite over `K`, not inner; rescaled generators, inner | as stated, Bosch Def. 6 (carried) | none |
| §6.3 composition law | discretely valued `K`; general `K` | Lütkebohmert Cor. 3.2 under a DVR; Temkin Cor. 4.5–4.6 in general; Bosch 4964–4968 defers to them | true, unsourced in the README (re-read) | R02 |
| §7.3 Checks | axes `XY = 0`; open disc; `ℙ¹` | `Y` vanishes on `X ≠ 0`, `Y ≠ 0`; `H¹(𝒪) = 0`, global ring not affinoid; `ℙ¹` quasi-compact, not affinoid | as stated (carried) | none |
| §7.4 nonflat Check | `F = I_P(−1)` on `ℙ¹_{K⟨t⟩}`, `t = 0` | `H⁰(F) = 0`; `F|fibre = 𝒪(−2) ⊕ k_P`, `H⁰ = K` | as stated (carried) | none |
| §7.5 shifts | `a = 0`; `a = 1`; degree 0 on `Sp A` | `R_0 = M`, `R_n = 0`; `R_n = M`; `R_n = aⁿM` | Kiehl-E Theorem 3.4 gives `d, e` (carried) | none |
| §8.2 Check | rank-two point below the Gauss point | `v(T) < 1`, `v(T)ⁿ > |ϖ|` all `n`; `L_A` per Huber-CV 766 | as stated (carried) | none |
| §8.3 | affinoid iff; two discs along the open disc | Huber-FR 4.5(v) (re-read at line 1436); non-quasi-separated, boundary points distinct | as stated | none |
| §0.1, §1.3 Checks | `p + T²`, `p + T + pT²`; `M = A`, `L = K`, `A/(T)` | Gauss norm 1 at `T = 1`, `|p|` at `0`; reduction `T`; both sides `A_L`, `A`, `L` | as stated, Conrad 1.1.5(1) (carried) | none |
| §0.2, §1.2 Japanese vocabulary | `TauCeti.Ring.IsJapanese` at the pin; SSF §0.20 line 1305 | README `Ring.IsJapanese` = suffix of the pinned name = SSF's name | consistent | none (R04 withdrawn) |

**Policy checks.** No `set_option`, no `lemma`, no `#eval`, no sorried data; no LaTeX, process words or pull-request numbers (gate counts all 0); `metadata.toml` is `math.AG`; the References cite legal hosts and DOIs.

## Not verifiable

- **[BGR]** (paywalled, recorded `uncertified`): every BGR locator is cited by locator only, as before.
- **[Lütkebohmert]**: read from the GDZ scan recognised by OCR; Theorem 3.1's statement (line 411) is garbled, Corollary 3.2 (line 413) is legible and was used.
- **[Temkin]**: read from the author's-page copy; preprint page numbers are given, not the journal's 585–607.
- **[Kiehl-E]**, **[Kiehl-AB]**: OCR of GDZ scans, as before.
- Ownership against open pull requests: unchanged since the review at `4f06ba2` (`roadmaps grep` for `IsAffinoidAlgebra`, `IsSlopeDecomposition`, `IsSlopeLE`, `supSeminorm` found declarations only in this folder); not re-run, since neither the folder nor its declared names changed.

## Source issues

- none
