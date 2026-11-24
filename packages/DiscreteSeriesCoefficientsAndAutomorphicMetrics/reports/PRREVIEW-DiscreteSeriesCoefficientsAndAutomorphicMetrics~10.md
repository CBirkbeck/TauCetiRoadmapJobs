# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 251 changed lines since `aecb53a`. Every added label and revised statement was checked against the supplier sections it cites at this head, against the cached sources (Mumford 1977, Harish-Chandra 1953, Thorne 2012, Hecht–Schmid 1975, Müller 1989, and two arXiv texts) and by computation; the build and the dependency check are clean. The correction of 10.1 and 10.2 is right (Mumford's Main Theorem 3.1 assumes the representation kills the unipotent radical, and no invariant metric on the adjoint bundle of `X(N)` is good), but the revised statements keep the hypothesis that `J` is unitary on the whole stabiliser `K_∞`, which no representation giving a summand of the Hodge bundle satisfies when the centre of `G` has a split real part, so they miss the cases that the new labels, a Check and the downstream paragraph apply them to (one finding, P2). There are three small corrections and no format notes, and one question is left for the human reviewers (the corollary convention).

## R01 (P2) — The revised 10.1 and 10.2 still require `J` to be unitary on the whole stabiliser `K_∞ ⊂ G(ℝ)`, which excludes the Hodge-bundle summands they are applied to whenever the centre of `G` has a split real part

Four passages apply the theorems to bundles outside these hypotheses, so a reader cannot get those uses from the statements as written: the new Labels paragraph (lines 30–33), which gives [FormalProof] a case of 10.1 and 10.2 "for the Hodge metrics of the unitary Shimura varieties of the family"; the new method labels of 10.1 and 10.2 (lines 497, 527); the second Check of 10.2 (line 559), on the datum `GL₂ × GL₂` with the characters giving `ω`; and the revised Downstream consumers paragraph (line 571), where ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties uses 10.1 and 10.2 for the summands `Lie_σ`.

The stabiliser `K_∞` is taken in `G(ℝ)` (Conventions, line 21; the quotient `Γ∖(G(ℝ) × J)/K_∞` of AutomorphicBundles §0.7), so it contains the real points of the centre. For `GL₂`, every algebraic character of the parabolic that gives `ω` (that is, `O(−1)` on `ℙ¹`) is `diag(a, d) ↦ aᵐdⁿ` with `m − n = ±1`, so the scalar `t ∈ ℝ_{>0}` acts by `t^{m+n}` with an odd exponent: not unitary, and `J` has no `K_∞`-invariant inner product. On the moduli of principally polarised abelian schemes with `𝒪_E`-action used by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (its setting, line 78; a similitude group), the scalars `t ∈ ℝ_{>0}` in the centre act on `Lie(A)`, hence on `Lie_σ`, by `t`. Mumford's hypothesis is on the compact stabiliser in the group acting on the domain (mumford-1977 lines 672–679), which these bundles satisfy once the centre is removed.

The smallest repair would replace "unitary on the stabiliser `K_∞`" by "unitary on `K_∞ ∩ G(ℝ)¹`", with `G(ℝ)¹` the common kernel of `|χ|` over the `ℚ`-rational characters `χ` of `G`, and `h` induced by a `(K_∞ ∩ G(ℝ)¹)`-invariant inner product, in the headline (4), in 10.1, in the parenthesis of 10.2, in the Downstream consumers sentence and in the docstring of `Suggested.lean`. This works because `G(ℝ)¹` acts transitively on `X`, it contains every arithmetic subgroup of `G(ℚ)` (`χ(γ)` is then a rational unit at every prime, hence `±1`), and `K_∞ ∩ G(ℝ)¹` is compact when `Z_G(ℚ)` is discrete in `Z_G(𝔸_f)`, which holds for `GL₂` and for unitary similitude groups. Alternatively, keep the hypothesis and restrict the labels, the Check and the downstream sentence to data whose centre is compact at infinity, which excludes the family's PEL varieties. AutomorphicBundles §5.3a, of which 10.1 is stated to be a corollary, carries the same hypothesis; its own review covers it.

## C01 — The method label of 8.3 attributes the finite-dimensional step identity to a theorem that states a different formula

