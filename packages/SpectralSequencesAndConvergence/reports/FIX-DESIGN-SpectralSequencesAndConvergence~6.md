# Repair round 6 of the SpectralSequencesAndConvergence design

Review settled: REV-DESIGN-SpectralSequencesAndConvergence~5 (three findings: F01 P2, F02 P3,
F03 P3). Files edited: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json` and
`packages/SpectralSequencesAndConvergence/sources.toml` (one new entry, `bhatt-scholze2015`,
fetched by the sources service from arXiv 1309.1198v2, open repository, certified). No
`Suggested.lean` exists at the design stage.

## REV-DESIGN-SpectralSequencesAndConvergence~5/F01 (P2) — applied differently

7.2: definition "lim-acyclic epimorphic towers" → deleted; `C` is *replete* (Tau Ceti
`TauCeti.IsReplete`). New statement: with countable products, replete ⇔ `CountableAB4Star` and
`lim¹ = 0` on every epimorphic tower (shear-tower route ⇒, kernel-tower route ⇐); enough
projectives ⇒ replete; Mittag–Leffler results "in a replete `C`". 7.3 bullet, 7.4, 7.5, Summary,
Scope, Conventions, contracts, plan likewise.

Verified: at the Tau Ceti pin `TauCeti/CategoryTheory/Limits/Replete.lean` line 91 (`class
IsReplete`: projection to `F 0` of every limit cone of a tower of epimorphisms is epi), 97
(`isReplete_type`), 107 (`epi_π_app`), 118 (`of_reflectsEpimorphisms`), 357 (instance
`countableAB4Star [Abelian C] [HasCountableProducts C] [IsReplete C]`);
`TauCeti/CategoryTheory/Sites/Replete.lean` line 48 (`isReplete_sheaf`). SchemeAndStackFoundations
§2.17 on main (README line 4977–5019) consumes the class and plans *IsReplete.derived_limits*. The
old definition (countable products, `lim¹ = 0` and epimorphic projections on epimorphic towers) is
`HasCountableProducts` plus `IsReplete` plus a `lim¹` clause, and the reviewer's shear tower shows
the clause follows from repleteness. I checked the shear construction: transitions
`[[f_n, π_n], [0, 1]]` are `f_n ⊕ 1` followed by an automorphism; the cone `x ↦ (π_n x, (1 − s)x)`
is compatible since `π_n(1 − s) = π_n − f_n π_{n+1}`, and a cone `(a_n, b)` factors uniquely
through `a = (a_n)` with `(1 − s)a = b`. So the old notion invented a name for Tau Ceti's, and
`CountableAB4Star` was redundant in 7.2, 7.4, 7.5.

Why "differently": the reviewer asked to prove "replete iff every epimorphic tower has
`lim¹ = 0`". The route given proves only ⇒; the reviewer's "lim-acyclic gives replete by
definition" applied to the old definition, which contained the projection clause. For ⇐ the only
argument I have uses exact products: `K_n = ker(F_n → F_0)` is an epimorphic tower (snake lemma:
`0 → coker(K_{n+1} → K_n) → coker f_n = 0`), and the six-term sequence of 7.1 (which needs
`CountableAB4Star`) for `0 → K → F → F_0 → 0` gives `lim F → F_0 → lim¹ K = 0`. I could not prove
that `lim¹`-vanishing alone gives exact products or epimorphic projections, so the theorem states
the equivalence with `CountableAB4Star` on the right-hand side. That side follows from repleteness
by Tau Ceti's instance, so the "iff" holds in both directions as stated. The hypothesis class of
7.4 and 7.5 is unchanged: old ⇔ new.

Also applied as asked: Neeman's sentence (now: by 7.2 an AB4* category with an ML tower of
nonzero `lim¹` is not replete); the module bullet (`ModuleCat.{v} R` replete in every universe
along the forgetful functor, and under `Small.{v} R` by enough projectives); the Tau Ceti and
Mathlib contracts; Scope item for SchemeAndStackFoundations §2.17. Locators added:
bhatt-scholze2015 line 701–702 (Definition 3.1.1), line 755–770 (Proposition 3.1.10, the topos
case of ⇒). A fourth Check was added to 7.2 (Galois modules, a non-replete category).

## REV-DESIGN-SpectralSequencesAndConvergence~5/F02 (P3) — applied

Contract line "§S.1 … of modules, with `DoubleComplex.abutmentFiltration`, `eInftyIsoGr`,
`page_eq_eInfty`, `fiveTerm_exact`" → prose: double complex in an abelian category, column
filtration, `E_∞ ≅ gr`, stabilisation for `r > max(p, q + 1)`, edge morphisms (cited there as
`DoubleComplex.edgeBottom`, `DoubleComplex.edgeLeft`), five-term sequence. 3.6 and 4.6 Examples
name these in prose. Scope: "of modules" → "in an abelian category".

Verified: DerivedModuleAlgebra README on main, line 65 (the cited-names table lists only
`totalCohomology_of_exact_rows`, `edgeBottom`, `edgeLeft`, `spectralSequence_map`) and line
955–1012 (§S.1, "in an abelian category" at line 957–958). `roadmaps resolve` had flagged
`eInftyIsoGr`, `page_eq_eInfty`, `fiveTerm_exact`. Same pattern also fixed in 5.4's Examples
("module double-complex case" → "double-complex case") and in the plan's DerivedModuleAlgebra
supplier entry.

## REV-DESIGN-SpectralSequencesAndConvergence~5/F03 (P3) — applied

5.4 bullet "this contains Tau Ceti's `…exists_mem_range_filtrationAbutmentFiltrationι` … and
DGFloer's theorem" → "the theorem contains DGFloer Layer 1 item 3's classical convergence theorem.
The exhaustiveness step of the route is, for complexes of modules, Tau Ceti's
`…exists_mem_range_filtrationAbutmentFiltrationι`". First Check: the step is Tau Ceti's; the
`ℓ`-adic instance satisfies the step, not the theorem.

Verified at the pin: `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean` line
96–99, sole hypothesis `∀ x : K.X n, ∃ q, x ∈ range (F q).arrow.f n`. 5.4 also needs
exhaustiveness on `K^{n−1}`, bounding below on `K^n` and `K^{n+1}`, and exact sequential colimits.
DGFloer README line 626–636: degreewise lower bounds and exhaustion in every degree imply 5.4's
hypotheses with `I = ℤ`, so that containment stands. Plan 5.4: test reworded, prerequisite
`tauceti:…exists_mem_range_filtrationAbutmentFiltrationι` added.

## The same pattern elsewhere

- F01, the pattern "a hypothesis on `C` invented beside a library class": every occurrence of
  "lim-acyclic", `CountableAB4Star` and "epimorphic towers" in the README and plan was reread. 7.1
  (six-term sequence, completeness through lim¹) and 7.3's main statement use only exact products
  and keep `CountableAB4Star`. 7.2, the 7.3 bullet, 7.4, 7.5 (via "as in 7.4"), Summary, Scope,
  Conventions, How to read the build, Layer 7 Dependencies, and plan 7.2–7.4 and summary now use
  repleteness. The 7.3 bullet is now `TauCeti.IsReplete.epi_π_app` for the tower `m ↦ Q^{s+m}`; its
  `*Needs:*` cites that lemma instead of 7.2. No other Layer cites a tower hypothesis.
- F03, the pattern "a 'contains' claim against a library or roadmap theorem with weaker
  hypotheses": grep for "contain", "is Tau Ceti's", "gives Tau Ceti", "recovers". 4.6 bullet
  (contains `isIso_hom_app_abutment_of_isIso_page`: the reviewer's table and the pinned hypotheses
  agree); 4.6 second Check (finite filtrations, `Filtered/Comparison.lean` line 70–76: `F a = ⊥`,
  `F b = ⊤` give 4.4's hypotheses in every degree, so 4.6 implies it); 5.1 ("this is DGFloer's
  reindexing", a dictionary, not a theorem); 7.5 bullet (DGFloer line 649–654: complete,
  exhaustive, regular, strong under degreewise boundedness, which implies 7.5's hypothesis in
  degrees `n − 1`, `n`). All hold. Only 5.4 was wrong.
- F02, the pattern "a backticked name attributed to another roadmap": `roadmaps resolve` after the
  edits finds no Lean name or citation unresolved.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.2 ⇒ (replete gives `lim¹ = 0`) | `ℤ/ℓ^{n+1}` tower in `Ab`; zero tower; constant identity tower | `(π_0, 1 − s)` onto `F_0 ⊕ T`: `x_0 = a`, `x_{n+1}` lifts `x_n − t_n`; `T = 0`; partial sums split `1 − s` | holds | none |
| 7.2 shear tower is a limit cone | general `F` | `t_n λ_{n+1} = (f_n π_{n+1} + π_n − f_n π_{n+1}, 1 − s) = λ_n`; cone `(a_n, b)` ⇒ `b` constant, `(1 − s)a = b` | holds | none |
| 7.2 ⇐ (AB4* and `lim¹ = 0` give replete) | `F_0 = 0`; `Ab`; Galois modules | `K = F`, target `0`; `Ab` replete, consistent; Galois modules not replete, so AB4* or `lim¹ = 0` fails there: with AB4*, `0 = lim F → μ_ℓ → lim¹(μ_{ℓ^n})`, so `lim¹ ≠ 0` | consistent | reviewer's bare "iff `lim¹ = 0`" replaced by "iff AB4* and `lim¹ = 0`" |
| 7.2 snake step `K_{n+1} → K_n` epi | `F = ℤ/ℓ^{n+1}` | `K_n = ℓℤ/ℓ^{n+1}`, `K_{n+1} → K_n` reduction, onto; `K_0 = 0` | holds | none |
| 7.2 enough projectives ⇒ replete | `Ab`; `Ab^op` (enough projectives, products = direct sums) | `ℤ^(F_0) ↠ F_0` lifted recursively; in `Ab^op` repleteness is injectivity of `X_0 → colim` for monos, true | holds | none |
| 7.2 Mittag–Leffler in replete `C` | zero transitions `ℤ/ℓ`; finite groups; `×ℓ` | pro-zero: `lim = lim¹ = 0`; stable images epimorphic, `lim¹ = 0`; `×ℓ` not ML, `lim¹ = ℤ_ℓ/ℤ` | holds | none |
| Neeman sentence | AB4* category with ML tower, `lim¹ ≠ 0` | replete would force `lim¹ = 0` by 7.2 | not replete, as stated | reworded |
| Module bullet | `ModuleCat.{0} ℤ`; `R : Type 1`, `v = 0` | forget faithful, preserves limits, `forget_preservesEpimorphisms` (EpiMono.lean 67, any `v`); `Small.{0} R` may fail, forget route still applies | holds in every universe | universe widened from `u` to every `v` |
| Galois-module Check | `G = Gal(ℚ̄/ℚ)`, `μ_{ℓ^n}` | open `U`: `χ(U)` open in `ℤ_ℓ^×`, some `χ(g) ≠ 1`, `(χ(g) − 1)x = 0 ⇒ x = 0`; limit `0`, projection `0 → μ_ℓ` not onto | not replete | Check added |
| 7.3 bullet | `Q = 0`; `Q^s = ℤ`, identity | `0`; `lim = ℤ → ℤ` identity | holds | now cites `epi_π_app` |
| 7.4 hypothesis class | old vs new | old ⇒ new (projection clause is `IsReplete`); new ⇒ old (Tau Ceti instance, 7.2 ⇒) | equal | none to the theorems |
| 5.4 bullet / Check | `ℓ`-adic `ℤ` in degree `0`; DGFloer hypotheses | step: `F^0 H^0 = ℤ = H^0`; theorem: `F^s K^0 = ℓ^sℤ ≠ 0`, not bounded below; DGFloer all-degree hypotheses ⇒ 5.4 with `I = ℤ` | step holds, theorem does not apply; containment of DGFloer holds | reworded |
| F02 prose | §S.1 text | stabilisation `r > max(p, q + 1)`, `E_∞^{pq} ≅ FᵖH^{p+q}/F^{p+1}H^{p+q}`, edge morphisms, five-term sequence all at line 968–970 | matches | names replaced |

Elaboration and the `#check` comparison: not run. No `Suggested.lean` exists at the design stage
and this brief gives no Lean command. The new Lean names were checked by hand at the pins:
`TauCeti.IsReplete` and the five Tau Ceti names above (lines given), `ModuleCat.forget_preservesEpimorphisms`
(namespace `ModuleCat`, `Mathlib/Algebra/Category/ModuleCat/EpiMono.lean` line 67), and
`CategoryTheory.Functor.reflectsMonomorphisms_of_faithful` (namespace `CategoryTheory.Functor`, line
158, tagged `to_dual`, so the dual epimorphism instance exists).

