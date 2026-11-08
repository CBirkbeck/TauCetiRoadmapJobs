# Review of AutomorphicSpectralTheory (pull request #925 at 5efd146)

**Verdict:** needs changes

This is an incremental re-review of the 49 lines (27 insertions, 22 deletions) changed in `TauCetiRoadmap/AutomorphicSpectralTheory/` since `e73fe1f`. Nothing outside the folder changed. One P3 remains: R03 of the previous review is only partly repaired. Nothing in this report blocks.

## R01 (P3) — §1.26 still cites the nonexistent `TauCeti.Multiquadratic.IsFundamentalDiscriminant`

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 1447 (§1.26, *Needs:*): "… AL.1 (number-field normalization adapters); `TauCeti.Multiquadratic.IsFundamentalDiscriminant`."

**Claim.** §1.26 gets its fundamental-discriminant criterion from that Tau Ceti declaration.

**Witness.** `IsFundamentalDiscriminant` does not occur in Tau Ceti at `2fd255d` or in Mathlib at `1b1ccf4` (grep returns 0 matches). Line 72 now names Mathlib's `Int.IsFundamentalDiscr` as the supplier of that criterion, so the README contradicts itself. This is the previous R03, partly repaired.

**Repair.** In §1.26's *Needs:* line, replace `TauCeti.Multiquadratic.IsFundamentalDiscriminant` with "`Int.IsFundamentalDiscr` and `Int.isFundamentalDiscr_iff_squarefree` (Mathlib)".

Tested at the pin under `import Mathlib`: after `simp only [Int.isFundamentalDiscr_iff_squarefree, ← Int.squarefree_natAbs]`, `decide +kernel` proves that `Int.IsFundamentalDiscr` holds for `12`, `−7` and `1` and fails for `16` and `−9`. These are exactly the values in §1.26's Check: the criterion accepts `12` and rejects `16`, and the genus character's domain admits `−7` and excludes `−9`.

## Previous findings

