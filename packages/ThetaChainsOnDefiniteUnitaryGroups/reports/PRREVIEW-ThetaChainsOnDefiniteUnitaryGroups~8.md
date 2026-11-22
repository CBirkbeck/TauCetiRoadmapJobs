# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #2918 at 8dc180e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 89 lines changed since `7f27c46`: the new section 2.6a on enlarging the field of places, its pointer in 2.5, Lemma (iv), and new [FormalProof] locators in 2.5, 3.9 and 3.10. I recomputed every statement of 2.6a (the index and weight formulas, the fibre statement, the transport of characters, both Checks) and opened all twelve new locators and the new Mathlib declaration; all hold. Two format notes of the previous review stand, neither blocking; the scope and licence questions about the formal proof, and one about the pull requests that carry the family, remain for the human reviewers.

## N01 — "The mathematics of this roadmap follows a complete formal proof" (Conventions, line 142; References, line 2555; `Suggested.lean` line 28) still reads as the statement the planning principles exclude. The arrangement is the roadmap's own, so "states what [FormalProof] establishes" would say what is meant.

## N02 — 2.3a (line 751) still carries no locator, although its construction is `GlobalTheory.EX.HCVal` in `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean`, the file 2.2 cites for `HostVal`. Naming it would give the existence statement its reference.

## Previous findings

The previous review had no finding (R01, …); its two format notes are accounted for here.

- N01 — not repaired: the three sentences are unchanged; written again above.
- N02 — not repaired: 2.3a unchanged; written again above.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 2.6a Setting, the weight of `𝔭′` (line 1104) | `𝔭′ \| 𝔭`, `N𝔭′ = N𝔭^f` | `ϱ(𝔭′) = f(𝔭′\|𝔭)·ϱ(𝔭)/[𝕃′:𝕃]`, `e_{𝔭′} = e(𝔭′\|𝔭)e_𝔭` | `f·log N𝔭/([𝕃′:𝕃][𝕃:ℚ])`; multiplicativity of `e` in towers | holds | — |
| 2.6a (a), slopes | Conventions formula `−rk·μ = mean_σ log det Gram − 2Σϱ·idx` | `μ`, `μ_max`, `μ_min` unchanged | mean over `σ′` equals mean over `σ`; `Σ_{𝔭′}ϱ(𝔭′)idx_{𝔭′} = Σ_𝔭 ϱ(𝔭)idx_𝔭` by (b); max and min: supplier §3.5 | holds | — |
| 2.6a (b), index | `L₁ ⊃ L₂` locally `⊕ O/π^{a_i}`, tensored with `O′`, `π = unit·π′^e` | `idx_{𝔭′} = e(𝔭′\|𝔭)·idx_𝔭` | `O′/π′^{e·a_i}` has length `e·a_i`; total `e·Σa_i` | holds | — |
| 2.6a (b), weighted sum | sum over `𝔭′ \| 𝔭` | `Σϱ(𝔭′)idx_{𝔭′} = ϱ(𝔭)idx_𝔭` | `ϱ(𝔭)idx_𝔭·Σ e·f/[𝕃′:𝕃] = ϱ(𝔭)idx_𝔭`; `idx_{𝔭′}/e_{𝔭′} = e·idx_𝔭/(e·e_𝔭)` | holds | — |
| 2.6a Check (i) | `ℚ(i) ⊂ ℚ(ζ₈)`, `ℤ[i]`, `(1 + i)ℤ[i]` | indices `1`, `2`; `ϱ` `log 2/2`, `log 2/4`; both products `log 2/2` | `2` totally ramified in `ℚ(ζ₈)`, `e = 2`, `f = 1`; `1·log 2/2 = 2·log 2/4` | holds | — |
| 2.6a (c), fibres | `𝕃₀ ⊂ 𝕃` Galois, `g ∈ Gal(𝕃/𝕃₀)` | nonzero set is the fibre of a finite `P₀`; `idx_{g𝔭} = idx_𝔭` | by (b), `idx_𝔭 = e(𝔭\|𝔭₀)idx_{𝔭₀}`, `e ≥ 1` constant on a Galois orbit; `P₀` does not involve `𝕃` | holds | — |
| 2.6a Check (ii) | `L₁ = 𝒪_𝕃`, `L₂ = 𝔭`, `g𝔭 ≠ 𝔭` | index `1` at `𝔭`, `0` at `g𝔭` | `𝒪/𝔭` has length `1` at `𝔭`, `0` elsewhere; `𝔭` is not `g`-stable, so not defined over `𝕃₀` | holds; separates (c) from the statement without a field of definition | — |
| 2.6a (d) and 2.5, Lemma (iv), the datum for `𝕃′` | `ψ_{𝔭′} := ψ_𝔭`, `Tw′` the places above `Tw` | a twisting datum; `Ξ`, `Q(ξ)`, `Z₀`, `𝒮_tw` unchanged; (T1), (T2) kept | `c_{𝕃′}(𝔭′)` lies above `c_𝕃(𝔭)`, so `ψ_{c(𝔭′)} = ψ_{𝔭′}` and `Tw′` is stable; restriction of places is onto, so `Ξ` is the same set; (T1) is on `𝒮_tw`, (T2) on full fibres | holds | — |
| 2.6a (d), Galois transport | `g : 𝕃_𝔭 ≅ 𝕃_{g𝔭}`, `ι_{g𝔭}∘g = ĝ∘ι_𝔭` | character of `ψ` at `g𝔭` is that of `g^{−1}∘ψ` at `𝔭`; `g^{−1}∘ψ = ψ^a`, `ℓ ∤ a` | `ĝ^{−1}∘ι_{g𝔭}∘ψ = ι_𝔭∘g^{−1}∘ψ`; `g^{−1}` acts on `μ_{ℓ^k}` by a unit `a` mod `ℓ^k` | holds | — |
| 3.10 and 3.9 API (b), statements the new locators are attached to | `PeriodClassSumWeyl`, `TwistedPeriodAdmissible`, `TwistedPointIntegral` in [FormalProof] | valuation `≥ −e_𝔭·v_p(D_Γ)` at every `𝔭`; for a tuple, at `𝔭` with residue characteristic not below `Q(ξ)` | the first bounds the period's valuation at every place; the second only at places with residue characteristic outside the tuple's set of primes | locators support the statements | — |

