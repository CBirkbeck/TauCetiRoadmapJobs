# Review of ComplexKahlerGeometry (pull request #3027 at c832fa9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 153 changed lines since `74a09b7`. The folder's text is the one the previous review read, so I recomputed the two new sections independently (3.5a, the extension of `∂̄`-equations across analytic sets; 4.2a, the curvature of sub-bundles and quotient bundles), the K6.0 sentence that now takes Nakano positivity from 4.2a, and the sections they rely on (3.3, 3.4, 3.5, 4.2, 7.2), and read every new locator in Demailly's book, Demailly 1982, Skoda 1972 and Griffiths 1970. No finding: both new statements hold with the hypotheses given, and the signs and formulas agree with the sources. The previous review's three small corrections and its format note are not repaired, and there is one new small correction (an open pull request changes the same paragraph with no stated order): four small corrections and one format note, none blocking. Nothing is left for the human reviewers to decide.

## C01 — The second Check of 4.2a calls the quotient curvature "positive", but the value can vanish

A reader who tests the Check with `p = 1`, or with constant `g`, gets `θ_Q = 0` and may think the formula is wrong. In the second Check of 4.2a (line 1049) the value is right: the class of `c` has quotient norm `|g·c|/|g|`, so `Q ≅ O` carries the metric `e^(−log|g|²)` and `Θ(Q) = ∂∂̄ log|g|²`. But `log|g|²` is only plurisubharmonic: for `p = 1` it is pluriharmonic and `θ_Q ≡ 0`, while for `g = (1, z)` on `ℂ` it gives `|w|²|ξ|²/(1+|z|²)²`. What (a) gives is semipositivity, the word the section uses everywhere else. Replace "positive as (a) requires" with "nonnegative, as the semipositivity of (a) requires".

## C02 — The locator Demailly, Chapter V, §14, p. 273 covers less than the sentence it closes

A reader who opens §14 for the definition of a holomorphic sub-bundle by partial holomorphic frames, or for the holomorphic structures on `S` and `E/S`, finds neither: §14 starts from a given exact sequence of holomorphic bundles (demailly-agbook line 13454) and supplies the induced and quotient metrics, the orthogonal projection and the smooth splitting `E ≃ S ⊕ Q` (lines 13465–13475). In 4.2a(a) (lines 989–994) the parenthesis closes the whole sentence. The smallest repair attaches the locator to the clause on the induced metric, `S^⊥` and the quotient metric, and says that the definition of a sub-bundle and the construction of `S` and `Q` as holomorphic bundles are this roadmap's own (or standard).

## C03 — The description does not say what the pull request adds to ComplexKahlerGeometry

The description names this roadmap nowhere: it gives the aggregate ("50 existing roadmaps receive 217 sections") and lists other roadmaps' additions, although ComplexComparisonPartII and SingularHermitianMetricsAndL2Methods now cite this folder's new sections. One sentence would do, for instance: "ComplexKahlerGeometry gains §3.5a (extension of `∂̄`-equations with `L²_loc` solutions across nowhere-dense analytic subsets) and §4.2a (curvature of holomorphic sub-bundles and quotient bundles, with Griffiths' flat indefinite case); K6.0 takes Nakano positivity from §4.2a; no section is renumbered and `Suggested.lean` is unchanged."

## C04 — Pull request #2536 rewrites the same Dependencies paragraph of Layer 4, and no order between the two is stated

Whichever of the two merges second will not apply cleanly, and nothing tells a maintainer which text of the paragraph is intended. Pull request #2536 ("ComplexKahlerGeometry: soft-sheaf acyclicity is taken from SmoothBundlesConnections B6.1") changes the Dependencies paragraph of Layer 4 to cite B6.1 for 4.5; this pull request adds "4.2a's first Check uses 7.2's tautological bundles and metrics" to the same sentence (README lines 1329–1332). A three-way merge of the two heads against the merge base gives exactly one conflict, in that paragraph; the other changes of #2536 (2.5, 4.4, 4.5) do not touch 3.5a or 4.2a. Say in the description which of the two is rebased on the other; the merged paragraph needs both clauses.

## N01 — Griffiths 1969 is cited without a locator

