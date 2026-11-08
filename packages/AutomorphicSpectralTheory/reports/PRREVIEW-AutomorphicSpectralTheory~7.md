# Review of AutomorphicSpectralTheory (pull request #925 at d256618)

**Verdict:** accepted

This is an incremental re-review of the 2 lines (1 insertion, 1 deletion) changed in `TauCetiRoadmap/AutomorphicSpectralTheory/` since `5efd146`. The only change is §1.26's *Needs:* line, and it applies the previous R01's repair word for word. Nothing outside the folder changed. This report raises no finding.

## Previous findings

- R01 — **repaired**: README line 1447 (§1.26, *Needs:*) now ends "…AL.1 (number-field normalization adapters); `Int.IsFundamentalDiscr` and `Int.isFundamentalDiscr_iff_squarefree` (Mathlib)." The name `IsFundamentalDiscriminant` no longer occurs in the README. Line 1447 and line 72 now name the same supplier.

## Verified sound

**Gate.** I ran it on `d256618`:

```
gate AutomorphicSpectralTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's run on the same head adds `build=0` and reports "Every check passed".
- The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff 5efd146 HEAD` touches only `README.md`, 1 line changed.
- The Mathlib and Tau Ceti checkouts are at `1b1ccf4…` and `2fd255d…`. These equal `lake-manifest.json` and the pins stated on README line 62.

**Dependency check.**

```
depcheck: 239 roadmaps, 2376 edges, 0 problem(s)
```

- The new supplier is Mathlib at the pin.
- The other suppliers on the changed line come earlier in the merge order than this roadmap (94): ArithmeticGaloisRepresentations is at 56 and AutomorphicLFunctionsAndLocalFactors at 92.
- The only cross-roadmap consumer of §1.26, GrossZagierAndArithmeticHeights, comes later (337).

**The changed passage, checked against the pinned Mathlib.**

- `Int.IsFundamentalDiscr` (`Mathlib/NumberTheory/FundamentalDiscriminant.lean`, line 41) is the conjunction of three conditions: `D % 4 ∈ {0,1}`; when `D = 4x`, `4 ∤ x` and `x % 4 ≠ 1`; and no odd prime square divides `D`. So `1` is included and `0` is excluded (`IsFundamentalDiscr.ne_zero`, line 52).
- `Int.isFundamentalDiscr_iff_squarefree` (line 60) states: `D % 4 = 1` and `D` squarefree, or `D % 4 = 0`, `D/4` squarefree and `D/4 % 4 ∈ {2,3}`. This matches README line 72 word for word.
- Both names elaborate under `import Mathlib` (`#check`).
- §1.26 lets `D_i = 1` in its factorization. That agrees with the predicate holding at `1`.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0. The only output is two `declaration uses 'sorry'` warnings, at lines 42 and 84.
- Since `5efd146` the file is unchanged. All five declarations went through `#check @name` in one scratch file:
  - `analytic_fredholm` and `Modular.green_kernel_continuation` (theorems);
  - `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant` and `Modular.automorphic_green` (definitions).

  Each elaborated type equals the worker's signature file and the README statements of §§0.16, 2.24, 0.35, 0.37 and 2.25. No section binder was lost: the file uses no section `variable`. Nothing changed.
- One-tactic probe on both theorems:

  | Tactic | `analytic_fredholm` (line 56) | `green_kernel_continuation` |
  |---|---|---|
  | `simp` | "made no progress" | unsolved goals |
  | `rfl` | fails | fails |
  | `infer_instance` | "type class instance expected" | "type class instance expected" |

  Neither theorem is padding.
- **Headline theorems.** Two are stated: analytic Fredholm continuation (§0.16) and the level-`N` Green-kernel continuation with residue `−12/[SL₂(ℤ):Γ₀(N)]` (§2.24). The module docstring names the rest as not statable at the pins, each with its missing carrier:
  - §§1.15a–1.15c: adelic reductive quotients, inducing spaces and intertwining operators;
  - Layers 3–7: Maass–Selberg identities, spectral completeness, Franke's comparison, the trace formulas, cyclic transfer and base change;
  - §1.16a: the modular spectral expansion;
  - §§3.6a–3.6d: canonical automorphic L-functions.

  This round changed none of this.

**Seeded sample.** The 15 sampled targets are 0.1, 0.4, 0.19, 0.21, 0.28, 1.18, 1.23, 2.20, 3.16, 4.10, 4.15b, 4.19, 5.7, 6.6 and 6.17.
- They sit at README lines 128, 170, 442, 474, 588, 1311, 1382, 1809, 2191, 2385, 2508, 2616, 2749, 2969 and 3159.
- None lies in the changed passage, and none cites §1.26. Inside the README, only §1.25 (line 1419) and §1.28 (line 1465) cite it.
- Their locators were therefore not re-read this round. The previous report covers them or carries them forward.
- §4.19 uses the same notion of fundamental discriminant. I checked that it is consistent with the new supplier (row below).
- No locator in the README is flagged as unverified.

