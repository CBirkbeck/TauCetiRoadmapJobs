<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17047#issuecomment-6902346528 -->
Red team round 1 pass a (claude) of 0cf1df5

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) Transference is cited to theorems stated only for `M_cbA(G)` symbols and, in part, only for `1 < p < ∞`

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:1931-1935` ("Prove that for
   every `m ∈ L^∞(ℝⁿ)` and `1 ≤ p ≤ ∞` … (cgpt-2023 (FS), lines 71–72; caspers-delasalle-2015
   Theorem 4.2, line 485, Theorem 5.2, line 543, and Corollary 5.3, line 626"), and the docstring at
   `packages/SchattenClassesAndSchurMultipliers/Suggested.lean:242-246`.

   **Claim.** The equality `‖S_{M_m}‖_{cb,p} = ‖T_m‖_{cb,p}` in `[0, ∞]` for every `m ∈ L^∞(ℝⁿ)` and
   every `1 ≤ p ≤ ∞` is presented as the content of the cited theorems.

   **Witness.** caspers-delasalle-2015 lines 485–486 and 626: both results assume `φ ∈ M_cbA(G)`
   (continuous, completely bounded at `p = ∞`); line 543: Theorem 5.2 is for `1 < p < ∞`. Instance:
   `m = sign` on `ℝ`, `p = 2`, is outside `M_cbA(ℝ)`; both sides are `1` (§3.5, §9.2).

   The statement is true at the README's generality and the README's own route proves it (§9.3 for
   every `m` and every `p`, mollification with §8.2 and the lower semicontinuity of §3.3); only the
   attribution overstates the sources. §9.4 already records the corresponding restriction of
   Lemma 4.1; §9.5 and the docstring do not.

   **Repair.** In §9.5, after the citation, add:

   > caspers-delasalle-2015 state Theorem 4.2 and Corollary 5.3 for symbols in `M_cbA(G)`, which are
   > continuous and completely bounded at `p = ∞` (lines 485–486 and 626), and Theorem 5.2 for
   > `1 < p < ∞` (line 543); cgpt-2023 (FS) states no hypothesis on `m`. The statement here, for every
   > `m ∈ L^∞(ℝⁿ)`, with values in `[0, ∞]` and with the endpoints `p ∈ {1, ∞}`, is proved by the
   > route below: the Fourier side holds for every `m` and every `p` by §9.3, and the Schur side
   > passes from continuous to arbitrary symbols by mollification and lower semicontinuity.

   In the docstring of `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` replace
   "(cgpt-2023 (FS); caspers-delasalle-2015 Theorem 4.2 and Corollary 5.3)" by
   "(cgpt-2023 (FS); caspers-delasalle-2015 Theorem 4.2 and Corollary 5.3 for symbols in `M_cbA`,
   extended to `L^∞` symbols in README §9.5)".

   Tested on the refuting instance: `m = sign`, `p = 2` is covered by the route (§9.3 gives
   `‖T_m‖_{cb,2} ≤ ‖S_{M_m}‖_{cb,2}`, mollification gives the reverse) and no longer attributed to a
   theorem that excludes it.

2. **F02** (P3) §10.3 and §10.4 read `Lᵖ(L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ)))` tracially through NoncommutativeIntegration §4.4 alone

   **Location.** `packages/SchattenClassesAndSchurMultipliers/README.md:2078-2079`
   ("`‖π_k(B)‖_{Lᵖ(L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ)))} = ‖B‖_p` … (NoncommutativeIntegration §4.4)"), the `*Needs:*`
   lines at 2106 and 2153, the Layer 10 dependencies at 2165-2166, and the contract bullet at 460-461.

   **Claim.** NoncommutativeIntegration §4.4 alone gives the norm `(∫ ‖f(s)‖_{S_p}^p ds)^{1/p}` on the
   tracial `Lᵖ` of `L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ))` for the trace `∫ ⊗ Tr`, the space in which the gap
   `semifinite-martingale-bmo-interpolation` is stated.

   **Witness.** `TauCetiRoadmap/NoncommutativeIntegration/README.md:880-881` and `:886`: §4.4
   identifies the Bochner space with `Lp(L∞(Ω)⊗̄M)` "for Layer 11's product state or weight", needing
   its §3.4, §3.5, §4.3, i.e. Haagerup spaces. The tracial comparison `Lp(M,τ)` ↔ Haagerup is its §3.5
   (`:760-761`).

   **Repair.** Add to "From TauCetiRoadmap.NoncommutativeIntegration":

   > - §3.5: for a semifinite trace `τ`, the tracial `Lᵖ(M, τ)` of its §1.3 is the Haagerup `Lᵖ(M)`
   >   isometrically. With its §1.5 this reads `Lᵖ(B(L²(ℝⁿ)))` in §4.4 as `S_p`, and
   >   `Lᵖ(L^∞(𝕋ⁿ) ⊗̄ B(L²(ℝⁿ)))` as the tracial space of `∫ ⊗ Tr` in which the martingale contract is
   >   stated (§10.3, §10.4).

   Change the `*Needs:*` line of §10.3 to "§1.1, §3.1, §10.1, §10.2; NoncommutativeIntegration §1.5,
   §3.5, §4.4", that of §10.4 to "§10.1–§10.3; NoncommutativeIntegration §1.5, §3.5, §4.4 and Part II
   (gap `semifinite-martingale-bmo-interpolation`)", and the Layer 10 dependencies to
   "NoncommutativeIntegration §1.5, §3.5, §4.4 and the Part II contract". NoncommutativeIntegration is
   earlier in the merge order, so no edge changes direction.

   Tested on the instance: with §3.5 and §1.5 added, the chain for `B = E` a rank-one projection and
   `p = 4` reads `‖π_k(E)‖_{L⁴} = (∫_{𝕋ⁿ} ‖W_{k,s} E W_{k,s}*‖_4^4 ds)^{1/4} = 1 = ‖E‖_4`, each
   identification having a cited owner.

Two P3 findings (a citation whose hypotheses the target drops; an unlisted supplier section). No P1
or P2 finding survived the checks below. `packages/SchattenClassesAndSchurMultipliers/README.md`
(2418 lines) and `packages/SchattenClassesAndSchurMultipliers/Suggested.lean` (288 lines) were read
in full. No Lean was run; the elaborated types were read from the worker's signature listing.

## Verified sound

**Dependency check** (run as the brief gives it, with `--movable --pr 17047`):

```
depcheck: 240 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 310 of `merge-order/ORDER.txt`, directly
after NoncommutativeIntegration (309); AutomorphicSpectralTheory is at 100, VonNeumannAlgebras 5,
CStarAlgebras 7. BanachSpaceTheory and OperatorTheory are on main. BochnerSpaces is neither on main
nor in the order: it is another author's open pull request adding a new roadmap folder, which the
rules admit.

