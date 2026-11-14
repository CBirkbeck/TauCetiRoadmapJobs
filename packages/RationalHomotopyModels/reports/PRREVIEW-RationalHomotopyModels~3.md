# Review of RationalHomotopyModels (pull request #2298 at 4280e56)

**Verdict:** needs changes

## R01 (P3) — The Massey-product supplier is cited at the wrong target and missing from 7.4's needs

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:205`: “Layer 8: Massey products (7.2, Examples).”; and line 1128 (7.4): “all Massey products vanish”, whose `*Needs:*` line (1130–1134) names no DGAInfinity layer.

**Claim:** Massey products are used by 7.4 only; 7.2 and no `### Examples` block mention them, and the one target that asserts their vanishing does not list the layer that defines them.

**Witness:** `grep -n Massey README.md` gives lines 77, 205, 1128, 1182, 1183: none in 7.2 (1075–1095) or in an Examples block. Line 1130: “*Needs:* 7.1, 7.3; ComplexKahlerGeometry §6.3; DifferentialGeometry …”.

**Repair:** Line 205: “Layer 8: Massey products and their comparison with the transferred operations (7.4).” In 7.4's `*Needs:*`, after “7.1, 7.3;”, insert “DGAInfinity Layer 3 (formality as a DG algebra) and Layer 8 (Massey products);”.

## R02 (P3) — The characteristic-zero convention is narrower than two Lean statements

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:103`: “Every theorem about Sullivan algebras, polynomial forms or DG Lie algebras assumes `[CharZero K]`”.

**Claim:** `IsSullivanAlgebra.isMinimal_iff` (1.2) and `IsFreeGradedCommutative.exists_dgAlgHom_iff` (1.3) are stated in `Suggested.lean` over an arbitrary field, and hold there; the README's generality differs from the Lean signatures.

**Witness:** `#check @IsSullivanAlgebra.isMinimal_iff`: `∀ {K} [Field K] {A} [Ring A] [Algebra K A] {𝒜} [GradedAlgebra 𝒜] {ι} [LinearOrder ι] {x} {deg} [WellFoundedLT ι] {d}, …`, no `CharZero`; likewise `exists_dgAlgHom_iff` (`Suggested.lean:151`, `:160`).

**Repair:** Replace the sentence by: “The universal property of 1.1 and every theorem of Layers 2–7 assume `[CharZero K]`; the definitions of Layer 1 and 7.1 and the two criteria of 1.2 and 1.3 are stated over an arbitrary field, where they hold (both sides of each criterion are derivations determined on generators)”.

## Verified sound

Previous review's findings against this head (`README.md` unless named):

| Previous id | Passage at this head | Disposition |
|---|---|---|
| R01 | 3.3: “Route: induction through the canonical Hirsch stages … No homotopy inverse is used”; Check “Negative control for a route through indecomposables” | Repaired |
| R02 | 6.4: “`λX = N P ℚ̂[GX]`: `GX` is the Kan loop group …”; 5.4: “`C₀ = K` and `C₁ = 0`” | Repaired |
| R03 | Research context: “A simply connected space with finite-dimensional total rational cohomology is either elliptic …” | Repaired |
| R04 | “for an almost free action of an `n`-torus on a compact Hausdorff space `X`” | Repaired |
| R05 | “For a connected CW complex `X` pointed at a vertex, the Bott–Samelson theorem” | Repaired |
| R06 | “§0.1: the wedge of forms; §0.4: bundled smooth forms …; §§1.1–1.4: the exterior derivative” | Repaired; all seven pinned names resolve |
| R07 | 2.1: “the restriction to the bottom edge `t = 0` and the right edge `s = 1` … is a surjective quasi-isomorphism” | Repaired |
| R08 | 4.1: “omitting the second relation prevents the differential from descending to the quotient” | Repaired |
| R09 | 5.1: “agree on algebras concentrated in even degrees. Odd abelian algebras also satisfy both” | Repaired |
| R10 | 7.2: “the complements are the `N₁ = ⟨z + ax + by⟩`, `a, b ∈ K`” | Repaired |
| R11 | 1.3: “sending `e` to `0` and to `dt` are distinct but induce the same cohomology map” | Repaired |
| R12 | `**API.**` lists in 1.1, 1.2, 2.1, 4.1, 4.3, 5.1–5.4, 6.1, 6.4, 7.1, 7.4 | Repaired |
| R13 | Layer 1 Examples: “for `k ≥ 1`, the even sphere `S^(2k)`” | Repaired |