Lines 403–405 cite "the theorem of Perelomov and Popov (1968), stated in Bufetov and Gorin, Theorem 1.6" for `d(λ + e_s) = d(λ)·∏_{s′≠s}(λ_s + 1 − λ_{s′})/(λ_s − λ_{s′})` on finite-dimensional representations. That theorem (arXiv:1311.5780v3, Theorem 1.6 and (1.9), p. 8) gives the scalar by which `Tr(Eᵖ)` acts. Its weights are `∏_{j≠i}(l_i − l_j − 1)/(l_i − l_j)` with `l_i = λ_i − i`, which are the ratios `dim V_{λ−e_i}/dim V_λ`. For `N = 2`, `i = 1` the weight is `(λ₁ − λ₂)/(λ₁ − λ₂ + 1)`, whereas the ratio for `λ + e₁` is `(λ₁ − λ₂ + 2)/(λ₁ − λ₂ + 1)`.

For finite-dimensional representations the identity as written is Weyl's dimension formula, already in the *Needs:* of 8.3 (RepresentationTheory/LieHighestWeight Layer 6). The label would cite that, or say that the weights of Perelomov–Popov's formula are these ratios for the dual of the standard representation; the References entry (line 663) would change with it.

## C02 — The origin label of 7.5b calls the section "definitions and conventions", but it also asks for five proofs

Line 286 labels 7.5b "definitions and conventions", and the Labels paragraph (line 29) says its definitions carry only that label. The section, however, asks to prove five statements: well defined, adjoint, composition, integrality and Hecke equivariance. These carry neither an origin nor a method label, although the pull request's description says every section that states something to prove carries both. Either label the five clauses (for instance as this roadmap's own formulation, with a method label if [FormalProof] proves them), or say in the Labels paragraph why they carry none.

## C03 — Two origin labels name published work without naming a work or a locator

Line 192 (6.8a) says the bound is "adapted from the classical convergence of Poincaré series on bounded symmetric domains" but names no result. Line 452 (9.1) credits the compactness on the cuspidal spectrum to Gelfand and Piatetski-Shapiro, who have no entry in References. Each label should name the work with a locator; alternatively, 6.8a could be labelled this roadmap's own formulation.

## Questions for the author

