# FIX-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~8

Review settled: `REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~7` (four findings: one P2,
three P3). Changed: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` and the VZ07
`locator` in `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml`. `Suggested.lean`,
`metadata.toml` and `design/plan.json` are unchanged. No gap was added; none is needed.

## F01 (P2) — applied

Verified. Suppose the norm groups are `π^ℤ U(K,m)` for every `m`. Then `Art_K` restricted to `K_π`
kills `π`, and `u ↦ χ_π(Art_K(u))` is some automorphism of `O_K^×` preserving every `U(K,m)`. The
geometric assignment `u ↦ u` has exactly these kernels, but it makes the unit formula false. The
implication does hold the other way: `u⁻¹ ∈ U(K,m)` iff `u ∈ U(K,m)`.

§2.5: "Equivalently, for every `m ≥ 0`" → "Consequently, for every `m ≥ 0`".

Same pattern checked: the other "equivalently" claims at §5.4 (stabilizer of `C_L` equals stabilizer
of `L`, since `T` is stable), §6.3 (`F^× = π_F^ℤ × O_F^×`) and §7.3 (`κ⁻¹(H)` pulls back to
`(−p)^ℤ H` because `H` is a group) are true equivalences. The Lean docstring's "that is, the norm
group … is" restates the iff correctly and needs no change.

## F02 (P3) — applied differently

Verified. In the Conventions, `F^ur` was the maximal subextension of `F/F₀` unramified over `F₀`, while `K^ur` means the
maximal unramified extension of `K` and §6.6 uses `F̂^ur` for its completion. For `F = ℚ₃(√3)`:
`F^ur = ℚ₃` in the first sense, but `F̂^ur ∋ √3` has residue field `𝔽̄₃`.

Conventions, §6.6, §7.2: `B = O_(F^ur)` → `B = O_(F ∩ F₀^ur)`, defined in Conventions as the
integers of the maximal subextension unramified over `F₀`, with residue field `k_F`. §6.6 also
names `F^ur` as the maximal unramified extension of `F`.

Why not the suggested `F_u`: the README already writes `F_f`, `F_g`, `F_(f′)` (24 times) for the
formal module of a series. `u` denotes a unit throughout, so `F_u` would read as "the module of
`u`". `F ∩ F₀^ur` follows the README's own `K^ur` convention.

## F03 (P3) — applied

Verified against the VZ07 text. Printed p.60 starts at VZ07 line 2794. Lemma 2.1 is at line 2799
and Definition 2.2 at line 2833, both on p.60. Printed p.59 (lines 2751–2793) holds only the proof
of Theorem 1.4. Lemma 2.6 (line 2859) is on p.61.

README §0.1: "Lemma 2.1 and Definition 2.2, pp.59–60" → "p.60". `sources.toml` VZ07: "pp.59–61" →
"pp.60–61".

I also checked the other VZ07 locators, and they stand: Theorem 1.4 (line 2739, pp.58–59);
Definition 2.2 and the height discussion (pp.60–61); (3.1)–(3.7) (lines 2878–2885, p.62);
Lemma 2.6 (p.61); Corollary 3.4 (line 2951), Lemma 3.5 (line 2976) and Proposition 3.6
(line 3000), pp.63–65; Theorem 3.8 (line 3021, p.65).

## F04 (P3) — applied

Verified. Layer 8's list omitted §2.2, which §8.5 needs. Mathlib items named in `*Needs:*` lines
were also missing from Layers 0, 2, 4 and 5. Changes:

- Layer 0: + Krasner's lemma, adic completions at a height-one prime, Tau Ceti formal-group
  homomorphisms and isomorphisms (§0.1).
- Layer 2: + Weierstrass preparation, `IntermediateField.adjoin`, `AlgebraicClosure`.
- Layer 4: + `WittVector`, `GaloisField`, Weierstrass curves.
- Layer 5: + Weierstrass preparation.
- Layer 8: "§§0.3, 1.4, 2.2–2.5, 4.4, 7.2–7.4", + Tau Ceti's local Artin map (§8.2, `artinMap_congr`).
- Layer 1: + coefficient reduction and monic polynomials (§1.1).

## Checks run

- **Elaboration.** From the content checkout I ran `lake env lean` on
  `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`. It exits with code 0. The
  only diagnostics are five `declaration uses 'sorry'` warnings, at lines 77, 91, 113, 129 and 151.
  No module needed building.
- **Signatures.** I elaborated a scratch copy with `#check @name` for all seven declarations.
  - Both predicates keep `CommRing` and `IsLocalRing`.
  - Both Layer 1 theorems keep `IsDomain`, `IsDiscreteValuationRing`, finite residue field and
    `Irreducible π`.
  - Both Layer 2 theorems keep `IsNonarchimedeanLocalField`, `CharZero K` and `Irreducible π`.
    The degree theorem also keeps `1 ≤ m`, and the norm-group theorem keeps `↑ϖ = ↑π`.
  - The Layer 4 theorem keeps `s = 1 ∨ s = -1`, `IsUnit W.Δ` and the point count.

  All match the README. No binder was lost, and nothing changed.
