# Review of AutomorphicFormsOnReductiveGroups (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 82 lines changed since `e7914b5` found no finding. The change is the merge of `main`, which brings 40 `*Needs:*` lines and a section-level `*Needs:*` line in §2.2, plus the reworded sentence on §6.8a in Layer 6's Dependencies; every roadmap section those lines cite exists where cited and says what it is cited for, and the reworded sentence now agrees with §6.8a. One small correction (§6.8a's citation has no theorem or page) and one format note (the letter `E` in §7.5a) are carried from the previous review, neither blocking. One point is left to the human reviewers: §6.8a's two sources could not be read.

## C01 — §6.8a's citation gives no theorem or page

The route of §6.8a (line 1160) ends with "Harish-Chandra, *Representations of semisimple Lie groups IV–VI*; Knapp, *Representation theory of semisimple groups*, Ch. VI", that is, three papers of about 140 pages and a whole chapter. An implementer cannot find the statement that supports the three assertions or the square-integrability of the holomorphic model, and every other result of Layer 6 has a theorem or section with its pages. Neither text has an open legal copy, so this review cannot supply the locators: please give the theorem number and page in Knapp's Chapter VI, and the paper of the series (with the theorem) that has the realization on the bounded domain.

## N01 — The letter `E` changes meaning within §7.5a

In §7.5a's first paragraph (line 1325) `E` is "a field of characteristic zero with an involution `c`" and `M` is "the level coefficient module `M` of §7.4"; in §7.4 and in §7.5a's second paragraph `E` is a finite extension of `ℚ_ℓ` and §7.4's `M` is a module over an `O_E`-algebra. Another letter for the field with involution, and a reference to §7.4's abstract carrier (any right `J`-module), would remove the clash.

## Deferred findings

- D01 — resolved: the other pull request, #3036, is merged and this head contains it; no open pull request changes this roadmap now.

## Previous findings

The previous report had no finding (R); its small corrections and format note are accounted for here.

- C01 (previous) — repaired: the description now adds "in AutomorphicFormsOnReductiveGroups §7.5a for every group meeting its §7.4 hypotheses, with the proof in the section".
- C02 (previous) — not repaired: line 1160 still cites "Harish-Chandra, … IV–VI; Knapp, … Ch. VI" with no theorem or page; written again as C01.
- C03 (previous) — repaired: Layer 6's Dependencies now read "The route of §6.8a passes through Harish-Chandra's decomposition of LieGroups Layer 7's complexification and the bounded realization of `G/K`".
- C04 (previous) — not repaired: deferred (D01); D01 is resolved, see above.
- N01 (previous) — not repaired: §7.5a line 1325 still has `E` "a field of characteristic zero with an involution `c`"; written again as N01.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Layer 6 Dependencies, sentence on §6.8a (changed) | §6.8a line 1160; LieGroups Layer 7 | §6.8a: "The route has two steps. First, Harish-Chandra's decomposition of the complexification of `G` (LieGroups Layer 7)…"; Layer 7 is "complexification and real forms" | agrees; no construction claimed |
| §2.2 `*Needs:*` (changed) | LieHighestWeight §§9.2, 7.1, 7.2 | §9.2's title is "Reductive enveloping centers and the actual invariant maps", as quoted; raw/dot map and `HC_lin(z)(λ)=HC_dot(z)(λ−ρ)` are in §7.1; §7.2 exists | resolves |
| §0.1a `*Needs:*` and its sign Check (sample) | `G∞=ℝ`, `f(g)=g` | `R(a)f=g∫a+∫ya`, so `R(X)R(a)f=∫a`; `R(−a′)f=−∫a′(y)(g+y)dy=∫a`; `R(a′)f=−∫a`. ALS.F.1, LieGroups Layer 0, AdelicAlgebraicGroups §1.5 (unimodularity) exist | holds |
| §0.7 `*Needs:*` and `cosetSystem_volume` (sample) | `S₃`, `U={1,(01)}`, `g=(12)`, counting measure | `U∩gUg⁻¹=1`, so `#UgU=4`; two cosets `rU`; `4=2·2`. `g=1`: `2=1·2` | holds |
| §4.3 `*Needs:*` | AnalyticNumberTheoryPartII §§5.3g, 5.3h | §5.3h: every nontrivial continuous character of `𝔸_F/F` is `x↦ψ(ax)` for exactly one `a∈F^×`; §5.3g defines the standard character | says what it is cited for |
| §3.5 `*Needs:*` (sample) | ReductiveGroupsPartII RG2.3.1; SR.0.4, SR.1.3, SR.4.1; AdelicAlgebraicGroups §§1.1, 3.1 | RG2.3.1 has the item on reductive models and hyperspecial subgroups (`IsHyperspecialSubgroup`), also on `main`; SR.4.1 is the Satake transform | resolves |
| §2.5 and §4.3 `*Needs:*`, GlobalNumberFields | Completed/GlobalNumberFields | Layer 5 "full adeles and the additive quotient"; Layer 10 "archimedean characters, infinity types…" | resolves |
| Headline `compactFinite_dense_locallyConvex` (unchanged; §2.1 gained a `*Needs:*`) | trivial `K`; elaborated type | Trivial `K`: every orbit spans dimension ≤ 1, the set is all of `E`, dense. Type keeps compactness, completeness, local convexity, joint continuity | holds |

