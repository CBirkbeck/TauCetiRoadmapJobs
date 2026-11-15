# Review of LocalGaloisDeformationRingsPartII (pull request #2278 at 83a2083)

**Verdict:** accepted

:robot: Incremental AI re-review of 128 changed lines since `b936e15`; no findings.

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous report, of `b936e15`, had no findings.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| §5.3 `crossing_prime` (cited by the new opening sentence of 5.3) | `O=ℤ_p, n=0, d=1, u=1`; controls `d=0`, `u=x₀` | After `x₁↦x₀+x₁`: root `b` of `b²+bx₁+p` forces `p∣b` or `p∣b+x₁`, then `c(pc+x₁)=−1`, impossible. `d=0`: `1+x₀x₁` a unit. `u=x₀`: `x₀(x₁+ϖ)`. | Prime; both hypotheses needed | none |
| §5.3 opening sentence: “surjective for `N ≥ 12`” | `N=12`, `N=11` in 5.5 | `n=N−5`: `7>6` holds, `6>6` fails; congruence modulus `p^{n−3}=p^{N−8}`, `p⁴` at `N=12`. | Agrees with 5.5 | none |
| §4.1 opening sentence: “`(N−1)`-deep presentation” | `μ(τ)_j+η_j=(r_j,0)` and `(r_j+1,−1)`, `N<r_j+1<p−N` | Pairings `r_j` and `r_j+2`: `N−1<r_j<p−N−1` and `N+1<r_j+2<p−N+1=p−(N−1)`. | Both `(N−1)`-deep | none |
| §§6.1, 7.2 opening sentences: `2^f`, `4^f` components | `f=1`, `f=2` | Profiles `2^f` = 2, 4; pairs `(λ,w̃)` with `|X(σ)|=2^f`: 4, 16; dimension `3f+4−2f=f+4` = 5, 6. | Agree with 6.2, 7.3 and their Checks | none |
| Consumer lists of the 12 new opening sentences | each list against every `*Needs:*` line of the README | 0.2: `{0.5,1.1,1.4,2.3,3.7,3.9,4.1,5.2}` = union of citers of 0.2, 0.3, 0.4; 1.1, 1.3, 2.1, 3.1, 3.7, 4.1, 5.3, 5.6, 6.1, 7.2, 7.4: lists equal the citers outside the group. | 12 of 12 exact | none |
| Contents of the 12 opening sentences | each clause against the paragraphs it summarises | 0.4 one-unit loss; 1.4 `(h+1)`-generic existence, `f`-periodic `ker(T(R)→T(𝔽))`; 2.2 equivalence with `N_𝔐(𝔐^rig)⊆𝔐^rig`; 3.7 `p>2`; 3.9 no `p>2`; 7.5 both intersections. | No clause exceeds its paragraph | none |

The adversarial rows for untouched statements stand as in the previous review, of `b936e15`.

- Change read in full: 12 headings renamed, 21 headings turned into run-in labels with their numbers kept (0.3, 0.4, 1.2, 1.4, 2.2, 3.2–3.6, 3.8–3.10, 4.2, 5.4, 5.5, 5.7, 6.2, 7.3, 7.5), 12 opening sentences added; no statement, locator, `*Needs:*` line or Check changed.
- Internal references: all 41 numbered sections still carry one `**Checks.**` list of at least three bullets; every in-text number (`*Needs:*`, contracts, Downstream consumers, the `Suggested.lean` docstring's §§3.6, 3.9, 5.3, 6.1–6.3, 7.3, 7.5) resolves to a heading or run-in label; no reference by an old title remains.
- Sources: 5 locators in regrouped sections reread, all in place: BHHMS23 Definitions 2.3.3–2.3.4 (lines 653–664, pp. 14–15), Proposition 3.1.5 (line 863), Lemma 3.3.1 (line 1118, p. 24), Proposition 4.3.3 (line 1918, p. 39).
- Cross-roadmap: citations of this roadmap at the open heads (HilbertModularVarietiesAndShimuraCurvesPartII, ModpRepresentationsOfGL2OverLocalFields) name no section number that the regrouping moved; the resolver reports 0 unresolved citations and 0 unresolved Lean names; `ClassFieldTheory` (active) and `LocalFieldsRamification` (completed) are on main.
- Gate: zero failures. Dependency output: `depcheck: 240 roadmaps, 2247 edges, 0 problem(s)`; 0 changes outside the folder.
- Lean: direct elaboration passed with the `sorry` warning only; `#check @crossing_prime` in a scratch copy shows no lost binder and agrees with §5.3; the one-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) does not close it.
- Pull-request text: title, prose and `roadmap-summary` read against this head: it adds the roadmap (stated), 0 sections and 0 declarations removed against the base, the six open suppliers and two on main match the README's contracts, and no sentence names a heading the regrouping changed.

Overlap check: read, at their open heads, the lines of HilbertModularVarietiesAndShimuraCurvesPartII and ModpRepresentationsOfGL2OverLocalFields that name this roadmap; the scopes of LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII and FiniteFlatGroupsAndIntegralPadicHodgeTheory were not read again, since the change adds, removes and moves no object and this README's Scope and supplier contracts are unchanged; the other two closest-roadmap lists are empty. Owners as in the review of `b936e15`; nothing newly shared.

Source independence: changed passages only; 12 added sentences and 12 new headings compared with 1 source (BHHMS23: its contents, lines 16–60, and the 5 statements above), none shared; largest share BHHMS23, 69 of 94 located citation groups as counted at `b936e15` (no locator changed); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Kisin06, Corollary 1.3.15 (§2.1), remains settled as uncertified; outside the changed passages, with no new request.

## Source issues

- none

## For the human reviewers

- **Licence.** README §§5.2, 7.1 and 7.4 restate BHHMS23 Tables 1–5 and Figure 2 (pp. 38, 41–45) in the roadmap's notation; the arXiv licence of v7 was not read.
- **Scope.** BHHMS23 supplies 69 of 94 located citation groups. An earlier review records five of eight layers matching its section scopes (Layers 1, 2, 3, 4 and 7); this head regroups sections inside the layers and changes no layer.
- **Not tested.** D01: README line 75 requests `descent-kisin-modules` in every rank; `packages/LocalGaloisDeformationRingsPartII/design/plan.json` still declares `rank-two-descent-kisin-modules` in rank two. This board change remains deferred.
