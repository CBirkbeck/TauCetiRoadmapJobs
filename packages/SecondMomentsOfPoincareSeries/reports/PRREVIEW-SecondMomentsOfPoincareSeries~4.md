# Review of SecondMomentsOfPoincareSeries (pull request #3160 at 8c6c8b8)
Folder: `TauCetiRoadmap/ShortGRH/SecondMomentsOfPoincareSeries/`
**Verdict:** needs changes

**Summary.** The roadmap needs changes. Its mathematics held up in this review: all fifteen sampled statements match the formal proof's declarations at the pinned commit, apart from one hypothesis dropped in 4.7 (c), and the identities and constants recomputed across Layers 1–5 hold. Six findings block it, all of them structural. Fourteen prerequisites are "ShortGRH background" entries that nothing owns. Supply runs both ways with four other roadmaps of the family. 3.1 defines again the Bessel datum that GanGrossPrasadUnitaryGroups §1.2 owns. Suggested.lean leaves out the Layer 1 result, which can be stated at the pins. The sections follow the formal proof's file list. The pull request edits files outside its folders. There are five small corrections and two format notes, and two questions are left to the human reviewers: whether a second route to GRH is wanted, and whether the GRH umbrella should be re-rooted.

## R01 (P1) — Fourteen prerequisites of the proof plan are "ShortGRH background" entries that no layer, no supplier roadmap and no pinned declaration provides

As things stand, anyone implementing 2.1, 2.2, 3.1, 3.5, 3.6, 3.8, 3.10, 3.14, 4.8, 5.3, 5.4 or 5.6 is blocked behind a result that no roadmap plans, and nothing in the merge order or the umbrella schedules it.

The entries stand on the *Needs:* lines at lines 213, 269, 276, 379, 384, 503, 535, 590, 648, 750, 998, 1305, 1333 and 1389 of `README.md`. Scope and ownership (line 1464) says they are "stated in the form used on the *Needs:* lines, and not targets of this roadmap". The family index says such an entry is "a result still to be stated as a numbered target". Several of them already have an owner on main:
- Weyl's dimension formula (5.6): RepresentationTheory/LieHighestWeight, Layer 6.
- Schur orthogonality and the formal degree of square-integrable representations (3.1, 3.8): VonNeumannAlgebras, Layer 9.
- Decay and weighted integrability of lowest-`K`-type coefficients of gapped discrete series of `U(p, q)` (3.8, 3.10): DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (c), (d). That section normalises the gap differently (`h ≥ 120·n·q₀^{3/2}`, decay `‖g‖_HS^{−A}`), so the form used here has to be derived from it.
- Quotient measures and integration in stages (5.3): AnalyticNumberTheoryPartII §5.3k.

Two more are close to an owner:
- The bound on `log(mass_{j+1}/mass_j)` (5.4) is a short consequence of HermitianFormsAndLattices §6.4 (b), which 5.4 already cites.
- The trace comparison of 2.2 is a generalisation of BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a. That section assumes `r` odd and gaps of `100r⁴` between consecutive entries, so it does not cover the different-sign gap used here.

The smallest repair has three parts:
- Cite these owners on the *Needs:* lines, deriving the form used where it differs.
- Make each remaining entry a numbered target, here or in a member of the family that this roadmap cites. The remaining entries are: the Cayley-chart Haar measure (3.1, 4.8), the Gram-fibre bound (3.5), the idempotent kernel (3.6), finite-dimensionality (2.1), the cuspidality of the convolved idempotent (2.2) and the formal degree for `μ_{G₁}` (3.14).
- Alternatively, declare each remaining entry as a supplier gap with a named supplier.

## R02 (P1) — Supply runs both ways between this roadmap and four other members of the family, so no merge order puts every supplier first

The project requires one direction of supply between roadmaps. With these cycles, none of the five roadmaps can merge as a supplier of the others.

