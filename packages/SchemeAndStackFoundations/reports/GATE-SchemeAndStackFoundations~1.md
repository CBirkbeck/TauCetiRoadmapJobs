# GATE-SchemeAndStackFoundations~1: answers to the review of `a7c1bf8`

All edits are in `TauCetiRoadmap/SchemeAndStackFoundations/README.md` (§4.10A rewritten, Scope and
ownership, one sentence of §4.10), commit `6180d1ab`. A second commit, `0cb327be`, repairs the gate
items the worker found in `README.md` and `Suggested.lean` outside §4.10A (section "Gate repairs"
below).

## H01 (roed-math) — applied

The final sentence of the smoothness paragraph of §4.10A, which asked for "proper-flat and geometric-connectedness comparisons … including their actual hypotheses", is replaced by stated theorems. For a smooth polarized system, every fibre of `X → Spec A` is geometrically connected iff `X_0 ×_{A/I} κ(𝔪)` is geometrically connected for every maximal ideal `𝔪` (Stacks 0E0N plus: the closure of a prime is connected and contains a maximal ideal ⊇ `I`). For `(A, 𝔪)` local this is the requested form: `X` is smooth projective with connected geometric fibres iff the levels are smooth and `X_k` is geometrically connected. The general statement assumes only `I ⊆ Jac(A)`, which completeness forces, and specialises to the local one. The `k[[t]][u]/(u² − t)` example is now a negative-control Check.

## H02 (roed-math) — applied

"Flatness uses the adic flatness criterion with all level hypotheses" → two stated targets. The first is the adic local flatness criterion with the hypotheses of Stacks Lemma 10.99.11 (0523): `R`, `S` Noetherian, `M` finite, `M/IⁿM` flat over `R/Iⁿ` for all `n ≥ 1`, conclusion `M_𝔮` flat for `𝔮 ⊇ IS`. The second is openness of the flat locus (Stacks Theorem 37.15.1, 0399). The globalisation is spelled out as the review describes, ending with "levels flat ⟺ `X` flat". The pinned Mathlib has neither the criterion nor flat-locus openness: no file in `Mathlib/RingTheory/Flat/` mentions `IsAdicComplete` or `AdicCompletion`. No roadmap on main owns the general statement either: ModularCurves §4D owns flat-locus openness only for finite algebras. So both targets are owned here.

## H03 (roed-math) — applied

Scope and ownership: "Polarized algebraization of formal schemes and a category equivalence for polarized systems are also outside this scope." → "Within that convention this roadmap owns the algebraization of polarized adic systems over a complete Noetherian adic base and the category equivalence … (§4.10A)". The exclusion of topologically locally ringed formal schemes and of independence from ideals of definition is kept. In §4.10, "Algebraization of a polarized adic system, the corresponding category equivalence, and effective formal deformations of curves are outside this subsection" → "… are §4.10A; effective formal deformations of curves are outside this subsection".

## H04 (roed-math) — applied

"compatible with reduction and complete Noetherian base changes satisfying the stated ideal hypotheses" → an explicit base-change paragraph. It takes `φ : A → B` with `(B, J)` Noetherian complete and `φ(I) ⊆ J`, and levels `X_n ×_{Spec(A/I^{n+1})} Spec(B/J^{n+1})` (well defined because `φ(I^{n+1}) ⊆ J^{n+1}`). It asks for a canonical isomorphism of the algebraization with `(X ×_A B, L_B)`, identity and composition coherence, and no `J = IB` or flatness. A Check with `t ↦ s²`, `J = (s)` shows `IB = (s²) ≠ J` is admitted.

## H05 (roed-math) — applied

The construction paragraph now names the uniform argument from the proof of Stacks 089A. The kernels `K_{n+1} = I^{n+1}O_{X_{n+1}}` assemble into a finite-type graded module over the pullback of `gr_I(A)`. Stacks Lemma 30.19.3 (0897) gives one `d_0` with `H¹(X_0, K_n ⊗ L_0^d) = 0` for all `n` and all `d ≥ d_0`. The text says that separate Serre vanishing per `K_n` gives no uniform bound, and that the lifted embeddings are algebraized by Stacks Lemma 30.28.1 (0899).

## H06 (roed-math) — answered

The review's dependency observations hold for the revised text. §4.10A cites only §§0.3, 2.6, 4.7–4.10, JacobianChallenge Layer C and StableReduction Layer 2. It cites neither the open pull request on the full section algebra nor any Picard or surface roadmap. The depcheck below shows no new edge from §4.10A.

## Other repairs in the same section

