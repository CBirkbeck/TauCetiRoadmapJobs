# Review of ComplexTori (pull request #2550 at e4cd103)
**Verdict:** accepted

**Summary.** Accepted, with no findings. The head is the one the previous review read, so its two small corrections and its format note still stand and are repeated here as C01, C02 and N01. I recomputed every Check, worked example and convention, read the two open sources at their locators, and opened the library statements of the sampled sections at the pins; nothing false turned up. One further small correction (C03): §6.6 asks for a computation on `π₁` without stating its value, and the value is short. Three small corrections and one format note, none blocking; nothing is left for a human to decide beyond the note on the two paywalled textbooks.

## C01 — Convention 7 puts the meridian at radius `r`, which is the boundary of the open disc of radius `r` used in Layers 5–6

A reader who takes `r` to be the radius of Layer 5 gets a loop that is not in `D_z*`. Convention 7 (line 96) defines the meridian as `s ↦ r·exp(2πis)`; Layer 5 (line 678) sets `D_z = {‖z‖ < r}`, and `‖r·exp(2πis)‖ = r` is not `< r`. Writing `s ↦ ρ·exp(2πis)` for any `0 < ρ < r` (or `0 < ρ < r^m` in `D_t*`) repairs it; the class in `π₁` does not depend on `ρ`.

## C02 — In the overview, "the original family" has no referent except the family upstairs, and the gauge does not identify the quotient with that one

The overview (lines 25–30) introduces one family, the one over the `z`-disc on which `C_m` acts, and then says the gauge identifies "the quotient minus its central fibre with the original family over the punctured disc". By §6.3 (line 835) the gauge is `Q* ≃ Y*` over `D_t*`, where `Y` is the family over the `t`-disc whose pullback by `z ↦ z^m` is the family upstairs. Read with the upstairs family the sentence is not the theorem: for `Π_Y(t)(a, b) = a + b(i + t)` the `j`-invariant of the fibres of `Q*` is `j(i + t)`, with `j − 1728` vanishing to order 2 at the puncture, while on `X*` it is `j(i + z^m)`, vanishing to order `2m`, so for `m ≥ 2` no biholomorphism of the total spaces exists (it would preserve fibres and cover `z ↦ cz`).

A wording that matches §6.3: "…identifies the quotient minus its central fibre with the family over the punctured `t`-disc whose pullback by `z ↦ z^m` is the given family, so the quotient can be glued into any complex manifold containing that family over the `t`-disc".

## C03 — §6.6 asks to "compute" the maps on `π₁` and `H₁` without stating the value, although the main one is a one-line consequence of §6.3

An implementer of §6.6 (lines 877–883) has no statement to prove for the first sentence, and "reversing the meridian inverts them" has no object until the value is given. From the formula for `G⁻¹` of §6.3: the loop `s ↦ (t₀·exp(2πis), [0])` in `Y*` goes to the image in `Q` of the path `s ↦ (z₀·exp(2πis/m), [(Log z₀/2πi + s/m)·Π_Y(t)λ])`, which runs from a point to its image under the generator. Since `Q` retracts onto `F = T_0/C_m` and `π₁(F) = Λ + ℤ·λ/m ⊂ Λ ⊗ ℚ`, the meridian of `D_t*`, carried on the zero section of `Y`, maps to `λ/m` in `π₁(Q)`; reversing it gives `−λ/m`, in agreement with the reversal law stated in the same section (for `m = 3`, `λ = 1`: generator `ζ⁻¹ = ζ²` gives `2λ ≡ −λ mod 3Λ`). Would you state this value in §6.6? The same applies to the last sentence of §6.5 (line 871), "State how the result changes when this class changes", which names no statement.

## N01 — Convention 2 lists `Y` as Hausdorff and second countable, while the stated theorem of §2.3 and every cited Tau Ceti family declaration assume Hausdorff and locally compact

Lines 68–69 against line 297, `Suggested.lean` line 115 and the supplier contract at line 1009. Adding local compactness to Convention 2 (automatic for a finite-dimensional model) would align them.

## Verified sound

