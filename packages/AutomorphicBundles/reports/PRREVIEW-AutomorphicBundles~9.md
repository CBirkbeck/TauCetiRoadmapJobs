# Review of AutomorphicBundles (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 143 changed lines since `b8f3652`. I checked the two new sections, 5.3a (invariant metrics are good relative to the canonical extension) and 5.3b (Hirzebruch–Mumford proportionality), the passages rewritten around them, every citation they make, all Mumford locators and the new Milne locator against the texts, and the repairs of the previous review's remarks. The statements, the sign, the normalisation of `v` and the Checks hold on every case I computed, so there is no finding and the folder is accepted. There is one small correction (the hypothesis of 5.3a leaves out `ω` on a modular curve, where the conclusion holds) and one format note, neither blocking; one point of placement is left for the human reviewers.

## C01 — The hypothesis "unitary on `K_∞`" of 5.3a–5.3b excludes `ω` on a modular curve, where both conclusions hold

A reader who wants the goodness of the Petersson metric on the Hodge line, or its degree by proportionality, finds that 5.3a and 5.3b do not apply: in 5.3a (line 1611) `J` must be unitary on "the stabiliser `K_∞` of a point of `X`", and for `GL₂` that stabiliser is `ℝ^×·SO(2)`, on which the character giving `ω` is `t ↦ t^(±1)` on the positive scalars. DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.1, changed in the same pull request, says so in its `*Corollary of:*` line ("among them the one giving `ω` on a modular curve … are not cases of it") and states the wider theorem itself, for `J` unitary on `K_∞¹ = K_∞ ∩ G(ℝ)¹`.

The conclusions hold in that case. On `X(N)`, in the canonical frame `e` of `ω` at a cusp, `‖e‖² = c·Im τ = −c′·log|q|`, so the Gram entry and its inverse are bounded by a power of `|log|q||` and the connection form is `∂ log(−log|q|) = dq/(2q log|q|)`, of Poincaré growth: the metric is good relative to `ω^can`. With the convention of 0.5 (`ω` corresponds to `O(−1)` on `ℙ¹`), the formula of 5.3b gives `deg ω = (−1)·v·(−1) = v = (2g − 2 + #cusps)/2`, which is the value the second bullet of the Check of 5.3b (line 1702) reaches indirectly through `ω^(⊗2)` and `Ω¹(log cusps)`. An arithmetic subgroup lies in `G(ℝ)¹`, so a `K_∞¹`-invariant inner product still gives a `Γ`-invariant metric on each component.

The statement as written is true and matches Mumford's hypothesis (a representation of a compact `K`), so nothing needs to change for it to stand. It would be more useful, and the general theorem would have one owner, if 5.3a and 5.3b asked for unitarity on `K_∞ ∩ G(ℝ)¹` and took the `G(ℝ)¹`-invariant metric; the Check of 5.3b could then compute `deg ω` directly.

## N01 — "the `G(ℝ)`-invariant metric" in 5.3a (lines 1612–1613) would read better as "a"

Not repaired from the previous review. A `K_∞`-invariant inner product on `J` is unique only up to a positive scalar on each isotypic piece, and the theorem holds for each choice.

## Previous findings

The previous review raised no finding. Its remarks, against this head:

- C01 — repaired: the second step of the route of 5.3a (lines 1632–1633) now reads "Its entries, and the inverse of its determinant, are bounded by `C·(Σ_j |log|q_j||)^m`", which is condition (i) of Mumford77, p. 242.
- C02 — repaired: 5.3a (line 1608) now asks for "a divisor with normal crossings", which is what ShimuraCompactifications §2.6 provides.
- C03 — repaired: the citation of Harris 1989 is replaced by "[Milne90], V §6, Theorem 6.1 and its proof, pp.90–91", read at that place: the theorem gives the uniqueness of the extension functor from properties (a)–(c), and its proof refers the irreducible case to Mumford 1977.
- C04 — repaired: the module docstring of `Suggested.lean` (lines 32–37) names 5.3a and 5.3b and what they lack at the pins.
- C05 — repaired: the description now says "AutomorphicBundles gains §§5.3a–5.3b (goodness of invariant metrics, Hirzebruch–Mumford proportionality), with ArakelovGeometryAndAbelianHeights §§5.1a–5.1d and CharacteristicClasses C4.1–C4.2 as new suppliers".
- C06 — deferred (D01); see below.
- N01 — not repaired; kept above.

## Deferred findings

