# Review of LanglandsParameterStacks (pull request #1202 at 04801e3)

**Verdict:** accepted

## Previous findings

- R01 — repaired: 83 `### k.n` target headings (`README.md:312` `### 1.1 ℓ-adic representability of finite-wild parameters` … `### 4.19 Sifted parameter mapping approximations`); the group paragraphs now open Layers 1, 2 and 4 with ranges ("§§1.1–1.2 identify …").
- R02 — repaired: `README.md:310` "ModularityAndLanglandsExtensions consumes 1.11 and 1.16–1.18 for nilpotent singular support on the parameter stack"; the Downstream consumers bullet at `README.md:1331` names ModularityAndLanglandsExtensions with 1.5, 1.8–1.11 and 1.16–1.18.
- R03 — repaired: `README.md:922` "… the derived unit fibres of generated inputs that are connective for the good-filtration t-structure, when `G°` is reductive and `|π₀G|` and `|π₁(G°)_tors|` are prime to `ℓ`".
- R04 — repaired: the description now lists ArithmeticGaloisRepresentations §1.11 (in §§2.2–2.4), IntegralHeckeAndGaloisDeterminants §§0.2, 0.5–0.7, 1.2, 1.7 (in §§2.7, 2.9–2.10, 3.1–3.3, 3.7–3.8), DeformationAndDerivedPatchingAlgebra §§3.2–3.4 and FormalConnectionsOpers F4.3.
- R05 — repaired: the description says "No headline theorem is statable at the pinned Mathlib and Tau Ceti, so `Suggested.lean` declares nothing", and the validation sentence no longer mentions `sorry` warnings or red-team passes still to come.
- R06 — repaired: the summary block says "The end theorems are Fargues–Scholze, Propositions VIII.3.2 and VIII.3.8 and Theorems VIII.4.1 and VIII.5.1; the layers are ordered by what they need."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Target headings (R01) | board target count; the 12 restored titles against R01's list | 83 headings = 9+18+15+9+26+3+3 (54 at `032037c`); 0 bold `**k.n` lines remain; 12 of 12 titles match | Holds |
| Layer 1 opening, §§1.1–1.9 and 1.13–1.15 | every *Needs:* line citing 1.1–1.9 or 1.13–1.14 | Cite 1.1: 1.2, 1.4–1.6, 1.8, 1.14, 2.1, 4.4, 4.9. Cite 1.3–1.5: 1.6, 1.9, 1.10, 1.16, 5.2. Cite 1.7–1.9: 1.11, 2.8, 4.5, 4.19, 6.1. All named | Holds |
| Layer 1 opening, §§1.16–1.18 hypothesis; sampled 1.18 | `SL₂`, trivial action (`n=1`), `q=4`, `ℓ=5`; `G_m`, `q=3`, `ℓ=2`; FS VIII.2.11 | `SL₂`: degree 2, `4²−1=15`, `5∣15`, so excluded. `v=diag(a,−a)`, `φ(σ)=` Weyl element: fixed, not nilpotent. `G_m`: `3−1=2`, excluded | Holds; see Source issues |
| Downstream consumer (R02) | ModularityAndLanglandsExtensions README:3342 and :3378 at its head; PrismaticCohomology | :3378 *Needs:* §§1.5, 1.8–1.11, 1.16–1.18, the same list as `README.md:1331`. PrismaticCohomology: 0 mentions in the README | Holds |
| Layer 4 opening, §§4.2–4.3; sampled 4.2 | `G=C₂` and `G=C₃` over `𝔽̄₃`; statement of 4.2; FS Definition VIII.5.4 (line 11423) | 4.2 assumes `G°` reductive, `ℓ ∤ \|π₀G\|`, as the summary does. `C₂`: in scope. `C₃`: excluded, `RΓ(C₃,L)≠0` in all degrees. Definition: pp.294–295 | Holds |
| Layer 4 opening, §§4.6–4.10 (R03) | `PGL_ℓ`, `SL_n` with `ℓ∣n`, `G_m`; statements of 4.8–4.10 | Torsion of `π₁`: `ℤ/ℓ` fails, `0` holds, `0` holds. 4.8, 4.9, 4.10 assume `ℓ ∤ \|π₀G\|`, now stated. 4.11 and 4.20 cite 4.9 | Holds |
| Layer 4 opening, §§4.12–4.18; sampled 4.12, 4.16 | inversion on `G_m` over `𝔽̄₃` and `𝔽̄₂`; FS VIII.5.14 (line 11692), VIII.5.17(v)–(vi) (line 11982) | `𝔽̄₃`: `G^P=μ₂`, `\|π₀\|=2` prime to 3; weights 0 and 1 restrict to both `μ₂` characters. `𝔽̄₂`: `\|P\|=2=ℓ`, the 4.17 case | Holds |
| Layer 4 opening, §§4.19–4.21; sampled 4.20 | band `PGL_ℓ`, `F₁`; torus; FS line 12121 and VIII.5.20 (line 12161, p.312) | The band hypotheses match FS line 12121. `PGL_ℓ`: fully faithful but not essentially surjective. Torus: an equivalence | Holds |
| Layer 2 opening | citers of 2.2–2.5, 2.9–2.11 and 2.12–2.14 | 2.6, 3.3 cite {2.2, 2.4, 2.5}; 3.5, 4.24, 4.25 cite 2.2; 4.23 cites 2.4; 2.13–2.15, 3.2, 3.6, 5.1, 5.3 cite 2.9/2.10; 2.15 cites {2.12, 2.14} | Holds |
| Sampled 1.2 | `γ∈P` acting nontrivially on `Ĥ` (FS line 10787 needs trivial action); `P′=P` | 0.3 takes `P ⊂ ker(W_E→Q)`, so `γ` acts trivially. `P′=P` gives the identity. FS lines 10785–10791, pp.279–280 | Holds |
| Description: suppliers not on main (R04) | main `e6f6358`; every roadmap name in the README | Four are not on main, all open new roadmaps: ArithmeticGaloisRepresentations, DeformationAndDerivedPatchingAlgebra, FormalConnectionsOpers, IntegralHeckeAndGaloisDeterminants. The other 12 are on main | Holds |
| Description: where IntegralHeckeAndGaloisDeterminants is used | `README.md:661–892`; supplier table `:105–107` | Cited in 2.7, 2.9, 2.10, 3.1, 3.2, 3.3, 3.8; the table adds 3.7. The description says §§2.7, 2.9–2.10, 3.1–3.3, 3.7–3.8 | Holds |
| Description: Lean and validation (R05) | `Suggested.lean`; gate | 0 declarations; the docstring says no headline theorem is statable; `lake env lean` exit 0, no output; gate OK | Holds |
| Summary block, end theorems (R06); sampled 6.2 | FS VIII.5.1 (lines 11358–11362, p.293); `README.md:3` | Assumes `ℓ ∤ \|π₁(Ĝ)_tor\|` and gives generation and the module comparison. "Three theorems" is `README.md:3`'s grouping of VIII.3.2+3.8, VIII.4.1, VIII.5.1 | Holds |

