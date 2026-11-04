# FIX-PKG-KatoEulerSystems~4

Repair of the eight findings of the round-3 review of the `KatoEulerSystems` package. Files changed:
`packages/KatoEulerSystems/README.md`, `packages/KatoEulerSystems/Suggested.lean`,
`packages/KatoEulerSystems/sources.toml`. `design/plan.json` and `metadata.toml` are unchanged
(`"gaps": []` stays correct: no new supplier gap).

## F01 (P2) — applied

Verified: `EllipticCurveModularity` (merge order line 186, before this roadmap at line 248) states
unconditional modularity of every E/ℚ in Layer R29.6, "The three equivalent modularity formulations",
and `modularity` in its `Suggested.lean`. So the binder `hmod` always holds.

- `Suggested.lean`: `hmod` deleted from `ellipticCyclotomicFiniteGeneration` and
  `ellipticCharacterPoints_finite`; "modular" and the q-expansion sentence removed from their docstrings; the
  q-expansion clause of the module docstring replaced by "no modularity hypothesis … (EllipticCurveModularity, R29.6)".
- README §7.9: "Its modularity hypothesis is …" → "No modularity hypothesis is made: `EllipticCurveModularity`
  R29.6 supplies the attached newform"; "same nonsingularity and modularity hypotheses" → "every elliptic W over ℚ" (twice);
  zero-cusp-form half of the Check deleted, the `y² = x³` half kept.
- Pattern: "Let E/ℚ be modular" → "an elliptic curve" in 6.6, 7.3, 7.4, 7.6, 7.7, 7.8. R29.6 was added to the
  *Needs:* of 6.6 (R29.4–R29.5 → R29.4–R29.6), 7.3, 7.4 and 7.8, and to the Layer 6 Dependencies. The
  supplier contract "From EllipticCurveModularity" now names 6.6 and 7.3–7.8. Modularity is not used by
  the routes of 7.6 and 7.7 (it enters 7.6 only through 7.4), so their *Needs:* are unchanged.

## F02 (P2) — applied

Verified: the source places Theorem 2.3.1 in Loeffler's group of pairs `G(ℚ̂)`, defined in Definition 1.2.1
(`Loeffler2017` line 128), with the theorem at line 289 and the
reduced norm `χ^(1−k)` on H at line 282. At k = 3, `[ℤ_p^× : (ℤ_p^×)²] = 2` at every odd p, so the old clause was false.

- 4.1: "the image of H is open in the group of units of `B ⊗ ℚ̂` whose reduced norm lies in `ℚ̂^×`" →
  "the image of H under `(ρ_f, κ̂)` is open in Loeffler's group `G(ℚ̂) = {(x,λ) : nrd x = λ^(1−k)}`; in particular,
  for each p, open in `{x ∈ (B⊗ℚ_p)^× : nrd x ∈ ℚ_p^×}`". Locators are now Def. 1.2.1, p. 3, and Thms 2.2.2 and 2.3.1, p. 6.
  A sentence and a Check now say why the adelic version fails for k ≥ 3.
- Per-prime clause proved: an open subgroup of the restricted product projects onto an open subgroup of
  `G(ℚ_p)`. The projection `(x,λ) ↦ x` is onto `{nrd x ∈ (ℚ_p^×)^(k−1)}` with finite kernel `μ_(k−1)(ℚ_p)`, and
  `(ℚ_p^×)^(k−1)` has finite index in `ℚ_p^×`. admissible_of_split and 4.7 use only this clause and are unchanged.
- Pattern: no other occurrence (`ℚ̂` and "reduced norm" occur only here).

## F03 (P2) — applied differently

The defect is real: 5.6's uniqueness comes from 5.5, whose injectivity carries the admissibility proviso, and
6.2/6.4 use `z^Ka` of 5.1. The repair differs from the suggestion in two points:

- **5.6.** The proviso is attached to the uniqueness clause only. Existence of the property is Nakamura's
  Theorem 3.2 (`Nakamura2023` lines 1941–1962, no admissibility) transported by `s_N`, so it needs no proviso.
- **Layer 6.** The new preamble requires admissibility in 6.2 and 6.4 only, not in "6.2–6.5". 6.1 and 6.3
  involve no zeta class, and 6.5 only restricts the domains of 6.2–6.4.

Changes:

