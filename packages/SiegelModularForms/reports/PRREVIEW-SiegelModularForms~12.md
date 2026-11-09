# Review of SiegelModularForms (pull request #1714 at 8723e79)

**Verdict:** accepted

An incremental re-review: the folder changed by 22 lines (`README.md` only, 17 insertions, 5 deletions) since `d01f7b0`, the head the previous review read. The two findings of that review are checked first, then the changed passages in full, then the gate, the dependency check and the elaboration. No finding remains.

## Previous findings

- R01 — repaired: `README.md:317` now cites `ZLattice.IsEven.thetaForm`, the name at main's Tau Ceti pin `2fd255d9` (`ThetaSeries/LevelOne.lean:65, 70, 122`). The Sturm name `ModularForm.sturm_bound_finiteIndex` (`:323–324`, `:1220`, `:1254`) is also exact at that pin: `SturmBound.lean:48, 55, 63` there declare it inside `namespace ModularForm`, with `namespace TauCeti` opening only at line 93; the previous report's `TauCeti.ModularForm.…` was read off the branch's pin `358314d4` (`SturmBound.lean:47–49, 79`). The pull request does not touch `lake-manifest.json` (no change outside the folder), so the roadmap merges against main's manifest, where every cited theta-series and Sturm name exists; the worktree's lake directory lags only because the branch's base does.
- R02 — repaired: `README.md:2864–2871` attributes "`Λ(s, F, spin)` entire off the Maass space" in scalar weight to Evdokimov and Oda ("has a pole if and only if `F ∈ S_k^*(Γ₂)`, and then the only poles are the simple ones at `s = k` and `s = k − 2`"), for `j > 0` to Arakawa, and keeps Andrianov for the continuation, the functional equation and the finiteness of the pole set; `:2549–2551` says the same in 8.3; `:3616–3620` add both works to the references. Recomputed below; no new problem.

## Verified sound

### The changed passages

- **8.3 (`:2546–2551`).** The pole statement is now deferred to 9.5 by name ("Evdokimov's and Oda's characterization … Arakawa's theorem for `j > 0`, proved in 9.5"); 8.3's own claims (continuation, finitely many poles, `Λ(2k + j − 2 − s) = (−1)^k Λ(s)`) are unchanged, and 8.3's *Needs* (`:2600–2603`) still name nothing of Layer 9.
- **9.5 (`:2861–2871`).** The "iff" was tested in both directions and at the degenerate weights (table): on `SK(f)` the pole at `s = k` is forced by `L(k, f) ≠ 0`; off the Maass space entireness is the cited theorem; for odd `k` the Maass space is `0` because index-one Jacobi forms of odd weight vanish (`c(n, −r) = (−1)^k c(n, r)` with `c(n, r)` a function of `4n − r²` and `r mod 2` gives `c = 0`). The stated pole set `{k, k − 2}` of `Λ` on `SK(f)` is recomputed from 8.3's gamma factor (table). The *Needs* line of 9.5 (`:2884`) is unchanged and names no new supplier; the hypothesis `a_F((1, 0, 1)) ≠ 0` for `j > 0` is still carried from 8.3.
- **References (`:3616–3620`).** Both entries checked against zbMATH's records: Evdokimov, Mat. Sb. (N.S.) 112(154) (1980), 133–142, translated as *A characterization of the Maass space of Siegel cusp forms of second degree*, Math. USSR-Sb. 40 (1981), 125–133 (DOI `10.1070/SM1981v040n01ABEH001792`); Oda, Math. Ann. 256 (1981), 323–340 (DOI `10.1007/BF01679701`; the GDZ scan in the cache has 18 text pages after its cover, matching); Arakawa, Manuscripta Math. 44 (1983), 155–185 (DOI `10.1007/BF01166080`), so "the Theorem on p. 158" lies inside the paper. The reference list is in order of first use, not alphabetical, so the placement after Arakawa is consistent with the rest of the list.
- **Nothing else cites or depends on the changed lines:** the only mentions of Evdokimov and Oda are `:2549–2550`, `:2865–2866`, `:3616–3620`; Arakawa is cited at `:1380`, `:2479`, `:2536–2539`, `:2626`, `:2869`, `:3613`, all unchanged except `:2869`. `Suggested.lean` is unchanged.