- The original §4.10A had lost every `§` sign ("adic systems of4.7–4.8", "Stacks tag089A", "StableReduction Layer2", "relative Proj0.3"). The rewritten section restores them. A search of the rest of the README found no other occurrence.
- The prose Checks became a `**Checks.**` bullet list. The "noncompatible equations" Check now uses a correct pair: `V(x)` at level 0 against `V(x − z)` at level 1, which reduces to `[1:1]`, contrasted with `V(x + t·z)`, which does reduce to `V(x)`.
- Ownership: no roadmap on main states Stacks 089A. Open roadmap pull requests (AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, PadicDifferentialEquationsAndRigidCohomology, ModularCurvesPartII) only consume it, so this roadmap, as the scheme-foundations supplier, is the owner.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| Algebraization (089A) | `(ℙ^N_{A/I^{n+1}}, O(1))`; `I = 0` | Algebraizes to `(ℙ^N_A, O(1))`; `Aut O(1)` = `(A/I^{n+1})^×`, resp. `A^×`. For `I = 0`, `X = X_0` | holds; kept as a Check |
| Equivalence | system without a compatible ample bundle | outside the category (needs `L_0` ample) | Check kept |
| Adic flatness criterion | `A = k[[t]]`, `X = Spec k` | `k` is not flat over `k[t]/(t²)` (torsion `t·1 = 0`); `X` is not flat over `A` | consistent; new Check |
| Flat globalisation | `I ⊆ Jac(A)` needed: true by completeness. `A = k[[t]] × k[[t]]` | two maximal ideals, each ⊇ `I` | holds without a local hypothesis |
| Smooth ⟺ levels smooth | `ℙ¹_A` (smooth both sides); `A[u]/(u² − t)` | `X_0 = Spec k[u]/(u²)` not smooth; `X` not smooth (non-reduced closed fibre) | consistent; new Check |
| Geometric connectedness ⟺ closed fibres | `A[u]/(u² − t)`, char ≠ 2 | geometric components: closed fibre 1, generic fibre 2 (reducedness fails, hypothesis excluded). In char 2: 1 and 1. `X = ∅`: 0 on both sides, so both sides false | statement holds with smoothness; negative-control Check added |
| Base change | `φ = id`, `J = I`; `t ↦ s²`, `J = (s)` | identity comparison. `φ(I^{n+1}) = (s^{2n+2}) ⊆ (s^{n+1})`; `IB = (s²) ≠ (s)` | well defined; Check added |
| Uniform vanishing | `X_0 = ℙ^N_k`, `A = k[[t]]` | `K_n ≅ O_{X_0}` for the trivial tower; `H¹(ℙ^N, O(d)) = 0` for `d ≥ 0`, so `d_0 = 0` | consistent |
| Hypersurface Check | `F = x³ + y³ + z³ + t·xyz`, char ≠ 3 | Fermat cubic smooth over `k`; hypersurface flat over `k[t]/(t^{n+1})` | smooth at every level |
| Incompatible-equations Check | `V(x + t)` (old draft), `V(x − z)` | `x + t ≡ x` mod `t` (compatible); `V(x − z)` mod `t` = `[1:1] ≠ [0:1]` | old draft wrong, corrected before commit |