The rows of the review of `032037c` for statements this diff does not change stand as recorded there.

- Gate (my run at `04801e3`): `gate LanglandsParameterStacks: set_option=0 … statement-hygiene=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`. Dependency check: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`. `lake env lean` on `TauCetiRoadmap/LanglandsParameterStacks/Suggested.lean`: exit 0, no output. The file has been unchanged since `032037c` and has 0 declarations, so there was nothing for the `#check @name` audit or the one-tactic probe. Against `origin/main...HEAD` the pull request changes no file outside the folder; the list in the change summary comes from the merge of main.
- The three layer openings assert 58 *Needs:* edges; all 58 are present. Every target outside a run that cites the run is named.
- Source locators re-read against Fargues–Scholze, 7 in all: proof of VIII.1.3, pp.279–280; VIII.2.11–2.13, pp.284–285; Definition VIII.5.4, pp.294–295; VIII.5.14, pp.301–302; VIII.5.17(v)–(vi), pp.307–308; §VIII.5.4 and VIII.5.20, pp.311–312; VIII.5.1, p.293. The diff adds and removes no locator.
- Citations resolved at their heads: ModularityAndLanglandsExtensions :3342, :3356 and :3378 (§§1.5, 1.8–1.11, 1.16–1.18, titles matching); HeckeStacksAndLocalShtukas :32 and :2459 (§§1.7–1.8, 6.2–6.3) and §4.1 by title; GlobalShtukasAndFunctionFieldLanglands §§1.13, 2.9–2.14, 3.2–3.5; GeometricSatakeAndFusion §§0.4, 4.1; ArithmeticGaloisRepresentations §1.11 (both named parts).
- Overlap check: read IntegralHeckeAndGaloisDeterminants, HeckeStacksAndLocalShtukas, ModularityAndLanglandsExtensions, GlobalShtukasAndFunctionFieldLanglands and AnalyticStacks (open), and SmoothRepresentationsOfLocalGroups, EnhancedDerivedSheaves and ReductiveGroups (main), searched by object; the list of closest roadmaps by results is empty. Owners:
  - parameter stack, generation and singular support: this roadmap (ModularityAndLanglandsExtensions and HeckeStacksAndLocalShtukas consume them);
  - finite-wild cocycle scheme and excursion algebra: SmoothRepresentationsOfLocalGroups SR.6;
  - pseudocharacters: IntegralHeckeAndGaloisDeterminants;
  - AnalyticStacks: nothing shared.