This was verified by reading the heads of the pull request:
- **OneSidedPrimeSumBoundsAndAdmissibleData.** This roadmap takes the data of its §§2.1, 3.2 and 3.3 (Conventions, 3.14, 5.4, 5.5). Its §5.4, Theorem B (its line 899), takes 1.3 and 5.7 from here.
- **DeterminantsOfThetaLiftChains.** This roadmap takes its §2.2 (a) for 2.4 (line 334) and its §5.4 (a) for 3.14 (line 747). Its line 973 takes 2.3 from here.
- **RemainingAndMainTermsOfSecondMoments.** This roadmap takes its §6.1, §3.6 (b), §5.5 (c), (d), §8.1 and §8.2 (c) for 3.3, 4.13, 4.14 and 5.7 (lines 457, 1149, 1183, 1418). In the other direction:
  - its §3.6 needs 3.3 and 4.9 (a) from here (its line 432);
  - its §5.5 needs 4.10 (c) and 4.12 (line 713);
  - its §8.1 needs 4.1 and 4.10 (d) (line 1050).
- **PairsOfFramesAtOnePlace.** This roadmap takes its §§8.1, 8.5 and 8.6 for 3.9 and its §4.3 for 3.14 (lines 621, 746). Its §4.3 needs 3.1, 3.3 and 3.6 from here (its line 795).

The sections themselves are acyclic, and the dependency check is silent only because these siblings are absent from the merge order. The description itself says that supply "still runs both ways between some pairs of members".

The repair is to move ownership so that each pair has one direction. One assignment that works:
- Sieve systems (RemainingAndMainTermsOfSecondMoments §6.1, which needs nothing) move into Layer 3 here.
- 4.13–4.15 and 5.7 move to a member placed after RemainingAndMainTermsOfSecondMoments.
- 3.9 and 3.14 move to PairsOfFramesAtOnePlace or a later member.
- 2.4 (c) moves to DeterminantsOfThetaLiftChains.
- The data of OneSidedPrimeSumBoundsAndAdmissibleData §§2.1–3.3 go to a member placed before all the others.

## R03 (P2) — The sections follow the file list of the formal proof one to one, and about ten headings are its file titles word for word

The organisation is required to be the roadmap's own and derived from the mathematics, and a source's arrangement is never the plan. Here the plan is the source's table of contents with the files numbered.

The pairs below use positions in `[ShortProof]`'s `CONTENTS.md`, where New/Spanning lists the folders SecondMoment, Multiplicities, Bessel and Unfolding first:
- Layers 1–4 ↔ New/Spanning folders 1–4.
- 4.1–4.2 ↔ Unfolding file 1.
- 4.3–4.15 ↔ Unfolding files 2–14, in order.
- 5.1, 5.2, 5.4, 5.5, 5.3 ↔ Unfolding files 15–19.
- 5.6–5.7 ↔ SecondMoment file 3.

The headings of Layer 2 and of 1.4, 3.5, 3.10, 3.11, 3.13, 4.9, 4.13, 4.14, 4.15 and 5.4 equal the corresponding file titles, each a run of 3 to 13 shared words. The *Needs:* lines do not force this order: 4.5, 4.6 and 4.7 are mutually independent, and 4.11 needs only 4.1–4.2. The description says the layers "keep the order of the formal proof's folders".

The repair is to cut sections by the mathematics. For example:
- One section on the two frames of a term (now 4.4, 4.5 and 4.12).
- One on the cutoff and its integral (now 4.6, 4.7 and 4.8).
- The unfolding of Layers 4–5 organised around two published sources:
  - Godement1958 §4, Théorèmes 5 and 5 bis: convergence of Poincaré series of integrable functions, lines 541–546 and 666.
  - Jacquet1986 §1 (double cosets, line 121) and §§7, 9 (global orbital integrals, lines 838 and 1344).

The headings would then be written in the roadmap's own words.

## R04 (P2) — Suggested.lean states nothing, although 1.3 (with 1.2 (c)), the result this roadmap hands to Theorem B, is statable at the pins

The file is meant as the acceptance test. As it stands, nothing in it tests the roadmap.

