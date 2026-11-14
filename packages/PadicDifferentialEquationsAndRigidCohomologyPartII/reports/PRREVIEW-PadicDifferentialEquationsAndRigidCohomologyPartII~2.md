# Review of PadicDifferentialEquationsAndRigidCohomologyPartII (pull request #2300 at 807aec5)

**Verdict:** needs changes

## R01 (P2) — The declared Legendre supplier contract still lacks the repaired hypotheses

**Location** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/design/plan.json` line 3996, `legendre-kummer-extension.needs`: “for `p ≡ 1 mod 4`, `C = P¹_(𝔽_p) ∖ {0, 1, ∞}`”.

**Claim** Previous R01 is only partly repaired: README lines 356 and 1327 fix the coefficient field and Frobenius, but the intake's `needs` still omits them and requests the incorrect eigenvalue for higher-power Frobenius.

**Witness** For `K = ℚ_5`, `σ = id`, `q = 25`, the eigenvalues are `π_5⁴`, `625/π_5⁴`; the `π_5²`-eigenspace has dimension 0, not 1. TSU lines 1113–1114 specify the `p`-Frobenius.

**Repair** In that `needs`, insert “`K = ℚ_p`, `σ = id`, `q = p`,” after “for `p ≡ 1 mod 4`,”, matching README line 356. With `q = p`, the eigenspace has dimension 1 (TSU lines 1138–1146).

## Previous findings

- R01 — partly repaired: README lines 356 and 1327 now specify `K = ℚ_p`, `σ = id`, `q = p`; `design/plan.json` line 3996 still has the original unrestricted contract.
- R02 — repaired: the description now says that `Suggested.lean` has no declarations, the build has no warnings, and the README declares nine supplier contracts.
- R03 — repaired: README lines 971–972, 1337–1338, 2237–2239 and 2833–2834 use grammatical supplier references and intact parenthesised slugs.
- R04 — repaired: README lines 2852–2858 explicitly assign AE page locators to the author's PDF and KED05 locators to arXiv v3.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Repaired Legendre contract, README 356 | `p = q = 5`, `i² = −1`, `i ≡ 2 mod 5`, `π = −1 + 2i` | `π² = −3 − 4i`; `25/π² = −3 + 4i`; valuations `(0,2)`; eigenspace dimension `1 = 1` | Matches TSU lines 1138–1146 | README repair holds |
| Declared contract, plan 3996 | Same curve, `q = 25`, second iterate of Frobenius | Eigenvalues `−7 ± 24i`; `π² = −3 − 4i`; its eigenspace dimension `0 ≠ 1` | Counterexample remains in plan | R01 |
| MS.2.8 PBQ filtration and dependent examples | `p = q = 5`; nonsplit extension from the preceding eigenspace | Grade ranks `2 + 1 = 3`; maximal slopes `1 > 0`; two PBQ grades, as asserted | TSU lines 1142–1146; MS.4.5 rank-two case excluded | None |
| MS.1.6 logarithmic growth formula | `f = 1 + log t`; `λ = −1, 0, 1` | Membership on both sides is `(false, false, true)`; exact growth `1 = 1` | OHK lines 673–678 | None |

Untouched statement rows stand as in the previous review of `cb67927`.

- Sources: 10 locator groups reopened across TSU, OHK, AE, KED05, DAD and KED04; PBQ at TSU lines 864–866 and Lefschetz condition at TSU lines 1456–1463 agree with their uses; corrected pagination agrees with the cached versions.
- Pinned declarations reopened: Mathlib `RingTheory/WittVector/Isocrystal.lean:112`, `NumberTheory/Padics/PadicNumbers.lean:881`; Tau Ceti `RingTheory/PowerSeries/Bounded.lean:62`, `RingTheory/PowerSeries/OpenDisc/Basic.lean:294`. The latter two supply subrings, without Frobenius structure.
- Citations: 75 parent target identifiers resolve; affected §§RD.2.28, RD.5.103 and RD.6.47 read; all 69 internal target references resolve. Nine gap slugs match the plan; eight `needs` sentences match, with R01 the exception.
- Lean: 0 declarations; binder-signature and one-tactic probes have no instances. Direct elaboration exits 0 with no warnings; targeted build succeeds.
- Gate: all checks 0, `OK`; outside-folder diff empty; worktree clean. Dependency output: `depcheck: 241 roadmaps, 2192 edges, 0 problem(s)`; no UPWARD or CYCLE.
- PR text: title, summary and prose checked against the added folder and this repair; no removed headings, declarations or suppliers omitted from the description.

Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory and AdicSpacesPartIV; the parent owns the coefficient and Kummer theory, AdicSpacesPartIV owns weak completions, this Part II owns PBQ reconstruction consumed by KloostermanSheavesAndBesselIsocrystals. No competing owner of the changed Legendre extension was found.

Source independence: changed passages only; 7 passages compared with 6 sources, no copied expression or reused material found. Largest share remains TSU, 81 of 127 locator groups as counted at `cb67927`; no layer added, removed or reordered, so the previous independent-arrangement check stands.

## Not verifiable

- MS.2.8's K3 zeta-function input: read through TSU lines 1128–1141; the primary K3 sources remain unread, as in the previous review.
- DEJONG98 Proposition 6.4 and TSU98 Theorems 4.2.6 and 7.2.3 remain settled as uncertified; no new source request.

## Source issues

- **Misprint** in TSU at §3.9, p. 21: the source says the support-forgetting map has ordinary rigid cohomology as both domain and codomain; it should be compactly supported cohomology in the domain; affects nothing.
- **Misprint** in OHK at Definition 2.9, p. 13: the source says membership of the real index in the filtered ring defines the growth of an element; it should be membership of that element; affects nothing.
- **Gap** in DAD at the proof of Lemma 4.2.7, p. 15: the source says injectivity for residue field `k(t)` follows from Kedlaya's Proposition 4.1; it should be justified separately from that proposition's complete-residue-field setting; affects the proof.

## For the human reviewers

- **Scope.** TSU is cited as arXiv:1910.03871v3; DAD line 561 cites it as [Tsu23], indicating a published version whose numbering was not compared with v3.
- **Licence.** AE was read from an author-hosted PDF; README lines 2852–2854 now explicitly identify its pagination, rather than the journal's.
- **Scope.** README's “Corrections to the sources”, lines 2757–2840, lists 35 corrections; the previous review checked 11. The remaining corrections, including the two concerning DAD Proposition 4.2.12, are outside this incremental check.
