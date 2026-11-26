# Review of NormsOfThetaLiftsAndExchangeIdentities (pull request #3160 at f612a55)
Folder: `TauCetiRoadmap/ShortGRH/NormsOfThetaLiftsAndExchangeIdentities/`
**Verdict:** needs changes

**Summary.** Changes are needed: there are six findings, all blocking. On the mathematics, the proof sketch of 6.5 gets the identity between the local prime sums and `s_fin` wrong by a factor 2, and as written it does not reach the bound `6β_tot − h_dir`. Seven prerequisites are left to "ShortGRH background", which no roadmap owns, although roadmaps on main state five of them. Layer 2 restates ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 from main. On the plan: this roadmap and DeterminantsOfThetaLiftChains supply each other, the folder has no `Suggested.lean`, and the pull request edits files outside the roadmap folders. There are seven small corrections and three format notes. The human reviewers have to decide on scope (the route of one unpublished formal proof, next to an existing family on main for the same end theorem), on that proof's licence, and on re-rooting the GRH umbrella.

## R01 (P1) — Seven prerequisites are left to "ShortGRH background", which no roadmap owns; roadmaps on main state five of them

The proofs of 1.2, 2.2, 2.3, 4.5, 4.6, 5.1 and 5.2 rest on these inputs, and 2.3 is in substance one of them (the Rallis inner product formula). Since nothing owns them, nothing in the plan builds them. The entries are on the *Needs:* lines at lines 209–212, 370–373, 406–408, 1018–1020, 1060–1062, 1114–1117 and 1150–1152. The family index defines such an entry as a result that is still to be stated as a numbered target. No roadmap of that name exists on main, at the open heads or in this pull request, and the description lists the background roadmaps as still to come.

Owners on main that I opened:

- **2.3:** ThetaLiftsForDefiniteUnitaryGroups §3.2 (the Rallis inner product formula for a definite pair) and §5.2, and ThetaKernelsForUnitaryDualPairs §6.13a.
- **5.2:** ThetaKernelsForUnitaryDualPairs §5.7c (constant terms of theta integrals along an isotropic line), and ThetaLiftsForDefiniteUnitaryGroups §2.2 (Hecke eigenvalues of a lift at split places).
- **1.2:** PotentialAutomorphyInfrastructurePartII §3.3 (split-place Hecke operators on definite unitary groups, with the relation between `w` and `w̄`).
- **2.2:** ThetaLiftsForDefiniteUnitaryGroups §1.2 (the class-set formula).
- **5.1:** MetaplecticAutomorphicForms §0.15 and §3.2a (Schrödinger models and split places). These are candidates on their headings only.

I found no owner for the inputs of 4.5 (the reproducing integral of holomorphic functions of a weight on `U(p, q)`, and Haar measure in Cartan coordinates) or of 4.6 (decay of cusp forms in terms of the first minimum).

The smallest change is to replace each entry by a citation of a section that states the form used. Where that form is narrower than what the section states, add a clause saying so. State the rest (at least 4.5 and 4.6) as numbered targets, here or in a named background member.

## R02 (P1) — This roadmap and DeterminantsOfThetaLiftChains supply each other, so no merge order exists for the pair

A roadmap has a single direction of supply. Here neither roadmap can be merged before the other, and the merge order lists neither sibling, so the mechanical check cannot see the loop.

This roadmap cites Determinants as follows:

- §1.1 in 2.5 (line 476);
- §1.3 in 2.6, 6.5, 6.6 and 7.5 (lines 510, 1416, 1442, 1644);
- §2.1 in 7.1 and 7.3–7.5;
- §3.1 and §3.10 in 4.2 (line 912).

In the other direction, DeterminantsOfThetaLiftChains §1.3 cites §1.3 and §2.5 of this roadmap on its *Needs:* line (line 245 of its README), and its §6.2 cites §7.5 (line 1250). OneSidedPrimeSumBoundsAndAdmissibleData closes a second loop: its §5.5 needs Determinants §6.3, which rests on §7.5 here (its lines 889–891), while this roadmap needs OneSided §§1.2–4.2. There is no cycle between sections. The chain alternates: Det §1.1 → 1.3 and 2.5 here → Det §1.3 → 2.6 and 6.5–7.5 here → Det §6.2.