The rows for the untouched statements stand as in the previous review, of `7f27c46`.

- Source locators: 12 new [FormalProof] locators (1 in 2.5, 8 in 2.6a, 1 in 3.9, 2 in 3.10) opened in the source as published; every file exists and declares the name in the namespace given. Read for content: `Enl` (two bases with the same coefficient data, the smaller field of places inside the larger), `Ext`, `Coh` (the data agree at places with the same restriction to the subfield), `TwFrom` (the datum taken from the place below), `extendedData_nonzero_index_places_correspond_alt` (a place and one above it are both in or both out of the nonzero set), `untwisted_adelic_data_saturated_over_fixed_field`, `theta_lift_data_over_coefficient_extension`, and the three of the row above.
- Library declarations opened: `Ideal.sum_ramification_inertia_eq_finrank`, `Mathlib/RingTheory/RamificationInertia/Basic.lean` line 73 (`[IsDomain R] [Module.Finite R S] [Module.Flat R S]`, a prime `p`; the sum equals `Module.finrank R S`), as the supplier contract describes it.
- Cross-roadmap citations: one added, SlopesOfHermitianVectorBundles §3.5, resolved at the head of the open pull request that carries that folder (#2954): it states `μ̂_max` and `μ̂_min` unchanged under a finite extension, with normalised degrees preserved in its route. Internal references of the change (2.5 Lemma (iv) ↔ 2.6a (d); Conventions; 2.6) exist and say what is used.
- Seeded sample: of its targets 2.5 is changed and 2.6 is cited by 2.6a; both checked in the table. The others stand as in the previous review.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no messages; the file is unchanged and declares nothing, so there is no `#check` comparison and no one-tactic probe.
- Outside the folder: nothing changed since `7f27c46`; against the base only the family index differs.
- The pull request's text: title and prose read against the head; nothing contradicted. The change adds a subsection, a Mathlib citation and locators; no section is removed or renumbered and no supplier roadmap is added or dropped.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts (open; none close on main); the enlargement of the field of places is stated only here, and ThetaChainsAndFrobeniusPrimeSums uses it by citing this roadmap's 2.6; nothing shared.

Source independence: changed passages only; 4 passages (the statement and the route of 2.6a, the sentence added to 2.5, the locator lines of 3.9 and 3.10) compared with 1 source ([FormalProof], Lean code without prose), none shared; largest share [FormalProof], every file locator; the diff adds a subsection but adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 2–3 build the chain of theta lifts between totally definite unitary groups on which Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026) rests ([Announcement] lines 158–169), with the theta correspondence (Kashiwara–Vergne 1978; Howe 1989) and Gross's algebraic modular forms (1999) as inputs; README References and [Announcement].

## Not verifiable

- The eight [FormalProof] locators of 2.6a were opened and read as statements; that each is used in the proof for exactly the part ((b), (c), (d)) it is listed under was judged from the statements, not traced through the proofs.
- The items of the earlier reviews' lists (the vector `conj Φ` of the row up-lift in [FormalProof]; the exponents of 2.9c beyond the first step; 3.1d and 3.3 outside `d ≡ 7 (mod 16)`; the uncertified and credit sources) are untouched by the change and stand as there.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof] (README References), an unrefereed Lean formalisation by one author announced 2026-11-20 with no paper; [Announcement] lines 45–49 say a write-up is to follow. The family's end theorem is the Riemann hypothesis for Dirichlet L-functions.
- Scope: 3.1d and 3.3 are stated for every prime `d ≡ 7 (mod 8)`; outside `d ≡ 7 (mod 16)` the README says they rest on steps with no proof, here or in any source; the description says so as well.
- Licence: [FormalProof] was published without a licence; its repository says so, and the family index reports it. `Suggested.lean` declares nothing, so no declaration is taken from it.
- Merge order: seven supplier pull requests in the description's dependency list (#2877, #2880, #2881, #2882, #2897, #2909, #2920) were closed on 2026-11-22 in favour of #2954, which carries the whole family, this folder included with files identical to this head.
