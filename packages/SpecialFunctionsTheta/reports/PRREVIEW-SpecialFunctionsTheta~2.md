# Review of SpecialFunctionsTheta (pull request #2252 at 76a507d)

**Verdict:** needs changes

## R01 (P2) — The Siegel upper half-space and the theta constants with characteristics have other owners that the README does not name

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:121–126` ("**Overlaps with open roadmaps.** Two open roadmaps state results of this one for their own use …"), 7.1 (`siegelUpperHalfSpace ι`), 7.3 and 7.6.

**Claim:** Two further roadmaps own these objects, and Scope and ownership names neither. MetaplecticAutomorphicForms is earlier in the merge order (line 157 against 423). The paragraph is also written against the state of the pull requests ("open", "can precede").

**Witness:** `TauCetiRoadmap/SiegelModularForms/README.md:570–574` at #1714 defines `ℍ[g]`; lines 1601–1608 state the count `2^{g−1}(2^g + 1)`, "`θ_ε = 0` iff `ε` is odd" and the law of `{θ_ε²}`. MetaplecticAutomorphicForms 8.10 (#1063, README:2491) defines `SiegelSpace`.

**Repair:** Replace the paragraph by: "**Neighbouring statements.** QSeriesPartitionsAndMockModularForms §5.1 states the zeros of `θ₁`, `θ₁′(0) = 2η³` and the laws under `τ ↦ τ + 1`, `τ ↦ −1/τ` for `ϑ(z; τ) = −θ₁(πz|τ)`; ThetaInvariantsOfEuclideanLattices 1.7–1.8 states `K(k) = (π/2)θ₃²(0|it)` and the value of `θ₃(0|i)`. SiegelModularForms 0.3 builds the subtype `ℍ[g]` over `Fin g` with its manifold structure, and MetaplecticAutomorphicForms 8.10 the degree-two subtype; `siegelUpperHalfSpace ι` is the underlying set of matrices, kept as a `Set` over a finite type `ι` because Layer 7 needs no manifold structure. SiegelModularForms 5.4 states the count of even characteristics, the vanishing of the odd theta constants and the law of `{θ_ε²}` for `θ_ε(τ) = θ[ε′/2, ε″/2](0|τ)`; these are 7.3 and 7.6 at `z = 0`. This roadmap consumes none of the four." State the merge order against #1063 and #1714 in the pull request description.

## R02 (P2) — The modular transformation 7.6 is statable and absent, and the docstring names no headline as not statable

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/Suggested.lean:17–20`: "It is not an exhaustive acceptance test: the other headlines of the README are targets of the same standing, stated in prose." Also `README.md:82–84` and 7.6.

**Claim:** 7.6 is statable at the pins (`Matrix.symplecticGroup`, `Matrix.fromBlocks`) and is not stated. The hypergeometric form of 6.4 is not statable (the pinned Tau Ceti has no principal Gauss function), and the docstring does not say so.

**Witness:** The statement below elaborates in a scratch copy with `sorry` as the only warning (38 `sorry` warnings with the statements of R06 and R07). `grep gaussHypergeometric` on the pinned Tau Ceti returns nothing.

**Repair:** Add to Layer 7:

