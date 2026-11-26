# Review of DivisibilityOfThetaDerivatives (pull request #3160 at c12c899)
Folder: `TauCetiRoadmap/ShortGRH/DivisibilityOfThetaDerivatives/`
**Verdict:** needs changes

**Summary.** Changes are needed. The 15 sampled sections agree with the formal proof they follow, hypotheses included, but 2.1 defines θ with the classical Weierstrass sigma function, and with that function the Frobenius congruence of 2.2 is false (the formal proof uses the sigma function normalised as a theta function for the Hermitian form). Beyond that: 24 inputs are cited from a "ShortGRH background" roadmap that exists nowhere; the roadmap cites and is cited by both OneSidedPrimeSumBoundsAndAdmissibleData and CompositeThetaLiftsAndShortForms; the summary overstates headline (2); the count is statable at the pins but `Suggested.lean` states nothing; the layers and several proof sketches follow the formal proof's contents and docstrings; and the pull request rewrites the GRH umbrella outside the roadmap folders. There are four small corrections and two format notes, and the scope, the licence of the source and the umbrella switch are left to the human reviewers.

## R01 (P1) — With the classical Weierstrass sigma function, θ of 2.1 has θ′(0) = s₂t ≠ 0, and the Frobenius congruence 2.2 (a) fails

2.1 (line 320) defines `θ(z) := T^1_tσ(z)/T^1_tσ(0)` with "`σ` the Weierstrass sigma function of `Λ`". An implementer who takes the classical product gets a θ for which 2.2 (a)–(c) fail, and with them 2.3, 2.6 and the layers that rest on them.

The reason is as follows. Let `s₂` be the constant with `η(λ) = s₂λ + (π/A)λ̄` for the quasi-periods of `ζ`; Legendre's relation fixes the coefficient of `λ̄`. Then `ζ(z) − s₂z − (π/A)z̄` is odd and `Λ`-periodic, so it vanishes at the 2-torsion point `t`, and `(log θ)′(0) = ζ(t) − πt̄/A = s₂t`. If `θ_H` is built in the same way from `σ·exp(−s₂z²/2)`, the odd theta function for `H(l, z) = (π/A)l̄z`, then `θ = θ_H·exp(s₂tz + s₂z²/2)`. At an inert `p` (`π_p = p`, `q_p = p²`) the quadratic terms cancel and `θ(pz)/θ(z)^{p²} = (θ_H(pz)/θ_H(z)^{p²})·exp(s₂t(p − p²)z)`. That function is not even, so it is not a polynomial in the even function `x(z)`. And `s₂ ≠ 0`: for `Λ = Ω₀𝒪_K` one has `s₂ = (π²/3)·E₂*(τ)/Ω₀²` with `τ = (1 + √−d)/2`, and `E₂*(τ) = E₂(τ) − 6/(π√d)`, which is about 0.98 for `d` near 9239 and about 0.28 at `d = 7`. The formal proof does not use the classical function: [ShortProof] `Lib/CM/Sigma/Basic` builds `PeriodPair.σ` as the odd theta function for `H` and notes that it differs from the classical sigma function by a factor `exp(cz²)`. With that σ, `θ′(0) = 0` and `(−log θ)″ = ℘(z + t) + s₂`, which is what the input "`√−d·g″(0)` integral" of 4.10 presupposes.

Repair: in 2.1, take for `σ` the odd entire function with `σ′(0) = 1` and `σ(z + l) = ±exp(H(l, z) + H(l, l)/2)·σ(z)` for `l ∈ Λ` (the Weierstrass sigma function times `exp(−s₂z²/2)`, with `s₂` as above), and add a Check: `θ′(0) = 0` and `g″(0) = ℘(t) + s₂`. The classical σ fails both (`θ′(0) = s₂t`).

## R02 (P1) — Twenty-four inputs are cited from "ShortGRH background", a roadmap that exists nowhere

