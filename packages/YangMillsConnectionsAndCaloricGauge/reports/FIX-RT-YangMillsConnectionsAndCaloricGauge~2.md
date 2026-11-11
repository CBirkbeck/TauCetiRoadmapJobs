# FIX-RT-YangMillsConnectionsAndCaloricGauge~2: repair report

Ten findings from the two red-team reviews (2a: 2 findings, 2b: 8 findings). None overlaps another,
so each is settled in its own section. Edited files: `packages/YangMillsConnectionsAndCaloricGauge/README.md`
and `packages/YangMillsConnectionsAndCaloricGauge/sources.toml`. `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: no Lean name and no supplier gap was added or removed.

## RT-YangMillsConnectionsAndCaloricGauge~2a/F01 (P1) — applied

The witness holds. With `O_(∞) = exp(i x₁/|x|)`, `B = 0`, `η'` equal to `M` near `3e₂` and `b = jβ dx²`,
the `k`-component of `(F[A+b] − F[A])₁₂` is `−2Mβ∂₁(x₁/|x|)`, with `∂₁(x₁/|x|) = 1/3` at `3e₂`. So the left
side grows like `M` while the old right side does not depend on `M`.

§6.1 old: the bound had `+ ‖O_(∞)‖_{C¹}`. New: it is stated for `A = −η'O_(∞);x + B` with
`+ ‖η'‖_{L^∞}‖O_(∞)‖_{C¹}`, and the route is given (Hölder; Hardy with constant `1` at `p = d/2`). A new
Check carries the witness. The pattern search found no other quantitative use: §6.2 approximates with a
fixed cut-off, and §§5.3–5.4 are qualitative.

## RT-YangMillsConnectionsAndCaloricGauge~2a/F02 (P2) — applied

The witness holds. Recomputed: the squared distance is at most `max(a², 1−a+a²) < 1`, the centres are at
least `√2a` apart, and `B_ℓ(0)` lies in a ball only if `ℓ ≤ ε`. The source's Remark 3.8
(OhTataru-TopClass lines 1279–1281) does derive a uniform Lebesgue number from separation.

§3.3 old: unit balls with centres separated by `c(d)`, bound `≲_{R,M} 1`. New: a covering margin `ℓ`
(Lebesgue number) is required and the bound is `C(d,G,R,M,ℓ)`. Separation is dropped because the
Scenario (2) argument never uses it. Three Checks were added: half-radius cover gives `ℓ = ½`, the
eight-ball witness, and a single ball. The §4.4 route now chooses half-radius covers.

## RT-YangMillsConnectionsAndCaloricGauge~2b/F01 (P2) — applied

The witness holds. Take `‖P_kF‖₂ = |k|⁻²` for `k ≤ −1`. Then `‖F‖_{ℓ¹L²} = π²/6`, but
`Σ 2^{2n(2−σ)}n⁻⁴ = ∞` for every `σ < 2`. §§10.2 and 10.4 consume an `ℓ¹L²` solution operator.

§8.2 old: an a priori bound only. New: for every `F ∈ ℓ¹L²` there is a unique `B ∈ ℓ¹Ḣ² ⊂ C₀`, and it agrees
with the `Ḣ^σ` solution whenever both exist. Route: existence from finite block sums plus completeness;
uniqueness from `Δ|z|² = 2|Dz|²` and the weak maximum principle. Two Checks added. PDE §3.2 was added to
the *Needs* of §8.2, Layer 8's Dependencies and the supplier line.

## RT-YangMillsConnectionsAndCaloricGauge~2b/F02 (P3) — applied

PDE on main pairs Definition 2.15 with the homogeneous space, and Theorems 2.82/2.85 with the
inhomogeneous decomposition (its `S_j = 0` for `j ≤ 0`). So our locators pointed at nonhomogeneous
items.

Changes: §8.1 now cites "Definition 2.15 in §2.3 … and the completeness theorem of that section", and "the
homogeneous paraproduct and remainder theorems of §2.6", noting that 2.82/2.85 of §2.8 are the
nonhomogeneous analogues. The References entry and the `sources.toml` locator were changed to match.
Theorem numbers inside §2.3/§2.6 are deliberately not given, because the book is uncertified (see Notes).

## RT-YangMillsConnectionsAndCaloricGauge~2b/F03 (P3) — applied

The finding holds: 8.1 realises `Ḣ^σ` only for `σ < 2`, so `Ḣ¹ ∩ Ḣ³` was not defined.

The Conventions now define `Ḣ¹ ∩ Ḣ^σ` and `ℋ ∩ Ḣ^σ` for `σ > 1` as elements of `Ḣ¹` (resp. `ℋ`) with a finite
block `ℓ²` sum, normed by the sum of the two norms. They agree with the realised intersection for
`1 < σ < 2`, and completeness is proved by Fatou. One repair covers every occurrence (§§9.3, 9.4, 9.5,
10.2). A Check was added to 8.1: `x₁` has every block `0` and is excluded because it is not in `L⁴`.

