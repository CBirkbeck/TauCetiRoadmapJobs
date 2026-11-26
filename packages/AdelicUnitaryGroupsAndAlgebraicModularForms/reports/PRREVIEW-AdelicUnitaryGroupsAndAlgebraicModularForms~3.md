# Review of AdelicUnitaryGroupsAndAlgebraicModularForms (pull request #3175 at d9a72b0)
Folder: `TauCetiRoadmap/ShortGRH/AdelicUnitaryGroupsAndAlgebraicModularForms/`
**Verdict:** needs changes

**Summary.** The sampled statements agree with the cited formal proof and with direct computation. That covers Landherr's theorem and Witt's theorem over `Ô` under the 5040 condition, the Hecke relation of §7.11, the comparison of traces of §7.10, and the identities of Layer 6. What needs changing is the plan, not the statements:
- this roadmap and five roadmaps of the same pull request cite each other, so no merge order exists;
- several sections give their own proofs of results that roadmaps on main already own;
- §7.9 cites a supplier for a statement that supplier does not make;
- `Suggested.lean` states nothing and names no headline as unstatable;
- the pull request edits files outside the roadmap folders.

There are four small corrections, one of which makes a sentence of §7.12 (a) precise, and three format notes. A human must decide one scope question: the family's route rests on an unpublished formal proof that claims GRH.

## R01 (P1) — This roadmap and five roadmaps of the same pull request supply each other, so no direction of supply and no merge order exists

A supplier has to merge before its consumers. With citations running both ways, none of these six roadmaps can merge first, and an implementer on either side waits for the other.

Four section-level two-cycles:
- §6.1 (line 998) takes Hecke eigenforms "as in GaloisRepresentationsOfUnitaryEigenforms §1.1". That section's *Needs:* line (its line 128) is this roadmap's §§1.4, 3.1, 6.1.
- §6.1 (line 983) takes the invariance of the hermitian form from IntegralRepresentationsOfGeneralLinearGroups §2.3 (c). That section's *Needs:* line (its line 412) is this roadmap's §6.1; its §6.1 also needs §§1.4, 1.5, 3.1 here (its line 1035).
- §3.1 (line 440) defines `T_{w,j}` "as in WeilRepresentationsOnBanachSpacesOfData §9.2". Weil §9.2 needs §§3.1, 3.2 (b) here (its line 2374).
- §3.5 (line 563) takes its splitting from Weil §5.1, which needs §§3.1, 3.5 here (its line 934). In addition, the Conventions (line 79) take Weil data from Weil §3.1, which needs §2.1 here (its line 442).

At the level of roadmaps:
- §§5.2, 6.2 and 7.10 need HolomorphicDiscreteSeriesOfUnitaryGroups (lines 885, 1037, 1477), while its §6.4 needs §§3.1, 3.9, 4.2 here (its line 1401).
- §7.9 needs IdelicReciprocityCountsAndCyclotomicClassGroups (line 1437), whose §§7.6 and 9.1 need §§3.1, 6.1, 6.3 here (its lines 1200, 1392).

The dependency check prints no problem because the merge order lists this roadmap but none of the five others, so it never compares them.

The smallest change is to give each pair one direction:
- **Weil and Galois.** This roadmap already states the definitions it glosses with Weil §§3.1, 5.1, 9.2 and Galois §1.1. Delete those four "as in" citations and keep this roadmap as the supplier of both.
- **IntegralRepresentations and Holomorphic**, which this roadmap consumes. Their citations of it must go:
  - move the clause of IntegralRepresentations §2.3 on rational unitary matrices into §6.1 here;
  - give IntegralRepresentations §6.1 its own compact means and Hecke operators, which are abstract group facts;
  - move Holomorphic §6.4 (peaks away from the cusps, which needs adelic spaces and first minima) into this roadmap or a later one.
- **IdelicReciprocity.** With the repair of R03 this roadmap no longer needs it, and IdelicReciprocity can follow it.

## R02 (P2) — Several sections give their own proof plans for results that roadmaps on main already state, and the README says so beside each