The inputs that carry Layers 2, 4 and 5 are cited as "ShortGRH background (…)" with no section, 24 times between lines 213 and 1205. They are: Weil data and splitting characters (1.4); characters of `U(1)(𝔸_E)` (1.6); the sigma function, the formal parameter and integrality facts for CM lattices (2.1–2.5, 4.10); the formal group of a CM lattice (2.3, 5.2); exponentials of series over `ℂ_p` (2.4); Schur matrices (3.4); the adelic Weil representation over `E` (4.1); the Chowla–Selberg formula with a unit (4.2); the Fock model and the integrated action (4.4); sections of CM lattices (4.5, 4.9); Fourier inversion (4.5, 4.6, 4.9, 5.6); complex multiplication for theta functions (4.6, 4.7). No roadmap of that name is on main, in this pull request or at the head of any open roadmap pull request. These prerequisites therefore have no owner, and no dependency check can see them.

Repair: for each item, either cite an owner by section, or state the item here as a target, or write it as a declared supplier gap that names the roadmap meant to own it. Several owners are already on main: splitting characters and the adelic Weil representation are MetaplecticAutomorphicForms §§3.3, 4.5; the Fock model and the global Weil representation of a unitary pair are ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a; the classical sigma function is ModularCurvesPartII §1.4a. ThetaChainsOnDefiniteUnitaryGroups §3.1c proves the integrality of the second logarithmic derivative of the CM theta function, in its own normalisation.

## R03 (P2) — Headline (2) claims integrality at the scale 𝔱_E, but Layer 4 proves it only at the scale δ̄·d·𝔱_E

The summary (line 32) says that these jets "are integral at every prime, after the scale `𝔱_E`". 4.10 (b), like the source declaration `norm_jet_jetSeries_le_one`, takes the series at the scale `δ̄·d·𝔱_E`. At the scale `𝔱_E`, 4.10 (c) gives only `v ≥ −l·v(δ̄d)` in degree `l`. So at `p = d`, and at the primes dividing `N(δ)`, the summary claims more than any section states. The factor `d` is there for a reason: 4.10 (a) needs `d·g″`, because its input gives only that `√−d·g″(0)` is integral. Repair: "integral at every prime at the scale `δ̄·d·𝔱_E`, hence at the scale `𝔱_E` at the primes not dividing `d·N(δ)`".

## R04 (P2) — The roadmap is in two supply cycles, and `I_p`, `v(π_p)` and `γ_p` have two owners

A cycle leaves no merge order. The dependency check reports no problem here only because these citations carry no section numbers.

The first cycle runs through OneSidedPrimeSumBoundsAndAdmissibleData. Sections 1.1, 1.2, 1.5–1.7, 4.3 and 5.4–5.6 need that roadmap's parameters and admissible data. Its §3.1 in turn needs this roadmap (`c_vac` of 4.6, and `q₁d` in the different from 1.1) to define `C_P`, and through `C_P` the admissible data of its §3.2.

The second cycle runs through CompositeThetaLiftsAndShortForms. Sections 5.4, 5.5 and 5.6 (lines 1131, 1162, 1207) need it for `s_p` and its total, while its §§2.7, 3.2 and 3.4 need this roadmap. Its §2.1 (a) also defines `I_p`, `v(π_p)` and `γ_p` again, although 2.1 here already defines them.

Repair for the second cycle: define `s_p(y, σ) = v(π_p)·Σ_{e∈I_p}(y/p^e − κ(−p^eσ))₊` and its total in 5.4 next to `R_τ`, or in OneSidedPrimeSumBoundsAndAdmissibleData §4.1 next to `s_fin`. Then have CompositeThetaLiftsAndShortForms cite that definition, and 2.1 here for the numbers. Repair for the first cycle: 1.7 (a) needs only the cyclotomic term `Σ_ξ |log|Φ′_{q₀}(ξ)||` of `C_P`. OneSidedPrimeSumBoundsAndAdmissibleData §3.1 could take the vacuum constant as an input, which the roadmap combining the two bounds by 4.6 (b). After that, cite the supplier sections by number.

## R05 (P2) — The count (headline 1) is statable at the pins, but `Suggested.lean` states nothing