```lean
theorem riemannTheta_symplectic {A B C D : Matrix ι ι ℤ}
    (hM : Matrix.fromBlocks A B C D ∈ Matrix.symplecticGroup ι ℤ)
    (hAC : ∀ i, Even ((Aᵀ * C) i i)) (hBD : ∀ i, Even ((Bᵀ * D) i i)) :
    ∃ ζ : ℂ, ζ ^ 8 = 1 ∧ ∃ s : Matrix ι ι ℂ → ℂ, ContinuousOn s (siegelUpperHalfSpace ι) ∧
      ∀ Ω ∈ siegelUpperHalfSpace ι,
        s Ω ^ 2 = (C.map (Int.cast : ℤ → ℂ) * Ω + D.map (Int.cast : ℤ → ℂ)).det ∧
        (A.map (Int.cast : ℤ → ℂ) * Ω + B.map (Int.cast : ℤ → ℂ)) *
            (C.map (Int.cast : ℤ → ℂ) * Ω + D.map (Int.cast : ℤ → ℂ))⁻¹ ∈ siegelUpperHalfSpace ι ∧
        ∀ z : ι → ℂ,
          riemannTheta ((C.map (Int.cast : ℤ → ℂ) * Ω + D.map (Int.cast : ℤ → ℂ))⁻¹ᵀ *ᵥ z)
              ((A.map (Int.cast : ℤ → ℂ) * Ω + B.map (Int.cast : ℤ → ℂ)) *
                (C.map (Int.cast : ℤ → ℂ) * Ω + D.map (Int.cast : ℤ → ℂ))⁻¹) =
            ζ * s Ω *
              cexp (π * I * (z ⬝ᵥ (((C.map (Int.cast : ℤ → ℂ) * Ω + D.map (Int.cast : ℤ → ℂ))⁻¹ *
                C.map (Int.cast : ℤ → ℂ)) *ᵥ z))) * riemannTheta z Ω := by
  sorry
```

Name it in README 7.6 and add the modular transformation to the Layer 7 bullet of the Summary. Replace the two docstring sentences by: "It states the roadmap's headline theorems against the pinned APIs. Not statable at the pins: the hypergeometric form `F(½, ½; 1; λ(τ)) = θ₃²(0|τ)` of 6.4, which needs the principal Gauss function of SpecialFunctionsHypergeometric; the pinned Tau Ceti does not have it." Reword `README.md:82–84` to match. Rename the Lean section comment of Layer 4 to the README's title.

## R03 (P2) — 7.6 names no proof route, and its `*Needs:*` line cannot carry one

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:1076`: "*Needs:* 7.1–7.2; 3.1 for `g = 1`."

**Claim:** 7.1–7.2 are the definition and the quasi-periodicity. The case `M = [[0, −1], [1, 0]]` in genus `g` is Poisson summation on `ℤ^g ⊂ ℝ^g`, which no layer, supplier or `*Needs:*` line provides.

**Witness:** ThetaSeries on main owns it: `TauCetiRoadmap/ThetaSeries/README.md:423` ("Layer 1: Poisson summation for a lattice", `poissonSummation`, line 126). This README cites ThetaSeries only as a boundary (line 115).

**Repair:** Add the route to 7.6: "Proof: for fixed `Ω`, the left side divided by the exponential factor has the quasi-periodicity of 7.2, so by 7.4 at `N = 1` it is `c(M, Ω) θ(z|Ω)`; `c` is `ζ_M det(CΩ + D)^{1/2}` by reindexing when `C = 0` and by Poisson summation when `M = [[0, −1], [1, 0]]`." Replace the line by "*Needs:* 7.1–7.2, 7.4 at `N = 1`; ThetaSeries Layer 1 (Poisson summation for a lattice); 3.1 for `g = 1`." Add ThetaSeries to Exact supplier contracts. If the route passes through generators of the group, state their generation as a target with its locator.

## R04 (P3) — 7.6: the negative-control Check misdescribes its matrix

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:1071–1072`: "for which `diag(Aᵗ B)` and `diag(Cᵗ D)` are even but `diag(ᵗB D)` is not".

**Claim:** For this `M`, `diag(AᵗB)` is odd. No symplectic matrix separates the two conditions: `M ↦ M⁻¹` exchanges them, so they define the same group.

**Witness:** `A = [[1,1],[0,1]]`, `B = [[0,1],[0,1]]`: `A·ᵗB = [[1,1],[1,1]]`, diagonal `(1, 1)`; `ᵗB·D = [[0,0],[0,1]]`, diagonal `(0, 1)`.

