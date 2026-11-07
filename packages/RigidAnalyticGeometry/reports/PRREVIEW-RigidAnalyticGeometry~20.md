# Review of RigidAnalyticGeometry (pull request #1807 at 7e8275c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `e752fe8`: `git diff e752fe8..7e8275c -- TauCetiRoadmap/RigidAnalyticGeometry` is empty and `Suggested.lean` has the same checksum at both heads; `lake-manifest.json` and `lean-toolchain` are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`); the folder's last commit is still `72ca89d2`. The pull request's changes since `e752fe8` are a merge of main and the AlgebraicCurves repairs, none of which mentions this roadmap or anything it consumes. So none of the three findings of the previous review is repaired, and each witness below was re-run at this head rather than remembered. One finding is new: the gate's `statement-hygiene` scanner now reports two `letI` signatures in `Suggested.lean`, so the gate fails at this head (R04); both signatures belong to theorems R01 deletes, so the R01 repair discharges R04 as well.

## R01 (P2) — `Suggested.lean` restates theorems the pinned Tau Ceti proves, and states the rest on private copies of native carriers

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 10–25 (docstring: "states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`"), the nine definitions at lines 47–63, 115–122, 209, 252–270, and the twenty sorried theorems; `README.md` lines 110–123 ("Existing library interfaces").

Claim: the twenty theorems are headline theorems the finished roadmap will prove, and the nine definitions are the simple definitions needed to state them.

Witness, re-checked at this head and the unchanged pin: `TauCeti/RingTheory/Affinoid/` (29 files) at Tau Ceti `2fd255d9` proves, with one native theorem each, `isNoetherianRing` (`FiniteQuotient.lean:43`), `isJacobsonRing` (`MaximalSpectrum.lean:53`), `finite_residue` (`MaximalSpectrum.lean:46`), `height_eq_ringKrullDim_of_isDomain` (`KrullDimension.lean:97`), `bddAbove_pointNorm` (`SupSeminorm.lean:302`), `exists_pointNorm_eq_supSeminorm` (`MaximumModulus.lean:156`), `supSeminorm_pow` (`SupSeminorm.lean:360`), `supSeminorm_eq_zero_iff` (`SupSeminorm.lean:385`), `exists_uniform_valueGroup_exponent` (`ValueGroup.lean:79`), `powerBounded_iff` (`PowerBounded.lean:169`), `topologicallyNilpotent_iff` (`PowerBounded.lean:197`), `isClosedEmbedding_of_finite_injective` (`FiniteMap.lean:61`, re-opened: `(hB : IsAffinoidAlgebra K B) (f : A →ₐ[K] B) (hfin : f.Finite) (hinj : Function.Injective f) : IsClosedEmbedding f`), `exists_finite_injective` (`NoetherNormalization.lean:163`, re-opened: `∃ (n : ℕ) (g : Tate (Fin n) →ₐ[K] A), Function.Injective g ∧ g.Finite`), `weightedTate_isAffinoid_iff` (`Polyradius.lean:68`), `integral_iff_supSeminorm_le_one` (`PowerBounded.lean:135`), `mem_iff_supSeminorm_le_one_of_isReduced` (`PowerBounded.lean:250`) and `IsSlopeDecomposition.exists_projection` (`SlopeDecomposition.lean:89`). The review at `e752fe8` closed twelve of these in a scratch copy with one native theorem each after three conversion helpers, elaborated with no error; the file and the pin are byte-identical now, so that probe stands. Only `banachFunctionAlgebra`, `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete` are absent at the pin (`grep` for those names and for "Satz 5.1" under `TauCeti/` is empty at this head). The docstring's claim is therefore false for seventeen declarations, and the three true headlines are stated through private copies of `TauCeti.IsAffinoidAlgebra`, `TauCeti.supSeminorm` and the presentation ring, which the house rule on existing Tau Ceti APIs excludes.