The overview presents "few translates that span almost everything" as the roadmap's conclusion. OneSidedPrimeSumBoundsAndAdmissibleData §5.4 consumes 1.3 and 5.7. A probe defining near isometries and spreading families with real bodies (`LinearMap.trace` of `A.adjoint ∘ₗ A`, `Submodule.starProjection`, `Submodule.comap`, `Module.finrank`, `Representation`) and states 1.2 (c) and 1.3 (a). It elaborates at the pinned Mathlib with only the two `sorry` warnings. The docstring instead calls Layer 1 "steps of the route … not headlines".

The repair would be to state 1.2 (c) and 1.3 with the two definitions of 1.1. The Hilbert–Schmidt norm could come from Tau Ceti (see C04). If the author regards Layer 1 as a tool only, the alternative is for the overview to stop presenting 1.3 as the roadmap's result.

## R05 (P2) — 3.1 defines the Bessel subgroup `R = 𝖴H` and its character `ψ` afresh, but GanGrossPrasadUnitaryGroups §1.2 on main owns that object

Two definitions of one object diverge, and implementers will build two Bessel subgroups.

GanGrossPrasadUnitaryGroups §1.2 builds:
- `N`, the unipotent radical of the parabolic subgroup of the flag;
- `H = N ⋊ U(W)`;
- the form `b(u) = Σ h(u v_{j+1}, v_j*) + h(ue, v_r*)`;
- the character `ν = ψ∘b`.

The `σ` of 3.1 is `b` in coordinates. It is additive on `𝖴`, since the superdiagonal frame entries add under products, and `ψ(u) = exp(σ(u) − σ̄(u))` is `ν` for the character `x ↦ exp(x − x̄)` of `ℂ`. 3.1 is labelled "definitions and conventions", and GanGrossPrasadUnitaryGroups §1.2 appears only as an "adapted from" in the Origins of 3.4 and 3.5, never as a supplier. BesselPoincareSeriesAndGramBounds 5.13a on main cites §1.2 for the same datum.

The repair is to cite §1.2 in 3.1 as the definition, with `𝖴 = N`, `H` the image of `U(X₀)` and `ψ = ν`; keep the coordinates as notation; and add GanGrossPrasadUnitaryGroups to the supplier contracts.

## R06 (P2) — The pull request changes files outside its roadmap folders

A roadmap pull request touches only its own directories. The two outside edits are:
- **Root README.** The edit adds a line to the README's roadmap list. `CONTRIBUTING.md` reserves that list for the sync bot: adding a roadmap to it by hand "does nothing except conflict" with every other open roadmap PR.
- **GRH umbrella.** `umbrellas/GRH.toml` changes the hand-written `root`, `description` and `goal` from RiemannHypothesisForDirichletLFunctions to ShortGRH. The generated `umbrellas/GRH-targets.md` is rewritten (17,633 lines removed across the three files). The description mentions the umbrella but not the README line.

The repair is to drop the README line, and to move the umbrella change into a pull request of its own for the people who own the umbrellas.

## C01 — Downstream consumers cite Theorem B at the wrong section

Line 1429 reads "OneSidedPrimeSumBoundsAndAdmissibleData §5.3 (Theorem B)". At the head, §5.3 is Theorem A (its line 853) and Theorem B is §5.4 (its line 884). Change §5.3 to §5.4.

## C02 — 4.7 (c) is stated without the root of unity that its cited declaration assumes

The header of 4.7 (line 966) assumes only "Let `𝔉` be admissible, `R₀ ≥ 1`". In `[ShortProof]` `New/Spanning/Unfolding/Packing.lean`, `tsum_le_of_le_classCutoff_mul`, the declaration cited for (c), carries a primitive root of unity of order 5040; only (a) and (b) omit it. Every consumer (4.9) assumes it. Add the hypothesis for (c), or add the closing sentence the family's conventions ask for, saying that `[ShortProof]` proves the case with the root of unity.

## C03 — The closing sentence of References misdescribes the sources

