# Review of Hyperfunctions (pull request #2592 at 5598880)

**Verdict:** needs changes

**Summary.** The mathematics I recomputed holds: every Check, the sign tables, the Bochner–Martinelli and boundary-value normalisations, and the seven `Suggested.lean` statements. Three findings block. First, §3a.1 plans extension by zero and the c-soft compact-support functors a second time, although the pinned libraries and ComplexComparisonPartII §C6.1 already own them. Second, the Layer 0 example fixes the relative-to-quotient identification with the opposite sign to §3.6 and to Honda–Izawa–Suwa. Third, the headline theorems carry no source locators, even where the cited sources state them. There are five small corrections and two format notes. The human reviewers have one question: the Layer 2 route source (Ito 1986) and the two microlocal texts could not be read.

## R01 (P2) — §3a.1 plans extension by zero, c-soft resolutions, compact-support direct image and the localization triangle again, though the pinned libraries and ComplexComparisonPartII §C6.1 already own them

As written, an implementer would build a second extension-by-zero functor and a second compact-support theory next to the ones that already exist. The two compact-support developments would then need the identification that ComplexComparisonPartII plans only because both exist.

§3a.1 (lines 935–941) asks to "construct extension by zero for open inclusions, direct image for closed inclusions, inverse image, and direct image with proper supports `f_!`" and to prove "exactness … of open extension by zero". Scope and ownership (lines 1314–1316) claims these functors and names no other owner. Here is what already exists:

- **At the pins.** Extension by zero along an open inclusion is Mathlib's `Functor.sheafPullback` along `Over.forget U` (`Mathlib/CategoryTheory/Sites/Pullback.lean`, line 56). Tau Ceti proves it exact for abelian sheaves as `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` (`TauCeti/CategoryTheory/Sites/ExtensionByZero.lean`, line 315), with the module-sheaf form in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExtensionByZero.lean`.
- **On main, ComplexComparisonPartII §C6.1** (its README, lines 4782–4800, with ownership at lines 119–129 and 289–298) owns c-soft resolutions, derived compact-support sections and the localization triangle. It states them for module sheaves over any commutative ring on arbitrary locally compact Hausdorff spaces, and it also claims "the general locally proper lower shriek". It cites this roadmap's former HF3a only "for the identification" (line 4828).

The smallest change has two parts:

1. In §3a.1, consume the pinned extension by zero and its exactness through §0.1's coefficient comparison, and name both declarations in the Mathlib and Tau Ceti contracts.
2. Settle one owner for the c-soft functors. The natural split would have §3a.1 cite §C6.1, specialised to `ℂ`, for c-soft resolutions, compact-support sections and the localization triangle. This roadmap would keep only what §C6.1 does not state: `f_!` for maps with proper base change, the projection formula, the proper-support Fubini comparison and the Euclidean dimension bounds. ComplexComparisonPartII's identification target then has nothing to identify, and that roadmap would drop its citation of this one in its own revision, so no two-way citation remains.

If the author would rather keep the `ℂ`-module functors here, Scope and ownership has to name §C6.1 and say which of the two plans gives way.

## R02 (P2) — The Layer 0 example identifies the relative cocycle `(0, f)` with the class of `f`, the sign that §3.6 and Honda–Izawa–Suwa reject

Layer 1's example chains this identification into Tau Ceti's quotient ("§0.2 example and §2.1c; with `W = ℂ ∖ (ℝ ∖ U)` this is Tau Ceti's quotient of §1.3", lines 300–301). An implementer of §1.3's comparison who follows that chain gets `[(0, g)] ⊗ or_y ↦ [g]`. That is exactly the map §3.6's own Check (lines 904–905) shows sending `bv₊f` to `−bv₊f`.

The Examples of Layer 0 (line 224) say "the relative cocycle `(0, f)`, with `f` holomorphic on `W ∖ ℝ`, represents the class of `f`". Three sources fix the opposite sign:

- §3.6 (line 886) fixes `[(0, g)] ⊗ or_y ↦ [(−g₊, −g₋)]`.
- Honda–Izawa–Suwa, which Layer 0 says fixes the conventions, sends `θ` to `(0, −θ)` under the connecting map of the pair sequence (HondaIzawaSuwa2018 line 500, (4.5), p. 13). In dimension one they identify `[F]` with `[(0, −F)]` (line 780, (6.2), p. 19).
- Tau Ceti's `CochainComplex.mappingCocone.relativeCoordinates_symm_apply` writes a pair `(a, b)` as `inl a − inr b` (`TauCeti/Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean`, line 68), so the cone inclusion of `b` is `(0, −b)`.