- Source independence: changed passages only. 4 passages were compared with 1 source (FS, the whole text, by word n-grams): the openings of Layers 1, 2 and 4 and the consumer bullet. The longest shared runs are "good-filtration t-structure on Ind Perf", a name, and "a finite group of order prime to ℓ acting on G" (FS line 11694), a hypothesis with only one wording. The largest share is Fargues–Scholze, 89 mentions, unchanged by this diff. No layer was added, removed or reordered.
- Remark (untouched text): 1.13 does not cite SmoothRepresentationsOfLocalGroups *wd-raw-parameters* (SR README:4477; `GL(V)` over characteristic-zero fields, arithmetic degree), which is its `GL_n` case. The conventions agree because `d_geo = −d_arith`.
- Remark (other roadmaps): ArithmeticGaloisRepresentations README:1428–1431 and AutomorphicGaloisRepresentationsPartII README:229, :2603 and :2673 cite `LP2e.2–LP2e.4`, `LP1.7–LP1.8` and `LP4.1–LP4.3`. This README defines no such ids; those citations are for those roadmaps' own reviews.

## Not verifiable

- Nothing in the changed passages. The limitations recorded in earlier reviews (Jantzen 2nd edition pages; Lusztig 1976, Haboush 1975, Kempf, Donkin, Richardson 1988, Koppinen 1984) concern untouched text.

## Source issues

- **Misprint** in FS at Proposition VIII.2.11(ii) and the paragraph after its proof, pp.284–285: the source calls the degrees of the basic invariant polynomials "exponents" (its Coxeter-number remark confirms this usage); it should say degrees, the standard exponents plus one; affects a stated result: under the standard reading, `SL₂` with `q=4`, `ℓ=5` satisfies (ii), yet `diag(a,−a)` lies in a non-nilpotent fibre.

## For the human reviewers

- Licence: Fargues–Scholze was read from the author-hosted copy at people.mpim-bonn.mpg.de. The sources service knew no licence class for that host; this review classified it `author-page`.
- Not tested: no review of this folder has recorded a comparison of its full wording, or of its layers, against the contents of Fargues–Scholze Chapter VIII, the source with the largest share (89 mentions). This round compared only the changed passages.