Line 1513 says the sources "are those named in the heads of the files of `[ShortProof]` that this roadmap covers". This is not accurate:
- The head of `EqualMultiplicities.lean` names Harris–Labesse (2004) and Labesse (2011). 2.2 and 2.3 cite Arthur–Clozel (1989) and Labesse (1999) instead.
- `SpanningTheorem.lean` names Petersson (1932), Benedetto–Fickus (2003) and Muić (2010). The References list Petersson (1930) and Muić (2009).
- `GramSection.lean` names no source, while 3.4 cites GanGrossPrasadUnitaryGroups §1.2.
- Of these, the `REFERENCES.md` of `[ShortProof]` records checks only for Welch and Wolsey.

Say which citations were compared with their texts, or drop the sentence.

## C04 — The Conventions define the Hilbert–Schmidt norm without the Tau Ceti API that Layer 1 rests on

At the pin, Tau Ceti has:
- `ContinuousLinearMap.hilbertSchmidtNorm` (`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean`, line 212);
- the splitting by an orthogonal projection, `hilbertSchmidtEnergy_starProjection_comp_add_orthogonal` (`Pythagoras.lean`, line 53), which is the identity behind 1.2 (b);
- unitary invariance (`Isometry.lean`, line 104).

The README has neither a From Tau Ceti nor a From Mathlib contract. Citing these there would let Layer 1 build on them.

## C05 — 3.1 does not say whose matrix coefficient `c_λ` is

`deg(λ) = (∫|c_λ|²)⁻¹` is the formal degree, and `deg·c̄_λ` is idempotent (3.6), only for the coefficient `g ↦ ⟨w, π(g)w⟩` of a single unit vector. 3.6 (b) is then an equality, because the convolution projects onto `w ⊗ M`, so every fixed `F` lies in one irreducible copy. With the trace over the lowest `K`-type instead, the fixed space is the whole `K`-type and (b) becomes an inequality. Name the vector: a unit highest-weight vector of the lowest `K`-type, as in DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (b).

## N01 — Some letters clash with others in use

- 2.1 writes `ϖ_w` for a uniformiser at `w`, while `ϖ` is the generator of the different.
- `R̄₀` is the reduction of `R` (4.1), while `R⁰` is the fixer of the frame (3.1) and `R₀` is a real number (4.7).
- The method paragraph of 1.4 uses `k` and `H`, which 1.4 never defines; its field is `𝔽`.

## N02 — A Check on the convolution convention would pin it

