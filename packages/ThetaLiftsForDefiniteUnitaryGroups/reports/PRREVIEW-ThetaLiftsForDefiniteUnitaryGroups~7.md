# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #2897 at 4ca71d8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 33 lines changed since `7cda043`: the sign in the inert-place Check of 2.3 is now determined, and the 13 new locators into the formal proof (6.2, 6.7, 6.8, 6.9) were each opened at the first commit of the repository; every declaration exists in the file named and says what the paragraph attributes to it. One small correction and three format notes (carried over), none blocking. Left for a human: the scope and licence questions about the formal proof, unchanged.

## C01 — The reference [FormalProof] does not name the commit at which its file paths are to be read

The family index now says that the files the roadmaps name "are to be looked up at that first commit, under its directory `src/`; the reference to the formal proof in each roadmap names that commit". The entry [FormalProof] in the References of this roadmap (line 2887) gives the repository address only, so a reader of this README alone does not know at which commit, or under which directory, `Development/WeilBound/ThetaLifts/EigenvalueEndgame/PlaneRemovalConfiguration.lean` and the 72 other paths resolve. I checked the five files the new locators name: each exists at `40e56bab026552e089d7afcfeff08d2defb9c005` under `src/`.

The smallest change: add to the entry "the file paths are relative to `src/` at commit `40e56bab026552e089d7afcfeff08d2defb9c005`", as the family index describes.

## N01 — Two letters carry two meanings in 1.8

Unchanged: in 1.8 `E` is the CM field and the Riemann form, and `B` is the symplectic form, an abelian variety (`B^{nd}`) and, as `B⁻¹`, the inverse Bargmann transform. Another letter for the Riemann form and for the abelian variety would remove the ambiguity.

## N02 — Two supplier headings name a path that is not there, and three cited roadmaps have no contract

Unchanged: the headings `From TauCetiRoadmap.CompactGroups` and `From TauCetiRoadmap.ClassicalGroups` point at roadmaps that live under `RepresentationTheory/`; PotentialAutomorphyInfrastructurePartII §3.5 (2) (used in 2.4, 4.3) and EndoscopicTransferAndUnitaryTraceComparison §6.3 (route of 0.2) are in no `*Needs:*` line and have no subsection in the supplier contracts; 6.3 uses the density statement of 6.8, which its `*Needs:*` does not list.

## N03 — Most literature entries still have no theorem or page

Unchanged: about eighteen entries of the References have no locator (Finis for 1.9, Kashiwara–Vergne for 2.1, Li for 3.3 and 4.1, Labesse for 2.4 and 4.3, Gross for Layer 1). No stated result rests on them.

## Previous findings

The previous report had no finding (R); its small corrections and format notes are accounted for here.

- C01 (previous) — repaired: Check of 2.3 "`(q_v, q_v⁻¹)`, since `χ_{V,v}(ϖ_v) = (−1)^0 = 1`"; the Examples of Layer 2 read "`(q_v, q_v⁻¹)` (2.3)".
- C02 (previous) — repaired: 6.7 names `PositivityTheory.ThKEnd.PerpZero`; 6.8 eight declarations (`Chars.Good`, `nu_pow_ne_one`, `LocDecomp`, `PairLoc`, `ConstOfGood`, `ThZero`, `OrthIso`, `OrthAn`); 6.9 `CuspOfLine`, `AlphaLow`, `TwoStep`; each with its file. 6.2 gained `LocalMatching`.
- N01, N02, N03 (previous) — not repaired: text unchanged; written again above as format notes.
- The previous question on the commit of the file paths is answered by the family index (first commit `40e56bab`); see C01. The question on 6.3 (sharpness of `2n ≤ d` and `2·max(r_X, r_W) + 1 < n`) stands and blocks nothing.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.3 Check, inert place | `n = 0`, `d = 2` | `χ_{V,v}(ϖ_v) = η_v(ϖ_v)^n = (−1)^0 = 1`; `q_w = q_v²`, so `(q_w^{1/2}, q_w^{−1/2}) = (q_v, q_v⁻¹)`; reading `q = q_v` gives `(q_v^{1/2}, q_v^{−1/2})` | holds | repaired |
| Layer 2 Examples, `n = 0` | against 2.2 and 2.3 | split: `χ_{V,w}(ϖ_w)(q_w^{(d−1)/2}, …)`, for `d = 2` two entries; inert: `(q_v, q_v⁻¹)`, same as the Check | holds | repaired |
| 6.2 form of the formal proof | `LocalMatching` with `IsMatched`, `IsRealMaps`, `IsFinMaps` (WeilTensorModels.lean lines 433–496, 581) | triple ⟹ ∃ maps; real: `onto`, `nontriv`, `irred`, compatibility; finite: `sph` (equal nonzero image off `T`), `zeta` (equal image ⟺ equal zeta integrals on `T`) | agrees | none |
| 6.7 (sample) | `PerpZero` (PlaneRemovalConfiguration.lean line 148) | one difference `I(Φ) − I′(Φ′)`, `Φ′` regular, orthogonal to all `I(Ψ)`, `I′(Ψ′)` ⟹ `0`; no cuspidality hypothesis; README sum case: `⟨f, f⟩ = 0` | agrees | none |
| 6.8 (sample) good places | `Chars.Good` (line 372), `nu_pow_ne_one` (GoodNe.lean line 42) | `v ∉ T` and the rational prime below has `[E:ℚ]` primes above; `ν_w(ϖ)^k ≠ 1` for `k ≠ 0`, from `κ_w > N` | agrees | none |
| 6.8 local origin, invariance | `LocDecomp`, `PairLoc` (HodgeTateFromSandwich.lean lines 64, 69) | rapidly decreasing `f`, good `v ≠ v₁`: comes from both; `n + n′ = d`, `χ_W = χ_X/χ_{X′}`, `χ_W(ϖ) ≠ 1` at split `v` ⟹ right `U(X)(F_v)`-invariant | agrees | none |
| 6.8 constancy, vanishing | `ConstOfGood` (PairsStable.lean line 91), `ThZero` (line 83) | `n ≥ 2`, finite `T`, invariance at completely split places off `T` ⟹ constant; signature `r, s ≥ 1`, `n ≥ 3`, `χ_W ≠ 1` at `v₁` ⟹ `0` | agrees | none |
| 6.8 orthogonality | `OrthIso`, `OrthAn` (PlaneRemovalConfiguration.lean lines 136, 142) | cuspidal `f`: `p ≥ 1` ⟹ ⊥ `I_V`; `q ≥ 1` ⟹ ⊥ `I_{V′}`; `p = 0, q ≥ 1` ⟹ ⊥ `I_V`; `q = 0, p ≥ 1` ⟹ ⊥ `I_{V′}`; in a triple `a > a′ > 2(p+q)+1 ≥ 3` | agrees | none |
| 6.9 (sample) | `CuspOfLine`, `AlphaLow`, `TwoStep` (lines 131, 118, 124) | zero constant term along one plane ⟹ cuspidal; `fa` has law `(α, a′/2)`, `fb` `(β, a/2)`; `fa(l·k)` lies in `𝒟` of the smaller triple; `fb = 0` ⟹ pure of law `(α, a′/2)` | agrees | none |