One object then has two owners, and the general theorem on main is bypassed in favour of one formal proof's route. The README's own sentences are the evidence:
- **§3.3 (a).** "HermitianFormsAndLattices §3.1 (Landherr's theorem for every quadratic extension of number fields) also implies (a)" (line 509). §3.3 (b) for invertible `K` is HermitianFormsAndLattices §3.5 (line 510).
- **§2.2 (a), (b).** AnalyticNumberTheoryPartII §5.3h "also implies (a) and (b)" (line 329). I checked that its §5.3g measure is the measure of §2.1: `(2·Leb)^{r₂}` with `vol(Ô) = |d_E|^{−1/2}` equals `Leb^{r₂}` with `vol(Ô) = 2^{r₂}|d_E|^{−1/2}`.
- **§2.3 (a), first sentence.** AdelicAlgebraicGroups §4.2 (line 366).
- **§4.3 (b), (c).** AdelicAlgebraicGroups §3.4 and ThetaKernelsForUnitaryDualPairs §5.7a, which the README calls general theorems "that the formal proof avoids" (lines 773–776).
- **§4.4 (d), §6.4 (c), and the Hecke adjoints in the method of §6.3.** DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a on main states all of these:
  - the integration formula;
  - the Petersson comparison with the factor `vol(G_∞J)·(dim V)⁻¹`, which is §6.4 (c) with `vol = [K₀ : K]⁻¹` and `dim V = d`;
  - the adjoint `[Jg⁻¹J]`.
- **§4.2 (c).** HermitianFormsAndLattices §4.12 (a), with the constant `√f·n·rd_E` (line 741).
- **§1.1 (d).** AnalyticNumberTheoryPartII §5.3k (line 141).

The fix is one of two things for each item:
- make it a corollary of the main section, put that section in its *Needs:* line, and keep as a target here only the bridge the README says is missing. The bridges are the identification of the quotient integral of §1.1 with Mathlib's quotient-measure model (line 103) and the identification of `G(s)` with `U(V)(𝔸)`;
- or delete the item and list the section under "Results taken from other roadmaps".

A section that really adds something, such as §3.8 adding the infinite places to HermitianFormsAndLattices §2.5 (f), can stay with its one-clause difference.

## R03 (P2) — §7.9 needs class field theory from IdelicReciprocityCountsAndCyclotomicClassGroups, which does not state it; HermitianFormsAndLattices §3.2 on main does

An implementer following the *Needs:* line finds nothing to import. The line (1437) names the roadmap with no section, for "an `a ∈ L^×` with `φ(a)` real of the prescribed sign … and a finite idele `z` of `L` with `a·z·z̄ = 1`". At its head that roadmap has Hasse's norm theorem for totally positive elements (§2.3 (b)) and the quadratic character `η` (§7.2), but no existence statement with prescribed signs.

HermitianFormsAndLattices §3.2 with `n = 1` is that statement. Its own Check says that for `n = 1` an element with prescribed local norm classes exists exactly under the product formula. Prescribe signs at the real places of `L⁺` whose product is one and trivial classes at the finite places. This gives `a ∈ L⁺` that is a local norm at every finite place. Then `u` with `a·u·ū = 1` is chosen place by place, a unit at almost all places.

Repair: cite "HermitianFormsAndLattices §3.2 (`n = 1`)" in the *Needs:* line of §7.9. This also removes one edge of R01.

## R04 (P2) — `Suggested.lean` states no theorem, and its docstring neither names the headline theorems nor says which are not statable and why, although several are statable at the pins

The acceptance test is empty, so nothing records what the finished roadmap must prove. The file says only "No Lean signature is stated in this file" around an empty namespace, and the README lists no headline theorems.

In a separate file I elaborated two of this README's statements against the pins; both produce only the `sorry` warning:
- §3.4 (a): a conjugation-invariant unit of the integral finite adeles of a CM field with a primitive 5040th root of unity is `ȳy` for a unit `y`. This uses `NumberField.IsCMField.complexConj`, `IsDedekindDomain.FiniteAdeleRing.integralAdeles` and `TauCeti.GlobalNumberFields.finiteAdeleGaloisAction`.
- §7.12 (a), in its comparison form.

Repair:
- Name the headline theorems in the README. §7.13 and §5.4 (e) are what the consumers use; §§3.3 (a), 4.4 (b) and 6.4 (a) are candidates.
- State in `Suggested.lean` those that are statable with simple definitions on native carriers; the spaces `V = (J, x)` and the group `G(s)` of §3.1 are such definitions.
- Name each remaining headline in the docstring with its missing carrier. For §§7.10 and 7.13 that carrier is the discrete-series kernel `e_l`, whose coefficient `c_λ` is HolomorphicDiscreteSeriesOfUnitaryGroups §4.1 (d).

