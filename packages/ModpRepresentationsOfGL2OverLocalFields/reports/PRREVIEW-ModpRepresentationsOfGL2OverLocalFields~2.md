# Review of ModpRepresentationsOfGL2OverLocalFields (pull request #2282 at e9433e9)

**Verdict:** accepted

No findings. Incremental re-review of the 33 lines changed since 08debbe (README only; `Suggested.lean` and `metadata.toml` unchanged).

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: README:1523–1531 “Let `U` be a compact analytic pro-`p` group without `p`-torsion, `R = k[[U]]` with its complete separated augmentation-ideal filtration … `M` with a good separated filtration”; the `C₂ × ℤ₅` negative control is the Check at README:1541–1545.
- R02 — not repaired: deferred (D01)
- R03 — repaired: README:839 “*Needs:* §0.6; PadicLocalLanglandsForGL2Qp §§2.7, 5.1–5.2”; supplier contract README:326–328 and Layer 1 Dependencies README:919 now name §5.2; scope paragraph README:62–63 reads §§5.1–5.3.
- R04 — repaired: README:1300 “(BHHMS23, §2.1, p. 12)”.
- R05 — repaired: packages/ModpRepresentationsOfGL2OverLocalFields/sources.toml:308 has `id = "LE19"`, arXiv 1809.10247v3, locator “§2.1; Theorems 1.1, 3.2, 3.4 (arXiv v3)”, status certified.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side / control | Result; change |
|---|---|---|---|---|
| §4.2 support formula, repaired domain | U=ℤ₅, M=k, r=0 | dim U − j(k) = 1 − 1 = 0 | dim Supp(gr k) = 0 | Holds; none |
| §4.2, trivial group | U={1} (pro-p, dimension 0), M=k and M=0 | 0 − 0 = 0; 0 − ∞ = −∞ | Support of k over k: dimension 0; empty support: −∞ | Holds with the §4.1 zero convention; none |
| §4.2, free module | U=ℤ₅², M=R, 𝔍=0 | 2 − 0 = 2 | Supp(gr R)=Spec k[t₁,t₂], dimension 2 | Holds; none |
| §4.2 new negative control | k=𝔽₅, U=C₂×ℤ₅, M=k×S | k[C₂]=k×k, 𝔪=(T)×S, 𝔪ⁿM=0×S; Hom_R(M,R)=0×S≠0, so 1 − 0 = 1 | gr M = M/𝔪M = k, support dimension 0 | Check is correct; U is not pro-5, so excluded by the repaired hypothesis |
| §4.2 hypothesis against source | BHHMS23 line 2392, Lemma 5.1.3, p. 47 | Source: analytic pro-p, no p-torsion, gr Auslander regular, r central regular elements, polynomial quotient in dim − r variables | README:1523–1529: the same five hypotheses | Agree; none |
| §4.2 “good separated filtration” | U pro-p: 𝔪 = Jac(R) | NoncommutativeAndEquivariantIwasawa §0.5 needs F¹R ⊆ Jac(R): true | Good filtrations then complete and separated (§0.5 route, step 1) | Hypothesis consistent with supplier, not vacuous |
| §4.2 consumer §4.7 | I₁/Z₁, p>3, F unramified | I₁ = Z₁ × (I₁ ∩ SL₂) for p odd: pro-p | Order-p element of SL₂(F) needs p − 1 ≤ 2; fails for p ≥ 5 | §4.7 still inside the repaired domain; none |
| §4.2 reduction sentence | General compact analytic U, open uniform U′ | §4.1 API: restriction to open subgroup preserves dim | Uniform U′: gr = polynomial ring, 𝔍 = 0, commutative equality | Cited §4.1 statement exists; none |
| §3.1 regularity and depth locator | BHHMS23 lines 544–557 (§2.1 begins line 510; page 12 is lines 519–562) | Source: 0 ≤ ⟨λ,α∨⟩ < p−1; N < ⟨μ+η,α∨⟩ < p−N | README: 0 ≤ r_i ≤ p−2; N < r_i+1 < p−N; p=17, N=3, r=3: 3<4<14 | Locator and inequalities agree; none |
| §1.4 Ext support, supplier sections | PadicLocalLanglandsForGL2Qp §5.2 at its open head, p=2, 3, ≥5 | Block lists: {1,Sp}⊗δ: 2; p=3 exceptional: 4; p≥5: 3; generic: 2; supersingular: 1 | §5.1 alone: only finitely many blocks per finite-length object | §5.2 supplies the within-block finiteness and Ext computations; citation resolves |

Rows for the untouched statements stand as in the previous review, of 08debbe.

- Source locators checked against the text: 3 (BHHMS23 line 2392, Lemma 5.1.3, p. 47; BHHMS23 lines 544–557, §2.1, p. 12; BHHMS23 lines 2385–2391, Lemma 5.1.2, p. 47). Seeded-sample targets falling in the change: §3.1 (changed locator) and §4.1 (cited by the new sentence); both checked.
- Cross-roadmap citations resolved: 4 (PadicLocalLanglandsForGL2Qp §§5.1, 5.2, 5.3 at its open head; NoncommutativeAndEquivariantIwasawa §0.5 at its open head).
- Library declarations: the diff changes no Lean statement and cites no new declaration; 0 opened.
- Gate at e9433e9: every check 0, `OK`; worker's targeted build passed. Independent `lake env lean` of `Suggested.lean`: 7 `sorry` warnings (lines 103, 133, 145, 163, 178, 192, 214), nothing else.
- Dependency check output: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Pull request text: title and description read against this head; the change adds no supplier (§5.2 belongs to PadicLocalLanglandsForGL2Qp, already listed), removes no section, heading or declaration; 0 sentences contradicted; 0 files changed outside the folder.
- Declared gaps: 2 in the plan, both unchanged by the diff; the two further README slugs are D01.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, PadicLocalLanglandsForGL2Qp, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, LocallyAnalyticRepresentationsOfLocalGroups, LocalGaloisDeformationRingsPartII as listed in the overlap facts (no other pull request changes this roadmap, no dropped or revision-only ids); the diff adds no owned object. Blocks, their classification and Ext computations: owner PadicLocalLanglandsForGL2Qp §§5.1–5.2, cited. Filtered grade equality: owner NoncommutativeAndEquivariantIwasawa §0.5, cited. Nothing else shared by the changed passages.

Source independence: changed passages only; 3 passages compared with 1 source (BHHMS23), none shared beyond the hypothesis list the mathematics forces; largest share BHHMS23, as in the previous review (43 of 150 citation groups); the diff adds, removes and reorders no layer, so the contents comparison stands: independent.

## Not verifiable

- SERRE-LRFG, Part III, Chapters 14–15: settled as uncertified; not touched by the change.
- BARTHEL-LIVNE94, Proposition 18, Theorem 30, Theorems 33–34, Corollary 36: settled as waived; not touched by the change.

## Source issues

- none

## For the human reviewers

- SERRE-LRFG remains uncertified and BARTHEL-LIVNE94 waived; their wording could not be compared. BHHMS23, the source with the largest citation share, was readable together with its contents.
- README:345 and README:351 state two supplier contracts (`gap:barthel-livne-ordinary-classification`, `gap:ordinary-irreducible-hecke-presentation`) whose slugs are absent from packages/ModpRepresentationsOfGL2OverLocalFields/design/plan.json (D01, settled outside this folder).