The rows for the statements the change does not touch stand as in the previous review, of `7cda043`.

- Source locators checked against the text: 13 new file locators (5 files, 16 declarations named), all present at commit `40e56bab` and unchanged since; each is assembled as proved in the proof's `EndCore.lean` or by a named theorem (`goodNe`, `constOfGood`, `matching_of_parts`, `perpZero_of`, `orthogonal_isomorphism_holds`).
- Library declarations: none opened; `Suggested.lean` is unchanged and declares nothing.
- Cross-roadmap citations: the changed passages add none.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 133 roadmaps, 1489 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no message (no declaration, hence no `sorry` warning, no one-tactic probe and no signature to compare).
- Outside the folder the pull request changes only the family index; its entry for this roadmap is unchanged and describes the six layers.
- The pull request's title and description: no sentence is contradicted by this head; the change (a sign in a Check, locators) alters nothing they describe.

Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, SeesawForThetaChains, MetaplecticAutomorphicForms, GanGrossPrasadUnitaryGroups, AutomorphicLFunctionsAndLocalFactorsPartII; nothing shared (as in the previous review; the change adds no object).

Source independence: changed passages only: 5 passages compared with 1 source ([FormalProof], Lean statements), none shared; largest share [FormalProof], 73 of 86 locators; the change adds no layer, arrangement not compared again.

Research link: Layers 3–4 specialise the Rallis inner product formula and its nonvanishing consequences (Rallis 1984; Li 1992; Gan–Qiu–Takeda 2014) to definite unitary pairs; Layer 2 uses Mínguez 2008; Layer 6 is the non-split counterpart of GQT's second term identity and feeds the iterated theta lifts of Alpöge's 2026 announcement. Rests on the README's References, GQT and Announcement lines 158–169.

## Not verifiable

- The 60 [FormalProof] locators that this change does not touch: not opened in this incremental round (the previous review could not read them).
- J.-S. Li (1992), Finis (2006), Labesse (2011), Kashiwara–Vergne (1978), Gross (1999) and the other References without a locator: not held, no locator given.
- The steps of 6.3 and 6.5 marked "route not given here": not rederived.

## Source issues

- none

## For the human reviewers

- **Scope.** The routes of 1.2, 4.2–4.3, 5.2–5.3 and Layer 6 are attributed (README, References) to [FormalProof], a Lean formalization announced on 20 November 2026 with no refereed publication; the statements sit in the published theta-correspondence literature (Rallis 1984, Li 1992, GQT 2014).
- **Licence.** The family index says [FormalProof] was published without a licence and is mirrored for verification only. The README cites its file and declaration names; `Suggested.lean` declares nothing, so no formal statement is taken from it.
- **Not tested.** [FormalProof] has the largest share of the locators (73 of 86); only the five files of the 13 new locators were read, and the arrangement was compared with HarrisKudlaSweet1996 and GQT only (previous review).