**Repair:** "for `M = [[1, 1, 0, 1], [0, 1, 0, 1], [0, 0, 1, 0], [0, 0, −1, 1]]`, which is symplectic and fails the parity condition (`diag(ᵗB D) = (0, 1)`), the quotient is not: at the `Ω` of 7.4 and `z = (0.3 + 0.2i, 0.1)` its eighth power is `0.17812 8… + 0.19227 5… i`."

## R05 (P3) — 7.2: the sign Check has the two factors exchanged

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:997–998`: "the factor would be `e^{π}` instead of `e^{−π}`."

**Claim:** At `g = 1`, `m′ = 1`, `τ = i`, `z = 0` the stated law gives `exp(−πi·i) = e^{π}`; the wrong sign gives `e^{−π}`.

**Witness:** `jacobiTheta₂ i i / jacobiTheta₂ 0 i = 23.1406926328 = e^{π}`; `e^{−π} = 0.0432139183`.

**Repair:** "the factor would be `e^{−π}` instead of `e^{π} = 23.14069 26…`."

## R06 (P3) — `exists_eq_sum_thetaBasis` drops the linear independence that 1.5 states

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/Suggested.lean:105–110` (`∃ c : Fin N → ℂ, …`) against `README.md:365` ("and the `Θ^{a,b}_{N,r}` are linearly independent") and `Suggested.lean:18` ("each with every conclusion the README attaches to it").

**Claim:** The Lean statement gives existence only. The genus-`g` form `existsUnique_eq_sum_riemannThetaChar` has `∃!`.

**Witness:** `#check @exists_eq_sum_thetaBasis` ends in `∃ c, ∀ z, f z = ∑ r, c r * thetaBasis N (↑r) a b z τ`.

**Repair:** Write `∃! c : Fin N → ℂ, …` and rename to `existsUnique_eq_sum_thetaBasis` (elaborates in a scratch copy).

## R07 (P3) — `card_even_halfCharacteristics` mentions none of the roadmap's objects

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/Suggested.lean:351–354`.

**Claim:** The statement counts pairs in `(Fin g → Fin 2)²` with an even dot product; no theta function occurs in it.

**Witness:** Its elaborated type contains only `Fin`, `Finset.filter`, `Even` and a sum.

**Repair:** Replace it by the count of even theta functions (elaborates; true because an odd characteristic gives a nonzero odd function), and keep the combinatorial count in README 7.3:

```lean
theorem card_even_riemannThetaChar [Nonempty ι] {Ω : Matrix ι ι ℂ}
    (hΩ : Ω ∈ siegelUpperHalfSpace ι) :
    Nat.card {ab : (ι → Fin 2) × (ι → Fin 2) // ∀ z : ι → ℂ,
        riemannThetaChar (fun i ↦ (ab.1 i : ℝ) / 2) (fun i ↦ (ab.2 i : ℝ) / 2) (-z) Ω =
          riemannThetaChar (fun i ↦ (ab.1 i : ℝ) / 2) (fun i ↦ (ab.2 i : ℝ) / 2) z Ω} =
      2 ^ (Fintype.card ι - 1) * (2 ^ Fintype.card ι + 1) := by
  sorry
```

## R08 (P3) — 6.2: the route uses the argument principle and `*Needs:*` omits it

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:842–843, 852`: "Proof: the boundary correspondence and the argument principle on truncations of `F`." … "*Needs:* 1.3, 3.1, 6.1."

**Claim:** The argument principle is neither in the `*Needs:*` line nor in Exact supplier contracts.

**Witness:** The pinned Tau Ceti has `argumentPrinciple_windingNumber_of_analyticOnNhd` (`TauCeti/Analysis/Complex/Conformal/ArgumentPrinciple.lean:116`).

**Repair:** "*Needs:* 1.3, 3.1, 6.1; Tau Ceti `argumentPrinciple_windingNumber_of_analyticOnNhd`." Add the declaration to "From Tau Ceti".