Adversarial table (values recomputed at this head):

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| 1.1 `existsUnique_algHom` | `ι = ∅`; one odd generator into `K[s]`, `s² ≠ 0` | Basis `{1}`; `x² = 0` in `A` | `A = K`; `φ(x)² = s² ≠ 0`, excluded by `hB` | Holds; none |
| 1.2 `isMinimal_iff` | `Λ(u₁,v₂)`, `du = v`; `Λ(x₂,y₃)`; any field | `v ∉ A⁺·A⁺`; `x² ∈ A⁺·A⁺` | `d(A⁺)` not in `A⁺·A⁺`; `d(xᵏy) = x^(k+2)` decomposable | Both directions agree; R02 on the convention |
| 1.2 cyclic non-example | `dx = yz, dy = zx, dz = xy` | `ker(d|A¹) = 0`; `A¹` is all generators | First generator must be closed | Not Sullivan, as claimed |
| 1.3 `exists_dgAlgHom_iff` | `x ↦ s`, `y ↦ 0` into `K[s]/s²`, `K[s]` | `dB φ(y) = 0` | `φ(dy) = 0`; `s² ≠ 0` | Extends; fails; none |
| 2.1 interval, square `ρ` | `p(s)+q(t)−p(1)`; `∫₀¹` on `a⊗tⁿ`, `a⊗tⁿdt` | Restricts to `(p, q)`; `d∫+∫d = a`, `0` | Fibre condition `p(1) = q(0)`; `ε₁−ε₀ = a`, `0` | Onto; `H = K` both sides; sign `(−1)^|a|` right |
| 2.2 `exists_lift` | `K → Λ(t,dt)`, `g(e) = dt`; `Λ(u,v) → Λ(u)` | Lift lands in `K¹ = 0`; closed `cu` forces `c = 0` | `g ≠ 0` | Both hypotheses needed; none |
| 2.3 transitivity example | `Φ(e) = d(us + ut)` | `t=0`: `d(us)`; `s=1`: `du + d(ut)` | `H₁`, `H₂`; diagonal `d(2ut)`: `0 → 2du` | Agree |
| 2.4 homotopy classes | `Λ(e₁) → Λ(a₁)`; source `K[x]/x²` | `[M,A] = H¹ = K`; `(cx)² = c²x² ≠ 0` unless `c = 0` | `K`; identity class not hit | Sullivan source needed; Sullivan1977 (3.6) |
| 3.1 `exists_minimalModel` | `A = K`; `A = K × K` | `ι = ∅`, `M = K` | `finrank H⁰ = 2 ≠ 1`, excluded | Holds; universe `max u v` suffices |
| 3.2 `exists_iMinimalModel` | `i = 0`; `p < 0`; `Λ(a₁,b₁)`, `i = 1` | `ι = ∅`; `Hᵖ = 0` both; `M = A` | `H⁰` iso, `0 → H¹` injective | Holds; Morgan1978 (5.3), (5.6) |
| 3.3 rigidity | Stage sequence `0 → coker H^(k+1) → S/N^(k+1) → ker H^(k+2) → 0`; Heisenberg `H` | Exact: closed `z = dw`, `w ∈ M^k ⊆ N`; `dH(z) = xy − x dt` | `H(x)H(y) = xy − x dt` | Route sound; `Q` differs `z` vs `z + x` |
| 3.4 `exists_iso_of_minimalModels` | `Λ(e)`, maps `id`, `2` | `e ↦ e/2` | `2·(e/2) = e` | Holds via 2.4 and 3.3 |
| 3.5 three statements | `ℚ → ℝ`, `Λ(x₂,y₃)`; `e ↦ 2a` | `d(1⊗y) = (1⊗x)²`; `H¹(F) = 2` | Decomposable; invertible in `L` | Hold; no pinned base change of maps |
| 4.2 Poincaré, extension | `n = 1`; pair `(a,b)` | `∫ q dt` exists in char 0; `a + (b−a)t` | `H¹ = 0`; endpoint values `(a,b)` | Agree |
| 4.3 `A_PL(X)` | `Δ¹/∂Δ¹`; conventions `∂₀, ∂₁` on `t₁` | `{ω : ε₀ω = ε₁ω}`, `dt` not exact there; `1`, `0` | `H¹ = K`; `θ*(t₁) = t₀ = 1`, `0` | Agree with Hess2007 Def. 1.19–1.20 |
| 4.4 de Rham | `t·dt` on `Δ¹` | `∮ = 1/2` | Cups `0` and `1` | Not multiplicative on cochains, as stated |
| 5.1 signs | `x` odd; `u = dx`, `|x| = 2` | `[x,[x,x]] = −2[x,[x,x]]`; `d[x,u] = [u,u]` | `3[x,[x,x]] = 0`; `d[u,x] = −[u,u]` | Consistent with antisymmetry |
| 5.2 Chevalley–Eilenberg | `[eⱼ,eₖ]`; Heisenberg; `d_L v = u` | `ι_k ι_j dxᵢ = −cⁱⱼₖ`; `dz = −xy`; `du′ = −v′` | `−xᵢ([eⱼ,eₖ])`; Sullivan order `Z², Z³, W², Z⁴, …` exists | Agrees with LieGroupoidsPoisson G1.3's sign in degree 1 |
| 5.3 homotopy Lie algebra | `Λ(x₂,y₃)`; Heisenberg; Félix–Halperin pairing | `ι_sa ι_sa x² = 2`; `ι_sY ι_sX (xy) = 1` | `[a,a] = 2b`; `[X,Y] = −Z`; theirs `2b`, `+Z` | Agree; source formula read at p. 11 |
| 5.4 Quillen's functors | `C = ℚ ⊕ ℚσ₂`; `C₁ ≠ 0` | `𝓛(C) = 𝕃(s⁻¹σ)`, degree `1` | Generator in degree `0` | In/out of the reduced category as stated |
| 6.1 realization | `K`; `Λ(t,dt)` | One augmentation; quasi-isomorphic to `K` | `Δ⁰`; contractible | Agree; Hess2007 Def. 1.22 |
| 6.2 generators | `Λ(u₂,v₃)`, `du = v` | `π₂⟨ΛV⟩ = 0` | `Hom(V², ℚ) = ℚ` | Minimality needed, as stated |
| 6.3 classification | `S² × S⁴`, `ℂP³` | Betti `1,1,1,1` both | `x² = 0` vs `x² ≠ 0` | Models distinguish; Hess2007 Cor. 1.26 |
| 6.4 `λ` | `S²`, `S³`, Moore space | `𝕃(a₁)`: `a, [a,a]`; `𝕃(a₂)`: `a`; `db = 2a` | Ranks `(1,1)`; `(0,1)`; acyclic | Agree |
| 6.5 Quillen equivalence | `ℂP^∞` vs `S²`; `⋁_ℕ S²` | Abelian `⟨a₁⟩` vs `[a,a] ≠ 0` | Same `π₂ ⊗ ℚ` | Bracket distinguishes; text not readable |
| 7.1 `IsFormal` | `d = 0` commutative; `M₂(K)`; Heisenberg | `M = A`; `H⁰(M)` commutative; `ψ(x)ψ(z) ∈ H¹·H¹ = 0` | `M₂(K)` not; `[xz] ≠ 0` | Accepts, rejects, rejects |
| 7.2 `isFormal_of_complement` | `Λ(x₂,y₃)`; Heisenberg all `N₁`; `Λ(x,y,ψ,φ)` | `d(xᵏy) ≠ 0`; `[xz + b·xy] = [xz] ≠ 0`; `d(xφ − yψ) = 0` | Closed part `0`; exact degree-2 part `⟨xy⟩`; nothing exact in degree 5 | Proof checked: `ψ(z) = [z]` on closed `z` |
| 7.3 `isFormal_of_ddc` | `dᶜ = 0`; `dᶜ = d`; `du = v`, `dᶜ = 0` | Hypothesis forces `d = 0` (twice); `v ≠ d dᶜ e` | Formal by 7.1; hypothesis fails | Both quasi-isomorphisms rederived from the hypothesis alone |
| 7.4 Kähler manifolds | Leibniz on `ℝ²`; Kodaira–Thurston | `d(dx ∧ y) = dy ∧ dx` | `0 − dx ∧ dy`; `b₁ = 3` odd | Agree; Massey supplier R01 |