### Gate, dependency check, elaboration

- **Worker's gate** (`scratch/gate.md`): every check `0`, `build=0`, `OK`.
- **Dependency check** with the candidate order, `--movable` and main:

```text
depcheck: 236 roadmaps, 2307 edges, 0 problem(s)
```

- **Elaboration:** `lake env lean` on `Suggested.lean` from the worktree exits `0` in 77 s with exactly 72 `declaration uses 'sorry'` warnings and nothing else (pins Mathlib `f6090c70`, Tau Ceti `358314d4`). The file is byte-identical to the one the previous review probed: its signature comparison (208 `#check`s, no lost binder) and one-tactic padding probe (66 sites, none closes) carry over.
- **Changes outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SiegelModularForms'` prints nothing.
- **Overlaps** (`scratch/overlaps.md`): no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no id is defined only by an open revision; the closest roadmaps (HalfIntegralWeightModularForms, HilbertModularForms, MaassForms, MetaplecticAutomorphicForms, ThetaSeries) were resolved by the previous review and the diff touches none of their citations.

### Seeded sample

Of the 15 sampled targets, only 9.5 ("The Saito–Kurokawa theorem") falls in the changed lines; its sources are the three works above (Not verifiable for the theorem texts; bibliographic data verified). The other 14 (1.2, 5.2, 6.1, 6.7, 7.1, 7.3, 7.4, 8.5, 9.2, 9.3, 9.7, 10.2, 11.1, 11.2) are unchanged text that the previous review checked at its locators; nothing in the diff cites or is cited by them.

### Adversarial table

Rows for untouched statements are the previous report's (PRREVIEW-SiegelModularForms~11), carried forward; the new rows are for the changed statements.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 9.5 pole set of `Λ(s, SK(f), spin)` (changed) | `k` even, `f ∈ S_{2k−2}(SL₂(ℤ))` eigenform | `Γ_ℂ(s − k + 2) = ((s − k + 1)/2π) Γ_ℂ(s − k + 1)` and `Γ_ℝ(s)Γ_ℝ(s + 1) = Γ_ℂ(s)`, so `Λ(s) = c (s − k + 1) ξ(s − k + 1) ξ(s − k + 2) Λ(s, f)` with `ξ` the completed zeta and `Λ(s, f) = Γ_ℂ(s) L(s, f)` entire; candidate poles `s ∈ {k − 1, k, k − 2, k − 1}`; at `k − 1` the double pole is cancelled by the factor `(s − k + 1)` and by `Λ(k − 1, f) = 0` (root number `(−1)^{k−1} = −1`); at `k`: `ξ(1)` pole, `ξ(2) Λ(k, f) ≠ 0`; at `k − 2`: `ξ(0)` pole, `ξ(−1) Λ(k − 2, f) = ξ(−1) · (±) Λ(k, f) ≠ 0` by `f`'s functional equation. Exactly two simple poles, `{k, k − 2}`, as stated | Pass |
| 9.5 "iff" (changed), direction ⇐ | `k = 10`, `F = χ₁₀ = SK(f₁₈)` | `L(s, χ₁₀, spin) = ζ(s − 9) ζ(s − 8) L(s, f₁₈)`; residue at `s = 10` is `ζ(2) L(10, f₁₈) ≠ 0` (`10 > 9 + 1/2`, Deligne); pole present | Pass |
| 9.5 "iff" (changed), direction ⇒ | `k = 20`, `S₂₀(Γ₂)`, `dim = 5`, Maass part `dim M₃₈ = 2` (previous rows) | the three non-Maass eigenforms have `Λ` entire by Evdokimov/Oda (source, Not verifiable); the statement is consistent with the 11.3 row of the previous report (three `W`-orbits of spin parameters without the `(1, p^{k−1}, p^{k−2})` shape, so no `ζ(s − k + 1)` factor) | Pass (source) |
| 9.5 odd `k` (changed) | index-one Jacobi forms of weight `k` odd | `c(n, −r) = (−1)^k c(n, r)` and, in index 1, `c(n, r)` depends on `4n − r²` and `r mod 2` only; `r ≡ −r mod 2` gives `c(n, r) = −c(n, r) = 0`, so `J_{k,1} = 0` and `S_k^*(Γ₂) = 0`; e.g. `k = 35`: `dim S₃₅(Γ₂) = 1` (previous `igusaDim` row) with Maass part `0`, consistent with the previous row's `S_k^*(Γ₂) = 0` for odd `k` | Pass |
| 8.3 gamma / functional equation (unchanged, re-read with the new pole clause) | `(k, j) = (10, 0)`, `(8, 6)` | `Γ_ℂ(s) Γ_ℂ(s − k + 2)` with `w = 2k + j − 3 = 17, 19`; mirror of `s = k` under `s ↦ 2k + j − 2 − s` is `k + j − 2`, equal to `k − 2` only when `j = 0`, as the new clause (poles stated for scalar weight only) requires | Pass |
| 0.2, 0.4, 0.5, 1.2, 1.3, 2.2, 2.3, 2.4, 2.6, 4.3, 5.3 (×3), 6.3, 6.4 (×2), 6.5, 6.7 (×2), 6.9, 7.1, 7.2, 7.3, 7.5, 7.6, 8.1, 8.2, 8.3, 8.5, 9.4, 9.5 `saito_kurokawa`, 9.5 poles, 11.2, 11.3, `finrank_cusp_paramodular_four`, `finrank_maassSubmodule`, `exists_equiv_modularForm_degreeOne`, `siegelTheta_symJ_smul`, LevelOne comparison | as in the previous report | as in the previous report (text unchanged) | Pass (carried) |

