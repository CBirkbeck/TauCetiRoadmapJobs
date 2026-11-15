# Review of SpringerResolutionAndCharacteristicCycles (pull request #1828 at f8ea4db)

**Verdict:** accepted

Incremental re-review of 0 changed lines since f8ea4db; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- The previous report (of f8ea4db, accepted) carried no finding, so there is none to account for.

## Verified sound

**The title and description against the head.** Each row is a sentence of the description and what the head shows.

| Description says | Head (`README.md` line) | Result |
|---|---|---|
| Adds a roadmap folder with README, `Suggested.lean`, `metadata.toml` | not on `origin/main`; 3 files, 1578 + 62 + 1 lines, 0 deletions; nothing outside the folder | agrees |
| "characteristic zero or above the Coxeter number"; "explicit p>h rather than good characteristic"; "tori included" | Conventions, line 27: char 0 or p>h, h=0 for a torus, "not a definition of good characteristic" | agrees |
| X reduced lci with Weyl-indexed components | §§3.7–3.8 (lines 440, 453) | agrees |
| X_w geometrically CM "by a Bezrukavnikov–Riche convolution argument in characteristic p and integral spreading"; normal; flat Cartan maps | §4.2 (line 508: convolution kernels, Z_(p) model), §4.3, §4.4, §5.4 | agrees |
| Springer/Steinberg compared "over arbitrary characteristic-zero fields and reductive groups", supplied geometry "extended … instead of being rebuilt" | Scope line 15 (NilpotentOrbits N1, N5.0, N7 consumed; §§6.1–6.3 compare) | agrees |
| D-modules "on any smooth separated finite-type characteristic-zero scheme"; good filtrations, CC, Kashiwara, Bernstein, holonomic, regular holonomic, strong equivariance | Scope line 7; §§8.3–8.6, 9.2–9.4, 9.7–9.8 | agrees |
| "Beilinson–Bernstein localisation for the strict principal block" | §10.2 (line 1168: "strict central reduction, not merely a generalized central character"), §10.4 | agrees |
| KL multiplicity "through a de Rham comparison on the flag variety and the Schubert stalk theorem", "rather than the full Riemann–Hilbert correspondence" | Scope line 14; line 150 | agrees |
| Three integral bases: components, simple cycles, Verma (Cartan zero-fibre) cycles | §11.1 `CC(M_w)=[X̄_w]`, §11.4 | agrees |
| End theorems: partial-flag saturation, zero-operator tangent bound with smoothness criterion, completed KL identity "at every closed point" | §12.2, §§13.4–13.5, §14.4 (line 1528) | agrees |
| Consumers: TriangulineVarietyAndItsLocalModel, MixedHodgeModulesAndIrregularHodgeTheory, SheafConvolutionOnAbelianVarieties; summary: smooth representations of local groups | line 1549, with SmoothRepresentationsOfLocalGroupsPartII for Layer 6; each of the four open READMEs cites this roadmap (29, 23, 11, 5 lines) | agrees |
| "`Suggested.lean` declares nothing; its docstring records, headline by headline, which carrier is missing" | 0 declarations; nine docstring bullets covering §§2.3–5.4, 6, 8–9, 10, 11.1/11.2/11.4, 11.3, 12.2, 13.3–13.5, 14.2–14.4 | agrees |
| Six open suppliers in the dependency block | #848, #1034, #1038, #1040, #1056, #1312 are all still open new-roadmap pull requests; the other nine contract suppliers are folders on main (8ad4192) | agrees |
| Validation line: 0 missing identifiers, 0 `set_option`, 0 sorry'd data, 0 dependency problems, 0 outside paths | gate and dependency check below | agrees |

- Remark, no change asked: "the Lean states only real-bodied definitions and theorems" and "`sorry` as the only warning" hold vacuously at this head (no declaration, no warning); the description says so itself two sentences earlier.
- Remark, no change asked: the summary's "The route follows Breuil–Hellmann–Schraen" speaks of the proof route; `README.md` itself nowhere says it follows a source, and §12.2 departs from BHS19 Lemma 2.4.8.

**Adversarial table.** The diff changes no statement; these rows are for statements the description cites.

