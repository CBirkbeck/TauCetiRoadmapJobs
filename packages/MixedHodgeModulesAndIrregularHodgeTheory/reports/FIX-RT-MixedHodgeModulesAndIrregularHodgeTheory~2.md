# Repair report: FIX-RT-MixedHodgeModulesAndIrregularHodgeTheory~2

This round settles the seven findings of red-team passes `RT-MixedHodgeModulesAndIrregularHodgeTheory~2a` and `~2b`, both read at the head 52c7385. The two reviews do not overlap, so each finding has its own section. All seven findings hold, and all are applied. No section, layer or target id changed. `Suggested.lean` is unchanged. The only id that left the package is the supplier gap `gap:blowup-exceptional-divisor`, and no roadmap cites it.

The branch already carried two earlier repairs for this job. This pass re-verified each one against the cached sources, the sibling roadmaps and the pins. It made two precision edits, both in the README: the BE04 sentence in the 2.4 proof route (2a/F01) and the Saito locator in 4.3 (2b/F04).

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2a/F01 (P1) — applied

- **Old:** "by formal stationary phase".
- **New:** §2.4 now opens with **Theorem (regular formal stationary phase)**. For `N` regular holonomic and regular at `∞`, `FT N` is smooth on `G_{m,t}`, its germ at `∞` is `⊕ E^{ct} ⊗ R_c` with `rank R_c = rank(T_c − 1)`, and it is regular at `0`. The theorem builds `F^{(0,∞)}`, its model and the comparison at `t = ∞` (BE04, Sab08). `ℱ` and 9.7 consume it.
- **This pass:** the route had cited BE04 Lemma 2.4, which states the vanishing only at a regular point at `∞`, for slopes `≤ 1`. The route now gives the argument: lattices `V ⊂ V(∞)` (Lemma 3.3), with `dτ` generating the forms with a pole at `∞`.
- The source key is `Sab08`, not the proposed `SabStationary`, because the resolver reads CamelCase keys as roadmap names.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2a/F02 (P3) — applied

- **§4.1 definition:** "compatible when … exact" now adds that two filtrations are always compatible, and that for vector spaces compatibility is distributivity of the generated lattice (Sai88 lines 353–363 and 739–757).
- **Three Checks added**, with their distributivity values:
  - coordinate planes in `ℂ³`: `2 = 2`;
  - three lines in `ℂ²`: `1 ≠ 0`, not compatible;
  - repeated steps: `1 = 1`.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F01 (P2) — applied

- **Old:** `gap:blowup-exceptional-divisor` (SchemeAndStackFoundations §5.5).
- **New:** ResolutionOfSingularitiesCharacteristicZero §1.5, applied to the marked ideal `(I_Ξ, 1)`. It is on main and its API bullet at line 140 reads "A permissible blowup has smooth ambient space and updated SNC boundary". The new citation appears in Scope, the contracts, 8.8, 8.10 and the Dependencies.
- **Deleted:** the gap's contract, its `design/plan.json` entry and the unused SchemeAndStackFoundations §5.5.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F02 (P3) — applied

The vacuous Checks were replaced, and each replacement was recomputed:
- §2.3: `M ⋆ 0 = 0` → `δ_a ⋆ O = O`, with no `Tor₁`;
- §6.1: the zero object → `j_*L[1]` with `T = −1`, which lies in `EMHS`;
- §6.3: `E ⊗_E 0 = 0` → `K ⊗^H K = K[1]`, whereas `K ⊗_E K = K`;
- §7.4: the empty statement → the jump `1/2` of the `x²` summand;
- §2.4: `ℱ(0) = 0` deleted; three Checks remain.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F03 (P3) — applied

- **8.10:** its Needs and Dependencies gain SchemeAndStackFoundations §4.11, SchemeKTheoryOperations §5.7 and ResolutionOfSingularitiesCharacteristicZero §1.5.
- **7.3:** "Hodge-norm estimates of 3.2" → "of ShimuraVarieties §3.5b.2, applied on the power cover of 3.2". That section is added to its Needs and Dependencies.
- **Same pattern elsewhere:** every Dependencies clause matches its Needs line (4.4, 5.3, 6.7 aligned).

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F04 (P3) — applied