**Consumers of the changed section.**
- In this README:
  - §1.25's `n_one` bullet (line 1419) uses the `D₁=1` case.
  - §1.28's *Needs:* (line 1465) cites §1.26.
- Elsewhere, GrossZagierAndArithmeticHeights cites "AutomorphicSpectralTheory §§1.25–1.30" and "§§1.26–1.28" at its open head (README lines 1676, 1806, 1831, 1956, 2033, 2208, 2245, 2626, 2800, 2812).
- No id was renumbered or dropped, so every citation still resolves.

**Duplication, ownership and overlaps.**
- The change adds no object, only a supplier citation of a pinned Mathlib declaration.
- The overlap report lists none of the following:
  - another open pull request changing this roadmap;
  - a cited id dropped elsewhere;
  - an id cited only by an open revision.
- No gaps are declared (no readable `design/plan.json`).
- The worker's resolver lists six names found nowhere in the pinned libraries, none on the changed line:
  - Four are this file's own declarations, all declared in `Suggested.lean`: `legendre_q`, `point_pair_invariant`, `automorphic_green` and `green_kernel_continuation`.
  - `LocallySymmetric.realPoints_lieGroup` (README line 113) and `LocallySymmetric.FrankeInput` (line 3795) are ArithmeticLocallySymmetricSpaces targets. Its open head's README has them at line 581 (ALS.F) and line 528 (ALS.5b.4).

**Adversarial table.** The rows for the changed passage and for what depends on it were computed this round. The kernel checks used `simp only [Int.isFundamentalDiscr_iff_squarefree, ← Int.squarefree_natAbs]; decide +kernel` on 14 values at the pin, all accepted.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §1.26 *Needs:* supplier `Int.IsFundamentalDiscr` (changed) | `12, 16, −7, −9, 1, 0, −1, 5, −3, −15, −5, 3, −4, 4` | True for `12` (`12/4=3` squarefree, `3%4=3`), `−7` (`−7%4=1`, squarefree), `1`, `5`, `−3`, `−15` and `−4` (`−4/4=−1`, `−1%4=3`). False for `16` (`4` not squarefree), `−9` (`−9%4=3`), `−1`, `−5` and `3` (all `≡3 mod 4`), `4` (`4/4=1`, `1%4=1`) and `0` (`ne_zero`). All kernel-checked. | the supplier decides exactly the values §1.26 needs | none |
| Wrong models of the same supplier | "squarefree alone"; "`D≡0,1 mod 4` alone" | "Squarefree alone" accepts `−1` and `3`, which the pinned predicate rejects. "`D≡0,1 mod 4` alone" accepts `16` and `4`, which it rejects. | the cited declaration excludes both | none |
| §1.26 Check (depends on the changed line) | `12, 16, −7, −9` | Accepts `12`, rejects `16`. In the negative odd domain it admits `−7` and excludes `−9`. All four are kernel-checked at the pin. | Check true of the cited supplier | none |
| §1.26 factorization `D=D₁D₂`, `D_i=1` allowed (depends) | `D=−15`, `D=−7` | `−15=(−3)·5`: both factors fundamental. `(−5)·3`: both rejected. `1·(−15)`: allowed, since `1` is accepted. `ε₋₃ε₅=ε₋₁₅` is odd. With odd weight `2k−1`, `ε(−1)(−1)^(2k−1)=(−1)(−1)=1`, so the half-sum over `±(m,n)` is nonzero. `D=−7=1·(−7)` gives `D₁=1`, the level-7 series of `d1_one`. | definition consistent with the supplier | none |
| README line 72 (untouched since `5efd146`; re-read against line 1447) | `1`; the criterion | `IsFundamentalDiscr 1` holds. The stated criterion is `isFundamentalDiscr_iff_squarefree` at line 60. | lines 72 and 1447 now agree | none |
| §4.19 (sample; same notion; untouched) | `D=12`, `D=5` | `12=(−3)(−4)`: both fundamental, the `d′,d<0` branch. `3·4`: both rejected, so no spurious positive factorization. `12·1`: the trivial-character branch, `d′=1` allowed. `5=5·1`. | consistent with the pinned predicate | none |
| `Suggested.lean`, five declarations (file unchanged) | `#check @name`; probe | The types equal the signature file. `simp`, `rfl` and `infer_instance` all fail on both theorems. | unchanged and not padding | none |

**Rows carried forward** from the previous review (PRREVIEW-AutomorphicSpectralTheory~6, at `5efd146`). The diff leaves these statements untouched; the values are as computed there.