- **Layer 5 preamble:** "Throughout this layer" → "Throughout 5.1–5.4"; 5.5–5.6 state their own proviso.
- **5.6:** the uniqueness proof (two lines) is now written out, `PadicFamilies` §4.0.2 is added to its
  *Needs:*, and a negative-control Check is added.
- **Layer 6:** the preamble proves `(f,λ)` admissible ⇔ `(f*,λ)` admissible, by the contragredient
  action on `G_(ℚ(μ_(p^∞)))`, where κ is trivial.
- **6.2, 6.4, 6.5:** 6.2 opens with "Let (f,λ) be admissible", 6.4 says "For admissible (f,λ)", 6.5 notes
  the restriction, and a negative-control Check is added to 6.2.

## F04 (P3) — applied

Verified in Lean (scratch file, not in the package). `LSeries (fun n => W.LFunction n * (1 : DirichletCharacter ℂ 1) n) s = W.LSeries s`
elaborates (by `MulChar.one_apply (isUnit_of_subsingleton _)`), and every `DirichletCharacter ℂ 1` equals 1
(`Subsingleton.elim`). At m = 1 the group ring is ℤ and `I_ψ = 0`, so the character part is all points. The theorem
`ellipticRationalPoints_finite` is deleted from `Suggested.lean` and from the module docstring. README §7.9 describes the
`K = ℚ, χ = 1` case in prose, as the case `m = 1` of the character-part signature, without a backticked name; the m = 1 Check stays.

## F05 (P3) — applied

Verified: Kato 15.13 assumes K ⊄ ℚ(ζ_(p^∞)) (`Kato2004` line 5704); 15.14 treats the contained case (line 5731).
`ζ₈ + ζ₈³ = i√2`. 4.4: "`K = ℚ(i)` at `p = 2`" → "`K = ℚ(i)` or `ℚ(√−2)` at `p = 2`", and a Check is added
computing `ζ₈ + ζ₈³` and the unique quadratic subfield `ℚ(√p*)` for odd p. There is no other enumeration
(the 4.1 mention of 15.14 lists no fields).

## F06 (P3) — applied

The four Checks now name objects: "range of modularDualExp" → "range of the restricted modular dual
exponential" (3.1); "`a_1 = W.LFunction(1) = 1`" is deleted with the F01 half-Check; "bound of
katoTamagawaBound (3)" → "Tamagawa bound of part (3)"; "union in modularAbelianVariety_cyclotomicFG" →
"union of the m-power cyclotomic layers". A scan of every Checks block for camelCase or snake_case target
names now finds only roadmap names (`PadicFamilies`, `ModularSymbolsPadicLFunctions`).

## F07 (P3) — applied

- **Kato References** (now matching the manifest): added 2.1 (p. 125), §7 with 7.7, 7.12 and 7.18–7.20
  (pp. 163–178), 8.4 (pp. 182–183), 8.12 (p. 186), 10.9 (pp. 196–197, the diagram (10.9.5) cited in the
  §4.0.2 contract), 12.10 (p. 224), 15.23 (p. 267) and 17.2 (p. 272). Pages come from the source's page markers.
- **Kato manifest locator:** the same list with pages; the uncited 16.1 is dropped.
- **`Rohrlich1984`:** `cited_for = ["7.9"]`.
- **5.6:** "(19), p. 48" → "(19), p. 46, used in the proof of Corollary 3.6, p. 48" (`Nakamura2023`
  lines 2037 and 2120).

The same audit, applied to every manifest entry against the README body, gave these further changes:

- **`Nakamura2023`:** `cited_for` "5.4–5.5" → "5.4–5.6"; locator gains Theorem 3.2, (19) and Conjecture 5.1.
- **`Rubin2000`:** `cited_for` gains 4.1 and 4.6–4.7; locator and References gain Lemma I.5.3 (p. 12) and
  Chapter II §3 (pp. 27–28).
- **`Loeffler2017`:** `cited_for` "4.1, 4.7"; locator and References now list items (A)–(B), Definition 1.2.1,
  Remark 1.2.4 and Theorems 2.2.2–2.3.1. The uncited Corollary 2.2.3 and item (C) are dropped.
- **`BurungaleTian2025`:** `cited_for` "4.4, 7.2" → "4.4, 7.1", the section that cites it.
- **`PerrinRiou1994`:** it was listed for 6.1 but cited nowhere in the body. 6.1 now attributes the
  crystalline map to it; the entry stays `uncertified`, cited by its locator.