Repair (unchanged, tested on the scratch copy of the review at `e752fe8`): import `TauCeti.RingTheory.Affinoid.PowerBounded`; delete the nine definitions and the seventeen theorems above; keep the three absent headlines on the native carriers (`TauCeti.IsAffinoidAlgebra K A`, `TauCeti.supSeminorm K f`, and `(Subring.unitClosedBall (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom` for the presentation ring); rewrite the docstring to say three headlines are stated and the Layer 1–2 and §7.2 theorems are Tau Ceti's at the pin. In the README, turn every backticked own name that leaves the file (lines 175–176, 192, 204, 209, 213, 283–284, 300–304, 333–334, 339–340, 344, 379–380, 392–394, 399, 613–614) into prose or the pinned name, and make "Existing library interfaces" (lines 110–123) and the `From Tau Ceti` contract name `TauCeti/RingTheory/Affinoid/`, `TauCeti/Topology/GTopology/`, `TauCeti/AlgebraicGeometry/Rigid/Affinoid/` and `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean` with what each supplies.

## R02 (P3) — §6.3's composition law for Kiehl-proper morphisms has no source among those the README cites

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 549–553, "Prove its local nature on the base, composition and base-change laws, and properness of finite morphisms … Sources: [Bosch] §6.3; [Kiehl-E] §2."; `## References` lines 894–927 (no Lütkebohmert, no Temkin; `grep` for either name in the README is empty at this head).

Claim: [Bosch] §6.3 and [Kiehl-E] §2 support the composition law.

Witness: Bosch lines 4962–4968 say base change and fibre products are easy but composition of proper morphisms is difficult and refer to Lütkebohmert for discretely valued `K` and Temkin in general; Kiehl-E lines 505–512 list only products, finite base-field extension and finite morphisms. The statement is true: Lutkebohmert line 413, Corollary 3.2 (§3, journal p. 351), proves it over a complete discrete valuation ring (its standing hypothesis, line 109); Temkin lines 792–800, Corollary 4.5 (§4, preprint p. 18), identifies Kiehl properness with Berkovich properness for Hausdorff strictly analytic spaces over any `K`, and Corollary 4.6 (lines 806–815) gives the interior formula from which composition follows. Both texts are certified entries `Temkin` and `Lutkebohmert` of the manifest, but the README neither lists them under References nor cites them at the claim.

Repair: add to `## References` the entries **[Lütkebohmert]** W. Lütkebohmert, *Formal-algebraic and rigid-analytic geometry*, Math. Ann. 286 (1990), 341–371 (GDZ), and **[Temkin]** M. Temkin, *On local properties of non-Archimedean analytic spaces*, Math. Ann. 318 (2000), 585–607, doi:10.1007/s002080000123; and extend the §6.3 Sources line to "[Bosch] §6.3; [Kiehl-E] §2; [Lütkebohmert] Corollary 3.2 (discretely valued `K`); [Temkin] Corollaries 4.5–4.6 (general `K`, through the comparison with Berkovich properness)", saying in the sentence that the composition law is proved through that comparison, not from the inner-cover definition alone.

## R03 (P3) — Broken link to the AdicSpaces roadmap

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 33, "[AdicSpaces](../AdicSpaces/README.md)".

Claim: the AdicSpaces roadmap lives at `TauCetiRoadmap/AdicSpaces/`.

Witness: at this head `TauCetiRoadmap/AdicSpaces/` does not exist (`ls` fails) and `Completed/AdicSpaces/` does; main (`eaf17b10`) is the same. Line 33 is the only link to it in the file.

Repair: write `[AdicSpaces](../../Completed/AdicSpaces/README.md)`.