| Statement | Instances tried | Values computed (text / computed) | Result | Change |
|---|---|---|---|---|
| §1.2 Lie group (sample) | pin `Geometry/Manifold/Algebra/Quotient.lean:86` | README: `LieAddGroup 𝓘(ℂ,E)` every smoothness / pin: `LieAddGroup 𝓘(𝕜, E) n` for discrete `L` | agrees | none |
| §1.3 induced maps (sample) | `f(z,w)=2z`, `L=ℤ[i]²`; `f(z)=(z,0)`; `×2` on `ℂ/ℤ[i]` | 4 components / `ℤ[i]/2ℤ[i]` order 4; `(L'∩range f)/f(L)=0`, `L'/f(L)≅ℤ[i]`; kernel order 4 / 4 | true; pin `OrbitRelQuotient.lean:317,341` agree | none |
| §1.4 homology (headline) | `α=1+i` on `ℂ/ℤ[i]` | `H₂` factor `|α|²=2` / det `(1,−1;1,1)=2`; ranks `1,2,1` | true | none |
| §2.1 period action (sample) | `ℍ`, `a+bτ`; `τ=it`, `t→0` | bound `min(1, Im τ)` / `|a+bτ| ≥ |b|·Im τ`, `|a| ≥ 1`; no global bound | true; pin `Family/Basic.lean:191` | none |
| §2.3 local triviality (headline, in Lean) | constant periods `g=1`; `ℍ` family; `E=0`; `y₀ ∉ U` | product / product; `g(τ)·1=1` forces `τ=τ₀`; `Λ=0`, map is `U ≃ p⁻¹(U)`; inverse well defined: `g⁻¹(v+Πyλ)=g⁻¹v+Πy₀λ` | true; Lean = README | none |
| §2.4 topology, base change (sample) | pin `Family/Topology.lean:93`, `BaseChange/Basic.lean:94` | proper from continuity and injectivity / same; homeomorphism onto subtype pullback / same | agrees | none |
| §2.5 marking | `τ=i`, multiplication by `i` | `(0,−1;1,0)` / `(a,b)↦(−b,a)` | true | none |
| §3.3 freeness | `C₂` on `ℂ`, `R=1`, `b=½` | cocycle `½+½=1≡0`; `(1−A)T=0∌½`: free / free | true | none |
| §3.4 monodromy (sample, headline) | `ℤ` on `ℂ`, `R_n=iⁿ`, loop `0→1` | text `ρ(−1)=−i` / transport trivial upstairs, then `[1,v]↦[0,i⁻¹v]`: `−i` | consistent | none |
| §4.1 iterate formula (sample) | `A=−1`, `k=1,2` | `N₂=t−t=0`; sum over `1≤i≤k` gives `N₁=−t`, fails at `k=1` / same; pin `Cyclic/Affine.lean:216,366` sums `i<k` | true | none |
| §4.2 exact order (sample) | `A=1`: `t=⅓,m=2`; `t=½,m=4` | `N₂=⅔≠0`; `N₄=2≡0`, `N₂=1≡0`: exact order 2 / same; pin `:427` requires `N_m=0` and the disjunction | true | none |
| §4.3 conjugacy, `H¹` (sample) | `A=−1,m=2`; `A=1`; `ZMod 2` | `τ_b f τ_b⁻¹: t+(b−Ab)` / same (pin `:201`); `H¹=T/2T=0`; `T[2]≅(ℤ/2)²`; `(1−σ)(1+σ)=0` | true | none |
| §4.4 fixed points (sample, headline) | `A=diag(1,i)`, `t=(½,0)`, `m=4` | `N₄=(2,0)≡0`; `(1−A)T=0×T∌t`; `N₂=(1,0)≡0`, square fixes `(x₁,0)` | true; pin `:485,549` | none |
| §4.5 connecting class (headline) | trivial action `m=3,t=⅓`; `v/m` | `δ[⅓]=[1]`, `2∉3ℤ[i]`; `m(Ae−e)=0⇒Ae=e`, `N(e)=me=v` | true; pin `CyclicAutomorphism.lean:279` | none |
| §4.6 trivial action (sample) | `Λ=ℤ[i]`, `m=2` | `|T[2]|=|Λ/2Λ|=4`; exact order 2: three points; pin `:382,503` | true | none |
| §5.3 multiplicity (sample, headline) | chart `(z,v)` on `X` near `T_0`, `m=2`, `m=1` | `X→Q` local biholomorphism, `t=z^m`: `a=1,u=z`; `dt=mz^{m−1}dz≠0` off `F` | true | none |
| §5.4 normal character (sample, headline) | `∂_z` under `z↦ζz` | pushforward `ζ∂_z`: `χ(ζ)=ζ`; equivariant unit on compact connected `T_0` constant ⇒ order `m` | true | none |
| §5.5 adjunction | `m=2,A_E=1`; `diag(1,−1)` | `(g⁻¹)^*(dz∧dv)=(ζ det A)⁻¹`: `−1`; `K_F=(det A)⁻¹`; `(det A)⁻¹=(ζ det A)⁻¹·ζ` | true | none |
| §6.2 normalisation (sample) | general `m`; `m=2` | `c(ζz)−c(z)=−(1/m)[(m−1)f+f]=−f` using orbit sum 0; `m=2`: `½f`, difference `−f`; lift change `mΠμ` | true; pin `BirkhoffSum/Cyclic.lean:73,121` | none |
| §6.3 gauge (headline) | generator; branch `+2πik`; opposite sign | `e+Πλ/m−(1/m)Πλ` cancels; `−Π(kλ)`; `2λ∉mΛ` for order `m≥3` | true | none |
| §6.4 regluing (sample) | source p. 4 | README: quotient extended to log transform / BogomolovTschinkel2003 lines 104–107 | supported | none |
| §6.6 `π₁`, reversal (sample) | `m=3,λ=1`; meridian through `G⁻¹` | `ζ²`: `2λ≡−λ`; meridian ↦ `λ/m ∈ Λ+ℤλ/m` (not in text) | reversal true; value unstated | C03 |
| Convention 7 | `D_z={‖z‖<r}` | loop norm `r`, not `< r` | slip | C01 |
| Overview gauge sentence | `Π_Y(t)=(1, i+t)`, `m≥2` | `j−1728` order 2 on `Q*`, order `2m` on `X*` | wrong referent | C02 |
| Convention 2 vs §2.3 | hypotheses on `Y` | T2 + second countable / T2 + locally compact (`Family/Manifold.lean:102`) | form | N01 |