- Source locators checked against the text: 27 (Hess2007 12, Morgan1978 8, Sullivan1977 6, Félix–Halperin survey 1); Hess numbering and p. 20 for Definition 2.20 confirmed in arXiv version 1, the version the References name.
- Pinned declarations opened: every name of the two library contracts (about 50), all present (e.g. `TauCeti.IsDGAlgebra` `Defs.lean:206`, `DGAlgHom` `Hom/Basic.lean:50`, `SmoothForm.mextDeriv_mextDeriv` `Squared.lean:83`, `SmoothForm.wedge_comm` `Wedge/Smooth/Basic.lean:239`); no pinned graded-commutativity predicate, Sullivan algebra, polynomial forms or base change of DG maps.
- Cross-roadmap citations resolved: 8 supplier roadmaps (DGAInfinity Layers 0, 1, 3, 4, 8; AlgebraicTopology §§4.7, 6.2, 8.3, 8.5; GeneralizedCohomology G2.1; StableHomotopyKTheory §§3.36–3.37; ComplexKahlerGeometry §6.3; DifferentialGeometry 0.1, 0.4, 1.1–1.4, 6.1 on main; DerivedDeRhamCohomology §2.21 and ArithmeticLocallySymmetricSpaces §ALS.F.5 at their open heads); EllAdicHomotopyTypesAndWeights addresses its five contracts to these sections.
- Dependency check: `depcheck: 242 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check 0 at this head; `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else.
- Signatures: 20 `#check @name` types compared with the README; no lost binder; one generality difference (R02).
- Padding probe: each of the 13 theorems tried with `rfl`, `simp`, `infer_instance`, `trivial`, `assumption`, `exact?`: none closes. Headlines: 13 stated; the docstring names 2.1, 2.3–2.5, the homotopy parts of 3.4, Layers 4–6 and 7.4 with the missing carrier of each.
- Pull request text: title and description agree with the head (new folder, 20 declarations, 13 theorems, 6 suppliers on main and 2 open); no change outside the folder.