## RT-YangMillsConnectionsAndCaloricGauge~2b/F04 (P3) — applied

The finding holds: `TauCetiRoadmap/PDE/README.md` has no "curl"; its §2.3 gives Riesz transforms with
multiplier `−iξ_j/|ξ|`.

§4.3 now proves the identity `∂_iu_j = −R_iR_j(div u) − Σ_k R_iR_k(∂_ku_j − ∂_ju_k)` (symbols recomputed:
the right side gives `2πiξ_iû_j`) and the `L^p` bound for `1 < p < ∞`. Two Checks were added: the
gradient case, and the failure at `p = 1` (Newtonian-potential witness, `‖∇u_ε‖₁ ≳ log(1/ε)`).

Line edits: the supplier line now reads "§4.3 derives …", with uses in §4.3 and through §4.4 in §5.2;
§8.2 is dropped from the uses because its route uses no div–curl estimate. The *Needs* line reads
"PDE §2.3 (Riesz transforms …)".

## RT-YangMillsConnectionsAndCaloricGauge~2b/F05 (P3) — applied

The finding holds. LieGroups Layer 5A on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`
lines 641–660) stops at `z ⊕ [𝔤,𝔤]`, semisimplicity and a negative-definite Killing form.

Changes:
- Added to From Mathlib: `LieAlgebra.IsKilling.instSemisimple` and
  `LieAlgebra.IsSemisimple.isSimple_of_isAtom`. Both were confirmed at the pin by `#check`.
- The LieGroups supplier text no longer claims the decomposition.
- §1.6 now proves that the simple ideals and the centre are orthogonal for any `ad`-invariant metric,
  and states the max formula with its proof.
- Three Checks were added. One is `√2 = max(√2, √2/2)`; another shows a cross term `4c ≠ 0`
  breaking invariance.

## RT-YangMillsConnectionsAndCaloricGauge~2b/F06 (P3) — applied

Old title: "# Roadmap: yang–mills connections …". New: "# Roadmap: Yang–Mills connections …".

The earlier round read "lower-case title" literally. Titles on main keep proper names in sentence case
("Kac–Moody", "Belyi", "Chevalley–Demazure", "Ax–Lindemann"), and this title already capitalised
"Euclidean".

## RT-YangMillsConnectionsAndCaloricGauge~2b/F07 (P3) — applied

The finding holds. OhTataru-YMHF line 2520 states the `Ḣ¹ ∩ Ḣ^{σ'}` clause, and line 1893, (5.33), gives
the tame bound.

Changes:
- §9.5 now says: if `a, b ∈ Ḣ¹ ∩ Ḣ^{σ'}`, `σ' > 1`, then `B_∞` exists there with
  `‖B_∞‖_{Ḣ^{σ'}} ≲ ‖b‖_{Ḣ^{σ'}} + ‖b‖_{Ḣ¹}‖a‖_{Ḣ^{σ'}}`. The route goes through the envelope bounds
  (Lemma 5.24) and lower semicontinuity.
- §9.4 now spells out (5.33).
- Added an abelian Check for `Ḣ¹ ∩ Ḣ³`.

## RT-YangMillsConnectionsAndCaloricGauge~2b/F08 (P3) — applied

Verified: FourManifolds at its open head, Layer 5 introduction (lines 2284–2287), states
`E(A)=8π²k+2‖F_A⁺‖²`. SmoothBundlesConnections on main (lines 88–89) assigns the self-dual and
anti-self-dual energy comparisons and BPST to FourManifolds.

A sentence was appended to the FourManifolds scope bullet. It says the `ℝ⁴` identity for rough
connections (§1.5 pointwise, §6.3 integrated) is stated here, and the closed-manifold form and BPST on
`S⁴` stay with FourManifolds. No *Needs* line changed.

## Checks run

- **Elaboration.** `lake env lean packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean`, run from
  the content checkout, exited 0 with no messages (about 4.5 s). The file declares nothing, so there was
  no `#check @name` comparison to make and nothing changed in it. Separately, a scratch file with
  `#check @LieAlgebra.IsKilling.instSemisimple` and `#check @LieAlgebra.IsSemisimple.isSimple_of_isAtom`
  elaborated at the pin. The first needs `[Field K] [IsKilling K L] [Module.Finite K L]`; the second
  needs `[IsSemisimple R L]` and `IsAtom I` and returns `IsSimple R I`. This matches the README's description.
