# Review of ComplexTori (pull request #2550 at e4cd103)
**Verdict:** accepted

**Summary.** Accepted, with no findings. The previous review found one headline missing from `Suggested.lean`: holomorphic local triviality of a period family when its periods vary by complex-linear automorphisms (§2.3). It is now stated there, on the pinned carriers. It elaborates, it is true (the inverse `[y, v] ↦ (y, [g(y)⁻¹ v])` is well defined), it agrees with the README, and the pins do not already prove it. The earlier small corrections and format notes are repaired. Every Check and worked example I recomputed holds. Two small corrections remain (the radius of the meridian in Convention 7, and an ambiguous "original family" in the overview) and one format note, none blocking. Nothing is left for a human to decide.

## C01 — Convention 7 puts the meridian at radius `r`, outside the open discs of radius `r` on which it is used

An implementer who takes `r` to be the radius of Layer 5 gets a loop that does not lie in `D_z*`. Convention 7 (line 96) defines the meridian as `s ↦ r·exp(2πis)`, and Layer 5 (line 678) sets `D_z = {‖z‖ < r}`. But `‖r·exp(2πis)‖ = r`, which is not less than `r`. Writing `s ↦ ρ·exp(2πis)` for some `0 < ρ < r` would fix it; its class in `π₁(D_z*)` does not depend on `ρ`.

## C02 — In the overview, "the original family" reads as the family upstairs, but the gauge identifies the quotient with the family downstairs

The headline at lines 28–30 says that the gauge identifies "the quotient minus its central fibre with the original family over the punctured disc". The only family the paragraph has introduced is the one over the `z`-disc on which `C_m` acts. That family is not the right one. It is an `m`-fold cover of `Q*`. By §6.3 (line 835), the gauge is `Q* ≃ Y*` over `D_t*`, where `Y` is the family whose pullback by `z ↦ z^m` is the family upstairs. Such a `Y` always exists for translations: at the fixed point `0`, injectivity of `Π(0)` forces `ρ = 1`, so each `Π(z)λ` is invariant under rotation and is a holomorphic function of `z^m`.

A possible rewording: "…with the family over the punctured `t`-disc whose pullback by `z ↦ z^m` is the given family".

## N01 — Convention 2 lists "Hausdorff and second countable", while the stated theorem and every cited Tau Ceti family declaration assume "Hausdorff and locally compact"

This is at lines 68–69, against `Suggested.lean` line 115 and README line 1009. Would you add local compactness to Convention 2? It is automatic for a finite-dimensional model (Mathlib `Manifold.locallyCompact_of_finiteDimensional`).

## Verified sound

