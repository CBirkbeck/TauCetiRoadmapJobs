# Review of AutomorphicBundles (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 139 changed lines since `592bdb1`. The change adds 5.3a (Mumford's theorem that invariant metrics are good relative to the canonical extension) and 5.3b (Hirzebruch–Mumford proportionality), and rewrites five passages around them. Both statements, their hypotheses and their Checks hold on every case I computed, and the locators match Mumford 1977. There are no findings, so this folder is accepted. There are five small corrections and one format note, none blocking: a sentence in the 5.3a proof sketch that, read literally, contradicts its own Check; an unneeded "simple normal crossings" hypothesis; a citation of Harris 1989 with no locator; the `Suggested.lean` docstring; and the pull request description. Nothing is left for a human to decide.

## C01 — In the proof sketch of 5.3a, read literally, the inverse metric is said to be a polynomial in `log|q_j|`, and the section's own Check contradicts this

An implementer following the sketch would look for an exact polynomial formula that does not exist. What Mumford proves, and what goodness asks for (ArakelovGeometryAndAbelianHeights §5.1c (i)), is a bound. The sketch says, in the second step at line 1620: "Its entries, and those of its inverse, are polynomials in `log|q_j|` with bounded coefficients". For `Ω¹` on `X(N)`, the Check of the same section gives the Gram matrix `(log|q|)²`. Its inverse, `(log|q|)^(−2)`, is not a polynomial in `log|q|`. The sentence is true only if a "bounded coefficient" may absorb it, and then it is a growth bound in disguise. Mumford's estimate (Mumford77, p. 259) bounds `h(e′_i, e′_j)^{±1}` by `(Σ l_i(u) + C)^{2N}`.

A version that is plainly true: "Its entries, and the inverse of its determinant, are bounded by `C·(Σ_j |log|q_j||)^m`."

## C02 — 5.3a assumes *simple* normal crossings and credits such models to ShimuraCompactifications Layer 2 with a smooth projective `Σ`, which that roadmap says is not enough

At lines 1595–1597 the boundary is required to be "a divisor with simple normal crossings (ShimuraCompactifications Layer 2 with a smooth projective `Σ`)". ShimuraCompactifications §2.6 says otherwise. A smooth cone system at neat level gives normal crossings only in the local sense, and global simple normal crossings needs, in addition, Pink's condition 7.12(∗), obtained by the refinement of its 9.20. Neither source nor supplier needs "simple". Mumford's Main Theorem 3.1 is stated for the smooth Ash–Mumford–Rapoport–Tai compactifications with normal crossings boundary (Mumford77, pp. 254–256). ArakelovGeometryAndAbelianHeights §§5.1a–5.1d are stated for normal crossings divisors. As written, 5.3a excludes some smooth projective `Σ` for no gain, and the parenthetical sends the reader to a supplier that does not provide the hypothesis.

The smallest repair is to drop "simple". Alternatively, keep it and cite ShimuraCompactifications §2.6 with Pink's condition. 5.3b inherits the setting and loses nothing either way: Mumford notes (p. 262) that the extensions pull back under refinement.

## C03 — Harris 1989 is cited in 5.3a without a locator, and it supports the one step Mumford's paper does not cover

At lines 1628–1629, `[Harris89] (canonical extensions)` has no theorem or page. Mumford's Main Theorem 3.1 is for bundles equivariant under a semisimple adjoint group (Mumford77, p. 254). Here `V(J)` is equivariant under `G(ℝ)` for a reductive `G`, and its canonical extension in 5.3 is glued from the boundary frames of 5.1. Identifying that extension with Mumford's, as the first step of the sketch asserts ("the canonical frames of 5.1 are the holomorphic frames invariant under `U(F)_ℂ`"), is what Harris's paper is cited for. Please give the theorem number and page. I could not read the paper (see below).

## C04 — The docstring of `Suggested.lean` does not mention 5.3a–5.3b

In `TauCetiRoadmap/AutomorphicBundles/Suggested.lean`, lines 29–31, the Layers 5–6 bullet of the module docstring lists "canonical extensions, fan independence and logarithmic comparisons". The guide in the README (lines 75–77) and Scope and ownership now name Hirzebruch–Mumford proportionality among this layer's results. If the author counts it as a headline result, one clause would record that it is not statable at the pins: the pinned Mathlib and Tau Ceti have no toroidal compactifications, canonical extensions or Chern classes of holomorphic bundles.

