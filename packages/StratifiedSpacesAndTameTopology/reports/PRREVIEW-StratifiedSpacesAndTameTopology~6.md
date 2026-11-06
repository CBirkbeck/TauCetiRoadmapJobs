# Review of StratifiedSpacesAndTameTopology (pull request #1519 at e46c8e4)

**Verdict:** needs changes

Incremental re-review of the 13 changed lines since 012087a (8 insertions, 5 deletions, all in `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md`: the Scope paragraph at lines 59–62 and the Downstream consumers paragraph at lines 1166–1169; `Suggested.lean` and `metadata.toml` are byte-identical to 012087a by `git diff --stat 012087a..HEAD`). The branch merged main (commit 86084f70), so the worktree's pins moved to Mathlib 1b1ccf4b and Tau Ceti 2fd255d9; `git diff --stat origin/main...HEAD` outside the folder is empty. Gate at this head (worker's run, data): every counter 0, `OK`; my own text-gate run differs only by `depcheck: NOT IN ORDER` against the public order file, which is not a defect at this stage. Depcheck with the candidate merge order: `depcheck: 240 roadmaps, 2352 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean` on `TauCetiRoadmap/StratifiedSpacesAndTameTopology/Suggested.lean` from the worktree: 7 `sorry` warnings (lines 175, 184, 210, 302, 321, 340, 348), no error, exit 0, at the new pins.

One finding: the diff reverses the direction of supply between this roadmap and AlgebraicTopologyPartII 16.2 that the fourth review settled.

## R01 (P3) — AlgebraicTopologyPartII 16.2 is earlier in the merge order and consumes nothing here

Location: `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md` 61–62, "its equivariant form is a downstream consumer", and 1166–1169, "AlgebraicTopologyPartII 16.2 states an equivariant first isotopy lemma … it consumes the controlled lifts of 5.4 and the isotopy lemma of 5.5".

Claim: the README lists AlgebraicTopologyPartII 16.2 under Downstream consumers and says it consumes 5.4 and 5.5.

Witness: the merge order lists AlgebraicTopologyPartII at line 219 and this roadmap at line 383; a consumer is later than its supplier, so 16.2 cannot consume Layer 5. At its open head (#1694), `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` 1487–1496 takes the invariant control data as given, cites Mather Proposition 11.1 directly "for the nonequivariant isotopy lemma", builds its own "controlled horizontal lifts of radial base fields" in its route, and has `*Needs:* §16.1` only; "StratifiedSpaces" occurs nowhere in that README or its `Suggested.lean`. The fourth review (its R02) ruled exactly this, and the text at 012087a recorded it ("a sibling that consumes no part of Layer 5, and 5.5 is not a duplicate of it"); the diff deletes that and asserts the opposite. The rest of the two new passages is correct: the embedded form is Mather Proposition 11.1 as described (mather2012 lines 1167–1169), the controlled vector fields and lifts are Mather §9 and Proposition 9.1 (lines 887–905), and the trivial-action case of 16.2 is the embedded statement with control data given, with the averaging step at #1694 line 1489.

Repair, tested against #1694 lines 1487–1496 and the merge order. Scope, lines 59–62: keep "Thom's first isotopy lemma, with its embedded form … are owned here (5.4–5.5)" and replace "its equivariant form is a downstream consumer" by "AlgebraicTopologyPartII 16.2 states an equivariant form for a closed Whitney-stratified subset with invariant control data taken as given, citing Mather for the nonequivariant lemma; it is earlier in the merge order, consumes no part of Layer 5, and 5.5 is not a duplicate of it." Downstream consumers, lines 1166–1169: delete the AlgebraicTopologyPartII clause (the sentence ends at "in the sense of 1.1."); the sibling relation lives in Scope only. With this wording no edge in either direction is claimed, the depcheck output is unchanged (0 problems), and every statement about 16.2 agrees with its head.

## Previous findings

- none: the previous report (at 012087a) was an acceptance with no finding. Its four bullets recorded the repairs of the fourth review's R01–R04; all stand at this head except the attribution of AlgebraicTopologyPartII 16.2 that the fourth review's R02 required, which the diff reverses (R01 above).

## Verified sound

**Gate, build and signatures.** Gate and elaboration as quoted above. The Lean file is unchanged since 012087a, so the previous reports' `#check @name` comparison (every elaborated type matches its README statement; the two "dropped `[OrderTopology R]`" leads of the worker's scan, on `OMinimalStructure.IsCell` and `IsCellDecomposition`, are the generality 4.4 states, with `[OrderTopology R]` carried by `exists_isCellDecomposition` and `exists_triangulation`), one-tactic probe (none of the seven sorried theorems closes) and padding audit stand; at the new pins the module still elaborates with only the seven `sorry` warnings, so every carrier it names exists at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9. The worker's signature scan reports "Unknown identifier `of`" at line 361 and a structure `of` at line 44: line 44 is docstring prose and line 361 is `end TauCetiRoadmap.StratifiedSpacesAndTameTopology`, so this is an artefact of the scan, not of the file. The eight "Lean names found nowhere" of the citation scan are this roadmap's own declarations in `Suggested.lean` (lines 173, 182, 237, 243, 254, 290, 302, 321), as before.

