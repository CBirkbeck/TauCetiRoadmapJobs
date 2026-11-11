# FIX-PKG-KloostermanMomentsAndPotentialAutomorphy~5

This round settles the one finding of `REV-PKG-KloostermanMomentsAndPotentialAutomorphy~4` (P1). I
checked it against FSY, the MixedHodgeModulesAndIrregularHodgeTheory board package (§§5.3, 6.4–6.5,
9.1, 9.4, 11.1–11.6) and this roadmap's §§3.4–3.6, 4.1, 5.4–5.5 and 6.4. The finding is correct.

Only `packages/KloostermanMomentsAndPotentialAutomorphy/README.md` changed. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no headline or Lean name is
affected, and the one supplier gap the repair uses (`irregular-stationary-phase`) is already declared.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~4/F01 (P1) — applied

**Verification.** The claim is false under both readings of "degree-one de Rham fibre".

- *The exponential fibre.* The fibre is `ω(M) = H¹_dR(𝔸¹_τ, M ⊗ E^τ)`. The supplier's §6.4
  (l. 616) and FSY Remark A.6 (FSY lines 2915–2918) give a pure input of weight `w` the exponential
  weight `w`. With `W_jω(ΠN) = ω(W_jN)` (supplier §6.5; FSY lines 2930–2940) the fibre has weight
  `nk`, not `nk + 1`. At `r = 2`, `k = 2` it is the fibre of `Sym² K̃l₂`: dimension 3, weight 2.
- *The Fourier cohomology.* FSY Corollary A.31(1)–(2) (lines 3256–3262) gives
  `H¹(𝔸¹_t, FT M^H) = coker N(−1)`. That has weight `w + 1` only for `M` smooth at 0. FSY lines
  1426–1435 give, for even `k`: `P₀` of dimension `k − 2`, `P₁` of dimension 1, and
  `gr^W = P₀(−1) ⊕ P₁(−1)`. At `k = 2` this is `ℚ(−2)`, weight 4.

**Change, old → new** (§3.6, l. 1071–1093). "The degree-one de Rham fibre has weight `nk + 1`" →
three bullets:
1. `ω(M)` is pure of exponential weight `nk`.
2. `H¹(𝔸¹_t, FT M^H) = coker N(−1)`, with weights `nk + 1 + i`.
3. The exact sequence to `H¹(𝔾_m, Sym^k K̃l_r)`.