**Counts.** Declarations read: 19 (8 definitions, 11 theorems; the signature listing counts 20
because it parses the word "is" in the module docstring as a declaration). Targets read: 45
(§1.1–§11.5). Source locators verified against the cached texts: 86 (lafforgue-delasalle-2011 33,
cgpt-2023 31, caspers-delasalle-2015 8, pisier-grothendieck-2012 9, mei-2007 2,
neuwirth-ricard-2011 1, potapov-sukochev-2011 2). Checks and worked examples recomputed: 61.
Sibling citations checked: 24 sections read at the owner (below) plus 17 OperatorIdeals ids
confirmed present. Library declarations confirmed at the pins: 38 names, 31 file paths, none
missing.

**Signatures.** Each elaborated type in the worker's listing was compared with its README statement:
every `def` carries its binders explicitly (`schattenGauge` keeps both `CompleteSpace` instances and
`Fact (1 ≤ p)`; `schurNorm`, `schurCbNorm`, `haagerupNorm`, `IsKernelOperator` mention every variable
they use); every theorem carries `[SigmaFinite μ]` and `MemLp M ∞ (μ.prod μ)` where the README
assumes a σ-finite space and an `L^∞` symbol. Nothing changed. No `#check` file was elaborated
(read-only pass).

**Adversarial pass, `Suggested.lean`.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `schattenGauge` | identity of `ℓ²(ℕ)`, `p = ∞` and `p = 2`; rank-one projection; zero space | `∞` (not compact), `∞` (`Σ 1 = ∞`); `1` for every `p`; `0` | agrees with §1.1 |
| `IsKernelOperator` | `{1,2}` counting, `k = 1_{(1,2)}` | `T δ₂ = δ₁`, `T = E₁₂`; transposed convention gives `E₂₁` | row convention fixed |
| `schurNorm` | `M = [[1,2],[3,4]]`, `p = 2`; `μ = 0` | `4` at `E₂₂`; `0` (all spaces zero) | agrees with §3.1 |
| `schurCbNorm` | `m = 0`; `M = 1`, `μ ≠ 0`; wrong model `M(x,y)δ_{ij}` | `0`; `1`; pinching kills block `(1,2)` | amplification is the constant one |
| `schurNorm_two_eq` | `μ = 0`; `M = [[1,2],[2,1]]` | `0 = 0`; `2 = 2 = ‖M‖_∞` | true |
| `schurNorm_eq_of_holderConjugate` | `(p,q) = (1,∞)`, triangular truncation on `M₂`; transpose symbol | `2/√3` both; `[[1,0],[1,1]]` also `2/√3` | true |
| `schurNorm_interpolation` | endpoint norms `(∞, 0)`; `(∞, c)`; `M₂` truncation, `p₀ = 2`, `p₁ = ∞`, `θ = 1/2` | `∞^{1−θ}·0 = 0` in `ℝ≥0∞`, and a zero endpoint forces `M = 0`, so left side `0`; `∞`; bound `(2/√3)^{1/2} ≈ 1.0746` | true without finiteness |
| `schurNorm_mono_of_abs_inv_sub_le` | `p = 2`, any `q`; `p = 1`, `q = ∞` | `|1/2 − 1/2| = 0`, gives `‖M‖_∞ ≤ ‖S_M‖_q`; `1/2 ≤ 1/2`, equality by duality | true |
| `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; `[[1,2],[2,1]]` (not PSD); empty `ι` | `2 = max diag`; `2 ≠ 1`, hypothesis needed; `0 = ⨆ ∅` | true |
| `haagerupNorm` | `[[1,2],[2,1]]`; `ξ = 0`, `‖η‖_∞ = ∞`; `μ = 0` | `2` (`‖ξ_j‖² = ‖η_k‖² = 2`, `|M₁₂| = 2`); `0·∞ = 0` only when `M = 0` a.e.; `0` | determines the constant |
| `schurNorm_eq_haagerupNorm` | `M₂` truncation; `cos(x−y)` on `ℝ`; non-separable `L²(μ)` | `2/√3` five times; `1` five times; `M` is measurable for a countably generated `𝒜₀ ⊗ 𝒜₀`, so `ℓ²(ℕ)` suffices | true |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | `μ = 0`; counting on `{1,2}`; countable–cocountable | `0 = 0`; excluded (`{1}` is an atom); excluded (whole space is an atom) | hypothesis is the right one |
| `schurNorm_le_iff_of_continuous`, cb form | `μ = 0`; `M(x,y) = x` on `ℝ`; `δ_{x₀}` on a discrete space larger than the continuum; `βℕ` with `Σ 2^{−n} δ_n` | support empty, both sides true; left false, right false at `N = 1`, `|s| > C`; class is the constant `1`, both `≤ C` iff `1 ≤ C`; support is `βℕ`, limits of matrices on `ℕ` | true; `MemLp` conjunct needed and present |
| `lpSchattenNorm`, `fourierMultiplierCbNorm` | `k = 0`; `m = 1`; `p = ∞` | `0`; `1`; essential supremum of operator norms (`schatten_top` at the pin) | agrees with §9.2 |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `n = 0`, `m = 2i`; `m = e_a`; `m = sign`, `n = 1`, `p = ∞` | `2 = 2`; `1 = 1`; `∞ = ∞` | true |
| `hmsNorm` | `sign(x−y)`; `φ(ξ) = ξ/√(1+ξ²)`; `n = 0` | `2`; `2 + 4/(3√3)`; excluded by `hn` | `Finset.range (n/2+2)` is `k ≤ σ_n` |
| `schurNorm_le_hmsNorm` | `M = 1`; `p ↦ p'` | `1 ≤ C·4·2`, so `C ≥ 1/8`; `p²/(p−1)` invariant | consistent |