## R04 (P3) — Gate `statement-hygiene`: `letI` in two theorem signatures

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` line 84, "(letI := π.toRingHom.toAlgebra; Module.Finite (TateAlgebra K d) A)" in the conclusion of `exists_finite_injective`, and line 167, "(hfin : letI := φ.toRingHom.toAlgebra; Module.Finite A B)" in `isClosedEmbedding_of_finite_injective`.

Claim: the file passes the push gate.

Witness: the gate at this head, run by the worker and re-run from the worktree, reports `statement-hygiene=2 … FAIL` with exactly these two lines under the rule "no `letI`/`haveI` in a signature; P3; repair: use an instance binder or a named instance in the signature". No acceptance while the gate fails.

Repair: both theorems are native at the pin (R01), so the R01 repair deletes them and the hit with them. If either is kept, state finiteness as the pin does, with Mathlib's `AlgHom.Finite` (`Mathlib/RingTheory/Finiteness/Defs.lean:193`, which is by definition `letI := f.toAlgebra; Module.Finite`): write `π.Finite` for the conjunct at line 84 and `(hfin : φ.Finite)` at line 167. Tested: a scratch copy with those two substitutions elaborates with `lake env lean` to the same twenty `declaration uses sorry` warnings and no error.

## Previous findings

Folder byte-identical to `e752fe8`; each witness re-checked at this head and at the unchanged pin.

- R01 — not repaired: `Suggested.lean` still declares the nine definitions and twenty theorems, seventeen of them native at the pin; the three absent headlines still sit on private carriers (R01 above).
- R02 — not repaired: line 553 still reads "Sources: [Bosch] §6.3; [Kiehl-E] §2."; the References list has no Lütkebohmert or Temkin entry (R02 above).
- R03 — not repaired: line 33 still links `../AdicSpaces/README.md`, absent at this head and on main (R03 above).
- R04 of the review at `e752fe8` (the Japanese-ring name) was withdrawn there as a false witness (`TauCeti.Ring.IsJapanese`, `Japanese.lean:110,125`); nothing to repair, and it is not re-raised. This report's R04 is a new finding.

## Verified sound

**Change set.** `git diff --stat e752fe8..7e8275c -- TauCetiRoadmap/RigidAnalyticGeometry` empty, `Suggested.lean` checksum identical at both heads; `lake-manifest.json` and `lean-toolchain` unchanged against `e752fe8` and against main; `git diff --stat origin/main...HEAD` excluding the thirteen folders the brief names as the pull request's own is empty (the files `changes.md` lists outside the folder arrived by the merge of main, not as the pull request's own changes). The pull request's diffs of `AlgebraicCurves/` since `e752fe8` contain no occurrence of "RigidAnalytic" or "Affinoid".

**Gate at this head** (worker's run, and re-run from the worktree): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 source-material=0 build=0 FAIL`; the worktree run adds `outside-folder=20`, all twenty files in the pull request's own folders (none elsewhere), so not a finding. The two `statement-hygiene` hits are R04. Dependency check:

```
depcheck: 240 roadmaps, 2434 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean` at this head: 20 `declaration uses sorry` warnings, nothing else, exit 0. The worker's `#check @name` file for all 29 declarations elaborates; the 9 "dropped binder" leads are the defs and abbrevs that drop only `[CompleteSpace K]` or `[IsUltrametricDist K]`, which their bodies do not use (`weightedTate`, `TateAlgebra`, `IsAffinoidAlgebra`, `IsStrictRadius`, `pointNorm`, `supSeminorm`, `IsPresentationRing`, `IsSlopeLE`, `IsSlopeDecomposition`); every theorem keeps both. Each elaborated type matches its README statement as at `72ca89d2`. The R04 probe (two `AlgHom.Finite` substitutions) elaborates identically.

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`): `IsAffinoidAlgebra.isClosedEmbedding_of_finite_injective` (`Affinoid/FiniteMap.lean:61`), `IsAffinoidAlgebra.exists_finite_injective` (`Affinoid/NoetherNormalization.lean:163`), `IsAffinoidAlgebra.isNoetherianRing` (`Affinoid/FiniteQuotient.lean:43`), `IsAffinoidAlgebra.supSeminorm_le_norm` (used at `Affinoid/MaximumModulus.lean:116`), `RingHom.Finite` and `AlgHom.Finite` (`Mathlib/RingTheory/Finiteness/Defs.lean:174,193`); the remaining natives of the R01 table at the file and line given there, as opened by the review at `e752fe8` on the same pin. `grep` for `banachFunctionAlgebra`, `exists_fg_smul_le_of_presentation`, `isNoetherian_of_presentation_of_discrete` and "Satz 5.1" under `TauCeti/` is empty.

**Cross-roadmap citations.** Main is still `eaf17b10`, the head the review at `e752fe8` resolved them on, and the README is unchanged, so its resolution stands: AdicSpacesPartII R0.3 (1769), R0.4 (2270), R0.5 (2759), R0.9 (4071), R1.1 (8427), R1.7 (9806); AdicSpacesPartIII R3.1–R3.6 and the supplier rows 599–609; AdicSpacesPartIV R5.7 (2165), F1.1 (2998); RestrictedPowerSeries §2.4 (364), Layers 4–6 (452–608); PadicFunctionalAnalysis Layers 0–2 (190–384), §1.2, §2.2, §2.4; CompactOperators Layers 0–3, §3.1 (615); SchemeAndStackFoundations §0.20 (1302), §0.21 (1394). The worker's citation check at this head finds no cross-roadmap citation and no Lean name nowhere. The supplier table names only roadmaps on main; LocallyAnalyticDistributions appears only under Downstream consumers.

**Overlaps.** #1808 changes `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `Suggested.lean`: its head carries an older revision of this folder (its docstring names LocallyAnalyticDistributions §4.16, which `72ca89d2` dropped), and the pull request's merge-order paragraph states that the ModularCurves and SchemeAndStackFoundations move follows this pull request, so the order is stated and this is not a finding; whichever head merges second must carry the R01–R04 repairs. #1854 conflicts with this pull request only in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`. No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id of this roadmap.

**Sources at their locators**, incremental: the seeded sample falls in no changed passage, so the locator checks of the reviews at `4f06ba2` and `e752fe8` stand; re-opened at this head: Bosch Definition 8 and the composition remark (lines 4956–4968), Lutkebohmert Corollary 3.2 (line 413, standing DVR hypothesis line 109), Temkin Corollaries 4.5–4.6 (lines 792–815).