The docstring says that writing out the setting of 2.4 and 3.1 would be "a long ad hoc encoding". It is not long. 3.3 (a) can be stated at the pinned Mathlib in about 60 lines, and the statement elaborates with `sorry` as the only warning. It needs the carriers `ℂ_[p]` (`PadicComplex`), `MvPowerSeries.rescale`, `PowerSeries.subst`, `PowerSeries.exp`, `MvPolynomial` and `Matrix.det`, and six short definitions with real bodies: the valuation, the jet, the coupling `Γ_e`, the normal form (with `∑'` over `S × ℕ`), the product of minors of a diagram with a filling, and `D_p(κ)`. The places are `(ℤ/q₁)ˣ` with partner `u(−p^e)·τ`; the statement can also be made for an arbitrary finite set of places with a partner rule, which is all that 3.2 and 3.3 use. As it stands, the file tests none of the three headlines. Headlines (2) and (3) are correctly named as not statable, since the pins have no Weil representation. Repair: state 3.3 (a) with these definitions and remove its bullet from the docstring.

## R06 (P2) — The layers are the formal proof's table of contents for `New/Derivatives`, with its group titles

[ShortProof] `CONTENTS.md`, part "Derivatives of theta functions", pairs with the layers as follows:
- Layer 1 ↔ "The field and its characters" (`Field/*`);
- Layer 2 ↔ "The formal group and the exponential factor" (`FormalGroup/*`, plus `Divisibility/NormalForm`);
- Layer 3 ↔ "Derivatives that count primes" (`Divisibility/*`);
- Layer 4 ↔ "The integral vacuum" (`Vacuum/*`);
- Layer 5 ↔ "The bound is attained" (`Sharpness/*`).

Four of the five layer titles are the source's own, and sections 2.3, 2.4, 3.2, 4.3, 4.9, 5.3 and 5.6 carry the source's file titles. The order departs from the source only where the dependencies force it: 3.3 needs 2.4 and 2.6, and 4.11 needs 3.3 and 3.4. The scope of the layers is the source's too. Layer 1 contains 1.6 and the residue characters of 1.5, which no section of this roadmap uses (1.3 feeds only 1.5, and 1.6 feeds nothing); they sit here because the source keeps them in its `Field` folder.

Repair: name each layer by what it establishes for the headlines, and move 1.6 and the chosen places and residue characters of 1.5 to the roadmap that consumes them. Cite published work for the main results as well, for instance the works that the formal proof's own reference index attaches to these files: Katz, *Divisibilities, congruences, and Cartier duality* (1981); Bannai–Kobayashi–Yasuda on the radius of convergence of the p-adic sigma function (2017); Finis on divisibility of anticyclotomic L-functions and theta functions with complex multiplication (2006). Their locators are for the author to verify.

## R07 (P2) — Several proof sketches reproduce the formal proof's docstrings

- The *Method* of 3.2 (line 549) reads "finitely many congruences on the rows of one matrix are met by elimination…, at the price of the product of the moduli". It shares 19 of its 20 words, in order, with the module docstring of [ShortProof] `New/Derivatives/Divisibility/NullFrames`.
- The *Origin* of 3.2 (line 545) follows the same docstring, with a 14-word run.
- The *Method* of 2.3 (line 372) follows the four-step plan in the module docstring of `New/Derivatives/FormalGroup/Exponent` step by step, with runs of 16 and 17 shared words.
- The *Method* of 4.8 (line 895) follows the docstring of `omega_finHeisenbergOp_intVacuum` clause by clause.

Repair: write these sketches in the roadmap's own words. For example, for 3.2: "Each congruence is met by one integral row operation: take the row on which the linear form has least valuation, multiply it by the modulus, and clear the other rows with it. The step's determinant divides the modulus, so the moduli multiply."

## R08 (P2) — The pull request rewrites the GRH umbrella, outside the roadmap folders

The pull request changes `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` (2,132 insertions, 18,337 deletions). The `root` of the umbrella moves from RiemannHypothesisForDirichletLFunctions, which is on main, to ShortGRH, which is a draft, so the umbrella no longer covers the family on main. Repair: move the umbrella change to a pull request of its own, opened once the family is accepted, or have the human reviewers approve it explicitly here.

## C01 — The summary names a roadmap that exists nowhere

NormsOfThetaLiftsAndExchangeIdentities (line 16) is not on main, in this pull request or in any open pull request. In this pull request, DeterminantsOfThetaLiftChains covers the norms of theta lifts and the exchange identity. Name the roadmap that actually consumes 5.6.

## C02 — Two supplier objects are cited under names their suppliers do not use

`S_p` (table line 97, and 5.4–5.6) is called `F(p)` in CompositeThetaLiftsAndShortForms §2.1 (b). `C(q₀, d)` (1.7, line 292) is `C_P` in OneSidedPrimeSumBoundsAndAdmissibleData §3.1, which also contains `c_vac` of 4.6; 1.7 (a) needs only its cyclotomic term.