Fix: "the relative cocycle `(0, −f)` … represents the class of `f`".

## R03 (P2) — The headline theorems and most targets carry no locator, even where the sources the README already cites state them

Without locators, a reader cannot check the stated hypotheses against any text. The only theorem-level locators in the layers are these:

- Komatsu, Theorem 19 (§2.0e);
- Ito, §§1.5–1.6 (the Layer 2 introduction);
- Kashiwara–Schapira, "Chapters III–IV";
- the Sato–Kawai–Kashiwara article, cited as a whole (pp. 265–529).

Honda–Izawa–Suwa appears in the layers only as an attribution of conventions (lines 115, 236, 815, 1100), and its Theorem 2.14 appears only under References. None of the following has a locator: the gluing theorem of §1.3, MalgrangeTopVanishing (§2.0a), SteinBundleDuality (§2.0f), FlatCompactAnalyticDuality (§2.1), Flabbiness (§2.2), Martineau duality (§2.3), microlocal purity (§3a.3), the embedding and its injectivity (§§4.1, 4.4), the jump formula (§4.2) and §5.1.

Several of these are in sources the README already cites, at locators I opened:

- HIS Theorem 2.14 (p. 8) states purity and flabbiness, quoted from the literature.
- HIS Theorem 6.10 and Corollary 6.12 (pp. 22–23) are the flat compact duality with its analytic-functional pairing.
- HIS (6.4) (p. 20) is §3.2's differential.
- HIS Lemma 7.10 and Example 7.14 (pp. 28–30) give §3.5's boundary-value representative.
- HIS Definition 6.13 and Theorem 6.14 (p. 24) are §4.4's δ.
- HIS Theorem 8.1 with (8.8) (pp. 46 and 49) is §4.3's model construction.
- Komatsu 1967, Theorems 6′ and 12 (pp. 375 and 377), are the compact Banach-limit theorem of §2.0e.

Add these at the claims. For Malgrange's vanishing, Stein duality, the dimension-one sheaf property, the Sokhotski–Plemelj formula, microlocal purity and injectivity of the embedding, give a theorem and page in a source of the author's choice.

## C01 — The Summary's purity sentence drops the orientation twist

"Its sections over an open `U` are the relative cohomology `Hⁿ_U(W, O)`" (lines 18–19) refers to `B_M`, which includes `or_(M/X)`. For a nonorientable `U` the sections of `B_M` are twisted. Honda–Izawa–Suwa make the untwisted identification only after orienting the normal bundle ((2.16) and the paragraph after it, p. 8), and §2.1c (line 735) correctly says "twisted relative `Hⁿ`". Suggested wording: "its sections over `U` are `Γ(U, 𝓗ⁿ_M(O_X) ⊗ or_(M/X))`, which is `Hⁿ_U(W, O)` once the normal bundle over `U` is oriented".

## C02 — The renumbering has no old-to-new map, though other roadmaps cite the old ids

The README drops HF0–HF5, HF3a and the `HF2.AnalyticPreparation.*` names without saying where they went. Roadmaps still cite the old ids:

- on main: ComplexComparisonPartII cites HF3a (README lines 126, 285, 818, 4796, 4828); ComplexKahlerGeometry cites HF5 (lines 1391, 3470); GlobalHolomorphicFunctions cites "HF2's MalgrangeTopVanishing" (line 62);
- at open heads: AutomorphicPadicLFunctionsPartII cites `HF2.AnalyticPreparation.CurrentResolution` (lines 489, 597); LocallyConvexDuality cites `HF2.AnalyticPreparation.FunctionalDuality` (line 42); RelativisticQuantumFieldTheory cites HF3 and HF5.

A sentence would do: "Layer k is HFk of the earlier numbering, Layer 3a is HF3a, and the analytic-preparation blocks HF2.AnalyticPreparation.X are §§2.0a–2.0f under the same names".

Downstream consumers (line 1300) has two related problems. It says ComplexComparisonPartII cites "Layer 3a's §3a.1", while that roadmap actually cites "HF3a". It also omits ComplexKahlerGeometry and GlobalHolomorphicFunctions.