## C05 — The pull request description names neither this folder's two new sections nor its two new suppliers

The description says: "The additions create 12 new supplier relations between general roadmaps." It names three of them. A reader of this folder's change cannot learn from it that AutomorphicBundles gains §§5.3a–5.3b, or that it now uses ArakelovGeometryAndAbelianHeights §§5.1a–5.1d and CharacteristicClasses C4.1–C4.2. A sentence such as this would fix it: "AutomorphicBundles gains §§5.3a–5.3b (Mumford's theorem that invariant metrics are good relative to the canonical extension, and Hirzebruch–Mumford proportionality), with ArakelovGeometryAndAbelianHeights §§5.1a–5.1d and CharacteristicClasses C4.1–C4.2 as new suppliers; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 cite them as corollaries."

## N01 — "the `G(ℝ)`-invariant metric" in 5.3a (line 1601) should read "a"

A `K_∞`-invariant inner product on `J` is unique only up to a positive scalar on each `K_∞`-isotypic piece, and the theorem holds for every such choice.

## Questions for the author

- Which statement of Harris 1989 identifies the canonical extension of 5.3 with Mumford's extension for bundles equivariant under `G(ℝ)` rather than the adjoint group, and on which page? Its publisher's page refused access and no open copy was found, so I could not check the step.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 5.3a: `h_J` good relative to `V(J)^can_Σ` | `X(N)`, `N ≥ 3`, `J = (𝔤/Lie P_H)^∨`, `q = e^{2πiτ/N}` | `‖dq/q‖² = (2π/N)²(Im τ)² = (log|q|)²`; `(det H)^{−1} = (log|q|)^{−2}` bounded; `θ = dq/(q log|q|)` of Poincaré growth | holds |
| 5.3a: uniqueness of the extension | same, extension `Ω¹` with frame `dq` | `(det H)^{−1} = 1/(|q|²(log|q|)²)`, no bound by any power of `log|q|`: not good | holds; Check true |
| 5.3a: `(𝔤/Lie P_H)^∨` meets the hypotheses | Adjoint grading `𝔤 = 𝔭⁺ ⊕ 𝔨_ℂ ⊕ 𝔭⁻` (SV1) | `Ad(exp Y)X = X + [Y,X] + ½[Y,[Y,X]]`, last two in `Lie P_H`: trivial on the unipotent radical; `K_∞` acts through compact image (SV2) | holds |
| 5.3a: unitary-on-`K_∞` hypothesis, negative control | `GL₂`, character giving `ω` | centre `ℝ_{>0} ⊂ K_∞` acts by `z^{±1}`, not unitary: excluded, so the Check correctly uses `Ω¹` | consistent |
| 5.3a: trivial on unipotent radical vs Mumford | Mumford77 p. 256 | Mumford extends `σ` to `P₊·K_ℂ` "killing `P₊`": same hypothesis; neat `Γ`; NC boundary | matches source |
| 5.3a sketch, step 2 | `Ω¹` on `X(N)` | `H = (log|q|)²`, `H^{−1} = (log|q|)^{−2}`: not a polynomial in `log|q|` | C01 |
| 5.3a: simple normal crossings | ShimuraCompactifications §2.6; Mumford77 p. 254 | smooth `Σ` gives local NC only; SNC needs Pink 7.12(∗); source needs NC | C02 |
| 5.3b: proportionality, `dim X = 1` | `X(3)`: `g = 0`, `#cusps = 4` | left `deg Ω¹(log) = 2`; right `(−1)·v·deg O(−2) = 2v`; `v = 1`; hyperbolic area `12·π/3 = 4π`, `/4π = 1` | holds |
| 5.3b: sign, `dim X = 2` | ball quotient, `X̌ = ℙ²`, `c(Ω¹) = 1 − 3H + 3H²` | sign `+1`: `c₁² = 9v`, `c₂ = 3v`, so `c₁² = 3c₂` (Hirzebruch's equality), `c₂ = e > 0` | holds |
| 5.3b: normalisation of `v` | curvature `−1` disc vs curvature `+1` sphere | dual volume `4π` normalised to `1`; `v = area/4π`; Mumford: `K = vol(F)/vol(Ď)` (pp. 262–263) | holds |
| 5.3b Check: `deg ω` | `X(3)` | `ω^{⊗2} ≅ Ω¹(log) ⊗ det`, `det Γ(3) = 1`, so `deg det = 0`; `deg ω = 1`; `dim M₁(Γ(3)) = 2 = deg + 1` | true |
| 5.3b Check: sign cannot be dropped | `X(3)` | without the sign, `2 = −2v < 0`, contradicting `v > 0` | true |
| 1.1 `finiteTensorStabilizer` (unchanged headline) | `n = 0`, `H` trivial, `V = k`, `g = 2·id` | left side vacuous (true); right side forces `g = id`: false, so not closable by one tactic | not padding |

- Source locators checked against the text: 7, all in Mumford77, read in the open GDZ scan. They are Main Theorem 3.1 (p. 256), Proposition 3.4 a) (p. 264), Theorem 3.2 and its proof (pp. 262–263), Theorem 1.4 and its proof (pp. 242–243), Proposition 1.2 (p. 241), the remark on p. 241 that good forms form a differential graded algebra, and the normal crossings compactifications (p. 254). Harris89 could not be read.
- Cross-roadmap citations resolved: 15. They are ArakelovGeometryAndAbelianHeights §§5.1a–5.1d (at this head); CharacteristicClasses C4.1, C4.2; ShimuraCompactifications §§1.1, 1.3, 2.3, 2.6, 2.7, 6.7, 7.12, with their proposed names; ShimuraData Layer 2; ShimuraVarieties §2.1. Six internal citations (0.5, 0.7, 3.2, 5.1, 5.2, 5.3) resolve with the names given.
- The README at `592bdb1` compared with the head: all 13 layer ids are kept with their titles, and the new ids are 5.3a and 5.3b. The 9 deleted lines are rewrites (the guide, the Layer 5 introduction and Dependencies, the scope bullet, the ShimuraData row, the ShimuraCompactifications inputs), and each keeps every prior item.
- Ownership: DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 (this pull request) cite 5.3a–5.3b in their "*Corollary of:*" lines. No roadmap on main or among the closest open ones states these theorems. BallQuotientsAndComplexHyperbolicLattices §§8.3–8.4 concern only the Kähler–Einstein metric of ball quotients.
- Pinned libraries: grepping Mathlib and Tau Ceti finds no Chern classes, good metrics or toroidal compactifications, so 5.3a–5.3b are not statable at the pins and nothing needs citing.
- Dependency check output: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`. In the merge order, ShimuraVarieties (114), ShimuraData (125), ArakelovGeometryAndAbelianHeights (151) and ShimuraCompactifications (175) precede AutomorphicBundles (192); CharacteristicClasses is on main. All automatic checks passed.
- Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, with one `sorry` warning at line 79. The elaborated types of its 3 declarations agree with README 1.1, and no section binder is lost.
- No file outside the pull request's own roadmap folders changed.

Overlap check: read AutomorphicBundlesPartII, HigherHidaAndColemanTheory and PadicFamiliesPartII (open), and ShimuraCompactifications, HodgeTateAndCanonicalSubgroups and PerfectoidShimuraVarieties (main). None of them states invariant-metric goodness or proportionality, so nothing is shared. 5.3a–5.3b have one owner, AutomorphicBundles, cited by DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2.

Source independence: changed passages only. I compared 7 passages (the statement and sketch of 5.3a, its `Ω¹` clause, the statement and sketch of 5.3b, the product step, and the normalisation of `v`) with 1 source, Mumford77. None shares wording beyond forced formulas and standard terms such as "Siegel domain of the third kind". Mumford77 has the largest share of locators in the changed text, 9 of 10; Harris89 is cited once, without a locator, and could not be read. The arrangement was not compared, since no layer is added, removed or reordered.

Research link: 5.3a–5.3b are Mumford's extension (1977) of Hirzebruch's proportionality theorem to non-compact arithmetic quotients, with Harris's canonical extensions (1989). They underlie Chern-number and volume computations on Shimura varieties and Mumford's asymptotic dimension formula for cusp forms (Mumford77, Corollary 3.5). This rests on README §§5.3a–5.3b and Mumford77.

## Not verifiable

- Harris89 (Proc. London Math. Soc. 59 (1989)): the DOI landing page at the publisher refused access (HTTP 403) and the sources service found no open copy. The step it supports in 5.3a is unverified (see C03).
- The other seeded-sample targets (0.3, 0.4, 0.7, 2.1, 5.8, 5.9, 6.3, 7.4, 8.3, 9.1, 11.3, 11.14, 11.16, 11.17) lie in text the change neither alters nor affects, so they were outside this review of the change.

## Source issues

- none

## For the human reviewers

- none
