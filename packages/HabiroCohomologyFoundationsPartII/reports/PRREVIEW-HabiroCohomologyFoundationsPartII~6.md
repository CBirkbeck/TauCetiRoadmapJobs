# Review of HabiroCohomologyFoundationsPartII (pull request #1466 at 5732822)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 5732822. This round reads the pull request's title and description against the head. The folder is unchanged and no file outside it is changed.

## R01 (P3) — The description says the Lean states definitions and theorems and builds with a `sorry` warning; it states nothing

**Location:** pull request description, second paragraph and "Validation": "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** A reader concludes that `Suggested.lean` states headline theorems with `sorry`. At this head it declares nothing: none of the nine headline theorems is statable at the pins, which the description never says.

**Witness:** `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` is 36 lines: `import Mathlib`, a docstring ("None of the headline theorems is statable at the pins"), an empty namespace. `grep -c sorry` gives 0; `lake env lean` prints no diagnostic.

**Repair:** Replace the two sentences by: "`Suggested.lean` states no declaration: none of the nine headline theorems (relativeFormalEtaleLift, sphericalPerfection, tracePair, traceHabiro, quotientLift, perfectedLiftNaive, tracePair_quasiRegular, canonicalFramedTrace, numberFieldTraceExports) is statable at the pins, and its docstring names the carrier each lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning (the file has no `sorry`); …". No change to the folder is needed.

## Previous findings

The previous report (at 5732822) accepted with no finding, so there is none to account for.

## Verified sound

| Statement the description cites | Instances | Values computed | Result |
| --- | --- | --- | --- |
| "the trace pair is the pullback of the q-de Rham complex along the glued comparison, not its completion, keeping the rational corner" (README §1.2, lines 216 and 236) | A = ℤ, R = 0 | `dR_{0/ℚ}` = `ℚ⊗_{dR_{ℚ[y]/ℚ}}ℚ` = ℚ (Poincaré lemma), so `qdR_{0/ℤ}` ≃ ℚ[[h]]; the trace side is 0; pullback = constant filtration ℚ[[h]], completion = 0 | Agrees with the head; a completed definition gives 0 and fails clause (a). |
| "Every prime is covered, with Čech E₁ data at 2 where no E₂ comparison is proved" (§1.1, line 188) | R = ℤ[x]; R = ℤ[1/2] | ℤ[x]: (E₁) cover ℤ₂⟨x⟩ → ℤ₂⟨x^{1/2^∞}⟩ required at 2; ℤ[1/2]: R̂₂ = 0, condition empty | Agrees with lines 188, 205–206. |
| "relative lifting drops finite presentation, since completed localisations and root towers are not ordinarily étale" (§0.1, lines 148, 166) | A = ℤ[x], B = A[t^(1/n)] | d(t^r) = p·(t^(r/p))^(p−1)·d(t^(r/p)) ≡ 0 mod p, so the completed relative cotangent complex vanishes; t^(1/(N+1)!) ∉ 𝔽_p[x, t^(1/N!)], so B/p is not finitely presented | Agrees with the head. |
| "rings with cotangent amplitude [0,1] and spherical lifts at every prime" (§1.1, line 188) | A = ℤ, R = ℚ[u,v]/(u,v)² | Three generators u², uv, v² of a height-2 ideal: not lci, amplitude fails, although every p-completion is 0 | The global condition is in the definition, as the description says. |

The rows of the previous review for the README's statements stand as in the previous review, of 5732822: the folder is unchanged.

- Description against the head, sentence by sentence: the summary block's three paragraphs match the README Summary (line 3), Scope (lines 7–14), §§0.1, 1.1, 1.2 and Downstream consumers (line 537); the title is right for a pull request that adds the folder (not on `origin/main`; 596 insertions, 3 files). Only R01 fails.
- Suppliers named in the README, 16 roadmap names resolved: EnhancedDerivedSheaves and StableHomotopyKTheory are on main; AInfCohomology, HabiroCohomologyFoundations, HabiroCyclotomicCompletions, HabiroNumberFields, HabiroRings, KTheoryFiniteLocalFields, PrismaticCohomology, PartII, PartIII, QWittVectors, RefinedTraceMethods and SolidAnalyticRings are the open suppliers the description lists; HabiroNahmSeries is a consumer, as the description says.
- Source locator opened this round: KU 4.26 and Theorem 4.27 at KU lines 2133 and 2143, between the page markers for pp.50 and 51, as cited in §1.2.
- Gate, run at this head: every counter 0, `OK`, exit 0; the worker's gate also reports `build=0`. Changes outside the folder: none.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: HabiroRings 338, RefinedTraceMethods 339, this roadmap 343.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` exits 0 with no diagnostic. The file has no declaration, so there is nothing to `#check` or to probe with one tactic; the docstring names all nine headlines and the carrier each lacks.
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or is the only definer of one. The resolver's three leads (`Prismatic.Trace.gradedTC`, `gradedTCMinus`, `gradedTP`, README line 131) are names of PrismaticCohomologyPartIII §7.0, not declarations claimed here.
- Overlap check: read HabiroCohomologyFoundations, HabiroRings, RefinedTraceMethods (and the QWittVectors consumer note); nothing shared: each names this roadmap only as a consumer, and TraceInput, tracePair, sphericalPerfection, relativeFormalEtaleLift and numberFieldTraceExports occur in no other roadmap.
- Source independence: changed passages only; the diff changes no passage, so 0 passages compared with 0 sources; largest share KU, about 79 of 146 locators; the arrangement was not compared again because no layer was added, removed or reordered.

## Not verifiable

- The description's sentence on AI assistance ("0 independent review rounds and 2 red-team rounds") describes the job board's history, which is not in the pull request; not checked.

## Source issues

- none

## For the human reviewers

- Scope: the three sources carrying about 129 of 146 locators (KU, QH, TC) are cited as arXiv preprints of 2024–2025 (arXiv:2510.06057v1, 2510.04782v2, 2410.23115v4; README References); I did not establish refereed publication for them.