- The Labels paragraph (lines 30–33) says [FormalProof] has a statement of every section except the definitions of 7.5b, including 7.5c (trivial stabilisers) and 10.1 (Hodge metrics). Neither section names a declaration, though, and the [FormalProof] reference (line 664) lists the eleven targets that do without these two. Which declarations are the statements of 7.5c and 10.1? I did not open the formal proof's repository.
- The origin label of 8.3 calls the formula published (Harish-Chandra 1966; Atiyah–Schmid 1977), and the Labels paragraph does not list 8.3 among the roadmap's own formulations. Do these sources state the formula for a connected reductive `G` with split centre `A_G` and the compact dual containing `K`, or only for semisimple groups with finite centre? I could not read either text (the first is recorded as uncertified, the second resolves only to a paywalled page).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.1, main's hypothesis | `SL₂`, `X(N)`, `J` = adjoint (`Sym²⊗det⁻¹`), `K`-invariant forms `(a,b,c)` | canonical frame Gram `D·M·D`, `D = diag(y⁻¹,1,y)`; `N = MΛM⁻¹` has `N₂₁ = 8i`, `N₃₂ = −i` at `(1,1,1)`; nonzero for all five tried | connection entries `~∂y`, Poincaré norm `~y → ∞`: main's form false | none (head adds hypothesis) |
| 10.1, `Ω¹` clause | `J = (𝔤/𝔮)^∨` | `[𝔭⁻, 𝔭⁺] ⊂ 𝔨_ℂ ⊂ 𝔮`, so `𝔭⁻` acts by `0` on `𝔤/𝔮` | inside new hypothesis | none |
| 10.1/10.2, unitary on `K_∞` | `GL₂`, `J` giving `ω`; similitude PEL datum, `J = Lie_σ` | centre `t ∈ ℝ_{>0}` acts by `t^{m+n}`, `m−n = ±1`; on `Lie_σ` by `t` | no `K_∞`-invariant inner product | R01 |
| 10.2, Check on `X(N)` | `κ = (2−2g−c)/2`, `O(−1)` on `ℙ¹` | `deg ω = κ·(−1) = (2g−2+c)/2`; AutomorphicBundles §5.3b `v = (2g−2+c)/2 = −κ` | consistent with corollary line | R01 (datum) |
| Headline (4) | 10.1, 10.2, `Suggested.lean` docstring | same two hypotheses in all three | consistent | R01 applies |
| 7.5a, corollary line | AdelicAlgebraicGroups §4.5a | its `A_G` (line 1292) = largest `ℚ`-split central torus of `Res G` = `A_∞`; `GL₁/ℚ`: mass `1/2` both | special case | none |
| 7.5a, duality Check | `M = ℚ`, form `p·xy`, `∇ = Δ = ℤ` | `∇^∨ = p⁻¹ℤ`; (ii) with `s = 1`; (i) needs `p ∣ s` | true | none |
| 7.5a, Thorne label | thorne-2012 lines 1472–1503 | weighted pairing perfect when no stabiliser has order-`l` element; definite unitary `G` | supports label | none |
| 7.5b | label against content | five Prove clauses; Check `K_k 1 = 1/2` for `Γ = {±1}` | label incomplete | C02 |
| 7.5c | one class, `Γ = {±1}` | trivial `1 = ½ + ½`; sign `0 = ½ − ½`; central form `2·½·1 = 1` | true | none |
| 8.1, origin and method | hc-1953 lines 971–979, 1713–1715 | Lemma 34, p. 228: permissible, finite isotypic dimension; `Σ tᵏCᵏ(B+k)ᵏ/k!` converges for `|t| < 1/(Ce)` | supported | none |
| 8.2, origin | hc-1953 lines 1723–1728, 1817–1819; NoncompactQuantumSymmetry Layer 3 item 3 | Thm 5 p. 228, Thm 8 p. 231; item 3: connected semisimple, finite centre, admissible unitary | supported | none |
| 8.3, Bufetov–Gorin | Thm 1.6, `N = 2`, `i = 1` | weight `(λ₁−λ₂)/(λ₁−λ₂+1) = dim V_{λ−e₁}/dim V_λ`; README's `λ+e₁` ratio `(λ₁−λ₂+2)/(λ₁−λ₂+1)` | mis-attributed | C01 |
| 8.3, van Haastrecht–Zhang | arXiv:2412.18382v2 §4 | constant `c_G` of Harish-Chandra's formula fixed by Schur orthogonality, scalar holomorphic discrete series | supports label | none |
| 2.4b method against 8.3 | `n = 2` | `r₁ = (μ₁−μ₂+1)/(μ₁−μ₂)` = `d(μ+e₁)/d(μ)` from `∏|μ_a−μ_b|` | consistent | none |
| 2.4b, Hecht–Schmid | hecht-schmid-1975 lines 121–133 | (1.4): `⟨Λ+ν, β⟩ > 0` for all weights, noncompact `β` ⇒ discrete-series characters; (1.5) splitting | supports label | none |
| 6.8, method | lowest type `λ₀`, root `β` of `𝔭⁺` | `‖λ₀−β+2ρ_c‖² < ‖λ₀+2ρ_c‖²` ⟺ `⟨λ+ρ, β^∨⟩ > 1`; here `≥ 2` | true | none |
| 6.8, origin | AutomorphicFormsOnReductiveGroups §6.8a | semisimple `G`; `holomorphicDiscreteSeries_lowestWeight` stated there | resolves | none |
| 6.8a, method | `p = q = f = 1` | `2fn² = 8`; ratio `4^{2fn²−s} < 1` ⟺ `s > 8` | consistent | C03 (label) |
| 9.1, corollary and method | AutomorphicSpectralTheory §6.4a; Hilbert–Schmidt step | identical hypotheses; `sup|Tφ| ≤ C‖φ‖` ⇒ `Σ‖Te_n‖² ≤ C²·vol` | true | none |
| 9.1, Müller | muller-1989 lines 2107–2117 | Corollary 8.8 on printed p. 84, `K`-finite test functions | supported | C03 (Gelfand–PS) |
| 10.1, origin | mumford-1977 lines 672–682 | `σ` of compact `K`, extended to kill `P⁺`; Main Thm 3.1 on p. 256 | supports new hypothesis | none |
| 10.2, origin | mumford-1977 lines 902–912 | Thm 3.2, p. 262: `P⁺`-trivial, constant `(−1)^{dim X}·vol` | supported | none |
| 2.4a, Check (labels only) | `U(1,1)`, `log cosh t ≥ min(t²/4, t/8)` | `t = 0.5`: `0.1201 ≥ 0.0625`; `t = 1`: `0.4338 ≥ 0.125`; `t = 4`: `3.307 ≥ 0.5` | true | none |

