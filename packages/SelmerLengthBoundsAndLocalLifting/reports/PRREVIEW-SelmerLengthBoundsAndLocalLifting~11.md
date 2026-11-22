# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at adae11f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 14 lines changed since `a640387`: the three small corrections of the previous review are repaired (the attribution of 4.9d (2), the supplier record for EulerSystemsAndKolyvaginSystems, the commit named in the description), the repairs introduce nothing false, and the title and description agree with this head. No finding and no small correction; three format notes of the previous review stand unrepaired, none blocking. The two questions for the human reviewers (the standing of the formal proof as main source, and its licence) are unchanged.

## N01 — `⌊log_p 2h⌋` is undefined at `h = 0` in 4.10e (1′) and in headline (4) of the Summary

4.9c (2) and 4.9d (2) say `h ≥ 1`; 4.10e (1′) (line 1604) and the Summary do not, and with all weights `0` the exponent contains `⌊log_p 0⌋` (the formal statement uses `Nat.log`, which is `0` there). Would add "`h ≥ 1`"; nothing is lost, since weights in `[0, 0]` lie in `[−1, 1]`.

## N02 — Thirty declarations of the formal proof are cited by name only

For example `GlobalTheory.T.wachModule_uniqueness_characterisation` in 4.10e (0) (line 1583) carries no file path, so a reader has to search for it; the other 74 carry the path.

## N03 — In the second Check of 4.9d, `μ_n` denotes an unramified character

In a section where `μ_{p^s}` and `μ_{lcm(p,N)}` are groups of roots of unity, `V = μ_n ⊕ ℚ_p(1 − k)` (line 973) reads at first as a root-of-unity module. Another letter would avoid it.

## Previous findings

The previous review, of `a640387`, had no finding (no R-numbered remark); its small corrections and format notes are accounted for here.

- C01 — repaired: the parenthesis of 4.9d (lines 927–930) now says the formal declaration "states (2) when `0` is a weight at no embedding of `K`, with the exponent `20(n + 1)λ_N`", and that the one-`τ` form is the roadmap's.
- C02 — repaired: `### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems` (line 1929) states §0.2 and §1.1; §0.2 is in the *Needs:* line of 3.25a (line 567) and in the Dependencies of Layer 3 (line 730).
- C03 — repaired: the description now names "the first commit of the public repository, `40e56bab026552e089d7afcfeff08d2defb9c005`", as the References entry of the README does.
- N01 — not repaired: written again above as N01.
- N02 — not repaired: written again above as N02.
- N03 — not repaired: written again above as N03.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.9d (2) and its new attribution | formal `InvariantsKilledOverCyclotomic` at `40e56bab`; `p = 5`, `N = 5`, `h = 1`, `U = {−1, 1}`; general bound | formal: `∀ τ, ¬IsJumpV … τ 0`, exponent `c0L = 20(n+1)·lamN`; `λ_N = 3`, `m = 3`, `c = 8 ≤ 180`; `c ≤ 2 + 3nλ_N` | holds; attribution exact | none |
| 3.25a route inputs now recorded from EulerSystemsAndKolyvaginSystems §0.2 | `A = ℤ/p²`, `B = A/p`; non-self-injective `k[x,y]/(x,y)²`, `B = k` | `Hom(B, A) = pA ≅ B`, bidual of order `p`; `Hom(k, R) = k²`, bidual `k⁴ ≠ k`: self-injectivity needed, and stated | holds | none |
| Supplier contract §1.1 (3.22 (1)) | `F = ℚ`, `p = 3`, `𝔭 = 13`; `𝔭 = 5` | `ℚ(13)` cubic in `ℚ(μ_13)^+`, totally ramified at 13; `Γ_5` trivial | agrees with the supplier's §1.1 | none |

The rows of the untouched statements stand as in the previous review, of `a640387`.

- Source locators: 1 opened, the formal proof's `Development/AutomorphicArithmetic/ResidueCharacters/InvariantsKilledOverCyclotomicAlt.lean` at its first commit (`lamN` line 13, `c0L` line 17, the statement lines 38–41); it agrees with the repaired sentence of 4.9d.
- Library declarations: none in the changed passages beyond `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker` and `Matrix.adjugate`, unchanged on the edited *Needs:* line and checked at the pins by the previous review.
- Cross-roadmap citations: EulerSystemsAndKolyvaginSystems §0.2 (line 107 of its README on main: lattice Tate dual, trace comparison, `R`-orthogonal conditions, exactness of `Hom_R(−, R)` and biduality for finite modules) and §1.1 (line 490: maximal `p`-extension in the ray class field, totally ramified above the prime over the Hilbert `p`-class field) read against the new contract; the 16 supplier roadmaps of the contracts are on main (14 active, 2 completed), WachLatticesOverTheCyclotomicTower is open.
- Dependency check: `depcheck: 133 roadmaps, 1483 edges, 0 problem(s)`; EulerSystemsAndKolyvaginSystems is at position 113 of the merge order, this roadmap at 444.
- Automatic checks: all passed on this head. `Suggested.lean` elaborates with no output and declares nothing (unchanged since `a640387`); no one-tactic probe applies.
- Changes outside the folder: none since `a640387`; against main, only the family index (three files), which is this pull request's own.
- Description, read against the head: adds a new roadmap (true, 2072 added lines, nothing removed); `Suggested.lean` declares nothing (true); every supplier on main except WachLatticesOverTheCyclotomicTower (true); §4.6, §1.5, §3.1 and §0.2 exist on main under the subjects named; the two declaration names and the exponent `40(N·r′ + η(N + r′))` are in 4.10e (0) and 4.10f; #2954 is open and carries the family. Nothing contradicted, nothing left unstated.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies (open), PhiGammaModulesAndIwasawaCohomology, EulerSystemsAndKolyvaginSystems, PadicHodgeTheory (main), as in the previous review; the change adds a citation of EulerSystemsAndKolyvaginSystems §§0.2, 1.1, which that roadmap owns; nothing shared.

Source independence: changed passages only; 4 passages compared with 2 texts (the formal proof file above, which contains no prose, and EulerSystemsAndKolyvaginSystems §§0.2, 1.1), none shared; largest share FormalProof, 85 of 96 source mentions; no layer added, removed or reordered, so the arrangement was not compared again (previous result: independent).

Research link: the two layers are the Selmer-theoretic and `p`-adic Hodge inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026), extending Bloch–Kato 1990, Wach 1996, Berger 2004, Herr 1998 and Bhatt–Scholze; README References and BS23-FCRYS line 65.

## Not verifiable

- Bloch–Kato 1990, Wach 1996, Berger 2004, Herr 1998 and the proofs marked "not given here": as in the previous review; the change does not touch them.
- Ownership against open pull requests was checked for the changed passages only.

Automatic checks set aside as false positives: a rerun of the checks without the worker's merge order reports this roadmap as not yet placed in the order, and reports the three family-index files as changes outside the folder; the first is the placement rule for a new roadmap, the second are files this pull request owns.

## Source issues

- none

## For the human reviewers

- Scope: 85 of the README's 96 source mentions are to [FormalProof], a Lean formalization with a four-page announcement and no written, refereed proof; the steps marked "not given here" rest on it alone (README lines 21–24, 1988–1989).
- Licence: the public repository of [FormalProof] states that the source was published without a licence; the README cites file paths and declaration names only, and `Suggested.lean` declares nothing.
