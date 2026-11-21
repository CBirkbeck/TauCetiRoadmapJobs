# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #2918 at 10adbd0)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 8 lines changed since `ce7c6df`: the three small corrections of the previous review are repaired, and the new sentence of 2.2 on the skew element agrees with the two declarations of [FormalProof] it cites and with the identity of 2.2 (f), which I recomputed for a general ideal `𝔠`. The title and description agree with this head. Two format notes of the previous review stand, neither blocking. The scope and licence questions about the formal proof remain for the human reviewers.

## N01 — "The mathematics of this roadmap follows a complete formal proof" (Conventions, line 142; References, line 2476; `Suggested.lean` line 28) still reads as the statement the planning principles exclude. The arrangement is the roadmap's own, so "states what [FormalProof] establishes" would say what is meant.

## N02 — 2.3a (line 746) still carries no locator, although its construction is `GlobalTheory.EX.HCVal` in `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean` (line 93 there), the file 2.2 now cites for `HostVal`. Naming it would give the existence statement its reference.

## Previous findings

The previous review had no finding (R01, …); its small corrections and format notes are accounted for here.

- C01 — repaired: line 1487 now reads "`𝕃` is the field of places of 2.6 read in `ℂ` through `σ₀`", as the Conventions (line 29) and 2.6 (line 1037) name it.
- C02 — repaired: lines 454–458 record that the proof's skew element is `−1/(N(𝔠)·√−d)`, that the construction takes `𝔠 = 𝒪_K` (`GlobalTheory.EX.HostVal`), and that a general `𝔠` gives `δ_T/N(𝔠) ∈ ℚ_{>0}·δ_T`.
- C03 — repaired: the description now says "where a target is stated more widely than the proof (here 3.1d and 3.3 … `d ≡ 7 (mod 16)`), the README names the steps that have no proof", and gives the cyclic hosts.
- N01 — not repaired: lines 142 and 2476 and `Suggested.lean` line 28 unchanged; written again above.
- N02 — not repaired: 2.3a unchanged; written again above.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 2.2 *KNOWN*, the skew element of the proof (lines 454–458) | general nonzero `𝔠 ⊂ 𝒪_K`; `𝔠 = 𝒪_K` | element `−1/(N(𝔠)√−d)`; identity of (f) with `𝔠𝒪_E·𝔞₀`; `𝔠 = 𝒪_K` gives `δ_T`, `𝔞₀` | `xi0 = −1/(absNorm ccK · sqrtMinusD)`; `AA = ccE·𝔟⁻¹`; `FactPrincipalDatum`: `(xi0)·AA·AAbar·ddE = 1`; `HostVal` has `ccK = ⊤` | agrees with the source | — |
| 2.2 (f) for general `𝔠` | `𝔞 = 𝔠𝒪_E·𝔞₀`, `δ = δ_T/N(𝔠)` | `(δ)·𝔞𝔞̄·𝔇_{E/ℚ} = 𝒪_E` | `𝔞𝔞̄ = (𝔠𝔠̄)𝔞₀𝔞̄₀ = (N𝔠)𝔞₀𝔞̄₀`; `(δ_T/N𝔠)(N𝔠)𝔞₀𝔞̄₀𝔇_{E/ℚ} = (δ_T)𝔞₀𝔞̄₀𝔇_{E/ℚ} = 𝒪_E` | holds | — |
| 2.2a normal form (lines 465, 475), cited by the new sentence | `δ = δ_T/N(𝔠)`, `N(𝔠) ∈ ℤ_{≥1}` | pairs with `δ ∈ ℚ_{>0}·δ_T` allowed | `1/N(𝔠) ∈ ℚ_{>0}`; `Im τ(δ) = Im τ(δ_T)/N(𝔠) > 0` on `Φ` | holds | — |
| Layer 3 introduction (line 1487) | name of `𝕃` | "the field of places of 2.6" | Conventions line 29 and 2.6 line 1037: `𝕂` coefficient field, `𝕃` field of places | consistent | — |

The rows for the untouched statements stand as in the previous review, of `ce7c6df`.

- Source locators: 2 declarations of [FormalProof] opened for the changed passage (`Formalism.BasicNotions.Host.xi0`, with the host fields `ccK`, `ccK_ne_bot`, the definitions `AA`, `AAbar` and `FactPrincipalDatum`, in `Formalism/LocalRingCardinality/DataHost.lean`, lines 86–87, 149–161, 213–215; `GlobalTheory.EX.HostVal` in `…/GlobalTwisting/PairRowIffQdRows.lean`, lines 78–84); both namespaces as cited.
- Library declarations opened: none (the change touches no library claim).
- Cross-roadmap citations: the change adds none; the sections 2.2 (f) and 2.2a it names exist and say what it attributes to them.
- Seeded sample: of its targets only 2.2a is touched (cited by the new sentence); checked in the table. The others stand as in the previous review.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 170 roadmaps, 1991 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no messages; the file is unchanged and declares nothing, so there is no `#check` comparison and no one-tactic probe.
- The pull request's text: title and description read against the head. The hosts, `δ_T`, the range of 3.1d and 3.3, the family index and "`Suggested.lean` declares nothing" all agree with the README Summary and the files; nothing contradicted, nothing unstated (the pull request adds the roadmap; no section or declaration is removed).

Overlap check: read SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums, GluedTargetAndDivisionInequality, LocalGainOfThetaChains, RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts (open; none close on main), as in the previous review; the change adds no object and moves no ownership; nothing shared.

Source independence: changed passages only; 2 passages (the sentence added to 2.2, the reworded clause of the Layer 3 introduction) compared with 1 source ([FormalProof], Lean code without prose), none shared; largest share [FormalProof], every file locator (69 at the previous head, one added by this change); the diff adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 2–3 build the chain of theta lifts between totally definite unitary groups on which Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026) rests ([Announcement] lines 158–169), with the theta correspondence (Kashiwara–Vergne 1978; Howe 1989) and Gross's algebraic modular forms (1999) as inputs; README References and [Announcement].

## Not verifiable

- [FormalProof] was read as source text only; it is not built here, so that its declarations are proved was not checked. `FactPrincipalDatum` is a statement of the identity (a `Prop`-valued definition); where the proof discharges it was not traced.
- The items of the previous review's list (the exponents of 2.9c; 3.1d and 3.3 outside `d ≡ 7 (mod 16)`; the uncertified and credit sources) are untouched by the change and stand as there.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof] (README line 2476), an unrefereed Lean formalisation by one author announced 2026-11-20 with no paper; [Announcement] lines 45–49 say a write-up is to follow. The family's end theorem is the Riemann hypothesis for Dirichlet L-functions.
- Scope: 3.1d and 3.3 are stated for every prime `d ≡ 7 (mod 8)`; outside `d ≡ 7 (mod 16)` the README says they rest on steps with no proof, here or in any source; the description now says so as well.
- Licence: the licence of [FormalProof] is not established here. The README links its public repository (line 2476); `Suggested.lean` declares nothing, so no declaration is taken from it.