Sources read at the locators cited: Stacks 089A, 0897, 0899 (Cohomology of Schemes), 0E0N, 0399 (More on Morphisms), 0523 (Algebra), 01V9 (Morphisms), all from the Stacks project open PDFs. `sources.toml` was not edited (outside this job's files), and no text is missing.

Commit `6180d1ab` did not touch `Suggested.lean`. §4.10A's one named target, `polarized_adic_system_algebraize`, is marked "specified in this README only", the convention §4.10 uses for `grothendieck_existence_fullyFaithful`. The declarations changed by the gate repairs are listed below.

## Gate repairs (commit `0cb327be`)

Each gate item, the repair, and how its pattern was swept. All of these items were already on the
head `a7c1bf8`; none comes from §4.10A.

- **imports=1.** Old → new: `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested` and the two now
  unused imports `TauCeti.CategoryTheory.Exact.Abelian` and `TauCeti.CategoryTheory.GrothendieckGroup.Exact`
  are removed. The one use of the roadmap import, `Curve.isFiniteLocallyFreeOfRank`, used to
  abbreviate AlgebraicVectorBundles' predicate. It is now a native `def`: every point has an open
  `U` with `(Scheme.Modules.restrictFunctor U.ι).obj E ≅ SheafOfModules.free (ULift (Fin r))`.
  The README's Scope bullet, supplier contract, Layer 3 conventions and §3.3 *Lean:* line now
  describe it as the local form of the owner's predicate.
- **sorry-data=25 → 0.** Three defs now have sorry-free bodies:
  - `Formal.levelIncl`: the square proof is `simp only [quotIncl, quotMap, Category.comp_id, ← Spec.map_comp, ← CommRingCat.ofHom_comp, Ideal.Quotient.factor_comp_mk]`.
  - `Formal.IsAlteration.functionFieldMap`: the specialization `f (genericPoint S') ⤳ genericPoint S` follows from `IsGenericPoint.image` and the `DenseRange` of a dominant map. The same proof replaces the `by sorry` specialization inside the statement of `Curve.vectorBundleDegree_pullback`.
  - `Chow.RatEquiv`: now `AddSubgroup.closure` of the same set. That set is already a subgroup (empty family, disjoint union of two locally finite families, `r ↦ r⁻¹`), so the subgroup is the same.

  The following are deleted together with everything that mentions them:
  - §0.29: `absoluteFrobenius` and its 40 dependants. The pinned Mathlib has no scheme Frobenius morphism, and a body needs locality of the `p`-power map on stalks. `SchemeCharP` and its three theorems stay.
  - `Spaces.smallEtale_compose`.
  - §2.18: the two sorry'd instances that `Scheme.Modules.restrictFunctor` is additive and preserves finite limits, and with them `derivedRestrict*`, `derivedHomPresheaf`, `derivedHom_isSheaf`, `DerivedGluingData`, `DerivedGluingSolution`, `derivedObject_gluing` and `restrictedGluingData`. The pins have neither instance. `DQCohPlus` and its inclusion are also deleted, since no remaining statement used them.
  - §4.8: `Scheme.formalCompletion` and `completionFunctor`, whose thickening conditions are theorems. `grothendieck_existence` is restated on an `AdicThickeningSystem 𝔛` with closed immersions `j n : 𝔛.X n ⟶ X` such that `(j n).ker = I ^ (n + 1)` and `𝔛.ι n ≫ j (n + 1) = j n`. Its compatibility uses Mathlib's `pullbackComp`/`pullbackCongr` along these maps.
  - §5.7: the four sorry'd closure instances, `finitelyPresentedExact`, `finiteLocallyFreeExact`, `G0`, `K0`, `K0.det`, `K0.toG0`, both `K0.toG0_*` theorems and `HasResolutionProperty`. The exact structures need extension closure, which the pins do not prove.

  The module docstring now has the required form and names the three headlines that cannot be stated at the pins (§0.29, §2.18, §5.7) and what each lacks. The README marks the corresponding names in italics as "specified in this README only", the README's own convention.
- **sorry-examples=101 → 0.** All admitted examples are deleted, with their comments and
  `attribute … in` lines. Two proved examples remain: `fixed_of_henselian` and the valuative
  criterion. All 21 README *Lean:* lines that announced Checks "as `example`s" are corrected, as is
  the §0 introduction ("two proved `example`s").
- **readme-ids-missing=15 → 0.** The flagged §0.30 API and Check names, and `isTrait_powerSeries`,
  are set in italics, the README's mark for names specified only there. One flagged name is
  Mathlib's (`Mathlib/AlgebraicGeometry/Properties.lean:73`); it is now written
  `AlgebraicGeometry.isReduced_of_isReduced_stalk`. A sweep over every declaration that left
  `Suggested.lean` removed the remaining backticked claims (§§0.24–0.26 *Needs*, the Layer 0 table,
  §1.10, §2.18–§2.19, §4.8, §4.10, §5.7, §5.11).
- **tex=65 → 0.** §0.29 is rewritten with the formulas in code spans (`X^(p/S)`, `F_(X/S)`,
  `𝔽_{p²}`). The other hits were code spans that wrap across a line break, which the gate reads as
  prose. 38 such spans were joined onto one line, plus a few that open at the end of the previous
  line, and `M_{g,n}` in the Knudsen reference is now a code span. A check against the old text found
  no list item, table row or heading merged into another line.
- **depcheck=2 → 0.**
  - *UPWARD to AlgebraicCurves (#278).* The edges come from §3.2 *Needs* ("Layer 7 (comparison only)"), the Layer 3 and Layer 5 Dependencies and §5.11 *Needs* ("Layer 8"). All of them, and the "From AlgebraicCurves" supplier sentence, are removed. Scope now says that the comparisons with the function-field forms are AlgebraicCurves 12E's. §5.11's base change of the genus to `𝔽̄_q` cites §3.1 (`genus_baseChange`) instead.
  - *CYCLE with ModularCurves.* ModularCurves 4D consumes §0.12 (ModularCurves README, the *Needs* line citing `Henselization.algebra`), so all 11 edges from here to ModularCurves are cut by moving or rerouting each input:
    - The strict henselization moves down into §0.10. It is the colimit over triples `(S, q, α)`, i.e. §0.12's étale neighbourhoods with a residue embedding (Stacks, Lemma 10.155.2 (04GP), Definition 10.155.3 (04GQ), read at the locator).
    - The relative Grassmannian `Gr(E, d)` of a locally free `E` moves down into §4.14 (Nitsure 2005, §1, arXiv pp. 5–9, read at the locator).
    - Layer 1's effective descent of affine schemes is rerouted through §1.1's `qcoh_fpqc_descent` (descent of quasi-coherent algebras).
    - §1.23's affine finite quotients now cite Tau Ceti `TauCeti.AffineInvariantQuotient.quotient`.
    - §4.15's coarse quotient now cites §1.23 `finite_quotient_coarse`.
    - The 0B "conventions" (finite locally free, group objects in `Over S`) are stated inline.
    - The 7D `ArtinianTestAlgebra` comparison is declared a comparison on ModularCurves' side.

    The Supplier contracts lose the "From ModularCurves" sentence, and Scope records each move.

`#check` comparison: this job may run no Lean command other than the module build, so no scratch
`#check` file was elaborated. The five changed declarations were compared with their README
statements by reading the elaborated module. That module built without errors; the
`declaration uses sorry` warnings are its only warnings. The comparison found no missing binder:
- `grothendieck_existence` carries `[IsNoetherianRing A.carrier]`, `[IsProper f]` and `[∀ n, IsClosedImmersion (j n)]` explicitly.
- `isFiniteLocallyFreeOfRank` mentions no section variable.
- `levelIncl`, `functionFieldMap` and `RatEquiv` keep their signatures.

Ownership against open pull requests: `roadmaps grep` was not rerun for the two moved notions. The
Grassmannian of a locally free sheaf is planned by ModularCurves 0G on main, which comes later than
this roadmap; the strict henselization is planned by ModularCurves 4D. Both moves duplicate a
statement of a later roadmap, as the merge-order rule requires, and ModularCurves can import them
from here.

### Adversarial pass on the statements changed by the gate repairs

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| `grothendieck_existence` (restated) | `I = 0` (support all of `X`); `X = ∅`; `𝔛.X n = V(I^(n+1))` with the subscheme inclusions | `I = 0`: `V(I^(n+1)) = X` for all `n`, coherent formal modules are coherent modules, `M = 𝓜.F 0`. `X = ∅`: every module is `0`, `M = 0`. Subscheme inclusions satisfy `ker = I^(n+1)` and `ι ≫ j = j` | hypotheses satisfiable; `j` determines `𝔛.X n ≅ V(I^(n+1))`, so not vacuous |
| `levelIncl` square | `n = 0` | `Spec(A/I) → Spec(A/I²) → Spec A` equals `Spec(A/I) → Spec A`: `factor ∘ mk_{I²} = mk_I` | proved |
| `functionFieldMap` specialization | `f = 𝟙`; `f` dominant non-surjective (`𝔸¹ ∖ 0 → 𝔸¹`) | `f(η_S') = η_S` in both (the closure of the image of `η` is the closure of the dense range) | proved from `DenseRange` |
| `RatEquiv` as closure | empty family; two families `J`, `J'` | sum `0`; the sum of the two cycles is the cycle of `J ⊕ J'` (a union of two locally finite families is locally finite); `−α` from `r⁻¹` | closure equals the set |
| `isFiniteLocallyFreeOfRank` | `r = 0`; `r = 1`; `X = ∅`; wrong model "rank `≤ r`" | `r = 0`: `free (Fin 0)` is the empty coproduct `0`, so `E = 0`. `r = 1`: locally `O`. `X = ∅`: vacuous, as for the owner's predicate. `O ⊕ 0` on a two-point disjoint union with `r = 1` fails at the second point (stalk `0 ≇ O`) | agrees with the owner's predicate (local freeness of rank `r` implies finite presentation) |
| §0.10 strict henselization | `R = k` a field; `R` already strictly henselian | `R^sh = k^sep` (étale `k`-algebras with an embedding into `k^sep`); `R^sh = R` | matches Stacks 04GP (2), (5) |
| §4.14 `Gr(E, d)` | `d = r`; `d = 1`, `E = O^r` | `Gr(E, r) = S` (the only rank-`r` quotient is `E`); `Gr(O^r, 1) = ℙ^(r−1)_S` (`Grass(r, 1) = ℙ^(r−1)`, Nitsure §1) | consistent with `quot_test_grassmannian` |

Sources read for these repairs: Stacks 04GP, 04GQ (Algebra, open PDF); Nitsure 2005 (arXiv
math/0504590v1). `needs-references.toml`: nothing missing. `sources.toml` is outside this job's
files and was not edited.

## Build

`lake build TauCetiRoadmap.SchemeAndStackFoundations.Suggested`: `Build completed successfully (9085 jobs).`
The only warnings are `declaration uses sorry` (76).

## Gate

```
gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Depcheck

```
depcheck: 148 roadmaps, 997 edges, 0 problem(s)
```
