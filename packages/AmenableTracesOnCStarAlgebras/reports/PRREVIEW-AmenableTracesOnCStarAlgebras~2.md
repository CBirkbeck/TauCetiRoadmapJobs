# Review of AmenableTracesOnCStarAlgebras (pull request #2260 at aa781fb)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/README.md:686–703,728–731,745–749` restricts unitality and unit evaluation to unital domains, specifies restriction from the unitization, and computes the nonunital truncations.
- R02 — repaired: `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/Suggested.lean:315–321` quantifies one positive scale before all finite sets and tolerances; README §5.1 matches it, tests twice the identity, and restricts the weak-nuclearity implication to contractions.
- R03 — repaired: `TauCetiRoadmap/AmenableTracesOnCStarAlgebras/README.md:68–71,397–409,753–793` imports the trace state and uniqueness from V0/V3, deletes the independent proof target, and adds agreement on matrix units.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| §1.4 right representation | `M₂,tr₂`; weighted `c₀` | Right `e₁₂ᵒᵖ`: `ê₁₁↦ê₁₂`; `πᵒᵖ(1)=I` in `M₂`; `c₀` has no unit | Unitality correctly conditional | R01 repaired |
| §1.4 product representation and tensor functional | `M₂`; `c₀`, weights `2⁻ⁿ`, `n≥1` | `μ(1⊗1)=1`; `μ(e_m⊗e_m)=1−2⁻ᵐ`; unitized value `μ̃(1)=1` | No unit evaluation on nonunital domain | R01 repaired |
| §1.4 unitization transport and new Check | `c₀`, truncations `m=1,2` | Tensor values `1/2,3/4`; squared vector errors `1/2,1/4`; unitized vector norm squared `1` | Restriction and limiting vector agree | R01 repaired |
| §1.5 imported trace state and uniqueness | Matrix sizes `0,1,2`; `e₁₁,e₁₂` | Unit values `0,1,1`; matrix/operator traces on `M₂`: `1/2=1/2`, `0=0` | V0/V3 own state and uniqueness | R03 repaired |
| §1.5 retained normalized 2-norm | `e₁₁∈M₂`; zero matrix algebra | `‖e₁₁‖₂=1/√2=(1/√2)‖e₁₁‖F`; at size zero both norms are `0` | Imported trace preserves normalization | — |
| §1.5 bimodule vector functional | Sizes `0,2`; `e₁₂⊗e₂₁ᵒᵖ` | Unit-vector norm squared `0,1`; action sends `1↦e₁₁`, giving inner product `1/2=tr₂(e₁₁)` | State requires positive size | Repaired boundary wording |
| §5.1 `IsNuclearMap` | `2idℂ`, zero map, `−idℂ` | Scales `2,1` give error `0,0`; negative identity has error at least `1` at `1` for every positive approximant | General nuclear CP maps distinguished | R02 repaired |
| §5.1 scaling equivalence for contractions | `θ=(1/2)idℂ` | `C=1/2, α=β=id`: error `0`; `C=1, α=θ, β=id`: error `0` | Both formulations admit the contraction | — |
| §5.1 composition with c.p.c. maps | `θ=2id`, precompose `(1/2)id`, postcompose `(1/4)id` | Composite `(1/4)id`; scaled factorization `2·(1/4)·(1/2)id=(1/4)id`, error `0` | Scale survives composition | — |
| §5.1 nuclear c.p.c. implies weakly nuclear | `id_M₂`; `2idℂ` | Identity factorization: norm and ultraweak errors `0`; twice identity has norm `2>1` | New contraction qualifier excludes overclaim | — |
| §5.3 `isUniformAmenableTrace_of_isNuclearMap_id` | `A=ℂ²`, midpoint trace | Diagonal embedding and diagonal expectation compose to identity; multiplicativity defect `0`, recovered trace `(a+b)/2`, dual error `0` | Nuclear premise and conclusion true | Dependent headline retained |
| §5.4 `isAmenableTrace_tfae_of_isNuclearMap` and revised route | `A=ℂ²`, diagonal representation, `τ=pr₁` | `Φ(T)=T₁₁`; GNS map `pr₁`; factorization error `0`; four conditions `(T,T,T,T)` | `C=1` route valid | Dependent headline retained |
| §5.4 codomain control | `C*_r(F₂)`, regular trace | Faithful map into `B(ℓ²F₂)` nuclear; into `L(F₂)` nonnuclear; four trace conditions `(F,F,F,F)` | Positive scaling does not erase codomain distinction | — |