**README statements recomputed** (values as found, all agreeing with the text): triangular
truncation `2/√3` (eigenvalues `4/3`, `1/3`); §1.3 `n^θ = n^{1−1/p_θ}` and `n^{1/4} < n^{3/4}`; §1.4
transpose `1`, `n`, `1`, `n` and the unbounded-`T` example (`‖T‖₁ = 0`, `‖T‖₂ = ∞`,
`‖T‖_{4/3} ≥ 1`); §2.1 `Σ ((j+½)π)^{−4} = 1/6 = ∫∫ min²`; §2.2 `i` against `−i`; §2.5 all six Checks;
§3.5 `(3/2)J − (1/2)vvᵀ`; §3.7 masses `(1,3)`; §5.1 averages `3/2`, `3/4`, `1/4`; §5.2
`[[1/2,1],[0,1/2]]`; §6.2 factorisation; §6.3 `0` against `1`; §6.4 `cos` factorisation and the
ultraproduct pairing; §7.1 ratio `1/4`; §9.1 covariance and mollification; §9.2 modulation and
duality; §9.3 the three bounds and the intertwining, with `R T_m R`; §9.4 Gaussian masses `0.995`,
`0.0995`; §10.1 column `(1−1/N)^{1/2}`, row `2^{−1/2}` (the matrix `diag(a) − aaᵀ` is real
symmetric, so real unit vectors suffice for Popoviciu); §10.3 thresholds `4^k ≥ √n` and
`4^k ≥ 4√n`; §10.4 operator form and the `n = 0` failure; §11.1 values; §11.3 `M_c`, `M_r` against
cgpt-2023 line 573 with `σ(A)(ξ) = π(A)(−ξ)`; §11.5 `max(p,p') ≤ p²/(p−1) ≤ 2 max(p,p')`; the
two-dimensional non-example `5.70` at `R = 10`.

