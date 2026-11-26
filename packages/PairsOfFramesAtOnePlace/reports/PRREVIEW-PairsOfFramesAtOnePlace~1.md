# Review of PairsOfFramesAtOnePlace (pull request #3160 at f612a55)
Folder: `TauCetiRoadmap/ShortGRH/PairsOfFramesAtOnePlace/`
**Verdict:** needs changes

**Summary.** Three mathematical findings. Target 1.2 (c) gives the diagonal of `w_q⁻¹w_p` with its two entries swapped. The definition of a place in 2.1 (a) does not tie the modulus to Haar measure, so the volume bounds of Layers 2–3 fail for `ℂ` with the trivial modulus. Parseval's inequality in 2.5 is stated only with both points translated, while the one-frame bound 3.3 needs it with only the second point translated. Four further findings concern the plan: this roadmap supplies SecondMomentsOfPoincareSeries and RemainingAndMainTermsOfSecondMoments and also consumes them; the folder has no `Suggested.lean`; and the prose and the section plan reproduce the module docstrings and the contents list of `[ShortProof]`. There are seven small corrections and two format notes. The human reviewers are asked to decide on scope (the main source is an unpublished formal proof), on the source's Apache-2.0 licence, and on the family's design of following that proof's folders.

## R01 (P1) — Target 1.2 (c) gives the diagonal of `w_q⁻¹w_p` with its two entries swapped

An implementer asked to prove 1.2 (c) is asked to prove a false identity. Anything that reads the twist `w_q⁻¹w_p` of 3.2 (b) off this target would get `p_a/q_a` where `q̄_a/p̄_a` belongs. The README (line 165) says the entries are `p_a/q_a` at `e*_a` and `q̄_a/p̄_a` at `e_a`. From the README's own definition (line 164), `w_p e_a = p_a e*_a` and `w_q⁻¹ e*_a = q_a⁻¹ e_a`, so `w_q⁻¹w_p e_a = (p_a/q_a) e_a`. Likewise `w_q⁻¹w_p e*_a = (q̄_a/p̄_a) e*_a`. For example, take `ϱ = 1`, `j = 1`, `A = ℂ`, `p₀ = 2`, `q₀ = 1`: then `w_q⁻¹w_p e₀ = 2e₀`, while the README gives the entry at `e₀` as `1/2`. The source agrees with this computation: `[ShortProof]` `New/Spanning/Frames/Lengths.lean`, lines 138–150 (`coe_weylRatio`), puts `p_a/q_a` at `e_a` and the conjugate of `q_a/p_a` at `e*_a`.

Fix: exchange `e_a` and `e*_a` in that sentence of 1.2 (c).

## R02 (P2) — The definition of a place in 2.1 (a) does not tie the modulus to Haar measure, so the bounds of Layers 2 and 3 fail for objects that satisfy it

Every factor `|u|^{r_a+1/2}`, `|M|^{r_l+1/2}`, `|ξ|^{−dim X′}` or `|p_a|^{−r_a−1/2}` in 2.4 (c), 2.4 (d), 2.5, 3.1, 3.3 and 3.4 comes from a change of variables. Such a bound holds only when `|u|` is the factor by which multiplication by `u` scales Haar measure. The README asks only for "a multiplicative measurable modulus `|·| : A → [0, ∞]`" (line 247).

Here is an instance that satisfies 2.1 (a) as written. Take `ℂ` with all the data of 4.1, but set `|z| = 1` for `z ≠ 0` and `|0| = 0`. The place datum and gauges of 4.1 still satisfy 2.2 (a) and 2.3 (a). In 2.4 (c) take `a = 0`, `C = 1`, `Ψ` the indicator of the vectors of size `j`, and `Φ` the indicator of the `n = ν(ω, β)` with `(n⁻¹ − 1)e*₀/u` of size `j`. Then `η₀(Φ)` is of order `|u|_ℂ^{r₀}` as `|u| → ∞`, while the right side `Λ^{j+2}·I` does not depend on `u`.

