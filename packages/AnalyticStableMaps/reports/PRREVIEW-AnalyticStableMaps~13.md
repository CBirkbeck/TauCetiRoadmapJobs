# Review of AnalyticStableMaps (pull request #2529 at 509fbfd)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 11 lines changed since `1da2f12` finds the one finding of the previous review repaired and no new one. §7.3 now states the local product projection for `s_(J∖I) : X_J → E_(J∖I)` near `ψ_IJ⁻¹(X_I^reg)`, which is what Pardon's Proposition 9.2.6(ii) and Theorem B.1.1 (with `E′ = E_I ⊆ E_J = E`) prove, and item 5 of the module docstring of `Suggested.lean` and the pull request's description say the same. There are no small corrections and no format notes; nothing new is left for a human to decide.

## Previous findings

- R01 — repaired: "for `I ⊆ J` the section `s_(J∖I) : X_J → E_(J∖I) = E_J/E_I` is, near every point of `ψ_IJ⁻¹(X_I^reg)`, locally the projection `ℝ^(v + dim E_I) × E_(J∖I) → E_(J∖I)`"; the docstring item 5 matches.
- N01 — repaired: "the real dimension of the open set of smooth conics in `ℙ⁵`: `dim_ℝ ℙ⁵ = 10`".

The repair introduces no new problem: the new sentence of §7.3 agrees with §9.1's "local `E_(J∖I)` product projections, transported from §7.3", with the Check "for `v + dim E < 0` the regular locus is empty", and with the *Needs* lines of §8.2 and §9.1 that cite §7.3.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §7.3 regularity (headline 5), as restated | product curve `g=1`, `dim F=2`, `dim E_J=2`: `I=∅` and `I=J` | `I=∅`: point not in `X_∅^reg`, no claim; `I=J`: target `E_∅=0`, chart `ℝ^(0+2)`, the 2-dimensional family fits | holds; old counterexample excluded | none |
| §7.3, same | lines in `ℂP²`, `I=∅`, `dim E_J=2` | `X_J` locally `ℝ⁴×ℝ²`; fibre of `s_J` over 0 is 4-dimensional, the dual plane, `= d_0 = 4` | holds | none |
| §7.3 against the source | pardon13 9.2.6(ii), B.1.1(ii)–(iii) | total dimension `(v+dim E_I)+dim E_(J∖I) = v+dim E_J`, B.1.1(ii) with `E=E_J`; `E/E′=E_J/E_I=E_(J∖I)`; locus `ψ_IJ⁻¹(X_I^reg) ⊆ X_J` | matches (pardon13 lines 4269–4280, 6182–6187, 6253–6259) | none |
| §2.9 conic Check | conics in `ℂP²` | `d_0 = (2−3)·2 + 2·6 = 10`; smooth conics are the complement of the discriminant cubic in `ℙ⁵`, open, real dimension 10 | holds | none |
| `Suggested.lean` docstring item 5 | compared with §7.3 line 967 | same locus `ψ_IJ⁻¹(X_I^reg) ⊆ X_J`, same map `s_(J∖I)`, same dimension `v + dim E_I`; prose only, no declaration changed | agrees | none |

The rows for the untouched statements stand as in the previous review, of `1da2f12`.

- Source locators checked against the text: 3, all in pardon13 (Proposition 9.2.6 at lines 4269–4283; Theorem B.1.1 at lines 6182–6188 with the `E′`-regular locus at 6154–6178; the derivation of 9.2.6(ii) from B.1.1 with `E′ := E_I ⊆ E_J = E` at lines 6253–6259). No target of the seeded sample falls in a changed passage.
- Library declarations opened at the pins: none new; the changed passages name only `Continuous.homeoOfEquivCompactToT2`, unchanged and verified in the previous review.
- Cross-roadmap citations: the changed passages add none; §9.1's citation of ImplicitAtlases §1.1 for the submersion axiom now receives the statement in the form it transports.
- Automatic checks at this head all passed. Dependency check: `depcheck: 200 roadmaps, 2192 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 106, 129, 162) and nothing else. The diff changes only the module docstring, so the signatures, the headline list and the one-tactic probe stand as in the previous review; no `set_option`, no sorried data.
- Pull request text: the title and description match the head. The description states the §7.3 correction with its locus and target, the rewording of the conic Check, and the restated docstring item 5; four headings added, none removed, no declaration added or removed. The diff outside the roadmap folder is empty.
- Overlap check: read HeegaardFloer (main and open), DGFloer, AlgebraicGromovWittenTheory, TeichmullerGeometry, MotivicStructuresInModuliOfCurves, GromovWittenTheory, ComplexCurveModuli; the changed passages share nothing new. As before, the embedded-sphere normal operator is owned by HeegaardFloer F2.6e and cited by §0.7.
- Source independence: changed passages only; 2 passages compared with 1 source (pardon13 Proposition 9.2.6 and Theorem B.1.1), none shared beyond the formula of the local model; largest share pardon13, about 40 of 85 locators; the diff adds, removes and reorders no layer, so the contents comparison stands: independent.
- Research link: Layers 5–9 construct the implicit atlas on stable maps of Pardon (2013, §9.2 and Appendix B); Layer 3 is the compactness theorem of Ivashkovich–Shevchishin (1999); §0.6–§0.8 and §2.24 are the normal operator of Wendl (2010) and the super-rigidity of Wendl (2023). Rests on the README's References and the texts read.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*: not available from an open source; cited by locator (untouched by this change).
- Ivashkovich–Shevchishin, Invent. Math. 136 (1999): paywalled, settled as uncertified; cited by locator (untouched by this change).
- Robbin–Ruan–Salamon, Math. Z. 259 (2008): paywalled; cited by locator in the References only.

## Source issues

- none

## For the human reviewers

- The previous report asked whether the §7.3 sentence, identical on main, should be repaired here or separately. This head repairs it here (`TauCetiRoadmap/AnalyticStableMaps/README.md` line 967) and the description says so; nothing remains to decide.
