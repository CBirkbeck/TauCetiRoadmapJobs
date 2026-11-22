# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #2924 at 73ab875)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 129 lines changed since `bb48791`: the new hypotheses on the depth constant `C_F ≥ C_F⁰`, the scale `x ≥ x_F` and the gaps of the weight datum agree with RowTowerAndRallisIdentities §5.8 and GluedTargetAndDivisionInequality §§8.24a, 8.24c, 8.24 at their open heads, the gap hypotheses do hold at the parameters of 10.6, and every new locator into the formal proof names a declaration that says what the README attributes to it. No statement of `Suggested.lean` changed. There is one small correction (the description does not mention the section added to the family index) and two format notes; none blocks. The scope and licence questions stay with the human reviewers, with one more on the new section of the family index.

## C01 — The description says of the family index only that it lists the sub-roadmaps; the index now also states a rule for contributions and reviews

A reader of the description does not learn that this pull request (with the others of the family) adds a section of policy to the index. The description reads: "The family index (…) is carried, with identical content, by every pull request of the family; it lists the sub-roadmaps in merge order." At this head `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` has a new section "When a roadmap is wrong" (lines 45–75), which says what a contribution may do when a roadmap of the family is demonstrably wrong and what a review of it checks, and its opening paragraph now says that the cited files are to be looked up at the first commit of the public repository.

The sentence would be right with one clause added: "…it lists the sub-roadmaps in merge order, says at which commit of the published source the cited files are to be looked up, and has a section on what a contribution and its review do when a roadmap is wrong."

## N01 — "The mathematics of this roadmap follows a complete formal proof"

The first sentence of **Routes** (line 146) is unchanged: it says the roadmap follows a source. The family index now words the same fact as "The results that the family states are those of the formal Lean proof"; the same wording would serve here.

## N02 — The letter `C₁` in the new locator of 9.4 is already the constant of LocalGainOfThetaChains §4.10a

The locator added to 9.4 (line 508) writes the bound of the formal proof as `max(11, 16 + 3C₁)` "with `log g₀, log g₁ ≤ C₁·x^ε`", while 10.6 (line 946) fixes "the constant `C₁` of LocalGainOfThetaChains §4.10a … (`C₁ = 1` serves)"; 10.6a (line 1068) writes the same bound with `max(5, C_g + 1)` in that place. Another letter in 9.4 (say `C_Y`) would keep the two apart.

## Questions for the author

- 10.6 (lines 982–983) says that in the construction of [FormalProof] the band constant "is the square of the last of its constants". I did not find where the constant of the band condition is set to a square; the sentence has no locator. Which declaration fixes it? (Carried from the two previous reviews.)

## Previous findings

The previous report (of `bb48791`) had no finding; its small correction and its format note stand as follows.

- C01 (then) — repaired: the description now reads "(its exponent `c_Δ` chosen after `ε` and `c_H`, before the node spacing)", as the table of the Conventions and 10.6 have it.
- N01 (then) — not repaired: line 146 still reads "The mathematics of this roadmap follows a complete formal proof"; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.4 (d), new locator `C_T = 25` | `tr_le_of` (line 213), `arith` (line 132) of `TraceUpperBoundAllMembers.lean` | source: `C.CTu = 25` assumed, `log Tr ≤ 25·m·L`, `L = x^ε`; README: `log T(u) ≤ C_T·m·x^ε`, `C_T = 25` | matches |
| 9.4 (c), new locator | `part_five_all_of_explicit` (line 328), `RowsA` (line 115), `DataB`; `cTmin` (line 93) | source: `11 ≤ C`, `16 + 3CY ≤ C`, `log g_i ≤ CY·L`, `44 ≤ m ≤ k`, `m²L ≤ k`; `cTmin y = max 11 (16 + 3 max 5 (y+1))` | matches the hypotheses and the constant stated |
| 10.6a, the two values of `C_T` | `PageFix` (`CYL = 9`); `DesignS.lean` line 89 (`setTu Fm (cT eps 9)`); `HypsAlt.cT := cTmin` | `cTmin 9 = max(11, 16 + 3·10) = 46`; points: `CTu = 25`; standing conditions taken with `CYL + 1`, `c_b = 1/4`, `C_u = 3`, `c_T = 1/2` | `25` and `46` as the README says |
| 10.6, `C_F ≥ C_F⁰` | `nonempty_hyps_definite_side_of_closed_bound`: `max CF0 CF1`; RowTowerAndRallisIdentities §5.8; GluedTargetAndDivisionInequality line 453–456 | source: two existential thresholds, their maximum, no value; suppliers: `C_F⁰ ≥ 6510` before `ε`, `x_F ≥ x₀` after `ε`, `C_F` | README order (1) `C_F`, (2) `ε`, then `x₀ ≥ x_F`: consistent |
| 10.0 (H1) and 10.6b, the gap hypotheses | `HostHyp` (`LinksLemmas.lean` line 496); `hostHyp_of_gaps` (line 135); `hostHyp_frames_ev` (line 246) | `HostHyp`: `(t+3)/2`, `100r⁴`, `4N_m³ + 2t + 6`, `256r⁴`. At 10.6: `h₀ = 2h_gap ≥ 512N_m⁴ ≥ max(256r⁴, 4N_m³+2t+6)`; `4Δ_w ≥ 1024N_m⁴ ≥ 100r⁴`; `v_{k−2} = 0`, gap `b₁ ≥ w″ ≥ 100r⁴ + 1`; exponent `402·4 + 2 = 1610` | hold; equal to §5.8's hypotheses |
| 10.9 (b), new locators | `PageFix`, `PageWin` (`PageFix.lean`); `TameDistinctF`; `Duty` (line 77) | `cTO = 28·12 + 41 = 377`, `Ct = 401`, `Lw = 10⌈405 log x⌉ + 2⌈30/ε⌉ + 22`; `n ∈ [x^{2+8ε}, 2x^{2+8ε}]`, `k ∈ [x^{9/2+10ε}, 2x^{9/2+10ε}]`; `Duty` = `PageFix ∧ PageWin ∧ … ∧ TameDistinctF ∧ …` | equal to 10.6 (`A_n + 5/2 + 2ε = 9/2 + 10ε`, `L_th`) |
| 10.9 (c), enlarging the field of places | ThetaChainsOnDefiniteUnitaryGroups §2.6a (a)–(d); CongruenceModulesOfThetaLifts §7.8 (3); Check (i) of §2.6a: `ℚ(i) ⊂ ℚ(ζ₈)` | index `1` below, `2 = e·1` above; nonzero above iff nonzero below; `g⁻¹∘ψ = ψ^a`, `a` prime to `ℓ`; `𝕃₀ = 𝕃` is always a field of definition | `Tw₀` a union of fibres and stable under enlargement, as stated |
| 10.9, the form of the formal proof | `TopG`; `FamilyClassConnected`; `topDesWin` (10 hypotheses `hEx … hGL`); `HypsAlt` | ten statements: `DesignExists`, `LinkN`, `LinkEta`, `LinkIRR`, `SmallLevelRankEq`, `LinkDIVt`, `NuFullF ∧ MuRank`, `LinkG`, `LinkS`, `LinkGLOBAL`; `HypsAlt` has 46 fields (`𝒜` … `nRest`) | counts and order as the README lists them |
| 10.10 (`cyclicWindowedBound`), new locator | `zero_free_all_of_green_v_win` (`la := 3/2`); `shape_closed_link_n_of_green` calls `topDesWin … 2 3 2 0`; `ChebyshevInequalityOnWindows` | `eD = 2`, `eL = 0`: `1/2 + (2 + 0 + 7)ε = 1/2 + 9ε`; README `e_W = 9`; window exponent `3/2 > 1` | equal |