## R05 (P2) — The pull request edits the roadmap list in the top-level `README.md` and regenerates `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml`, outside every roadmap folder

`CONTRIBUTING.md` (line 144) says a roadmap pull request touches only its own directory under `TauCetiRoadmap/`. The list in `README.md` is regenerated by the sync bot after merge, and on main the umbrella files are synced by the same bot ("chore: sync umbrellas"). Hand edits only conflict with other open pull requests. Here they amount to one added line in `README.md` and about 19,500 changed lines in the two umbrella files. Drop the three files from this pull request.

## C01 — §7.12 (a) says that the traces of `A^l (T⁺)^i` determine `tr(Ae)`; this holds only for two systems with the same `d` and `c`

Take `M = ℂ`, `A = 1`, `T⁺ = 2`. With `d = 1`, `c = 3`, `e = 1`, and with `d = 4`, `e = 0`, every trace is `2^i`, while `tr(Ae)` is `1` in the first case and `0` in the second. The formal proof's `trace_mul_mean_eq` compares two systems "for the same `c, d > 0`", and §7.12 (b) uses the fixed `d = q^{n−2}`, `c = q^n − 1`. Suggested wording: "for two such systems with the same `d` and `c`, equal traces of `A^l (T⁺)^i` for all `l, i ≥ 1` give equal `tr(Ae)`".

## C02 — The method of §2.4 (line 387) names `IsDedekindDomain.HeightOneSpectrum.distribHaarChar_adicCompletion`, which exists nowhere at the pins

Neither the pinned Mathlib, nor the pinned Tau Ceti, nor the formal proof has it. Mathlib has `distribHaarChar` (`Mathlib/MeasureTheory/Measure/Haar/DistribChar.lean`, line 44), but its value on `E_w` is not computed there. Name that declaration and say that the local computation is part of (a).

## C03 — Nineteen origins name no work, and there is no reference list

Sections §§1.1–1.3, 2.2–2.4, 3.2, 3.6, 4.2, 5.3, 5.4, 7.3–7.8, 7.10 and 7.13 give their origin as "adapted from the published theory of …" or as "(Kottwitz, Clozel, Harris and Taylor, Labesse)", with no work or locator. The README also has no reference list, so the author–year citations (Barnes 1980, Knus 1991, Green 1955, Gross 1999, …) cannot be resolved. The formal-proof locators are exact, so no statement is unsupported, but a reader cannot check one against the literature.

Add a `## References` section, and one locator per origin where a published source exists. Several such sources are already on main: AdelicAlgebraicGroups §3.1 for integration in Iwasawa coordinates, and AnalyticNumberTheoryPartII §5.3k for Weil's formula.

## C04 — The pull request's description says that results implied by existing sections are cited, which this folder does not do

The description says: "A result that an existing section states, or implies, is cited: each roadmap ends with a list `Results taken from other roadmaps`." This folder restates such results (R02), and its list has three items. The head follows the description's next sentence instead. Until R02 is resolved, a description that matches the head would read: "Where an existing section states or implies a statement the route uses, the statement is kept as a target and the section is named beside it."

## N01 — README shape

The title is not `# Roadmap: …`. There is no `**Summary.**` overview stating headline theorems, the layers end without Examples and Dependencies, and there are no Scope and ownership, Exact supplier contracts or References sections. "Results taken from other roadmaps" names three of the roughly ten roadmaps that the *Needs:* lines draw on.

## N02 — The `New.*` names after each `[ShortProof]` are declarations of the external formal proof, set in code font like library names

A reader who searches the pinned libraries finds none of them. One sentence under "Origin and method" saying so, with the repository and commit that the family index gives, would separate them from library names.

## N03 — There are no Checks; two would pin conventions

- §7.11 (a) on the trivial representation: both sides equal `q^{2n−2}`, since `T^±` each have degree `q^{n−1}`. Putting `q^{n−1}` in place of `q^{n−2}` would give `q^{2n−1}`.
- `ψ_f(1/5)` for `E = ℚ(i)`: this README's convention gives `e(2/5)`, the convention of AnalyticNumberTheoryPartII §5.3g gives `e(−2/5)`.

## Questions for the author