**Suppliers read at their owners.** BochnerSpaces §4.2, §7.4, §7.5 at the head of its open pull
request (the `L^∞` contraction as adjoint of the `L¹` projection, the divisibility of atomless
finite measures, the Fubini isometry: all present as cited). BanachSpaceTheory B4.0 on main (the
reflexive density theorem is inside the section headed "An explicit failure of the approximation
property"). VonNeumannAlgebras V2, V2.RectangularL2, V4.Core, V13b (§13.2, the Hilbert-space
ultraproduct with quotient inner product, completeness and coordinate norm) on main.
NoncommutativeIntegration §1.5, §2.1, §2.3, §2.5, §2.6, §3.5, §4.4, §7.3, §8.4 on main.
AutomorphicSpectralTheory §0.8, §0.9, §0.10 at its open head (`kernel_apply`, `kernel_unique`,
`kernel_norm` present; §0.8 is for standard Borel spaces, as the README says). CStarAlgebras C1.6,
C3.2; UnboundedOperators §5.1 (UO-E01); OperatorIdeals ids OI-A12 … OI-C14.

NoncommutativeIntegration §2.1 on main writes the norming element as `u*|x|^(p−1)/‖x‖_p^(p−1)`
(`TauCetiRoadmap/NoncommutativeIntegration/README.md:457`), which is `0` for `x = E₁₂`. The package
does not consume that formula: its contract bullet states the order `|X|^{p−1}u*` with the `E₁₂`
witness, and §1.2 builds the element itself. This is a defect of the supplier on main, not of this
package.

**Gaps.** Both declared gaps have the same slug in `design/plan.json` and in the README, a named
supplier and a single precise `needs` sentence; neither asks for something already provided
(AutomorphicSpectralTheory §0.8 is standard Borel only; NoncommutativeIntegration §8.4 is
finite-tracial only).

**Ownership.** Searched main and the open heads by object for Schur multipliers on Schatten
classes, Herz–Schur and Toeplitz symbols, the Haagerup factorisation of symbols, operator-valued
and matrix BMO, the Hörmander–Mikhlin–Schur theorem and kernels of Hilbert–Schmidt operators: no
second owner. `schattenGauge` also exists as `TauCetiRoadmap.OperatorIdeals.schattenGauge` on main,
a different fully qualified name and a different object (a symmetric gauge for real `p`).

**Headlines and padding.** The seven end theorems of the Summary are stated; the one not stated
(multiplicativity and `*`-compatibility of `M ↦ S_M`) is named in the module docstring with the
missing carrier. No declaration is a one-tactic consequence of the pinned libraries, a restated
definition or a mirrored Check.