The source's definition (`[ShortProof]` `Lib/General/Measure/QuadricDisintegration.lean`, lines 50–95) requires the following:
- an invertible matrix `M` maps the volume of `Aⁿ` to `|det M|⁻¹` times itself (lines 77–79); the proof of 2.4 (c) uses this (`New/Spanning/Frames/QuadricVolumes.lean`, lines 322–324);
- `|x̄| = |−x| = |x|`;
- almost every element is a unit;
- `|u|^{−1/2}` has a locally integrable majorant on units;
- "the kernel" behind `c_P`, which the README leaves undefined, is a continuous integrable `G ≥ 0` with `G(0) = 1` whose Fourier transform has `L¹` norm at most `c_P` (lines 88–95).

Fix: add these conditions to 2.1 (a). For a finite place the source also asks that `A` be a finite product of non-archimedean local fields and that `O` be stable under conjugation, of volume `1` and locally a valuation ring (`Lib/Adelic/Adeles/LocalFactors.lean`, lines 345–360; `Lib/General/LinearAlgebra/IntegralLattices.lean`, lines 508–520). State those conditions too, or say why Layers 5–7 do not need them.

## R03 (P2) — Parseval's inequality along `N_a` (2.5 (b), (c)) is stated only with both points translated, but the one-frame bound 3.3 uses it with only the second point translated

The step of 3.3 that "adds a frame vector by Parseval's inequality along the Heisenberg group (2.5 (c))" (line 596) has no stated input. Through 3.3 (b), the same gap reaches 3.5 and Layers 4 and 5.

As written, 2.5 (b) and (c) concern `k_{a+1}(nx, ny)` under the hypothesis `(σ₀(dsd⁻¹) − σ₀(s))/M = ξσ₀(s)` on `N_a`. For a pairing kernel at floor `j ≤ a`, the element `d` commutes with `G^(j) ⊃ N_a` (2.3 (c)). That hypothesis then forces `ξ = 0`, and 2.5 (c), which needs `ξ` invertible, never applies to one frame.

The source states both cases with an exponent `ε`: the integrand is `k_{a+1}(n^ε x, ny)` and the condition is `(σ₀(dsd⁻¹) − σ₀(s^ε))/M = ξσ₀(s)` (`[ShortProof]` `New/Spanning/Frames/QuadricPlancherel.lean`, lines 254–275 and 328–368). The one-frame step uses `ε = 0` with `ξ = 1/M` (`New/Spanning/Frames/OneFrame.lean`, lines 507–511 and 529). The two-frame gains of 3.4 use `ε = 1` (`New/Spanning/Frames/Gains.lean`, line 689).

Fix: state 2.5 (b) and (c) for `k_{a+1}(n^ε x, ny)`, `ε ∈ {0, 1}`, with frequency condition `(σ₀(dsd⁻¹) − ε·σ₀(s))/M = ξσ₀(s)`.

## R04 (P2) — This roadmap and SecondMomentsOfPoincareSeries supply each other, and so do this roadmap and RemainingAndMainTermsOfSecondMoments

Supply must run one way. No merge order can put this roadmap both before and after either sibling.

This README cites the following sections of the two siblings:
- SecondMomentsOfPoincareSeries §3.1, §3.3, §3.5, §3.6, §4.1, §4.3 and §4.10: for example the *Needs:* lines of 1.1, 2.1, 4.1–4.3, 5.1, 6.1, 7.2 and 8.1, at lines 137, 267, 752, 792, 832, 880, 1050, 1211 and 1254;
- RemainingAndMainTermsOfSecondMoments §6.1 (4.3, line 832) and §7.2 (7.1 and 7.2, lines 1180 and 1211).

In the other direction:
- SecondMomentsOfPoincareSeries §3.9 needs §8.1, §8.5 and §8.6 of this roadmap (that README, line 582), and its §3.14 needs §4.3 (line 701);
- RemainingAndMainTermsOfSecondMoments §7.1–§7.6 need §2.1, §2.2, §3.2, §5.1, §5.2 and §6.1–§6.3 of this roadmap (that README, lines 849, 883, 924, 953, 981 and 1010).