- R01 — **repaired.** Lines 103, 2609 and 2627 now read "in its last two bullets, the critical-line estimates…", "the last two bullets of AnalyticNumberTheoryPartI §2.1b" and "the last bullet of AnalyticNumberTheoryPartI §2.1b". Line 2604 reads "§2.1c; the area and length are its fourth bullet". None of the three invented names occurs.
- R02 — **repaired.** Line 103 reads "AnalyticNumberTheoryPartI §2.1a supplies `K_ν(c)=(1/2)∫₀^∞u^(ν−1)exp(−c(u+u⁻¹)/2)du` for `c>0` (`TauCetiRoadmap.AnalyticNumberTheoryPartI.besselK`)…". Line 113 reads "its Bessel transforms (AL.0.5) of AnalyticNumberTheoryPartI §2.1a's kernel". §§0.27 and 0.45 now need "AnalyticNumberTheoryPartI §2.1a", and the supplier table gained an §2.1a entry.
- R03 — **partly repaired.** Line 85 now reads "The module `TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic` supplies… `LinearPMap.IsResolventAt`… `LinearPMap.resolventSet` and `LinearPMap.resolvent`", line 72 adds `Int.IsFundamentalDiscr`, and §2.19's *Needs:* line is renamed. Line 1447 still cites `TauCeti.Multiquadratic.IsFundamentalDiscriminant`: R01 above.
- R04 — **repaired.** §4.5 now cites "§24, the paragraph after (24.1), p.158, for the finite multiplicity `m_disc(π_ℝ,K₀)`". It also proves the finite-dimensional clause from ALS.F.6 (i) (Harish-Chandra's finiteness theorem), with §4.4 and §2.6 for density of the residual forms.
- R05 — **repaired.** Line 13 adds: "AnalyticNumberTheoryPartI owns the explicit level-one material of the modular branch: §2.1a the `K`-Bessel kernel…, §2.1b…, §2.1c…, §3.23b…. AnalyticNumberTheoryPartII §5.3n…, §5.21w…".
- R06 — **repaired.** The catalogue comment is gone. `/-! ## Layer 0: Hilbert fields, vector analysis and rank-one kernels -/` now stands before `analytic_fredholm` and `/-! ## Layer 2: Meromorphic continuation, local normalization and residues -/` before `namespace Modular`. The title is "Automorphic spectral theory: target signatures".
- R07 — **repaired.** Line 1181 reads "the parameter `s` of AnalyticNumberTheoryPartI §2.1b's `E(z,s)` corresponds to the induction difference `λ(α∨)=2s−1`…; at `s=2`… `Λ(3)/Λ(4)=45ζ(3)/π³`". The repair is right to use `s`: that is §2.1b's actual parameter. The `σ` suggested in the previous report was itself a misreading of the supplier.

## Verified sound

**Gate.** I ran it on `5efd146`:

```
gate AutomorphicSpectralTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's run adds `build=0`.
- The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The pins on README line 62 (`1b1ccf4…`, `2fd255d…`) equal `lake-manifest.json`.

**Dependency check.**

```
depcheck: 238 roadmaps, 2365 edges, 0 problem(s)
```

Every supplier named in the changed text comes earlier in the merge order than this roadmap (95):

| Supplier | Merge-order position |
|---|---|
| AnalyticNumberTheoryPartI | 49 |
| AnalyticNumberTheoryPartII | 50 |
| ArithmeticLocallySymmetricSpaces | 58 |
| AutomorphicFormsOnReductiveGroups | 59 |
| AutomorphicLFunctionsAndLocalFactors | 93 |

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0. The only output is two `declaration uses 'sorry'` warnings, at lines 42 and 84.
- I ran `#check @name` for all five declarations in one scratch file. The types equal the worker's signature file and the README statements of §§0.16, 0.35, 0.37, 2.24 and 2.25. The diff changes only comments and the docstring, so no type changed. No section `variable` is used.
- One-tactic probe: `simp` in place of each `sorry` fails ("`simp` made no progress" at line 56; "unsolved goals" at line 93). Neither theorem is padding.
- The docstring's list of headlines that are not statable is unchanged: §§1.15a–1.15c, Layers 3–7, §4.8 and §§3.6a–3.6d, each with its missing carrier. No headline that is statable at the pins is absent.

**Seeded sample.** None of the 15 sampled targets (0.2, 0.9, 0.29, 1.10a, 2.15, 3.6c, 3.9, 3.15, 5.1, 5.6, 6.14, 6.27, 6.30, 6.38, 7.1b) lies in a changed passage, so their locators were not re-read this round. One of them, §0.29, depends on §0.27, whose *Needs:* line changed. That change only re-points the supplier of `K_ν`, so §0.29's statement is unaffected. I recomputed §0.29 in the table. No locator in the README is flagged unverified.

**§4.5 locators, read at the text** (Art05 extraction):

| Locator | Text | Verdict |
|---|---|---|
| §7, pp.32–33 | lines 1686–1820 | correct |
| Theorem 12.1, p.64 | line 3586 (page marker 3568): cuspidal discrete, finite multiplicities | correct |
| (12.5)–(12.6), p.66 | lines 3693 and 3714 | correct |
| §24, after (24.1), p.158 | lines 9541–9552: the `π_ℝ`-isotypic part of `L²_disc` at level `K₀` is a direct sum of copies of `π_ℝ` with finite multiplicity `m_disc(π_ℝ,K₀)` | correct |

Arthur's §24 is set over `ℚ`, as are the other Art05 locators. The number-field statement rests on the README's own route through ALS.F.6 (i), which is stated for every number field.

**Adversarial table.** The rows for changed statements were computed this round.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §1.15a Check (changed) | `s=2`; wrong model: induction difference used as `s` | `λ(α∨)=2s−1=3`. `Λ(3)/Λ(4)=1.744568…=45ζ(3)/π³=1.744568…`, matching AnalyticNumberTheoryPartI §2.1b's Check `y²+(45ζ(3)/π³)y⁻¹`. The wrong model gives `Λ(5)/Λ(6)=1.200777…`. | correct; the negative control separates | none |
| §4.5 finite-dimensional clause (changed) | `SL₂/ℚ`, `K₀=SL₂(Ẑ)`, trivial `K∞`-type, `χ` of the trivial representation; drop `χ`; `GL₁/ℚ`, level `Ẑ^×`; drop the level | `SL₂`: only the residual constants (no Maass cusp form has eigenvalue 0), so dim 1. Without `χ`, the Weyl law `#{r_j≤T}∼T²/12` gives infinite dimension. `GL₁`: `𝔸¹=ℚ^×·Ẑ^×`, so `ℚ^×\𝔸¹/Ẑ^×` is a point and dim 1. Without a level, every Dirichlet character contributes: infinite. | true; each fixed datum is needed | none |
| §4.5 idempotent step (changed) | `J=(Δ(Δ−λ₁))`, `f=1+φ` with `Δφ=λ₁φ` | `p=Δ/λ₁` is 1 at `λ₁` and 0 at 0, and `pf=φ`. `1−p` gives `1`. Both components are annihilated by their `ker χ`. | correct | none |
| §4.5 multiplicity step (changed) | `m` orthogonal copies of `π`, image of `P` of dimension `d` | one nonzero vector per copy, mutually orthogonal, so `m≤d<∞` | correct | none |
| §4.5 route inputs (changed) | ALS.F.6 (i), (iv); §4.4; §2.6 | (i): forms of fixed ideal, `K∞`-types and level are finite-dimensional. (iv): cusp forms are the algebraic sum of the `K∞`-finite, level-fixed vectors of the summands, so they are dense. §4.4: `L²_res` is the closed span of residues. §2.6: these residues are automorphic forms. Infinitesimal characters of the summands come through §0.50 → §0.48 → AutomorphicFormsOnReductiveGroups §2.2. | every input owned | none |
| Line 72 `Int.IsFundamentalDiscr` (changed) | `12, 16, −7, −9, 1, 0` | `12`: true (`3` squarefree, `3≡3`). `16`: false (`4` not squarefree). `−7`: true (`−7 emod 4=1`). `−9`: false (`−9 emod 4=3`). `1`: true. `0`: false. The first five are kernel-checked. | the bullet's description is right | none; R01 points §1.26 here |
| Line 85 `LinearPMap.IsResolventAt` (changed) | fields at `Resolvent/Basic.lean` 65–71 | `mem_domain`, `smul_sub_apply` (right inverse on `X`), `apply_smul_sub` (left inverse on `D(A)`), with `R` continuous | matches the prose | none |
| Line 103 `K_ν` (changed, R02) | `ν=±1/2`, `c=1` | The integral gives `0.4610685…`; `√(π/2)/e=0.4610685…`; `K_{−1/2}(1)=0.4610685…`. The README integrand `u^(ν−1)` equals `besselK`'s `exp(ν log u)/u`. | correct | none |
| §§4.17a, 4.18, 4.20 pointers (changed, R01) | AnalyticNumberTheoryPartI §2.1c bullet 4; §2.1b bullets 4–5 | Bullet 4 of §2.1c has `area=πℓ_A`, `length=2 log ε_D`. `d/dy y^(1/2+it)=(1/2+it)y^(−1/2+it)=O(y^(−1/2))`. The nonconstant part is `O(e^(−πy))`. The horizontal integral tends to 0. Integrability holds on finite-width cusp ends. | pointers exact | none |
| Scope paragraph (changed, R05) | AnalyticNumberTheoryPartII §§5.3n, 5.21w at `F=ℚ` | `c(z)=Z(z−1)/Z(z)`; at `z=2s` this is `Λ(2s−1)/Λ(2s)`, as in §1.15a. `M(z): I(χ₁,χ₂,z)→I(χ₂,χ₁,2−z)`. `E*(z)=E*(2−z)`. Residues `±Res_{v=1}Z` at `z=2, 0`. | claims match the supplier heads | none |
| §0.29 (sample; depends on changed §0.27) | `(ν,β)=(1,0),(2,0),(1,1),(2,2)` | `π=π`. `2=π/(2·π/4)`. `2i=πi/(π/2)`. `−2/3=−π/(2·(3√π/4)·√π)`. Omitting `2^(ν−1)` gives `−4/3` at `(2,2)`. | identity and factor right | none |

**Rows carried forward** from the review at `e73fe1f` (statements the diff leaves untouched; values as computed there):

| Statement | Instances and values | Result |
|---|---|---|
| `analytic_fredholm` (§0.16) | `K(z)=z` on `ℂ`: `R=(1−z)⁻¹`, `A₀=−1` of rank 1. `V=0`: `R=0`. `K(z)=zS` (`S` the shift): the singular set `{\|z\|≥1}` is not discrete, which `hcompact` excludes. `K≡1`: excluded by `hinv`. | true |
| `green_kernel_continuation` (§2.24) | `N=1`: `−12=−4π/(π/3)`. `N=2`: index 3, `−4π/π=−12/3`. `N=0` is excluded by `hN`, and `z=z′` by `γ=1`. | true |
| `legendre_q` (§0.35) | `Q₀(3)=½log2`, `Q₁(3)=(3/2)log2−1`; junk value 0 for `t<1` | matches README |
| `point_pair_invariant` (§0.37) | `z=i, z′=2i`: `5/4=cosh d` | correct |
| `automorphic_green` (§2.25) | `±γ` counted once by the factor `1/2`; summable for `Re s>1` | correct |
| §§1.2, 1.4, 2.4 (`GL₂` identification) | `z=λ(α∨)+1`; `c(2s)=ξ(2s−1)/ξ(2s)`; `Res_{z=2}=1` | correct |
| §§1.14, 1.15, 2.17, 2.18 pointers | residues `−½, ½`; cancellation at `½`; `3/π` | correct |
| §0.25, §0.1, §0.9, §0.39, §0.45, §1.27, §2.4a, §2.20, §3.2, §3.11 | values in the previous report's table | correct |
| §§4.15a, 4.15b, 4.15e, 4.19, 5.7, 6.8 | values in the previous report's table | correct |

**Library declarations opened at the pins this round.**

Mathlib:
- `Int.IsFundamentalDiscr` (`Mathlib/NumberTheory/FundamentalDiscriminant.lean`, line 41)
- `Int.isFundamentalDiscr_iff_squarefree` (line 60)
- `Int.squarefree_natAbs` (`Mathlib/Algebra/Squarefree/Basic.lean`, line 331)

Tau Ceti, all at `2fd255d`:
- `LinearPMap.IsResolventAt`, `LinearPMap.resolventSet` and `LinearPMap.resolvent` (`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean`, lines 65, 129, 169; root namespace `LinearPMap`)
- `TauCeti.LinearPMap.analyticAt_resolvent` (`…/Normed/Operator/Resolvent/Analytic.lean`, line 58)
- `TauCeti.stdPeterWeylBasis` (`RepresentationTheory/Compact/PeterWeyl.lean`, line 713)
- `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Analysis/Semigroups/Group/Stone/Unbounded.lean`, line 106)
- `IsCompactOperator.finiteDimensional_eigenspace` (`Analysis/Normed/Operator/Compact/Eigenspace.lean`, line 56)
- `TauCeti.isFredholm_one_sub` (`Analysis/Fredholm/CompactPerturbation.lean`, line 64)
- `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` (`Analysis/InnerProductSpace/Spectrum.lean`, line 152)
- `TauCeti.vitali` (`Analysis/Complex/Conformal/Vitali.lean`, line 95)
- `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` (`Analysis/Complex/Pick/Nevanlinna.lean`, line 436)

