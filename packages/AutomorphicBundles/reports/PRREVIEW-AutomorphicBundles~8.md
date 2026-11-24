# Review of AutomorphicBundles (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 139 changed lines since `aecb53a`. I checked the two new sections, 5.3a (invariant metrics are good relative to the canonical extension) and 5.3b (Hirzebruch–Mumford proportionality), the six passages rewritten around them, every citation they make, and all seven Mumford locators against the scan of the paper. The statements, hypotheses, sign, normalisation of `v` and Checks hold on every case I computed, so there is no finding and the folder is accepted. The folder's text is unchanged since the previous review, so its five small corrections and one format note stand unrepaired; with one new small correction that makes six small corrections and one format note, none blocking. Nothing is left for a human to decide.

## C01 — The 5.3a sketch says the inverse metric has entries that are polynomials in `log|q_j|`, and the section's own Check gives `(log|q|)^(−2)`

Not repaired from the previous review. An implementer following the second step of the route (line 1620) would look for an exact polynomial formula that does not exist: "Its entries, and those of its inverse, are polynomials in `log|q_j|` with bounded coefficients". For `Ω¹` on `X(N)` the Check of the same section gives the Gram matrix `(log|q|)²`, whose inverse `(log|q|)^(−2)` is a polynomial in `log|q|` only if a "bounded coefficient" is allowed to absorb it, and then the sentence is a growth bound in disguise. What goodness asks for (Mumford77, definition on p. 242; ArakelovGeometryAndAbelianHeights §5.1c (i)) is the bound.

A version that is plainly true: "Its entries, and the inverse of its determinant, are bounded by `C·(Σ_j |log|q_j||)^m`."

## C02 — 5.3a assumes *simple* normal crossings and credits such models to ShimuraCompactifications Layer 2 with a smooth projective `Σ`, which gives only normal crossings

Not repaired. At lines 1595–1597 the boundary is "a divisor with simple normal crossings (ShimuraCompactifications Layer 2 with a smooth projective `Σ`)". ShimuraCompactifications §2.6 says a smooth cone system at neat level gives normal crossings in the local sense, and that global simple normal crossings needs Pink's condition 7.12(∗) in addition. Neither the source nor the supplier needs "simple": Mumford's Main Theorem 3.1 is for the smooth compactifications of Ash–Mumford–Rapoport–Tai, and ArakelovGeometryAndAbelianHeights §5.1a defines a normal crossings divisor by local charts `z₁⋯z_k = 0`. As written, 5.3a (and 5.3b, which inherits the setting) excludes some smooth projective `Σ` for no gain, and the parenthesis points at a supplier that does not provide the hypothesis.

The smallest repair is to drop "simple". Alternatively keep it and cite §2.6 with Pink's condition.

## C03 — Harris 1989 is cited in 5.3a without a locator, for the one step Mumford's paper does not cover

Not repaired. At lines 1628–1629 `[Harris89] (canonical extensions)` has no theorem or page. Mumford's bundles are equivariant under the group of the domain and are extended by `U(F)_ℂ`-invariant frames (Mumford77, pp. 256–257); here `V(J)` is a coefficient of `Gᶜ` for a reductive `G`, and its canonical extension in 5.3 is glued from the boundary frames of 5.1. The first step of the route asserts that the two extensions agree, and Harris's paper is what is cited for it. Please give the statement and page. I could not read the paper (below).

## C04 — The module docstring of `Suggested.lean` does not mention 5.3a–5.3b

Not repaired. In `TauCetiRoadmap/AutomorphicBundles/Suggested.lean`, lines 29–31, the bullet for Layers 5 and 6 lists "canonical extensions, fan independence and logarithmic comparisons". The guide to the layers (README lines 75–77) and the scope section now name Hirzebruch–Mumford proportionality among Layer 5's results. If it counts as a headline, one clause in that bullet would record that it is not statable at the pins, which have no toroidal models, canonical extensions or Chern classes of holomorphic bundles.

## C05 — The pull request description does not say that this roadmap gains two sections and two suppliers

Not repaired. The description says the general roadmaps receive sections and that "The additions create new supplier relations between general roadmaps; each is in the citing roadmap's supplier contracts", and its paragraph on DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 mentions Mumford's theorem, but AutomorphicBundles is named nowhere. A sentence such as this would do: "AutomorphicBundles gains §§5.3a–5.3b (invariant metrics are good relative to the canonical extension; Hirzebruch–Mumford proportionality), with ArakelovGeometryAndAbelianHeights §§5.1a–5.1d and CharacteristicClasses C4.1–C4.2 as new suppliers; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 are now corollaries of them."

## C06 — Another open pull request rewrites this README's `*Needs:*` lines, and no order between the two is stated