## C03 — The `Suggested.lean` docstring gives a reason for the `n`-dimensional embedding being unstatable that the file itself contradicts

The module docstring (lines 41–42) says "the pins have no Sato sheaf in these dimensions". The flabbiness docstring (lines 81–83) identifies Tau Ceti's `𝓗ⁿ_(ℝⁿ)(O)` with Sato's `B_(ℝⁿ)`. What the pins actually lack is a map from analytic functions (a Thom class or a boundary-value map) into that sheaf, which is what would pin down the embedding. Say that instead.

## C04 — §2.0a's local Poisson step re-derives inputs that are already pinned or owned on main

"Solve `Δv = f` weakly with the gradient completion of `C_c^∞(O)`, its Poincaré inequality and Riesz representation" (lines 342–344) names no supplier for these inputs. Here is what already exists:

- **At the pin.** Zero-boundary Poincaré is `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab` (`TauCeti/Analysis/Sobolev/Poincare/W1p0.lean`, line 102).
- **PDE on main.** PDE §4.2 owns the coercive weak solution. PDE §3.4 proves `−Δ(Φ * g) = g` for `g ∈ C_c^∞(ℝⁿ)`, which applied to `χf` solves the local problem directly.

Cite these in the *Needs:* line.

## C05 — §2.0b claims nuclearity without a definition owner, and nothing downstream uses it

"Prove that it is nuclear and Fréchet–Schwartz" (line 371) relies on a notion of nuclear space that this roadmap never defines. On main, AutomorphicSpectralTheory §0.11 defines nuclear maps and spaces. Only the FS property is used afterwards: §2.0e is stated for FS spaces, and §2.0f mentions nuclearity only in passing. Either cite AutomorphicSpectralTheory §0.11, or drop nuclearity from §2.0b.

## N01 — In the Mathlib contract (line 1392) the bare name `dsupport` does not resolve at the pin; the declaration is `Distribution.dsupport`.

## N02 — The Komatsu reference (line 1520) gives no title: *Projective and injective limits of weakly compact sequences of locally convex spaces*.

## Questions for the author