The rows for untouched statements stand as in the previous review, of `e7914b5`.

- Cross-roadmap citations of the 41 added or changed `*Needs:*` lines resolved by opening the supplier's heading: AdelicAlgebraicGroups §§0.2, 0.3, 1.1–1.5, 2.1–2.3, 3.1, 3.4, 3.5, 4.1–4.3, 5.2; ArithmeticLocallySymmetricSpaces ALS.F.1, F.5, F.6, F.7, 0.1–0.3, 1.1, 1.2, 1.7, 3.3, 5b.5, 5b.6, Layers ALS.1, ALS.3; SmoothRepresentationsOfLocalGroups SR.0.4, 1.1, 1.3, 4.1; ReductiveGroupsPartII RG2.3.1; ReductiveGroups Layers 5, 7; EtaleCohomologyFoundations F.4.0; AnalyticNumberTheoryPartII §§5.3g, 5.3h; ModularForms §§4.1, 5.1; GlobalNumberFields Layers 5, 10; LieHighestWeight §§3.1, 7.1, 7.2, 9.2; CompactGroups §§0.1, 0.2, 2.2, 3.2, 5.4, 5.5, 6.1, 6.4, Layer 5; LieGroups Layers 0, 1, 2, 6, 7, 9. All found; every one is a roadmap on `main`.
- Seeded sample: of the 15 targets, 0.1a, 0.7, 2.2, 2.3, 2.6, 3.2, 3.5, 5.1, 5.2 and 7.4 gained or changed only a `*Needs:*` line, checked as above; their statements and source locators are untouched text. No source locator is added or changed by the diff; none is flagged unverified.
- Record check: the folder differs from `main` by the same 47 insertions and 5 deletions as before plus the reworded Dependencies sentence; 8 layers, none removed or retitled; no Lean declaration changed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` gives the single `sorry` warning; the elaborated type of the one theorem is unchanged and has lost no binder.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- No file outside the roadmap folders is changed against `main`.
- Overlap check: read AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors (main), AutomorphicSpectralTheoryPartII (open); nothing shared beyond what the previous review recorded (lowest-weight theorem and class-set pairing owned here; bounded realization a route step, ShimuraVarieties P.2 for a Shimura datum). No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; the diff adds supplier lines and one sentence of the roadmap's own bookkeeping, no passage with a source locator, so 0 passages compared with 0 sources; shares and contents as in the previous review (no layer added, removed or reordered).
- Research link: §7.5a is the duality behind Thorne (2012), Lemma 6.4, the freeness of algebraic modular forms over a diamond group ring used in Taylor–Wiles patching on definite unitary groups; §6.8a is Harish-Chandra's (1955–56) holomorphic discrete series, feeding Layer 6's coherent cohomology (Harris; Boxer–Pilloni). Rests on the README and Thorne's text.

## Not verifiable

- Knapp, *Representation theory of semisimple groups* (1986), Ch. VI: no legal copy (the publisher's page is closed), as found by the previous review; not searched again.
- Harish-Chandra, *Representations of semisimple Lie groups IV–VI*, Amer. J. Math. 77–78 (1955–56): no legal copy, as found by the previous review.

## Source issues

- none

## For the human reviewers

- Not tested: §6.8a's only sources, Knapp 1986 Ch. VI and Harish-Chandra IV–VI (`TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` lines 1160, 1464, 1485), have no legal open copy; its wording and locators were not compared with them.
- No decision of the human reviewers recorded for this pull request bears on this folder; none was applied.
