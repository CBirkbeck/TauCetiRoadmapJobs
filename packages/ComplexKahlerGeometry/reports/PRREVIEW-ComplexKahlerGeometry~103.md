# Review of ComplexKahlerGeometry (pull request #3027 at 477bb48)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 153 changed lines since `aecb53a`. I checked the two new sections in full, along with every passage the change touches: the extension of `∂̄`-equations across analytic sets (3.5a), the curvature of sub-bundles and quotient bundles (4.2a), the K6.0 sentence that now takes Nakano positivity from 4.2a, and the dependency, scope and reference lines. I computed the signs and both curvature formulas, ran degenerate and indefinite examples, and read every new locator in Demailly's book, Demailly 1982, Skoda 1972 and Griffiths 1970. No finding: both new statements hold with the hypotheses given. There are three small corrections (a Check that says "positive" where the value can vanish, a locator that claims more than §14 of Demailly's Chapter V contains, and a description that does not mention this folder's additions) and one format note, none blocking. Nothing is left for the human reviewers to decide.

## C01 — The second Check of 4.2a calls the quotient curvature positive, but it vanishes in degenerate cases

A reader who tests the Check with `p = 1`, or with a constant `g`, finds `θ_Q = 0` and may think the formula is wrong. In the second Check of 4.2a (line 1049), the value `θ_Q = |w|²·Σ_(j,k)(∂_j∂̄_k log|g|²) ξ_j ξ̄_k` is correct: the quotient norm of `c` is `|c|/|g|`, so the metric is `e^(−log|g|²)` and `Θ(Q) = ∂∂̄ log|g|²`. But `log|g|²` is only plurisubharmonic. For `p = 1` the sub-bundle `S` is zero and `log|g₁|²` is pluriharmonic, so `θ_Q ≡ 0`. For `g = (1, z)` it is `|w|²|ξ|²/(1+|z|²)² > 0`. What (a) gives is semipositivity. Replace "positive as (a) requires" with "nonnegative (semipositive), as (a) requires".

## C02 — The locator Demailly, Chapter V, §14, p. 273 is attached to a construction that §14 does not contain

A reader who opens §14 for the definition of a holomorphic sub-bundle by partial holomorphic frames, or for the construction of the holomorphic structures on `S` and `Q = E/S`, will not find either. §14 starts from a given exact sequence `0 → S → E → Q → 0` of holomorphic bundles (demailly-agbook line 13454). What it supplies is the induced and quotient metrics, the orthogonal projection onto `S` and the orthogonal splitting `E ≃ S ⊕ Q` (lines 13465–13475). In 4.2a(a) (lines 989–994) the parenthesis covers the whole sentence. The smallest repair would attach the locator to the clause on the induced metric, `S^⊥` and the quotient metric, and say that the definition of a sub-bundle and the construction of `S` and `Q` as holomorphic bundles are standard (or this roadmap's own).

## C03 — The description does not say what this pull request adds to ComplexKahlerGeometry

A reviewer of this folder cannot tell from the description that it revises ComplexKahlerGeometry, a roadmap on `main`. The prose gives only the aggregate ("50 existing roadmaps receive 217 sections") and lists other roadmaps' additions by name, although ComplexComparisonPartII and the family's SingularHermitianMetricsAndL2Methods now cite this folder's new sections. One sentence would do, for instance: "ComplexKahlerGeometry gains §3.5a (extension of `∂̄`-equations with `L²_loc` solutions across nowhere-dense analytic subsets) and §4.2a (curvature of holomorphic sub-bundles and quotient bundles, with Griffiths' flat indefinite case); K6.0 now takes Nakano positivity from §4.2a; no section is renumbered."

## N01 — Griffiths 1969 is cited without a locator

