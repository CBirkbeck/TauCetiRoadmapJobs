# Review of TorsionCohomologyInfrastructure (pull request #1087 at 1f49a76)

**Verdict:** accepted

No finding at this head.

## Previous findings

- R01 — repaired: the description now reads "GPT-6 (Codex) ported the roadmap …, and Codex restated `Suggested.lean` …; Claude Fable 5.1 made later corrections … The four author-side red-team repair passes record no model in their commits", which is what the commit trailers show.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §3a.7 `laurentCoeffIdeal_pow_eq_bot` (the description's "exponent hypothesis of §3a.7": `N : ℕ` with no `N ≥ 1`) | `N = 0` | `I⁰ = ⊤ = ⊥` forces `R = 0`; then `J⁰ = ⊤ = ⊥` in `R` | true | none |
| same | `N = 1` | `I = ⊥`; `a = 1` is the identity, so `I′ = ⊥`, `J = span{0} = ⊥` | true | none |
| same | `R = ℤ/4`, `I = (2)`, `N = 2` | `I² = 0`; `a = 1` gives `I′ ⊆ (2)`, `J = (2)`, `J² = (4) = 0` | true | none |
| same, wrong model `I` in place of `I′` | `R = 𝔽₂[x,y]/(x²,y²)`, `I = (x + yT)`, `N = 2` | `I² = (x² + y²T²) = 0`; coefficients of `I` span `(x,y)`, `(x,y)² = (xy) ≠ 0`; `a = 0` sends `x+yT` to `x+y ∉ I`, so `x+yT ∉ I′` | `I′` is needed and excludes the wrong model | none |
| same, proof route | `f, g ∈ I′`, substitutions `T ↦ T`, `T ↦ T^b`, `b` large | `f(T)·g(T^b) = Σ cᵢdⱼ T^{i+bj} ∈ I² = 0` with distinct exponents, so every `cᵢdⱼ = 0` | true for `N = 2`; same for `N` factors | none |

The rows for untouched statements stand as in the previous review, of `264642f`.

- Change since `264642f`: 0 lines in `TauCetiRoadmap/TorsionCohomologyInfrastructure/`; `git diff --stat origin/main...HEAD` outside the folder is empty (the branch merged main). No statement, locator or `*Needs:*` line changed, so the seeded sample falls in no changed passage.
- Gate at `1f49a76`: every check passed. Dependency check: `depcheck: 246 roadmaps, 2255 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/TorsionCohomologyInfrastructure/Suggested.lean`: five `sorry` warnings (lines 53, 75, 84, 104, 144), nothing else; the eleven elaborated signatures are those of the previous review, none lost a binder. The targeted build adds only Lake's `module` suggestion, as the description says.
- Title and description against the head, sentence by sentence, 0 contradicted: the title is the README's; the summary block agrees with README §§1.2, 3a.6, 3b.2, 4.3–4.6 and the supplier line for PerfectoidShimuraVarieties §3.9 (uniform `N([F:ℚ], n)`, `I^N = 0`, `P_v` at `v ∉ S`, all-prime formal models, Shin's branch against `(EC)_{≤n}`); the prose paragraph is the README's Summary; three files in the folder, eleven real-bodied declarations and five `sorry`'d theorems; the AI-assistance sentence matches the nine commits (Codex on `d3fb40fd`, Claude Fable 5.1 on `b47ffa82`, `2199ac58`, `264642f6`, no trailer on the four red-team commits).
- Roadmaps the README names, 23 besides itself: 7 on main (AdicSpacesPartIII, AlgebraicTopology, ClassFieldTheory, GeometricTopology, PerfectoidSpaces, RepresentationTheory, SchemeAndStackFoundations); 14 open suppliers, exactly the 14 of the description's dependency block, all earlier in the merge order (this roadmap is line 191); IgusaVarietiesAndTorsionConcentration (line 192) as consumer; PerfectoidQuotients §2.1 named as not an input, as the description says.
- Citation resolver's one lead (README line 57, "IntegralHeckeAndGaloisDeterminants has no Layer 3") is a false positive: the text cites Layer 3a.
- Overlap check: read PerfectoidShimuraVarieties, IgusaVarietiesAndTorsionConcentration, PotentialAutomorphyInfrastructure, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII, PerfectoidSpaces; nothing shared (a search of all open heads and main for the Levi interior determinant, twisted-product separation, `weightedDeterminantFactors`, `laurentCoeffIdeal`, `finiteTorsionDeterminant` and the classical Hecke topology finds them only here and in consumers' citations).
- Source independence: changed passages only; the folder did not change, 0 passages compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Unchanged from the previous review: Huber, Proposition 2.5.8; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4; Labesse, Pilloni–Stroh and Milne (used through suppliers); the published pagination of Caraiani–Le Hung. No source was needed this round.
- The description after the merge-order block, if the quote was cut there: outside this check.

## Source issues

- none

## For the human reviewers

- none