Pull request #3036 ("cite the sections a need uses, not whole layers") changes about thirty `*Needs:*` and Dependencies passages of this README, among them the `*Needs:*` line of 5.3, fifteen lines above the place where 5.3a is inserted. In this folder the two changes touch different lines; the two heads do conflict in four other folders. The description's merge-order paragraph does not name #3036. Whichever merges second should be rebased on the first, and it would help to say which; the new 5.3a–5.3b already cite their suppliers by section, so they need no change either way.

## N01 — "the `G(ℝ)`-invariant metric" in 5.3a (line 1601) would read better as "a"

Not repaired. A `K_∞`-invariant inner product on `J` is unique only up to a positive scalar on each isotypic piece, and the theorem holds for each choice.

## Questions for the author

- Which statement of Harris 1989 identifies the canonical extension of 5.3 with Mumford's extension, and on which page? The publisher's page refused access and no open copy was found, so the step could not be checked.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 5.3a: `h_J` good relative to `V(J)^can_Σ` | `X(N)`, `N ≥ 3`, `J = (𝔤_ℂ/Lie P_H)^∨`, `q = e^(2πiτ/N)` | `‖dq/q‖² = (2π/N)²(Im τ)²`; `(log|q|)² = (2π Im τ/N)²`: equal. `θ = ∂ log H = dq/(q log|q|)`, Poincaré growth | holds |
| 5.3a: uniqueness; Check "not good relative to `Ω¹`" | same, frame `dq` | `H = |q|²(log|q|)²`; `(det H)^(−1) = |q|^(−2)(log|q|)^(−2)` exceeds every `C|log|q||^m` as `q → 0` | holds; Check true |
| 5.3a: `(𝔤_ℂ/Lie P_H)^∨` meets the hypotheses | `Lie P_H = 𝔨_ℂ ⊕ 𝔭⁻`, unipotent radical `𝔭⁻` | `[𝔭⁻, 𝔭⁺] ⊂ 𝔨_ℂ ⊂ Lie P_H`: trivial on `𝔤/Lie P_H`; `K_∞` acts through `Ad` with compact image; dual of the tangent fibre gives `Ω¹` | holds |
| 5.3a hypotheses against the source | Mumford77 p. 256 | representation of `K` extended to `P₊·K_ℂ` killing `P₊`; compact `K` gives the invariant metric; unique extension with `h` good | matches |
| 5.3a: the `K_∞`-unitary hypothesis excludes something | Hilbert modular group, `Gᶜ = G/Z_s` | centre modulo `Z_s` is an `ℝ`-split torus of rank `d − 1` inside `K_∞`; its non-unitary characters are excluded | not vacuous |
| 5.3a route, step 2 | `Ω¹` on `X(N)` | `H^(−1) = (log|q|)^(−2)`, not a polynomial in `log|q|` | C01 |
| 5.3a: simple normal crossings | ShimuraCompactifications §2.6; ArakelovGeometryAndAbelianHeights §5.1a | supplier gives local normal crossings; simple needs Pink 7.12(∗); §5.1a needs local charts only | C02 |
| 5.3b: formula, `dim X = 1` | `X(3)`: `g = 0`, 4 cusps | left `deg Ω¹(log) = 2g − 2 + 4 = 2`; right `(−1)·v·deg O(−2) = 2v`; `v = 1`; area `2π·2 = 4π`, divided by `4π` is `1` | holds |
| 5.3b: sign `(−1)^(dim X)` | Chern form of degree `k` in the curvature | curvature changes sign under duality, `c_k ↦ (−1)^k c_k`; weighted degree `dim X` gives `(−1)^(dim X)`; Mumford77 p. 263 has `(−1)^k` | holds |
| 5.3b: `dim X = 2` | ball quotient, `X̌ = ℙ²`, `c(Ω¹) = 1 − 3H + 3H²` | sign `+1`: `c₁² = 9v`, `c₂ = 3v`, so `c₁² = 3c₂` and `c₂ > 0` | holds |
| 5.3b: `dim X = 0`; `J` of rank 0 or trivial | torus datum; zero and unit coefficients | `Q = 1`: `#S(ℂ) = v·1`; rank 0 or trivial `J` with `dim X > 0`: both sides `0` | holds |
| 5.3b: normalisation of `v` | disc of curvature `−1`, sphere of curvature `+1` and area `4π` | dual mass 1 gives `v = area/4π = (2g − 2 + #cusps)/2`; Mumford: `vol(F)·c(e)` against `vol(Ď)·c(e)` | holds |
| 5.3b route, product step | `Q = c₁²` | `c_k(h) − c_k(h₀) = dT` with `T` good; good forms are a differential graded algebra with `d[η] = [dη]`; `Q(c(h)) − Q(c(h₀)) = d(good)`, integral `0` | holds |
| 5.3b Check: `deg ω` | `X(3)` | `(2g − 2 + 4)/2 = 1`; index of `Γ(3)` in `PSL₂(ℤ)` is 12 and `12/12 = 1` | true |
| 5.3b Check: the sign cannot be dropped | `X(3)` | without the sign `2 = −2v`, contradicting `v > 0` | true |
| 1.1 `finiteTensorStabilizer` (unchanged headline) | `n = 0`, `H` trivial, `V = k`, `g = 2·id` | left side vacuously true, right side false: the empty family fails, so no one-tactic proof | not padding |

