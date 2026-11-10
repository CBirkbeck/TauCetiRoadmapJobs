# Review of SpecialFunctionsStruve (pull request #2129 at 2b2b305)

**Verdict:** needs changes

Thirteen findings: one P1 (a false worked example), one P2 (a statement narrowed below its source),
eleven P3 (two of them the failing gate rules). Every Lean statement and every sampled README
target was recomputed numerically and holds; the corrections to DLMF that the roadmap makes
(11.4.15, 11.7.6, 11.7.12, 11.11.6, 11.11.18–11.11.19) all reproduce.

## R01 (P1) — The Layer 7 example is false

**Location.** `TauCetiRoadmap/SpecialFunctionsStruve/README.md` line 842: "11.10.16 at `ν = ½` with
11.10.19: `𝐀_{1/2} + 𝐀_{−1/2} = −Y_{1/2} − 𝐄_{1/2}`."

**Claim.** The sum of the two Anger–Weber functions equals `−Y_{1/2} − 𝐄_{1/2}`.

**Witness.** At `z = 1`: `𝐀_{1/2}(1) + 𝐀_{−1/2}(1) = 0.51535 99279…`, while
`−Y_{1/2}(1) − 𝐄_{1/2}(1) = 0.33159 13254… = 𝐀_{−1/2}(1)`. In 11.10.16 at `ν = ½` the coefficient
`cos(πν)` of `𝐀_ν` is `0`.

**Repair.** Replace the identity by `𝐀_{−1/2} = −Y_{1/2} − 𝐄_{1/2}` (both sides `0.33159 13254…` at
`z = 1`).

## R02 (P2) — 11.11.17 is stated for real `ν` only, and the sectors of 11.11.16–11.11.17 are narrowed without a word

**Location.** README lines 926–929 ("DLMF 11.11.17: for every `M > 0`, as real `ν → +∞`, …") and
`Suggested.lean` lines 321–326 (`isBigO_angerWeberA_transition`, `p : ℝ × ℂ`,
`comap Prod.fst atTop`).

**Claim.** This is DLMF 11.11.17.

**Witness.** DLMF §11.11 (cached text lines 748–822) states 11.11.16 and 11.11.17 as `ν → ∞` in
`|ph ν| ≤ 2π − δ`, uniformly for bounded complex `a`. With principal values the error times `|ν|`
at `a = 1 + i` is `0.04039` (`ν = 100 e^{2i}`), `0.04067` (`ν = 400 e^{2i}`), against `0.04063` at
real `ν = 1000`.

**Repair.** State 11.11.17 along `Bornology.cobounded ℂ ⊓ 𝓟 {ν | |arg ν| ≤ π − δ}` on the product
with `‖a‖ ≤ M` (in Lean `p : ℂ × ℂ`, `ν^{1/3}` principal), as 11.11.16 already is. Say in 8.4 that
DLMF's sector for both is `|ph ν| ≤ 2π − δ` and that the part beyond the principal sheet is in
"Beyond this roadmap", next to 11.4.16–11.4.17. The same values (ph `ν` = 2.0, and `1.0`:
`0.04041`, `0.04074` at `|ν| = 300`, `2400`) test the repaired statement.

## R03 (P3) — Gate `tex`: four fenced blocks are scanned as prose

**Location.** README lines 408–409, 453–454, 502, 664 (ten hits in `gate.md`).

**Claim.** The gate rule: no `_{`, `^{` outside code spans and code blocks.

**Witness.** The four blocks are fenced, but their fences are indented two spaces under a list
item; the fences at column 0 (lines 12, 139, 729, 819) are not reported.

**Repair.** Start the fences at lines 407, 452, 500, 663 and their contents at column 0. Tested on
a scratch copy: `tex=0`.

## R04 (P3) — Gate `readme-ids-missing`: twelve Mathlib names read as this roadmap's own

**Location.** README lines 133–134, 262–272 (the `From Mathlib` contract):
`Complex.Gamma_add_one`, `Complex.Gamma_mul_Gamma_add_half`, `Complex.Gamma_mul_Gamma_one_sub`,
`Complex.Gamma_ne_zero`, `Complex.analyticAt_regularizedHGFun_of_card_le`,
`Complex.analyticOnNhd_besselJ`, `Complex.besselJ_def`, `Complex.besselJ_int_neg`,
`Complex.differentiable_one_div_Gamma`,
`Complex.integral_boundary_rect_eq_zero_of_differentiableOn`,
`Complex.radius_regularizedHGFunSeries_eq_top`, `Complex.two_mul_self_mul_besselJ`.

**Claim.** The gate rule: a backticked name the README presents as the roadmap's own is declared or
mentioned in `Suggested.lean`.

**Witness.** All twelve exist in the pinned Mathlib (for example
`Mathlib/Analysis/SpecialFunctions/Bessel.lean` lines 59, 62, 79, 123). `Suggested.lean` opens its
own `Complex` sub-namespace, so `Complex.…` names not mentioned in the file are taken for its own.