## Checks

Dependency check, verbatim:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 219 roadmaps, 1940 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no cross-roadmap citation and no
Lean name found nowhere. The tool reports that it did not check Lean names outside
TauCetiRoadmap on this host; those were checked by hand (above). No README line exceeds 100
characters; no LaTeX delimiters or process words were added.

Gate failures listed in the brief: none.

## For the maintainer

- Ownership: Tau Ceti owns `TauCeti.IsReplete`. SchemeAndStackFoundations §2.17 (on main) and
  CrystallineCohomology §E2.2 (open) state `R lim` and `lim¹` vanishing only for replete topoi.
  EnhancedDerivedSheaves cites §2.17. No roadmap owns the abelian-category characterisation, which
  stays in 7.2 here, beside 7.1's abelian-category `lim¹`; §2.17 is cited as an instance.
- Names other roadmaps might cite: the plan target 7.2 changed from the definition
  `CategoryTheory.Abelian.HasLimAcyclicEpiTowers` to the theorem
  `CategoryTheory.Abelian.isReplete_iff_countableAB4Star_and_limOne_eq_zero`. `roadmaps grep`
  finds no match for the old name, and no roadmap on main or at an open head mentions
  SpectralSequencesAndConvergence. The phrase "lim-acyclic" in CrystallineCohomologyPartII is used
  there independently. Section ids are unchanged.
- A new source key, `bhatt-scholze2015` (arXiv v2, the version read; published in Astérisque 369),
  is recorded in `sources.toml` with `cited_for = ["7.2"]`.
- Ownership against open pull requests was checked with `roadmaps grep` over the indexed open
  heads and main.