- D01 — resolved: the other pull request has merged into `main`, this head contains that merge, and the description's merge-order block lists it before this one for this folder.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 5.3a: `h_J` good relative to `V(J)^can_Σ` | `X(N)`, `N ≥ 3`, `J = (𝔤_ℂ/Lie P_H)^∨`, `q = e^(2πiτ/N)` | `‖dq/q‖² = (2π/N)²(Im τ)²`; `(log|q|)² = (2π Im τ/N)²`: equal. `θ = ∂ log (log|q|)² = 2∂ log(−log|q|) = dq/(q log|q|)` | holds |
| 5.3a Check: not good relative to `Ω¹` | same, frame `dq` | `H = |q|²(log|q|)²`; `(det H)^(−1) = |q|^(−2)(log|q|)^(−2)`, larger than every `C·|log|q||^m` as `q → 0` | Check true |
| 5.3a route, bound on the metric | `Ω¹` on `X(N)`; Mumford77 p. 242 (i) | `H = (log|q|)²`, `(det H)^(−1) = (log|q|)^(−2) ≤ C`; source asks `|h_ij|, (det h)^(−1) ≤ C(Σ|log|z_i||)^(2n)` | holds; previous C01 repaired |
| 5.3a: `(𝔤_ℂ/Lie P_H)^∨` meets the hypotheses | `Lie P_H = 𝔨_ℂ ⊕ 𝔭⁻` | `[𝔭⁻, 𝔭⁺] ⊂ 𝔨_ℂ`: radical acts by `0` on `𝔤/Lie P_H`; centre acts trivially, so unitary on all of `K_∞` | holds |
| 5.3a hypotheses against the source | Mumford77 pp. 254, 256 | source: `G` semisimple adjoint, `K` compact, representation extended to kill `P₊`; unique extension with `h` good | matches |
| 5.3a: hypothesis "unitary on `K_∞`" | `GL₂`, character of `ω`; `K_∞ = ℝ^×·SO(2)` | positive scalars act by `t^(±1)`: excluded; yet `‖e‖² = −c′log|q|`, `θ = dq/(2q log|q|)`: good | C01 |
| 5.3a: extension of 5.3 is Mumford's | Milne90 V Theorem 6.1, pp. 90–91 | functor unique from restriction, tensor and differential-operator properties; irreducible case referred to Mumford 1977 | supported |
| 5.3b: formula, `dim X = 1` | `X(3)`: `g = 0`, 4 cusps | left `2g − 2 + 4 = 2`; right `(−1)·v·(−2) = 2v`; `v = 1`; area `2π·2 = 4π`, over `4π` is `1` | holds |
| 5.3b: sign | Chern form of degree `k`; Mumford77 p. 263 | curvature changes sign, `c_k ↦ (−1)^k c_k`; total weighted degree `dim X` gives `(−1)^(dim X)` | holds |
| 5.3b: `dim X = 2` | ball quotient, `X̌ = ℙ²`, `c(Ω¹) = 1 − 3H + 3H²` | sign `+1`: `c₁² = 9v`, `c₂ = 3v`; `c₁² = 3c₂`, `c₂ > 0` | holds |
| 5.3b: `dim X = 0`; `J` trivial | torus datum; unit coefficient, `dim X > 0` | `Q = 1`: `#S(ℂ) = v`; trivial `J`: both sides `0` | holds |
| 5.3b: normalisation of `v` | disc of curvature `−1`, sphere of area `4π`; Mumford77 pp. 262–263 | dual mass `1` gives `v = area/4π = (2g − 2 + #cusps)/2`; source: `vol(Γ∖D)·c(e)` against `vol(Ď)·č(e)` | holds |
| 5.3b route, product step | `Q = c₁²`; Mumford77 pp. 241, 243 | `c_k(h) − c_k(h₀) = dT`, `T` good; good forms a differential graded algebra, `d[η] = [dη]`; integral of `d(good)` is `0` | holds |
| 5.3b Check: `deg ω` | `X(3)` | `(2g − 2 + 4)/2 = 1`; index of `Γ(3)` in `PSL₂(ℤ)` is `12`, `12/12 = 1` | true |
| 5.3b Check: sign cannot be dropped | `X(3)` | without the sign `2 = −2v`, against `v > 0` | true |
| 5.2 (sampled; 5.3a relies on it) | Milne90 V Theorem 6.1, p. 90 | theorem at that page: extension functor on a smooth toroidal compactification, unique | locator holds |
| 1.1 `finiteTensorStabilizer` (headline, statement unchanged) | `simp`, `rfl`, `infer_instance` on a copy | `simp` made no progress; `rfl` and `infer_instance` fail | not padding |