The rows for the untouched statements stand as in the previous review, of `bb48791`.

- Source locators checked against the text: the 21 declarations the changed lines newly name, in 16 files of [FormalProof]; all exist under the namespaces given and say what the README attributes to them.
- Cross-roadmap citations resolved at the open heads: RowTowerAndRallisIdentities §5.8 (thresholds and gap hypotheses, word for word the same numbers), GluedTargetAndDivisionInequality §§8.24, 8.24a, 8.24c, ThetaChainsOnDefiniteUnitaryGroups §2.3 (W1), §2.6, §2.6a (a)–(d), CongruenceModulesOfThetaLifts §7.8 (2), (3), BesselPoincareSeriesAndGramBounds §5.20a.
- `*Needs:*` lines, the Dependencies of Layer 10 and the supplier contracts each gained the sections the changed text cites (§2.6a, §5.8 in 10.6b, §§8.24a, 8.24c).
- Library declarations: none touched; `Suggested.lean` is unchanged since `c07a7dc`.
- Dependency check: `depcheck: 23 roadmaps, 106 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 111 and 122), nothing else; no `set_option`, single `import Mathlib`.
- Changes outside the folder: the family index only (its README: the paragraph on the published source, a new section, one entry reworded); nothing outside the family. The worker's automatic checks all passed.
- Description read against the head: adds a roadmap (README 1989 lines, 7 declarations: 2 theorems, 5 definitions) as it says; one change left unstated (C01).

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, FrobeniusRestrictedRieszSums; nothing shared (the change adds no object: it takes hypotheses and thresholds from RowTowerAndRallisIdentities §5.8 and GluedTargetAndDivisionInequality §§8.24a–8.24, their owners, by citation).

Source independence: changed passages only; 9 passages compared with 1 source ([FormalProof], Lean code without prose), none shared; largest share FormalProof, all located citations; contents not compared again (the change adds, removes or reorders no layer).

Research link: Layers 9–10 conclude the announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), assembling Bost's slope inequality (1996), the Chowla–Selberg period (1967), the mass formula of Gan–Hanke–Yu (2001), Harish-Chandra's formal degrees (1966) and Banaszczyk's transference (1993); README Summary and References, [Announcement] lines 9–13.

## Not verifiable

- The family index now says the cited files are to be looked up at the first commit of the public repository; the copy read here is of a later commit of the same repository, so the locators were checked there and not at the first commit.
- That the two thresholds whose maximum is `C_F` are the ones 10.6 names (the slope bound at the grids; grids with test data over the field of places): read from the statements of the two lemmas that produce them, not traced through their proofs.
- That each cited proposition of [FormalProof] is discharged for the chain: statements were compared; the proofs were not traced or built.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets (9.6, 10.4, 10.10, 10.11) rest only on [FormalProof], an unrefereed Lean formalization announced 20 November 2026; [Announcement] lines 9–13 and 72–76 say only Lean is presented. No refereed source states them.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 10–19) says the proof was published without a licence and is mirrored for verification only; the sources service does not classify the repository's host.
- Licence: `HasWindows`, the bundle `PrimitiveDirichletCharacter` and `rieszRemainder` of `Suggested.lean` have the shape of `Formalism.HC.HasWindows`, `Formalism.HC.PChar` and `Formalism.HC.An.gChi` of that repository (`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/`), with bodies rewritten.
- Policy: the family index gains a section "When a roadmap is wrong" (lines 45–75) that says what reviews of library contributions carrying out these roadmaps may and may not block on. Whether a roadmap index sets that rule is for the project to decide.
- Not tested: the formal proof was not compiled or kernel-checked in this review; agreement was checked statement by statement at the locators.