- §5.2 cites "Barnes (1980), Lemma 1 and Proposition 1" for the projector of an integrable discrete series. Which paper is this? With no reference list I could not identify it or open it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.1–2.2 standard character and measure | `ψ` against AnalyticNumberTheoryPartII §5.3g | here `e(−2Re z)`, `e(Tr a)`; there `e(2Re z)`, `e(−Tr a)`: inverse characters; both measures `2^{r₂}Leb^{r₂}·|d_E|^{−1/2}` | holds | R02 (owner) |
| §2.4 (b), (d) | Lean push-forward; unitary idele | `μ∘(a·)⁻¹ = |det a|_f⁻¹μ` ⇔ `μ(aA) = |det a|_f μ(A)`; `āa = 1` ⇒ `|a|² = 1` ⇒ `|a| = 1` | holds | none |
| §3.3 (a) | Kirschmer 2016 Thm 2.4.1 p. 20; `g = x⁻¹ax′` | 2.4.1: isometric iff locally isometric; `g*σ_s g = x′*a*Jax′ = x′*J′x′ = σ_s`, so `g ∈ G(s)` | holds | R02 |
| §3.4 (a), (c) | `ζ` primitive of order 5040 | `ζ−ζ̄ = ζ⁻¹(ζ²−1)`, `ζ²` of order 2520 (not a prime power) ⇒ unit ⇒ `E/E⁺` unramified ⇒ units are norms | holds | none |
| §3.5 | signs `(p₊, p₋)`, isotropic frame of `p` vectors | `p ≤ min(p₊,p₋)`, `n = m+2p`; `det V₀ = (−1)^p det V`, `−1 = ȳy` ⇒ `V₀` locally standard | holds | none |
| §3.7 (a) | Lean quasi-reflection, `u = y₀ − x` | `σ+σ̄ = h(x,x) − 2Re h(x,y₀) = h(u,u)`; `h(y₀,x₀) ≠ 0 ⇔ h(x₀,y₀) ≠ 0` | holds | none |
| §6.1 Harish-Chandra parameter | `n = 1`; general `p` | `hc₀ = 2e`; `μ_p` non-increasing ⇒ `hc_p − hc_{p+1} ≥ 2`; parity `n−1` as in Holomorphic §4.1 (c) | holds | none |
| §6.2 (c) | `U(n)` of mass one | formal degree of an irreducible = its dimension; `∏_τ dim W_τ = dim W` | holds | none |
| §6.3 (c) | `S = {w : K₀,w ⊄ H}` | finite, inside `{w ∣ M}` once `K(M) ⊂ H` (3.9 (b)); stable under `w ↦ w̄` since `K₀,w = K₀,w̄` | holds | none |
| §6.4 (a), (c) | Schur on `U(n)^Φ`, `‖v⁺‖ = 1` | `∫ρ(z)v⁺⟨ρ(z)v⁺,φ⟩dz = φ/d` ⇒ inverse map correct; `S = d[K₀:K]⟨φ♮,φ′♮⟩` both ways | holds | R02 |
| §6.5 | quantifiers against the Lean | `∃C ∀ψ,u,K,Φ` in both; `[K₀:K]⁻¹I_{Γ,K}` independent of `K` | holds | none |
| §6.6 (b), (c) | weak approximation above `p`; `σ ∈ Aut ℂ` | `U_w = GL_n(𝒪_w) ∩ h_w⁻¹GL_n(𝒪_w)h_w` gives both conditions; `σ∘Φ_τ` is a CM embedding, so `ρ(γ)` stays unitary | holds | none |
| §7.2 | Lean hypotheses | pairwise non-conjugate places, label of degree `n`, irreducible: as in the README | holds | none |
| §7.3 (a)–(d) | exponents; `n = 1, 2` | Lean `−8n²−1`, `4fn²`, `B > 8n²`; `13n³ > 8n²` for `n ≥ 1` | holds | none |
| §7.10 | `n = 1, 2` | order `10n⁵ ≥ 13n³` ⇔ `n ≥ 2` (at `n = 1`: `10 < 13`); Lean: 5040, `f` even, `n ≥ 2` | holds | none |
| §7.11 (a) | trivial `ρ`; coefficient of `1` | degrees `q^{n−1}`: left side `q^{2n−2}`, right side `q^{n−2}·q^n`; coefficient of the identity `q^{n−1}` on both sides | holds | none |
| §7.11 (c) | `m = 1, 2` | the reduction kills `e_i` and is invertible on `k^n/⟨e_i⟩` ⇒ `X` divides the characteristic polynomial exactly once | holds | none |
| §7.12 (a) | `M = ℂ`, `A = 1`, `T⁺ = 2` | `(d,c,e) = (1,3,1)` and `(4,·,0)`: traces `2^i` both; `tr(Ae) = 1` and `0` | fails unless `d`, `c` are the same | C01 |
| §7.12 (b) | `n ≥ 2` | `d = q^{n−2} > 0`, `c = q^n − 1 > 0`; components at `v` lie in `K`, act trivially on `ρ^K` | holds | none |
| §4.1 (a), (b) | `E = ℚ(i)`, `n = 1` | `y = 1`: count 1, `|det y| = 1 ≤ 4`; `y = ϖ` at `(1+i)`: `(1/2)·2 = 1 ≤ 4` | holds | none |
| §7.6 (a) | `n = 1, 2` | isotropic `A` has `0 < dim A ≤ n/2 < n` ⇒ the characteristic polynomial factors; `n = 1`: none exist | holds | none |
| §7.9, what it needs | HermitianFormsAndLattices §3.2, `n = 1` | signs with product of `η_v` one and trivial finite classes give `a ∈ L⁺`; local norms give `u` with `a·u·ū = 1` | owner on main | R03 |
| Headlines §7.13, §5.4 (e) | `Suggested.lean` | 0 declarations; probe of §§3.4 (a), 7.12 (a) elaborates with only `sorry` | statable statements absent | R04 |