**Sources read at their locators this round (the changed passages and the targets they cite).** mather2012: the definition of a controlled vector field, (9.1) `η_X ρ_{Y,X} = 0` and (9.2) `(π_{Y,X})_* η_X = η_Y ∘ π_{Y,X}` on a neighbourhood `T'_Y` of `Y` in `T_Y` (lines 887–892), and of a controlled submersion (893–897); Proposition 9.1, lifting of a smooth vector field on `P` through a controlled submersion to a controlled vector field (903–905); Proposition 10.1, a controlled vector field generates a unique local one-parameter group, stratum-preserving and `C¹` on strata (1000–1010, 1021); Corollary 10.2, a proper controlled submersion is a locally trivial fibration (1084–1085); Proposition 11.1 with its standing hypotheses, `S` closed in `M` admitting a Whitney stratification, `f|_S` proper, `f|_X` a submersion for each stratum, conclusion the bundle `(S, f, P)` is locally trivial, proved from Proposition 7.1 and Corollary 10.2 (1165–1173). These support 5.4, 5.5 and the new Scope description of the embedded form as written.

**Cross-roadmap citations resolved** (main eaf17b1; open heads as given). AlgebraicTopologyPartII at #1694: `README.md` 1485–1496 (16.2 as quoted in R01), 1474–1483 (16.1, the smooth equivariant Ehresmann transport it builds on), merge-order line 219 against 383 for this roadmap. ImplicitAtlases, line 209 of the order, and ShimuraVarieties, cited in the untouched part of the Downstream paragraph, are as the previous report found them. Ownership by object for "isotopy lemma", "controlled vector field" and "control data" over the open heads and main: AlgebraicTopologyPartII 16.2 is the only other occurrence, as a hypothesis and as the equivariant refinement; no second owner of 5.1–5.5.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-StratifiedSpacesAndTameTopology~5, its table, which carried the fourth report's rows); the rows marked *new* are computed on the changed passages.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1, 4, 12; 1.1; 1.3; 1.4; 2.1; 2.2; 3.2; 3.3(a), (c), (e); 3.4; 4.1; 4.2; 4.4 band, circle, `n = 0`, CAD cells; 4.5; 4.6; 4.7; 4.9(b); 5.1 explicit data, normalisation (A10), (A11), properness and both negative controls; 5.2 spiral; 5.3 proper as built; 6.1–6.4; 7.1; 7.2 closed relation; 7.3 `s_ij` lands in `Σ_i`, boundary hypersurfaces, "Normalisation is needed"; 7.5(a), (b); 7.6; 7.7 identities; 8.2; Scope Euler characteristic | as in the previous report | as in the previous report (carried, untouched by the diff) | true | none |
| *new* Scope 59–61: embedded isotopy lemma = Mather Prop. 11.1 | hypotheses side by side | README: closed Whitney-stratified subset, map proper on it, submersive on each stratum; Mather 1165–1169: `S` closed in `M` with a Whitney stratification, `f|_S` proper, `f|_X` submersion per stratum, `(S, f, P)` locally trivial | same hypotheses, same conclusion | none |
| *new* Scope 59–61: "controlled vector fields it is built on" | 5.4 against Mather §9 | README: `dπ_p(ξ_q) = ξ_p ∘ π_p`, `dρ_p(ξ_q) = 0` on `T_p ∩ X_q` near `X_p`; Mather (9.1)–(9.2) on `T'_Y ∩ X`, `Y < X`: with `Y = X_p`, `X = X_q` the same two identities; Prop. 11.1's proof = Prop. 7.1 + Cor. 10.2, and Cor. 10.2's proof integrates the lifts of Prop. 9.1 | 5.4 is what 5.5 is built on | none |
| *new* Scope 61–62: "its equivariant form is a downstream consumer" | merge order; #1694 head | AlgebraicTopologyPartII line 219, this roadmap line 383; 16.2 `*Needs:* §16.1`; `grep -c StratifiedSpaces` on its README and Lean: 0 and 0 | false in direction and in fact | R01 |
| *new* Downstream 1166–1169: 16.2 "is 5.5 for the trivial action" | `τ = id` on `M` and `B` | every `b` is fixed; 16.2 gives a stratum-preserving local trivialization of `A` over a neighbourhood of each `b` with control data given; 5.5 embedded form gives the same with the data of 5.3 | true as mathematics | none |
| *new* Downstream 1166–1169: "adds the averaging and equivariance step" | #1694 line 1489 | "compatibility equations are linear, so averaging preserves them" | matches | none |
| *new* Downstream 1166–1169: "consumes the controlled lifts of 5.4 and the isotopy lemma of 5.5" | #1694 lines 1487–1496 | its route constructs its own controlled lifts; Mather cited directly; no section of this roadmap cited | false | R01 |

**Remarks that need no change.** The ownership sentence itself, "Thom's first isotopy lemma … and the controlled vector fields it is built on are owned here (5.4–5.5)", is right: no roadmap on main or at an open head states 5.1–5.5, and 16.2 takes every notion of Layer 5 as given.

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*, CUP 1998): still no manifest key and no legal copy; cited by locator at 4.1, 4.3–4.7 and 8.1, none of which the diff touches, so it is not requested again here (the two previous reviews listed it).
- lee2013 (Theorem 9.25), bcr1998 (Theorem 9.7.11), verona1984: settled as uncertified in the manifest.
- Ownership against open pull requests whose files the brief did not give (for instance GrothendieckTopoi): not checked.

## Source issues

- none