## C03 — 5.5 and 5.6 use 1.5 without listing it

Both sections use `π_M`, `π̄_M` and the modulus with ideal `(π_M)` from 1.5, but their *Needs:* lines (1161, 1205) do not list 1.5.

## C04 — "Adapted from the published theory" with no published work named

The origins of 1.1, 1.2, 1.3 and 1.6 (lines 111, 140, 174, 252) cite no text, and the README has no References section. Name the texts with locators, or call the facts classical.

## N01 — Several symbols carry two or three meanings

`ω` is both the residue characters of 1.5 and `(1 + √−d)/2` in 2.1 (line 317, where it equals `β_K`). `κ` is a diagram, the weight of the data, and a scalar of negative valuation in 5.3 (lines 1083, 1093). `d` is both the prime and the exponent in `det^d` of 3.4 (line 623). `t` is the 2-torsion point, the data's `t = 5r`, and the number `t` of 5.6.

## N02 — `D_p(κ)` has no Check, though one would pin the partner convention

A single column of height 1 at `τ` would do, with `p` inert. Then `D_p = γ_p` when no partner `−p^eτ` carries a box, and `D_p = 0` when `p ≡ −1 (mod q₁)`, since then every odd partner of `τ` is `τ` itself. With the partner `p^eτ` instead, the second case would give `γ_p`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.4 Weil data, `s₀` | `τ(√−d) = i√d`; `f` places | `τ(ȷ) = −1/(i√d) = i/√d`; `(1−ȷ⁻¹)/2 = β_K`; `\|s₀\|^{2f} = ∏\|P′(ζ)\|_v = rd_E^f/d^{f/2}` | holds; source `norm_gal_vacuumRoot` agrees | none |
| 1.5 residue characters | `ord ψ = q₂²`, `x^{q₁} = 1` | `ord ψ^{q₂} = q₂`; `q₁ = q₀·3^{⌊log₃s⌋+5}·2^s` divides `q₂ = (q₀d)^{s+6}`, so `ω(x) = 1` | holds | C03 |
| 1.6 characters of `U(1)` | `γ = ζ^k` | `w₀ = κ + r⁸` (`Δ = 2r⁸` in supplier) = source weight; `∏v(ζ^k)^{w₀} = Φ_{q₁}(0)^{kr⁸} = 1` | holds | none |
| 2.1 numbers at `p` | split, inert, `p = d` | `ρ_p`: `1/(p−1)`, `1/(p²−1)`, `1/(2d−2)`; `γ_p`: `0`, `p/(p²−1)`, `1/(2d−2)`; `Σ_{e odd}p^{−e} = p/(p²−1)`; 2,3,5,7,11 split | holds | none |
| 2.1 θ | classical vs theta-normalised σ | classical: `θ′(0) = s₂t`, `s₂ = (π²/3)E₂*(τ)/Ω₀²`, `E₂* ≈ 1 − 6/(π√d) ≠ 0`; normalised: `θ′(0) = 0` | definition wrong | R01 |
| 2.2 Frobenius congruence | inert `p`, both σ | `℘″(t) = 2`; `(e−e′)(e−e″) = 1` gives `x′² = 4x³+a₁²x²+4x`; classical: ratio times `exp(s₂t(p−p²)z)`, not even | false for classical σ | R01 |
| 2.5 resolutions | `u_i = ζ^i/q₁`, multiplicity `q₁` | `Σ_i q₁σ(ζ^i)conj τ(ζ^i)/q₁² = δ_στ`; Parseval by pairing `z = Σm_j(u_j†z)u_j` with `z′` | holds; source agrees | none |
| 3.3 count (headline 1) | `B = 0`; scaling by `ϖ` | `B = 0`: bound `−fN³`, true `v(W(0)) ≥ 0`; `B/(p−1) − Bρ_p = γ_pB`; `v(c_ϖπ_p) = 1/(p−1)` inert and at `d` | holds; statable (probe) | R05 |
| 3.4 Schur entries | `\|n\| = 1`, `\|n′\| = 2`, one column of height 1 | `P_y = z_{τ,r,0}y_{τ,0,0}`; `det^d = y_{τ,0,0}`; `b_i = 1` (heights `< \|n\|`); entry `z_{τ,r,0}` | holds | N01 |
| 4.2 scale `𝔱_E` | `σ = id`, area `\|Ω₀\|²√d/2` | `\|𝔱_E\|² = (rd_E/√d)(2π/√d)·d/(4π²e^c) = Ω⁻¹`; `\|ι_p𝔣_E\| = 1` for `p ∤ q₁` | holds; source `norm_jetScale_sq` | none |
| 4.7 conjugates of jets | `σ` over `K` | `\|t\|² = Ω⁻¹` agrees with 4.2 (a) for `σ(𝓔)`; span condition and `B_σ` as in `exists_isJetConjugate_translates` | holds | none |
| 4.8 standard data | `x ∈ Ô^n`, `δ ∈ 𝒪_K` | `δx_i` integral, so `x` is `δ`-integral; the `ω(1, g)` formula equals the source lemma | holds | R07 |
| 4.9 theta products | frame of length `b′²`, multiplicity `k²` | `Σ_i k²σ(w_i)conj τ(w_i)/(b′k)² = δ_στ`; (d) equals `exists_jetSeries_map_eq_thetaProd_pow_mul` | holds | none |
| 4.10 integrality (headline 2) | `p = d`, `δ = 1`, `c = 1` | (b) at scale `δ̄d𝔱_E` (source too); (c) gives `v ≥ −l` at `𝔱_E`; summary claims integral at `𝔱_E` | summary overclaims | R03 |
| 4.11 normal form | non-split `p` | `p ∤ q₁` (primes of `q₁` divide `q₀`, split); `y = α·(α⁻¹y)` and `q₁α ∈ Ô` give `y` integral above `p` | holds; source agrees | none |
| 5.3 couplings | inert `p` | source: `‖ν″!‖·‖coeff‖ = ‖κ‖^{\|j\|}`, i.e. `v = \|j\|v(κ) − v(ν″!)`; `ρ_p(p+1) = 1/(p−1)` | holds | N01 |
| 5.5 bound at every prime | split `p` | `S_p = 0`, `γ_p = 0`, `val₆(l) ≤ −Σv(l_τ!)`, so LHS `≤ 0`; `Σc_iσ(w_i)conj τ(w_i)/M = δ`; `\|π_M𝔱_E\|² = M/Ω` | holds | C03 |
| 5.6 sharpness (headline 3) | — | `t = M^{12f}θ°(finVec y)∏B_τ²`, bounded by (d); needs the Weil model, absent at the pins | holds; not statable | none |
| 3.1 `D_p(κ)` | one box at `τ` | the two forms agree via `x/p^e − min(x/p^e, y) = (x/p^e − y)₊`; empty partners: `γ_p`; `p ≡ −1 (mod q₁)`: `0` | holds | N02 |
| 5.4 (c) loss identity | — | `γ_pΣκ − S_p = v(π_p)ΣR_τ` forces `S_p = Σ_σ s_p(κ(σ), σ)` = Composite's `F(p)` | holds | C02, R04 |
| 1.7 (a) different at `∞` | `T = q₁/q₀` | `Φ_{q₁}(X) = Φ_{q₀}(X^T)`, so `\|P′(ζ)\| = T·\|Φ′_{q₀}(ζ^T)\|`; `\|log A\| ≤` cyclotomic term of `C_P` | holds | C02 |