## F08 (P3) — applied

Module docstring: "The Selmer χ-part still lacks its elliptic Selmer carrier." → "The Selmer χ-part
(Corollary 14.3(1)) lacks the `p^∞`-Selmer group of E over K; Tau Ceti's `selmerGroup₂` is the 2-Selmer
group, finite without any L-value hypothesis."

Verified at the pins:

- Tau Ceti `selmerGroup₂` (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` line 104)
  is the 2-Selmer group.
- No p^∞-Selmer carrier for elliptic curves exists in Tau Ceti or Mathlib. Mathlib's Selmer files are
  `RingTheory/DedekindDomain/SelmerGroup.lean` and polynomial files.
- Kato 14.3(1) is the Selmer part and (2) the Mordell–Weil part (`Kato2004` lines 4613–4614).

## Checks run

- **Elaboration** (`lake env lean packages/KatoEulerSystems/Suggested.lean`, from the content checkout at the
  pins): exit 0. Exactly two warnings, `declaration uses sorry`, at lines 36 and 60. Imports: `import Mathlib`
  and `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois`. No `set_option`; one `def` with a real body.
- **`#check @` comparison**, done mechanically in one scratch file:
  - `ellipticCyclotomicFiniteGeneration : ∀ W [W.IsElliptic] (m : ℕ), 1 ≤ m → AddGroup.FG (…).toAffine.Point`
  - `ellipticCharacterPart : (W) → [W.IsElliptic] → (K : Type u_1) → [Field K] → [DecidableEq K] → [Algebra ℚ K] → (Gal(K/ℚ) →* ℂ) → Set …`
  - `ellipticCharacterPoints_finite`: `[W.IsElliptic]`, `[NeZero m]`, `[IsCyclotomicExtension {m} ℚ K]`, χ, F, `hF`, `hcont`, `hne`.

  No binder was lost. The only change is the intended removal of `hmod`; each type matches README §7.9.
- **Dependency check**, verbatim: `depcheck: 52 roadmaps, 597 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Citation resolver:** "Cross-roadmap citations found nowhere: None"; "Lean names found nowhere: None".
- **Sources:** every locator was read in the cached texts. No new source was fetched and no
  `needs-references.toml` was written. `PerrinRiou1994` and `Rohrlich1984` stay `uncertified` and are cited by locator.
- **Gate failures listed in the brief:** none.

## Adversarial pass (changed or added statements)

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Tower FG without `hmod` | every E/ℚ; m = 1; m = 0 | R29.6 gives a newform for every E; m = 1: `x^(1^n)=1 ⇔ x=1`, field ℚ, Mordell–Weil; m = 0, n ≥ 1: `x^0 = 1` for all x, field ℂ, `E(ℂ)` uncountable | holds; `hm` needed | `hmod` deleted |
| 2 | Character finiteness without `hmod` | 11a1 at m = 1; 37a1 | `L(E,1) ≈ 0.2538 ≠ 0`, `E(ℚ) ≅ ℤ/5` finite; 37a1: `L(E,1) = 0`, so `hne` fails | holds; `hne` needed | `hmod` deleted |
| 3 | m = 1 specialization | Lean scratch | series `= W.LSeries s` (elaborates); `χ = 1` by `Subsingleton.elim`; `I_ψ = 0`, part = all points | deleted theorem is the m = 1 case | F04 |
| 4 | 4.1 adelic, old form | k = 2; k = 3; k = 4 | k = 2: nrd image `κ̂(H)^(−1)` open in ℤ̂^× (old claim true); k = 3: index 2 at every odd p (infinitely many); k = 4: index 3 at p ≡ 1 mod 3 | false for k ≥ 3 | replaced |
| 5 | 4.1 per-prime clause | k = 3, p odd; p = 2 | `[ℚ_p^× : (ℚ_p^×)²] = 4` for odd p and `8` for p = 2, both finite; kernel of `(x,λ) ↦ x` is `μ_2(ℚ_p) = {±1}` | open | new statement, new Check |
| 6 | 4.1 SL-part used by admissible_of_split | H ∩ ker det | det on H is `κ̂^(1−k)`; det = 1 ⇒ `κ(σ)^(k−1) = 1`, a finite set, so it contains `H ∩ G_(ℚ(μ_(p^∞)))` with finite index | unchanged | none |
| 7 | 4.4 CM fields at p = 2 | ℚ(ζ₈) | `ζ₈ + ζ₈³ = (1+i)/√2 + (−1+i)/√2 = i√2`; `ζ₈ + ζ₈^(−1) = √2`; `ζ₈² = i`; (ℤ/2^n)^× has 3 index-2 subgroups | ℚ(i), ℚ(√−2) imaginary; ℚ(√2) real | F05, Check |
| 8 | 4.4 CM fields, odd p | p = 3, 5, 7 | `p* = −3, 5, −7`; imaginary for 3 and 7 (≡ 3 mod 4), real for 5 | matches | Check |
| 9 | 5.6 uniqueness | difference d | `per(ω_m(d)) = 0` ⇒ `ω_m(d) = 0` (by (19)) ⇒ twisted d has zero exp* limit ⇒ d = 0 (by 5.5, admissible) | needs proviso | F03 |
| 10 | 5.6 without injectivity | `Λ ⊕ Λ/(T) → Λ` | projection is 0 on `(0,1̄) ≠ 0` | uniqueness fails | Check |
| 11 | 5.6 existence | Nakamura Thm 3.2 | no admissibility in its hypotheses (N ≥ 3, n prime to Np) | unconditional | stated |
| 12 | (f,λ) ⇔ (f*,λ) admissible | unipotent x = 2; `diag(1,ζ)`; identity | contragredient `[[1,0],[−2,1]]`: fixed space `{a = 0}`, dim 1 = dim 1; `diag(1,ζ^(−1))`: dim 1 = 1; identity: 2 = 2 | equivalent | Layer 6 preamble |
| 13 | 6.2/6.4 hypothesis | division place λ₀ | `d − 1` invertible for `d ≠ 1` in `B_(λ₀)`; no `ρ(H)` fixed vector, admissibility not established | excluded by hypothesis | Check |
| 14 | 6.3 needs no admissibility | Gauss-sum Check | `G(χ,ζ₃) = i√3`, `G² = −3 = χ(−1)·3`, independent of zeta classes | unchanged | none |
| 15 | 7.9 nonsingular Check | `y² = x³` | Δ = 0; `(x,y) ↦ x/y` gives `E_ns(ℚ) ≅ (ℚ,+) ∋ 1/n` | not FG | kept |
| 16 | 6.6–7.8 without "modular" | 11a1, p = 3 | modular by R29.6 (level 11); `c_∞ = 1` (Δ = −161051 < 0), so `Ω = Ω⁺` and `r_E = r_E⁺` | statements unchanged in content | wording, Needs |
| 17 | References pages | Kato markers | 8.4 at printed 182 (line 2548), 8.12 at 186 (line 2715), 15.23 at 267 (line 5833), 17.2 at 272 (line 6040), 7.20 at 178 (line 2414), Conj. 12.10 at 224 (line 4165), 10.9 at 196 (line 3071) | recorded | F07 |
| 18 | Nakamura (19) page | markers | display at line 2037 after the p. 46 marker (line 2031); use at line 2120 after the p. 48 marker (line 2113) | p. 46 / p. 48 | F07 |

## Ownership and suppliers

No construction was added. `EllipticCurveModularity` is cited by name and section (R29.6), at the head of its
open pull request, and is earlier in the merge order. `PadicFamilies` §4.0.2 (added to 5.6 *Needs:*) is an
existing supplier. A search of main and of all 363 open heads for `ellipticRationalPoints_finite` and the
other three Lean names found no citation outside this package.

## For the maintainer

- **Deleted name.** `TauCetiRoadmap.KatoEulerSystems.ellipticRationalPoints_finite` is gone. No other roadmap cites it.
- **Changed signatures.** `ellipticCyclotomicFiniteGeneration` and `ellipticCharacterPoints_finite` lost their
  `hmod` argument, so explicit-argument uses shift by one position.
- **Stronger statements for consumers.** 6.6 and 7.3–7.8 no longer assume modularity.
  `HeegnerPointEulerSystems` §6.9 (consumer of 6.6, 7.4, 7.7) receives stronger statements; nothing it cites was renamed.
- **Source issue** (not settled here, outside this package). Nakamura's proof of Corollary 3.6 cites
  Lemma 3.4 (1) (`Nakamura2023` line 2114), but uniqueness uses the injectivity of Lemma 3.4 (2). The
  README's route uses 5.5's injectivity, which is (2).
