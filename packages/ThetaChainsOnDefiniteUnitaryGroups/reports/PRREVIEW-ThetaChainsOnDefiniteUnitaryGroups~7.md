# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #2918 at 7f27c46)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 6 lines changed since `10adbd0`, one sentence added to 2.2a (c) on the kernel of the row up-lift: I recomputed that the adjoint of the descent integrates against `θ_{S,T}(·; conj Φ)`, that this kernel carries the inverse of the character of the forms, and the value `c_v(det g)^{−2}` at a twist place of the first step; all three hold. The title and description agree with this head. Two format notes of the previous review stand, neither blocking; the scope and licence questions about the formal proof remain for the human reviewers.

## N01 — "The mathematics of this roadmap follows a complete formal proof" (Conventions, line 142; References, line 2480; `Suggested.lean` line 28) still reads as the statement the planning principles exclude. The arrangement is the roadmap's own, so "states what [FormalProof] establishes" would say what is meant.

## N02 — 2.3a still carries no locator, although its construction is `GlobalTheory.EX.HCVal` in `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean`, the file 2.2 cites for `HostVal`. Naming it would give the existence statement its reference.

## Previous findings

The previous review had no finding (R01, …); its two format notes are accounted for here.

- N01 — not repaired: the three sentences are unchanged; written again above.
- N02 — not repaired: 2.3a unchanged; written again above.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 2.2a (c), the up-lift is the adjoint of the descent (lines 495–496) | descent `Df(g) = ∫ f(h)·conj θ(g, h; conj Φ) dh`, Petersson products on both groups | adjoint integrates the form on `U(S)` against `θ_{S,T}(·; conj Φ)` | `⟨Df, φ⟩ = ∫ f(h)·conj(∫ φ(g)θ(g, h; conj Φ) dg) dh = ⟨f, Lφ⟩`, `Lφ(h) = ∫ φ(g)θ(g, h; conj Φ) dg` | holds | — |
| 2.2a (c), invariance of the integrand (lines 496–497) | `k` in the level group, forms with `φ(gk) = χ(k)φ(g)`, `ω̄(k, 1)Φ = χ(k)Φ` (2.9 Check) | character of the kernel is the inverse of that of the forms | `ω(k, 1)conj Φ = conj(ω̄(k, 1)Φ) = χ(k)^{−1}conj Φ`; product with `χ(k)` is `1` | holds | — |
| 2.2a (c), the value at a twist place of the first step (lines 497–498) | `n_0 = r`, `g ∈ GL_r(ℤ_p)`, `x` of size `n_1 × r`, law of 2.2a (a) with `c_T = c_v` | `ω(g, 1)Φ^Q = c_v(det g)^{−2}Φ^Q` | `c_v(det g)^{−1}·Φ^Q(xg)`, `(xg)_{rr} = x_{rr}g`, so `c_v(det g)^{−1}·c_v(det g)^{−1}Φ^Q`; support conditions stable under `g` | holds | — |
| the same, "it is not" invariant | level of stage `0` trivial (type `(r, 0)`, 2.9c); place above the auxiliary prime, `c_v` of order `o_δ` | integrand with `Φ` not invariant | factor `c_v(det g)^{−2}`; `o_δ` neither a prime power nor twice one (2.4 (b)), so `c_v² ≠ 1`; every nontrivial tuple has such a place | holds | — |
| 2.9 Check, cited by the new sentence | conjugate datum, `Φ^Q`, `g ∈ GL_r(ℤ_p)` at stage `0` | `ω̄(g, 1)Φ^Q = c(det of the lower block)Φ^Q`, here `1` | `c(det g)·c(det x_{rr}g)^{−1} = c(det x_{rr})^{−1}`: trivial character, as the empty lower block gives | consistent with the new sentence | — |

The rows for the untouched statements stand as in the previous review, of `10adbd0`.

- Source locators: the change adds none; none to check.
- Library declarations opened: none (the change touches no library claim).
- Cross-roadmap citations: the change adds none; the sections it names or rests on (2.2a (a), (b); 2.9 Check; 2.9c; 2.5; 2.4 (b)) exist and say what it uses. The two other mentions of the row up-lift and its vectors (Conventions line 73, Layer 3 introduction line 1504) agree with it.
- Seeded sample: of its targets 2.9c and 2.5 are touched (cited by the new sentence); checked in the table. The others stand as in the previous review.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 136 roadmaps, 1522 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no messages; the file is unchanged and declares nothing, so there is no `#check` comparison and no one-tactic probe.
- Outside the folder only the family index changed (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`): the commit `40e56bab` it names is the first commit of the proof's repository ("Mirror the submission exactly as published"), and the repository's own licence section says what the index reports of it.
- The pull request's text: title and description read against the head; nothing contradicted, nothing unstated (the change adds a sentence of convention; no section, declaration or supplier changes).

Overlap check: read RowTowerAndRallisIdentities, CongruenceModulesOfThetaLifts (open; none close on main) as in the previous review; the change adds no object and moves no ownership (it fixes a convention of 2.2a (c), which this roadmap owns); nothing shared.

Source independence: changed passages only; 1 passage (the sentence added to 2.2a (c)) compared with 1 source ([FormalProof], Lean code without prose), none shared; largest share [FormalProof], every file locator (unchanged by this change); the diff adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 2–3 build the chain of theta lifts between totally definite unitary groups on which Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026) rests ([Announcement] lines 158–169), with the theta correspondence (Kashiwara–Vergne 1978; Howe 1989) and Gross's algebraic modular forms (1999) as inputs; README References and [Announcement].

## Not verifiable

- That the formal proof's row up-lift takes the vector `conj Φ` was not traced in [FormalProof]: the new sentence gives no locator, and it was checked as mathematics (the adjoint and the characters) only.
- The items of the earlier reviews' lists (the exponents of 2.9c beyond the first step; 3.1d and 3.3 outside `d ≡ 7 (mod 16)`; the uncertified and credit sources) are untouched by the change and stand as there.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof] (README References), an unrefereed Lean formalisation by one author announced 2026-11-20 with no paper; [Announcement] lines 45–49 say a write-up is to follow. The family's end theorem is the Riemann hypothesis for Dirichlet L-functions.
- Scope: 3.1d and 3.3 are stated for every prime `d ≡ 7 (mod 8)`; outside `d ≡ 7 (mod 16)` the README says they rest on steps with no proof, here or in any source; the description says so as well.
- Licence: [FormalProof] was published without a licence; its repository says so, and the family index now reports it. `Suggested.lean` declares nothing, so no declaration is taken from it.
