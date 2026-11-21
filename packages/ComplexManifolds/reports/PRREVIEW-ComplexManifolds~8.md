# Review of ComplexManifolds (pull request #2549 at 3b21fc4)

**Verdict:** accepted

**Summary.** Accepted. The eight changed lines remove the dependency of §§7.4–7.5 on Milestone 2 from the build guide, from the `*Needs:*` line of §7.4 and from the Dependencies of Milestone 7; this repairs the one small correction of the previous review, and nothing in Milestone 7 uses an orientation, so no stated result or supplier edge is lost. The pull request's description was read against this head and against the README on main and no sentence of it is contradicted. There are no small corrections and no format notes; one question for the author is carried over, and the human reviewers should know that seven of the eight cited textbooks could not be read here.

## Questions for the author

- Carried from the previous reviews, the text being the same: the contract for SmoothBundlesConnections §B2.1 (lines 1088–1091 of `TauCetiRoadmap/ComplexManifolds/README.md`) assumes its tensor and exterior-power carriers are "generic over the field", while §B2.1 on main speaks of smooth finite-rank bundles and treats complex bundles over a real base. Is the form over a complex base, which §7.2 needs, agreed with that roadmap? Its text does not settle it either way.

## Previous findings

- The previous report (of `704d32c`) raised no finding (no R-numbered remark). Its one small correction, C01 (the `*Needs:*` line of §7.4 listed Milestone 2 "for the orientation convention of §7.5", which §7.5 does not contain), is repaired: the line now reads "*Needs:* §§7.1–7.3; Tau Ceti `TauCeti.SmoothEmbedding`, …", the build guide reads "§§7.4–7.5 use the preceding bundle sections", and the Dependencies of Milestone 7 name "Milestone 4 where stated". The repair introduced no new problem: no sentence of Milestone 7 (lines 770–953) mentions an orientation or Milestone 2, and items 7.4 and 7.5 of the README on main state none either; only main's dependency-order sentence named the edge, and the description states its removal with the reason.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
|---|---|---|---|---|
| §7.4 normal bundle of a hypersurface, without Milestone 2 | line `{x₂ = 0}` in `ℙ²`; inverse cocycle; `ℂ × ℝ ⊂ ℂ²` | cocycle `u₀/u₁ = x₁/x₀ = t`, holomorphic; sections `a + bt`: dimension 2, `O(1)` / `1/t` forces `s₀ = 0`: `O(−1)` / `i·(0,1) ∉ ℂ×ℝ` | holds; every step complex-linear, real Jacobian of `t` is `|t|² > 0` automatically, no orientation enters | none |
| §7.5 cotangent and canonical bundles, without Milestone 2 (sampled) | `w = 1/z` on `OnePoint ℂ` | `dw = −z⁻² dz`, `∂/∂w = −z² ∂/∂z`, product `(−z⁻²)(−z²) = 1`; `∂/∂z = −w² ∂/∂w`, double zero at `∞` | holds; `*Needs:*` is §7.2 and two Mathlib bundles, no orientation | none |
| Build guide: "§§7.4–7.5 use the preceding bundle sections" | the six `*Needs:*` lines of Milestone 7 | §7.4: §§7.1–7.3; §7.5: §7.2; §7.6: §§7.2–7.3 and §§4.1–4.3; none names Milestone 2 / Dependencies: Milestone 4 only | guide, `*Needs:*` lines and Dependencies agree | none |

The rows for the untouched statements stand as in the previous review, of `704d32c`.

- Source locators checked against the text: 3, all in demailly-agbook and all in the changed or dependent passages (Chapter V (13.5) at lines 13367–13372, printed p. 271, the cocycle `u_α/u_β` of a divisor; Chapter VII (3.4) at line 16473, p. 334, the canonical bundle as the top exterior power of the cotangent bundle; Proposition (12.4) a) and its proof at lines 17495–17503, p. 357, the differential of the canonical section identifying the normal bundle). Each supports the sentence that cites it.
- Library declarations: the change touches none. The `*Needs:*` line of §7.4 keeps `TauCeti.SmoothEmbedding`, `TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle` and `Manifold.IsSmoothEmbedding`, resolved at the pins in the previous review.
- Cross-roadmap citations: the change touches none; the overlap leads list no dropped or revision-only id, and no other open pull request changes this roadmap.
- The record: the head has every milestone of the README at the merge base under its id (7 of 7, none retitled); the change removes no item. Counted at this head: 35 items, each with one `*Needs:*` line; *In Tau Ceti:* lines on all but §§6.5, 7.2, 7.4, 7.6; 30 Checks.
- Dependency check: `depcheck: 172 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. `Suggested.lean` (`import Mathlib`, a module docstring, an empty namespace) elaborates with no output and exit code 0; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe. Nothing changed outside the folder.
- The description against the head: the build-guide sentence on the dropped Milestone 2 edge ("no *Needs:* line of Milestone 7 names Milestone 2") is true at this head; the 30 Checks, the four sections without an *In Tau Ceti:* line, the two entries of "From Tau Ceti", the five downstream consumers, the Mathlib contracts it names (`t2Space_iff_of_isOpenQuotientMap`, the maximum principle for §7.6, `IsLocalHomeomorph.chartedSpaceOfRightInverse` with `Quotient.out` in §4.1), the `+1` sign of §2.3, "by definition" in §1.4, and the thirteen removed Lean declarations with the two `example`s all agree with the head and with the diff against main. It says that the pull request revises a roadmap on main, which headings were replaced by what, and that no supplier is added beyond those listed.

Overlap check: read ComplexTori, ComplexKahlerGeometry, SmoothBundlesConnections; nothing shared. The change adds no object; ownership stands as in the previous review (torus quotients with ComplexTori, arbitrary-codimension normal bundles with ComplexKahlerGeometry, tensor and exterior-power carriers with SmoothBundlesConnections §B2.1, the orientation carrier with DifferentialGeometry Layer 2). Ownership against the other open pull requests was not checked again in this round.

Source independence: changed passages only; 3 passages compared with 1 source (the three changed sentences, and the §§7.4–7.5 prose they govern, against demailly-agbook at the three locators above), none shared; largest share demailly-agbook, 4 of 15 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again (previous result: independent). The seven other texts could not be read.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Milestones 1–7; the divisor, normal and canonical bundles of Milestone 7 are the objects Demailly 2012 (Ch. V §13, Ch. VII §§3, 12) uses for vanishing theorems and blow-ups. Rests on the README and demailly-agbook.

## Not verifiable

- The chapter-level locators of Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Bourbaki and Steenrod (11 of the 15 in-text locators): commercially published books, not in the roadmap's source manifest or the sources cache. None lies in a changed passage.
- The declaration names the reference list attributes to mathlib4#42847: that pull request is not among the recorded sources.
- Whether SmoothBundlesConnections §B2.1 intends its tensor and exterior-power carriers over a complex base (the question above).

## Source issues

- none

## For the human reviewers

- Not tested: seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) carry 11 of the README's 15 in-text locators and are not legally readable here; wording and arrangement were compared only with demailly-agbook (4 locators) and mathlib4-pr-40727.