Overlap check: read EllAdicHomotopyTypesAndWeights, KanQuillen, SuperconnectionsAndMathaiQuillenForms, DeRhamCohomologyAndDuality, DGAInfinity, SymplecticFieldTheory; Sullivan algebras and polynomial forms: this roadmap (EllAdicHomotopyTypesAndWeights consumes them); DG carriers, coalgebras, `A∞` formality and Massey products: DGAInfinity; nothing else shared. Ordinary Lie algebra cochains are cited to ArithmeticLocallySymmetricSpaces §ALS.F.5; LieGroupoidsPoisson G1.3 on main covers real Lie algebras only.

Source independence: 27 passages compared with 4 sources, none shared beyond formulas and theorem statements the mathematics fixes; largest share Hess2007, 23 of about 80 locators; contents compared with Hess2007 (§1 foundations, §§2.1–2.4 applications): independent. FHT2001 and DGMS1975 could not be read.

## Not verifiable

- FHT2001: settled uncertified; §§3, 10, 12, 17, 21–24 (sampled 1.1, 4.2, 5.2, 5.4, 6.5) checked by computation only.
- DGMS1975: settled uncertified; §4 Definition, Theorem 4.1, p. 261, §6 Main Theorem and Corollary 1 (sampled 7.4) not read; 7.2 and 7.3 were reproved here.
- Quillen 1969 (Theorem I, Part I, Appendix B; sampled 5.4, 6.5): the DOI resolves to a JSTOR page with no open text.
- Bousfield–Gugenheim 1976 (2.5, 6.1, 6.3): the DOI resolves to an AMS page with no open text.
- The remaining references of the Research context were not fetched; they support no target.

## Source issues

- **Error** in Hess2007 at the paragraph before Proposition 1.13, printed p. 6: the source says the cell class generated by its set `I` is exactly the relative Sullivan algebras; it should exclude the generating map from the free algebra on a degree-zero class to the ground field, which is no inclusion; affects a stated result.
- **Misprint** in Hess2007 at the paragraph before Proposition 1.14, printed p. 7: the source says the interval is the complex `D(1)`; it should be the free commutative algebra on `D(1)`; affects nothing.
- **Error** in Hess2007 at the proof sketch after Proposition 1.18, printed p. 8: the source says an endomorphism of a minimal relative Sullivan algebra homotopic to the identity equals the identity; it should say it is an isomorphism (Heisenberg algebra, `z ↦ z + x`); affects the proof.
- **Error** in Hess2007 at Theorem 1.24(2), printed p. 10: the source says the homotopy groups of the realization are dual to the generators for every simply connected Sullivan algebra of finite type; it should require minimality (`Λ(u₂, v₃)`, `du = v`); affects a stated result.

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 are settled uncertified, and Quillen 1969 and Bousfield–Gugenheim 1976 have no open text; wording and locators of Layers 5–7 were compared with Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey only.
- **Licence.** No public formalisation resembling `Suggested.lean` was found among the pinned libraries or the open roadmaps; none was searched for outside them.