At the end of 4.2a(a) (line 1012) and in the References, Griffiths 1969 carries no section or page. Give one, or say that it is cited for the definition of Griffiths positivity, which is what Demailly, Chapter VII, (6.4) credits it with.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.5a, sign of the weak equation | `u` of type `(p,q)`, `α` of type `(n−p,n−q−1)` | `d(u∧α) = ∂̄u∧α + (−1)^(p+q) u∧∂̄α`, so `∫∂̄u∧α = (−1)^(p+q+1)∫u∧∂̄α`; Demailly's `(−1)^(p+q)` is for `v` of type `(p,q−1)` | agrees | none |
| 3.5a, first statement | `n = 1`, `Z = {0}`, `u = 1/z`, `v = 0`; `Z = Ω` | `1/z ∉ L²_loc`, `∂̄(1/z) = πδ₀ dz̄ ≠ 0`; `Z = Ω` would make the hypothesis empty, excluded by nowhere-density | holds; both hypotheses needed | none |
| 3.5a, cut-off route | `Z ⊂ {z₁ = 0}` | `|∂̄λ_ε| ≤ C/ε` on `ε/2 ≤ |z₁| ≤ ε`, volume `≤ C′ε²`, product bounded; first factor `→ 0` as the measure of `{|z₁| ≤ ε}` does | sound | none |
| 3.5a, second statement | `g = Σ a_k(z′) z_n^k` on a punctured disc; `z̄` | `∫_(0<|z_n|<r)|g|² = 2πΣ|a_k|²∫₀^r ρ^(2k+1)dρ = ∞` if some `a_k ≠ 0`, `k ≤ −1`; `z̄` is `L²` but not holomorphic off `Z` | holds | none |
| 4.2a, Griffiths and Nakano forms | trivial line bundle, weight `e^(−φ)` | `Θ = ∂∂̄φ`, `Θ_(jk̄) = ∂_j∂̄_kφ`; `θ ≥ 0` iff `φ` plurisubharmonic; `⟨a,b⟩ = h(b,a)` matches the Conventions (line 101) | agrees with Demailly VII (6.1)–(6.4) | none |
| 4.2a(a), blocks | square `(D_S, −β*; β, D_Q)` | `SS` block `D_S² − β*∧β`, `QQ` block `D_Q² − β∧β*`; `(β*∧β)_(jk̄) = −β_k*β_j`, `(β∧β*)_(jk̄) = β_jβ_k*` | Demailly V (14.5)–(14.7) | none |
| 4.2a(a), three formulas | expand in coordinates | `θ_S(ξ⊗v) = θ_E − |β(ξ)v|²`; `θ_S(u) = θ_E(u) − |Σβ_ju_j|²`; `θ_Q = θ_E + |Σξ̄_jβ_j*w|²`, and `β(ξ)* = Σξ̄_jβ_j*` | Demailly VII (6.10); no Nakano claim for quotients | none |
| 4.2a route identity | holomorphic `s`; line bundle, `s = 1`, `|s|² = e^(−φ)` | `∂̄_k|s|² = ⟨s, D′_ks⟩`, `Θ_(kj̄)s = −∂̄_jD′_ks`, `Θ_(jk̄)* = Θ_(kj̄)`; line case `∂_j∂̄_k e^(−φ) = e^(−φ)(∂_jφ∂̄_kφ − ∂_j∂̄_kφ)` | holds | none |
| 4.2a(b), flat indefinite case | `V = ℂ²` on the unit disc, `S = span(1,z)`, `k = diag(1,−1)` and `diag(1,1)` | metric `1 − |z|²`: `Θ_(11̄) = (1−|z|²)^(−2) > 0`; `1 + |z|²`: `−(1+|z|²)^(−2) < 0`; `τ = +σ*` on `W` from `k(σs,t) + k(s,τt) = 0` | holds; hypothesis on `W` needed | none |
| 4.2a Check 1, `O(−1) ⊂ ℂ²⊗O` | chart `(1,w)` | `Θ_(11̄)(O(−1)) = −(1+|w|²)^(−2)`, quotient `O(1)`: `+(1+|w|²)^(−2)` | true | none |
| 4.2a Check 2, `Q = O^p/ker g` | `g = (1,z)`; `p = 1` | `θ_Q = |w|²|ξ|²/(1+|z|²)²`; `p = 1` gives `0` | true as semipositive | C01 |
| 4.2a Check 3 | `k_V` positive definite | `β = σ`, `θ_S = −|σ|² ≤ 0` | true | none |
| K6.0, "Nakano positivity is that of 4.2a's form" | trivial line, `φ = |z|²` on `ℂ` | `θ(u) = |u₁|²_h`, the form of 4.2a on `T^(1,0)⊗E` | consistent | none |
| 3.4, 3.5 (sample, cited by 3.5a) | Demailly II (4.31) p. 100; II (4.2) p. 91; II (6.1) p. 105; I (3.28) p. 28 | singular locus analytic; locally bounded functions extend; boundedness near codimension ≥ 2; Hartogs for a compact hole | locators verified | none |
| 3.3 (sample, cited by 3.5a) | pinned `TauCeti.circleLaurentCoeff` | `TauCeti/Analysis/Complex/Laurent/Basic.lean` line 49: one variable, values in `E`; no parameter holomorphy, as 3.5a's sub-target assumes | consistent | none |
| Headline `riemann_extension` (file unchanged) | locally bounded `f` | bounded implies `L²_loc`, so 3.5a's second statement gives it up to a null set | consistent | none |
| 4.2a(a), construction locator | Demailly V §14 p. 273 | §14 begins with a given exact sequence; no sub-bundle defined by frames | over-attributed | C02 |