- Source locators checked against the text: 7, all in Mumford77 (scan with printed pages): Main Theorem 3.1, p. 256; Proposition 3.4 a), p. 264; Proportionality Theorem 3.2 and its proof, pp. 262–263; Theorem 1.4 and its proof, pp. 242–243; Proposition 1.2, p. 241; the remark on p. 241 that good forms form a differential graded algebra; the Siegel-domain charts and `U(F)_ℂ`-invariant frames, pp. 255–257. Harris89 not read.
- Cross-roadmap citations resolved: 15. ArakelovGeometryAndAbelianHeights §§5.1a–5.1d (added by this pull request; read at this head); CharacteristicClasses C4.1, C4.2 (main); ShimuraCompactifications §§1.1, 1.3, 2.3, 2.6, 2.7, 6.7, 7.12 (main, with the names cited); ShimuraData Layer 2 (§§2.1–2.2, main); ShimuraVarieties §2.1 (main). Internal: 0.5, 0.7, 3.2, 5.1, 5.2, 5.3 resolve with the names given.
- The README at the merge base against the head: 13 layers, none removed or retitled; no heading removed; new ids 5.3a and 5.3b. The 9 deleted lines are rewrites that keep every earlier item.
- Ownership: DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 (same pull request) are now "*Corollary of:*" 5.3a–5.3b. HilbertModularSurfaces §§4.3–4.4 (open) use proportionality for compact quotients of `ℍ²` inside a proof route and state no general theorem.
- Pinned libraries: no Chern classes of holomorphic bundles, good metrics or toroidal compactifications in Mathlib or Tau Ceti at the pins; nothing to cite, and 5.3a–5.3b are not statable there.
- Dependency check output: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`. All automatic checks passed.
- Elaboration of `Suggested.lean` (unchanged by the pull request): one warning, `sorry` at line 79. The three elaborated types agree with README 1.1 (connected case, as the docstring says); no section binder lost; a single `import Mathlib` plus two Tau Ceti modules; no `set_option`.
- No file outside the pull request's own roadmap folders changed.

Overlap check: read ShimuraCompactifications, HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties (main), AutomorphicBundlesPartII, PadicFamiliesPartII, HigherHidaAndColemanTheory (open), and HilbertModularSurfaces §§4.3–4.4 (open); nothing shared. Invariant-metric goodness and proportionality have one owner, AutomorphicBundles §§5.3a–5.3b; good forms and good metrics are ArakelovGeometryAndAbelianHeights §§5.1a–5.1d.

Source independence: changed passages only; 7 passages compared with 1 source (Mumford77): the statement of 5.3a, its route, its `Ω¹` clause, the statement of 5.3b, its product step, its duality step, the normalisation of `v`; none shared beyond formulas and standard terms; largest share in the changed text Mumford77, 9 of 10 locators; Harris89 (1 citation, no locator) could not be read; arrangement not compared, since no layer is added, removed or reordered.

Research link: 5.3a–5.3b are Mumford's extension (1977) of Hirzebruch's proportionality theorem to non-compact arithmetic quotients, on Harris's canonical extensions (1989); they feed Chern-number and volume computations on Shimura varieties and Mumford's dimension asymptotics for cusp forms (Mumford77, Corollary 3.5). Rests on README §§5.3a–5.3b and Mumford77.

## Not verifiable

- Harris89 (Proc. London Math. Soc. (3) 59 (1989), 1–22): the publisher's page refused access and no open copy was found; the step it supports in 5.3a is unchecked (C03).
- The locators of 5.3 ([Milne90], [HLTT]) and the other targets of the seeded sample (2.2, 2.7, 3.5, 7.4, 9.2, 10.5, 10.6, 10.8, 11.12, 11.13, 11.17, 12.1, 12.12) lie in text the change neither alters nor affects; they are outside a review of the change. Of the sample, 5.3b was checked in full, and 5.3 as far as 5.3a–5.3b rely on it.

## Source issues

- none

## For the human reviewers

- none
