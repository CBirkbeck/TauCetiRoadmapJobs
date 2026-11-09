# Review of PurityForFlatCohomology (pull request #1840 at d3f15fd)

**Verdict:** accepted

Incremental re-review of the 51 lines of `TauCetiRoadmap/PurityForFlatCohomology/README.md` changed since fb0e7fb. This report has no finding: the three findings of the previous review (all P3) are repaired, and the repairs introduce no new problem. The gate passes, the dependency check reports 0 problems and `Suggested.lean` (unchanged since fb0e7fb) elaborates with `sorry` as the only warning.

## Previous findings

- R01 — repaired: §8.2 Checks, lines 3119–3138: "`𝔽_p((t))`, which fails both clauses", and a new Check with the fixed field `k` of a pro-`p` Sylow subgroup of `Gal(K₀^sep/K₀)`: first clause holds, `H²(k, 𝔾_m)[p^∞] ≅ ℚ_p/ℤ_p ≠ 0`. §8.3 gains the matching negative control (lines 3161–3165).
- R02 — repaired: §6.3 Checks, lines 2099–2110: "for `R = ℚ⟦x, y⟧` … `H^1(Spec R, μ_3) ≅ ℚ^×/ℚ^{×3}`, which contains the nonzero class of `2` … restriction is injective on this nonzero group".
- R03 — repaired: Exact supplier contracts, lines 361–369: "`CategoryTheory.Hom.commGroup` (scoped in `CategoryTheory.MonObj`, `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean`)"; the file of `CategoryTheory.yonedaCommGrpGrp` is now named as well.

## Verified sound

### Gate, dependency check, build, diff