## R09 (P3) — 7.4 has two Checks

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:1030–1035`.

**Claim:** The definition of the genus-`g` space of order `N` needs at least three Checks.

**Witness:** At `(z, τ) = (0.2 + 0.1i, 0.3 + 0.9i)`: `θ₃(πz|τ)² = 1.1813577139 − 0.0188996194i`, equal to `θ₃(2πz|2τ)θ₃(0|2τ) + θ₂(2πz|2τ)θ₂(0|2τ)`; the first term alone is `1.0075125054 − 0.0014366009i`.

**Repair:** Add: "In genus one with `N = 2` the two basis functions are `θ₃(2πz|2τ)` and `θ₂(2πz|2τ)`, and the square identity is 2.4 at `w = z`: at `(z, τ) = (0.2 + 0.1i, 0.3 + 0.9i)` both sides are `1.18135 77… − 0.01889 96… i`."

## R10 (P3) — Pull request title names one source's chapter

**Location:** Title: "SpecialFunctionsTheta: roadmap for DLMF Ch 20 (theta functions)".

**Claim:** At the head the layers are not DLMF Chapter 20: Layer 7 (the Riemann theta function in genus `g`) and 1.5 lie outside it, and the Summary says the organization follows no one text.

**Witness:** `README.md:6–7`: "Its organization follows the structure of the subject rather than any one text."

**Repair:** "SpecialFunctionsTheta: roadmap for theta functions".

## R11 (P3) — Pull request description: "Each headline cites at least one book" is false

**Location:** Description: "Each headline cites at least one book with its printed page, alongside the DLMF equation number."

**Claim:** Seven subsections with headlines cite DLMF alone.

**Witness:** `README.md:552` (3.4, "DLMF 20.10.4–20.10.5"), 464 (2.4), 719 (5.2), 751–758 (5.3), 791 (5.5), 884 (6.4), 908 (6.5): no book locator at the statement.

**Repair:** Add a book locator to each, or write: "Most headlines cite a book with its printed page alongside the DLMF equation number; 2.4, 3.4, 5.2, 5.3, 5.5, 6.4 and 6.5 cite DLMF alone."

## Verified sound

| Statement | Instances | Computed left | Computed right | Result |
|---|---|---|---|---|
| 1.2 conjugation, parity (`jacobiThetaOne_conj`) | `(0.3+0.2i, 0.4+0.9i)`; `Im τ ≤ 0` | `θ₁(z̄\|−τ̄) = 0.2276357286−0.2726321850i`; `0` | `conj θ₁`: same; `0` | holds; `θ₁(0.3\|i) = 0.2681439563` real |
| 1.1 series (`hasSum_jacobiThetaOne`) | `(0.3+0.2i, 0.4+0.9i)` | definition `0.2276357286+0.2726321850i` | series: same | holds; four README values agree |
| 1.3 (`_add_lattice`, `_add_one`) | `(2,−1)`, `(0.2+0.1i, 0.3+0.7i)`; `(0.3+0.2i, 0.7+0.5i)` | `−1.9012459059−0.2218338281i`; `−0.2158875802+0.4652625718i` | same; `e^{iπ/4}θ₁`: same | holds |
| 1.4 heat equation | `(0.3+0.2i, 0.4+0.9i)`, `j = 1..4` | residual `0` to `1e−10` | wrong sign: `2∂_τθ₁ = −0.4321321573+0.4011945606i` | holds; Check agrees |
| 1.5 basis (`exists_eq_sum_thetaBasis`) | `(N,r,a,b) = (3,1,1,0), (3,2,0,1), (2,1,1,1), (4,3,1,1)` | both relations: residual `≤ 4e−10` | `iθ₁ = Θ^{1,1}_{1,0} = −0.1489793720+0.1863573590i` | holds; R06 |
| 2.1 Riemann (`two_mul_…_eq_sum`) | README point | `2.2676236566+0.6879932510i` | same; sign controls `0.1012263`, `1.6958998` | holds |
| 2.2–2.4 | `τ = i`, `0.3+0.8i`; README points | `θ₃⁴(0\|i) = 1.3932039297` | `θ₂⁴+θ₄⁴`: same; 20.7.6, 20.7.10, 20.7.13–14, 20.7.25 residuals `≤ 1e−15` | holds |
| 3.1 (`jacobiThetaOne_neg_inv`) | `(0.3+0.2i, 1.7+0.6i)` | `0.1394308507+0.6024770099i` | same; other three residuals `≤ 5e−16` | holds |
| 3.2 (`thetaGaussSum_reciprocity`) | all `m, n ≤ 12`, `mn` even; `(1,1)` | 0 failures; `G(2,4)/2 = 1−i` | `(1,1)`: `1` vs `0.7071−0.7071i` | holds without coprimality |
| 3.3 Mellin transforms | derivation termwise; `s = 2, 3, 1` | `π/6`; `7π^{−3/2}Γ(3/2)ζ(3) = 1.33919…` | `ln 2·π^{−1/2}Γ(½) = ln 2` | holds; domains as DLMF 20.10.1–3 |
| 3.4 (`integral_exp_mul_jacobiThetaFour`) | `(2, 1.4, 0.3)`; complex `β` by inversion | termwise `0.1172651330`, `0.3041667623` | closed forms `0.1172651330`, `0.3041667623` | holds; `\|Re β\|+\|Im β\| ≤ ℓ` is the bound at `t → 0+` |
| 4.1 (`hasProd_jacobiThetaThree`) | `(1.7−0.4i, −0.8+0.6i)` | product `0.4556653533+1.6984464088i` | `θ₃(πz\|τ)`: same | holds |
| 4.2–4.3 (zeros, `deriv_…_zero`, `_eq_eta`) | `τ = i`, `−1.3+0.2i` | `θ₁′(0) = 2.4880688563−1.1936278860i` | `θ₂θ₃θ₄`, `2η³`: same; `η(i) = 0.7682254223` | holds |
| 4.4 Landen and the eta form | `(0.3+0.2i, 0.4+0.9i)`; `(0.3+0.1i, −2.19+1.29i)` | `1.0056638297−0.0041150135i`; `−0.1871575018−0.3110651823i` | `θ₄(0\|2τ)`: same; eta form: same; principal root: opposite sign | holds; 20.7.16, 20.7.19, 20.7.21 residuals `≤ 4e−16` |
| 4.5 Ramanujan's `f` | README points | `f(−½,−¼) = 0.2887880951` | `∏(1−2⁻ⁿ)`: same; product form at `(0.3+0.2i, −0.5+0.4i)` agrees | holds |
| 5.1 logarithmic derivatives | `z = 0.3+0.5i`, `τ = 0.4+0.9i` | `−0.0176787193−0.0039841641i`; `0.1111723560−0.2497205728i` | series: same; `θ₂`, `θ₄` residuals `≤ 3e−16` | holds; strips as DLMF |
| 5.2 double products | `(π/2, i)`; `(0.3+0.2i, 0.4+0.9i)`, `j = 1..4` | paired `0.9412580999−0.0919483361i` | `θ₄`: same; symmetric range `0.7584646372+0.1558201718i = e^{iz}θ₄` | holds; inner limits match `sin`, `cos` quotients |
| 5.3 power series | `(0.25+0.1i, 0.2+0.9i)`; `τ = i` | `0.6851331539+0.3313889761i` | same; `δ₆(i) = 0`, `δ₄(i) = 3.1512120022`; `α_{2j}/(2·4^j) → 1` | holds; `α₂` in Eisenstein order `9.9557833533+0.2622798726i` both ways |
| 5.4 (`hasSum_iteratedDeriv_three_…`) | `τ = i`, `−0.3+0.5i` | `−0.9549296586`; `−1.4228415900−0.9033436906i` | series: same; `−3/π` | holds |
| 5.5 (`hasSum_watson`) | README points | `1.0265387728+0.0506833610i`; `1.2305723070−0.9373640929i` | quotient: same | holds |
| 6.1 (`modularLambda_neg_inv`, inversion) | `0.3+0.8i`, `−1.7+0.4i`; `t = 0.2..4` | `0.2339971250−0.4097863253i` | `1−λ`: same; `k(it)` decreasing `0.9999988 … 0.0074697` | holds |
| 6.2 (`bijOn_modularLambda`) | boundary points | `λ(1+0.5i) = −32.9705627485` | semicircle `2.3642677423`, `1.0012537369`; `Re τ = −1`: `−1`, `−0.0303` | boundary values as stated |
| 6.3 (`legendreK_thetaModulus`) | `t = 0.7, 1, 2.3` | `K(k) = 2.3460485103` | `(π/2)θ₃² = 2.3460485103`; `K(k′) = 1.6422339572 = tK` | holds |
| 6.4 (`carlsonRF_modularLambda`) | `0.3+0.8i`, `2.3+0.8i`, `4.6+1.1i`, `−0.95+0.4i`; `0.5+0.3i` | `1.8569935908+0.4507587083i`; outside: `1.5375378836−0.4583784279i` | same; outside: `0.7639640465+2.5625631394i` | holds on `F+2n`, fails outside; `K′ = −iτK` only on `F` |
| 6.5 (`carlsonRF_jacobiTheta`) | `t = 0.8, 0.3, 2`, 360-point grids; `z = 1.6` | max difference `1.4e−11`, arguments off the cut | `z = 1.6`: `1.5020718561` vs `1.5589818517` | holds in the rectangle |
| 6.6 combined theta functions | `(0.3+0.2i, 0.4+0.9i)` | `φ_{2,3} = 0.9587094777−0.0370145061i` | four other forms: same; `φ_{4,1}(π/2\|i) = 1.1803405990` | holds |
| 7.1 definition, genus-one bridge | README points | `1.0699237438`; `−0.5338654885−0.3851384064i` | `θ₃(0.1π\|i)`; `−θ₁`: same; `θ[½,0] = θ₂`, `θ[0,½] = θ₄` | holds |
| 7.2 (`riemannTheta_add_lattice`) | genus 2, `m = (1,−2)`, `m′ = (2,1)` | `−1.80271e10+3.14674e10i` | same to 12 digits | holds; R05 |
| 7.3 parity, count | `g = 1, 2, 3` | `3, 10, 36` | `2^{g−1}(2^g+1)`; `g = 0`: `1 ≠ 2`, so `hg` needed | holds; R07 |
| 7.4 order `N` (`existsUnique_…`) | basis laws derived; genus-2 square | `1.2513027841−0.2747675712i` | same; `a = 0` term `1.0043105456−0.0102374967i` | holds; R09 |
| 7.5 (`riemannTheta_mul_four`) | README genus-2 point | `1.4591809523−0.2958949099i` | same | holds |
| 7.6 modular transformation | README `M₁`, `M₂` at two `(z, Ω)` | `M₁`: quotient `1.0000000000` | `M₂`: quotient⁸ `0.178+0.192i`, `0.935+0.336i` | law holds for `M₁`; R02–R04 |

Previous review (at 7dbb8e2), finding by finding:

| Id | Passage at this head | Status |
|---|---|---|
| R01 | 4.1: "It is ClassicalArithmeticCompletion 4.40 at `q ↦ q²` and `w = −qp²`" | repaired |
| R02, R03 | Scope: "QSeriesPartitionsAndMockModularForms (§5.1) states …", "ThetaInvariantsOfEuclideanLattices (1.7–1.8) states …" | repaired; wording in R01 |
| R04 | `hasSum_watson`, `bijOn_modularLambda`, `carlsonRF_modularLambda`, `integral_exp_mul_jacobiThetaFour` declared; stand-in deleted | repaired; docstring in R02 |
| R05 | "`F = {τ \| 0 < τ.im, \|Re τ\| < 1, …}`" | repaired |
| R06, R07 | gate `tex=0`, `prnum=0` | repaired |
| R08 | `I_mul_jacobiThetaOne_eq_thetaBasis` absent | repaired |
| R09 | 6.1 "DLMF 23.15.6, 23.18.1, 23.18.3"; 6.3 "DLMF 23.15.1"; 4.3 "DLMF 23.15.9"; 5.3 "20.6.6–20.6.9" | repaired |
| R10–R13 | Checks added; `### Examples` in Layers 6–7; 35 `*Needs:*` lines for 35 subsections; no `combinedTheta`; M-test under Inputs | repaired |
| R14 | "Layer 7: the Riemann theta function in genus `g`" | repaired |
| R15, R16 | Description: "4.40 owns the triple product, formally and in its analytic specialization"; "holds near z = 0, and in the open period rectangle" | repaired |