- Source locators checked against the text: 9. Mumford77 (scan with printed pages, recognised by OCR): Main Theorem 3.1, p. 256; Proposition 3.4 a), p. 264; Proportionality Theorem 3.2 and proof, pp. 262–263; Theorem 1.4 and proof, pp. 242–243; Proposition 1.2, p. 241; the remark on p. 241 on the differential graded algebra; the definition of a good metric, p. 242; the Siegel-domain charts and `U(F)_ℂ`-invariant frames, pp. 255–257. Milne90: V §6 Theorem 6.1 and proof, pp. 90–91.
- Seeded sample: none of the fifteen targets is changed. 5.2 is relied on by 5.3a and its locator was read; the locators of 5.7 and 6.3 fall on the same page of Milne90 (p. 91: the proof and clause (c) are there) and that of 0.9 at III Theorem 5.1, p. 61, is there. The rest lie in text the change does not affect.
- Cross-roadmap citations resolved: 15. ArakelovGeometryAndAbelianHeights §§5.1a–5.1d (read at this head: good metrics, uniqueness, `d[η] = [dη]`, products, Chern forms); CharacteristicClasses C4.1, C4.2; ShimuraCompactifications §§1.1, 1.3, 2.3, 2.6, 2.7, 6.7, 7.12 with the names cited; ShimuraData Layer 2 (§2.2); ShimuraVarieties §2.1. Internal: 0.5, 0.7, 3.2, 5.1, 5.2, 5.3.
- The README at the merge base against the head: 13 layers, none removed or retitled; no heading removed; new ids 5.3a and 5.3b; the 11 deleted lines are rewrites that keep every earlier item.
- Pinned libraries: no good metrics, Chern classes of holomorphic bundles or toroidal compactifications in Mathlib or Tau Ceti at the pins; 5.3a–5.3b are not statable there and the docstring says so.
- Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`. All automatic checks passed.
- Elaboration of `Suggested.lean`: one warning, `sorry` at line 82. The three elaborated types were compared with README 1.1 (connected case, as the docstring says); no binder lost; a single `import Mathlib` and two Tau Ceti modules; no `set_option`. Only the docstring changed.
- No file outside the pull request's own roadmap folders changed.

Overlap check: read ShimuraCompactifications, HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties (main), AutomorphicBundlesPartII, ShimuraVarietiesPartII, HilbertModularSurfaces §4.3 (open), and DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 (this pull request); nothing shared. Invariant-metric goodness and proportionality for `J` unitary on `K_∞`: AutomorphicBundles §§5.3a–5.3b; the `K_∞¹` form: DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2, as corollary and extension; good forms and metrics: ArakelovGeometryAndAbelianHeights §§5.1a–5.1d.

Source independence: changed passages only; 8 passages compared with 2 sources (Mumford77, Milne90): the statement of 5.3a, its route, its bound, its `Ω¹` clause, the Milne clause of its source line, the statement of 5.3b, its product step, its duality step with the normalisation of `v`; none shared beyond formulas and standard terms; largest share in the changed text Mumford77, 9 of 10 locators; arrangement not compared, since no layer is added, removed or reordered.

Research link: 5.3a–5.3b are Mumford's extension (1977) of Hirzebruch's proportionality theorem to non-compact arithmetic quotients, on the canonical extensions of Milne (1990, V Theorem 6.1); they feed Chern-number and volume computations on Shimura varieties and Mumford's dimension asymptotics for cusp forms (Mumford77, Corollary 3.5). Rests on README §§5.3a–5.3b and the two texts read.

## Not verifiable

- [HarrisBundles], the source of 0.7 (sampled, and used by 5.3a for the shape of the quotient): not opened; the passage is unchanged and its statement is not altered by the change.
- The remaining sampled targets (0.6, 7.1, 7.4, 10.3, 11.5, 11.6, 12.8, 12.9, 12.13, 12.15) lie in text the change neither alters nor affects; they are outside a review of the change.

## Source issues

- none

## For the human reviewers

- Placement: the theorem for `J` unitary only on `K_∞ ∩ G(ℝ)¹` (it covers `ω`) is stated in the family roadmap DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 as its own formulation, the `K_∞` case in AutomorphicBundles §§5.3a–5.3b (C01). Mumford77 assumes a semisimple adjoint group.