Section by section the graph is acyclic: SecondMomentsOfPoincareSeries §3.1 and RemainingAndMainTermsOfSecondMoments §6.1 need nothing from here, and RemainingAndMainTermsOfSecondMoments §7.2 needs only 2.1 and 5.1, which need neither sibling's later sections. The dependency checker reports no problem only because the two siblings are not yet in the merge order.

Fix: move sections so that supply runs one way. Either the set-up this roadmap takes from the siblings moves to a member that precedes all three, or this roadmap's sections that consume it move up into the consumers. The set-up is SecondMomentsOfPoincareSeries §3.1, §3.3, §3.5, §3.6, §4.1, §4.3 and §4.10, and RemainingAndMainTermsOfSecondMoments §6.1 and §7.2 (d). The consuming sections would be 4.3 (d) next to SecondMomentsOfPoincareSeries §3.14 and Layer 7 next to RemainingAndMainTermsOfSecondMoments §7.6. Either way only sections move; no statement changes.

## R05 (P2) — The folder has no `Suggested.lean`

The roadmap has no acceptance test. Nothing records which headline theorems can be stated at the pinned Mathlib and Tau Ceti, or what each one lacks. The folder holds only `README.md`, and the description lists the file as still to come.

Fix: add `Suggested.lean`. Its module docstring names the headline theorems (4.3 (d), 5.4 (b), 5.4 (d), 6.3, 7.2 (b) and 8.6 (c)) and, for each, the carrier missing at the pins: the unitary group of a hermitian form over a locally compact ring with involution and its place data, the cut Bessel functions of SecondMomentsOfPoincareSeries §3.3, or the coefficient `c_l`. The file states whichever headlines can be stated with simple definitions. A file that states none, with that docstring, is acceptable.

## R06 (P2) — The layer introductions and the Origin and Method lines reproduce the module docstrings of `[ShortProof]` nearly word for word

Prose in a roadmap must be its own wording. These passages are the source's wording, whatever its licence permits.

Longest runs of consecutive shared words, as README line, run length, then `[ShortProof]` file and line:
- line 230, 37 words: `New/Spanning/Frames/Correlations.lean`, lines 5–7;
- line 669, 23 words: `Shells.lean`, lines 6–8;
- line 719, 23 words: `RealPlaceGauge.lean`, lines 33–35;
- line 949, 22 words: `FiniteDepth.lean`, lines 7–9;
- line 145, 21 words: `Lengths.lean`, lines 390–391;
- line 1293, 19 words: `New/Appendix/DiscreteSeries/MinorSecondOrder.lean`, lines 7–8;
- line 1335, 19 words: `Periods.lean`, line 15;
- line 1414, 16 words: `PositionGroup.lean`, line 8;
- line 468, 16 words: `Densities.lean`, line 7;
- line 471, 15 words: `Gains.lean`, line 6;
- line 1403, 15 words: `PositionGroup.lean`, line 14.

About a dozen shorter runs, of 12 to 14 words, occur in 1.3, 2.5, 3.1, 3.3, 5.1 and 8.3. I have not counted statements whose wording the mathematics forces (2.3 (a), 2.4 (a), 3.4 (a), 5.4 (b)).

Fix: rewrite these passages. For example:
- Layer 2 introduction: "This layer sets up one place. The Haar measure of `G` is assembled floor by floor from invariant measures on quadrics and on Heisenberg groups; a gauge lists the size and volume bounds that the later estimates may use; a partial correlation averages, over the floors from `l` upward, a kernel that transforms by a character under the unipotent groups. Volumes on a quadric are computed by solving its equation inside a small orthonormal block, and the Fourier estimate acts on the orthonormal coordinates outside two such blocks."
- 3.5, *Origin:* "positions are sorted by height; on each height the one-frame bound costs a power of the height, and past a threshold every position has a deep vector whose saving exceeds that cost."
- 5.3, *Origin:* "over a finite place the sets `𝔡_a` are ideals of `O`; a form that does not vanish has heads with integral leading products; a position with a large denominator makes some `𝔡_a` small."
- 1.2, *Origin:* "a short dual of `e_a` plays two parts: at a real place it bounds the length from below, at a finite place it expresses primitivity."