- Previous review (same head): it had no findings; its C01, C02 and N01 are not repaired (the folder has not changed) and are repeated above.
- Source locators checked against the text: 7 of 11 — MilneCFT line 3174 (Example 1.20, p. 66), line 3191 (Remark 1.21, p. 66), line 3793 (Proposition 3.4, p. 81); BogomolovTschinkel2003 lines 74–109 (§3, pp. 3–4) for the Layer 6 introduction and §§6.2, 6.3, 6.4. Each supports the sentence that cites it.
- Library: a declaration was found at the pins for each of the 177 qualified declaration names in the README, and the 11 module paths exist; statements opened for the sampled sections at the file and line given in the table, and `RotatedDisc.lean:159`, `Family/AffineAction.lean:353`.
- Cross-roadmap citations resolved on main: ComplexManifolds Milestones 1, 4–7 with items 7.4–7.6 (its open revision maps Milestone k to Layer k); AlgebraicTopology §§2.6, 5.4, 5.5 (fibre transport is in 5.5); GeometricTopology §§1.1, 1.3; SmoothRepresentationsOfLocalGroups SR.0d.2; Completed UniversalCovers and AnalyticToricGeometry; FuchsianOrbifolds; consumers AbelianSchemesAndArithmeticModuli A5.1/A5.6/A5.8, BallQuotientsAndComplexHyperbolicLattices §8.2, ComplexKahlerGeometry, GeometryOfNumbersAndQuadraticArithmetic §6.1a.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the folder; all automatic checks passed.
- Elaboration: `Suggested.lean` exits 0, the `sorry` at line 112 the only warning; elaborated type compared with README §2.3, every binder present. One-tactic probe (`simp`, `rfl`, `infer_instance`) fails on the theorem.
- Duplication: the pin has only the real trivialisation `TauCeti.torusFamilyDiffeomorphProd`; `Family/BasisChange.lean:29` says explicitly that no holomorphic triviality is proved. No roadmap on main other than this one mentions logarithmic transforms.
- Description: 18 Check blocks, 28 bullets, one theorem in `Suggested.lean`, four consumers: all as stated; no sentence contradicted by the head.

Overlap check: read ComplexManifolds (main and its open revision); nothing shared: it owns quotients, gluing and line bundles and leaves complex-torus families to this roadmap (its scope, lines 44 and 75 on main).

Source independence: 9 passages compared with 2 sources (MilneCFT: Layer 4 introduction, §§4.3, 4.5; BogomolovTschinkel2003: Layer 5 and 6 introductions, §§6.1–6.4), none shared beyond forced two-word terms; largest share BogomolovTschinkel2003, 4 of 11 locators; contents compared with BogomolovTschinkel2003 (a single one-page section; the order of §§6.1–6.4 is forced by their *Needs:* lines): independent. Birkenhake–Lange and Barth–Hulek–Peters–Van de Ven could not be read.

Research link: Layers 5–6 formalise Kodaira's logarithmic transforms, which Bogomolov–Tschinkel (2003, §3, Proposition 3.1) use to build elliptic fibrations preserving simple connectivity and the Kähler property; Layers 1–3 feed the analytic abelian-variety families of AbelianSchemesAndArithmeticModuli. Rests on BogomolovTschinkel2003 §3 (read) and the README's consumers section.

## Not verifiable

- Birkenhake–Lange, *Complex Abelian Varieties*, Chapters 1 and 8 (Layer 1 and Layer 2 introductions; sampled §§1.2, 1.3): the sources service resolves it only to a paywalled publisher page.
- Barth–Hulek–Peters–Van de Ven, *Compact Complex Surfaces*, Chapter V, p. 216 (Layer 5 and Layer 6 introductions; sampled §§5.3, 5.4): the same. The statements of those sections were checked by computation in the local model instead.

Automatic checks set aside as false positives: the citation lookup lists the module path `TauCeti.Topology.Algebra.Module.DiscretePreimage` (README line 1045) as found nowhere, but that file exists at the pinned Tau Ceti and declares both lemmas attributed to it; the declaration extractor reads the docstring words "structure of" in `Suggested.lean` (lines 61–62) as a declaration named `of`, which does not exist.

## Source issues

- none

## For the human reviewers

- Not tested: the locators into Birkenhake–Lange (README lines 104, 235) and Barth–Hulek–Peters–Van de Ven (lines 686, 778) are paywalled and were not compared with the text; the largest-share source, BogomolovTschinkel2003, was read.
