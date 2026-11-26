# Review of RandomGraphs (pull request #3170 at 198459f)

**Verdict:** accepted

**Summary.** An incremental re-review of the 47 lines changed since `f17d28c`, together with the pull request's title and description. Accepted, with no finding: both small corrections of the previous review are repaired, every declaration the rewritten *Needs:* line and routes of 9.5 name exists at the pins with the hypotheses the routes use, and the Möbius-inversion step of the new homeomorphism route computes correctly. The title and the RandomGraphs bullet of the description agree with this head. Two format notes carried from the previous review remain, neither blocking; one question of placement is left to the human reviewers.

## N01 — Section 9.5 still cites no source

Neither result of 9.5, nor the Polishness of the weak topology that the inverse route now names as the missing step (README line 1254), carries a locator; elsewhere the README gives one or says none is cited. A locator for each, or a sentence that the results are derived here, would do. The pinned Tau Ceti file proving the Borel half cites Kechris, *Classical Descriptive Set Theory*, Theorem 17.24.

## N02 — Untouched text: README 5.2, lines 702–703, "every formula"

The sentence says "every formula is `Language.Theory.IsQFEquivalent` modulo `T_R`", while `HasQuantifierElimination` in `Suggested.lean` quantifies over variable types in `Type` only. "Every formula whose free variables form a type in `Type`" would match.

## Previous findings

The previous review had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: the *Needs:* line names `measurable_infinitePi_const`, `deFinettiBarycenter_eq_join_map`, `ProbabilityMeasure.borelSpace`, `instSecondCountableTopology`, `continuous_homDensityOnSpace`, `GraphonSpaceI.instCompactSpace`; the routes reduce to Polishness of the weak topology and continuity of the induced densities.
- C02 — repaired: "of the representation theorems, this roadmap owns only the measurable and topological forms of 9.5" (line 1716), and the ownership list names the 9.5 forms with the standard Borel Giry space (lines 1632–1634).
- N01 — not repaired: 9.5 has no locator; repeated above as N01.
- N02 — not repaired (untouched text): repeated above as N02.

## Verified sound

| Statement | Instances tried | Computed | Claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Route of 9.5: induced density is a signed sum of `Set.Ici F` masses | constant graphon p = 1/2; k = 2, G = ⊥; k = 3, G = one edge | k=2: 1 − 1/2 = 1/2 = 1−p. k=3: 1/2 − 2·1/4 + 1/8 = 1/8 = p(1−p)² | Möbius inversion over graphs on `Fin k` | true | none |
| Route: `sampleGraphOnSpace_Ici` gives `t(F, x)` | statement at the pin | `sampleGraphOnSpace n x (Set.Ici F) = ENNReal.ofReal (homDensityOnSpace F x)` (ExchangeableGraphLaw/Mixture.lean:117) | upper-set mass is the homomorphism density | agrees | none |
| Route: forward map is join ∘ map | statements at the pin | `deFinettiBarycenter π = (π.map fun P => infinitePi fun _ => P).join` (PathLaw/Mixture.lean:60); `measurable_infinitePi_const` (ProductKernel.lean:231) | as written | agrees | none |
| Route: for Polish `α`, weak topology second countable with Giry σ-algebra Borel | instance synthesis with `[PolishSpace α] [BorelSpace α]` | `SecondCountableTopology (ProbabilityMeasure α)` and `BorelSpace (ProbabilityMeasure α)` both synthesize | by the two named instances | true | none |
| "The pins lack the Polishness of the weak topology, and with it the standard Borel instance" | instance synthesis | `PolishSpace (ProbabilityMeasure α)` and `StandardBorelSpace (ProbabilityMeasure α)` both fail | lacking | true | none |
| Route: source compact | instance synthesis | `CompactSpace (ProbabilityMeasure GraphonSpaceI)` synthesizes | compact | true | none |
| `measurable_deFinettiEquiv` (docstring changed, statement not) | `#check`; one-tactic probes | type unchanged, binders `[MeasurableSpace α] [StandardBorelSpace α]` explicit; `fun_prop`, `measurability`, `simp` all fail | "easy half", join of pushforward | docstring true; not padding | none |
| Ownership sentences (lines 1632–1634, 1715–1716) | against 9.5 and the open heads | 9.5 plans exactly these forms; search of `main` and the open heads finds the objects only in this pull request | owned here | consistent | none |

The rows for the untouched statements stand as in the previous review, of `f17d28c`.

- Source locators checked against a text: 0 (the change adds and alters none; the sampled target 9.5 has no locator, the other sampled targets lie in untouched text).
- Library declarations opened at the pins: 13, each by `#check` in a scratch file (the ten Tau Ceti and three Mathlib names of the 9.5 *Needs:* line), plus five instance-synthesis probes.
- Cross-roadmap citations resolved: Exchangeability and DenseGraphLimits (completed; unchanged since the previous review).
- Automatic checks: all passed; supplier order `depcheck: 32 roadmaps, 211 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: exit 0, 78 `sorry` warnings, nothing else; `#check @name` of the three 9.5 theorems shows every binder in its own signature, unchanged.
- Pull-request text: title ("sixteen roadmaps": sixteen folders change), the RandomGraphs bullet (new §9.5, three declarations, both source roadmaps completed and already suppliers), the pin `2fd255d` and "scope … lists are updated" all agree with this head; no heading or declaration is removed and no supplier is added or dropped.
- Changes outside the pull request's own folders: none.

Overlap check: read Exchangeability and DenseGraphLimits (completed), and searched `main` and the open heads, including SaturationAndQuantifierElimination, Forcing, QuasirandomGraphs, FreeGroupsAndLimitGroups, InfinitaryLogic, CountableStructureSpaces and CountableStructureSpacesPartII, for a standard Borel Giry space, the measurability of the de Finetti correspondence and a topology on exchangeable graph laws; nothing shared. The 9.5 objects are owned by RandomGraphs, as its scope now says.

Source independence: changed passages only; 5 passages (the *Needs:* line, the two rewritten routes, the two ownership sentences, the docstring) compared with the pinned Tau Ceti docstrings of the declarations they name, the only texts they rest on, none shared beyond formulas and standard names; no locator added, so the shares are as on `main`; no layer added, removed or reordered, so the arrangement was not compared.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (README summary). Section 9.5 adds measurable and topological forms of the de Finetti and Diaconis–Janson (2008, §5) representations; this rests on the README and the pinned Tau Ceti docstrings.

## Not verifiable

- Kechris 1995, Theorems 17.23–17.24 (Polishness of the weak topology and its Borel σ-algebra): not cited by the README and not opened; named only through the pinned Tau Ceti file.
- The locators of untouched sections in the sample (Layers 0–8, 9.1–9.4, 11): not reopened, the change does not affect them.

Automatic checks set aside as false positives: the lead that four backticked names occur nowhere (they are this roadmap's own declarations, declared in `Suggested.lean`); the lead that seven declarations lost a section binder (untouched declarations; the three 9.5 theorems use no section variable).

## Source issues

- none

## For the human reviewers

- **Scope (placement).** 9.5 (README lines 1226–1272; `Suggested.lean` lines 884–901) places two theorems on Exchangeability's de Finetti correspondence over any standard Borel space, with the standard Borel Giry space, in this graph roadmap; neither mentions a graph. Exchangeability is completed and has no Part II.