`F ∗ (deg·c_λ) = R(deg·c̄_λ)F` for the right action `R`. The group convolution with `deg·c̄_λ` would give `R(deg·c_λ)F` instead, which kills `F` when the central character has `ω² ≠ 1` (BesselPoincareSeriesAndGramBounds 5.13 records this). Another natural Check is 3.2 (d) at `ϱ = 0`: the Gram determinant of `(z, γz)` is `N² − |h(z, γz)|² = −𝗀_N`.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side | Result |
|---|---|---|---|---|
| 1.2 (a), (b) | isometry; small `A*A − 1`; projections `p`, `q` | `‖Apr_U‖² = dim U + tr(pr_U(A*A−1)) ≥ dim U − ε·dim S`; `1−pq = (1−p)+p(1−q)` with orthogonal ranges | `isNearIsometry_of_hilbertSchmidtNorm_le`, `proj_comp`, `hilbertSchmidtNorm_one_sub_mul_comp_sq_le`: same hypotheses | holds |
| 1.2 (c) | general; `T₀ = 0` | mean of `‖pr_Fρ(s)B‖² ≤ √(α(1+ε))·dim S ≤ (1+α+ε)/2·dim S`, giving `(1+α)/2+3ε/2`; `T₀ = 0` forces `ε ≥ 1` | `isSpread_of_second_moment`: `Representation`, unitary, commuting projection, error `3/2·ε` | holds |
| 1.3 (a), (b) | greedy step; `dim V ≫ dim W` | gain `≥ (13/32)(1−α)dim V ≥ (2/5)(1−α)dim V`; spreading at `F = 0` forces `dim V ≤ (32/13)dim W` | `IsSpread.exists_few_le_finrank_iSup_range`: `Nontrivial V`, `0 < ε < 1/16`; `finrank_biSup_range_le` | holds |
| 1.4 | `e = 0`; `G = 𝔽_q^×`, `π = diag(s,1)`, `A₀ = e₁`, `A₁ = e₂`, `Θ ≡ 1` | `e = 0`: LHS `0`. Example: LHS `q(q−1)`, `Y = q−1`, RHS `2(q−1)+q²(q−1)` | each `(y, v ≠ 0)` term recomputed `≤ q^{d/2}Y` through the Fourier matrix | holds |
| 2.1, 2.1a | `T_{w,0}`; adjoints | `T_{w,0} = 1`; `T_{w,i}*` is the inverse double coset; all commute, so normal, giving (c), (d) | `heckeOperator` is `0` off split places; `eigenPart` is an infimum of eigenspaces | holds |
| 2.3 | `T = 1`; existence of `W_j` | trace of `1` gives `d_T = dim` of good forms on `W_j`; sign parity `f(m/2 − j)` even since `f` even | `finrank_goodForms_inf_eigenPart_eq`, `targetDim_eq_finrank_goodForms_spaceW` | holds |
| 3.2 (d) | `ϱ = 0`; `ϱ = 1`, three random `Z` | `n = 1`: `N² − |a|² = −𝗀_N`; `n = 2`: determinant `12.612258` against `|D₂|²−N²|D₁|² = 12.612258` | numerical 4×4 determinant | holds |
| 3.4 | `Ω` against `𝗀 > 0` | `ξ = D_ϱ/D_n`, so `|ξ| < 1` iff `𝗀 > 0` | `openCell` predicate; `P ≥ 8`, `‖γ_Z‖ ≤ P¹²`, derivative `≤ 2P¹²/ρ`; fibres `u k γ_Z (u′k′)⁻¹` | holds |
| 3.5 | dimension count | `2(ϱ+k)² + 2(ϱ+1)² − r² = (k−1)²` = dimension of generic stabiliser `U(k−1)`: an inequality is expected | not opened | consistent |
| 3.6 (b) | rank-one against `K`-type kernel | rank-one idempotent projects `π⊗M` onto `w⊗M`; fixed `F` pure, so exactly `‖F‖⁴/deg`; `K`-type kernel gives only `≤` | — | holds (C05) |
| 3.13 | hypotheses | `ρ_v ≥ b^{6n+2}`, `|φ| ≤ 1`, `R⁰`-invariant, support in boxes, `𝗀 > 0` | `enorm_integral_pairKernel_cut_le`: same list, same right side | holds |
| 4.5 (c) | `ϱ = 0` | `𝗀 = |h(z,γz)|² − N² = 0` iff `γz ∈ Ez`, that is the spans meet | `termDisc_eq_zero_iff` over the CM field | holds |
| 4.6 (c), (d) | coset form | `{u : u_∞y reduced} = 𝖴⁰_c(M)·u₀`, a right coset | `∃ u₀ ∀ u, reduced ↔ u·u₀⁻¹ ∈ 𝖴⁰_c`; (d) assumes admissibility | holds |
| 4.7 | (a)–(c) | `ρ = b^{37n}R₀`, length `b^{6n+2}R₀`, closeness `(Nρ)⁻¹`, count `(b^{6n²}R₀²)^{dim V}` | same constants; (c) also assumes a primitive 5040-th root of unity | C02 |
| 4.9 | constants | error `νb^{−k³f}/2`; factor `ψ_M(u)⁻¹ψ_M(u′)`; identity block `νδ_{cc′}δ_ij` | same, full function in (d) | holds |
| 4.11 | `#Ū` against `ν` | exponent `fϱ(2k+2ϱ+1) = f(2d+ϱ)`, `d = ϱ(ϱ+k)`, equals `f·dim_ℝ 𝖴`, as in `M^{2d+ϱ}` of `ν` | `card_reducedImage_besselU`; `#R̄ = #H̄·#Ū` | holds |
| 4.14 (b) | through 1.4, `q = p₀ ≥ b¹⁰`, `e = l < n`, `d = r` | share `≤ 2/q + q^{l+r/2−1}b^{−6k} ≤ 3b⁻¹⁰` since `k/2 ≥ 22ϱ+27` | not opened | consistent |
| 4.15 (headline) | (c) from (a) | (a) with 1.2 (a): `ε = b⁻⁶`; 1.2 (b) with `δ = 4b⁻⁴`: `b⁻⁶ + 4b⁻⁴ ≤ 5b⁻⁴` | `HasAmplitudeBlocks`: `⟪ρ(s)Pe_y, Pe_x⟫ = A/ν`; same constants | holds |
| 5.2 | the integral | `∫ c̄(g⁻¹sy)ψ(s)⁻¹t(ρ̌(a_s)ζ) ds` | `exists_besselFn_eq_integral`: conjugate kernel, inverse character, full function | holds |
| 5.4 | product over `v` | `∏_v|v(ϖ)| = rd_E^f`, so `∏_v sph_{j+1}(v)` inverts the factor of HermitianFormsAndLattices §6.4 (b) | `|d_F| = rd_E^f` when `E/F` is unramified | holds |
| 5.5 | constants | `#Coord ≤ b^{2kf}`; ratio in `[b^{11kf}, (M/b⁶)^{kf}]`; (d) both `≤ (1+b⁻⁹)𝒟_main` | `card_mul_prod_frameMass_le`: `unitSphereMass` cancels | holds |
| 5.6 (headline) | `W_m` definite | `#Ḡ·mass_r` classes times `∏ d(λ_v)` | `finrank_principalForms_spaceW`; `targetDim_le_card_mul_besselDegree_mul_mass` | holds |
| 5.7 (headline) | `ε = 1/(8b²)` | `9b⁻⁴, 5b⁻⁴ ≤ ε` for `b² ≥ 72`; error `3/(16b²)`; 1.3 gives `1 − 2/b²`, minus `2/b²` gives Theorem B's `1 − 4/b²` | `isSpread_goodPoincare`: `3/2·(8b²)⁻¹`; scale `(vol(J)ν)^{−1/2}` | holds |
| Normalisations | `r = 1`; `vol(Ô)` | `∫(1+y²/4)⁻¹dy = 2π = vol U(1)`; `dθ = dy/(1+y²/4)`; `vol(Ô) = 2^f/√|d_E| = (2/rd_E)^f` | — | holds |
| 3.1 Bessel datum | against GanGrossPrasadUnitaryGroups §1.2 | `σ` additive on `𝖴`; `ψ = exp(2i·Im σ)` | §1.2: `b(u)`, `ν = ψ∘b` | R05 |
| Suggested.lean | probe | 1.2 (c), 1.3 (a) on Mathlib carriers: elaborates, 2 `sorry` warnings | docstring's Mathlib names exist at the pin | R04 |
| 2.2 background | against BaseChange §13.8a | here: gap between entries of different sign, any `r` | §13.8a: `r` odd, consecutive gaps `≥ 100r⁴` | not covered (R01) |
| Downstream consumers | OneSided headings | Theorem A is §5.3 (its line 853), Theorem B is §5.4 (its line 884) | — | C01 |