- **Gate rerun at d3f15fd.** Every counter is 0 and the gate prints `OK` (including `dropped=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`, `dirty=0`). The worker's `gate.md` also shows `build=0`.
- **Dependency check.** `gate --depcheck … --movable` prints exactly `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 with exactly 15 warnings, all ``declaration uses `sorry` ``, and 0 errors. `git diff fb0e7fb d3f15fd` touches only `README.md`, so the signature comparison (25 declarations, no `variable`/`include`), the one-tactic probe (15 theorems, 0 closures) and the headline list of the previous report stand unchanged.
- **Diff.** The diff outside the folder is empty. The change adds no backticked Lean name of this roadmap's own, no supplier and no `*Needs:*` edge.

### The changed passages

**Supplier contract (R03), at Mathlib `1b1ccf4`.**
- `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean` line 310: `abbrev Hom.commGroup [IsCommMonObj G] : CommGroup (X ⟶ G)`; line 312 makes it a scoped instance of `CategoryTheory.MonObj`. The README's file and scope are right.
- `Mathlib/CategoryTheory/Monoidal/Cartesian/CommGrp_.lean` line 57: `def yonedaCommGrpGrp : CommGrp C ⥤ (Grp C)ᵒᵖ ⥤ CommGrpCat` (object part `yonedaCommGrpGrpObj`, line 44). The README's name, file and "a presheaf on `Grp C`" are right.

**§6.3 Check (R02), recomputed.**
- `R = ℚ⟦x, y⟧` is regular local of dimension 2, so `vdim = 2`; the theorem claims injectivity for `i = 0, 1` and bijectivity for `i = 0`.
- `μ_3(R) = 1`: a cube root of unity `u` has constant term in `μ_3(ℚ) = 1`, so `u ∈ 1 + 𝔪`, and `u² + u + 1 ≡ 3` is a unit, so `u = 1`. The same factorisation gives uniqueness of cube roots in `1 + 𝔪`.
- Existence of cube roots in `1 + 𝔪`: the coefficients `binom(1/3, n)` lie in `ℤ[1/3]` (first values `1/3, −1/9, 5/81`), so the series converges `𝔪`-adically over `ℚ`.
- So `R^×/R^{×3} ≅ ℚ^×/ℚ^{×3}`, and `2` is not a rational cube (3-adic valuation of the exponent of `2` is `1`, not divisible by `3`). The group is nonzero.
- Kummer on `U_R`: `0 → Γ(U_R, 𝒪)^×/3 → H^1(U_R, μ_3) → Pic(U_R)[3]`, with `Γ(U_R, 𝒪) = R`; the composite `R^×/3 → H^1(Spec R, μ_3) → H^1(U_R, μ_3)` is the Kummer embedding, so restriction is injective on a nonzero group. The zero sheaf gives `0` there, so the Check now separates it; the closing remark on `ℝ⟦x, y⟧` (`ℝ^× = ℝ^{×3}`) is correct.

**§8.2 Checks (R01), recomputed.**
- `𝔽_p((t))` fails both clauses: `Br = ℚ/ℤ`; Kummer with Hilbert 90 gives `H²(μ_ℓ) = Br[ℓ] = ℤ/ℓ` for `ℓ ≠ p`.
- The field `k`: `Gal(K₀^sep/k) = P` is pro-`p`. For a finite `P`-module `M`, the prime-to-`p` part has `H^i = 0` for `i ≥ 1`; the `p`-part has a filtration with quotients `ℤ/p` with trivial action (a `p`-group acting on a nonzero finite `p`-group has nonzero fixed points); Artin–Schreier with `H^i(k, 𝔾_a) = 0` (`i ≥ 1`) gives `H^i(k, ℤ/p) = 0` for `i ≥ 2` (and `H^1 = k/℘(k)`, not claimed zero). So the first clause holds.
- `Br(k)[p^∞] = colim Br(K′)[p^∞]` over finite `K′/K₀` inside `k`; `[K′ : K₀]` is prime to `p` because `P ⊂ Gal(K₀^sep/K′)` and `P` is a Sylow subgroup; each transition map is multiplication by a degree prime to `p` on `ℚ_p/ℤ_p`, hence bijective; the colimit is `ℚ_p/ℤ_p ≠ 0`. The Brauer clause fails at `K = k`, which the Lean definition's quantifier over finite separable `K/k` includes.
- `k` is imperfect: `t ∈ k` and `t^{1/p}` is purely inseparable of degree `p` over `K₀`, so not in `K₀^sep ⊃ k`. For a perfect field of characteristic `p`, `p` acts bijectively on `k^{sep×}`, so the torsion group `Br` has no `p`-part and the two notions agree, as the Check says.
- Locators, read in the cached text of Poo17 (printed page = extraction page − 14): Proposition 1.3.15(i), p. 11 (Poo17 lines 812–814: `H^q(k, 𝔾_a) = 0` for `q ≥ 1`); Theorem 1.5.34(i), (ii), p. 25 (lines 1363–1376: image `ℚ/ℤ` for nonarchimedean `k`; the square with multiplication by `[L : k]`); Proposition 1.5.25, p. 23 (lines 1316–1329: condition (i) is `cd k ≤ 1` plus the `p`-primary Brauer condition, and the primed forms restrict to finite separable extensions, which is the form of `IsOfDimLEOne`); Exercise 1.28, p. 30 (lines 1590–1592). All four match; the References entry "§§1.3–1.5 and 6.8" covers them.

**§8.3 Check, recomputed.**
- `R = k⟦x, y⟧` is complete, hence henselian, regular of dimension 2; residue field `k` as above.
- `H²(R, 𝔾_m)` is torsion (§7.9(b), lines 2467–2471) and equals `Br(R)` (§7.10 for the affine scheme `Spec R`, lines 2490–2496); `Br(R) ≅ Br(k)` is SchemeAndStackFoundations §2.22 `brauer_henselian_local` (main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 4491–4493: henselian local `R`, `Br(R) → Br(k)` an isomorphism).
- `Spec Frac(R) → Spec R` factors through `U_R`, and `H²(R, 𝔾_m) → H²(Frac R, 𝔾_m)` is injective by §7.9(b); so `H²(R, 𝔾_m) → H²(U_R, 𝔾_m)` is injective and `H²(U_R, 𝔾_m) ⊇ ℚ_p/ℤ_p ≠ 0`. The theorem's conclusion fails for this `R`, and `IsOfDimLEOne k` is false, so the theorem does not apply: the Check is a genuine negative control for the hypothesis.

### Seeded sample

None of the fifteen sampled targets (0.3, 0.4, 1.2, 5.2, 5.5, 5.6, 5.8, 5.10, 6.2, 7.5, 7.11, 7.12c, 7.12e, 8.11, 8.12) lies in a changed passage or cites one; the changed passages' own locators (Poo17, four of them) are verified above. The README flags no locator as unverified.

### Cross-roadmap citations, ownership, overlaps

- New citation resolved: SchemeAndStackFoundations §2.22 `brauer_henselian_local` (main line 4491). Internal references §§7.9(b), 7.10, 8.6 exist at the head with the content used.
- The `resolve` leads (`citations.md`, 7 items) are the same false positives as in the previous report (names at the open heads of PrismaticCohomologyPartIII, DerivedDeRhamCohomology, SchemeAndStackFoundations §2.22 and the board package of PerfectoidQuotientsPartII); none is in a changed passage.
- `overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision. The change adds no owned object, so the previous report's ownership findings (GroupSchemesOverABase, ReductiveGroups) stand as recorded there.
- Declared gaps (`prismatic-dieudonne-perfectoid`, `ci-defect-additivity`, `regular-tower-tilt`): untouched by the diff.