The rows for untouched statements stand as in the previous review of `da19de9`.

- Sources: 5 seeded targets intersecting the changes or their dependencies (§§1.4, 1.5, 5.1, 5.3, 5.4); 10 accessible locator spans checked in 2 cached sources.
- Locator witnesses: brown2006 lines 378, 403, 793, 864, 990, 1038, 1423, 1707, 1925; tikuisis-white-winter2017 line 362; source generality checked against the stated unitization and supplier routes.
- Pins: 5 declarations opened in `Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean:51`, `Mathlib/Analysis/CStarAlgebra/Matrix.lean:101`, `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean:31,52`, `TauCeti/Analysis/Matrix/Frobenius.lean:106`; CP alone does not include contractivity.
- Suppliers: 6 named roadmap contracts resolved on main; changed contracts verified at CStarAlgebras C6.1 and VonNeumannAlgebras V0/V3, also retained by #2242; 0 unresolved cross-roadmap citations, upward edges or cycles.
- Gate: worker gate including build passed; independent gate, targeted Lake build and direct `lake env lean` passed; direct elaboration produced exactly 23 `sorry` warnings and no others.
- Signatures: 46 declarations independently re-elaborated with `#check @name`; types match the recorded head signatures; the changed nuclear predicate retains both C*-algebra/order interfaces and a globally quantified scale.
- Padding: `simp`, `rfl` and `infer_instance` did not close either of the 2 nuclearity-dependent headlines; pinned searches found no single-lemma replacement; the other probes stand from `da19de9`.
- PR text: matches the new 2921-line folder, 23 admitted headlines, 46 declarations and all 3 repairs; 0 removed headings or declarations, 0 supplier additions/removals and 0 outside-folder changes.

Dependency check output: `depcheck: 220 roadmaps, 1955 edges, 0 problem(s)`.

Overlap check: read VonNeumannAlgebras (main and #2242), CompactQuantumMetricSpaces, QuantumFoundations, AnalyticNumberTheoryPartII, BanachSpaceTheory, CStarAlgebras and CStarClassification. Owners: matrix-trace state/uniqueness, GNS and injectivity—VonNeumannAlgebras; nuclear maps, CP maps, tensor products and exactness—CStarAlgebras; AF/UHF theory—CStarClassification; convex closure—BanachSpaceTheory; trace approximation and normalized 2-norm comparisons—this roadmap. CompactQuantumMetricSpaces and QuantumFoundations consume shared foundations; AnalyticNumberTheoryPartII shares no changed target. No conflicting folder revision or dropped cited ID was reported.

Source independence: changed passages only; 8 passages compared with 2 accessible sources, plus the revised contracts against their supplier text; no copied nonmathematical wording or reused material found. Largest share: brown2006, 77 of 101 source-key citations before References. No layer was added, removed or reordered; the independent arrangement assessment of `da19de9` stands. Five settled unavailable texts were not compared directly.

## Not verifiable

- brown-ozawa2008, Chapter 6: settled waiver; direct book text unavailable.
- connes1976, Theorem 5.1: settled waiver; historical locator not directly certified.
- paulsen2002, Chapter 3: settled waiver; background locator not directly certified.
- pedersen2018, Chapter 3: settled waiver; background locator not directly certified.
- kirchberg1993, Theorem 7.5 and Proposition 7.1: settled uncertified; brown2006 lines 1910–1917 provide secondary corroboration only.

## Source issues

- none

## For the human reviewers

- Five source texts remain settled waived or uncertified as listed above; direct wording checks against them were unavailable. The largest source, brown2006, is readable; its contents were compared in the previous review.
