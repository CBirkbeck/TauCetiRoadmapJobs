# Review of EllipticPeriods (pull request #1059 at dfb30e3)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/EllipticPeriods/README.md` and `TauCetiRoadmap/EllipticPeriods/Suggested.lean` at the head. The gate fails (prnum 3, residue 4, readme-ids-missing 3; build, depcheck, sorry-data and set_option clean), so no acceptance was possible this round; the blocking findings are R01–R04. The pull request changes nothing outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). The mathematics of the layers is sound apart from R03 and R04: the Legendre sign, the Eisenstein dictionary constants, the identification `η(1) = G₂(τ)` with Mathlib's symmetric `G2`, the Laurent recursion, the CM quasi-period relation and the Chudnovsky reduction were all recomputed (table below).

## R01 (P1) — six Lean statements quantify over an arbitrary complex `π`

Location: `TauCetiRoadmap/EllipticPeriods/Suggested.lean` line 28 (`open Complex`) and lines 152, 156, 161, 178, 199, 249.

Claim: `chudnovsky`, `det_periodMatrix`, `g₂_ofUpperHalfPlane`, `g₃_ofUpperHalfPlane`, `quasiPeriod_ofUpperHalfPlane_one` and `two_pi_I_mem_periodField` are stated with the number `π`.