## R07 (P2) — The sections are the files of two folders of `[ShortProof]`, one to one and in the order of its contents list, and the README says that it covers those folders

The plan should be derived from what the headline theorems need. Here the scope of each section is that of a source file. Lines 28–30 state that Layers 1–7 cover `New/Spanning/Frames` (22 files) and Layer 8 covers `New/Appendix/DiscreteSeries` (9 files).

Layers 1–7 against the source's contents list (`[ShortProof]` `CONTENTS.md`, lines 246–267), in its order:

| Sections | Source files |
|---|---|
| 1.1–1.2 | Lengths |
| 1.3 | TwoGauges |
| 2.2 | Levels |
| 2.3 | Correlations |
| 2.4 | QuadricVolumes |
| 2.5 | QuadricPlancherel |
| 3.1 | Depth |
| 3.2 | Densities |
| 3.3 | OneFrame |
| 3.4 | Gains |
| 3.5 | Shells |
| 4.1 | RealPlaceGauge |
| 4.2 | RealShells |
| 4.3 | RealBandLimits |
| 5.1 | StandardLevel |
| 5.2 | BesselVector |
| 5.3 | FiniteDepth |
| 5.4 | FiniteShells |
| 6.1 | FiberMeasures |
| 6.2 | TopCorrelation |
| 6.3 | TopFloor |
| 7.1–7.2 | FixedLines |

Only 2.1 has no file of its own. Layer 8 maps onto the 9 entries of lines 434–442, with Positions and StationaryPosition moved after Periods. The headings of 1.3, 2.4, 3.1, 3.3, 3.5, 5.3 and 6.1, and the title of Layer 7, repeat those entries.

The *Needs:* lines force the order inside Layers 1–3 (1.1 → 1.2 → 1.3; 2.1 → … → 2.5; 3.1, 3.2 → 3.3 → 3.4 → 3.5), so the order is not the defect. The scope of each section is.

Fix: choose the sections by the headline theorems. For example:
- one section for the integrated bound of the forms, with the one-frame bound, the gains and the shells (now 3.3–3.5) as its parts;
- one section for the complex place built around 4.3 (d);
- the finite places arranged around 5.4 (d) and 6.3;
- Layer 8, which is independent of Layers 1–7 and continues DiscreteSeriesCoefficientsAndAutomorphicMetrics Layer 2 on main, could become a roadmap of its own, such as DiscreteSeriesCoefficientsAndAutomorphicMetrics, Part II.

Then drop the sentence that the roadmap covers the folders; the pointer lines already locate each statement. Finally, give theorem-level locators in the published works the Origin lines name, which are now cited by title only: Weil 1965 for 6.1, Jacquet–Ye for 3.2 and 5.2, and He 2017 with Nelson–Venkatesh 2021 for 8.4–8.6.

## C01 — The finite-place size of 1.1 is defined in 5.1 (c), not 5.2

Line 135 sends the reader to 5.2 for `A_(i) = {x : α^i x integral}`. The gauge of scale `α` is defined in 5.1 (c). Read "(5.1 (c))".

## C02 — In 3.1 (b) the integrand `depth_a(g, ny)^{−s}` is, by the README's own notation, the depth at the points `g` and `gny`

By 2.2 (c), `depth_a(x, y)` is the depth at `x` and `xy`. The source bounds the depth at the points `g` and `ny`, that is `depth_a(g, g⁻¹ny)` (`[ShortProof]` `New/Spanning/Frames/Depth.lean`, lines 590–601), and the hypotheses of 3.1 (b) are written for that position. Write `depth_a(g, g⁻¹ny)^{−s}`.