At the end of 4.2a(a) (line 1012) and in the References, Griffiths 1969 carries no section or page. A section or page would help. Alternatively, say it is cited for the definition of Griffiths positivity, which is where Demailly, Chapter VII, (6.4) credits it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.5a, first statement (weak `∂̄u = v` extends across nowhere-dense `Z`) | sign; `Z = Ω`; `n = 1`, `Z = {0}`, `u = 1/z` | `d(u∧α)` gives `∫∂̄u∧α = (−1)^(p+q+1)∫u∧∂̄α`; `Z = Ω` makes the hypothesis vacuous (excluded); `1/z ∉ L²_loc`, `∂̄(1/z) = πδ₀ dz̄` | holds; `L²` and nowhere-density both needed | none |
| 3.5a route, cut-off estimate | `n = 1`, `Z = {0}` | `∫|∂̄λ_ε|² ≤ (C/ε²)·πε²·C′`, bounded; `∫_(|z₁|≤ε)|u∧α|² → 0` by dominated convergence | sound | none |
| 3.5a, second statement (`L²_loc` function holomorphic off `Z`) | `w^(−m)` on a punctured disc; `z̄` | `∫_(0<|w|<r)|w|^(−2m) = 2π∫₀^r ρ^(1−2m)dρ = ∞` for `m ≥ 1`; `z̄` is `L²` but not holomorphic | holds | none |
| 4.2a, Griffiths and Nakano forms | `O(1)` with Fubini–Study metric; trivial line, weight `e^(−|z|²)` | `Θ_(11̄) = (1+|z|²)^(−2) > 0`; `Θ_(11̄) = 1`, and with `ω = dx∧dy`, `a = 2` | sign agrees with Demailly VII (6.1)–(6.2) | none |
| 4.2a(a), curvature of `S` and `Q` | square the block matrix | `SS` block of `D_E²` is `D_S² − β*∧β`, so `Θ(S) = Θ(E)↾S + β*∧β`; `(β*∧β)_(jk̄) = −β_k*β_j` | matches Demailly (14.6)–(14.7) | none |
| 4.2a(a), the three formulas | expand in coordinates | `θ_S(ξ⊗v) = θ_E − |β(ξ)v|²`; `θ_Q = θ_E + |Σξ̄_jβ_j*w|² = θ_E + |β(ξ)*w|²`; no Nakano claim for quotients | holds; matches Demailly VII (6.10) | none |
| 4.2a(b), flat bundle with indefinite form | `V = ℂ²` over the unit disc, `S = span(1, z)` | `k = diag(1,−1)`: metric `1−|z|²`, `Θ_(11̄) = (1−|z|²)^(−2) > 0`; `k = diag(1,1)`: `−(1+|z|²)^(−2) < 0` | holds; the hypothesis on `W` is needed | none |
| 4.2a, Check 1, `O(−1) ⊂ ℂ²⊗O` | Fubini–Study metrics | `Θ_(11̄)(O(−1)) = −(1+|w|²)^(−2)`, `Θ_(11̄)(O(1)) = +(1+|w|²)^(−2)`; `Q ≅ O(1)` isometrically through `det ℂ²` | true | none |
| 4.2a, Check 2, `Q = O^p/ker g` | `g = (1, z)`; `p = 1` | quotient norm `|c|/|g|`; `θ_Q = |w|²|ξ|²/(1+|z|²)²`; `p = 1` gives `θ_Q = 0` | true read as nonnegative | C01 |
| 4.2a, Check 3 | `k_V` positive definite on `V` | `Θ(V) = 0`, `β = σ`, `θ_S = −|σ|² ≤ 0` | true | none |
| K6.0, "Nakano positivity is that of 4.2a's form" | trivial line, weight `e^(−|z|²)` on `ℂ` | `θ(u) = |u₁|²_h`; `a|u|²_(ω⊗h) = a|u₁|²_h/2`, so `a = 2`, as K6.0's Check | consistent | none |
| 3.5 (sample), Riemann and Hartogs extension | Demailly II (4.2) p. 91, (6.1) p. 105, I (3.28) p. 28; `1/z` | locally bounded extension; boundedness near codimension ≥ 2; Hartogs for a compact hole | locators verified | none |
| 6.1 (sample), K6.0 locators beside the change | Demailly VII (1.1) p. 329, (1.2) p. 330 | commutation relations with torsion `τ`; Bochner–Kodaira–Nakano with torsion terms | verified | none |
| Headline `riemann_extension` (Suggested.lean line 273) | locally bounded `f` | bounded implies `L²_loc`, so 3.5a's second statement gives it up to a.e. agreement | consistent; file unchanged | none |
| 4.2a(a), construction locator | Demailly V §14, p. 273 | §14 opens with a given exact sequence (line 13454); no sub-bundle defined by frames | over-attributed | C02 |