- **Dependency check.** Output in full:

      depcheck: 236 roadmaps, 2136 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve`). After the edit it first reported
  "FourierAnalysis, §2.3: no roadmap FourierAnalysis". That was a false positive: it parsed the source key
  `BahouriCheminDanchin-FourierAnalysis, §2.3` as a roadmap citation. The sentence was reworded to
  "Definition 2.15 in §2.3", and a rerun reports no unresolved citation and no unresolved Lean name.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §6.1 perturbation bound with `‖η'‖_∞` | SU(2) witness with `M`; `[0,1]` cut-off; `b = 0` | LHS `k`-coefficient `−2Mβ/3` at `3e₂`, RHS `∝ M`; with `η'` in `[0,1]` the factor is `1`; `b = 0` gives `0 = 0` | holds; Check added |
| §6.1 Hardy step | `p = d/2`, `d = 3, 4` | `p/(d−p) = 1`; `p ≥ 3/2 ≥ 1`, `p < d` | within gap `hardy-inequality` |
| §3.3 margin-`ℓ` patching | eight balls in `ℝ⁴`; half-radius cover; single ball | `r²−ar+a² ≤ max(a², 1−a+a²) < 1`; separation `√2a`; margin `ε`; `½+½ = 1`; `{B₁}` gives `ℓ = 1`, `A = A_(1)` | holds; separation not needed (Scenario (2) uses only `λ₀(ℓ)` and `R`) |
| §8.2 `ℓ¹L²` existence and uniqueness | witness `|k|⁻²`; `A = 0` with `1`, `x₁`; Fourier mode | `Σ n⁻² = π²/6`; `Σ 2^{2n(2−σ)}n⁻⁴ = ∞`; blocks of `1`, `x₁` are `0`, neither is in `C₀`; `Δ_A B ∈ L²` termwise (`L⁴·L⁴`, `L²·L^∞`) | holds; 2 Checks |
| §8.2 uniqueness identity | `ad(A_j)` skew | `Δ|z|² = 2|Dz|² + 2⟨z, Δ_A z⟩`; `∇|z|² ∈ L^∞·L⁴` | holds (PDE §3.2) |
| Conventions `Ḣ¹ ∩ Ḣ^σ`, `σ > 1` | `x₁`, test function, `σ ∈ (1,2)` | `x₁ ∉ L⁴`; `Σ 2^{6k}‖P_kφ‖² < ∞`; agrees with realised intersection below `2` | holds; Check added |
| §4.3 div–curl identity | gradient, divergence-free, sign flip | symbol `2πiξ_iû_j`; gradient gives `−4π²ξ_iξ_jφ̂`; flipped sign gives `−∂_iu_j` | holds |
| §4.3 `L^p` bound, `p > 1` | Newtonian witness at `p = 1` | `‖div u_ε‖₁ = O(1)`, `‖∇u_ε‖₁ ≥ c_d|S^{d−1}|log(1/2ε)` | `p = 1` excluded; Check |
| §1.6 orthogonality and max formula | `𝔰𝔲(2)²` with `−tr`/`−4tr`; cross term `c`; `𝔲(2)`; `𝔤 = 0` | `max(√2, √2/2) = √2` (sum `3√2/2`, RMS `√5/2`); invariance defect `4c`; `−i tr X = 0`; empty family gives `0` | holds; 3 Checks |
| §9.5 `Ḣ¹ ∩ Ḣ^{σ'}` clause | `U(1)`, `σ' = 3` | `‖P_kB_∞‖ ≤ ‖P_kb‖` blockwise, so `‖B_∞‖_{Ḣ³} ≤ ‖b‖_{Ḣ³}` | holds; Check |
| §9.4 tame bound (5.33) | `σ = 1`, `a = 0` | at `σ = 1` the right side is `‖b‖_{Ḣ¹}(1 + ‖a‖_{Ḣ¹}) ≤ (1 + M₁)‖b‖_{Ḣ¹}`, consistent with (5.31); at `a = 0` it is `‖b‖_{Ḣ^σ}`, the heat-flow bound | consistent; restated from the source in our own words |
| §6.3/§1.5 vs FourManifolds | `SU(2)`, `χ = 8π²c₂` | `ℰ_e − χ = 2I₊` gives `E = 8π²k + 2‖F⁺‖²` | consistent; scope sentence |

## Notes for the maintainer

- **Ownership.** The whole-space div–curl estimate (§4.3) and the orthogonality of the simple ideals (§1.6)
  are now stated here. Searches by object (`roadmaps grep` for div–curl, Riesz transforms and Helmholtz,
  plus the board packages) found no other owner. PDE §2.3 supplies only the Riesz transforms. PDE §5.7's
  identity `∂_i∂_j(Φ*f) = R_iR_jf` uses the same `R_j` normalisation as ours. The only other hit,
  IncompressibleFlows, is on the never-cite list.
- **Not verifiable: BahouriCheminDanchin-FourierAnalysis.** It remains uncertified. Three things support
  the section numbers: PDE on main uses Definition 2.15 for the homogeneous space and Proposition 2.10
  for the §2.2 dyadic partition; an arXiv paper found by search cites §2.6 for paraproduct estimates; and
  our own recollection of the book's contents. The text itself was not read. No `needs-references.toml`
  entry was made, because the work is settled as uncertified.
- **Names and consumers.** No cited identifier changed. All section numbers are unchanged, and every new
  text sits inside existing sections.
- **Untrusted text.** Nothing suspicious was found in the reviews.