## C03 — 3.2 (d) speaks of "heads of length `ϱ`" without saying for which size

A head is always a head for a size (1.2 (c)). The source assumes a gauge `Γ` for `F` and heads for `Γ` (`Densities.lean`, lines 334–345). Add "let `Γ` be a gauge for `F`, and `p`, `q` heads of length `ϱ` for `Γ`".

## C04 — 2.2 (b) describes the floor measure `θ_l`, `l < ϱ`, only by its image under `σ ↦ σ⁻¹f_l` and its support, so it cannot be built from the text

The source defines `θ_l` as the image of `|c|^{d_l} dc`, `d_l = k + 1 + 2(ϱ − (l + 1))`, under `c ↦ w_l(c)⁻¹` (the Weyl element of floor `l`), convolved with `η_l` (`Levels.lean`, lines 146–153; `Lib/DiscreteSeries/Bruhat/FloorMeasures.lean`, lines 534–538). The descent 3.2 (e) uses this form (`Densities.lean`, lines 657–663), and so does the density `κ_j`, whose exponent `d_a` is this one. State the construction in 2.2 (b).

## C05 — Two "ShortGRH background" entries are stated on main

The *Needs:* line of 8.1 names as background "discrete series coefficients of `U(p, q)` as Flensted-Jensen's integral over the maximal compact subgroup". "Not owned here" (line 1487) cites the coefficients and their formal degrees as background. On main, DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (b) states the lowest-`K`-type coefficient of a gapped discrete series of `U(p, q)` as an integral over `K` of a product of powers of leading principal minors, and its §8.3 states the formal degree. Its threshold `h ≥ 120·n·q₀^{3/2}` follows from the gap `500(#n)³ + h` of Layer 8, since `q₀ ≤ n`. Cite those sections, as the family index asks. Until then the description's sentence that what an existing roadmap gives "is cited and not restated" does not hold for this folder.

## C06 — 5.2 (e) and the second half of 6.2 (d) ask the implementer for nothing

5.2 (e), "`1/|u|` is the generalised index of `uO` in `O`", is the definition of `|·|` at a finite place in 2.1 (a). The nonnegativity of `Σ_x v_x^* R v_x` for positive semidefinite `R` is Mathlib's `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean`, line 62) summed over `x`. Its integrated form follows from `integral_nonneg`. If they are reminders, say so, or move them into the Method lines.

## C07 — The first statement of 6.2 (d) speaks of translations on a "space" and drops the invariance that 6.3 (a) needs

"Invariant under small translations" needs a topological abelian group, here `Aⁿ`. The source also asks for, and obtains, invariance under a group `H` of integral matrices (`[ShortProof]` `New/Spanning/Frames/TopCorrelation.lean`, lines 120–139). 6.3 (a) claims exactly this invariance under `H ∩ K(M)`. State the extension for functions on `Aⁿ` that are invariant on their support under a subgroup of `GL_n(O)`.

## N01 — The README has no Checks

A two-term Check on the Weyl ratio would have caught R01: `ϱ = 1`, `p₀ = 2`, `q₀ = 1`, `w_q⁻¹w_p e₀ = 2e₀`. A Check of the size axioms at `ℂ` would record that the sum rule needs `L ≥ r + 1`.

## N02 — Flensted-Jensen is named in 8.1–8.3 but has no entry in the References, and several entries lack bibliographic data

The entries for Jacquet–Ye, Knapp, He and Sun lack year, venue or chapter.

## Questions for the author