New Checks at `k = 2` (the review's control), `k = 3` and `k = 0`. `k ≥ 1` is now stated.

**Where this differs from the suggested repair.** The suggested repair says the latter object's
weights "are computed in §6.4". I state its weight structure for every rank (bullets 2 and 3)
instead. Two reasons:
- §6.4 is rank two only.
- §4.1 needs the general structure (see Pattern).

**Pattern.** The only other place that relied on the false claim is the §4.1 proof sketch ("the pure
Gauss–Manin subobject of §3.6 and strictness of weights identify the lowest weight with the middle
cohomology"). Strictness alone does not give `H¹_mid = W_{nk+1}H¹`: at `r = 2`, `k = 2`,
`H¹(FT M^H)` has weight 4, not 3. That sketch now follows FSY's proof of Theorem 3.2 (FSY lines
836–886):
- by bullet 3, `W_{nk+1}H¹` lies in `H¹(FT M^H)` and has dimension `dim P₀`;
- stationary phase at the origin (`gap:irregular-stationary-phase`) makes the codimension of the
  middle space `Σ_{i≥1} dim P_i`.

The §4.1 Needs line now also lists:
- MixedHodgeModulesAndIrregularHodgeTheory §§11.1–11.5;
- PadicDifferentialEquationsAndRigidCohomology §RD.6.52a;
- SpringerResolutionAndCharacteristicCycles §9.6.

Both of the last two are already suppliers of this roadmap. They are added to the Layer 4
Dependencies.

Other places checked:
- The scope paragraph (l. 96–98) and the supplier contract (l. 285) now include supplier §11.1, the
  definition of `H^j(𝔸¹_t, FT M^H)` that the new bullets use.
- §6.4's sketch already treats the singular case through the nearby cycles at `τ = 0`, so it is
  unchanged.
- No other passage gives a de Rham fibre a weight, or applies §11.3 to a singular input.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result, change |
|---|---|---|---|
| §3.6 fibre `ω(M)`: dimension `binomial(r−1+k,k)`, exponential weight `nk` | `(r,k) = (2,1),(2,2),(2,3),(3,2)` | dimensions `2, 3, 4, 6`; weights `1, 2, 3, 4`. Wrong model "`nk+1`": `2, 3, 4, 5`. At `k = 2`, supplier §6.4 / FSY Remark A.6 give 2, which excludes 3. | True as restated. |
| §3.6 `H¹(𝔸¹_t, FT M^H)`: `gr^W_{nk+1+i} = P_i(−1)` | `r = 2`, `k = 1, 2, 3, 4` | Dimensions `(P₀, P₁)`: `(1,0)`, `(0,1)`, `(3,0)`, `(2,1)`. Weights: `{2}`, `{4}`, `{4}`, `{5,6}`. Against §6.4: `k=1` gives `(1,1)`. `k=2` gives `(2,2)`. `k=3` gives `(1,3),(2,2),(3,1)`. `k=4` gives `(1,4),(4,1)` and `(3,3)`. All agree. | True. The old "weight `nk+1`" fails at `k = 2` (`4 ≠ 3`) and `k = 4` (has 6). |
| "pure of weight `nk+1` iff `N = 0`" | `k = 2` (`N ≠ 0`, pure of weight 4); `k = 3` (`N = 0`, pure of weight 4 = `nk+1`); `ψ_{τ,1} = 0` (zero space) | 4 ≠ 3 and `N ≠ 0`; `4 = 4` and `N = 0`; vacuous | True in both directions. |
| Hypothesis "no section at `τ = 0`" | `k = 0` | `M = FT⁻¹O = δ_0` is punctual; `H⁰_dR(FT δ_0) = H⁰_dR(O) = ℂ ≠ 0` | False at `k = 0`. Added `k ≥ 1` to §3.6 and a negative-control Check. |
| §3.6 exact sequence `0 → H¹(FT M^H) → H¹(𝔾_m, Sym^k K̃l_r) → H¹(FT M′^H) → 0` | `r = 2`, `k = 1, 2, 3, 4` | `1+1=2`, `1+1=2`, `3+1=4`, `3+1=4`; §5.5 cover dimensions `k+1` (odd `k`), `k` (even `k`) give `2, 2, 4, 4`. Quotient weight `2k+2` = `4, 6, 8, 10`, each `≥ k+2`. | True. |
| Local monodromy at 0, `r = 2`, `k = 2` (k = 2 Check) | rank 2, `dim φ = 1`, eigenvalue `(−1)² = 1` (§5.4) | `T − 1` has rank 1 and `(T−1)² = 0`: one Jordan block of size 2. Centre `nk − 1 = 1`: weights 0 and 2, `P₁ ⊂ gr^W_2` of dimension 1, `P₀ ⊂ gr^W_1 = 0`. | Agrees with FSY lines 1432–1433 (`P₀` of dimension `k−2 = 0`). |
| §4.1 route: middle dimension `= dim P₀` | `r = 2`, `k = 2, 3, 4` | Regular part of `Sym^k K̃l₂` at `∞` (exponents `2(2j − k)t`, value 0 only for even `k`): rank 1, 0, 1, so codimension `1, 0, 1`. `Σ_{i≥1} P_i = 1, 0, 1`. Middle dimension `0, 3, 2` = §5.5 cover middle `k−2, k, k−2` = `0, 3, 2`. | Consistent. |
| Sign and normalisation witness: `ω(M)` is the fibre at `t = 1` | supplier §6.5 (kernel `E^{tτ}`); `FT δ_0 = O` | `ω(δ_a) = ℂ` (supplier Check); at `t = 1 ∈ 𝔾_m`, `Sym^k K̃l_r` has full rank. The sign of the point does not matter, since every point of `𝔾_m` is generic for `Sym^k K̃l_r`. | No change needed. |

## Checks run

- `lake env lean packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean`, from the pinned
  content checkout: exit 0. There are exactly four `declaration uses 'sorry'` warnings, at lines 90,
  109, 191 and 206. The file has no `TauCeti.*` import, so no module build was needed.
- Elaborated binders: I put `#check @name` for all 21 declarations in one scratch copy and
  elaborated it once (exit 0). Every declaration keeps its binders: `[Field F] [Finite F]`,
  `[Fact (Nat.Prime p)]`, `0 < k`, `Odd k` and `Even k → 0 < k`. Each type matches its README
  statement. Nothing changed, since `Suggested.lean` is unchanged.
- Dependency check (the brief's exact command), output:

      depcheck: 236 roadmaps, 2153 edges, 0 problem(s)

  There are no UPWARD, CYCLE or `moved:` lines.
- Citation resolver: one lead, `MixedHodgeModulesAndIrregularHodgeTheory §2.1`, the same as before.
  It is a false positive: the target is in the board package `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`,
  which precedes this roadmap in the merge order. Every supplier section newly cited exists there:
  §§5.3, 6.4, 6.5, 9.1, 11.1–11.5. PadicDifferentialEquationsAndRigidCohomology §RD.6.52a and
  SpringerResolutionAndCharacteristicCycles §9.6 were already cited elsewhere in this README.

## Notes for the maintainer

- No Lean name, section number or target id changed. No other roadmap's citation is affected.
- Ownership: the repair adds no construction. The fibre `ω`, Fourier cohomology, costalk and
  stationary phase stay with MixedHodgeModulesAndIrregularHodgeTheory and are cited by section. I
  did not re-search the open pull requests for this edit, because it introduces no new object.
- Sources: all locators are in the FSY entry already in `sources.toml`: Remark A.6, (A.8)–(A.9),
  Corollary A.31, the proofs of Theorem 3.2 and Proposition 4.20. No new text was needed, and
  `needs-references.toml` was not written.
- No suspicious instructions were found in the review text.