### Library declarations opened at the pins

- **Tau Ceti `2fd255d9`** (main's pin, read in the shared lake directory): `ThetaSeries/Basic.lean:96, 102` (`namespace ZLattice`, `thetaSeries`); `ThetaSeries/Inversion.lean:55, 104` (`thetaSeries_S_smul`); `ThetaSeries/LevelOne.lean:65, 70, 122` (`ZLattice.IsEven.thetaForm`); `SturmBound.lean:48, 55, 63, 93` (`ModularForm.sturm_bound_finiteIndex`, `…_SL2Z`, then `namespace TauCeti`).
- **Tau Ceti `358314d4`** (the worktree's pin): `SturmBound.lean:47–49, 79, 87` (`TauCeti.ModularForm.sturm_bound_finiteIndex`); no `ThetaSeries` directory. Nothing in `Suggested.lean` imports either module; the build passes at this pin.

### Cross-roadmap citations

The diff adds none and changes none; the previous report's resolution of every citation (at the open heads or on main) stands, and the overlap scan found no dropped or revision-only id.

## Not verifiable

- **Evdokimov 1980/1981** (9.5): `uncertified` in the manifest, settled; the theorem text was not read. Its bibliographic data was checked against zbMATH's record (titles of the Russian original and the translation, volume, pages).
- **Oda 1981** (9.5): fetched from GDZ (`oda1981`, 19-page scan) but image-only; OCR is not installed on this worker, so the text could not be read (`scratch/needs-references.toml` already lists it). Bibliographic data checked against zbMATH. The characterization "pole ⇒ Maass space" is cited at the paper, not at a page.
- **Arakawa 1983** (9.5, "the Theorem on p. 158"): `uncertified`, settled; the page lies within 155–185 (zbMATH). The odd-`k` clause "no eigenform has a pole" rests on Andrianov 1974's statement for odd weight, which is not in the cache either (listed as not in the cache by the previous report).
- **Springer's article pages** for Oda and Arakawa redirect to a cookie-authorization endpoint and were not followed.
- Everything the previous report listed under this heading for unchanged text (blocked Project Euclid stubs for `tsushima1983` and `ibukiyama1985`; the uncertified, waived and uncached works; LMFDB knowls; a build at main's pins) still applies.

## Source issues

- none (the previous report's three vdg items concern unchanged text and are already recorded).