- Source locators checked against the text:
  - the 15 sampled targets, against 36 declarations in 14 files of `[ShortProof]` at commit `72fead1`;
  - `[ShortProof]` `CONTENTS.md` and `REFERENCES.md`;
  - Jacquet1986 lines 121, 838 and 1344;
  - Godement1958 lines 541, 544 and 666.
- Library declarations opened at the pins:
  - Mathlib: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean` 70), `NumberField.AdeleRing` (`AdeleRing.lean` 56), `IsDedekindDomain.FiniteAdeleRing` (`FiniteAdeleRing.lean` 95), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean` 105);
  - Tau Ceti: `HilbertSchmidt/Basic.lean` 212, `Pythagoras.lean` 53, `Isometry.lean` 104.
- Cross-roadmap citations resolved, all present with the content cited:
  - siblings: ThetaLiftChainsAndTheSeesawIdentity §§2.1, 2.4–2.8, 2.10, 2.19; DivisibilityOfThetaDerivatives §§1.1, 1.4, 1.5; OneSidedPrimeSumBoundsAndAdmissibleData §§2.1, 2.2, 3.2, 3.3; DeterminantsOfThetaLiftChains §§2.2, 5.4; RemainingAndMainTermsOfSecondMoments §§3.6, 5.5, 6.1, 8.1, 8.2; PairsOfFramesAtOnePlace §§4.3, 8.1, 8.5, 8.6;
  - on main: HermitianFormsAndLattices §§1.1, 5.5, 6.4; FiniteReductiveGroups §§5.2, 5.7; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§2.4a, 7.5a, 8.3; AutomorphicFormsOnReductiveGroups §7.5; BaseChange §13.8a; GanGrossPrasadUnitaryGroups §1.2.