- **Sources checked:** DLMF release 1.2.8 read at the locator for every DLMF number of the 15 sampled targets (20.2.1–20.2.14, 20.4.1–20.4.12, 20.5.1–20.5.17, 20.6.1–20.6.10, 20.7.1–20.7.34, 20.8.1, 20.9.1–20.9.5, 20.10.1–20.10.5, 20.11.1–20.11.9, 20.13.1, 23.15.1, 23.15.6, 23.15.9, 23.18.1, 23.18.3): all match, with the README's stated corrections. No book locator could be read (below).
- **Library declarations opened:** Tau Ceti `Carlson/Basic.lean:91` (`carlsonRF`: product of principal powers of each factor), `Legendre.lean:95`, `Gauss.lean:60`, `Carlson/Legendre.lean:288`, `Hypergeometric.lean:134`, `Lemniscate.lean:148`, `Conformal/ArgumentPrinciple.lean:116`; Mathlib `TwoVariable.lean:262–466`, `SymplecticGroup.lean:102`, `AddCircleMulti.lean:324`. All 62 `#check` lines of `Suggested.lean` elaborate.
- **Cross-roadmap citations resolved:** ClassicalArithmeticCompletion 4.40 (main, README:8245–8265), SpecialFunctionsHypergeometric Conventions, 1.3, 1.4 (main, README:157, 374, 402), ThetaSeries (main, README:33–34), EllipticIntegrals (main, README:55–59), ModularForms (main, README:25), QSeriesPartitionsAndMockModularForms §5.1 (#1391, README:803), ThetaInvariantsOfEuclideanLattices 1.7–1.8 (#2038). All as cited. No `Suggested.lean` at an open head or on main declares one of this file's names.
- **Gate and dependency check:** the gate at 76a507d passes every check. `depcheck: 243 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 35 warnings, all "declaration uses `sorry`". `#check @` of the 50 declarations: the five flagged binders are `[DecidableEq ι]` (and `[Fintype ι]` on `intVec`), which no statement needs; every type matches its README statement except R06.
- **One-tactic probes:** `rfl`, `simp`, `simp`/`norm_num` with the five definitions and Mathlib's `jacobiTheta₂_add_left`, `_add_left'`, `_add_right`, `_conj`, `_neg_left`, `_undef`, `ring_nf` after unfolding, `decide`: 0 of 35 theorems close.
- **Duplication at the pins:** the pinned Mathlib and Tau Ceti have no `θ₁, …, θ₄`, `λ`, order-`N` space, or theta function of several variables (`grep` of `jacobiTheta`, `modularLambda`, `nome` over both); Tau Ceti's `JacobiElliptic/Basic.lean` and `ThetaSeries/` state none of the 35 theorems.
- Overlap check: read ThetaInvariantsOfEuclideanLattices, EllipticIntegrals, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, and SiegelModularForms, MetaplecticAutomorphicForms, QSeriesPartitionsAndMockModularForms, ThetaSeries; SpecialFunctionsGamma, SpecialFunctionsAppell, SpecialFunctionsLegendre and SpecialFunctionsGeneralizedHypergeometric were searched at their heads for theta objects and have none. Real `K`, AGM, real Carlson integrals: EllipticIntegrals and Tau Ceti. Principal `F`: SpecialFunctionsHypergeometric. Triple product: ClassicalArithmeticCompletion 4.40. Siegel upper half-space and theta constants with characteristics: unsettled with SiegelModularForms 0.3, 5.4 and MetaplecticAutomorphicForms 8.10 (R01). `θ₁` facts and `K` at `τ = it`: this roadmap, stated in Scope.

Source independence: 6 passages compared with 1 source (DLMF §§20.5, 20.6, 20.9, 20.10, 20.11, 20.13), none shared; largest share DLMF, 36 of 127 locators; contents compared with DLMF Chapter 20: independent (Layer 3 draws on §§20.7(viii), 20.10, 20.11(i); Layer 4 on §§20.4, 20.5, 20.7, 20.11(ii); Layers 1.5 and 7 have no counterpart). The ten books could not be read.

## Not verifiable

- Whittaker–Watson (1927), all locators (26): the sources service found no legal copy of the 4th edition; the 1920 edition on archive.org was refused by the service's host list and was not read.
- Mumford, *Tata Lectures on Theta I* (22 locators, among them the parity condition and (5.1), p. 189, of 7.6): paywalled (DOI prefix 10.1007); recorded as uncertified.
- Lawden, Chandrasekharan, Igusa, Freitag, Koecher–Krieg, Andrews–Berndt (Springer), Armitage–Eberlein (Cambridge), Stein–Shakarchi (Princeton): publisher texts, not read; their locators and the translations of normalizations in Conventions are unchecked.
- The route of R03 through 7.4 at `N = 1`: given from the mathematics, not checked against Mumford, Ch. II §5.
- The `lean-DLMF` provenance table and the two formalizations named under Prior formalization: not opened.

## Source issues

- **Error** in DLMF at 20.7.34 (§20.7(ix), release 1.2.8): the source gives the constant as `i^{−1/4}` times a square root of `θ₂(0,q²)θ₄(0,q²)/2` with no branch; it should be the holomorphic root `e^{−iπ/8}η(τ)η(4τ)/η(2τ)`, since the principal root has the wrong sign at `τ = −2.19 + 1.29i`; affects a stated result.
- **Error** in DLMF at 20.6.1 (§20.6, release 1.2.8): the source gives one disc, reaching the nearest nonzero lattice point, for all four series 20.6.2–20.6.5; it should reach the nearest zero of each `θⱼ(π·|τ)`, which is `½` for `θ₂` at `τ = i`; affects a stated result.
- **Gap** in DLMF at 20.9.3 (§20.9(i), release 1.2.8): the source states the `R_F` identity with no condition on `z`; it should be restricted to a neighbourhood of `0`, or the open period rectangle for `τ = it`, as it fails at `τ = 0.8i`, `z = 1.6`; affects a stated result.
- **Gap** in DLMF at 20.9.2 and 20.11.5 (§20.9(i), §20.11(iii), release 1.2.8): the source states them for complex `τ` with no domain; with principal branches they should be restricted to the translates `F + 2n` of the `Γ(2)` region, as they fail at `τ = 0.5 + 0.3i`; affects a stated result.

## For the human reviewers

- **Licence.** `README.md:1125–1160` says `lean-DLMF` (Apache-2.0, the author's repository) is source material for every layer, with a per-layer table; whether `Suggested.lean` statements are adapted from it was not checked.
- **Not tested.** Ten of the eleven cited sources are books that could not be read legally; wording and arrangement were compared with DLMF only, which has the largest share of locators (36 of 127).
- **Licence.** DLMF pages were read from `dlmf.nist.gov`, a host the sources service does not classify; they were fetched as an institutional copy.