- Source locators checked against the text: 15. Demailly's book V §14, Th. 14.3, 14.5, (14.6)–(14.7) (pp. 273–275); VII (6.1)–(6.4), (6.10) (pp. 338–340); VIII Lemma 7.3 (pp. 382–383); II (4.2), (6.1); I (3.28); VII (1.1)–(1.2). Demailly 1982 Lemme 6.9 (pp. 485–486). Skoda 1972 Lemme 2 (pp. 560–561). Griffiths 1970 Lemmas 4.3, 4.5, 4.13, 4.14 (pp. 137–139) and Theorem 5.2 (p. 139).
- Library declarations opened at the pin: `TauCeti.IntegrableTopForm` and `TauCeti.integralTopForm` (`TauCeti/Geometry/Manifold/DifferentialForm/Integration/TopForm.lean` lines 46 and 518: rough real-valued top forms, compact support); `TauCeti.circleLaurentCoeff` and the annulus Cauchy formula (`TauCeti/Analysis/Complex/Laurent/Basic.lean` lines 53–167). No Laurent expansion theorem at the pin, as 3.5a's own sub-target assumes. No second fundamental form or Nakano notion in Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: DifferentialGeometry Layer 5 on `main` (integration of top forms); SmoothBundlesConnections B2.2 and B3–B4 (supplier contract on `main`). Consumers of the new sections at this head: ComplexComparisonPartII (README lines 5137–5800) and SingularHermitianMetricsAndL2Methods (lines 59, 938, 1086). Both cite them and do not restate them.
- Record audit: the merge base has 8 layers; none is removed or retitled, no item is removed and no id changes subject. The 8 deleted lines are rewrapped sentences in the dependency, scope and reference paragraphs, plus the K6.0 sentence whose definition of Nakano positivity now lives in 4.2a.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`. No upward or cyclic supplier.
- Automatic checks: the worker's run passed everything. My rerun reports zeros everywhere except the out-of-folder files, all in folders this pull request owns.
- Elaboration: `lake env lean` on `Suggested.lean` gives 27 `sorry` warnings and nothing else. The file is unchanged by this pull request and adds no declaration.
- Ownership against open work: searched the open pull requests and `main` for the second fundamental form of Hermitian bundles, Griffiths and Nakano positivity, and `L²_loc` extension across analytic sets. No other owner. On `main` the family stated the extension itself; this pull request moves it here, and the family now cites §3.5a.

Overlap check: read ComplexComparisonPartII, Hyperfunctions, DifferentialGeometry, ComplexManifolds, CharacteristicClasses, RealAnalyticGeometry and SmoothBundlesConnections. ComplexComparisonPartII shares the `∂̄`-extension and sub-bundle-curvature objects as a consumer, so the owner is ComplexKahlerGeometry (§§3.5a, 4.2a). Nothing else is shared.

Source independence: changed passages only. 8 passages compared with 4 sources (3.5a's statement and route against Demailly VIII.7.3, Demailly 1982 Lemme 6.9 and Skoda Lemme 2; 4.2a's definitions, statements and route against Demailly V §14 and VII §6 and Griffiths 1970 §4). No run longer than four words is shared. The cut-off route follows the logical order of Demailly's ten-line proof, which the argument forces, in the author's own words. Largest share: demailly-agbook, 5 of 9 locators in the changed passages. Contents not compared, since no layer is added, removed or reordered.

Research link: 3.5a and 4.2a are the inputs to Skoda's division theorem (Skoda 1972) and to Demailly's `L²` estimates for semipositive bundles (Demailly 1982). 4.2a(b) is Griffiths' curvature of Hodge bundles (Griffiths 1970). Layers 5–8 carry the Hodge theory of compact Kähler manifolds and the Iwasawa-manifold computations (Angella 2012). Based on the README and the sources read.

## Not verifiable

- Griffiths 1969 (*Hermitian differential geometry, Chern classes, and positive vector bundles*, in the Kodaira volume): the sources service found no legal open copy. It is cited without a locator (N01) and is not the basis of any stated result.

Automatic checks set aside as false positives: when rerun on this head without the pull request's folder list, the outside-the-folder check lists 116 files, all in the other roadmap folders that this pull request changes as its own (the worker's run, which knows those folders, passed). The two names the citation resolver could not find, `TauCeti.Analysis.Distribution.DeltaSeries` and `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`, are module paths that exist at the pinned Tau Ceti, not declarations.

## Source issues

- **Misprint** in demailly-agbook at Chapter VIII, Lemma 7.3, p. 382: the source says only that the set is an analytic subset of the open set; it should require empty interior (for the whole open set the hypothesis is vacuous and the conclusion false); affects nothing.
- **Misprint** in demailly-1982 at Lemme 6.9, p. 485: the same omission of the empty-interior hypothesis on the analytic set; it should be required, as the proof's reduction to regular points in a hyperplane uses; affects nothing.
- **Misprint** in demailly-agbook at Chapter V, Th. 14.3, p. 273: the source calls β "the second fundamental of S in E", without the word "form"; it should read "second fundamental form"; affects nothing.
- **Gap** in skoda-1972 at Lemme 2, pp. 560–561: the source reduces to regular points of the hypersurface without arguing extension across its singular locus, and passes vanishing for almost every `z′` to every `z′` silently; it should invoke Hartogs across codimension two and continuity of the coefficients; affects the proof.

## For the human reviewers

- none
