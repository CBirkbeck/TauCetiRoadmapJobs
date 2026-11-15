# Review of FunctionFieldArithmeticPartII (pull request #1831 at 8e083f0)

**Verdict:** accepted

Incremental re-review of the 139 changed lines since 8ff956e (README only). No finding.

## Previous findings

- none: the previous report (of 8ff956e) was an acceptance with no finding to carry.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Consumer lists of the seven new group paragraphs (README lines 7388, 7466, 8263, 8420, 8566, 8735, 8814) | every `§k.n` citation outside each group, recomputed from the head | 6.1–6.3: 9.2, 10.1, 10.2, 10.13, 10.14, 10.17, 10.18 both sides; 6.4–6.12: 10.10 (of 6.6); 8.0–8.7: 8.8, 8.9, 8.11–8.13; 8.8–8.13: 9.3, 9.4, 9.5, 9.12, all via 8.13; 9.1–9.7: 9.8, 9.10–9.12, 9.15, 9.17, 10.7, 10.11; 9.8–9.12: 9.13–9.18, 10.2, 10.7, 10.20; 9.13–9.18: 10.2, 10.11 | equal | none |
| "§10.10 consumes the signed root-divisor groupoid of §6.6" | `*Needs:*` of §10.10 (line 9113) | lists §10.4, §4.1, §6.6, SchemeAndStackFoundations §§3.3–3.7; no other member of 6.4–6.12 | holds | none |
| §6.4 exact sequence, named in the 6.4 paragraph | ℙ¹ over 𝔽₅, R={0}; R=∅ | kernel μ₂(𝔽₅)={1,4}, order 2; squares of 𝔽₅× are {1,4}, quotient of order 2, unit 2 not in the image; R=∅: both outer terms trivial, H=U | holds | none |
| §§8.1, 8.12, 8.13 bound d≥ρ+max(2g−1,1), "including the case R=∅" (8.8 paragraph) | g=0, ρ=0, d=1; g=1, ρ=0, d=1; g=1, ρ=1, d=2; d=2g−2+ρ | deg L(−R)=1>−2, rank 2, quotient ℙ¹; rank 1, quotient ℙ⁰ = ℙ^(d−g); ranks (n,a)=(2,1), deg L(−R)=1>0; L(−R)=ω gives H¹=k, excluded by the bound | holds | none |
| §9.5 definition via an auxiliary divisor (9.1 paragraph) | d=−5, B=3, P of degree 2 away from R | D=4[P]: −5+8=3≥3; D=3[P]: −5+6=1<3; no point of degree one used | holds | none |

Rows for the statements the diff leaves untouched stand as in the previous review, of 8ff956e.

- The diff changes headings and adds seven paragraphs only: 37 `###` headings of Layers 6, 8 and 9 become run-in bold ids with the same number and title, seven more become group headings; no statement, hypothesis, Check, locator or `*Needs:*` line changed (58 insertions, 81 deletions, each removed line a heading or the blank line after it).
- All 457 section ids of 8ff956e are present at this head with the same numbers; every in-README citation of a regrouped section resolves by number. Remark: the seven group headings carry the number of their first target, whose own title now survives in the group paragraph and in the citing parentheticals.
- Gate at 8e083f0: every check 0, build OK. Dependency check run here: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/FunctionFieldArithmeticPartII/Suggested.lean`: three `declaration uses sorry` warnings (lines 89, 97, 107), nothing else; the file is unchanged since 8ff956e, so its six signatures and the one-tactic probes stand.
- Seeded sample: none of the 15 targets (§§1.25, 1.60, 3.9, 3.23, 3.68, 3.107, 3.121, 3.131, 3.137, 3.159, 5.19, 7.8, 7.25, 7.28, 10.16) lies in Layers 6, 8 or 9; none re-reviewed.
- Title and description against the head: adds a roadmap (not on main; 9698 lines, 6 Lean declarations, three of them theorems); end theorem §10.20 at README line 9302; §1.4 and §8.24 supplier citations at lines 11 and 105; Serre–Lang deferral to PadicDifferentialEquationsAndRigidCohomology §RD.6.62 at line 11; Bresciani consumer at line 9524; injective/surjective/invariant criteria as in the Lean. No sentence contradicted, no change of the head unstated.
- Overlap check: read AlgebraicModuliForArithmeticGeometry, StableReductionPartII, NeronModelsAndSemistableAbelianVarietiesPartII, AnabelianGeometryAndNonabelianChabauty, GlobalShtukasAndFunctionFieldLanglands, SchemeAndStackFoundations through `scratch/overlaps.md` (no pull request changes this roadmap, no dropped id, no result-level match); nothing shared; the diff adds no object. One inbound citation (FunctionFieldArithmetic README line 3604) names the roadmap without a section.
- Source independence: changed passages only; 7 passages compared with 1 source (YZ19), longest shared run 3 words, none shared; largest share TV17, 236 of 573 locators; no layer added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- B24 (Bresciani 2024) is settled as uncertified and cited by page alone; no changed passage cites it.
- The description's count of earlier review rounds ("4 independent review rounds and 2 red-team rounds") is not checkable from the head.

## Source issues

- none

## For the human reviewers

- none