- §1.4 (line 295), §2.3 (line 784) and §4.4 (line 1188) use the orientation sheaf `or_M` of `M`, but §0.3 defines only `or_(M/X)`. Which section or supplier owns `or_M` and its comparison `or_X ⊗ or_M^(−1) ≃ or_(M/X)`? I found no declaration at the pins and no owner among the suppliers this README names.
- Does Ito 1986, §§1.5–1.6, derive purity from compact duality at the generality §2.1c states (arbitrary `n`, all complex neighbourhoods)? I could not find a legal copy of the text.

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| §0.1 Check, `H¹_S` | constant `ℤ` on `ℝ`, `S={0}` | `0→ℤ→ℤ²→H¹_S→0` ⇒ `ℤ`; unquotiented variant gives `ℤ²` | true | none |
| §0.2 Check, `d_rel²` | right and wrong sign | `(0, ∂̄α|−∂̄α|+∂̄²β)=0`; `+∂̄β` variant gives `(0, 2∂̄α|)` | true | none |
| Convention 4 vs Tau Ceti | `relativeCoordinates_d` (line 76) | `(d a, f a − d b)` at the pin; Mathlib cone `(−da, fa+db)`, shift sign `(−1)^k` | agrees | none |
| Convention 6 sign table | `n = 1,…,6` | inversions `n(n+1)/2 = 1,3,6,10,15,21` ⇒ `−,−,+,+,−,−`; `(−1)ⁿ` agrees at `n=1,4,5` | true | none |
| Convention 9 kernels | `d = 2, 3` | Tau Ceti `newtonianKernel 3 = 1/(4π‖x‖)`, planar `−log‖z‖/(2π)`; README's are negatives | true | none |
| §1.1 `B_M`, `B^(p)` | `M` a point; `ℝ ⊆ ℂ` | point: `B = ℂ`; matches HIS §2.4 definitions (p. 8) | holds | R03 |
| §1.3 sheaf property, Checks | `1/z` on `(0,∞)` and `ℝ`; `1_upper` vs `−1_lower` | zero on `(0,∞)`, `−2πiδ` on `ℝ`; difference of pairs is the constant `1` | true | R03 |
| §1.4 `A_M`, hyperdensities | `n = 0` | `A_M = i⁻¹O_X` as in HIS p. 19; `n=0`: densities are functions | holds | question on `or_M` |
| §2.0a / `exists_sum_dbar_eq` | `n=1`, `f=1`; `n=0`; `n=2` identity | `v=|z|²`, `∂̄z̄=1`; `n=0` has empty sum `0≠1`, so `1≤n` is needed; `n=2` gives `Δv/4` | holds | C04 |
| Lean `∂/∂z̄` encoding | `g = z̄₁`, `n=1` | `½(∂_x + i∂_y)z̄ = ½(1+1) = 1` via `Pi.single j 1`, `Pi.single j I` | holds | none |
| §2.0c Check, Cauchy–Green | kernel `1/(z−ζ)` vs `1/(ζ−z)` | fundamental solution of `∂̄` is `1/(πz)` ⇒ `∂̄Tφ=φ`; swapped kernel gives `−φ` | true | none |
| §2.0c current sign | `T_η`, Stokes | `∫∂̄η∧α = (−1)^(p+r+1)∫η∧∂̄α` | matches `(−1)^(p+r+1)` | none |
| §2.0d strong continuity | Mathlib `precomp` | `→L` carries bounded-convergence topology; a continuous transpose maps bounded sets to bounded sets | holds | none |
| §2.0e closed range | Komatsu Thm 19 (p. 381) | (i) `im u` closed ⇔ `im u′` weak* closed; (ii) FS `H′ = Z*/B*` | supported | none |
| §2.0e Check | `B_j = ℂ`; infinite-dim identity bonds | `L = F = ℂ`; a Banach space is Montel only if finite-dim ⇒ not FS | true | none |
| §2.0f Stein duality | `n=0`; `V=ℂ`, `p=0` | `⊕E_x = (∏E*_x)′`; `H_c⁰(ℂ,O)=0`, `H_c¹ ≅ O(ℂ,Ω¹)′` | holds | R03 |
| §2.1 / §2.1b compact duality | `n=1`, `K={0}`, disc | `O(V∖0)/O(V)`; `∮z^(−k−1)z^m dz = 2πiδ_km`; `H_c⁰(V)=0` gives the short sequence | holds; HIS Thm 6.10 agrees | R03 |
| §2.1b, `n≥2` | `n = 2` | `H⁰(K)→H_c¹(Ω)→H_c¹(V)=0`; `H¹(K,O)=0` ⇒ `H_c²(Ω)≅H_c²(V)`; `Φ_q` chain map `(−1)^(n(q+1))` | holds | none |
| §2.1a polyhedra | Tau Ceti `Basic.lean` 330, 427; `Exhaustion.lean` 73 | sup-norm `closedBall ∩ ⋂{|p|≤1}`, `R>0`, nonconstant `p`; `ψ` formula identical | agrees | none |
| §2.1c purity / `isZero_…` | `n=0`; `n=1`, `q=0,2` | point: `H^q=0`; identity theorem kills `𝓗⁰`; `H¹(W)=H¹(W∖ℝ)=0` kills `𝓗²` | holds | none |
| §2.1c Check, `n = 2` | polydisc | `(D₁∖ℝ)×(D₂∖ℝ)` has `2·2 = 4` components | true | none |
| §2.2 flabbiness / `isFlasque_…` | `n=0`; `Z = V∖U` closed in `W` | `Hⁿ(W∖Z)=0`, `H^(n+1)(W)=0` ⇒ `H^(n+1)_Z=0` ⇒ onto; sections over `W` are `B(W∩ℝⁿ)` | holds | R03 |
| §2.3 Martineau duality | `K=∅`; `n=0` | `0 = 0′`; `ℂ^K = (ℂ^K)′`; flat case is HIS Cor 6.12 (p. 23) | holds | R03 |
| §3.2 differential | `d²`; cocycle | `(−1)²ⁿ(∂²α, ∂²β)=0`; `∂α+∂̄∂β = ∂(α−∂̄β)=0`; `+∂β` variant gives `2∂α` | matches HIS (6.4) | none |
| §3.3 Check, conjugation | `n=1`, `b=1` | `κ(0,−1_upper)=(0,−1_lower)=bv₋(−1)=−1`; the factor `(−1)ⁿ` restores `1` | true | none |
| §3.6 normalisations | HIS Ex. 7.14 at `n=1`; HIS p. 18 | `ν₀₁ = −1_upper` ⇒ `bv₊f=[(0,−f·1_upper)]`; `δ = (0, 1/(2πiz))` | agrees | none |
| Layer 0 example sign | `M = ℝ`, `f` | README `(0,f)↦[f]`; §3.6 and HIS (6.2) `[F]↔[(0,−F)]` | contradiction | R02 |
| Summary purity sentence | nonorientable `U` | `Γ(U,𝓗ⁿ⊗or)` vs `Γ(U,𝓗ⁿ)`; equal once `or` is trivialised (HIS 2.16) | imprecise | C01 |
| §3a.1 ownership | pins; ComplexComparisonPartII §C6.1 | `j_!` = `sheafPullback`, exact at the pin; §C6.1 owns c-soft, `RΓ_c`, triangle, lower shriek | duplicate | R01 |
| §3a.2 Check, Fourier–Sato | `η>0`, `η<0`, `η=0` | fibres `{0}`, `[0,∞)`, `[0,∞)` ⇒ `ℂ, 0, 0` ⇒ `F^∧ = ℂ` on `{η>0}` | true | none |
| §3a.3 Check, wavefront | FT of `1/(x+i0)`, phase `e^(−ixξ)` | `−iπ sgn ξ − iπ = −2πiH(ξ)` ⇒ WF `{ξ>0} = Γ°∖0` | true | none |
| §4.2 / `tendsto_…` | `u=δ`; `u=1_[0,1]`; `K=∅` | Poisson `γ/(π(x²+γ²))`; arctan sum tends to `1, ½, 0`; `K=∅` ⇒ `u=0`, both sides `0` | true | none |
| `existsUnique_isCauchyEmbedding` | `U=∅`; cutoff argument | quotient over `∅` is `0`; local cutoffs plus separatedness fix `ι_U` | holds | none |
| §4.3 Check, `R_θ` | both entries | second `θ(σ₁−∂̄σ₀₁)` both sides; first `∂̄θ∧σ₁+θ∂̄σ₁−∂̄θ∧∂̄σ₀₁` both | true; HIS Thm 8.1 form | R03 |
| §4.4 Check, `δ` | `n = 1` | `β₁⁰ = z̄/(2πi|z|²) = 1/(2πiz)`; `−(−1)¹ = 1`; HIS Def 6.13 identical | true | none |
| Layer 4 example, Heaviside | `x>0`, `x<0` | `log(−z)` jumps `−2πi` across `x>0` ⇒ jump `1`; no cut for `x<0` | true | none |
| §5.1 extension | `U=∅`; `n=0` | `B(∅)=0`; discrete case extends arbitrarily, kernel supported in `V∖U` | holds | R03 |
| §5.2 Checks | `1/(1+2z)`, `x^m`, Cauchy bound | `φ^(k)(0)=k!(−2)^k`; `e^(−2)≈0.1353`; sums `1,3,7,15`; `1/m!`; `|L| ≤ M_r e^(1/r)` | true | none |
| §5.3 Check | `z=iy`; `z=e^(iθ)y` | `exp(−1/y²)` bounded; modulus `exp(cos2θ/y²)`, `cos2θ>0` for `θ<π/4` | true | none |
| `Suggested.lean` docstring | its flabbiness docstring | `𝓗ⁿ_(ℝⁿ)(O)` called `B_(ℝⁿ)` there, while the module docstring says there is no Sato sheaf | inconsistent | C03 |

