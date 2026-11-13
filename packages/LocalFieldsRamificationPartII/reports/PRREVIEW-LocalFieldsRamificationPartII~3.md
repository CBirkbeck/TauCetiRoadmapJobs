# Review of LocalFieldsRamificationPartII (pull request #2258 at e8e92d9)

**Verdict:** accepted

Incremental re-review of the 62 lines changed since `9712531`. No findings.

## Previous findings

- R01 — repaired: “Prove `module_finitePresentation_of_flat_of_isDomain`: for every domain `A`, finite-type `A`-algebra `B` and finite `B`-module `M` flat as an `A`-module, with compatible `A`- and `B`-actions, `M` is finitely presented over `B` (Stacks, Proposition 38.13.10(2), tag 053G).” `hA` gone from Suggested.lean:87–92; README:37–38, Suggested.lean:30–31 and :73, the §1.5 title and the description updated.

## Verified sound

| Statement | Instances tried | Computed input / left side | Computed output / right side | Result; change |
|---|---|---|---|---|
| `module_finitePresentation_of_flat_of_isDomain` (new Check, README:838–841) | `A = k[x,y]`, `B = A[T]/(xT)`, `M = B/(T)` | `x·T = 0`, `T ∉ (xT)`: `B` not flat; `M = A[T]/(T) ≅ A` free, flat; finite | Finitely presented: `B --·T--> B → M → 0`, 1 generator, 1 relation | Agrees; Check true and discriminating |
| Module headline, previous R01 instance | `A = k[x,y]`, `B = M = A` | Not Prüfer; flat, finite | Finitely presented, 1 generator, 0 relations; now in scope | Agrees |
| Module headline, flatness of `M` | Valuation ring `A` of `ℂ_p`, `B = A`, `M = A/𝔪` | `M` torsion, not flat | Not finitely presented (`𝔪` not finitely generated) | Hypothesis needed and present |
| Module headline, domain hypothesis | `A = B = ∏_ℕ 𝔽₂`, `M = A/⊕_ℕ 𝔽₂` | `M` flat (absolutely flat ring), cyclic; `A` not a domain | Not finitely presented (annihilator `⊕_ℕ 𝔽₂` not finitely generated) | `IsDomain` needed and present |
| Module headline, degenerate cases | `B = 0`; `A = k` a field | `M = 0`; `B` Noetherian | Finitely presented (subsingleton); finitely presented (finite over Noetherian) | Agrees |
| Module route (README:810–815) | `C = A[T] → B = A[T]/(xT)`, `I = (xT)`, `M = C/(T)` | Every `M_q` a localization of free `A`; `U = Spec C`, `g = 1`; `C --T--> C → M → 0` | `⊗_C B`: `B --T--> B → M → 0`; `IM = 0` | Agrees with the Check and with stacks-more-flatness lines 2024–2026 |
| Second route, flat ⇔ torsion free (README:818–823) | `A = k[x,y]`, module `(x,y)`; `A = ℤ_(p)`, `ℤ_(p)/(p)` | Torsion free; torsion | Not flat (at `(x,y)`: 2 generators, rank 1, not free); not flat | Step needs Prüfer, as restricted |
| Valuation-ring case = Stacks 15.26.6 | stacks-more-algebra lines 2906–2909 | Valuation ring, finite type, finite `M`; (1) `B` flat, (2) `M` flat | `B` finitely presented; `M` finitely presented over `B` | Agrees with README:818–820 |
| Locator 38.13.10(2) | stacks-more-flatness lines 2020–2026 | Domain, finite type, finite `M` flat over the base | `M` finitely presented over `S` | Agrees with README:807–810, Suggested.lean:83–86 |

The rows for untouched statements stand as in the previous review, of `9712531`.

- Source locators checked against the text: 3 (stacks-more-flatness lines 2001–2005 and 2020–2026; stacks-more-algebra lines 2906–2919). None of the 15 seeded sample targets falls in a changed passage (§1.5 is not sampled).
- Library at the pin: `infer_instance`, `simp`, `exact Module.finitePresentation_of_finite B M` (needs `IsNoetherianRing B`) and `exact?` all fail on the module headline. `Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal` is at Mathlib/RingTheory/Flat/TorsionFree.lean:125. Tags 053G, 053E and 05IL do not occur in the pinned Mathlib or Tau Ceti.
- Signatures: ran `#check @` on both Layer 1 theorems in a scratch copy. Each elaborated type equals its README statement (README:787–789, :807–810), with flatness on `M`, `IsScalarTower A B M`, no lost binder and no `hA`. 16 declarations.
- Citers of §1.5 agree with the change: §2.1 (README:884), §5.4 (README:1617), Layer 1 Examples and Dependencies, the Mathlib contract (README:223–230) and References (README:1865–1875).
- Ownership: `roadmaps grep` for 053G, 05IL, 38.13.10, Raynaud–Gruson 3.4.6–3.4.7 and both the old and the new module-theorem names finds only this roadmap. The old name `module_finitePresentation_of_flat_of_valuationRing_localization` is cited nowhere.
- Gate: the worker's run passed every check, including the build. A rerun here gave `… outside-folder=0 source-material=0 OK`. Dependency check: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: 9 `sorry` warnings and nothing else.
- Outside-folder changes: 0. Pull-request text: the description's §1.5 sentence matches this head (both headlines over an arbitrary domain, the flat-locus theorem and its local input owned here, the Prüfer route kept as a second route). The change adds and drops no supplier.
- Remark, no change asked: the Lean layer comments (Suggested.lean:73) name only the part of each layer that the file states, not the README layer title, as Layers 0 and 2 already do.

Overlap check: read AdicCoefficientsAndComparisonsPartII, EtaleDualityAndPerverseSheavesPartII, LocalFieldsRamification, QuadraticFormInvariantsPartII, DiamondEtaleCohomology, RamificationOfCompleteDiscretelyValuedFields and PadicExtensionFamilies. The only object the change adds is the general-domain module theorem. AdicCoefficientsAndComparisonsPartII's flat finitely presented statements concern flattening by blow-up and relative curves, and the others state no finite-presentation result. Nothing is shared.

Source independence: changed passages only. 5 passages compared (the “Owned here” sentence, the module paragraph and its route, the opening of the second route, the new Check, the Suggested.lean docstring) with 2 sources (stacks-more-flatness, stacks-more-algebra). The longest shared run is 4 words, forced by the statement. Largest share: temkin17, 53 of about 98 locators. The change adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- rg71, Corollaire 3.4.7: settled as uncertified. The statement was checked against stacks-more-flatness lines 2020–2023 instead.
- serre-cg: settled as uncertified, and the change does not touch it.

## Source issues

- none

## For the human reviewers

- aid25 is cited as arXiv:2511.07177v1 with no published venue (TauCetiRoadmap/LocalFieldsRamificationPartII/README.md, References). §1.1 also cites the published temkin17 statement. The publication and licence status of this preprint remain for human review.