- Source locators checked against the text: 16 (demailly-agbook V §14, Th. 14.3, 14.5, (14.6)–(14.7), lines 13453–13554; VII (6.1)–(6.4), (6.10), lines 16633–16739; VIII Lemma 7.3, lines 18681–18720; II (4.2), (4.31), (6.1); I (3.28); Demailly 1982 Lemme 6.9, pp. 485–486; Skoda 1972 Lemme 2, pp. 560–561; Griffiths 1970 Lemmas 4.3, 4.5 (p. 137), 4.13 (p. 138), 4.14 and Theorem 5.2 (p. 139)).
- Library declarations opened at the pin: `TauCeti.circleLaurentCoeff` (file and line above); no second fundamental form, Griffiths or Nakano notion in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: DifferentialGeometry 5 and SmoothBundlesConnections B2.2, B3–B4 (supplier contracts, unchanged, on `main`). Consumers at this head cite and do not restate: ComplexComparisonPartII (README lines 5137–6335) and SingularHermitianMetricsAndL2Methods (lines 59, 939, 1087).
- Record audit: the merge base has 8 layers; none is removed or retitled, no item is removed, two sections are added (3.5a, 4.2a). The 8 deleted lines are rewrapped dependency, scope and reference sentences and the K6.0 sentence whose definition now lives in 4.2a.
- Dependency check: `depcheck: 124 roadmaps, 1387 edges, 0 problem(s)`. No upward or cyclic supplier.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: 27 `sorry` warnings, nothing else; the file is unchanged by this pull request, so no signature changed.
- Previous review: no finding to repair; its C01, C02, C03 and N01 stand unrepaired (the folder is unchanged since) and are repeated above.
- Ownership against open work: searched `main` and the open heads for the second fundamental form of Hermitian bundles, Griffiths and Nakano positivity and `L²_loc` extension across analytic sets; no other owner. On `main` the family stated both; here they move to this roadmap and the family cites them.

Overlap check: read ComplexComparisonPartII, DifferentialGeometry, ComplexManifolds, CharacteristicClasses, IndexTheory, RealAnalyticGeometry, SmoothBundlesConnections; ComplexComparisonPartII uses the `∂̄`-extension and the sub-bundle curvature as a consumer, owner ComplexKahlerGeometry (§§3.5a, 4.2a); nothing else shared.

Source independence: changed passages only; 8 passages compared with 4 sources (3.5a's statement and route with demailly-agbook VIII.7.3, Demailly 1982 Lemme 6.9 and Skoda Lemme 2; 4.2a's definitions, statements and route with demailly-agbook V §14, VII §6 and Griffiths 1970 §4), none shared beyond formulas; the cut-off route has the steps of Demailly's short proof, which the argument forces, in other words and with added reasons. Largest share demailly-agbook, 5 of 10 locators in the changed passages; contents not compared (no layer added, removed or reordered).

Research link: 3.5a and 4.2a are inputs of Skoda's division theorem (Skoda 1972) and Demailly's `L²` estimates for semipositive bundles (Demailly 1982); 4.2a(b) is Griffiths' curvature of Hodge bundles (Griffiths 1970). Rests on the README's citations and the sources read.

## Not verifiable

- Griffiths 1969 (in the Kodaira volume): no legal open copy known; it is cited without a locator (N01) and no stated result rests on it.

Automatic checks set aside as false positives: the two names the citation resolver could not find, `TauCeti.Analysis.Distribution.DeltaSeries` and `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`, are module paths that exist at the pinned Tau Ceti, not declarations.

## Source issues

- **Misprint** in demailly-agbook at Chapter VIII, Lemma 7.3, p. 382: the source says only that the set is an analytic subset of the open set; it should require empty interior, since for the whole open set the hypothesis is empty and the conclusion false; affects nothing.
- **Misprint** in demailly-1982 at Lemme 6.9, p. 485: the source omits the same empty-interior hypothesis on the analytic set; it should be required, as the reduction to a regular point inside a hyperplane uses it; affects nothing.
- **Misprint** in demailly-agbook at Chapter V, Th. 14.3, p. 273: the source calls β "the second fundamental of S in E"; it should read "second fundamental form"; affects nothing.
- **Gap** in skoda-1972 at Lemme 2, pp. 560–561: the source reduces to regular points of the hypersurface without extending across its singular locus, and passes from almost every `z′` to every `z′` silently; it should invoke Hartogs in codimension two and continuity of the coefficients; affects the proof.

## For the human reviewers

- none