- Source locators: the pointers of all 43 sections into [ShortProof] (commit 72fead1, folder `grh`) resolve: 293 declaration names, each found in its cited file. The statements of the 15 sampled sections were compared with the source's statements.
- Library declarations opened at the pins: Mathlib `PadicComplex` and `ℂ_[p]` (NumberTheory/Padics/Complex.lean:137, 140), `PadicComplexInt` (:251), `MvPowerSeries.subst` (RingTheory/MvPowerSeries/Substitution.lean:217), `MvPowerSeries.rescale` (:661), `PowerSeries.subst` (RingTheory/PowerSeries/Substitution.lean:158), `PowerSeries.exp` (RingTheory/PowerSeries/Exp.lean:50), `differentIdeal` (RingTheory/DedekindDomain/Different.lean:481), `Polynomial.cyclotomic` (RingTheory/Polynomial/Cyclotomic/Basic.lean:227), `IsPrimitiveRoot` (RingTheory/RootsOfUnity/PrimitiveRoots.lean:63). Tau Ceti: `ZLattice.thetaSeries` (NumberTheory/ModularForms/ThetaSeries/Basic.lean:102); no Weil representation (only `TauCeti.HeisenbergGroup`).
- Cross-roadmap citations: TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (e) and IntegralWeylModulesOfGeneralLinearGroups §0.1 resolve on main. The siblings are cited without sections; the objects were found (OneSidedPrimeSumBoundsAndAdmissibleData §3.1 `C_P`, `Δ = 2r⁸`; CompositeThetaLiftsAndShortForms §2.1 `s_p`, `F(p)`). "ShortGRH background" (24 citations) and NormsOfThetaLiftsAndExchangeIdentities (1) were found nowhere.
- Dependency check: `depcheck: 43 roadmaps, 319 edges, 0 problem(s)`. It sees no edge to the sibling roadmaps, because those citations carry no section numbers; the cycles of R04 were found by reading.
- Automatic checks: the TeX-syntax hits lie inside a code span (a false positive); the change outside the roadmap folders is real (R08).
- Elaboration: `lake env lean` on `Suggested.lean` gives no output. The file has no declarations, so there was no `#check @` comparison to make. A probe stating 3.3 (a) elaborates with `sorry` as the only warning.
- Wording: all 43 sections were compared with the docstrings of their cited files by shared word runs of 8 words or more; 6 passages were read side by side.