- **Sources against the text.** Kirschmer 2016, Thm 2.4.1 (p. 20), Thm 3.3.3, Prop. 3.3.5 and Thm 3.3.6 (pp. 32–33). Twenty declarations of the formal proof at the cited commit: `Space.landherr`, `Core.exists_form_eq_one`, `U.hasse_principle_coboundary`, `witt_Ô`, `exists_unit_star_mul_self_eq`, both lemmas of `SmoothWitt`, four of `IdeleModulus`, `exists_reduction_and_idele_generator`, `integral_algFormCoeff_blockEmb`, `weylGauge`, `isCuspidalAt_convIndicator_tupleIdem`, `exists_tsum_majorant_le`, `exists_tsum_enorm_kernelTerm_le_height`, `trace_comparison`, `lineRaise_lineLower`, `trace_mul_mean_eq`.
- **Library declarations opened at the pins.**
  - Tau Ceti `RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean`: lines 206, 294, 476, 512.
  - Tau Ceti `NumberTheory/NumberField/Global/Adeles/GaloisAction.lean`: line 285.
  - Also found in Tau Ceti: `cyclicHasseNorm`, `isOpen_congruenceSubgroup`, `discreteTopology_principalSubgroup`, `compactSpace_quotient_principalSubgroup`, `ideleNorm`, `ideleNorm_unitEmbedding`, `ideleNorm_ideleNormMap`, `finiteAdeleNorm`, `finiteAdeleBaseChangeEquiv`, `mem_range_adeleExtension_iff`, `finiteAdeleExtension`, `commute_asAlgebraHom_of_forall_commute`, `lift_mapDomain`.
  - Mathlib: `Haar/Quotient.lean` line 378, `FiniteAdeleRing.lean` line 132, `DistribChar.lean` line 44, `CMField.lean` line 142, `Integral/Prod.lean` line 443.
  - Missing: `distribHaarChar_adicCompletion` (C02).
- **Cross-roadmap citations resolved.**
  - On main: HermitianFormsAndLattices §§1.1, 2.5, 3.1, 3.2, 3.5, 4.12; GeometryOfNumbersAndQuadraticArithmetic §4.4 (4.4.14); DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5c; AutomorphicFormsOnReductiveGroups §§7.4, 7.5; AnalyticNumberTheoryPartII §§5.3g, 5.3h, 5.3k; AdelicAlgebraicGroups §§3.1, 3.4, 4.2; ThetaKernelsForUnitaryDualPairs §5.7a; ALS.F.6; EndoscopicTransferAndUnitaryTraceComparison §2.10; BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a; RepresentationTheory/CompactGroups §4.1; AdelicHeightsAndSuccessiveMinima §3.1.
  - In this pull request: Holomorphic §§1.1, 1.4, 4.1, 5.3, 5.4, 6.1, 7.1, 7.4; IntegralRepresentations §§1.1–1.3, 2.1, 2.3, 2.4, 3.4, 4.4, 5.3; Weil §§3.1, 5.1, 9.2; Galois §1.1; SecondMomentsOfPoincareSeries §2.3.
  - All exist, except IdelicReciprocity, which is cited without a section (R03).
