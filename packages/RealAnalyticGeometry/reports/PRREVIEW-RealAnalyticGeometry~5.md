# Review of RealAnalyticGeometry (pull request #2634 at 0ba0889)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 48 lines changed since `d0c01bf` found no finding. The semi-positive form of the weighted `∂̄` theorem agrees with Demailly's Theorem 4.5, the new derivation in §5.3 is supported by Łojasiewicz's remark on property (A) and by the three Tau Ceti declarations it names, the count of the steps of Łojasiewicz's §4 is now five, and the description of the pull request agrees with this head. One small correction (two citations of Grauert 1958 still without theorem number or page) and one format note remain, neither blocking; nothing is left for a human to decide.

## C01 — The p-function and the Stein criterion still cite Grauert 1958 without a theorem number or page

§4.2, its docstring and the References now give Theorem 3, p. 470 for the embedding theorem. The two other uses of the paper do not: "Prove Grauert's construction (Grauert, 1958)" for the p-function in §3.0 (line 1083), and "Grauert 1958, the Levi problem" in the docstring of `isStein_of_strictlyPlurisubharmonic_exhaustion` (`Suggested.lean`, line 271). The paper is cited by its locator alone, so for these two statements a reader still has only the page range 460–472. Add the section or theorem number and the page for each.

## N01 — The second Check of §2.1 counts the cells of one triangulation as if of all

"`B_1` is the image of two open edges and one vertex" (lines 914–916) holds for the triangulation with vertices `0`, `1/2`, `1`; a finer compatible one has more. "In the triangulation with vertices `0`, `1/2`, `1`" would say which is meant.

## Previous findings

The previous review, of `d0c01bf`, had no finding; its four small corrections and one format note are accounted for here.

- C01 — partly repaired: §4.2 reads "(Grauert, 1958, Theorem 3, p. 470)", as do its docstring and the References; §3.0 line 1083 and the Stein-criterion docstring are unchanged. Carried as C01 above.
- C02 — repaired: §5.3 derives semianalyticity from property (A) "(Łojasiewicz, §3, printed p. 463)" and its *Needs:* line names the cylinder, intersection and projection declarations of Tau Ceti.
- C03 — repaired: "the five steps of his §4, step V (the triangulation, printed p. 473) in §2.0h" (line 418) and "the five steps of his §4" (line 1662).
- C04 — repaired: "If `B` is positive semi-definite at every point", with `⟨B⁻¹f, f⟩` as the least `α ≥ 0` with `|⟨f, v⟩|² ≤ α⟨Bv, v⟩`, `+∞` when there is none (lines 1138–1142); the overview agrees (line 30).
- N01 — not repaired: lines 914–916 unchanged; carried as N01 above.

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| 3.1 weighted theorem, semi-positive `B` | `B = 0`, `f ≠ 0`; `B = 0`, `f = 0`; `B ≥ ε Id` | no `α`, so `+∞` and the hypothesis fails; `α = 0`, `u = 0`; `α ≤ ‖f‖²/ε` by Cauchy–Schwarz, matching the uniform variant | DemaillyAgbook lines 18115–18131 (p. 371): `A ≥ 0`, minimal `α`, equal to `⟨A⁻¹g, g⟩` when invertible, `g ∈ L²`, (4.4) | sound |
| 5.3 pieces `τ(σ)` semianalytic | graph of `τ` over `σ` in the chart at `y` | graph set of `HasManifoldPropertyA` ∩ `Prod.snd ⁻¹' σ`; its `Prod.fst` image is the chart image of `τ(σ)` ∩ chart source | `partiallySemialgebraicAt_preimage_snd` (PartiallySemialgebraic.lean:615), `PartiallySemialgebraicAt.inter` (:535), `semianalyticAt_image_fst` (Projection.lean:143, `[Finite κ]`); Lojasiewicz1964 lines 486–489 | sound |
| Opening of Layer 2, steps of §4 | steps I–V | five; step V in §2.0h | Lojasiewicz1964 line 820, printed p. 473: step V applies Lemma 15 | sound |
| 4.2 Grauert (Lean, docstring only) | `n = 0` | statement unchanged; locator added | Grauert 1958 not readable | sound; see Not verifiable |
| Stein criterion (Lean, untouched; C01) | — | docstring line 271 has no theorem number | Grauert 1958 not readable | C01 |

The rows for the untouched statements stand as in the previous review, of `d0c01bf`.

- Source locators checked against the text: 3 (Demailly VIII, Theorem 4.5 and the convention before it, p. 371; Łojasiewicz §3, p. 463; §4, step V, p. 473).
- Library declarations opened at the pin: 5 (`PartiallySemialgebraicAt`, PartiallySemialgebraic.lean:447; the three named in §5.3; `IsPartiallySemialgebraic.isSemianalytic_image_fst`, Projection.lean:155).
- Cross-roadmap citations: none added or changed by the diff.
- Dependency check: `depcheck: 191 roadmaps, 2120 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head; nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error; the diff changes one docstring and no statement, so signatures and the one-tactic probe stand as before.
- Description read against the head: 30 Checks counted, eight Tau Ceti imports, six layers, the seven supplier roadmaps, the 17 removed declarations all named, the anchor change and both linking roadmaps stated, the four repairs of this head (semi-positive `B`, Grauert Theorem 3, five steps, §5.3) described as the head has them. No sentence contradicted.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry and RealAlgebraicGeometry on main and StratifiedSpacesAndTameTopology, ComplexComparisonPartII and Hyperfunctions at their open heads, as in the previous review; the diff adds no object. Finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, cited here. Semianalytic decomposition, Łojasiewicz's theorems, complexification, the Stein predicate and Cartan A/B: this roadmap. Holomorphic structure sheaf: ComplexKahlerGeometry §4.1. The two dropped anchors are mapped in the description; the one in ComplexComparisonPartII is D01.

Source independence: changed passages only; 3 passages compared with 2 sources (DemaillyAgbook, Lojasiewicz1964), none shared beyond the forced inequality; largest share Lojasiewicz1964, as in the previous review; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Theorems 1–4 are Łojasiewicz's 1964 simultaneous triangulation of locally finite semianalytic families, answering the question of Lefschetz, Koopman–Brown and Lefschetz–Whitehead (1930–33); Layers 3–4 give Cartan's theorems and Grauert's 1958 embedding, which the manifold theorem uses. Rests on Lojasiewicz1964 lines 25–42 and the README's consumers section.

## Not verifiable

- Grauert1958 (*Annals* 68): uncertified, not readable; the new locator "Theorem 3, p. 470" of §4.2 could not be checked against the text, nor the p-function and Stein-criterion attributions.
- Hormander1965 and Hormander1990: uncertified; untouched by the diff.

## Source issues

- none

## For the human reviewers

- none