**Policy.** The pull request changes only `packages/SchattenClassesAndSchurMultipliers/`. No
`set_option`, `lemma`, `#eval`, pull-request number or process narrative; every target has a
locator; imports are `import Mathlib` and five existing `TauCeti.*` modules.

**Source independence:** 9 passages compared with 3 sources (lafforgue-delasalle-2011 lines 226–238,
254–259, 383–390, 487–501, 555–559; cgpt-2023 lines 264–270, 348–352, 455–484;
caspers-delasalle-2015 lines 26–41), none shared beyond four consecutive words; largest share
lafforgue-delasalle-2011, 43 of 124 locators; contents compared with lafforgue-delasalle-2011
(§1.1–§1.5): independent. Its §1.2 is split over Layers 3, 4 and 6, its §1.3 is one target of
Layer 3, its §1.4 is split over Layers 5 and 7, and Layers 2, 9, 10 and 11 have no counterpart; the
order Layer 5 before Layer 6 is forced by the `*Needs:*` line of §6.4 (§5.1).

## Not verifiable

- The uncertified sources (pisier-similarity-2001, grafakos-classical-2014, simon-trace-ideals-2005,
  gohberg-krein-1969, reed-simon-1-1980, paulsen-2002, horn-johnson-topics-1991, musat-2003,
  jrwz-2020): cited by locator only; texts not read. The attributions of musat-2003 and jrwz-2020
  were checked only through mei-2007 lines 3229–3230 and cgpt-2023 lines 483–484 and 1499.
- The equality `‖S_M‖_∞ = 2/√3` for the triangular truncation on `M₂`: the lower bound was
  recomputed; the upper bound was not.
- The finiteness of `|||M|||_{HMS}` for `φ((x − y)/⟨x⟩)` with Schwartz `φ` (Examples of Layer 11):
  the scaling argument was read, the constants were not computed.
- BochnerSpaces does not define "atomless"; the README fixes the reading (no `IsAtom` set). Whether
  that roadmap's §7.5 adopts the same reading cannot be settled from its text.
- OperatorIdeals ids were confirmed to exist; their statements were not compared one by one with
  the uses in §1.1 and §2.1.
- Truth of the two gap contracts and of the deep theorems (Theorems 1.7, 1.18, 1.19 of
  lafforgue-delasalle-2011, Theorem A of cgpt-2023) rests on the sources; only their statements,
  hypotheses and boundary cases were checked.

## Source issues

- **Misprint** in lafforgue-delasalle-2011 at Remark 1.4, line 249: the source says `S_q` is the interpolation space between `S_p` and `S_{p'}` with `1/q = θ/p' + (1−θ)/p` for `2 ≤ p ≤ q`; it should be `S_p` between `S_q` and `S_{q'}` with `1/p = θ/q' + (1−θ)/q`; affects nothing.
- **Misprint** in lafforgue-delasalle-2011 at the proof of Lemma 1.9, line 348: the source says the embedding goes from `S_p(L²(X, ν))` into `S_p(L²(X, ν))`; it should be into `S_p(L²(X, μ))`; affects nothing.
- **Gap** in lafforgue-delasalle-2011 at the definition before Lemma 1.17, lines 487–488: the source says an atom is a measurable set that cannot be split into two sets of positive measure; it should also require positive measure; affects nothing.
- **Error** in cgpt-2023 at §1.2, lines 375–378: the source says `π_k ∘ J_k(A)` has mean zero for every `k`; it should be for `4^k ≥ √n` (for `n = 2`, `k = 0` two points of one unit cube are at distance `1.27`); affects the proof.
- **Gap** in cgpt-2023 at the proof of Theorem 1.1, line 506: the source says `‖A‖_p` is the limit of `‖J_k(A)‖_p`; it should be the inequality `‖A‖_p ≤ liminf_k ‖J_k(A)‖_p`, which is what is justified and used; affects the proof.

## For the human reviewers

- **Licence.** `sources.toml` records lafforgue-delasalle-2011, mei-2007 and neuwirth-ricard-2011 from preprint versions whose numbering was not compared with the published versions (its `version_note` fields); README locators cite the preprints.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0cf1df530fd157bd1a821a276b5ce097b33c16a3", "job": "RT-SchattenClassesAndSchurMultipliers~1a", "model": "fable", "worker": "chris-x90"} -->
