# Review of GL2ModularityLiftingPartII (pull request #2137 at fdda916)

**Verdict:** accepted

No finding. Incremental re-review: the folder is unchanged since the previous review of `fdda916` (0 lines); this round reads the pull request's title and description against the head. The acceptance remains conditional on the 20 declared supplier gaps and on the two named hypotheses the README keeps explicit (Conjecture A at every auxiliary level; H₃(3) at p = 3).

## Previous findings

- none: the previous review, of `fdda916`, accepted with no finding.

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| Description, "determinant-cyclotomic modularity lifting … additional stabilizer hypotheses at p = 3", against §7.4 (README line 1234) | torsion of order p in PGL₂(F), p = 3 and p = 5 | order 3 needs ζ₃ + ζ₃⁻¹ = −1 ∈ F: always, dim H₃(C₃, 𝔽₃) = 1 ≠ 0, so H₃(3) is needed; order 5 needs (−1+√5)/2 ∉ F: none. README: p ≥ 5, det ε, p = 3 under H₃(3) | agrees | none |
| Description, "scalar calculation … Cohen–Macaulay type three", against §8.2 | A = O·1 + πO⁴ inside O⁴ | A/π = k[x₁,x₂,x₃]/(x)², length 1 + 3 = 4, socle spanned by x₁, x₂, x₃: dimension 3 | agrees | none |
| Description, "finite-image theorems over complete Noetherian local coefficient rings", against §7.2 and `minimal_lift_finite_image` | A = k[[t]]; A = O[ε]/ε² | a ring finite over O maps to k[[t]] with image a finite k-domain, so k; without minimality {I + aεE₁₂ : a ∈ O} is infinite, so the hypothesis `IsMinimalLift` carries the statement | agrees | none |

The rows for the untouched statements stand as in the previous review, of `fdda916`.

- Title and description read against the head, sentence by sentence (summary block and prose, 14 sentences): each of the five subjects named (torsion weight-one local–global compatibility, minimal R = T with vexing types, finite image, scalar-Frobenius multiplicity two, conditional Bianchi R = T and lifting) is a README section (§§3.4–3.6, 6.2–6.4, 7.1–7.3, 8.4, 6.6 and 7.4); "all three Frobenius cases" is §3.4; the two downstream uses are the README's Downstream consumers paragraph; the coefficient class is that of Conventions. None contradicted.
- Changes the text must state: the pull request adds the folder (not on main; 1584 insertions, 0 deletions, 0 headings and 0 declarations removed), which the title and the "Roadmap folder" sentence say; no section, headline or supplier is removed.
- Description's validation line against this head: targeted build with `sorry` the only warning (two, at `Suggested.lean` lines 141 and 183, from `lake env lean`); README identifiers missing from the Lean 0; `set_option` 0; sorry'd data 0; outside-folder diff empty. All confirmed.
- Suppliers named in the README against the description's dependency list: 14 open suppliers and IntegralHeckeAndGaloisDeterminants (on main) match the 15 listed; ClassFieldTheory, Chebotarev, ModularForms and RepresentationTheory are on main; TorsionCohomologyInfrastructure §4.6 (README line 889) is cited as a contrast, not consumed.
- Gate re-run at fdda916: every counter 0, OK (the worker's record adds `build=0`). Dependency check, verbatim: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Overlaps recomputed by the worker against 455 open heads: no other pull request changes this roadmap, no cited id is dropped, no second copy on main.
- Seeded sample and source locators: no passage changed, so they stand as verified in the previous review of `fdda916` (30 passages of cg18, wiese14, wiese07, scholze15).
- Remark, no change requested: the standing paragraph of §4.6 (README line 926) still lists the stabilizer and duality hypotheses of Layer 5, which §4.6 does not use.

Overlap check: read SerreWeightAndLevelOptimisation, AutomorphyLiftingBeyondTaylorWiles, GSp4NonregularModularityLifting, GL2ModularityLifting, CompletedCohomologyAndLocalGlobalCompatibility, ModularForms, IntegralIwasawaTheory (scope lists unchanged since the previous review, which read their scopes; the closest-roadmap lists are the same but for IntegralIwasawaTheory, whose subject is disjoint); nothing shared.

Source independence: changed passages only: 0 passages changed, so none compared; largest share cg18, 65 of 71 locators and contents comparison with cg18 independent, both as established in the previous review of `fdda916` (no layer added, removed or reordered).

## Not verifiable

- cg22 (the published correction, pp. 855–856): paywalled and settled as uncertified; cited by its locator only.
- The generated `depends-on` and `merge-order` blocks of the description are outside this check.

## Source issues

- none (no source was reopened this round; the eight issues of the previous review of `fdda916` stand).

## For the human reviewers

- **Licence.** The README cites Wiese 2007, Wiese 2014 and Scholze 2015 (README lines 1365–1367); the package's `sources.toml` records only cg18, cg20, cg22. The three texts were read from arXiv (math/0612318v1, 1102.2302v2, 1306.2070v2).
- **Scope.** The Bianchi theorems (§§6.6–6.8, 7.4) assume Conjecture A at every auxiliary level and, at p = 3, hypothesis H₃(3); the unrestricted scalar results (§§8.2–8.5) assume three declared gaps. Whether conditional targets of this kind belong in the roadmap is a human decision.