- **Layer lists.** A script compares each `*Needs:*` section with its layer's Dependencies. On the
  previous README it reports only Layer 8 missing §2.2. After the edits it reports nothing for any
  of Layers 0–9.
- **Citations.** The five "found nowhere" leads are `BarsottiTate.equivFormalLieGroup`,
  `BarsottiTate.quotientFiniteFlatSubgroup`, `BarsottiTate.tateModule`,
  `FormalLieGroup.evalPoints` and `FormalLieGroup.ofFormalGroup`. All five are planned names of
  FiniteFlatGroupsAndIntegralPadicHodgeTheory, present at its head (its README lines 44, 1196–1222
  and 1782). None is a defect.
- **Library names.** These were added by name to the Dependencies, and each exists at the pins:
  - `IsKrasner.krasner`: Mathlib `Analysis/Normed/Field/Krasner.lean:63`;
  - `IsDedekindDomain.HeightOneSpectrum.adicCompletion`: Mathlib
    `RingTheory/DedekindDomain/AdicValuation/Completion.lean`;
  - `PowerSeries.exists_isWeierstrassFactorization`: Mathlib
    `RingTheory/PowerSeries/WeierstrassPreparation.lean:814`;
  - `TauCeti.FormalGroupHom` and `TauCeti.FormalGroupIso`: Tau Ceti
    `RingTheory/FormalGroup/Hom.lean:137, 351`;
  - `TauCeti.ClassFieldTheory.artinMap_congr`: Tau Ceti
    `NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:397`.
- **Dependency direction.** Exact output:

```text
depcheck: 223 roadmaps, 1976 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- **Overlaps.** `scratch/overlaps.md` lists no open pull request that changes this roadmap and no
  dropped id. This round adds no construction and no new supplier, so ownership is as the review
  recorded it.

## Adversarial pass on the changed text

| Statement | Instances | Values | Result; change |
|---|---|---|---|
| §2.5 "Consequently" (unit formula ⇒ norm groups) | `m = 0`; `K = ℚ_p`, `π = p`, `m = 1`; geometric `u ↦ u` | `m = 0`: `π^ℤ × O_K^× = Kˣ`, all `x` fix the trivial tower. `m = 1`: `Art(p^r u)` acts on `ζ_p` by `u⁻¹ mod p`, trivial iff `u ≡ 1 mod p`, norm group `p^ℤ(1 + pℤ_p)`. Geometric map: same kernel `π^ℤ U(K,m)` for every `m`, unit value `u ≠ u⁻¹` for `u = 1 + p`, odd `p` | Implication holds, converse fails; "Equivalently" → "Consequently" |
| Conventions `B = O_(F ∩ F₀^ur)` | `F/F₀` unramified quadratic; `F = ℚ₃(√3)`, `F₀ = ℚ₃`; `F = F₀`; general `F/F₀` with `e`, `f` | `F ⊂ F₀^ur`, `B = O_F`, residue `k_F`. `e = 2`, `f = 1`: `F ∩ ℚ₃^ur = ℚ₃`, `B = ℤ₃`, residue `𝔽₃ = k_F`. `F = F₀`: `B = O₀`. General: degree `f` over `F₀`, residue `k_F`, which is `W_(O₀)(k_F)`, the coefficient ring for deformations over `k_F` | Holds; old symbol clashed with `K^ur` |
| §7.2 Checks using `B` (recomputed) | unramified quadratic; `ℚ₃(√3)`; BKO `F = Φ` | `B = O_F`, canonical modulus in `𝔪_B`. `B = ℤ₃`, `v_F(3) = 2 > 1 = v_F(canonical modulus)`. `B = O_Φ`, `v_Φ(t₁) = 1/(p+1)` | Agree with the new `B` |
| §3.1 Check `B = ℤ₃`, `F = ℚ₃(π)` | `π² = 3` | `F ∩ ℚ₃^ur = ℚ₃` | Agrees |
| §6.6 `F̂^ur` (now "of `F^ur` of `F`") | `F = ℚ₃(√3)` | `F^ur = ⋃ F(ζ_n)`, `3 ∤ n`; residue field `𝔽̄₃`; `e(F̂^ur/F) = 1` | Holds; one meaning per symbol |
| VZ07 locator | Lemma 2.1, Definition 2.2, Lemma 2.6 | VZ07 lines 2799, 2833, 2859; printed pp.60, 60, 61 | Corrected |
| Layer Dependencies (no statement changed) | script on old and new README | old: Layer 8 `[(2,2)]`, other layers empty; new: every layer empty | Complete |

## For the maintainer

- No name that another roadmap cites changed. Section numbers, targets and Lean names are as before.
- The symbol `F^ur` now means only the maximal unramified extension of `F`, and §6.6 says so. A
  consumer that quoted the Conventions sentence about `B = O_(F^ur)` should read
  `B = O_(F ∩ F₀^ur)`. `roadmaps grep --fixed 'O_(F^ur)'` finds no match on main or in any open
  roadmap pull request, and no board package README contains it.
- Ownership against open pull requests was checked only through `scratch/overlaps.md` and
  `roadmaps grep`, for the five name leads. This round introduced no new object.
- No suspicious instruction was found in the review text.