- Dependency check output: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`. It has no UPWARD or CYCLE line because the five sibling roadmaps are absent from the merge order (R02).
- Automatic checks: the only failure was the change outside the roadmap folders, which is held as R06.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output, since it declares nothing, so no `#check @name` table could be built. The probe stating 1.2 (c) and 1.3 (a) elaborates with two `sorry` warnings.

Overlap check: read BesselPoincareSeriesAndGramBounds and RowTowerAndRallisIdentities on main. The open entries of the closest lists are revisions of these two, and their heads were not available, so ownership against those open revisions was not checked. Three objects are shared:
- the Bessel subgroup and character: owner GanGrossPrasadUnitaryGroups §1.2 (R05);
- equality of good multiplicities on `Y₀` and `W_j`: RowTowerAndRallisIdentities §5.9 states it for its own data from BaseChange §13.8a, and 2.3 here states it for other data from an unowned comparison (R01);
- Bessel–Poincaré series and their unfolding: each roadmap states its own, with no common statement.

Source independence: 19 passages were compared with 3 sources: the 15 sampled statements and 4 Origin or Method paragraphs with `[ShortProof]` declarations and docstrings, and the Origins of 4.9 and 5.1 with Jacquet1986 and Godement1958. Statements and methods are in the roadmap's own words; the longest shared run is 7 words of mathematical phrasing. About ten headings equal `[ShortProof]` file titles. The largest share is `[ShortProof]`, with 59 of 76 locators. Contents compared with `[ShortProof]` `CONTENTS.md`: the roadmap follows it (R03).

Research link: the headline targets (4.15, 5.6, 5.7) are steps of an unpublished formal proof of GRH (`[ShortProof]`, credited to L. Alpöge). Their tools are Poincaré series of integrable functions (Godement 1958 §4), unfolding into orbital integrals (Jacquet 1986 §§1, 7, 9) and the Bessel models of Gan–Gross–Prasad. This rests on the README's own sources and on Godement1958 and Jacquet1986, both read here.

## Not verifiable

- Welch (1974), Wolsey (1982), Arthur–Clozel (1989), Labesse (1999), Petersson (1930), Muić (2009), He (2017) and Beuzart-Plessis (2020), Lemma 7.3.1, were not opened. They are "adapted from" Origins, and the sampled statements themselves are located in `[ShortProof]`, which was checked.
- In 4.6 (d), the box radius `b²⁷ℓ(y_v)` was not seen: the field `mem_frameBox_besselLength` is not displayed in `ReducedPoints.lean`.
- `[ShortProof]` was read from the author's repository at the pinned commit (Apache 2.0), not from the sources cache.

## Source issues

- none

## For the human reviewers

- **Scope.** The family plans a second route to the end theorems of RiemannHypothesisForDirichletLFunctions on main. It follows an unpublished formal proof (github.com/lsernau/grh-lean, its README crediting the proof to Levent Alpöge "with Claude"). No refereed source states the headline theorems.
- **Scope.** This roadmap plays the role that BesselPoincareSeriesAndGramBounds plays on main (the Bessel–Poincaré series made nearly a tight frame), with different statements. The pull request re-roots the GRH umbrella at ShortGRH while 14 prerequisites here are unowned.
- **Licence.** `[ShortProof]` is Apache 2.0, with `NOTICE` and `ATTRIBUTION` files. This README reuses its file cut and about ten of its file titles as headings (R03), and names its declarations in every section.