- HermitianFormsAndLattices §6.1 and §6.1a on main state local densities of hermitian lattices at non-archimedean places. Is the "ShortGRH background (local densities of quadrics over a finite place and the generalised index)" of 5.1 that statement, read on a product of completions? I did not compare the forms in detail.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
|---|---|---|---|---|
| 1.2 (c) Weyl ratio | `ϱ=1, j=1, A=ℂ, p₀=2, q₀=1` | README: entry at `e₀` is `1/2`; computed `w_q⁻¹w_p e₀ = 2e₀`; source `coe_weylRatio`: `2` | false | R01 |
| 2.1 (a) place | `ℂ` with 4.1 data, `|z|:=1` | All README axioms hold; 2.4 (c): left side of order `|u|_ℂ^{r₀}`, right side `Λ^{j+2}I` fixed | false downstream | R02 |
| 2.1 (a) finite place | `ℚ_p(i)`, `p≡3 (4)`, `O=ℤ_p[i]`, `δ=i` | `τ=1/2∈O`, `δ^{±1}∈O`, `|p| = 1/[O:pO] = p⁻²` | holds | none |
| 2.2 (a) mass of `H` | README `hg∈𝖴K` / source `∃u∈𝖴, uhg∈K` | equivalent, since `u⁻¹K ⊂ 𝖴K` | agrees | none |
| 2.2 (b) invariance | `ϱ=0` | `𝖬 = (η₁∗μ_H)∗(η₀∗θ_top)`, both `η` unit masses; source `partialGroupMeasure_mconv_dirac` same | agrees | C04 |
| 2.5 (a) | `ℂ`: `c_P=π²`, `|ξ|=|ξ|²`, `dim X′=k−5` (`m=0`, `#ι=k−1`, `p=2`) | bound `(π/|ξ|)^{2(k−5)}`; 4.2 (b) hypothesis `(π/|y|)^{2(k−5)}` | consistent | none |
| 2.5 (b)–(c) vs 3.3 | twist `d` commuting with `G^(j)`, floor `a ≥ j` | README frequency `0`, not a unit; source one-frame step `ε=0`, `ξ=1/M` | gap | R03 |
| 3.1 (a) | `x` a position, `a<ϱ` | README `Λ^{10⁴n}` and `|p_a|^{−r_a−1/2}Λ^{10⁶n²}`; source identical | agrees | none |
| 3.1 (b) | notation of 2.2 (c) | README integrand at points `(g, gny)`; source at `(g, ny)` | slip | C02 |
| 3.1 (c) | `j=0` | README empty product `1`; integral of weight `1` against `δ₁` over the ball is at most `1` | agrees | none |
| 3.1 (d)–(e) | hypotheses | `S` a gauge, `1/M` of size 1, size `10n ⊂ Γ` size 1, conclusion size `99n` / `10n`: same in source | agrees | none |
| 3.2 (c) | `j=0`, `ω=1` | `κ₀=1`, `𝗆₀=δ₁`, `𝓘₀=∫|k₀(1,z)|²d𝖬`; source `floorForm_zero_eq_integral` same | agrees | none |
| 3.2 (d) | heads of length `ϱ` | README: no size named; source: heads for a gauge `Γ` | qualifier missing | C03 |
| 3.2 (e) | `φ≡1`, `t=1` | `∫𝓘_{a+1}((p,c),(q,c);1)dc = 𝓘_a(p,q;1)`; `d_a` equals the Weyl-law exponent in source | agrees | none |
| 4.2 (b) | `j=0` | `hw₀=1`; README and source both `Θ_𝔰 b^{2000n⁹} ℓ_{k−n⁷}(1/|y|)` with head weight `(b^{60n²}, n⁶)` | agrees | none |
| 4.3 (c)–(d) headline | `p, q` arbitrary | README `(1+b^{−10})/deg`, `f ≥ 4000n`; source `norm_floorForm_zero_le` identical | agrees | none |
| 5.2 (d) | `M=1` | `fl=1`, `K(1)=K`, `fl‖k_Z‖² ≤ m(Z)=𝖬(Z)𝖬(K)`; source same | agrees | none |
| 5.2 (e) | `u=p` in `ℚ_p` | `1/|p| = p = [ℤ_p:pℤ_p]`: the definition in 2.1 (a) | holds by definition | C06 |
| 5.3 (a), (c) | `c` a unit of `O`, `Λ ≥ 2` | `σ^{400n²} ≥ 2^{990n²} > 1`, impossible for `σ<1`: (c) vacuous, as for `x∈K(M)` | agrees | none |
| 5.4 (b) | `j=0` | `hw^fin=1`; `√genIndex(ξ)^t = |ξ|^{−t/2}`, `[O:O∩ξ⁻¹O]^{−6}`, `(2/|M|)^C`: match | agrees | none |
| 5.4 (c) | `ℚ₂`, `c=2` | `|2| = 1/2 ≤ 1/2` (boundary) | holds | none |
| 5.4 (d) headline | `Z=K(M)`, `x∈K(M)` | inner integral `𝖬(K(M))`; contribution `𝖬(Z)³` equals the main term `𝖬(Z)𝖬(K(M))𝖬(Z)` | agrees | none |
| 6.1 (a)–(b) | `y = ω − N⁻¹tz`, `#κ=1` | `⟨z,y⟩=t`, `⟨y,y⟩=⟨ω,ω⟩−tt̄/N`; sphere `tt̄/N−N`; `#κ≥2` in both | agrees | none |
| 6.1 (c) | factor | README `|π|⁻¹`, `ππ̄=N`; source `(modulus π)⁻¹` | agrees | none |
| 6.3 (c) headline | one head, `R=(1)` | `FP_Z(ω,ω)=∫‖𝒪_Z‖²dμ_H ≥ 0`, so `J^Z_top(ω,ω) ≥ 0` | agrees | none |
| 6.3 (d) | `ξ=0` | `∫J^Z_top dt = 𝓘_ϱ(p,q;1)`, the pattern of 3.2 (e) at floor `ϱ`; source same | agrees | none |
| 7.1 | `b ≥ 2` | `b⁹ ≥ 512 ≥ 2`; volume of non-units at most `b^{−9}`; source same | agrees | none |
| 7.2 (b) headline | `𝔖g=∅` | `Z=K_T`: `ϰ(K_T)𝖬(K_T) ≤ ϰ(K_T)𝖬(K_T)`, equality | agrees | none |
| 8.1 (a)–(b) | `X=∅`, `S` trivial | Laplace datum with `φ=0`; `θ(1)=c_l(1)·conj(c_k(1))=1`; source fields match README's list | agrees | none |
| 8.2 (a) | `g∈K_ε` (`y=0`); `h=0` | bound `(1+0)^{−h}=1 ≥ |c_l(g)|⁴` | agrees | none |
| 8.2 (b) | constants | `0<r≤1/6`, `B≥1`, norms `≤ 4r`; source identical | agrees | none |
| 8.4 (a) | `z>0` real | `|z| = z ≤ 2z + 12e^{−100T}` | holds | none |
| 8.4 (b) | norm | operator norm `β+1`; source `Periods.lean` opens the operator norm (line 351) before line 493 | agrees | none |
| 8.6 (c) headline | constants | `(#n+1)⁴(6B)^{2M+2} ≤ β`, exponent `20(2#n+1)²`, `M` even: source identical | agrees | none |
| Large gap (Layer 8) | normalisation | README: `λ` gap `500(#n)³+h`; source: `l=2λ` entries differ by `2c`, `c=500(#n)³+h` | agrees | none |
| 8.1 background vs main | DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a threshold | `120·n·q₀^{3/2} ≤ 120·n^{5/2} < 500n³` | main applies | C05 |
| 1.1 size at `ℂ` | sum of `r+1` numbers of size `i` | `(r+1)L^i ≤ L^{i+1}` iff `L ≥ r+1`; 4.1 gives `L ≥ ρ ≥ 8r` | holds | C01 |