Overlap check: the three closest-roadmap lists are empty. Read in addition: TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ThetaChainsOnDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs and MetaplecticAutomorphicForms (on main), and OneSidedPrimeSumBoundsAndAdmissibleData and CompositeThetaLiftsAndShortForms (this pull request). Shared: `I_p`, `v(π_p)`, `γ_p` (2.1 here, also CompositeThetaLiftsAndShortForms §2.1 (a); the owner should be 2.1 here) and `s_p` with its total (owned by CompositeThetaLiftsAndShortForms §2.1 (b) and consumed here, a cycle). CM theta integrality and jets along products of minors also appear on main (§3.1c; §§4.7–4.8) in other normalisations, as different statements.

Source independence: 49 passages compared with 1 source ([ShortProof]: 43 sections by word runs, 6 read side by side). Largest share: [ShortProof], 43 of 43 locators (no other source is cited). Contents compared with [ShortProof] `CONTENTS.md` (Derivatives part): the roadmap follows it (R06); the wording of four sketches is shared (R07).

Research link: the count (3.3, 4.11) and the sharpness (5.6) concern the p-adic divisibility of derivatives of CM theta functions, studied by Katz (1981), Bannai–Kobayashi–Yasuda (2017) and Finis (2006), and they feed the GRH proof announced by Alpöge (2026). This rests on [ShortProof]'s reference index; the README itself cites no published work.

## Not verifiable

- The published works that [ShortProof]'s reference index lists for these files (Katz 1981; Bannai–Kobayashi–Yasuda 2017; Finis 2006) were not read; the README cites none of them.
- "ShortGRH background": there is no text against which to check its 24 inputs.

Automatic checks set aside as false positives: the check for TeX-only syntax flagged the display of `D_p(κ)` in 3.1 (lines 526–527), which is inside a single code span that runs over a line break.

## Source issues

- none

## For the human reviewers

- Scope: the only source is [ShortProof] (lsernau/grh-lean, commit 72fead1). Its README says that it has passed machine checks only, that no mathematician has read it through, and that no paper comes with it. This README cites no published work.
- Licence: [ShortProof] is Apache 2.0 (Copyright 2026 Anthropic, PBC, with NOTICE and ATTRIBUTION.md). The layer titles follow its `CONTENTS.md` (R06) and several sketches follow its docstrings (R07). Whether adapting that text with attribution is acceptable is yours to decide.
- Umbrella: `umbrellas/GRH.toml` moves the root of the GRH umbrella from RiemannHypothesisForDirichletLFunctions (on main) to ShortGRH. According to the description, this takes the umbrella from 256 areas to 95.
- Two routes: ShortGRH and RiemannHypothesisForDirichletLFunctions (on main) plan routes to the same end theorems (`TauCetiRoadmap/ShortGRH/README.md`).