| Statement | Instances | Values each side | Result |
|---|---|---|---|
| "p>h rather than good characteristic" (Conventions) | torus; SL₂; SL₃; G₂ | h = 0: every p; h = 2: p ≥ 3; h = 3: p ≥ 5; h = 6: p ≥ 7, whereas p = 5 is good for G₂ and excluded | sound; the two notions differ |
| X reduced lci of dimension D (§3.7) | SL₂; rank-r torus | dim g̃×g̃ − dim g = 6 − 3 = 3 = r+2N; torus r+r−r = r = D | sound |
| KL multiplicity `m_(w,v)=P_(w₀w,w₀v)(1)` (§11.3) | SL₂, w₀ = s | `m_(e,e)=P_(s,s)=1`, `m_(s,s)=P_(e,e)=1`, `m_(s,e)=P_(e,s)(1)=1`, `m_(e,s)=P_(s,e)=0`; `[M(0)]=L(0)+L(−2ρ)` | sound, matrix ((1,0),(1,1)) |
| Three integral bases (§11.4) and completed identity (§14.4) | SL₂ | `[X̄_e]=ℒ_e=[Z_e]`, `[X̄_s]=ℒ_s+ℒ_e=[Z_s]+[Z_e]`; det M = 1, `M⁻¹=((1,0),(−1,1))` | sound |

The rows of the previous report for untouched statements stand as in the previous review, of f8ea4db.

- Gate rerun on f8ea4db: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate at this head adds `build=0`.
- Dependency check with `--movable`: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line; the roadmap is line 262 of the merge order, after its six open suppliers (lines 34–118).
- `lake env lean` on `Suggested.lean`: exit 0, no output, 9 s. No declaration, so nothing to `#check` and nothing for the one-tactic probe.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Source locators opened this round: 2 (BHS19 lines 458–460 for the characteristic hypothesis; BHS19 line 1171, the marker of printed p. 328, with Corollary 2.5.6 at line 1206). The seeded sample falls in no changed passage.
- Cross-roadmap citations: `roadmaps resolve` lists none unresolved; GroupSchemesOverABase §7.6 is at `README.md` line 1357 of its open head and is cited as a distinct object, not a supplier.
- Pins: the branch manifest has Tau Ceti 358314d4 and Mathlib f6090c70, main has 2fd255d9 and 1b1ccf4b; the README's `file:line` locators follow main's pins, as the previous report recorded. Unchanged.
- Declared gaps: seven `gap:` slugs, each once in the README; unchanged.

Overlap check: read the open heads of SchubertGeometry, SheafConvolutionOnAbelianVarieties, TriangulineVarietyAndItsLocalModel, MixedHodgeModulesAndIrregularHodgeTheory, GeometricSatakeAndFusionPartII and, on main, SchubertGeometry, NilpotentOrbits, KacMoody (the third list is empty); nothing shared. None of SchubertGeometry, NilpotentOrbits, KacMoody states a Steinberg variety, a simultaneous resolution, a D-module category or a characteristic cycle; TriangulineVarietyAndItsLocalModel (scope bullet on Layers 1–7, 11–14), MixedHodgeModulesAndIrregularHodgeTheory (§8.1 onwards) and SheafConvolutionOnAbelianVarieties name this roadmap as the owner and consume it; the last also declares `gap:microdifferential-localization` on Layer 8, an extension it asks for, not a second owner. `roadmaps overlaps` at this index: no other pull request changes this roadmap, no cited id dropped, none defined only by an open revision.

Source independence: changed passages only; 0 passages compared with 0 sources (the diff is empty); largest share BHS19, 89 of 145 locators; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- G86 and KT84 are settled as uncertified and cited by locator in §11.1; Hum08 §8.4 and KL80 are paywalled and cited by bibliographic data in §11.3. Untouched.
- The description's "2 independent review rounds and 2 red-team rounds" refers to the job board's history, which is outside what this review reads.

## Source issues

- **Error** in BHS19 at Lemma 2.4.8 and Remark 2.4.9, printed p. 324: the source says the simple characteristic cycle is invariant when P_w translates the first flag on the left; it should say the cycle is saturated along the fibres of F → G/P_w on the first flag; affects a stated result.

## For the human reviewers

- **Licence.** ElliottBB (unpublished 2014 seminar notes by Heleodoro) and G98 (unpublished 1998 lecture notes) are read from web pages of third parties, not of their authors; M23 is unpublished course notes on its author's page (`README.md` References).
