# Review of DivisibilityOfThetaDerivatives (pull request #3160 at 8c6c8b8)
Folder: `TauCetiRoadmap/ShortGRH/DivisibilityOfThetaDerivatives/`
**Verdict:** needs changes

**Summary.** Changes are needed. The 15 sampled sections agree with the formal proof they follow, and the earlier findings on the sigma function, on headline (2) and on the wording of the sketches are repaired; but 5.3 (a) lacks the hypothesis that the couplings form a family (it is false without it), 23 inputs are still cited from a "ShortGRH background" that no roadmap owns, supply still runs both ways between this roadmap and OneSidedPrimeSumBoundsAndAdmissibleData (which also states 1.7 (b) again), `Suggested.lean` still states nothing although the count is statable, the layers keep the formal proof's groups and headings, and the pull request still changes the umbrella and the top-level README. There are three small corrections and two format notes; the scope, the licence of the source and the umbrella are for the human reviewers.

## Previous findings

- R01 (the sigma function of 2.1): repaired. 2.1 now reads "`σ(z) = σ_W(z)·exp(−s₂z²/2)`", states the multiplier `ε(l)·exp(H(l, z) + H(l, l)/2)`, and has the Check `θ′(0) = 0`; this is the function of [ShortProof] `Lib/CM/Sigma/Basic` (`PeriodPair.σ`).
- R02 (inputs cited from "ShortGRH background"): not repaired; each entry now names the form used and the declaration, but none has an owner. R01 below.
- R03 (headline (2) at the scale `𝔱_E`): repaired. The summary now reads "integral at every prime at the scale `δ̄·d·𝔱_E`, hence at the scale `𝔱_E` at the primes that do not divide `d·N(δ)`".
- R04 (two supply cycles; `I_p`, `v(π_p)`, `γ_p` with two owners): partly. `s_p` and `S_p` are now cited from OneSidedPrimeSumBoundsAndAdmissibleData §4.1, and CompositeThetaLiftsAndShortForms §2.1 (a) cites 2.1 here, so that cycle and the double definition are gone. The two-way supply with OneSidedPrimeSumBoundsAndAdmissibleData remains. R03 below.
- R05 (`Suggested.lean` states nothing): not repaired. R05 below.
- R06 (the layers are the source's contents): partly. Published works are now named, and the summary says who consumes 1.5 and 1.6; the layers and headings are unchanged. R06 below.
- R07 (sketches reproducing docstrings): repaired. The Methods of 2.3, 3.2 and 4.8 are rewritten; the longest runs still shared with [ShortProof] are statements of facts of at most 17 tokens, symbols included.
- R08 (changes outside the roadmap folders): not repaired. R07 below.
- C01–C04: repaired (NormsOfThetaLiftsAndExchangeIdentities now exists and its §6.4 cites 5.5, 5.6; `S_p` and `C_P` carry their suppliers' names; 5.5 and 5.6 list 1.5; the Origins of 1.1–1.3 and 1.6 name Neukirch and Weil). N01: partly (N01 below). N02: repaired (the Check of 3.1).

## R01 (P1) — Twenty-three inputs, among them the Weil model on which Layers 4 and 5 are stated, are cited from "ShortGRH background", which no roadmap owns

An implementer of 4.1 finds no statement of the space `𝒮(V)`, the vacuum, `ϱ`, `ω(g)`, `θ_V` or `Θ_f` to build on: 4.1 says "the model of [ShortProof] named on the *Needs:* line", and the scope section says of these entries that each "is a result still to be stated as a numbered target". The same holds for the sigma function and the formal parameter of a CM lattice (2.1–2.3, 2.5, 4.10, 5.2), the exponential of a series over `ℂ_p` (2.4), Schur matrices (3.4), the Chowla–Selberg formula with a unit (4.2), Fock vectors and the integrated action (4.4), sections of CM lattices and Fourier inversion (4.5, 4.6, 4.9, 5.6), complex multiplication for theta functions (4.6, 4.7), splitting characters (1.4) and characters of `U(1)` of given weight (1.6): 23 entries on the *Needs:* lines of 18 sections. A pointer into a formal proof is a citation, not a supplier: these prerequisites are in no layer, no named roadmap section and no pinned declaration, and the dependency check cannot see them.

The entries are now precise enough to become targets as they stand. The smallest repair is to state them as numbered sections, here (for instance a layer on CM lattices and their theta functions, and one on the adelic Weil model with Fourier inversion) or in a named roadmap of the family, and to cite those sections on the *Needs:* lines. Where a section on main already states the object in another normalisation (ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a; ThetaChainsOnDefiniteUnitaryGroups §3.1c, as the three "Relation to the library" notes say), the new target states the comparison.

## R02 (P2) — 5.3 (a) does not assume that `(Φ₀, e)` is a family of couplings, and without that the valuation is not "exactly `|j|·v(c₀) − v(ν″!)`"

The paragraph before (a) lets `(Φ₀, e)` be arbitrary and defines when it is a family of couplings; (b) says "For a family of couplings", (a) does not. The formal statement has the hypothesis (`New.IsCouplingFamily.norm_coeff_pairExponent` takes `he : IsCouplingFamily pr Φ₀ e`).

Without it (a) fails. Take `Φ = {1, 2, +}`, `pr_e(τ) = +` for all `e` and `τ`, `Φ₀ = {1, 2}`, `e_1 = e_2 = 1` (not a family: `pr_1(2) = pr_1(1)`), `W = 1`, all `λ = 1`, `n = 1` and `δ_1` a primitive root of unity of order `2(p + 1)`. Since `(p^e + 1)p^j` is an odd multiple of `p + 1` for odd `e`, `Ξ_λ(δ_1z) = −Ξ_λ(z)` and `F(z)F(δ_1z) = 1`. For `j = (1, p − 1)`: `ν′ = p[1] + p(p − 1)[2]`, `ν″ = p[+]`, and the coefficient is that of `z_1^p z_2^{p(p−1)} z_+^p` in `exp(c₀Ξ_λ)`, namely `c₀^p·C(p, 1)/p! + c₀·C(p, 1)`, of valuation `p·v(c₀)`. The statement gives `p·v(c₀) − 1`.

Repair: begin (a) with "Let `(Φ₀, e)` be a family of couplings and".

## R03 (P2) — Supply runs both ways between this roadmap and OneSidedPrimeSumBoundsAndAdmissibleData

A roadmap has one direction of supply; with edges both ways neither of the two can be placed before the other in the merge order. This roadmap needs OneSidedPrimeSumBoundsAndAdmissibleData §§2.1, 2.2, 3.1, 3.2, 3.3, 4.1 (1.1, 1.2, 1.5–1.7, 2.1, 4.3a, 5.4–5.6). That roadmap needs this one: its §3.1 takes 1.1 and the constant of 4.6 (b) into `C_P` (README line 478), its §3.3 takes 1.7 (a) (line 546), its §3.4 takes 1.4–1.6 (line 596), and its §4.1 takes `I_p` and `v(π_p)` of 2.1 (line 717). The sections are acyclic, as the description says, and 4.3a was split off for that reason; the two roadmaps are not. The dependency check reports no problem; the edges above were found by reading the two READMEs.

OneSidedPrimeSumBoundsAndAdmissibleData defines the parameters and the data, so it is the earlier one, and what it takes from here moves down to it: the different of `E` and its size at the infinite places (1.1, 1.7 (a), which use the parameters only) next to its §2.3; the residue characters and the characters `χ₀`, `χ_M` (the second half of 1.5, 1.6) into its §3.4, their only consumer there; `π_p`, `v(π_p)`, `I_p` into its §4.1. For the constant of 4.6 (b), `C_P` can take it as a parameter that the roadmap combining the bounds supplies. Other cuts are possible; what is needed is that one of the two no longer cites the other.

## R04 (P2) — 1.7 (b) is stated a second time in OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (c)

1.7 (b) reads "`x^{10} ≤ |δ_E|_v ≤ x^{12}` at every `v ∈ Φ`, and `x^{10} ≤ rd_E ≤ x^{12}`". OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (c) states "`x^{10} ≤ rd_E ≤ x^{12}`, and `x^{10} ≤ |δ_E|_v ≤ x^{12}` at every infinite place `v`", and proves it from 1.7 (a) (its *Needs:* line 546 and its Method). One statement has two owners, and the description's paragraph "Nothing stated twice" does not hold for it. Repair: keep it in §3.3 (c), where the sizes of the data are, replace 1.7 (b) by that citation, and let 4.3a need §3.3 (c).

## R05 (P2) — The count (headline 1) is statable at the pins, and `Suggested.lean` states nothing

The docstring now says that 3.3, written out from `MvPowerSeries`, would be "a long ad hoc encoding of the setting of 2.4 and 3.1, which is not made here". It is neither long nor ad hoc. A scratch file of 67 lines states 3.3 (a) at the pinned Mathlib, with `sorry` the only warning and no option set: five definitions with real bodies (the jet `Σ_k k!·Q_k·F_k`, the coupling `Γ_e`, the normal form with the coupling series given coefficient by coefficient, the product of minors of a diagram with a filling as a product of `Matrix.det`, and `D_p(κ)` as a `tsum`), the partner `−p^e·τ` on `(ZMod q₁)ˣ`, and the theorem in the norm form `‖jet_{P_y}(F)‖ ≤ p^{−(D_p(κ) − f·N³·(1 + log_p max(B, 1)))}`. The carriers are `ℂ_[p]`, `MvPowerSeries.rescale`, `PowerSeries.subst`, `PowerSeries.exp`, `MvPolynomial` and `Matrix.det`. These definitions are the roadmap's own objects of 2.4 and 3.1, the ones an implementer must make first. As it stands the file tests none of the three headlines. Repair: state 3.3 (a) with these definitions and drop its bullet from the docstring; headlines (2) and (3) are rightly named as not statable.

## R06 (P2) — The five layers are the five groups of the formal proof's contents for `New/Derivatives`, four of them under the source's own title

The organisation of a roadmap is its own and no layer is named after a source's chapter. [ShortProof] `CONTENTS.md`, part "Derivatives of theta functions", has the groups "Derivatives that count primes", "The field and its characters", "The formal group and the exponential factor", "The integral vacuum", "The bound is attained". Layers 1, 2, 4 and 5 carry the last four titles (Layer 1 with "`E`" added) and Layer 3 the first with "Derivatives" changed to "Divisibility of jets"; each layer contains exactly the files of its group, the only move being `NormalForm` (2.4). Sections 2.3, 2.4, 3.2, 4.3, 4.9, 5.3 and 5.6 carry the titles of their files word for word, 5.4 and 5.5 nearly. The order of the layers differs from the source's and is forced (2.6 needs 1.1 and 1.2; 3.3 needs 2.4 and 2.6; 4.11 needs 3.3; 5.5 needs 4.2 and 4.3), so the order is no finding. The titles and the scope are.

The description answers that the layers stay "because section numbers are cited across the family". Titles can change without any number changing. Repair: name each layer and these nine sections by what they establish (for instance Layer 2 "Theta functions of a CM curve at a non-split prime: Frobenius congruence and normal form", Layer 4 "Integrality and divisibility of jets of standard data", Layer 5 "Sharpness at every prime"). For the scope, Layer 1 holds the residue characters of 1.5 and all of 1.6, which the summary itself says are consumed elsewhere, "not by the later layers of this roadmap"; moving them to their consumer is the move R03 asks for.

## R07 (P2) — The pull request changes the umbrella and the top-level README, outside the roadmap folders

Against its base the pull request changes `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md`, and adds a line to the roadmap list of the top-level `README.md`, which is regenerated after a merge and not edited by hand (2,602 insertions and 17,633 deletions in the three files). In `umbrellas/GRH.toml`, `root` goes from `"RiemannHypothesisForDirichletLFunctions"`, on main, to `"ShortGRH"`, so the umbrella no longer covers the family on main. Repair: drop the line of the top-level README; move the umbrella change to a pull request of its own, or have the human reviewers approve it here.

## C01 — The downstream consumers give CompositeThetaLiftsAndShortForms sections it does not cite

The list says that it takes "the sharpness of Layer 5 (5.4–5.6)". Its README cites §§2.1, 3.1, 4.8 and 4.11 (d) of this roadmap and nothing of Layer 5; the consumer of 5.5 and 5.6 is NormsOfThetaLiftsAndExchangeIdentities §6.4, as the summary says. Drop the clause.

## C02 — The constant that `C_P` takes from 4.6 (b) is asserted to exist, not fixed

4.6 (b) reads "There is a constant `C` such that for every level there is `c_vac ≠ 0` with … Fix such `c_vac`". OneSidedPrimeSumBoundsAndAdmissibleData §3.1 puts "the constant written `C` in DivisibilityOfThetaDerivatives §4.6 (b)" into `C_P`, and 4.3a refers to it; but only the scalar `c_vac` is fixed, so `C_P` is not a definite number. Add "Fix such `C`, depending on `q₀` and `d` only" to 4.6 (b).

## C03 — 2.1 and 3.3 do not say how they stand to TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.1, 4.7, 4.8

At an inert prime `ρ_p = 1/(p² − 1)` and `γ_p = p/(p² − 1)` are the numbers `ρ_LT(p)` and `γ_LT(p)` of that roadmap's §4.1, which 3.3 already cites for Legendre's bound, and its §§4.7 and 4.8 bound jets along products of minors of series with an exponential factor, with letters in `ℤ/n′` and partners `s + e` in place of the places `(ℤ/q₁)^×` and partners `−p^eτ`, at inert primes only. A reader who knows that roadmap cannot tell whether 3.3 restates it. A "Relation to the library" note of the kind 4.1, 4.4 and 4.10 have would say so: the same numbers at inert primes, a different class of series and index set, and the case `p = d`, which is here only.

## N01 — Three letters still carry two meanings

`κ` is a diagram (3.1) and the weight of the data (1.6, 5.4); `t` is the point of order two (2.1), the number `t` of the data (1.6 (b)) and the number of 5.6; `σ` is the sigma function, a place, and an automorphism of `ℂ`.

## N02 — Three sentences describe the history of the text

4.3 (d) ("the letter (d) is kept for them, so that 4.3 (d) means 4.3a"; no roadmap of the family cites 4.3 (d)), the last sentence of the Origin of 4.3a ("It is stated apart from 4.3 because…"), and "is a result still to be stated as a numbered target" in the scope section.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.2 decomposition | inert `p`, `y = ζ`, `√−d`; `w = w̄` | `ζ^{p^n} = σ_n(ζ̄)`; `(√−d)^{p^n} ≡ −√−d`; `p ∣ (d+1)/4` gives `(−d/p) = 1`, split, so `β_Kβ̄_K ∉ w` | holds; source agrees | none |
| 1.5 residue characters | `ord ψ = q₂²` | `ord ψ^{q₂} = q₂`; `q₁ ∣ q₂`, so `x^{q₁} = 1` gives `ω(x) = 1` | holds | none |
| 1.6 characters of `U(1)` | `γ = ζ^k` | `w₀ ≡ Δ/2 (mod q₁)`; `∏_v v(ζ^k)^{Δ/2} = Φ_{q₁}(0)^{kΔ/2} = 1` | holds | none |
| 1.7 different at `∞` | `T = q₁/q₀` | (a) `\|P′(ζ)\| = T·\|Φ′_{q₀}(ζ^T)\|`; (b) equals OneSided §3.3 (c) word for word | (a) holds; (b) doubled | R04 |
| 2.1 θ, numbers at `p` | split, inert, `p = d` | `θ(−z) = θ(z)` from `ε(2t) = −1`; `ρ_p`: `1/(p−1)`, `1/(p²−1)`, `1/(2p−2)`; `γ_p`: `0`, `p/(p²−1)`, `1/(2p−2)` | holds | C03 |
| 2.2 Frobenius congruence | statement vs source | (a)–(d) equal the four source lemmas; `2·deg R < q_p` | holds | none |
| 2.4 normal form | `ϖ = 0`; `α` unit | `Γ_e(αz) = α^{p^e+1}Γ_e`; exponent `(p^e+1)p^j` in (a); (c) asks `v(c_ϖπ) ≥ 1/(p−1)` | holds; source agrees | none |
| 2.6 (a) | inert, `p = d` | `(p+1)ρ_p − 1 + v(π_p)`: `1/(p−1)` in both cases | holds | none |
| 3.1 `D_p(κ)` | one box at `τ`, `p` inert | two forms agree via `x − min(x, y) = (x − y)₊`; `γ_p`; `0` if `p ≡ −1 (mod q₁)` | holds | none |
| 3.3 count (headline 1) | `B = 0`; one box | `B = 0`: `v(W(0)) ≥ 0 ≥ −fN³`; one box: `v ≥ −ρ_p ≥ γ_p − fN³` | holds; statable (probe) | R05 |
| 4.2 scale `𝔱_E` | area `\|Ω₀\|²√d/2` | `\|u\|² = 4π²e^c/(d\|Ω₀\|²)`; `\|𝔱_E\|² = rd_E/(2πe^c) = Ω⁻¹` | holds | none |
| 4.3 tight frames | `z` primitive | `Σ_i (σ(z)/τ(z))^i = q₁δ_{στ}`; (b), (c), (e) equal the source's four lemmas | holds | N02 |
| 4.3a frames of the data | statement vs source | `1 ≤ h ≤ b`; length `M`, multiplicities `≥ 6fb`, unit form at every `p` | holds | N02 |
| 4.4 jet series | `Q` homogeneous of degree `l` | `jet_Q(F(az)) = a^l·jet_Q(F)`; coefficient `c^{\|k\|}/k!·θ_V(v_{z^k} ⊗ f)` as in the source | holds | none |
| 4.6 (b) vacuum scale | quantifiers | `∃ C ∀ level ∃ c_vac`; only `c_vac` fixed; `C_P` uses `C` | constant not fixed | C02 |
| 4.7 conjugates of jets | renaming | source: `map σ` of the series equals `rename (π⁻¹, id)`; `\|t\|² = Ω⁻¹` | holds | none |
| 4.10 (headline 2) | scale `c·𝔱_E` | `jet_Q(J_{c𝔱}) = (c/(δ̄d))^l·jet_Q(J_{δ̄d𝔱})`, so `v ≥ l·v(c/(δ̄d))` | holds; summary agrees | none |
| 4.11 normal form | non-split `p` | `p ∤ q₁`; `‖J‖ ≤ p^{W − X}` gives `v + W ≥ X`, the sign of (d) | holds; source agrees | none |
| 5.1 least valuations | `n = 0`; a zero coefficient | empty product `1 ≥ p^0`; a zero coefficient makes both forms false | holds | none |
| 5.3 (a) couplings | `Φ₀ = {1, 2}`, same partner, `j = (1, p−1)` | actual `p·v(c₀)`; stated `p·v(c₀) − 1` | false without the family hypothesis | R02 |
| 5.3 (b) | inert `p` | `\|ν\| ≥ (p+1)\|j\|`, `ρ_p(p+1) = 1/(p−1)`, `v(ν′!) ≤ \|ν′\|/(p−1)` give both bounds from the source's | holds | none |
| 5.4 losses | (c) | `κ/p^e − (κ/p^e − κ′)₊ = min(κ/p^e, κ′)`, summed with `γ_p = v(π_p)Σp^{−e}` | holds | none |
| 5.6 (headline 3) | summary vs (e) | scalar `c_vac^{12}·∏ l_τ!`; bound `S_p + v(ι_p t)`; `\|σ(t)\| ≤ exp(fmb/k)` | holds; not statable | none |

- Source locators: 384 declaration names on the pointer and *Needs:* lines of the 44 sections, each found in its cited file of [ShortProof] at commit 72fead1; the statements of the 15 sampled sections were compared with the source's.
- Library declarations opened at the pin: Mathlib `MvPowerSeries.coeff` (RingTheory/MvPowerSeries/Basic.lean:137), `MvPowerSeries.rescale` (RingTheory/MvPowerSeries/Substitution.lean:661), `PowerSeries.subst` (RingTheory/PowerSeries/Substitution.lean:158), `PowerSeries.exp` (RingTheory/PowerSeries/Exp.lean:50), `PadicComplex` (NumberTheory/Padics/Complex.lean:137).
- Cross-roadmap citations resolved: on main, IntegralWeylModulesOfGeneralLinearGroups §0.1, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (e), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (a), ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a, ThetaChainsOnDefiniteUnitaryGroups §3.1c; in this pull request, OneSidedPrimeSumBoundsAndAdmissibleData §§2.1, 2.2, 3.1, 3.2, 3.3 (a)–(e), 3.4, 4.1 and NormsOfThetaLiftsAndExchangeIdentities §§6.4, 6.5. The citations of this roadmap in the nine siblings that cite it were listed by section.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. The two-way supply of R03 was found by reading.
- Automatic checks on this head: two failed. The TeX-syntax hits are a false positive (below); the change outside the roadmap folders is real (R07).
- Elaboration: `lake env lean` on `Suggested.lean` gives no output. The file declares nothing, so there was no signature comparison to make. A scratch statement of 3.3 (a) elaborates with `sorry` as the only warning.
- Wording: the 44 sections were compared with the docstrings of [ShortProof] (`New/Derivatives` and the cited folders of `Lib`) by shared runs of 9 words or more; 6 passages were read side by side.

Overlap check: the three closest-roadmap lists are empty. Read in addition: TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ThetaChainsOnDefiniteUnitaryGroups, IntegralWeylModulesOfGeneralLinearGroups, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (on main); OneSidedPrimeSumBoundsAndAdmissibleData, CompositeThetaLiftsAndShortForms, NormsOfThetaLiftsAndExchangeIdentities (this pull request). Shared: the sizes of `δ_E` and `rd_E` (1.7 (b) here and OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (c); owner §3.3 (c)); `I_p`, `v(π_p)`, `γ_p`, `s_p`, `S_p` now have one owner each. Jet bounds along products of minors are also on main (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.7, 4.8) for another class of series, as different statements (C03).

Source independence: 50 passages compared with 1 source ([ShortProof]: 44 sections by shared runs, 6 read side by side), no sentence shared beyond statements of facts; largest share [ShortProof], 44 of 50 locators (the others: Neukirch three, Weil, Bannai–Kobayashi, Katz); contents compared with [ShortProof] `CONTENTS.md`: the layers and nine section titles follow it (R06). The published works were not read.

Research link: the count (3.3, 4.11) and its sharpness (5.2, 5.6) concern the `p`-adic divisibility of derivatives of theta functions of CM elliptic curves, the subject of Katz (1981), Bannai–Kobayashi (2010) and Bannai–Kobayashi–Yasuda (2017); they feed the formal proof [ShortProof] of the Riemann hypothesis for Dirichlet L-functions. This rests on the README's Origins and References.

## Not verifiable

- Neukirch (1999), Chapter I §§9, 10 and Chapter III §2 (Origins of 1.1–1.3), and Weil (1956) (Origin of 1.6): not in the sources cache and not openly readable; the statements were checked against [ShortProof] and by computation.
- Bannai–Kobayashi (2010), Bannai–Kobayashi–Yasuda (2017), Katz (1981), Chowla–Selberg (1967), Lubin–Tate (1965), Shimura (1971, Theorem 5.4), Silverman: not read. The bibliographic data of Katz (1981) agree with a cached bibliography; what the README says of each agrees with the literature notes of the cited files of [ShortProof], whose reference index marks most of them "work found, no place given".
- "ShortGRH background": its 23 forms were compared with the names of the cited declarations, not with their statements, except for those behind the sampled sections.

Automatic checks set aside as false positives: the check for TeX-only syntax flagged the display of `D_p(κ)` in 3.1 (lines 587–588), which lies inside one code span that runs over a line break.

## Source issues

- none

## For the human reviewers

- Scope: every target rests on [ShortProof] (lsernau/grh-lean, commit 72fead1), a machine-checked proof with no accompanying paper; the published works in the References are named for context, with no theorem numbers except Neukirch's chapters and Shimura's Theorem 5.4.
- Licence: [ShortProof] is Apache 2.0 with NOTICE and ATTRIBUTION.md. Four layer titles and seven section titles are its `CONTENTS.md` headings (R06). Whether that reuse with attribution is acceptable is yours to decide.
- Umbrella: `umbrellas/GRH.toml` moves the root of the GRH umbrella from RiemannHypothesisForDirichletLFunctions (on main) to ShortGRH, and the top-level `README.md` gains a line (R07).
- Two routes: ShortGRH and RiemannHypothesisForDirichletLFunctions plan routes to the same end theorems; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.7, 4.8 on main and Layer 3 here are the two routes' jet bounds (C03).
- Not tested: no published source was read; the wording and arrangement checks were made against [ShortProof] only.