| Statement | Instances and values (previous report) | Result |
|---|---|---|
| `analytic_fredholm` (§0.16) | `K(z)=z` on `ℂ`: `R=(1−z)⁻¹`, `A₀=−1` of rank 1. `V=0`: `R=0`. `K(z)=zS` (shift): singular set not discrete, which `hcompact` excludes. `K≡1`: excluded by `hinv`. | true |
| `green_kernel_continuation` (§2.24) | `N=1`: `−12=−4π/(π/3)`. `N=2`: index 3, `−4π/π=−12/3`. `N=0` excluded by `hN`; `z=z′` excluded by `γ=1`. | true |
| `legendre_q` (§0.35) | `Q₀(3)=½log2`, `Q₁(3)=(3/2)log2−1`; junk value 0 for `t<1` | matches README |
| `point_pair_invariant` (§0.37) | `z=i, z′=2i`: `5/4=cosh d` | correct |
| `automorphic_green` (§2.25) | `±γ` counted once by the factor `1/2`; summable for `Re s>1` | correct |
| §1.15a Check | `s=2`, so `λ(α∨)=3`. `Λ(3)/Λ(4)=1.744568…=45ζ(3)/π³`. The wrong model gives `1.200777…`. | correct |
| §4.5 finite-dimensional clause, idempotent and multiplicity steps | `SL₂/ℚ` at level `SL₂(Ẑ)`: dim 1; without `χ`, infinite (Weyl law `T²/12`). `GL₁/ℚ`: dim 1. `p=Δ/λ₁` separates `1+φ`. `m≤d<∞`. | true |
| §4.5 Art05 locators | §7 pp.32–33; Thm 12.1 p.64; (12.5)–(12.6) p.66; §24 after (24.1) p.158 (Art05 lines 1686–1820, 3586, 3693/3714, 9541–9552) | correct |
| Line 85 `LinearPMap.IsResolventAt`; line 103 `K_ν` | fields at `Resolvent/Basic.lean` 65–71. `K_{±1/2}(1)=√(π/2)/e=0.4610685…` | correct |
| §§4.17a, 4.18, 4.20 pointers; Scope paragraph | AnalyticNumberTheoryPartI §2.1c bullet 4 and §2.1b bullets 4–5. AnalyticNumberTheoryPartII §§5.3n, 5.21w: `c(z)=Z(z−1)/Z(z)` | exact |
| §0.29 | `(ν,β)=(1,0),(2,0),(1,1),(2,2)` give `π`, `2`, `2i`, `−2/3`. Without `2^(ν−1)`: `−4/3`. | correct |
| §§1.2, 1.4, 2.4; §§1.14, 1.15, 2.17, 2.18 | `z=λ(α∨)+1`, `c(2s)=ξ(2s−1)/ξ(2s)`, `Res_{z=2}=1`; residues `−½, ½`, `3/π` | correct |
| §§0.1, 0.9, 0.25, 0.39, 0.45, 1.27, 2.4a, 2.20, 3.2, 3.11, 4.15a, 4.15b, 4.15e, 4.19, 5.7, 6.8 | values in the earlier reports' tables, carried forward by PRREVIEW-AutomorphicSpectralTheory~6 | correct |

**Library declarations opened at the pins this round.**

Mathlib `1b1ccf4`:
- `Int.IsFundamentalDiscr` (`Mathlib/NumberTheory/FundamentalDiscriminant.lean`, line 41)
- `Int.IsFundamentalDiscr.ne_zero` (line 52)
- `Int.isFundamentalDiscr_iff_squarefree` (line 60)
- `Int.squarefree_natAbs` (`Mathlib/Algebra/Squarefree/Basic.lean`, line 331)

Tau Ceti `2fd255d`:
- `Int.decidablePredIsFundamentalDiscr` (`TauCeti/NumberTheory/FundamentalDiscriminant.lean`, line 34)
- `Int.IsFundamentalDiscr.mul` (line 45)
- No declaration named `IsFundamentalDiscriminant` exists in either pinned library.

**Remark on untouched text** (no change requested). Tau Ceti's `Int.IsFundamentalDiscr.mul` (coprime fundamental discriminants have a fundamental product) and the decidability instance (lines 34, 45) are available at the pin for the genus-factorization material of §§1.26 and 4.19. §1.26 takes the factorization as given, so it does not need them as written.

## Not verifiable

- [GZ86], Chapter IV, §2, (2.1), p.273: this is §1.26's own locator. The locator line is untouched by the diff and the work has no entry in the roadmap's `sources.toml`. It was not read this round. §1.26's discriminant clauses were checked against the pinned Mathlib instead (rows above).
- [DIT16], §5, p.963 (sampled §4.19; untouched): the previous round found only the Annals landing page, in no licence class. It was not re-read. §4.19's discriminant hypotheses were recomputed against the pinned predicate instead.

## Source issues

- none