**Adversarial table.** No statement changed since `4f06ba2`; every row is carried from the review at `e752fe8` (which carried it from `4f06ba2`), with its instances and values, re-read against the byte-identical file.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsAffinoidAlgebra` | zero algebra; `K`; `K⟨T⟩/(T²)` | `0`: surjection from `T₀ = K`; `K`: `n = 0`; nilpotents kept | matches `TauCeti.IsAffinoidAlgebra` body (carried from e752fe8) | R01 |
| `exists_finite_injective` | `A = 0`; cusp | `0`: no injection (excluded by `Nontrivial`); cusp finite over `K⟨X⟩`, `d = 1` | native (carried) | R01, R04 |
| `height_eq_ringKrullDim_of_isDomain` | `K⟨T⟩×K`; `T² − p` | `K⟨T⟩×0` height 0 in dimension 1, excluded by `IsDomain`; `(T²−p)` height 1 = dim | native, Conrad 2.1.5 (carried) | R01 |
| `weightedTate_isAffinoid_iff` | `n = 0`; `ρ = p^(−1/2)`; `ρ ∉ p^ℚ` | vacuous both sides; `m = 2, c = p`; `|X|sup = ρ`, no power in `|K×|` | both directions, native (carried) | R01 |
| `IsStrictRadius` | `r = 1`, `p^(−1/2)`, `0` | `1 = ‖1‖`; `(p^(−1/2))² = ‖p‖`; `0` excluded | matches `√|K×|` (carried) | R01 |
| `supSeminorm_pow`, `_eq_zero_iff` | zero ring; `n = 0`; `K⟨T⟩/(T²)`, `f = T` | `0 = 0`; `|1|sup = 0 ≠ 1`, so `0 < n` needed and present; `|T|sup = 0`, `T² = 0` | holds, native (carried) | R01 |
| §2.1 Check `K×K` | `(1,0)`, `(0,1)` | `|(1,0)|sup = 1`, product `0`, `1·1 = 1` | submultiplicative only (carried) | none |
| §2.1 Check `ℚ_p⟨T⟩/(T²−p)` | one point | residue field `ℚ_p(√p)`, `|T|sup = p^(−1/2) ∉ |ℚ_p×|` | as stated (carried) | none |
| `exists_uniform_valueGroup_exponent` | `A = 0`; nilpotent `f`; `T² − p` | `m = 1, c = 0`; `c = 0`; `m = 2`, `c = p` | native, `1 ≤ m` is `0 < m` by `exact` (carried) | R01 |
| `powerBounded_iff`, `topologicallyNilpotent_iff` | `p`, `T` in `ℚ_p⟨T⟩`; zero ring | `|p| < 1`, `pⁿ → 0`; `|T|sup = 1`, bounded, not `→ 0`; `0 ≤ 1`, `0 < 1` | native (carried) | R01 |
| `banachFunctionAlgebra` | zero ring; `K⟨T⟩` | `C = 1`, `0 ≤ 0 ≤ 0`; `|f|sup = ‖f‖` | holds; absent at the pin (carried) | keep (R01) |
| `mem_iff_supSeminorm_le_one_of_isReduced` | zero ring; `ℤ_p ⊂ ℚ_p`, `ϖ = p`; `ϖ = p²`; `π(ℤ_p⟨T,S⟩) ⊂ ℚ_p⟨T,S⟩/(S²−p²T)` | `B = 0`, `ϖ = 0` unit, `0 ≤ 1`; `𝔽_p` reduced; `ℤ/p²` nonreduced, excluded; `S/p ∉ B`, `B/pB = 𝔽_p[T,S]/(S²)` nonreduced, excluded | holds; native with `IsLeftRegular` (carried) | R01 |
| `integral_iff_supSeminorm_le_one` | `T² − p`, `S = π(ℤ_p⟨T⟩)`, `a = T` | `T² = p ∈ S`; `|T|sup = p^(−1/2) ≤ 1` | native (carried) | R01 |
| `isClosedEmbedding_of_finite_injective` | `A = B = K⟨T⟩`, `φ = id`; `K⟨T⟩ → K⟨T⟩/(T²)` | `id` finite, injective, closed embedding; quotient not injective, excluded | native, `f.Finite` at `FiniteMap.lean:61` (computed here, the R04 statement) | R01, R04 |
| `exists_fg_smul_le_of_presentation` | `N = 0`; `M = 𝒪_{ℂ_p}`, `N = 𝔪`, `ε < |x| < 1` | `N' = 0`; `N' = x𝒪`, `c𝔪 ⊆ x𝒪` for `|c| ≤ ε` | Kiehl Satz 5.1 line 881; absent at the pin (carried) | keep (R01) |
| `isNoetherian_of_presentation_of_discrete` | `ℚ_p`; `ℂ_p` | `ρ = |p|`; no `ρ < 1`, `𝒪_{ℂ_p}` not noetherian | hypothesis is discreteness (carried) | keep (R01) |
| `IsSlopeLE` | `Q = 0`; `Q = 1`; `X − c`, `|c| < 1 = r`; `1 − cT` | root `0`, fails; no roots, holds; `|c| < r`, fails; root `1/c`, `|1/c| > 1`, passes | matches §7.2 Checks and `Polynomial.IsSlopeLE` (carried) | R01 |
| §7.2 convention vs Urban 2.3.1 | `r = |p|^h`, monic annihilator | roots of `Q*` are eigenvalues `λ` with `v(λ) ≤ h` iff `|λ| ≥ r` | direction agrees (carried, Urban line 869) | none |
| `IsSlopeDecomposition` wrong models | `M₁ = 0`; `c·id`, `|c| = r`; `|μ| < r` eigenvector in `M₁` | `Q = 1`; `Q = X − c`, constant term `−c` unit, `M₂ = 0`; annihilator root `μ` fails `IsSlopeLE` | summands determined, Urban 2.3.3 (carried) | R01 |
| `exists_projection` | `M₁ = 0`; `M₂ = 0` | `P = 0`; `P = id` | holds; native (carried) | R01 |
| §6.2–6.3 Checks | disc + circle; `|T|ⁿ ≤ |ϖ|`; unit disc in itself; finite affinoid | not admissible; radii `|ϖ|^(1/n) → 1`; `K⟨T⟩` not finite over `K`, not inner; rescaled generators, inner | as stated, Bosch Def. 6 (carried) | none |
| §6.3 composition law | discretely valued `K`; general `K` | Lütkebohmert Cor. 3.2 under a DVR; Temkin Cor. 4.5–4.6 in general; Bosch 4964–4968 defers to them | true, unsourced in the README (re-read) | R02 |
| §7.3 Checks | axes `XY = 0`; open disc; `ℙ¹` | `Y` vanishes on `X ≠ 0`, `Y ≠ 0`; `H¹(𝒪) = 0`, global ring not affinoid; `ℙ¹` quasi-compact, not affinoid | as stated (carried) | none |
| §7.4 nonflat Check | `F = I_P(−1)` on `ℙ¹_{K⟨t⟩}`, `t = 0` | `H⁰(F) = 0`; `F|fibre = 𝒪(−2) ⊕ k_P`, `H⁰ = K` | as stated (carried) | none |
| §7.5 shifts | `a = 0`; `a = 1`; degree 0 on `Sp A` | `R_0 = M`, `R_n = 0`; `R_n = M`; `R_n = aⁿM` | Kiehl-E Theorem 3.4 gives `d, e` (carried) | none |
| §8.2 Check | rank-two point below the Gauss point | `v(T) < 1`, `v(T)ⁿ > |ϖ|` all `n`; `L_A` per Huber-CV 766 | as stated (carried) | none |
| §8.3 | affinoid iff; two discs along the open disc | Huber-FR 4.5(v) (line 1436); non-quasi-separated, boundary points distinct | as stated (carried) | none |
| §0.1, §1.3 Checks | `p + T²`, `p + T + pT²`; `M = A`, `L = K`, `A/(T)` | Gauss norm 1 at `T = 1`, `|p|` at `0`; reduction `T`; both sides `A_L`, `A`, `L` | as stated, Conrad 1.1.5(1) (carried) | none |
| §0.2, §1.2 Japanese vocabulary | `TauCeti.Ring.IsJapanese` at the pin; SSF §0.20 line 1305 | README `Ring.IsJapanese` = suffix of the pinned name = SSF's name | consistent (carried) | none |

**Policy checks.** No `set_option`, no `lemma`, no `#eval`, no sorried data; no LaTeX, process words or pull-request numbers (gate counts all 0); `metadata.toml` is `math.AG`; the References cite legal hosts and DOIs.

## Not verifiable

- **[BGR]** (paywalled, recorded `uncertified`): every BGR locator is cited by locator only, as before.
- **[Lütkebohmert]**: read from the GDZ scan recognised by OCR; Theorem 3.1's statement (line 411) is garbled, Corollary 3.2 (line 413) is legible and was used.
- **[Temkin]**: read from the author's-page copy; preprint page numbers are given, not the journal's 585–607.
- **[Kiehl-E]**, **[Kiehl-AB]**: OCR of GDZ scans, as before.
- Ownership against open pull requests: unchanged since the review at `4f06ba2` (`roadmaps grep` for `IsAffinoidAlgebra`, `IsSlopeDecomposition`, `IsSlopeLE`, `supSeminorm` found declarations only in this folder); not re-run, since neither the folder nor its declared names changed.

## Source issues

- none