Ownership has to move so that supply runs one way, and which way is the author's choice. Two options would work:

- Move 1.3 (false lifts and test forms) and 2.1–2.5 (the rank-one lift of a pair) into DeterminantsOfThetaLiftChains ahead of its §1.3. Then move Det §6.2–§6.3 into a member placed after this one.
- Move Det Layers 1–3 (pairs, ratios, regular families, the lift of a descent pair, the exchange identity) into an earlier member that both roadmaps cite.

## R03 (P1) — The folder has no `Suggested.lean`, so the roadmap has no acceptance test and the targeted build has no module to build

The headline theorems are the cost of one lift (7.5 (d), the Summary's headline) and the deep results it rests on: 2.3, 4.3 (a), 4.6 (d), 5.4, 6.5 and 7.3 (a), (c). Without the file, none of them is stated against the pinned libraries, and none is named as not statable together with the carrier it lacks. As far as I can tell, none is statable. The pinned Tau Ceti has no theta kernel, no Weil representation of a unitary pair, no algebraic form on a definite unitary group and no height of a family. Mathlib has only matrix unitary groups (`Mathlib/LinearAlgebra/UnitaryGroup.lean`).

The smallest repair is a `Suggested.lean` with `import Mathlib`, `namespace TauCetiRoadmap.NormsOfThetaLiftsAndExchangeIdentities`, and a module docstring. The docstring would name each headline above as not statable at the pins, with the carriers it lacks. A file that states nothing and says why is correct here.

## R04 (P2) — The proof sketch of 6.5 states `Σ_ℓ S_ℓ log ℓ = Σ_τ s_fin(κ(τ), τ)`, which is off by a factor 2; as written the sketch does not give `6β_tot − h_dir`

An implementer following the sketch gets twice the prime-sum term and cannot reach the stated bound. The sentence is on line 1410.

6.4 (b) defines `S_ℓ = Σ_τ s_ℓ(κ(τ), τ)`. CompositeThetaLiftsAndShortForms §2.2 (c) gives `s_fin(y, σ) = Σ_p 2·s_p(y, σ)·log p` for `y ≤ a`, and `κ(τ) ≤ a`. So `Σ_ℓ S_ℓ log ℓ = ½·Σ_τ s_fin(κ(τ), τ)`. A one-term check: for `3` inert in `K`, `e = 1` contributes `(y/3 − κ)₊` to `s_3` and `2 log 3` times that to `s_fin`.

The sketch's lower bound has `ℓ^{−2S_ℓ}` (line 1406), from the two pairings with `Ξ`. That gives `2Σ_ℓ S_ℓ log ℓ = Σ_τ s_fin`, which is exactly what turns `β_tot − Σ_τ s_∞(κ(τ))` into a term in `−h_dir`. With the sentence as written, the total carries an extra `Σ_τ s_fin(κ(τ), τ)`, and nothing in the data bounds that by `4β_tot`.

Repair: write "`Σ_ℓ 2S_ℓ log ℓ ≤ Σ_τ s_fin(κ(τ), τ)` (CompositeThetaLiftsAndShortForms §2.2 (d))".

## R05 (P2) — Layer 2 restates, for the pair `(U(1), U(2k))`, the theta integral of a definite pair, its Hecke eigenvalues and its norm, which ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 on main state in every rank

With two owners of one object, the two statements drift, and the formula in 2.3 rests on a "background" Rallis formula although main already has one.

ThetaLiftsForDefiniteUnitaryGroups §5.1 defines the theta integral `I_V(φ) = θ_φ(1)`. It gives its class-sum form and its Hecke eigenvalues at split unramified places (those of its §2.2 for the trivial representation). Its §5.2 gives `‖I_V(φ)‖² = C·[∏_{i<n} L^S_E(s + n/2 − i, χ_W)/d^S(s)·∏_{v∈S} Z_v]_{s=s₀}`. At `n = 1`, `d = 2k` the global factor is `L^S_E(k, χ_W)/d^S(s₀)`, the `L^S(k, μ_X⁻¹)/ζ_{E⁺}(2k)` of 2.3 (b).

The same objects appear here: 2.2 (c) is `φ_X = [U(1)(Ô) : J_X]·Θ(1)` with `Θ(1)` the lift of the constant `1`, and 2.2 (d) is its Hecke polynomial. "Owned here" claims all of it (lines 1674–1675). What this roadmap adds is the local computation for the block datum: its sharpness and mass (2.3 (a)) and the explicit constant of 2.3 (b).

Repair: cite ThetaLiftsForDefiniteUnitaryGroups §5.1, §5.2 (and through them §3.2) for the theta integral, its eigenvalues and its norm formula. Keep 2.3 (a) and the explicit constant as this roadmap's targets, with one clause saying how they differ, and narrow "Owned here" to match.

## R06 (P2) — The pull request changes three files outside the roadmap folders

The three files are `README.md` (one line added to the roadmap list, line 499), `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md`. The top-level list is regenerated after merge. The umbrella files re-root the GRH work target from RiemannHypothesisForDirichletLFunctions to ShortGRH (from 256 areas to 95, by the description). That is a decision about a family on main, outside what a review of this folder can approve.

Repair: drop the `README.md` line, and move the umbrella re-rooting into its own pull request, or have the humans approve it explicitly as part of this one.

## C01 — Test forms (1.3 (c)) are defined for every descent pair, but the idempotent `e_1` exists only for `r = 1`

ThetaLiftChainsAndTheSeesawIdentity §2.5 and FiniteReductiveGroups §5.7 define a label of `GL_r(k)` as a monic (squarefree) polynomial of degree `r`. `X − 1` has degree `1`, so for `r ≥ 2` there is no idempotent "of the label `X − 1`" (line 238, and the table at line 111). Every use of test forms is at `r = 1`: 2.5 (c), 5.4 (b), 6.3, 6.4 and DeterminantsOfThetaLiftChains §1.3 (b). The fix is to restrict 1.3 (c) to `r = 1`, where `e_1` is the mean over `G_O`, or to name the idempotent meant for `r ≥ 2`.

## C02 — `Ξ_{ϑ,i}` names two functions, and with a single meaning 4.3 (a) and 7.1 (d) contradict each other

4.3 (line 929) defines `Ξ_{ϑ,i}` as the left side of the third exchange, with `c′_ϑ·Ξ_{ϑ,i} = 𝖥_i` (line 936). 7.1 (d) (line 1492) redefines it as the theta series of the first factor, says that this is `c″` times the former, and states `c′_ϑ·Ξ_{ϑ,i} = c″·𝖥_i` (line 1496). Renaming one of them (say `Ξ″_{ϑ,i}` in 7.1) removes the clash.

## C03 — Four objects are stated both here and in DeterminantsOfThetaLiftChains

- 2.6 (a) is Det §1.2 (c) for all critical pairs and tame characters. Det states it for ramified pairs and twists; the identities agree because `L_*(S, μ, z) = L_*(S, μ⁻¹, z)`.
- 2.2 (a) and (d) are Det §2.1 (b) and (d) at `r′ = 1`. With `p(X) = 1 − X`, Det's formula gives exactly 2.2 (d).
- The denominator predicate of 1.4 is the first clause of Det §1.3 (b) plus a pairing condition. 7.5 (b) uses Det's form, and 6.3 (b) uses this one.

The fix is to state each object once and cite it from the other roadmap, or to say in one clause how the kept variant differs.

## C04 — The proof sketch of 6.6 makes `5m/2 + k/2` of the points of `p_*` main pairs, while 6.6 (a) uses `k/2`

At every point `z` with `m < z ≤ z_*`, `p_*` satisfies DeterminantsOfThetaLiftChains §1.1 (a): `z ≥ 10`, `m < z ≤ r`, and weight and tame part as required. The sentence at lines 1428–1429 therefore makes `z_* − m = 5m/2 + k/2` of the points main pairs. The counts `2·#A = k` and `#B = 5m` hold only if the points `z ≤ 7m/2` go to `B`. That is allowed, since a main pair is ramified (Det §1.1 (f)), but the sketch should say that `A` consists of the top `k/2` points of `p_*`. (`k` is even: `r = 3^{e′}` is odd and `m = 2^e` is even.)

## C05 — Two lines concern other roadmaps' use of steep parameters

These are "Downstream consumers" (line 1659: Det §5.4 and §5.5 use PairsOfFramesAtOnePlace §8.1) and "Not owned here" (line 1690). Nothing in this roadmap uses or supplies steep parameters, and PairsOfFramesAtOnePlace Layer 8 names its two uses as SecondMomentsOfPoincareSeries §3.9 and Det §5.5. The fix is to drop both lines.

## C06 — Published works are cited without locators, and 1.2 and 4.4 name no work

Two locators I checked would serve. The attribution of 5.4 is Wu (2021), Proposition 3.1 (1), pp. 10–11 (periods vanish below the first occurrence), and that of 2.3 is Rallis (1984b), Proposition 1.1, pp. 149–150. With theorem and page, a reader can find what was adapted.

## C07 — One sentence of the description does not hold for this roadmap

"Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated." Here Layer 2 restates ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 (R05), and five background inputs have statements on main (R01). Until those are repaired, a true version would add: "except in NormsOfThetaLiftsAndExchangeIdentities, whose Layer 2 restates ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 and whose background inputs are not yet assigned". "Removes the only cycle between sections of the family" is true of sections, but this roadmap and DeterminantsOfThetaLiftChains still supply each other (R02), and the description should say so.

## N01 — About 380 names and paths of `[ShortProof]` stand in code font after the sections

The Summary also scopes the roadmap as "the folder `New/OneLift` of `[ShortProof]` (24 files)". A reader cannot tell these names from library names. The repository's porting guidance asks for a file map in a secondary provenance section; the pointers could move there, or be marked as `[ShortProof]` names.

## N02 — Several letters carry two meanings

`k` is `r + 1 − m` and half the rank in 2.3. `m` is the number of lifts, half the rank in 2.4, an index set in 3.2 and 3.3, and the rank in 4.2. `n` is an index set and an exponent in 4.1. `t` is `5r` and a number in 2.4. `d` is `dim 𝒯`, the prime of `(q₀, d)` in 2.4, and a degree in 3.5. `r` is the rank and a real number in 6.2 (a). `S` is a set of places and the space of 3.4.

## N03 — The normalisation of the Hecke polynomial has no Check

One would test it. For the constant form on a definite `U(n)` at a split place, `T_{w,i}·1 = [n choose i]_q·1`, so `H_w(X)·1 = ∏_{l<n}(1 − q^l X)·1` by the `q`-binomial theorem. The monic convention gives `∏_{l<n}(X − q^l)` instead, and the test value of 1.3 would change.

## Questions for the author

- Is 4.4 (b) meant for the moved lattices `S g`, `T h`? As written it compares the standard lattices. For a line whose basis vector has length `R ≫ 1`, the left side is `1/(6N f²)` while `λ₁(Hom(S, T)) ~ 1/R`, so the statement needs self-dual lattices. Meanwhile 4.4 (d) and 4.6 use first minima at moved points. I could not settle this because `[ShortProof]` could not be read.
- 7.3 (d) derives `c′_ϑ ≠ 0` from the injectivity of `Θ°`, which says nothing when `𝒢(W_j) = 0`, and 4.3 (a) only asserts that some numbers `c′_ϑ` exist. Is `d > 0` a property of the data that a sibling states, or should 7.3 (d) assume it? I found no statement of `d_T > 0` in the sections cited.

## Verified sound

| Statement | Instances tried | Values computed (README / computed) | Result | Change |
|---|---|---|---|---|
| 1.2 (a)–(d) | coefficient `X`, σ-pairing | `⟨φ, aφ′⟩_σ = σ⁻¹(conj σa)⟨φ, φ′⟩_σ`; `T_{w,i}* = T_{w̄,i}` (PotentialAutomorphyInfrastructurePartII §3.3 Check); idempotent coefficients cyclotomic | (a), (c), (d) hold | none |
| 1.3 (a)–(c) | `r = 1`, `r = 2` | `X_*` roots the top factor of TLC §2.16; `r = 1`: `e_1` = mean; `r = 2`: no degree-2 label `X − 1` | (c) undefined for `r ≥ 2` | C01 |
| 1.4 Check | `Z = 0` | `det = 1`, `|ι(1)| = 1 ≥ e⁰`; `Λ pr y = 0`; pairing `0 ≤ 1` | true | none |
| 1.5 | `F = e𝒜 ∩ ker A` | `F^⊥ = ker e + range A*`, so `pr_F y ∈ Z`; `⟨z^σ, x^σ⟩ = σ(⟨z, x⟩_σ) = 0` | holds | none |
| 2.2 (d), (e) | Det §2.1 (d) at `r′ = 1`, `p = 1 − X`; trivial characters | Det gives `∏_{i<#n−1}(1 − q^iαX)(1 − q^{#n−1}αβ⁻¹X)` = 2.2 (d); `α = β = 1`: `∏_{l<n}(1 − q^lX)` | holds | C03 |
| 2.3 (a) | block datum of TLC §2.16, rank `2k` | chosen `w`: `x ≡ e` mod `w`, mass `q_w^{−2k}`; twist `w`: unit entry, mass `(q_w − 1)/q_w` | matches | none |
| 2.3 (b) | TLFDUG §5.2 at `n = 1`, `d = 2k` | `L^S_E(k, χ_W)/d^S(s₀)` with `s₀ = (2k − 1)/2`, against `L^S(k, μ⁻¹)/ζ_{E⁺}(2k)` | same object | R05 |
| 2.5 (b) | ratio of Det §1.1 (b) | `L^alg(p, ϑ)/L^alg(p, 1) = L^{𝒞∪Q}/L^𝒞` (`A`, `Nm Q^{2z−1}` cancel); `L^S(z, ·) > 0` at `z ≥ 2` | equals ratio | none |
| 2.6 (a) | `s = ±1` | LHS `(∏_𝒞 q·Nm Q)^{z²}∏|L^{𝒞∪Q}|²`; RHS `Nm Q^{z²}(∏_𝒞 q)^{z²}∏|L^𝒞|²·∏ratio²` | equal | C03 |
| 2.7 (c) | `#n = 1` | `1_{O_v^×} = 1_{O_v} − 1_{ϖO_v}` gives the factor `1 − α_1(v)⁻¹` | holds | none |
| 3.1 (a) | `z ∈ H`, `z ∉ H` | `det z = det σ_e`; `z ∈ H ⟺ wφ(σ) = wι_e`; both sides `χ(det σ_e)F(y)` or `0` | holds | none |
| 3.3, 7.1 (b) | column heights | `k⁺` heights `≤ k+j−1 < r+9m+1 = #N`; `k⁻` heights `≤ m−j < t−9m−1` | divided splitting | none |
| 4.1 | `p_*`, `p_±` against Det §1.1 | `z_* = 3m + (r + 1)/2 ≤ r`; `n ≈ 2.5r ≤ 4r`; `ω^{±j}` nontrivial (order `> 8m`) | as claimed | none |
| 4.3 (a) | 4.2 (b) with `c = χ_M^jϑ` | `υ₁^m c⁻¹ = (ν₊ϑ)⁻¹`, `υ₁^{m/2}c = (ν₋ϑ⁻¹)⁻¹`: two factors of `Γ_j`; third not reconstructible | two of three match | none |
| 4.4 (a), (d) | `n = 0`; `q = 2n_*` | `n = 0` by Cauchy–Schwarz; `|c| = 1/M ≤ b^{−20}`, `λ ≥ b^{−13}/poly`, so `m₀² ≥ 100(d + 2q)b^{10}` | consistent | none |
| 4.4 (b) | line, vector length `R ≫ 1` | left `1/(6Nf²)`, `λ₁(Hom) ~ 1/R` | needs self-dual lattices | question |
| 4.5, 4.6 | exponents | `(5b^{3/2})^{−1/2}(5b^{24})^{−1/2} = b^{−12.75}/5 ≥ b^{−13}`; `(4b^{n_*} + 1)·2b^{−19n_*} < 1` forces `𝖥⁰(1) = 0` | consistent | none |
| 5.2 (a), (b) | `q = 2`, `|X| = q^{−n′−1}`; Det §2.1 (d) | (b) sum `< 1/2 + 1/12 + 1/168 + … < 1`; (a) `q^{n′+1}|X′| ≤ 1 ⟺ 2r′ + 2l + 3 < r′ + t′` | ranges agree | none |
| 5.3 | `|X_*|` | `|α| = q^{r/2}` gives `|X_*| = q^{1−t−r/2}`, the modulus of 5.2 (a) | holds | none |
| 5.4 (b); 7.3 (b) | `r = 1`; `V″ ⊕ V°` | `Σ_{s∈k^×}ψ_w(s)⁻¹ = 0` on the `e_1`-image; `r + 2(r + 9m + 1) + 3 < 5r ⟺ 18m + 5 < 2r` | holds | none |
| 6.1 (a) | `|F|²` | `Σ c_a c̄_b ϑ′(u_a u_b⁻¹)`; `j∘conj` is a ring map, so `|j(c̄_b)| ≤ 1` | holds | none |
| 6.2 (a), (d) | main pair | `|π_M t₀|^{2j} = (M/Ω)^j` gives `s_∞`; `c − z ≤ κ + (2m + 1)r⁸ ≤ κ + 32805x^{40.5} ≤ κ + x^{42}` | holds | none |
| 6.4 (a) | finite abelian quotient | `s(1) = Σ_χ c_χ`; ultrametric: `|ι s(1)| ≤ max_χ |ι c_χ|` | holds | none |
| 6.5 | Composite §2.2 (c); `3` inert | `Σ_ℓ S_ℓ log ℓ = ½Σ_τ s_fin`, README `Σ_τ s_fin`; `ℓ^{−2S_ℓ}` needs the `½` | sketch false | R04 |
| 6.6 (a), (b) | counts | total `5m + k/2`; sketch `5m/2 + k/2` main; (a) `k/2` main, `5m` ramified; `10mx₁ + k(6β_tot − h_dir)` | consistent only with B | C04 |
| 7.1 (d) / 4.3 (a) | one meaning of `Ξ` | `c′Ξ = 𝖥_i` against `c′Ξ = c″𝖥_i` | clash unless `c″ = 1` | C02 |
| 7.3 (a), (d) | `|c′|² = C/Γ_j` | `Γ_j(ϑ)/Γ_j(1) = |c′_1|²/|c′_ϑ|²`; nonvanishing needs `𝒢(W_j) ≠ 0` | holds if `d > 0` | question |
| 7.4 (b) | axioms 2, 4, 5 | `U° = n_GL hk²|c′_1|⁻²Θ°*Θ° > 0`; `Uφ = n_GL Σ_a⟨glue f_a, φ⟩ glue f_a` integral | comparison operator | none |
| 7.5 (a)–(d) | `A = Θ_{j,ϑ}` | `det(A*A)det(pr U) = (Γ/Γ)^d det U°`; `|ι det| ≤ e^{drβ}`; `d·k(log b·β_tot − h_dir) = d(fa(log b)⁴/m − k h_dir)` | holds; matches Det §6.2 | none |

- Source locators checked against the text: 2. Wu2021 line 416 (Proposition 3.1, pp. 10–11) for 5.4; Rallis1984b line 345 (Proposition 1.1, pp. 149–150) for 2.3. The 39 `[ShortProof]` pointers could not be read.
- Library declarations opened at the pins: none of the needed carriers exist; only matrix unitary groups (`Mathlib/LinearAlgebra/UnitaryGroup.lean`); no theta, Weil-representation or unitary algebraic-form carrier in Tau Ceti.
- Cross-roadmap citations resolved: 57 distinct section citations of 10 roadmaps, all present (siblings at f612a55, FiniteReductiveGroups on main at 8ff6f0a); 2 two-way supplies found by reading.
- Main-roadmap sections read for ownership: ThetaLiftsForDefiniteUnitaryGroups §1.2, §2.2, §3.2, §5.1–§5.3; ThetaKernelsForUnitaryDualPairs §5.7c; PotentialAutomorphyInfrastructurePartII §3.3; FiniteReductiveGroups §5.7.
- Automatic checks: the missing `Suggested.lean` is real (R03). Dependency check output: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)` (the siblings are not in the merge order, so R02 is invisible to it). Elaboration: not possible, the folder has no Lean file.

Overlap check: the three closest-roadmap lists are empty. I read instead ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts, FiniteReductiveGroups and PotentialAutomorphyInfrastructurePartII (on main), and DeterminantsOfThetaLiftChains, CongruencesOfTwistedThetaLifts and PairsOfFramesAtOnePlace (this pull request). Shared objects and their owners:

- the theta integral of `(U(1), U(2k))` and its norm: ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 (R05);
- the Rallis formula: ThetaLiftsForDefiniteUnitaryGroups §3.2;
- the `L_*` identity, the Hecke polynomial of a lift and the denominator predicate: shared with DeterminantsOfThetaLiftChains §1.2 (c), §2.1 (d) and §1.3 (b) (C03);
- labels: FiniteReductiveGroups §5.7, which is cited.

Source independence: 5 passages compared with 2 sources (Wu2021: the Origins of 5.2 and 5.4 and the statement 5.4 (a); Rallis1984b: the Origin and the sketch of 2.3), none shared. The largest share of locators is `[ShortProof]`, 39 of 39 section pointers. Contents compared with `[ShortProof]`'s file layout as the README's own pointer lines give it: the layers regroup its folders (`HeckeValues` is split between Layers 2 and 6, `ComparisonOperator` between Layers 3, 4 and 7), and the order is forced by the *Needs:* lines (3.4 → 2.1, 5.4 → 3.2, 6.4 → 3.3 and 5.4, Layer 7 → all). The text of `[ShortProof]` could not be read.

Research link: the headline (7.5 (d)) is a step of the route of an unpublished formal proof of GRH (family index). Its published inputs are the Rallis inner product formula (Rallis 1984b, Proposition 1.1; Li 1992), theta lifts from `U(1)` (Yang 1997), and vanishing of periods below the first occurrence (Wu 2021, Proposition 3.1). This rests on the README's Origins and on Wu2021 line 416.

## Not verifiable

- `[ShortProof]` (the folder `grh` of github.com/lsernau/grh-lean at commit `72fead1`): the sources service does not classify the host, and I could not vouch that it is an author's page. This covers all 39 pointer locators, the seeded sample's agreement with them, and the wording and arrangement comparison.
- The constants of 3.3 (`c_γ`, `e_den`), 3.5 (c)–(d), 4.2 (a)–(b) and the third factor of 4.3 (a): they depend on `[ShortProof]`.
- Rallis (1984a): the sources service found no legal copy from the citation. It is cited only as an origin.

## Source issues

- none

## For the human reviewers

- **Scope:** the roadmap states steps of one unpublished formal proof (`[ShortProof]`, README line 1727). 16 of its 39 sections are "particular to this proof", and main has RiemannHypothesisForDirichletLFunctions for the same end theorems.
- **Licence:** the family index says that `[ShortProof]` is distributed under Apache 2.0. I could not verify this, since the sources service does not classify the host.
- **Not tested:** `[ShortProof]` supplies all 39 section locators; the wording and the arrangement were not compared with its text.
- **Umbrella:** the pull request re-roots `umbrellas/GRH.toml` at ShortGRH (its root, description and goal), which changes the work target of the GRH umbrella. This is outside the roadmap folders.