- Source locators: all 267 `[ShortProof]` declarations the README cites are declared in the file it names. I read about 70 docstrings and signatures: the 15 sampled sections plus 1.2, 4.3, 7.1 and 7.2. Every sampled section matches the source, except where R02, R03, C02, C03, C04 and C07 record differences.
- Library: Mathlib `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean`, line 62). No Tau Ceti declaration is involved.
- Cross-roadmap citations resolved: SecondMomentsOfPoincareSeries §3.1, §3.3 (`Θ_𝔰`, its line 423), §3.9 and §3.14; RemainingAndMainTermsOfSecondMoments §6.1 and §7.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a and §8.3, and HermitianFormsAndLattices §6.1 and §6.1a (both on main); the scope of BesselPoincareSeriesAndGramBounds, on main and at its open revision.
- Automatic checks: one failure, the missing `Suggested.lean`, which is real (R05). The dependency check printed `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; it does not see the two siblings, which are in no merge order yet (R04).
- Elaboration: there is no Lean file, so no `#check` pass was possible.
- Wording: all 33 sections and the layer introductions were compared mechanically with the comments and docstrings of the 31 source files. That found 45 runs of 12 or more shared words; I read the longest beside the source.
- The 241 unresolved Lean names of the citation leads are `[ShortProof]` declarations cited as locators; all resolve there.