The one exception is R01's name.

**Cross-roadmap citations resolved at the indexed heads.**

- AnalyticNumberTheoryPartI (`979e68c`):
  - §2.1a (README line 1184) and `besselK` (its `Suggested.lean` line 589, namespace `TauCetiRoadmap.AnalyticNumberTheoryPartI`).
  - §2.1b (line 1206), five bullets. `completed_eisenstein_fourier` and `completed_eisenstein_continuation` are at its `Suggested.lean` lines 605 and 618.
  - §2.1c (line 1230), whose fourth bullet holds the area and length.
  - §3.23b (line 2638), and its scope line 12, which lists exactly the objects the new Scope paragraph assigns to it.
- AnalyticNumberTheoryPartII (`0717d3f`): §5.3n (line 728) and §5.21w (line 1306). Its scope (line 8) claims the `GL₂`-over-a-number-field Eisenstein series. This roadmap claims only the general-group forms and cites those sections, so there is one owner per object.
- AutomorphicLFunctionsAndLocalFactors (`330bb72`): AL.0.5 Bessel transforms (line 570), whose AL.0.5.1 (line 27) is AnalyticNumberTheoryPartI §2.1a.
- ArithmeticLocallySymmetricSpaces (`360d0bc`): ALS.F.6 (line 995), clauses (i) and (iv) as cited.
- AutomorphicFormsOnReductiveGroups (`753cac0`): §2.2 (line 344), which proves that irreducible admissible modules have an infinitesimal character and that irreducible unitary representations are admissible.
- The worker's resolver lists seven names found nowhere. Five are this file's declarations, all declared. Two are ArithmeticLocallySymmetricSpaces README targets (ALS.5b.4 and ALS.F.1). The seventh is R01's name.

**Consumers of changed ids.** §6.20 (line 3232) uses `m_disc(π)` from §4.5, consistent with the new text. AutomorphicSpectralTheoryPartII (README lines 1339, 1437, 1515) and AutomorphicBundlesPartII (lines 1257–1362) cite §4.5 and §§4.1–4.5 for the discrete spectrum with finite multiplicity. The repair sharpens that statement without narrowing it. No id was renumbered or dropped.

**Duplication and overlaps.** The overlap report lists no other open pull request that changes this roadmap, no cited id dropped elsewhere, and no id cited only by an open revision. The new Scope paragraph records the hand-over the previous round introduced, and neither analytic-number-theory supplier states anything this roadmap still owns. No gaps are declared (no readable `design/plan.json`).

## Not verifiable

- [DIT16] Appendix A, p.984 (sampled §0.29; not a changed passage). The sources service found only the Annals landing page, which is in no licence class, so the text was not read this round. The identity and the `2^(ν−1)` factor were recomputed at four points instead.
- [GZ86] (§§0.39, 0.45, 1.27; untouched): paywalled and uncertified, as before. Its rows are carried forward from the computed values.

## Source issues

- none