| Statement | Instances tried | Values computed (text / computed) | Result | Change |
|---|---|---|---|---|
| §1.1 translation quotient, Checks | `L = ℤ` in `ℂ`; `L = ℤ+√2ℤ+iℤ` | `ℂ/ℤ ≅ ℂ∖{0}` via `exp(2πiz)`, not compact / same; `ℤ+√2ℤ` dense, quotient not Hausdorff / same | true | none |
| §1.3 kernel, components, bijectivity | `f(z,w)=2z`, `L=ℤ[i]²`; `f(z)=(z,0)`; `×2` on `ℂ/ℤ[i]` | 4 components (`ℤ[i]/2ℤ[i]`) / 4; `(L'∩range f)/f(L)=0` vs `L'/f(L)≅ℤ[i]`; kernel order 4 / 4 | true; pin's `(L'∩range f)/(L'∩f(L))` agrees | none |
| §1.4 homology, universal cover | `α = 1+i` on `ℂ/ℤ[i]` | `H₂` multiplication `|α|² = 2` / det `(1,−1;1,1) = 2`; ranks `1,2,1` / `binomial(2,k)` | true | none |
| §2.1 period separation | `ℍ`, `a+bτ`; `τ = it` | bound `min(1, Im τ)` / `|a+bτ| ≥ |b| Im τ`; period `τ` has norm `t → 0` | Check true | none |
| §2.2 total space | `E = 0`; constant periods `ℤ[i]` | `Λ = 0`, total space `Y` / same; `Y × ℂ/ℤ[i]` / same | true | none |
| §2.3 local triviality (headline, stated) | constant periods, `g = 1`; `ℍ` family | product / product; `g(τ)·1 = 1` forces `g = 1`, `τ = τ₀`: hypothesis fails on open sets, as Check says | true; Lean statement = README | none |
| §2.5 marking Check | `τ = i`, multiplication by `i` | `(0,−1;1,0)` / `1 ↦ (0,1)`, `i ↦ (−1,0)`; displacement `Γ0−Γ1` gives `(−1,0)` / same | true | none |
| §3.2 affine cocycle law | `C₂` on `ℂ`, `R = 1`, `b = ½` | `b_{g²} = ½+½ = 1 ≡ 0 = b_1` / holds; `b = 0` gives the linear action | true | none |
| §3.3 freeness Check | same, fixed point `0` | `(1−A)T = 0 ∌ ½`: free / free; linear action fixes `(0,0)` / same | true | none |
| §3.4 monodromy `ρ(g⁻¹)` | `ℤ` on `ℂ`, `R_n = iⁿ` | transport `R_{−1} = −i` / `ρ(−1) = −i`; other convention gives `i` | consistent | none |
| §4.2 period and exact order | `A=1, t=⅓, m=2`; `t=½, m=4` | `N₂ = ⅔ ≠ 0` / order 3; `N₄ = 2 = 0`, `N₂ = 1 = 0` / exact order 2 | true; pin also requires `N_m = 0` | none |
| §4.3 conjugacy and `H¹` | `A=−1, m=2`; `A=1`; `ZMod 2`, `σ = id` | `H¹ = 0`, `b = −t/2` gives `t+2b = 0`; `T[2] ≅ (ℤ/2)²`; `N = 2x = 0` | true; pin gives `t + (b − Ab)` | none |
| §4.4 fixed points, freeness | `A = diag(1,i)`, `t = (½,0)`, `m = 4` | `N₄ = (2,0) = 0`; `t ∉ 0×T`; `N₂ = (1,0) = 0`, square fixes `(x₁,0)` / faithful, not free | true | none |
| §4.5 connecting class (headline) | trivial action, `m=3, t=⅓`; `A=−1, m=2` | `δ[⅓] = [1]`, `1−(−1) = 2 ∉ 3ℤ[i]` / sign detected; `Λ^A = 0`, `H² = 0 = H¹` | true; pin sign positive | none |
| §4.6 trivial action | `Λ = ℤ[i]`, `m = 2` | `|T[2]| = |Λ/2Λ| = 4`; points of exact order 2: three | true | none |
| §5.1 total action | `R_ζ(0) = 1` | condition `kt ≠ 0` for `0<k<m`, with `mt = 0` / exact order `m` | matches pin | none |
| §5.2 map to the disc | `m = 2`, chart `u = z`; `m = 1` | `dp_Q = 2u du`, zero only on `F` / submersion off `F`; `p_Q = z` | true | none |
| §§5.3–5.4 multiplicity, normal character (headline) | `m = 2` model; normal vector `∂_z` | `t = u²`, multiplicity 2; `∂_z ↦ ζ∂_z`: character `ζ`, order `m` | true; not statable, docstring reason checked | none |
| §5.5 adjunction | `m=2, A_E=1`; `A_E = diag(1,−1)` | `K_Q|_F = (ζ det A)⁻¹ = −1`, `N = −1`, `K_F = 1`: `1 = (−1)(−1)`; bielliptic `K_F = −1` | true | none |
| §6.2 cyclic correction | `m = 2`; general `m` | `c(−z)−c(z) = −f(z)` / computed; general: `−(1/m)[f + (m−1)f] = −f` | true; pin formula identical | none |
| §6.3 gauge (headline) | generator `(ζz, e+Πλ/m)`; branch shift `2πik` | invariant via `Log(ζz) = Log z + 2πi/m`; adds period `−Π(kλ)`; other sign off by `2Πλ/m`, not a period for `m ≥ 3` | true | none |
| §6.4 regluing | `M = D_t×E`, `m = 2`, 2-torsion translation | glue `M∖Y₀` to `Q` along `Y* ≅ Q*` / result `Q`, multiplicity-2 transform | consistent with BogomolovTschinkel2003 line 104–107 | none |
| §6.6 reversal | `m = 3`, `λ = 1` | generator `ζ²` gives `2λ ≡ −λ` mod `3Λ` / `λ ↦ −λ`; `H¹` class negated | true | none |
| Layer 1–2 headlines (proved at pin) | `ℂ/ℤ[i]`; `ℍ` family | homology ranks `1,2,1`; trivialisation `(Re v − Re τ·Im v/Im τ, Im v/Im τ)` / recomputed | true | none |
| Convention 7 meridian | `D_z = {‖z‖ < r}` | loop norm `r` / not `< r`: loop outside `D_z*` | slip | C01 |
| Overview gauge sentence | `X = β_m^*Y`, `Y` non-constant | text: `Q* ≅` "original family"; §6.3: `Q* ≃ Y*`; `X* → Q*` is `m`-fold | ambiguous | C02 |
| Convention 2 vs §2.3 | infinite-dimensional model `EY` | Convention: T2 and second countable / Lean and Tau Ceti: T2 and locally compact | form | N01 |

- Earlier findings: the previous R01 is repaired (`Suggested.lean` line 112; README lines 295–303 and 933–936). C01 is partly repaired, which is enough: §3.4 (line 447) and the Layer 5 introduction (lines 688–689) now mark the roadmap's own normalisations, and Layer 6 cites pages at §§6.2–6.4. C02 is repaired (lines 791–794), and so are N01 and N02 (lines 234–235). Both earlier questions are answered (docstring lines 56–64; Brown replaced by Milne).
- Source locators checked against the text: 7 of 11. These are MilneCFT line 3174 (Ex. 1.20, p. 66), line 3191 (Rem. 1.21, p. 66) and line 3793 (Prop. 3.4, p. 81), and BogomolovTschinkel2003 lines 74–109 (§3, pp. 3–4), as cited at Layer 6 and §§6.2, 6.3 and 6.4. The other 4 (Birkenhake–Lange ×2, BHPV ×2) are paywalled.
- Library: all 172 qualified names backticked in the README resolve at the pins, checked by `#check` in one elaboration. I opened the statements of the sampled ones, including `OrbitRelQuotient.lean:317,341`, `Cyclic/Affine.lean:201,400,411,427,497`, `CyclicAutomorphism.lean:279,294,313`, `RotatedDisc.lean:105,159,191`, `BirkhoffSum/Cyclic.lean:73,121`, `Family/AffineAction.lean:353`, `Family/Manifold.lean:112` and `RootsOfUnity/Quotient.lean:139`, and Mathlib `Instances/Quotient.lean:50`, `Analytic/Order.lean:49` and `Meromorphic/Order.lean:50`.
- Cross-roadmap citations resolved on main: ComplexManifolds Milestones 1 and 4–7 (7.4–7.6; its open revision keeps Milestone k = Layer k); AlgebraicTopology §§2.6, 5.4 and 5.5; GeometricTopology §§1.1 and 1.3; SmoothRepresentationsOfLocalGroups SR.0d.2; Completed UniversalCovers and AnalyticToricGeometry; FuchsianOrbifolds. The four downstream consumers (AbelianSchemesAndArithmeticModuli A5.1/A5.6/A5.8, BallQuotientsAndComplexHyperbolicLattices §8.2, ComplexKahlerGeometry, GeometryOfNumbersAndQuadraticArithmetic §6.1a) all resolve through the milestone mapping.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The suppliers are unchanged from main. All automatic checks passed.
- Elaboration: `Suggested.lean` exits 0, and its only warning is the `sorry` at line 112. The `#check` of the theorem shows every binder present, matching README §2.3. The one-tactic probe (`simp`, `rfl`, `infer_instance`) fails. `TauCeti.torusFamilyChartedSpace` is Mathlib's `AddAction.instChartedSpaceQuotient` for the period action, so the theorem is about the installed atlas.
- Not a duplicate: neither Tau Ceti nor Mathlib at the pins has a holomorphic trivialisation of a torus family (the only one is the real `TauCeti.torusFamilyDiffeomorphProd`), and no roadmap states the §2.3 theorem.
- Description: its counts hold (18 Check blocks with 28 bullets, about 150 Tau Ceti declarations, four consumers). No sentence is contradicted by the head, and the milestone-to-section mapping matches main's items.

Overlap check: read ComplexManifolds (main and its open revision), FuchsianOrbifolds (main and its open revision); nothing shared: ComplexManifolds owns quotients, gluing and line bundles and defers complex-torus families to this roadmap; FuchsianOrbifolds mentions tori only in genus Checks.

Source independence: 10 passages compared with 2 sources (MilneCFT: the Layer 4 introduction and the prose of §§4.3 and 4.5; BogomolovTschinkel2003: the introductions to Layers 5 and 6, §§5.5, 6.1, 6.2, 6.3 and 6.4). No shared run is longer than two words, and those are forced terms ("elliptic fibrations", "logarithmic transform"). The largest share of locators is BogomolovTschinkel2003, 4 of 11. Its §3 is a single one-page section; the order of Layers 5–6 is forced by the *Needs:* lines of §6.3 (§§6.1–6.2) and §6.4 (§6.3), and the scope of each layer is the roadmap's own: independent. The contents of Birkenhake–Lange and BHPV were not read.

Research link: Layers 5–6 formalise Kodaira's logarithmic transforms (Kodaira, Amer. J. Math. 86, 1964). Bogomolov–Tschinkel (2003, §3, Prop. 3.1) use them to build special elliptic fibrations, keeping simple connectivity and the Kähler property. This rests on BogomolovTschinkel2003 §3, which I read, and on the README's references.

## Not verifiable

- Birkenhake–Lange, *Complex Abelian Varieties*, Chapters 1 and 8 (Layer 1 introduction, line 104; Layer 2 introduction, line 235): Springer, paywalled; the sources service records it as uncertified, and the publisher page requires a login.
- Barth–Hulek–Peters–Van de Ven, *Compact Complex Surfaces*, Chapter V, "Logarithmic Transformations", p. 216 (Layer 5 introduction, line 686; Layer 6 introduction, line 778): Springer, paywalled; uncertified.

Automatic checks set aside as false positives: the citation lookup reports the module `TauCeti.Topology.Algebra.Module.DiscretePreimage` (README line 1045) as found nowhere, but the module exists at the pin and imports cleanly. The declaration extractor reads the docstring words "structure of" (`Suggested.lean` lines 61–62) as a declaration named `of`. So the computed list of added declarations and the signature report both show a nonexistent `of`.

## Source issues

- none

## For the human reviewers

- none