**Repair.** Pin the twelve declarations in `Suggested.lean` with `#check @_root_.Complex.…` lines
before `namespace Complex` (the permitted use of `#check`), or state the facts in the README
without the names. The first was tested on a scratch copy: `readme-ids-missing=0`, and the file
elaborates with `sorry` as its only warning.

## R05 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean` lines 158–163 (`differentiable_struveH_div`), 230–233
(`struveScaledCoeff_zero_one`), 315–319 (`angerScaledCoeff_zero_one`).

**Claim.** These are headline theorems.

**Witness.** The first closes with one library lemma:
`exact fun z => ((Complex.analyticAt_regularizedHGFun_of_card_le (by simp) _).differentiableAt).comp z (by fun_prop)`
(elaborated on a scratch copy). The other two compute `c₀, c₁` and `a₀, a₁` and mirror the Checks
of 4.3 (line 608) and 8.3 (lines 917–918).

**Repair.** Delete the three from `Suggested.lean`; the README keeps the statements. The
definitions `struveScaledCoeff` and `angerScaledCoeff` then stay only if a headline uses them:
state 11.6.6 and 11.11.8 with them (both are statable), or delete the two definitions as well.

## R06 (P3) — Three definitions that no headline uses

**Location.** `Suggested.lean` lines 61–65 (`hankelH1`, `hankelH2`) and 96–100 (`lommelSmallS`).

**Claim.** The file keeps only the definitions its headlines need.

**Witness.** No theorem mentions `hankelH1`, `hankelH2` or `lommelSmallS`;
`lommelCapitalSFormula` (lines 104–107) repeats the body of `lommelSmallS` instead of calling it.

**Repair.** Delete `hankelH1` and `hankelH2` (and their mention in the module docstring), or state
11.2.13 with them. Define `lommelCapitalSFormula μ ν z` as
`lommelSmallS μ ν z + 2 ^ (μ - 1) * Gamma ((μ - ν + 1) / 2) * Gamma ((μ + ν + 1) / 2) * (sin ((μ - ν) * π / 2) * besselJ ν z - cos ((μ - ν) * π / 2) * besselY ν z)`,
which is DLMF 11.9.5 as printed. Tested on a scratch copy: it elaborates, and it equals the
present body by `simp only [lommelCapitalSFormula, lommelSmallS]; ring`.

## R07 (P3) — No Lean name of the file appears in the README

**Location.** README, all layers; `Suggested.lean`, all 26 theorems and the definitions
`lommelCapitalSFormula`, `struveScaledCoeff`, `angerScaledCoeff`.

**Claim.** README and Lean agree: every Lean name appears in the README.

**Witness.** A search of the README for each declared name finds none of these 29 (for example
`hasSum_struveH`, `struveH_ode`, `isBigO_weberE_large_order`). SpecialFunctionsHypergeometric on
main names each of its declarations at its target.