- **Automatic checks.** One failed, the check for changes outside the folder; it is real (R05). Dependency check output: `depcheck: 115 roadmaps, 1310 edges, 0 problem(s)`. It does not see R01, because the five other roadmaps are not in the merge order.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no warnings and no declarations, so there is no `#check @name` comparison to make and no one-tactic padding probe to run. A separate probe with two statements of this README elaborates with only `sorry` warnings.
- **Overlap check:** read ThetaLiftChainsAndTheSeesawIdentity (open), HermitianFormsAndLattices (main), ThetaLiftsForDefiniteUnitaryGroups (main), and also DiscreteSeriesCoefficientsAndAutomorphicMetrics, AutomorphicFormsOnReductiveGroups and AdelicAlgebraicGroups (main). Shared objects and their owners:
  - Landherr's theorem: HermitianFormsAndLattices §3.1.
  - Weak approximation at finite places: HermitianFormsAndLattices §2.5 (f).
  - Class-set integration, mass, Petersson comparison and Hecke adjoints: DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a.
  - Algebraic modular forms and their finiteness: AutomorphicFormsOnReductiveGroups §§7.4, 7.5.
  - Finite volume: AdelicAlgebraicGroups §3.4.
  - ThetaLiftChainsAndTheSeesawIdentity and ThetaLiftsForDefiniteUnitaryGroups only use class sums.
- **Ownership against open pull requests.** No open pull request changes this roadmap or drops an id it cites; the heads of the open pull requests were searched by object.

## Not verifiable

- Gross 1999 (origins of §§1.5, 4.4, 6.2–6.4): the DOI resolves only to the publisher's paywall.
- Green 1955 (§7.2): the publisher's archive is not on a host that I could certify as a legal copy.
- Scharlau 1985, Chapter 7 (§§3.4, 3.5, 3.7), and Knus 1991 (§3.5, no locator): books behind a paywall.
- Landherr 1936, Jacobowitz 1962 and Shimura 1964 (§§3.3, 3.4): not opened; Kirschmer 2016, which I read, states the results cited from them.
- "Kottwitz, Clozel, Harris and Taylor, Labesse" (§§7.3, 7.6, 7.7, 7.10, 7.13): no work is named.
- §§2.4, 6.1, 6.5, 6.6, 7.11, 7.12 cite no published source; I checked them against the formal proof and by computation.

## Source issues

- none

## For the human reviewers

- **Scope.** Line 3 of the README says that the argument "proves the Riemann hypothesis for Dirichlet L-functions". Its only complete source is an unpublished, unrefereed formal proof (the repository `lsernau/grh-lean` at the commit the family index names). The description says no statement here has been read by a specialist.
- **Licence.** Every section restates statements and docstrings of that repository, which is under the Apache 2.0 licence, and cites its files and declarations. Whether its attribution or NOTICE terms bind the roadmap is a licence question.
- **Not tested.** Gross 1999 and Scharlau 1985, the main published sources of Layer 6 and of §§3.4–3.7, could not be read. The wording and arrangement checks were not done against them.

Source independence: 12 passages compared with 2 sources (the formal proof's docstrings and Kirschmer 2016). The longest shared run is 8 words, in the definition of the gauge in §6.6; the rest is formula-forced wording. The largest share of locators is `[ShortProof]`, in 45 of 45 sections; no published work is cited more than 5 times. Contents compared with the formal proof's index: the layers group its `Lib/Adelic` directories by subject in dependency order, not in its listed order. Result: independent.

Research link: Layers 3–7 are classical theory of unitary groups that the route uses: Landherr's Hasse principle (Landherr 1936, as stated in Kirschmer 2016, Thm 2.4.1), Gross's algebraic modular forms (Gross 1999), and the simple trace-formula comparison of inner forms of unitary groups (attributed to Kottwitz, Clozel, Harris–Taylor and Labesse). The consumer is SecondMomentsOfPoincareSeries §2.3. This rests on the README and on Kirschmer 2016, which I read.