Overlap check: read BesselPoincareSeriesAndGramBounds (on main and at its open revision), DiscreteSeriesCoefficientsAndAutomorphicMetrics and HermitianFormsAndLattices. BesselPoincareSeriesAndGramBounds shares no object with this roadmap: its Bessel integral and pairing belong to another set-up. The gapped lowest-`K`-type coefficient and the formal degree are owned by DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a and §8.3 (C05). Local densities are owned by HermitianFormsAndLattices §6.1 (see the question). The list of closest roadmaps by results was empty.

Source independence: 33 sections and 8 layer introductions compared with 1 source (`[ShortProof]`, the docstrings of 31 files). The published works could not be read. There are 45 shared runs of at least 12 words, the longest 37. Largest share: `[ShortProof]`, 41 of 61 locators. Contents compared with `[ShortProof]` `CONTENTS.md`: the sections map one to one onto its 22 + 9 file entries (R06, R07).

Research link: the headline targets are the local estimates behind the spanning theorem of `[ShortProof]`, an unpublished formal proof of GRH for Dirichlet L-functions. Layer 8 adapts Nelson–Venkatesh (2021) and He (2017, Gan–Gross–Prasad for `U(p, q)`); Layers 3, 5 and 6 adapt Jacquet–Ye's Kloosterman integrals. This rests on the README's Origin lines, not on reading those works.

## Not verifiable

- The published works named in the Origin lines (Knapp; Helgason Ch. I §5; Jacquet–Ye; Weil 1965; Nelson–Venkatesh 2021; He 2017; Sun 2007; Flensted-Jensen) are cited without theorem or page. They were not read: this review records no sources, and the books have no open copy. The sampled statements were checked against `[ShortProof]` at their pointers instead.
- Whether HermitianFormsAndLattices §6.1a gives the local densities of 5.1 in the form used: not compared in detail.
- `Suggested.lean`: absent, so nothing was elaborated.

## Source issues

- none

## For the human reviewers

- Scope: the main source is `[ShortProof]`, an unpublished, unrefereed Lean proof (repository `lsernau/grh-lean`, folder `grh`). Its NOTICE calls it a rewriting of an earlier formal proof. The README cites published works by title only, as background to its Origin lines.
- Licence: `[ShortProof]` is distributed under Apache-2.0 (its `LICENSE`; its NOTICE names Anthropic, PBC, 2026). README passages reproduce its docstrings (R06). Whether Apache-2.0's notice terms bear on the roadmap is for you to decide.
- Family design: the family index (`TauCetiRoadmap/ShortGRH/README.md`, its opening section and "The roadmaps") prescribes that members cover `[ShortProof]`'s folders. R07 therefore concerns the design of the whole family.
- Not tested: none of the published works was read. `[ShortProof]`, which has the largest share of the locators, was read.