- Source locators checked against the text: 16 (mumford-1977 5, hc-1953 4, hecht-schmid-1975 2, muller-1989 2, thorne-2012 1, arXiv:2412.18382v2 §4, arXiv:1311.5780v3 Theorem 1.6).
- Library declarations opened at the pins: `FDRep.average_char_eq_finrank_invariants` (Mathlib/RepresentationTheory/Character.lean:214), `ContRepresentation` (Mathlib/RepresentationTheory/Continuous/Basic.lean:55), `LieAlgebra.Orthogonal.indefiniteDiagonal` (Mathlib/Algebra/Lie/Classical.lean), `TauCeti.OperatorIdealFamily.traceClass` (TauCeti/Analysis/OperatorIdeal/Family/TraceClass.lean).
- Cross-roadmap citations resolved (14): AdelicAlgebraicGroups §4.5a; AutomorphicFormsOnReductiveGroups §§6.8a, 7.5, 7.5a (with `classSetInner`, `classSetInner_independent`, `classSetPairing_perfect`); AutomorphicSpectralTheory §6.4a; AutomorphicBundles §§0.5, 0.7, 5.3a, 5.3b; NoncompactQuantumSymmetry Layer 3 item 3 (main); SingularHermitianMetricsAndL2Methods §§5.1–5.5; the citations of 10.1 and 10.2 in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and SingularHermitianMetricsAndL2Methods.
- Record: the README at `aecb53a` against the head: 6 layers and 13 sections, all kept under their ids with their statements; no layer retitled; no Lean declaration removed.
- Automatic checks: all passed except the check for files changed outside the roadmap folder (see below). Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`. No file outside the 92 roadmap folders and the family index changed.
- Elaboration: `lake env lean` of `Suggested.lean` gives no output and no warning. The file declares nothing, so no `#check` comparison applies; its docstring's change matches the revised 10.1 and 10.2.
- Exact rational-arithmetic computation of the connection matrix of invariant metrics on the adjoint bundle, for five `K`-invariant inner products.
- Ownership against open pull requests: checked against the 124 listed heads; none changes this roadmap or drops an id it cites.

Overlap check: read AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheoryPartII, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, BesselPoincareSeriesAndGramBounds. Shared: holomorphic discrete series as lowest-weight modules (owner AutomorphicFormsOnReductiveGroups §6.8a for semisimple `G`, 6.8 keeping the reductive form) and the class-set inner product (owner AutomorphicFormsOnReductiveGroups §7.5a). The other roadmaps consume this one or share nothing.

Source independence: changed passages only; 16 passages compared with 7 sources, none shared beyond forced phrases (longest run six words, the hypothesis that no stabiliser has an element of order `ℓ`); largest share mumford-1977 and hc-1953, 12 each of about 59 locators; arrangement not compared (no layer added, removed or reordered).

Research link: Layer 10 is Mumford's non-compact Hirzebruch proportionality (Mumford 1977), Layer 8 the formal-degree formula of Harish-Chandra (1966) and Atiyah–Schmid (1977), Layer 9 Müller's trace-class theorem (1989, 1998), Layer 7 Gross's algebraic modular forms (1999); the family uses them in the formal proof announced by Alpöge (2026). Rests on the README's References and on mumford-1977, hc-1953 and muller-1989.

## Not verifiable

- Sun 2007 (origin of 2.4a; method of 8.3, §7): the Cambridge Core landing page is on a host in no licence class; no legal copy found.
- Zuckerman 1977 (2.4b): JSTOR only; no legal copy found.
- Gould 1980 and 1985 (method of 2.4b): the sources service found no legal copy.
- Harish-Chandra 1955–1956 and Knapp 1986, Ch. VI (6.8): a subscription journal and a book; not fetched.
- Gross 1999 (7.5a, 7.5c), Harish-Chandra 1966 (8.3), Müller 1998 (9.1): recorded as uncertified in the manifest.
- Atiyah–Schmid 1977 (8.3): the DOI resolves only to a paywalled page.
- Dixmier–Malliavin 1978 (9.1) and Harris 1989 (10.1): no legal copy (the publisher's page refused access).
- Flensted-Jensen 1980 (2.4a): not fetched (JSTOR).
- What the method labels say about [FormalProof]: its repository was not opened.

Automatic checks set aside as false positives: the check for files changed outside the roadmap folder flagged 114 files in the 91 other roadmap folders and the family index that this pull request changes; all are folders the pull request owns, and nothing outside them changed.

## Source issues

- none

## For the human reviewers

- The convention of README lines 37–43 (also stated on the family's index page) lets a section be proved, while a general theorem is not yet in the library, as [FormalProof] proves its special case, and replaced later by the deduction from the general theorem. The project's rule is to prove the general theorem and deduce the special case.