### Adversarial table

Rows 1, 3, 4 and 6–24 of the previous report (PRREVIEW~12, head fb0e7fb) concern statements the diff leaves untouched and are carried forward unchanged: rows 1, 3 (`etaleDepth_ge_virtualDimension` restriction form, `homPresheaf`/`smallEtaleSheaf`), 4 (`IsTorus`), 6–9 (§§8.3, 8.6, 8.7, 8.1 theorems), 10–12 (§§1.2, 1.5, 6.1), 13–15 (§§7.12b, 7.12a, 7.12e), 16–19 (§§6.2, 6.4, 7.2, 7.5), 20–22 (§§8.5, 8.9, 8.18), 23–24 (`virtualDimension`, local Picard). Rows for the changed passages:

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 2′ | §6.3 Check, non-constant `G` | `μ_3` over `ℚ⟦x,y⟧`; zero sheaf; `μ_3` over `ℝ⟦x,y⟧` | `H⁰`: `1 → 1`; `H¹(Spec R) = ℚ^×/ℚ^{×3} ∋ [2] ≠ 0`, embeds in `H¹(U_R)` via `R^×/3`; zero sheaf `0 → 0`; `ℝ^×/3 = 0` (empty) | Check discriminates | none |
| 5′ | `IsOfDimLEOne`, §8.2 Checks | `𝔽_q`; `k^sep`; `ℝ`; `ℚ_p`; `𝔽_p((t))`; Sylow field `k`; perfect `k` of char `p` | holds; holds; `H²(ℤ/2) = ℤ/2`; `H²(μ_ℓ) = ℤ/ℓ`; `ℤ/ℓ` and `ℚ/ℤ` (both clauses fail); clause 1: `H^{≥2}(k, M) = 0`, clause 2: `Br(k)[p^∞] = ℚ_p/ℤ_p`; `Br[p] = 0`, notions agree | Brauer clause now separated from `cd ≤ 1` | none |
| 6′ | §8.3 Check, Brauer clause | `k⟦x,y⟧`, `T = 𝔾_m`, `k` the Sylow field; `ℤ_p⟦x⟧`; `ℝ⟦x,y⟧` with norm-one `T` | `H²(R,𝔾_m) = Br(k) ⊇ ℚ_p/ℤ_p ↪ H²(U_R,𝔾_m) ↪ Br(Frac R)`, nonzero, hypothesis false; `0`; `H¹ = ℤ/2`, hypothesis false | consistent with C19 Theorem 1.4 | none |
| 25 | Supplier contract, `Hom.commGroup`, `yonedaCommGrpGrp` | pinned files | `Cartesian/Grp.lean` lines 310, 312; `Cartesian/CommGrp_.lean` lines 44, 57, target `(Grp C)ᵒᵖ ⥤ CommGrpCat` | locators correct | none |

### Remark (no change asked)

- The board package's `sources.toml` records Poo17 with locator §6.8 and `cited_for` 8.13–8.16; the README now also cites its §§1.3–1.5 for the §8.2 Checks. The manifest is outside the reviewed folder and the text is certified and was read at the new locators.

## Not verifiable

- Nothing in the changed passages. The items of the previous report stand: SGA3 VIII–X (§§7.12a–7.12e), Aus62 Theorem 1.3 (§7.2), DF84 Remark 3 (§8.18) and Avr77 Proposition 3.6 (§1.2, the declared gap `ci-defect-additivity`) are uncertified and were read only through their uses in CS24 and C19.

## Source issues

- none