**Repair.** Add each theorem name in parentheses at its target (for example "DLMF 11.2.1 …
(`hasSum_struveH`)"), name `T μ ν z` of Conventions as the bracket of `lommelCapitalSFormula`, and
name `struveScaledCoeff`, `angerScaledCoeff` where `c_k`, `a_k` are defined (if R05 keeps them).

## R08 (P3) — The Tau Ceti contract is missing

**Location.** README lines 42 ("rests on Mathlib, Tau Ceti and five roadmaps") and 202–275 (no
`### From Tau Ceti`); line 324 (*Needs* of 1.1).

**Claim.** Everything consumed is listed under the supplier contracts.

**Witness.** The pinned Tau Ceti has `Complex.hasSum_regularizedHGFun`
(`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 53): for
`a.card ≤ b.card`, `HasSum (fun n => regularizedHGFunCoeff a b n * z ^ n) (regularizedHGFun a b z)`.
It is the series identity of README line 10 and the first step of 11.2.1.

**Repair.** Add `### From Tau Ceti` with `Complex.hasSum_regularizedHGFun` and its file, and add it
to the *Needs* of 1.1 (and of 7.2, whose series 11.10.10–11.10.11 are `𝐅₁₂` series).

## R09 (P3) — The sectors `|ph| ≤ π − δ` need AsymptoticExpansions 4.3, which is never cited

**Location.** README lines 246–247 (contract), 543–544 and 557 (4.1), 743–752 (6.3), 856 and 861
(8.1), 885–889 and 909–914, 921 (8.3).

**Claim.** Watson's lemma in a sector (AsymptoticExpansions 4.2) gives 11.6.1, 11.9.9, 11.11.4,
11.11.8 and 11.11.10 in `|ph z| ≤ π − δ` (or `|ph ν| ≤ π − δ`).

**Witness.** AsymptoticExpansions 4.2 on main (README lines 554–555) is stated for
`|ph z| ≤ π/2 − δ` only. The wider sector is its 4.3, "Rotation of the path"
(`hasAsymptoticExpansion_rayLaplace`). The routes of 4.1 and 8.1 say "with the rotation of the
path" without a citation; the route of 8.3 covers `Re(λν) > 0` only.

**Repair.** Add "4.3: rotation of the path (`hasAsymptoticExpansion_rayLaplace`), for 4.1, 6.3,
8.1 and 8.3" to the contract, add AsymptoticExpansions 4.3 to those four *Needs* lines and to the
Dependencies of Layers 4, 6 and 8, and add to the route of 8.3 the sentence that extends 11.11.8
and 11.11.10 from `|ph ν| < π/2` to `|ph ν| ≤ π − δ` by 4.3.

## R10 (P3) — 11.9.9 has no route

**Location.** README lines 741–752 (6.3): "DLMF's Sources cite Watson (1944, §10.75) for §11.9.
… *Needs:* 6.1; Layer 4; AsymptoticExpansions 4.2."

**Claim.** The listed needs suffice for the expansion of `S_{μ,ν}`.

**Witness.** Layer 4 treats `𝐊_ν`, which is `S_{ν,ν}` only (6.1). No target gives an integral
representation of `S_{μ,ν}` for `μ ≠ ν` to which Watson's lemma applies, and none gives a
recurrence in `μ`.

**Repair.** Add to 6.1 the auxiliary recurrence
`S_{μ+2,ν}(z) = z^{μ+1} − ((μ + 1)² − ν²) S_{μ,ν}(z)` for all parameters (Watson 1944, §10.72),
and to 6.3 the route: `N` steps give
`S_{μ,ν} = z^{μ−1} ∑_{k<N} (−1)ᵏ a_k(−μ, ν) z^{−2k} + (−1)^N a_N(−μ, ν) S_{μ−2N,ν}`, and the
remainder needs `S_{μ′,ν}(z) = O(z^{μ′−1})` in the sector, stated as an auxiliary target with its
own input (the representation of Watson §10.75, or the one through `H⁽¹⁾_ν`, `H⁽²⁾_ν` with
SpecialFunctionsBessel 5.1). The recurrence was tested: its residual is `1.4 × 10⁻⁴⁰` at
`μ = 0.3 + 0.1i`, `ν = 0.2`, `z = −1 + 0.5i`, and `7 × 10⁻⁴¹` at the doubly exceptional
`μ = −1`, `ν = 0`, `z = 1 + 0.5i`. The termination at `μ − ν = 2n + 1` is `a_{n+1}(−μ, ν) = 0`.

## R11 (P3) — Supplier locators and *Needs* lines

**Location and witness**, each against the supplier as it is on main or at its open head:

1. README lines 231–233, 952, 963: `Hi(0) = 2 Gi(0)` and DLMF 9.12.6 are cited as
   SpecialFunctionsAiry 6.1. 9.12.6 is its 6.2 ("Values at the origin and variation of
   parameters", README line 1000); 6.1 only quotes the value in a Check.
2. README lines 237–239, 827: the Fresnel series 7.6.4–7.6.7 are cited as
   SpecialFunctionsEiLiErfIncompleteGamma Conventions. They are its 11.4 ("Series, derivatives
   and hypergeometric forms", README line 1310).
3. README line 324: 1.1 claims that `𝐊_ν(z)` is entire in `ν`, which needs the holomorphy of
   `Y_ν` in the order, SpecialFunctionsBessel 1.2; the *Needs* of 1.1 list "Conventions, 1.1,
   1.7, 2.2".
4. README lines 600–605, 611, 623: the route of 4.3 uses DLMF 10.32.2, SpecialFunctionsBessel 3.1
   (the contract at line 217–218 says so); 3.1 is missing from the *Needs* of 4.3 and from the
   Dependencies of Layer 4.
5. README line 694: the Dependencies of Layer 5 omit SpecialFunctionsBessel 8.4, which the
   *Needs* of 5.1 (line 649) list.
6. README line 739: 6.2 has *Needs* "6.1; Layer 2", but 11.9.7 is the argument of 11.4.18 with
   DLMF 10.23.15, which is SpecialFunctionsBessel 2.6; Layer 6's Dependencies list only
   SpecialFunctionsBessel 1.1–1.3.

**Repair.** Cite SpecialFunctionsAiry 6.2 for the value; cite SpecialFunctionsEiLiErfIncompleteGamma
11.4 for the series; add SpecialFunctionsBessel 1.2 to the *Needs* of 1.1, 3.1 to those of 4.3 and
to Layer 4, 8.4 to Layer 5, and 2.2, 2.6 to 6.2 and to Layer 6.

## R12 (P3) — "Variation of parameters" names something else

**Location.** README lines 93, 332–334, 340–341: "**Variation of parameters** (auxiliary): … `w`
… solves `w″ + w′/z + (σ − ν²/z²) w = f` if and only if `w − w₀` solves the homogeneous equation".

**Claim.** This statement is variation of parameters.

**Witness.** Variation of parameters is the construction of a particular solution from two
homogeneous solutions and their Wronskian (it is what SpecialFunctionsAiry 6.2 means by the
phrase). The statement here is the linearity of the operator: the solutions form an affine space
over the homogeneous ones.

**Repair.** Rename the target, for example "**Superposition** (auxiliary)", in the ownership
table, in 1.2 and in the sentence after it ("the general solutions are superposition with
SpecialFunctionsBessel's span of the homogeneous solutions").

## R13 (P3) — The witness for 11.11.18–11.11.19 does not say at which `|ν|`

**Location.** README lines 932–933: "the ratio is about `2.8 × 10⁶` at `ph ν = 0.3`."

**Claim.** A computed witness that DLMF's sector is too wide.

**Witness.** The ratio `|𝐉_ν(ν)|` over the printed approximant at `ph ν = 0.3` is `411.2` at
`|ν| = 10`, `2.797 × 10⁶` at `|ν| = 20` and `2.298 × 10¹⁰` at `|ν| = 30`.

**Repair.** Write "at `ν = 20 e^{0.3i}`".

## Verified sound

**Gate and build.** The gate at this head fails on `tex` (10) and `readme-ids-missing` (12) only
(R03, R04); every other scanner is `0`, the build passes. `lake env lean` on `Suggested.lean`:
26 `sorry` warnings and nothing else, in 5 s. No `set_option`, no sorry'd data, a single
`public import Mathlib`; the pull request changes nothing outside the folder.

**Dependency check.** `depcheck: 229 roadmaps, 2123 edges, 0 problem(s)`: no UPWARD or CYCLE line.
SpecialFunctionsBessel is still an open pull request that adds a new folder; it was read at its
open head with `roadmaps show`, and the description's `depends-on` block names it. Its README sends
DLMF 10.22.2 and 10.43.2 to this roadmap and lists this roadmap as a consumer, so each formula has
one owner and there is no cycle.

**Cross-roadmap citations resolved (31).** SpecialFunctionsBessel (open head): Conventions
(`Complex.besselY`, `hankelH1`, `hankelH2`, `besselI`, `besselK`, `sphericalBesselJ`,
`modifiedSphericalBesselI1`, `Real.debyeU`), 1.1, 1.2, 1.3, 1.4, 1.7, 1.8, 2.2, 2.4, 2.6, 3.1
(10.9.2, 10.9.4, 10.9.6–10.9.7 and 10.32.2 within "10.32.1–10.32.11"), 4.3, 5.1, 5.2, 6.1, 8.1,
8.4, 9.1, 9.2. SpecialFunctionsAiry (main): Conventions (`TauCeti.scorerHi`), 6.1.
SpecialFunctionsEiLiErfIncompleteGamma (main): Conventions (`TauCeti.fresnelC`, `fresnelS`).
AsymptoticExpansions (main): Conventions (`Asymptotics.HasAsymptoticExpansion`, line 125), 1.5,
4.2 (`hasAsymptoticExpansion_laplace_sector`), 5.1, 5.2 (`hasAsymptoticExpansion_laplace_method`),
5.4 (`hasAsymptoticExpansion_laplace_contour`), 5.5, 6.2 (`isBigO_stationaryPhase_remainder`), 8.2
(`integral_vertical_sub_eq_two_pi_mul_sum_residue`), 8.6 (`exists_norm_Gamma_le`).
ZerosOfLFunctions (main): 1.2 (DLMF 5.11.1), 1.3 (DLMF 5.11.9). The local copies of `besselY`,
`hankelH1`, `hankelH2`, `besselI`, `scorerHi`, `fresnelC`, `fresnelS` in `Suggested.lean` are
character for character the suppliers' definitions. The nine names of `citations.md` are the
suppliers' roadmap names, each defined in its README; `overlaps.md` lists nothing.

**Library declarations opened at the pin (21).** Mathlib
`Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: `regularizedHGFunCoeff` (67),
`regularizedHGFun` (192), `radius_regularizedHGFunSeries_eq_top` (249),
`analyticOnNhd_regularizedHGFun_of_card_le` (282), `analyticAt_regularizedHGFun_of_card_le` (287).
`Analysis/SpecialFunctions/Bessel.lean`: `besselJ` (55), `besselJ_def` (59), `besselJ_int_neg`
(62), `analyticOnNhd_besselJ` (79), `two_mul_self_mul_besselJ` (123).
`Analysis/SpecialFunctions/Gamma/Basic.lean`: `Gamma_add_one` (312); `Gamma/Beta.lean`:
`Gamma_mul_Gamma_one_sub`, `Gamma_mul_Gamma_add_half`, `differentiable_one_div_Gamma`,
`betaIntegral`; `Gamma_ne_zero`; `Analysis/Complex/CauchyIntegral.lean`:
`integral_boundary_rect_eq_zero_of_differentiableOn` (313);
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`;
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Real.eulerMascheroniConstant`. Tau Ceti
`Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: `Complex.hasSum_regularizedHGFun` (53)
(R08). `differentiable_one_div_Gamma` is stated for `(Gamma s)⁻¹`, as the Conventions use it.

**Duplication.** No Struve, Lommel, Anger or Weber function in the pinned Mathlib or Tau Ceti
(search for `struve`, `lommel`, `anger`, `weberE`), nor in any roadmap on main or in an open pull
request (`roadmaps grep`; the only hits are SpecialFunctionsBessel's deferrals to this roadmap).
Tau Ceti's `Real.besselI` belongs to SpecialFunctionsBessel's contract. No parameter holomorphy
of `regularizedHGFun` exists at the pins. The 45 library near-matches have no same-name hit.

**Padding probe.** Every `sorry` was replaced by
`first | rfl | (simp; done) | (fun_prop; done) | (simp [the definitions]; done) | sorry` on a
scratch copy: all 26 remain open. `differentiable_struveH_div` closes with one library lemma
(R05).

**Signatures.** The 45 elaborated signatures were compared with the README: no section binder is
lost (the file has no `variable`), and each theorem has the README's hypotheses, except the
generality of R02.

**Sources.** DLMF §§11.2, 11.4, 11.5, 11.6, 11.7, 11.9, 11.10, 11.11 (Release 1.2.8 of
2026-09-15, the release the README cites) were read in full through the sources service, and
every formula number, hypothesis and sector of the fifteen sampled subsections was compared with
the README. The README flags no locator as unverified. Agreement everywhere except R02; the
hypotheses the README adds (11.4.18, 11.4.20, 11.5.8, 11.9.7, 11.10.17–11.10.18, 10.22.2) each
exclude a `0/0` or a non-absolutely-convergent integral. The reindexing of 11.4.22, the ceiling
and floor of 11.10.24 and the coefficient tables 11.6.8, 11.11.9, 11.11.13 match.

**Adversarial table.** Values computed with mpmath at 25–90 digits from the roadmap's own
definitions (the `𝐅₁₂` series summed directly, `Y_ν` and `𝐀_ν` by the README's case split,
`𝐉_ν`, `𝐄_ν` by quadrature), cross-checked against mpmath's `struveh`, `struvel`, `lommels1`,
`lommels2`, `angerj`, `webere`. "res" is the absolute residual of the identity; in the table `‖x‖` is the absolute value.

| Statement | Instances and values computed | Result |
|---|---|---|
| Definitions 1.1, Checks | `𝐇₀(1)`, `𝐋₀(1)`, `𝐇₁(1)`, `𝐇_{0.3}(2+i)`, `𝐊₀(1)`, `𝐌₀(1)`: `0.5686566270`, `0.7102431859`, `0.1984573362`, `1.0479605148 + 0.2213705975i`, `0.4803996628`, `−0.5558226918` | as README |
| `𝐋_ν(z) = −i e^{−iνπ/2} 𝐇_ν(iz)` | `ν = 0.3`, `z = 0.7 + 0.4i`: both `0.2866788555 + 0.2546909935i` | holds |
| `struveH_ode`, 11.2.7–11.2.10 | `(ν, z)` = `(0.3+0.2i, −1+0.5i)`, `(−½, 1+i)`, `(−3/2, 2−i)`, `(2, −2+0.1i)`, for `𝐇, 𝐊, 𝐋, 𝐌`: res ≤ `2 × 10⁻³¹` in all 16 | holds, also where `1/Γ(ν+½) = 0` |
| `struveH_half`, 11.4.1–11.4.12 | `z = 1`, `−1+0.5i`, `0.3−2i`; `n = 0..3`: res ≤ `1.6 × 10⁻³⁰` in all 72 | holds on the slit plane, `Re z < 0` included |
| `struveH_relative_bound` | `ν = 0`, `z = 1`: `ϑ = −0.1067562590`, bound `0.1209069419`; 300 random `(ν, z)`: 0 violations | holds |
| DLMF's printed 11.4.15 | `ν = 1000`, `z = 2i(ν + 3/2)^{1/2}`: `‖ϑ‖ = 1.0294` > printed bound `0.6667`; corrected bound `1.1455` | README's correction right |
| 11.4.13 | `ν ∈ [½, 7.25]`, `x ∈ [⅓, 19]`: minimum `1.8 × 10⁻¹¹ > 0` | holds |
| 11.4.18–11.4.22 | `ν = 0.3`, `−0.7+0.2i`, `2`; 11.4.19 also at `ν = −½, −1, −3/2, −3`; `z = 1.3+0.4i`, `−2+i`: res ≤ `6 × 10⁻²⁶` | holds; 11.4.19 for every `ν` |
| `struveH_recurrence`, 11.4.23–11.4.33 | `ν = 0.3+0.2i`, `−3/2`, `0`, `−5/2`: res ≤ `3 × 10⁻²⁶` | holds at the poles of `Γ` |
| `struveH_eq_integral`, 11.5.1, 11.5.4, 11.5.6 | `ν = 0.3`, `z = −1+0.5i`; `ν = −0.3+i`, `z = 2+i`: res ≤ `2 × 10⁻²⁴`; `≤ 3 × 10⁻¹²` (endpoint singularity) | holds |
| `struveK_eq_integral`, 11.5.2 | `(ν, z)` = `(−1, 1)`: both `−0.3430503851`; `(−2.5+i, 1+2i)`: both `−0.5322174884 − 0.3828890287i`; `(3.2, 0.5−3i)`: both `−0.2816879546 − 0.1090554773i`; `(−3/2, 2+i)`: both `0` | holds for every `ν` |
| 11.5.3, 11.5.5, 11.5.7 | `z = 1`: `0.4803996628`; `z = −3+2i`: `1.0942843559 + 8.7482438851i`; `ν = 0.2`, `x = 1.5`: `0.5662670360`; `ν = −1.2+0.5i`: `−0.4005112841 − 0.2334846603i`: both sides equal | holds |
| `struveH_mellinBarnes`, 11.5.8 | `(ν, x, c)` = `(3, 1.2, −0.4)`: `−0.5778536642i` vs `−0.5778536642i`; `(2.5+i, 2.2, −0.8)`: `−1.05611674 − 0.38564855i` vs `−1.05611675 − 0.38564857i` | holds (truncation `10⁻⁸`) |
| 11.5.9 | `ν = 0.3+0.1i`, `z = 1+0.7i`, `h = 1`, `R = 30`: both `−0.7770085884 + 8.0393962709i` | holds; the loop is counterclockwise |
| `isBigO_struveK_sub_sum`, 11.6.1 | `𝐊₀(10) = 0.0630725164`, sums `0.0630253575`, `0.0630826532`; `ν = 1.7`, `z = 60`: scaled remainder `0.7568`, `7.212` against next coefficients `0.7565`, `7.262`; sign statement, `ν ∈ {0, 1.2, −0.7, 3.3}`, `z = 12`: ratios in `(0.47, 0.994)` | holds |
| 11.6.2 | `ν = 0.3+0.2i`, `z = 40 e^{1.3i}`: remainder / next = `0.980 − 0.090i`; `ν = −1.7`, `z = 40`: `1.012`, `1.049` | holds, `Re ν < −½` included |
| 11.6.3, 11.6.4 | `z = 10`: `0.0030580479` between `0.0030398594` and `0.0030637327`; `z = 8`: `0.0054568877`, first term `0.0049735920` | as README |
| 11.6.5 | `ν = 300`, `300 e^{2.9i}`, `300 e^{−1.5i}`, `z = 1.3+0.4i`: ratios `0.9976`, `1.0022`, `1.0004` (`𝐇`); `0.9993`, `1.0008`, `0.9994` (`𝐋`) | holds |
| `c_k` (Conventions, `struveScaledCoeff`) | symbolic, `k ≤ 4`; the Lean body, `k ≤ 3`: `1`, `2λ⁻²`, `6λ⁻⁴ − ½λ⁻²`, `20λ⁻⁶ − 4λ⁻⁴`, `70λ⁻⁸ − (45/2)λ⁻⁶ + (3/8)λ⁻⁴` | equals 11.6.8 |
| 11.6.6, 11.6.7 | `λ = 2`, `ν = 40`: remainder / next `1.025`, `1.017`; `ν = 40 e^{1.3i}`: `1.006 − 0.024i`; 11.6.7, `λ = 2`: `0.983 + 0.046i` | holds |
| `struveL_isEquivalent_besselI`, 11.6.9, Debye | `λ = 2`, `ν = 40 e^{1.3i}`: `𝐋/I = 1.0000046 − 0.000041i`, `I`/Debye `1.00025 − 0.00090i` | holds |
| `hasDerivAt_besselJ_struveH`, 10.22.2, 10.43.2 | `ν = 0.3+0.2i`, `z = −1+0.5i`; `ν = 1.5`, `z = 2+i`; `𝒞 = J`, `Y`, `J + 2Y`; `𝒵 = I`, `e^{νπi} K`: res ≤ `3 × 10⁻²⁵` | holds |
| 11.7.6 | `ν = 0.3+0.2i`, `z = −1+0.5i`: README form res `9 × 10⁻²⁷`; DLMF's `(z²/2)^{ν+1}` res `0.34` | README's form right |
| 11.7.7, 11.7.8 | `ν = −0.4`, `z = −1+0.5i`: both `−0.0479857545 + 0.3967815019i`; `1.5707963` vs `π/2`; `0.785379` vs `π/4` | holds |
| `integral_struveH_mul_struveH`, 11.7.12 | `μ = ν = ½`: exact `1` both sides; `μ = 1`, `ν = ½`: `0.626641` vs `0.626657` (tail `10⁻⁵`); `μ = 3`, `ν = −2`: partial integrals `0.2546`, `0.2195`, `0.0016`, `−0.5310` at `R = 50, 100, 200, 400` | holds; DLMF's hypothesis insufficient |
| 11.7.13–11.7.16 | `a = 2`: `0.1370034210`, `0.0443030442`, `0.1924500897`, `0.0665902933`; `a = 0.3+2i`: `−0.1733013721 − 0.0650198012i`; `a = 1.2−0.2i`: `0.5913343853 + 0.4721124647i`: both sides equal | principal branches right |
| Definitions 6.1, Checks | `s_{0.5,0.2}(1.3) = 0.5829001517`, `S = 0.8316246006`, `S_{0,0}(1) = 0.7546100258` | as README |
| `differentiable_lommelCapitalS` | `μ → −1`, `ν = 0`, `z = 1` from both sides: `0.44223645205886`, `0.44223645205834`; `ν → 0`: `0.4422364520586`; `μ = −3`, `ν = 2`; `μ = −2`, `ν = 1`; `μ = −0.7`, `ν = 0.3`; `μ = −2.2`, `ν = −0.8`: two-sided limits agree to 12 digits in each | removable, double poles included |
| `lommelCapitalS_ode`, 11.9.1–11.9.8 | `μ = 0.5+0.3i`, `ν = 0.2`, `z = −1+0.5i`, `1.3+0.4i`; exceptional `μ` by limit: res ≤ `10⁻³¹` (regular), `≤ 2 × 10⁻¹³` (limit) | holds |
| `isBigO_lommelCapitalS_sub_sum`, 11.9.9 | `μ = 0.3+0.1i`, `ν = 0.2`, `z = 40 e^{2.5i}`: remainder / next `0.998`, `0.995`, `0.997`; exceptional `μ = −1`, `ν = 0`, `z = 40`: `0.990`, `0.978`, `0.962`; `S_{2,1}(2) = 2`, `S_{1,0} = 1` | holds at all parameters |
| Definitions 7.1, Checks | `𝐉_{1/2}(1) = 0.8551653097`, `𝐄_{1/2}(1) = 0.0995075426`, `𝐀_{1/2}(1) = 0.1837686025`, `𝐀₀(1) = 0.2401998314`, `𝐀₁(1) = 0.1467846936` | as README |
| `differentiable_angerWeberA` | `ν = 1 ± 10⁻⁸`, `z = 1`: `0.14678469301`, `0.14678469422` around `0.14678469362` | the two cases glue |
| `angerWeberA_eq_integral`, 11.10.4 | `ν = 0.3+0.5i`, `2`, `−3`, `−2.6`: res ≤ `5 × 10⁻²⁶` | holds at integers |
| `angerJ_eq_besselJ_add`, 11.10.3–11.10.18 | `ν = 0.3+0.5i`, `z = −1+0.5i`; 11.10.16 also at `ν = 2`: res ≤ `10⁻²⁵` | holds; the equation of `𝐀_ν` at `ν = 1` too |
| 11.10.22–11.10.31 | `n = 1..5`; `ν = 0.3+0.5i`: res ≤ `6 × 10⁻²⁵`; `𝐄₁(1) = 0.4381624362`, `𝐉_{0.3}(0) = 0.8583936913` | holds; `m₂ = −1` at `n = 1` |
| `angerJ_neg_half`, 11.10.19–11.10.20 | `z = 1`, `−1+0.5i`, `0.3−2i`, `−3−0.1i`: res ≤ `1.3 × 10⁻²⁵` | holds on the slit plane |
| 11.10.32–11.10.37 | `ν = 0.3+0.5i`, `z = −1+0.5i`: res ≤ `4 × 10⁻²⁶` | holds |
| Layer 7 example (R01) | `z = 1`: `0.5153599279` vs `0.3315913254` | false |
| 11.11.4 | `ν = 0.3+0.2i`, `z = 60 e^{2.5i}`: remainder / next `1.005 + 0.022i`, `1.009 + 0.036i`, `1.012 + 0.048i` | holds |
| `isBigO_weberE_large_order`, 11.11.5–11.11.6 | `z = 1`; `ν = ½+10i`, `40.5`, `40 e^{i} + ½`, `−37.5+0.3i`, `½+40i`, `−80.5`: scaled by `e^{π‖Im ν‖}`: `0.238`, `0.514`, `0.246`, `0.290`, `0.249`, `0.494`; DLMF's form at `½+10i`: `1.05 × 10¹³` | corrected form bounded |
| 11.11.7 | `n = 20`, `−20`, `200`, `z = 1.3`: ratios `1.00106`, `1.00101`; `1.00106`, `1.00112`; `1.0000106` | holds |
| `a_k` (Conventions, `angerScaledCoeff`) | symbolic, `k ≤ 3`; the Lean body, `k ≤ 2`: `1/(1+λ)`, `−λ/(2(1+λ)⁴)`, `λ(9λ−1)/(24(1+λ)⁷)`, `−λ(225λ²−54λ+1)/(720(1+λ)¹⁰)` | equals 11.11.9 |
| 11.11.8, 11.11.10, 11.11.14 | `λ = 0.7`, `ν = 40`, `40 e^{2.5i}`, `40 e^{−1.4i}`: remainder / next within `0.004` of `1`; `λ = 2`, `ν = 40`: `0.988`, `0.969`; 11.11.14 ratio `0.9988` | holds |
| 11.11.11–11.11.15 | `λ = ½`, `ν = 60`: `1.017`, `1.042`; `ν = 60 e^{1.2i}`: `1.004 − 0.017i`; 11.11.13_5 at `k = 1, 2`: both `0.1895676565`, both `0.1858663269` | holds |
| 11.11.16 | `𝐀_{−10}(10) = 0.2366940285`, leading `0.2397408488`; `ν = 2000`: `0.99961`; `300 e^{1.2i}`: `0.99904`; `400 e^{2i}`: `0.99973`; `300 e^{−3i}`: `1.00057` | holds in `‖ph ν‖ ≤ π − δ` |
| `isBigO_angerWeberA_transition`, 11.11.17 | error × `‖ν‖`, `a = 1+i`: `0.0406`, `0.0408` (`ν = 10³`, `8·10³`); `a = −2`: `22.5`, `22.1`; complex `ν` in R02 | holds; narrowed (R02) |
| `angerJ_self_isEquivalent`, 11.11.18–11.11.19 | `ν = 100`, `1000.3`: ratios `0.99997`, `1.00288` (`𝐉`); `0.97714`, `0.99761` (`𝐄`); `ν = 20 e^{0.3i}`: `2.797 × 10⁶` | holds for real `ν`; DLMF's sector wrong |
| Layer 8 example | `𝐀_{0.7}(10⁻⁶) = 0.454676` vs `1/(0.7π) = 0.454728`: converges at the rate `z^{0.7}` | holds |

## Not verifiable

- Watson (1944), Olver (1974/1997), Babister (1967) and Dingle (1973) were not fetched: the
  README cites them in References and for the route of 6.3 only, and no sampled statement rests
  on a locator into them. The recurrence proposed in R10 is attributed to Watson §10.72 from
  memory and was checked numerically, not against the text.
- 11.7.9–11.7.11 (5.2, outside the sample) were not recomputed: the oscillatory quadrature did not
  finish. Their README Checks were verified by hand: 11.7.11 at `μ = 0` gives
  `π/(2^{ν+1} Γ(ν + 1))`, and `∫₀^R 𝐇₋₁ = 𝐇₀(R) → 0`.
- 11.11.17 for complex `ν` was tested at `ph ν = 1.0` and `2.0` only, not up to `π − δ`.
- 11.6.1 near the cut: at `ph z = 2.9`, `|z| = 60` the remainder after three terms is dominated by
  a term of size `e^{−|z| sin δ}`, which is consistent with the statement but does not test it. The
  expansion itself was confirmed on the positive axis, and in wide sectors only through 11.6.3 at
  `ph z = 2.7` and 11.9.9 at `ph z = 2.5`.

## Source issues

- **Error** in DLMF §11.4 at 11.4.15: the source says the relative error is below two thirds of the exponential of a quotient minus one, the one inside the exponent; it should be `(2/3)(exp(¼|z|²/|ν₀ + 3/2|) − 1)`; affects a stated result.
- **Misprint** in DLMF §11.4 at the sentence after 11.4.15: the source says `|ν₀ + 3/2|` is the smallest of `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 9/2|`, …; it should be `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 7/2|`, …; affects nothing.
- **Error** in DLMF §11.7 at 11.7.6: the source says the last term has numerator `(½z²)^{ν+1}`; it should be `z^{2ν+2}/2^{ν+1}`, which differs for principal powers where `|ph z| > π/2`; affects a stated result.
- **Gap** in DLMF §11.7 at 11.7.12: the source says the integral converges for `Re(μ + ν) > 0`; it should also require `Re μ > −3/2` and `Re ν > −3/2` (it diverges at `μ = 3`, `ν = −2`); affects a stated result.
- **Error** in DLMF §11.11 at 11.11.6: the source says the error term inside the bracket is `O(ν⁻²)` for complex `ν`; it should be `O(e^{π|Im ν|} ν⁻²)`; affects a stated result.
- **Error** in DLMF §11.11 at 11.11.18–11.11.19: the source says the approximations hold as `ν → ∞` in `|ph ν| ≤ π − δ`; it should be for real `ν → +∞` (off the axis `sin(πν) 𝐀_ν(ν)` dominates); affects a stated result.