Witness: the file opens `Complex` but not `Real`, so `π` is not the notation for `Real.pi` and Lean auto-binds it. `#check @chudnovsky` elaborates to `∀ {π : ℂ} {L : PeriodPair}, … → AlgebraicIndependent ℚ ![l / π, quasiPeriod L l / π]`; likewise `@det_periodMatrix : ∀ {π : ℂ} (L : PeriodPair), 0 < (L.ω₂ / L.ω₁).im → (periodMatrix L).det = -(2 * π * I)`, and the other four carry the same `{π : ℂ}` (the worker's signatures file shows all six). Instances: with `π := l`, `chudnovsky` asserts that `![1, η(l)/l]` is algebraically independent, but `1` is algebraic, so the statement is false for every lattice with algebraic invariants; with `π := 0`, `det_periodMatrix` asserts `det = 0`, while the determinant is `∓2πi ≠ 0`, and `g₂_ofUpperHalfPlane` asserts `g₂(ℤ + ℤi) = 0`, contradicting `g₂³ − 27g₃² ≠ 0` with `g₃(ℤ[i]) = 0`; with `π := 0`, `two_pi_I_mem_periodField` is the trivial `0 ∈ periodField L`.

Repair: add `open scoped Real` after `open Complex` (or write `Real.pi`). Tested on a copy of the file: after the change `#check @chudnovsky` gives `∀ {L : PeriodPair}, IsAlgebraic ℚ L.g₂ → IsAlgebraic ℚ L.g₃ → ∀ {l : ℂ}, l ∈ L.lattice → l ≠ 0 → AlgebraicIndependent ℚ ![l / ↑π, quasiPeriod L l / ↑π]` with `↑π` the cast of `Real.pi`, and the other five lose the `{π : ℂ}` binder; the file still elaborates with `sorry` as the only warning.

## R02 (P2) — `quasiPeriod` is sorry'd data standing in for ModularCurvesPartII's `latticeQuasiPeriod`

Location: `TauCetiRoadmap/EllipticPeriods/Suggested.lean` lines 119–127 (`weierstrassZeta_sub_periodic`, `quasiPeriod`) and the module docstring lines 15–21.

Claim: `quasiPeriod L l := Classical.choose (weierstrassZeta_sub_periodic L l)`, where `weierstrassZeta_sub_periodic` is a sorried existence statement; the docstring says it "stands for" `latticeQuasiPeriod` and is defined "only so that this file compiles".

Witness: the value of `quasiPeriod` is specified by nothing until the sorried theorem is proved (its body is a choice over an unproved `∃`), yet every headline in Layers 3–5 (`det_periodMatrix`, `periodField`, `exists_quasiPeriod_mul`, `chudnovsky`, the three `trdeg` theorems) is stated through it. This is the "sorry'd data definition / stand-in" the Lean form excludes, and the object is owned by ModularCurvesPartII §1.4a (`latticeQuasiPeriod`, read at the #913 head, README line 502).

Repair: give `quasiPeriod` a real body on the carrier this roadmap owns, `quasiPeriod L l := weierstrassZeta L (L.ω₁ / 2 + l) - weierstrassZeta L (L.ω₁ / 2)` (`ω₁/2 ∉ Λ` is Mathlib's `PeriodPair.ω₁_div_two_notMem_lattice`), delete `weierstrassZeta_sub_periodic`, keep `weierstrassZeta_add_coe` as the theorem that the difference is independent of the base point, and say in the README's Layer 2 and in the docstring that `Suggested.lean`'s `quasiPeriod` is this specialisation, identified with ModularCurvesPartII's `latticeQuasiPeriod` by the target `weierstrassZeta_eq_logDeriv_latticeSigma`. Tested: the copy with this body elaborates (`quasiPeriod : PeriodPair → ℂ → ℂ`, no `Classical.choose` left, `sorry` the only warning).

## R03 (P2) — the Summary claims `trdeg ≥ 2` "always"

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 7–10: "the period field has transcendence degree at most `4`, at most `2` with complex multiplication, and at least `2` always (Chudnovsky's theorem …)".

Claim: the lower bound holds for every lattice.

Witness: `L = π • ofUpperHalfPlane I` (lattice `πℤ[i]`). By the roadmap's own Layer 2 Check `η_{ℤ[i]}(1) = π`, scaling gives `η_L(π) = π⁻¹ · π = 1` and `η_L(πi) = π⁻¹ · (−iπ) = −i`, so `periodField L = ℚ(π, πi, 1, −i) = ℚ(π, i)` has transcendence degree `1`. Layer 5 (line 302) and `two_le_trdeg_periodField` correctly assume `IsAlgebraic ℚ L.g₂`, `IsAlgebraic ℚ L.g₃`.

Repair: in the Summary write "at least `2` when `g₂, g₃` are algebraic" (the upper bounds need no hypothesis: `≤ 4` always; `≤ 2` with CM holds for every CM lattice by scaling to an algebraic model, and the Lean statement's hypotheses are then merely unused).

## R04 (P2) — Layer 4 uses the Layer 1 descent under a hypothesis it only derives afterwards

Location: `TauCetiRoadmap/EllipticPeriods/README.md` lines 183–187 (the descent clause of the structure theorem) and lines 269–273 (`exists_weierstrassP_mul_eq`).

Claim: the Layer 1 descent needs "the poles of `f` sit at points `p` with `℘(p)` algebraic over `K`"; Layer 4 applies it to `f(z) = ℘(αz)` and then concludes "Consequently `℘(p)` is algebraic for every `p ∈ α⁻¹Λ ∖ Λ`".

Witness: the poles of `℘(αz)` are exactly the points of `α⁻¹Λ`, so the hypothesis of the cited descent is the conclusion drawn from it; as written the route is circular, and nothing else in the roadmap (nor Mathlib at the pin) supplies the algebraicity of torsion values `℘(p)`. The same circularity occurs for `α = N ∈ ℤ` (multiplication formulas).

Repair: drop the pole hypothesis from the Layer 1 descent, which is not needed: for `f` meromorphic at `0` with Laurent coefficients in `K ⊇ ℚ(g₂, g₃)`, the identity `P(℘(z)) − f(z) Q(℘(z)) = 0` as a Laurent series at `0`, for `P, Q` of degree at most the degree of a complex solution, is a homogeneous linear system over `K` in the coefficients of `P, Q` (the Laurent coefficients of `℘^j` lie in `ℚ[g₂, g₃]` by `G_mem_adjoin`); its complex solution space is the base change of the one over `K`, so a nonzero solution over `K` exists, `Q ≠ 0` because `℘` is nonconstant, and the identity theorem extends the equality to `ℂ`. State the Layer 1 clause with only the Laurent hypothesis, and in Layer 4 derive `℘(p)` algebraic afterwards from `Q(℘(p)) = 0` (`Q` nonconstant since `℘(αz)` has a pole at `p`). Checked on `α = 2`, `Λ = ℤ[i]`: the duplication formula has coefficients in `ℚ(g₂, g₃)`, and `℘(ω₁/2) = e₁` is a root of its denominator.

## R05 (P3) — pull-request numbers and a wrong roadmap name in the README and docstring

Location: README lines 11, 54, 60–61, 65, 70, 72–73, 124, 128, 153, 188, 199, 209, 230, 320, 336 (`#913`, `#849`, `#1254`, `#848`, `#1313`, `#1496`, `#451`); `Suggested.lean` lines 15, 124; README lines 80, 110, 226, 322 (`DiophantineApproximation`).

Claim: suppliers are cited by pull-request number; the Nesterenko owner is called `DiophantineApproximation`.

Witness: the gate's `prnum` rule (three lines flagged, more exist); the roadmap on main is `DiophantineApproximationAndTranscendence` and the citation tool resolves `DiophantineApproximation §5.6` nowhere.

Repair: cite by roadmap name and section only ("ModularCurvesPartII §1.4a", "AbelianSchemesAndArithmeticModuli A5.1", "ComplexComparisonPartII C5.1", "MotivesAndAlgebraicCycles §6.9", "PeriodsAndSpecialValues PS.0.1 and PS.0.5", "ComplexMultiplicationAndExplicitReciprocity", "LinearFormsInLogarithms 5.7"); write the full name `DiophantineApproximationAndTranscendence` everywhere. All of these sections exist at the heads read for this review.

## R06 (P3) — `lemma` and a quoted `TODO` (gate residue)

Location: `Suggested.lean` lines 46, 47, 67, 70, 73 (`lemma`); README line 92 ("its TODO asks for the connection").

Repair: `theorem` for the sorried declarations that remain after R08; reword line 92 as "Mathlib leaves the connection with the modular-forms library open, which Layer 2 supplies".

## R07 (P3) — backticked names of this roadmap's own that `Suggested.lean` does not declare

Location: README line 152 (`smul_smul`, `one_smul`), 154 (`G_congr`), 158 (`eq_smul_ofUpperHalfPlane`), 207–208 (`weierstrassZeta_smul`, `weierstrassZeta_congr`), 224 (`eisenstein_dictionary`), 255 (`discriminant_ne_zero`).

Witness: none of the eight occurs in `Suggested.lean` (the gate lists three; the other five are read the same way: `smul_smul`/`one_smul` as laws of the local action, `discriminant_ne_zero` as a local name for ModularCurvesPartII §1.1's fact).

Repair: state these facts in prose without a backticked name (for the §1.1 fact, cite ModularCurvesPartII §1.1 in words).

## R08 (P3) — padding in `Suggested.lean`

Location: lines 46–47 (`smul_ω₁`, `smul_ω₂`), 67 (`lattice_smul`), 73 (`weierstrassP_congr`), 83 (`isEllipticFunction_weierstrassP`), 120 (`weierstrassZeta_sub_periodic`), 261–264 (`exists_hasCM_g₂_eq_one`).

Witness (one-tactic probe on a copy): `isEllipticFunction_weierstrassP` closes by `⟨L.meromorphic_weierstrassP, fun l hl => L.periodic_weierstrassP ⟨l, hl⟩⟩`; `lattice_smul` closes by `simp [PeriodPair.lattice, Submodule.map_span]`; `weierstrassP_congr` closes by `unfold PeriodPair.weierstrassP; rw [h]`; `smul_ω₁`/`smul_ω₂` are `rfl` API lemmas; `exists_hasCM_g₂_eq_one` is the README's worked example; `weierstrassZeta_sub_periodic` exists only to define `quasiPeriod` (R02).

Repair: delete them from `Suggested.lean`; the README keeps the statements as targets and Checks. (`quasiPeriod_add`, `HasCM.smul`, `trdeg_periodField_le` were probed and do not close in one tactic.)

## R09 (P3) — README and docstring shape

Location: README headings (`## What Mathlib and Tau Ceti already have (consume)`, `## The build, in layers`, `### Layer k` with `*Checks.*`/`*Needs:*` inline bullets, `## Ordering`); line 112 (pin hashes); `Suggested.lean` lines 3–26.

Witness: the house shape (as in DiophantineApproximationAndTranscendence or ModularCurvesPartII on main and at its head) has `## Exact supplier contracts`, `## How to read the build`, `### k.n` prose subsections, `**Checks.**` lists with at least three discriminating Checks per definition, `### Examples` and `### Dependencies` per layer and `## Downstream consumers`. Here `IsEllipticFunction` has no Checks, `HasCM` two, `periodField`, `periodMatrix`, `periodIdeal` and `weierstrassZeta` none of their own. The docstring is the old "not exhaustive … suggest Lean forms" form with process narrative ("Until those are implemented in Tau Ceti", "only so that this file compiles") and does not say which headlines are not statable (none, after R02). Line 112 names pin hashes, which are not timeless.

Repair: reshape to the house headings; add Checks (for `IsEllipticFunction`: `℘`, `℘′` and `℘′²` are elliptic, `exp` and `1/sin(πz)` are not for `ℤ[i]`; for `weierstrassZeta`: the summand equals `z²/(l²(z − l))`, oddness, `ζ_{cΛ}(cz) = c⁻¹ζ_Λ(z)`; for `periodMatrix`: `det = −2πi` for `(1, i)` and `+2πi` for `(i, 1)`); replace the docstring by the "target signatures" form; drop the hashes.

P3 note, not a finding: `exists_quasiPeriod_mul` (Lean line 237) assumes `α.im ≠ 0`, but the relation holds with `b = 0` for `α ∈ ℤ` (the README's own Check), so the hypothesis is unused by the statement; it is needed only in `trdeg_periodField_le_two_of_hasCM`. Layer 1's `*Needs:*` cites DLMF §23.3 for the Laurent recursion, which is DLMF 23.9.5 (§23.3 has the discriminant, 23.3.4).

## Verified sound

Gate (worker's run at dfb30e3): build 0, depcheck 0, sorry-data 0, set_option 0, latex 0, outside-folder 0; failing: prnum 3, residue 4, readme-ids-missing 3 (R05–R07). Dependency check run here: `depcheck: 205 roadmaps, 1419 edges, 0 problem(s)` (no UPWARD or CYCLE line; EllipticPeriods is listed right after ModularCurvesPartII). Pins: the worktree manifest has Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`; main's content manifest has `f6090c70`/`358314d4` (the hashes the README names); every declaration below was checked at both.

Adversarial table (sampled targets, headlines, every target a finding touches):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Legendre convention, `det_periodMatrix` | `Λ = ℤ[i]`, basis `(1, i)` and `(i, 1)` | `η(1) = π`, `η(i) = −iπ`; `η(ω₁)ω₂ − η(ω₂)ω₁ = πi + iπ = 2πi`; `det = ω₁η(ω₂) − ω₂η(ω₁) = −2πi`; swapped basis `+2πi` | sound (sign, orientation) | R01 (auto-bound `π`) |
| DLMF half-period convention | DLMF 23.2.12, 23.2.14 (`dlmf23` lines 523, 574): `η_j = ζ(ω_j)`, `η₁ω₃ − η₃ω₁ = πi/2` | full periods `2ω_j`, `η(2ω_j) = 2η_j`: `4 · πi/2 = 2πi` | agrees with README line 126–128 | none |
| `g₂_ofUpperHalfPlane`, `g₃_ofUpperHalfPlane` | `E₄ = E (3 ≤ 4) = (1/2) ∑_{gcd=1}`, constant term 1 (EisensteinSeries/Basic.lean lines 47–54) | `G₄ = 2ζ(4)E₄ = (π⁴/45)E₄`, `60 · π⁴/45 = 4π⁴/3`; `G₆ = 2ζ(6)E₆ = (2π⁶/945)E₆`, `140 · 2/945 = 8/27` | constants correct | R01 |
| `quasiPeriod_ofUpperHalfPlane_one` | Mathlib `G2 = ∑'[symmetricIcc] m, e2Summand m`, `e2Summand m = ∑' n, (mτ + n)⁻²`, `e2Summand 0 = 2ζ(2)` (E2/Defs.lean lines 33, 40, 56); `E2 = (1/(2ζ(2))) • G2` (line 60) | `ζ(z + 1) − ζ(z)`: summand `1/(z+1−l) − 1/(z−l) + 1/l² = O(|l|⁻³)`, rows telescope, row `m = 0` leaves `2ζ(2)`; `τ = i`: `G₂(i) = (π²/3)(3/π) = π = η(1)` | sound; matches `eisenstein_values_at_i` | R01 |
| `G₂(−1/τ)` Check | Mathlib `G2_S_transform` (E2/Transform.lean line 192): `G2 z = z⁻² G2(S•z) + 2πi/z` | README's `G₂(−1/τ) = τ²G₂(τ) − 2πiτ`; via Legendre: `η_{Λ_{−1/τ}}(1) = τ η_{Λ_τ}(τ) = τ(τG₂ − 2πi)` | agree | none |
| Laurent recursion (Layer 1) | DLMF 23.9.5 (`dlmf23-9` line 191) reindexed `c^{DLMF}_{n+1} = c_n` | `c₁ = 3G₄ = g₂/20`, `c₂ = 5G₆ = g₃/28`, `c₃ = c₁²/3 = g₂²/1200`, `c₄ = 6c₁c₂/22 = 3g₂g₃/6160` | Checks correct | locator note (§23.9) |
| `hasSum_weierstrassP_laurent` | `k = 0` term; `z = 0` | `3G₄z²`; `℘(0) = 0` junk excluded by `nhdsWithin 0 {0}ᶜ` | sound | none |
| `G_mem_adjoin` | `k = 2, 3, 4` | `G₄ = g₂/60`, `G₆ = g₃/140`, `G₈ = c₃/7 = g₂²/8400` | sound | none |
| `G_smul`, Layer 0 Check | `c = 2`, `k = 4`; `k` odd; `k = 0, 2` | `G₄(2Λ) = G₄/16`; `0 = c⁻ᵏ · 0`; junk `0` both sides | sound | none |
| `IsEllipticFunction` | `℘`, `℘′`, `℘′²`; `exp`; `1/sin(πz)` on `ℤ[i]` | first three periodic and meromorphic; `exp` not periodic; `1/sin(πz)` has period `2` but not `1` or `i` | discriminating | Checks to add (R09) |
| `finsum_meromorphicOrderAt_eq_zero` | `f = ℘`; `f = ℘ − e₁`; `f ≡ 0`; `f ≡ 1` | orders `−2` at `0`, `+1, +1` at the two zeros, sum `0`; `−2 + 2 = 0`; all `⊤` (excluded by `hne`); all `0` | sound | none |
| `exists_eq_div_weierstrassP` | `f = ℘′²`, `f = 0`, `f = 1/℘`, `f = ℘′` | `P = 4X³ − g₂X − g₃, Q = 1`; `P = 0, Q = 1`; `P = 1, Q = X`; `℘′` odd, excluded | sound | none |
| `weierstrassZeta` definition | `z ∉ Λ`; `z = l₀ ∈ Λ∖{0}`; scaling | summand `= z²/(l²(z − l)) = O(|l|⁻³)`; junk term `2/l₀`; `ζ_{cΛ}(cz) = c⁻¹ζ_Λ(z)` | sound | none |
| `quasiPeriod` | `l ∉ Λ`; `l ∈ Λ` | choice over a sorried `∃`: unspecified; real body `ζ(ω₁/2 + l) − ζ(ω₁/2)` elaborates | stand-in | R02 |
| `η(ω) = 2ζ(ω/2)` | `ω ∈ Λ∖2Λ`; `ω ∈ 2Λ` | `ζ(ω/2) = −ζ(ω/2) + η(ω)`; `ω/2 ∈ Λ` junk | hypothesis needed and present | none |
| `periodField`, `trdeg_periodField_le`, `eq_four_iff` | four generators; CM lattice | `ℚ(ω₁, ω₂, η₁, η₂)` by additivity, `trdeg ≤ 4`; both sides of the iff false when `trdeg ≤ 2` | sound | none |
| `two_pi_I_mem_periodField` | negative basis; `π := 0` | `det = +2πi`, still `2πi ∈ F`; trivial | sound after R01 | R01 |
| `ringKrullDim_periodIdeal` | Tau Ceti `ringKrullDim_eq_toNat_trdeg` (FiniteType.lean line 152): `[IsDomain A] [Algebra.FiniteType k A]` | `ℚ[X]/I ≅ ℚ[entries]`, a finite-type domain with fraction field `periodField` | hypotheses met | none |
| `isAlgebraic_of_smul` | `ℤ[i]` scaled by `c` | `g₃ = 0` on both sides gives nothing; `g₂ ≠ 0` (`Δ ≠ 0`), `c⁴ = g₂(L)/g₂(cL)` algebraic | sound | none |
| `hasCM_iff` | `τ = i`; `τ = e^{2πi/3}`; `τ` transcendental; `a = 0` | `αω₁ = mω₁ + nω₂`, `αω₂ = pω₁ + qω₂` give `nτ² + (m − q)τ − p = 0`, `n ≠ 0`; `τ² + 1 = 0`; `τ² + τ + 1 = 0`; no equation; `a ≠ 0` excludes `b = c = 0` | sound both ways | none |
| `exists_weierstrassP_mul_eq` | `α = ±1`; `α = 2`; `α = 0` | `P = X, Q = 1`; duplication formula over `ℚ(g₂, g₃)`; excluded | sound; route circular | R04 |
| `exists_quasiPeriod_mul` | `ℤ[i]`, `α = i`; `α = 1 + i`; `α = 2` | poles of `ζ(αz)` mod `Λ`: `|α|²` with residue `1/α`; `a = |α|²/α = ᾱ`: `−i`, `1 − i`, `2`; `b = 0` for `α = i` and `α = 2`; `z¹` coefficient `−G₄α³ + ᾱG₄ − b ∈ ℚ(g₂, g₃, α, ℘(p))` | sound; `α.im ≠ 0` unused | P3 note |
| `trdeg_periodField_le_two_of_hasCM` | `ℤ[i]`, `α = i`: `m = 0, n = 1` | `ω₂ = iω₁`, `η(ω₁) = 2πi/((2i)ω₁) = π/ω₁`, `η(ω₂) = (−i)η(ω₁)`; field algebraic over `ℚ(ω₁, π)` | sound | none |
| `chudnovsky` | `l = ω₁`; `l = 0`; `l = n l₀`; `π := l` | `E₄ = (3g₂/4)(l/π)⁴`, `E₆ = (27g₃/8)(l/π)⁶`, `E₂ = 3(l/π)(η/π)`; `nesterenko` (a 3-subset of `{q, E₂, E₄, E₆}`) gives `trdeg ℚ(E₂, E₄, E₆) ≥ 2`; `l = 0` gives `0`, excluded by `hl0`; rational scaling preserves independence; `π := l` gives `![1, …]` dependent | sound after R01 | R01 |
| `two_le_trdeg_periodField` | `ω₁/π, η(ω₁)/π ∈ periodField(i)` | `trdeg F(i) = trdeg F ≥ 2` | sound | none |
| Summary "at least 2 always" | `L = π • ℤ[i]` | `periodField = ℚ(π, i)`, `trdeg 1` | false without algebraic invariants | R03 |
| `trdeg_periodField_eq_two_of_hasCM`, corollaries | CM | `≤ 2` and `≥ 2`; `ω₁, π` independent since `F` algebraic over `ℚ(ω₁, π)` | sound | none |
| `exists_hasCM_g₂_eq_one` | `L₀ = (1, i)` | `G₆(iΛ) = i⁻⁶G₆ = −G₆`, `g₃ = 0`, `g₂ ≠ 0`; `c⁴ = g₂(L₀)`: `g₂(c•L₀) = 1` | true; a worked example | R08 |

Elaborated signatures: all 48 declarations compared with the README (worker's file); the only discrepancies are the six auto-bound `{π : ℂ}` binders (R01). `#check @…` on the repaired copy recorded above.

Library declarations opened at the pins: `PeriodPair` (Weierstrass.lean line 59), `PeriodPair.basis` (71), `lattice` (78), `ω₁_div_two_notMem_lattice` (102), `latticeBasis` (148), `weierstrassP` (267), `weierstrassP_add_coe` (483), `weierstrassP_zero` (502), `derivWeierstrassP` (518), `hasFPowerSeriesOnBall_weierstrassP` (890), `analyticOnNhd_weierstrassP` (898), `meromorphic_weierstrassP` (907), `order_weierstrassP` (920), `G` (944), `G_eq_zero_of_odd` (950), `g₂` (956), `g₃` (959), `derivWeierstrassP_sq` (1074) — the file is identical at both pins; `EisensteinSeries.e2Summand`, `G2`, `E2`, `D2` (E2/Defs.lean 33, 56, 60, 63), `G2_S_transform` (E2/Transform.lean 192), `eisSummand` (EisensteinSeries/Defs.lean 183), `ModularForm.E`, `E₄`, `E₆` (EisensteinSeries/Basic.lean 47, 51, 54), `riemannZeta_two`, `riemannZeta_four`, `riemannZeta_two_mul_nat` (HurwitzZetaValues.lean 226, 232, 206), `Meromorphic` (Meromorphic/Basic.lean 760), `ZSpan.fundamentalDomain`, `Algebra.trdeg`, `FinTrdeg`, `trdeg_le_cardinalMk`, `isTranscendenceBasis_of_le_trdeg_of_finite`, `Differentiable.apply_eq_apply_of_bounded`, `Function.Periodic.qParam`, `LinearIndependent.pair_iff`; Tau Ceti `TauCeti.Contour.residue` (Contour/Residue/Basic.lean 80), `TauCeti.Contour.classicalResidueTheorem_nullHomologous` (Contour/Residue/Cycle.lean 226), the `Winding/Number/Segment` folder, `ringKrullDim_eq_toNat_trdeg` (RingTheory/KrullDimension/FiniteType.lean 152). Neither pin has a Weierstrass `ζ`, elliptic-function predicate, period field or lattice CM (grep of both package trees).

Cross-roadmap citations resolved: ModularCurvesPartII §1.1 (normalized lattice model, `Δ ≠ 0`), §1.3 (homotheties `g₂(uΛ) = u⁻⁴g₂(Λ)`), §1.4a (`latticeSigma`, `latticeQuasiPeriod`, `latticeSigma_quasiPeriod`, `latticeQuasiPeriod_legendre` with `η(ω₁)ω₂ − η(ω₂)ω₁ = 2πi` for `Im(ω₂/ω₁) > 0`) at the #913 head, README lines 394–512; its own Layer 1 consumes nothing from here, so the supply is one-way. DiophantineApproximationAndTranscendence on main: §5.6 (README line 3586), `nesterenko` (Suggested.lean line 3566: a card-3 subset of `![qParam 1 τ, E2 τ, E₄ τ, E₆ τ]` is algebraically independent) and `eisenstein_values_at_i` (line 3572: `E2 I = 3/π`, `E₆ I = 0`). EllipticCurves on main: `EndOver`, `CMAction`, `HasGeometricCM` (lines 507–512), complex uniformisation excluded (line 150), `℘` unconsumed (line 301). ComplexTori on main (period lattices, Milestones 1–2). ContourIntegration (Completed) Layers 2–3: residues and the null-homologous residue theorem. AbelianSchemesAndArithmeticModuli A5.1 "Lattice uniformization" (#849 head, line 2511); ComplexComparisonPartII Layer C5 (#848 head, line 2326); MotivesAndAlgebraicCycles §6.9 "The motivic period torsor" (#1313 head, line 1235); PeriodsAndSpecialValues PS.0.1, PS.0.5 and the row-cycle integration matrix with `I = B⁻¹` (#1496 head, lines 92, 128, 343, 374), consistent with README lines 74–76; ComplexMultiplicationAndExplicitReciprocity (#1254 head, elliptic CM and reflex reciprocity); LinearFormsInLogarithms 5.7 (`SchneiderLang.exists_transcendental_of_linearIndependent`, #451 head line 641) and its exclusion of the meromorphic criterion and elliptic analogues (lines 110–112, 129). Ownership: `tauceti-roadmap roadmaps grep` over the 433 open pull requests and main finds no other owner of `weierstrassZeta`, `quasiPeriod`, `periodField`, `IsEllipticFunction`, `HasCM`, Chudnovsky's theorem or the Legendre determinant; ModularCurvesPartII, PeriodsAndSpecialValues, ComplexMultiplicationAndExplicitReciprocity and the two later roadmaps in the order (ComplexMultiplicationAndExplicitReciprocity, PeriodsAndSpecialValues) are cited here only as owners of excluded material, never on a `*Needs:*` line. Suppliers in the merge order: ModularCurvesPartII (line 70) precedes EllipticPeriods (line 71); DiophantineApproximationAndTranscendence is on main.

Sources verified at their locators: `bost-charles` (arXiv 1307.1045v2) line 456 (§2.2.2), 458 (Conjecture 2.12, `Z_X = Ω^{mot}_X`), 457 (Grothendieck [Gro66] note (10), p. 102), 471–472 (CM elliptic case due to Chudnovsky [Chu80]), 1294 ([Chu80] = ICM 1978 proceedings); `kawabe` (arXiv 2303.05030v5) line 168 (§2.3, the power of a CM elliptic curve, due to Chudnovsky); `waldschmidt-periods` (author page) lines 338–346 (printed p. 442, §3: two of `g₂, g₃, ω/π, η/π` algebraically independent, with `ζ′ = −℘`, `ζ(z + ω) = ζ(z) + η`) and 377–417 (Nesterenko's Theorem 17); `dlmf23` lines 234 (23.2.5), 523 (23.2.12), 574 (23.2.14); `dlmf23-3` line 184 (23.3.4, `Δ = 16∏(e_i − e_j)²`); `dlmf23-8` line 217 (23.8.5, series for `η₁`); `dlmf23-9` lines 59, 89, 124, 191 (23.9.1–23.9.5); `chudnovsky-icm78` lines 14547–14573 (printed pp. 339–340, the paper's start, algebraic invariants and quasi-periods).

## Not verifiable

- Nesterenko, Sb. Math. 187 (1996), "Theorem 1 and Corollary 3": the doi landing page at mathnet.ru timed out twice; the statement itself is owned by DiophantineApproximationAndTranscendence §5.6 and was checked there. Listed in the missing-references file.
- Grothendieck's Montpellier folders 13 and 18 (pages 47–48 and 10–12) and the quoted « contient le th. de Schneider »: manuscript archive, not read; the attribution of the conjecture to [Gro66] note (10) is confirmed second-hand by `bost-charles` line 457.
- Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Theorem 4.1: paywalled (uncertified); LinearFormsInLogarithms at the #451 head cites the same theorem number (line 111).
- André, Panoramas et Synthèses 17, ch. 23; Chudnovsky 1976 (Dopovidi) and 1984 (AMS Surveys 19); Silverman AEC ch. VI and ATAEC ch. I: books or journals not fetched; cited at chapter level only.

## Source issues

- none
