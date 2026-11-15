# Review of MotivicEtaleKTheory (pull request #1470 at d1c5de6)

**Verdict:** accepted

Incremental re-review of 0 changed lines since d1c5de6; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Roadmaps on main, ResolutionOfSingularitiesCharacteristicZero among them, are cited by name", and the open suppliers are left to the generated blocks, which tick #1199.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description: "specialization fails over 𝔽₂" (§2.0b) | rational points of `𝔸¹∖{0,1}` over 𝔽₂, 𝔽₃, 𝔽₄ | 𝔽₂: 2−2=0 points; 𝔽₃: 1; 𝔽₄: 2. Only infinite k gives points in every dense open | as §2.0b states | none |
| Description: universal classes "over perfect fields come from functorial Tate complexes" (§2.0b) | 𝔽₂, ℚ, 𝔽_p(t) | 𝔽₂ finite, so perfect: Tate model; ℚ: both models, agreement target; 𝔽_p(t) infinite imperfect: specialization model. Every field covered | as §2.0b states | none |
| Description: "regular, not merely smooth, schemes over every field … finite fields handled by moving and transfer descent" (§2.3) | extension of degree d of a finite field | restriction then transfer is multiplication by d; d=2: ×2, invertible in ℚ, not in ℤ | rational statement only, as §2.3 states | none |
| Description: "identifies r_D∘ch with the independently normalized Beilinson character" (§§7.1–7.2) | `K₁(ℂ)`, units 2, −1, i; weight 2 | `log|2|=log 2`, `log|−1|=0`, `log|i|=0` on both sides; `ch₂,₂=(−1)^(2−1)c₂,₂/(2−1)!=−c₂,₂` | as §7.2's Checks | none |
| Description: "integral-source multiplicativity" (§7.3) | classes of 2 and t in `CH¹(𝔾_m,1)` | product `i log 2 darg t`; circle period `i log 2·2π=2πi log 2`; exchange sign `(−1)^(1·1)=−1` gives `−2πi log 2` | as §7.3's Checks | none |
| Description: "every twist … never assuming projective compactifications" (§3.4) | p<0; X smooth separated, not quasi-projective | `ℝ(p)=(2πi)ᵖℝ` defined since 2πi≠0; §3.4 uses smooth proper SNC choices, projective ones only for quasi-projective X (README lines 69, 424, 654) | as stated | none |

Rows for the roadmap's untouched statements stand as in the previous review, of d1c5de6.

- Description against the head, sentence by sentence: 4 consumers named (Polylogarithms, BorelRegulators, ColemanIntegration, ZagierConjecturePolylogarithms) each match a bullet of `## Downstream consumers`; the fifth consumer bullet (MixedHodgeModulesAndIrregularHodgeTheory) is covered by "everything else named in the README is a consumer".
- Roadmap names in the README resolved: 17. On main: SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero, EtaleCohomologyFoundations, EnhancedDerivedSheaves, DifferentialGeometry, ComplexKahlerGeometry, AlgebraicTopology, ComplexManifolds, Completed/HodgeStructures. Open suppliers: GeneralAlgebraicKTheory, SchemeKTheoryOperations, KTheoryFiniteLocalFields, MotivesAndAlgebraicCycles, ComplexComparisonPartII — the five unticked entries of the depends-on block. The rest are consumers.
- "`Suggested.lean` declares nothing … its docstring names, layer by layer, the carriers each headline lacks": the file has `import Mathlib`, one docstring with 13 layer bullets and an empty namespace; change against base is 813 insertions, 57 headings, 0 declarations, as the description implies (a new folder of README, `Suggested.lean`, `metadata.toml`).
- "3 independent review rounds and 2 red-team rounds": the package's reports hold three package reviews and red-team rounds 1 and 2.
- Gate at d1c5de6, run again: every check 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: this roadmap at 140, after its last supplier MotivesAndAlgebraicCycles at 93.
- `lake env lean` on `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean`: exit 0, no output. No declaration, so no `#check @name` comparison and no one-tactic probe applies. Outside-folder diff against `origin/main`: empty.
- Remark: the two declared gaps (`gap:smooth-whitney-extension`, `gap:flat-ideal-regular-situation`, same slugs in `design/plan.json` and the README) name DifferentialGeometry Part II; the description's dependency paragraph does not mention them. Declared contracts, no change asked.
- Overlap check: read Polylogarithms, SchemeKTheoryOperations, MotivesAndAlgebraicCycles, BorelRegulators, KTheoryFiniteLocalFields (the overlap lists; none on main); nothing shared beyond the ownership recorded in the previous review (auxiliary complexes and supported regulator: this roadmap §§5.2–5.3, 6.2; Chern classes of a theory: SchemeKTheoryOperations §7.3a).
- Source independence: changed passages only (none in the folder); 3 passages of the description compared with 3 sources (Levine94 line 1210, BF line 905, BKK line 4239), none shared; largest share BF, 74 of 223 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Bloch86 §7 and Beilinson85 §§1–2: uncertified in the manifest, cited by locator only.
- Levine98: waived; certifies nothing here.
- The description's AI-assistance sentence names the tools used; only its round counts could be checked.

## Source issues

- none

## For the human reviewers

- none