- Source locators checked against text: 2 cited in the README (HIS Thm 2.14, p. 8; Komatsu Thm 19, p. 381), plus 11 further HIS and Komatsu locators offered in R03. Ito §§1.5–1.6 not verifiable.
- Library declarations opened at the pins: 75 names elaborated with `#check` (all resolve except bare `dsupport`); statements read in Tau Ceti `OneDimensional.lean`, `CauchyTransform.lean` (106, 270, 280, 319), `LocalCohomology/Module.lean` 40, `SupportedCohomology/Module.lean` 205, `MappingCocone/Relative.lean` 60–100, `Euclidean/Basic.lean` 57, `Planar/Basic.lean` 47, `PolynomialHull/Basic.lean` 283–427, `PolynomialHull/Exhaustion.lean` 73, `Sites/ExtensionByZero.lean` 315, `Sobolev/Poincare/W1p0.lean` 102; Mathlib `TestFunction.lean` 469, `Distribution.lean` 166, `Topology/Sheaves/Flasque.lean` 49, `Sites/Pullback.lean` 56.
- Cross-roadmap citations resolved on main: 26 ids (RealAnalyticGeometry R0, R3.0–R3.2; ComplexKahlerGeometry §§1.1, 1.3, 2.3–2.5, 3.1, 4.1, 5.1–5.3, 5.10; GlobalHolomorphicFunctions §§0.3, 7.1, 7.4; PseudodifferentialOperators Conventions, §P1.0, §6.2, §§9.1–9.2; BanachSpaceTheory B1, B2; ComplexManifolds Milestone 7). All are present.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Elaboration: `Suggested.lean` elaborates in 25 s; the only warnings are 7 `sorry`s. Elaborated types of all 11 declarations compared with the README: no lost binder, generality equal. One-tactic probes (`rfl`, `simp`, `infer_instance`, `exact` the separatedness lemma, `trivial`) fail on all 7 theorems, so there is no padding.
- Headline theorems: purity, flabbiness, compact duality, the distribution embedding, MalgrangeTopVanishing, Stein duality and microlocal purity. The statable cases (flat purity and flabbiness, Malgrange, 1-D gluing, Plemelj, 1-D embedding) are stated; the rest are named in the docstring.
- Overlap check: read ComplexKahlerGeometry (main and its open revision), ComplexComparisonPartII (main), GlobalHolomorphicFunctions (main), LocallyConvexDuality (open), RelativisticQuantumFieldTheory (open), plus PDE and AutomorphicSpectralTheory (main) found by object search. Ownership of shared objects:
  - c-soft compact-support functors are shared with ComplexComparisonPartII §C6.1 (two owners, R01);
  - the FS/DFS calculus is this roadmap's, and LocallyConvexDuality cites it;
  - the one-variable `∂̄` solver and Cousin I belong to GlobalHolomorphicFunctions and are cited here;
  - distribution local structure and `exp(1/‖x‖²)` belong to ComplexKahlerGeometry §5.2 and are cited here; that section defers the factorial-square example to this roadmap;
  - Poincaré and the Newtonian potential of smooth data belong to the pin and PDE (C04);
  - nuclear spaces belong to AutomorphicSpectralTheory §0.11 (C05);
  - RelativisticQuantumFieldTheory only consumes this roadmap.