- **Old:** "treated by the Kashiwara clause".
- **New:** for `g ≡ 0` on the strict support, Kashiwara's equivalence (SpringerResolutionAndCharacteristicCycles §9.2) gives `ψ_g M = 0`, `φ_{g,1} M = M` and `N_φ = 0`. The condition is therefore circular in the induction and automatic in Saito's largest-family form.
- **This pass:** added Sai88 Lemma 5.1.8, p. 957, Sai88 lines 3395–3400. That lemma restricts the condition to strict-support summands that are points or on which `g` does not vanish identically.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F05 (P3) — applied

- **Kash84:** "§7, pp. 355–358" → "pp. 355–359". The running heads are p. 355 at line 1143 and p. 359 at line 1255, and §8 begins at line 1271.
- **MT in References:** "pp. 34–40" → "pp. 35–40". The appendix begins at MT line 1952, after the p. 35 marker at line 1938.
- **Same pattern elsewhere:** 9.8's "pp. 36–40" is correct, since Lemma A.2 is at line 2013 on p. 36 and the proof ends at line 2178 on p. 40. 2.2's MT citation, lines 2104–2107, is on p. 39.

## Checks

- **Elaboration.** I ran `lake env lean packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean` from the content checkout. It gives only `157:8: warning: declaration uses 'sorry'`, with exit 0. The only import is `import Mathlib`, so nothing needed building.
- **Signatures.** I put the file with `#check @name` for all 13 declarations in one scratch file and elaborated it once. Every elaborated type is identical to the supplied table and matches its README statement (10.1, 10.3). No binder was lost and nothing changed.
- **Dependency check:** `depcheck: 244 roadmaps, 2228 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that is found nowhere.
- **Gaps.** Six slugs remain, the same six in `design/plan.json` and in the README.
- **Gate failures:** none were listed.

## Adversarial pass (statements changed or re-verified)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.4, stalk at `τ = ∞` for slopes `≤ 1` (edited) | regular at `∞`; slope 1; slope `1/2`; `E^{τ²}` | `V = W ⊂ V(∞)`; `W = V(∞)`; `W ⊊ V(∞)`; `dτ = −z⁻¹·dz/z`, so `V ∧ dτ` is the log forms twisted by `V(∞)`, which contain `∇V`. `FT E^{τ²} = D/D(2∂_t + t)`, slope 2, germ nonzero with `S = ∅`, `V(∞) ⊊ W` | holds for slopes `≤ 1`; the bound is necessary |
| 2.4 (b), rank `rank N + m_c(K) − m_c(C)` | `O(∗0)`, `j_!O_{G_m}`, `O`, `j_!O_{A¹∖{0,1}}`, Kummer | `1+0−0`, `1+1−1`, `1+0−1`, `1+1−1` at each of `c = 0, 1`, `rank(T_0 − 1) = 1` | equals `FT` ranks `1, 1, 0, 2, 1`; agrees with Sab08 (5.17), Sab08 lines 1024–1041 |
| 2.4 conventions | `δ_c`, kernel `E^{tτ}` against BE04 Def. 3.1 and Sab08 | BE04 `t′ = −∂_t`, `∂_{t′} = t` (lines 196–200), as in 2.2; Sab08 `τ = ∂_t`, `∂_τ = −t`, kernel `e^{−tτ}` (lines 25–30) | `FT δ_c = E^{ct}`; Sab08 is read through `t ↦ −t` |
| 2.4 `F^{(0,∞)}` rank and slope | `El(u, u⁻¹, ℂ)` (`p = q = 1`) | slope `q/(p+q) = 1/2 = σ/(1+σ)`, rank `2 = 1 + 1` (Sab08 lines 663–668; BE04 line 487) | holds |
| 4.3, Lemma 5.1.8 (edited) | `δ_0`, `g = x`; `pℚ_{A¹}`, `g = x`; `i_*pℚ_{y=0}` on `A²`, `g = y` | point support: `φ_{x,1}δ_0 = δ_0` is the Hodge structure `ℚ`; `ψ_x = ℚ` of weight `0 = w − 1`, `φ_1 = 0`; `g` vanishes on `Z`, `dim Z = 1`, excluded, `φ_{y,1}M = M` | the README's induction agrees with Lemma 5.1.8 |
| 4.1 compatibility | planes in `ℂ³`; three lines in `ℂ²`; `A = B` | `(2, 2)`, `(1, 0)`, `(1, 1)` | distributive; not distributive; distributive |
| 2.3 `δ_a ⋆ O`, `O ⋆ O` | `a = 0, 2` | `E^{at} ⊗^L δ_0 = δ_0`; `δ_0 ⊗^L δ_0 = δ_0[1]`, so `O ⋆ O = O[1]` | one factor stays in degree 0, two do not |
| 6.1 `j_*L[1]`, `T = −1` | `H⁰ = ker(−2)`, `H¹ = coker(−2)` | `0`, `0` | in `EMHS`, simple, not a `δ_a` or constant factor |
| 6.3 `K ⊗^H K` | `Δ^*(j × j)_!ℚ[2]` | `j_!ℚ[2] = K[1]`, against `K ⊗_E K = K` | differ on the unit |
| 7.4 jump `1/2` | `x²` summand | `F^λ_irr = ℂ` exactly for `λ ≤ 1/2`; `a = −λ`: `0 → ℂ` for `a < −1/2` | agrees with the 8.9 and 8.10 Checks |
| ResolutionOfSingularitiesCharacteristicZero §1.5 in 8.8 and 8.10 | `Bl_0 A²`, `(I_0, 1)`; `D₁ ∩ D₂` | cosupport `{0}`, a coordinate stratum; a boundary stratum (§1.5 allows centres inside a component) | permissible, so smooth with SNC boundary |
| 7.3 citation | frame norm `\|t\|^{1/2}`, index `1/4` | `⌈1/4 − 1/2⌉ = 0` against `⌈1/4⌉ = 1` | unchanged |
| Kash84 and MT page ranges | running heads and markers | p. 353 at line 1083 (§6 at line 1101), p. 359 at line 1255; MT p. 35 at line 1938, p. 40 at line 2146 | pp. 353–355, 355–359; pp. 35–40, 36–40 |

## Locators and citations checked this round

- **Source lines read:**
  - BE04 lines 100–200, 240–320 and 470–500;
  - Sab08 lines 14–80, 300–336, 645–670, 895–945 and 1015–1045;
  - Sai88 lines 345–366, 735–760 and 3340–3400;
  - Kash84 page heads at lines 1083–1286;
  - MT lines 1938–2180.
- **Supplier sections, on main:** ResolutionOfSingularitiesCharacteristicZero §§1.3–1.5, and SchemeAndStackFoundations §§4.9, 4.11, 4.12 and 4.17.
- **Supplier sections, through `roadmaps show`:** SchemeKTheoryOperations §5.7, ShimuraVarieties §§3.5b.1–3.5b.2 and SpringerResolutionAndCharacteristicCycles §§9.2 and 9.5.

## For the maintainer

- **Ownership.** I searched main and the 474 open heads by object: "stationary phase", local Fourier and Laplace transforms, Bloch–Esnault, `F^{(0,∞)}` and Fourier–Laplace. There are two kinds of hit:
  - harmonic-analysis local Fourier transforms;
  - the ℓ-adic local Fourier transforms of FourierDeligneTransform §5.6, a different object.

  No roadmap owns the `D`-module local Fourier transforms, so this roadmap owns the regular formal stationary phase of 2.4.
- **A consumer's gap.** The board package KloostermanMomentsAndPotentialAutomorphy declares `gap:irregular-stationary-phase` against this roadmap's former Layer T, now §§9.3–9.8. It asks for an irregular-input statement that is wider than the regular theorem 2.4. No finding of this round asks for it, so it was not added. Whether this roadmap or a Part II supplies it is for the two packages' owners to decide.
- **Downstream.** The ids of 2.4 and 9.7 are unchanged and the former-numbering map is untouched, so the roadmaps that cite this one still resolve.
- **Open pull request.** The content repository's open pull request for this same roadmap carries an older text. One of the two must be rebased on the other before either merges.
- **Sources.** No new source was needed. The manifest's 25 entries match the 25 References, and no `needs-references.toml` was written.