- Source independence: 12 passages compared with 2 sources (HIS §§1, 2.4, 4.2, 6.1 (6.2) and (6.4), Thm 6.10, §7.2 Ex. 7.9/7.14, Def 6.13, Thm 8.1 and (8.8); Komatsu Thms 19, 6′, 12). They share only forced formulas. Largest share: HondaIzawaSuwa2018, 4 of 8 in-body source locators. Contents compared with HIS §§1–8: independent. Layer 0 merges HIS §§2.1–2.3, 3 and 4. Layer 2 (Malgrange, FS/DFS, Stein duality, proofs of purity and flabbiness) and Layers 3a and 5 have no HIS counterpart. The order Layer 3 → Layer 4 is forced by §4.1 needing §§3.1–3.4 and §4.3 needing §3.5.
- Research link: Layers 1–4 are the foundations of Sato's hyperfunction theory in the relative-Dolbeault form of Honda, Izawa and Suwa (arXiv 2018, v4 2022), whose Theorem 2.14 quotes purity and flabbiness. Layer 3a is the microlocal theory of Sato, Kawai and Kashiwara (1973) and Kashiwara–Schapira. This rests on the README's references and HIS §1.

## Not verifiable

- Y. Ito, *Theory of (vector valued) Sato hyperfunctions*, J. Math. Tokushima Univ. 20 (1986), §§1.5–1.6 (Layer 2 route). Not found through the sources service, CiNii, the Tokushima repository or a web search; only Ito's later 1999 and 2002 papers in the same journal surfaced.
- Sato–Kawai–Kashiwara, LNM 287 (1973), and Kashiwara–Schapira, *Sheaves on Manifolds*, Chapters III–IV (Layer 3a). Publisher texts behind paywalls; not read.

## Source issues

- none

## For the human reviewers

- Not tested: Ito 1986 (README line 311, the Layer 2 route source) has no legal copy found, so its §§1.5–1.6 were not compared. The microlocal sources SKK 1973 and Kashiwara–Schapira (line 921) were not read either (paywalled).
