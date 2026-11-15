# Review of KloostermanSheavesAndBesselIsocrystals (pull request #2289 at 8fd0dad)

**Verdict:** needs changes

## Previous findings

- none: the review of `13efcb3` raised no finding. Its remark that §1.9, gap:equal-characteristic-central-sheaves and gap:log-newton-semicontinuity were absent is met at this head (`TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:290`, `:370`, `:913`).

## R01 (P2) — The contract of gap:arithmetic-d-module-operations omits an input that §4.3 takes from it

**Location:** `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:358`–`364`: "… the Abe–Caro weight theory, Abe's nearby and vanishing cycles, the trace formula, and the equality of trace functions with `ℓ`-adic sheaves built by the same operations from compatible inputs (Gabber–Fujiwara independence), overconvergent F-isocrystals being the smooth objects."

**Claim:** §4.3 (`README.md:1461`–`1464`) identifies the logarithmic fibre at `0` with the nearby-cycle fibre, Frobenius included (Xu–Zhu Proposition 2.9.4), and lists only this gap for it; the contract does not state that identification. §6.2 (`:1668`) and §1.9(iii) (`:927`) likewise use geometric semisimplicity of pure objects and trace independence for nearby cycles, neither named.

**Witness:** XZ line 1139–1142 (Proposition 2.9.4, p. 24); AC line 3019 (Theorem 4.3.1). PadicDifferentialEquationsAndRigidCohomology at its open head has no statement of 2.9.4 (no match for "2.9.4"; §RD.5.103 gives the extension only).

**Repair:** Replace the sentence at `README.md:358`–`364` by: "holonomic arithmetic `D`-modules with and without Frobenius structure on realizable separated `k`-schemes of finite type and on quotient stacks by smooth descent, with the six operations and duality, the holonomic t-structure, the Abe–Caro weight theory including the geometric semisimplicity of pure objects (Abe–Caro Theorem 4.3.1), Abe's nearby and vanishing cycles, the trace formula, the equality of trace functions with `ℓ`-adic sheaves built by the same operations, nearby cycles included, from compatible inputs (Gabber–Fujiwara independence), overconvergent F-isocrystals being the smooth objects, and, for an overconvergent F-isocrystal on a curve that is unipotent at a boundary point, the Frobenius-compatible identification of its unipotent nearby cycles there with its logarithmic fibre (Xu–Zhu Proposition 2.9.4, p. 24)."

## R02 (P3) — The pull request description counts an identity that `Suggested.lean` no longer states

**Location:** pull request description: "`Suggested.lean` states what is statable at the pins: the three exponential-sum identities (Carlitz's `U_n(a) − q = R_{2n+1}(a)` … its Gauss-sum analogue in odd characteristic and the convolution identity in every characteristic)".

**Claim:** The head states two identities. The declaration `orthogonalSum_sub_card_eq_convolution` was removed at `8fd0dad`; README §11.1 now keeps the convolution identity (iii) as an elementary target without a Lean name.

**Witness:** `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` has four theorems: `signed_dwork_congruence`, `orthogonalSum_sub_card_eq_kloostermanSum`, `gaussSum_mul_orthogonalSum_sub_card`, `orthogonalSum_ordinary`; at `8199100` it had five.

**Repair:** Write: "`Suggested.lean` states what is statable at the pins: the two exponential-sum identities (Carlitz's `U_n(a) − q = R_{2n+1}(a)` in characteristic two for the trace character and its Gauss-sum analogue in odd characteristic), the everywhere ordinarity of the orthogonal sums on trace functions in `ℂ_p`, and the signed 2-adic Dwork congruence; the elementary convolution identity is a README target (§11.1(iii))."

## R03 (P3) — A Check of §0.2 uses an undefined `y`

**Location:** `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:595`: "For `y = t²` the determinant is `(1 + t)²`, so an arbitrary maximal-ideal element does not give this control."

**Claim:** No `y` is introduced in the Check; the preceding sentence is about `diag(1 + t, 1)` only.

**Witness:** `README.md:593`–`595`: the only matrix named is `diag(1 + t, 1)`; `y` first appears in "For `y = t²`".

**Repair:** Replace the sentence by: "The element `diag(1 + t², 1)` does not separate the two subgroups, its determinant `1 + t² = (1 + t)²` being a square; so not every `diag(1 + y, 1)` with `y` in the maximal ideal is a witness."

## R04 (P3) — A sentence of the §6.2 route contradicts itself

**Location:** `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:1665`: "its neutral component has unipotent radical and is reductive by purity of weight zero, hence semisimple (DeligneWeightsAndPurity §§5.7, 8.19), hence trivial, and the group is finite."

**Claim:** A group with a (nontrivial) unipotent radical is not reductive; the word "trivial" is missing, and the step from reductive to semisimple is unstated.

**Witness:** DeligneWeightsAndPurity §8.19 at its open head gives geometric semisimplicity of pure lisse sheaves (reductive neutral component) and §5.7 the central-degree comparison for a reductive degree-zero kernel; neither produces a unipotent radical.

**Repair:** Replace by: "its neutral component is reductive, the sheaf being geometrically semisimple by purity of weight zero (DeligneWeightsAndPurity §8.19), and is semisimple by the central-degree comparison (§5.7); a commutative connected semisimple group is trivial, so the group is finite."

## R05 (P3) — Two layer dependency lists omit suppliers their sections name

**Location:** `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:953`–`958` (Layer 1 Dependencies) and `:1523`–`1527` (Layer 4 Dependencies).

**Claim:** Layer 1 Dependencies does not list ReductiveGroups, which §1.3 needs; Layer 4 Dependencies does not list §RD.1.44, which §4.5 needs.

**Witness:** `README.md:764`–`765`: "*Needs:* … ReductiveGroups Layers 1, 10." `README.md:1507`: "*Needs:* §§4.3–4.4; PadicDifferentialEquationsAndRigidCohomology §RD.1.44."

**Repair:** Append "ReductiveGroups Layers 1, 10" to the Layer 1 list, and insert "RD.1.44," before "RD.2.13–RD.2.16" in the Layer 4 list.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result; change |
| --- | --- | --- | --- | --- |
| `orthogonalSum_sub_card_eq_kloostermanSum` (§11.1(i)) | `𝔽₂` `n=1,2,3`; `𝔽₄` `n=1,2`; `𝔽₈` `n=1`; all `a` | `U_n − q`: `−1,−1,−1`; `5,−3,−3`; `21,−11,−11`; `17,−7,1,−7,1,−7,1` | `R_{2n+1}(a)`: the same values | Holds; trace character only, as stated |
| `gaussSum_mul_orthogonalSum_sub_card` (§11.1(ii)) | `𝔽₃` `n=1,2`; `𝔽₅` `n=1,2`; `𝔽₇`, `𝔽₉` `n=1`; `ψ` and `ψ(c·)` | `𝔽₃,a=1`: `2i√3`, `n=2`: `−4i√3`; `𝔽₉`: `48,−15,−24,21,…` | `H_{2n+1}(4a)`: equal in all 52 cases | Holds for every nontrivial `ψ` |
| `orthogonalSum_ordinary` (§11.3) | `n=1`, `p` odd and `p=2` | `R₂² − q = α² + q + β²`, `αβ=q`; over degree `m`: `α^{2m}+q^m+β^{2m}` | Slopes `0,1,2`; `p=2`: `R₃` eigenvalues, slopes `0,1,2` | Consistent; `β_i` norms `‖q‖^i` |
| `signed_dwork_congruence` (§10.2(ii)) | `B=(−2)^{rj}/(j!)^r`, `r=3,5`; alternating pairs `n=1,2`; `s≤3`, `m≤2`, `N≤40` | (c′) holds for all `n<12` with `u(·,1,m)=(−1)^m` | Quotients by `2^s B⁽ˢ⁺¹⁾(m)`: least valuation `0`, `0`, `3`, `2` | Holds; modulus `2^s` sharp; matches XZ A.5(i′) |
| §10.1 Dwork data (seeded) | XZ line 3043–3053 | Conditions for all `n,m,s ≥ 0`, `0 ≤ a < p`; `u=1` for `s≠1` | README (a)–(c′), block `m p^s ≤ j < (m+1)p^s` | Same hypotheses; `B(4)/B(2)=1/27≡−1 (4)` |
| §1.2 ULA and hyperbolic localization (seeded) | Constant on `𝔸²`, weights `(1,−1)` and `(1,1)` | Repelling side `K[−2](−1)`; `K[−4](−2)` | Attracting side `K[−2](−1)`; `K[−4](−2)` | Direction `F^{+!} → F^{!+}` as XZ line 1174–1178 |
| §1.3 Satake (seeded) | `PGL₂`, `μ` minuscule | `H^*` in degrees `−1,1`; Koszul flip gives dimension `−2` | Corrected constraint: `2` | XZ 3.1.2, 3.5.1, 3.5.3, 3.6.5, 3.6.7, 3.6.8 on pp. 26, 33, 35, 36; BD §5.3 p. 200 |
| §1.5, §1.6 Hecke action, eigenobject (seeded) | `SL₂`, `W` standard, `q=3`, `a=1` | `R₂(1) = −1`; trace `−R₂/c_q = 1/√3` | Half twist `(d/2)`, `d=1` | XZ (4.1.2.1)–(4.1.2.4) p. 38, (4.1.8.1)–(4.1.8.3) p. 40, Thm 4.1.5 p. 39; HNY Thm 1 p. 261, §2.6 p. 263 |
| §1.9 Frobenius at zero | `SL₂`, `W` standard | `Σ_a R₂(a) = 1`, so `L = exp(−Σ(c_q^{−1}T)^m/m)` | `1 − c_q^{−1}T = det(1 − Frob T | Kl^{I₀})` | Consistent; HNY line 1214–1257 (pp. 270–271), GH line 82 (p. 3), Gaitsgory line 225 (p. 5) |
| §2.2 invariant parameter (seeded) | `SL₂`, `λ=2` | Invariant of `2φ`: `4` | Invariant of `N + 4xE`: `4`; of `N + xE`: `1` | `λ^h` rule; XZ Thm 4.3.3, (4.3.3.1), p. 47 |
| §2.6 central descent (seeded) | `SL₂`, `P = diag(a,1)` | Intertwiners `cP`, `det = c²a` | `c²a = 1` solvable iff `a` a square | Rational marking needed; XZ §4.3.6 p. 49 argues over the torsor on `𝔸¹` |
| §2.8 Frenkel–Gross monodromy (seeded) | `SL₂`; `SL₃`; cyclic series `r=3` | `h¹ = 1 − 1 − 0 = 0`; `3 + 5 = 8`; `1 − x + x²/8` | `I₀` twice: `−1`; `dim sl₃ = 8`; `1 + x + x²/8` leaves `2x` | FG Thm 1 p. 16, Prop 8 p. 27, Cor 9–10 p. 28, (14.1) p. 29 |
| §3.3 middle image (seeded) | `PGL₂`, `d=2`, vertex of `𝔸²/μ₂` | `i^!j_{!+}(M)[2]`: ordinary degree `−2+4−2 = 0`, holonomic degree `1` | `ℋ⁰` rank `3`, `ℋ¹` rank `1`; `U_s` not affine | (ii) holds; XZ line 2069 does assert `τ` affine |
| §4.2, §4.3 logarithmic extension (seeded) | `SL₂`, `C(0) = diag(c_q^{−1}, c_q)` | `N C(0)`: entry `c_q` | `q C(0) N`: entry `q/c_q = c_q` | XZ (4.4.2.1) p. 50, §2.9.3 p. 24; `−C(0)` excluded by §1.9 only |
| §4.4, §4.5 Frobenius matrix | Rank one, `A = −a`; `Ad((2ρ)(√−1))` | `C = x^{−(q−1)a}`; `−N − λ^h xE` | Rank-one dictionary; `N + (−1)^h λ^h xE` | Consistent with §RD.6.48 (`ε = −1`) |
| §6.4 classification (seeded) | `SL_{2n+1}`, `p` odd | Irregularity `≤ (2n+1)/(2n+1) = 1`, nonzero | Descent along `x ↦ x²` would give an even conductor | XZ Thm 4.5.2(i),(iii) pp. 51–53, line 2457–2465 |
| §6.5 negative control | `𝔽₅((t))`, `u⁴=t`, `z⁵−z=u^{−2}` | `v(u)=5`, `v(z)=−2`, `v(σ(uz²)−uz²)=3` | `D₁=D₂=C₅`, `D₃=1`; break `(5+5)/20 = 1/2`; `b(Ad)=1` | Lower jump at `c=2`, as stated |
| §6.6 rigidity (seeded) | `SL₂` | `Irr_∞(Ad)=1`, `dim Ad^{I₀}=1` | `h¹ = 1−1−0 = 0`, `Ad^{I_∞}=0` | XZ Cor 4.5.7, Rem 4.5.8 pp. 53–54; HNY Cor 2.15 p. 262 (`p ∤ #W`) |
| §7.6 companions (seeded) | `SL₂ → PGL₂` inside `SL₂ × PGL₂` | Surjective | Kernel `{±1}` | XZ line 2476–2477 infers from a surjection; replacement justified |
| §8.3, §8.5, §8.6 | `𝔽₂` `n=4`; chart sum `n=3` over `𝔽₂, 𝔽₄, 𝔽₃` by enumeration of `Q°` | Chart: `3`; `37,5,5`; `13,4` | `S₃ + Q² − Q`: `3`; `37,5,5`; `13,4`; `n=4`: `7`, `13,40` | Constant `Q^{n−1} − Q`; printed one gives `5`, `7,34` |
| §9.2, §9.4 | `𝔽₃`, `n=2`, `a=1`; Hasse–Davenport at `d=2` | `U₂(1)=7`; `Σ T_{SO₃}K₂ = −4/(3√3)`; `g_{j,2}=3` | `T_{SO₅}(1) = 4/9 = −3^{−1/2}·(−4/(3√3))`; `−g_j² = 3` | Shift `[1]` supplies the sign |
| §10.4 series | `n=1` | `F = 1−8x+8x²`, `G = 1+8x+24x²` | `h = 1−16x+112x²`; `f_{F,2}`: `16x²`, `f_{F,4}`: `8x²` | As stated |
| §11.2 toric slopes | `d=1`; facets of `Δ(f_d)` | `L(f₁) = (1−T)∏(1−qα_iT)`, degree `2n+1` | `2n+1` facets, determinant `±d`, volume `d/(2n)!` | Slopes `0,…,2n`; `S(f₂)−S(f₁) = H_{2n+1}(a)` |
| §11.4, §11.5 (seeded) | `𝔽₂`, `n=2`, `a=1` | `T_{SO₃}=−1/2`, `K₂=−1/√2`, unshifted `1/4` | `T_{SO₅}(1) = (1−2)/4 = −1/4` | XZ Thm 4.5.2(ii) p. 51, Cor 5.3.10 p. 61, Rem 4.5.8(iv) p. 54 |
| Conventions | `q=3`; `p ≡ 3 (4)`; `d − π dt` | `(π^{(p−1)/2}/c_p)² = −1`; `θ′/θ = π(1 − p t^{p−1})` | `ℚ₃(√−1)` unramified; `d + π dt` fails by `2π` | Agrees with PadicDifferentialEquationsAndRigidCohomology §§RD.6.46, RD.6.48, RD.6.95 |
| R01: gap contract against §4.3 | README `:358`–`364` against `:1461` | Contract: nearby cycles, no logarithmic-fibre comparison | Route: XZ Prop 2.9.4 (line 1139) | Finding R01 |
| R02: description against the Lean file | Theorems at `8199100` and `8fd0dad` | `5` | `4` | Finding R02 |

- Source locators checked against the text: about 100 in 8 sources (XZ about 80 items by line and page, those of the seeded sample read in full; HNY 8; FG 6; GR 4; BD 1; AC 2; Gaitsgory 1; Görtz–Haines 1). All pages agree with the README.
- Library declarations opened at the pins: 13. Tau Ceti `NumberTheory/LocalField/Herbrand/Quotient.lean:176`, `Herbrand/UpperQuotient.lean:98`, `Algebra/Coalgebra/Comodule/Finite/Basic.lean:95`, `Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138`; Mathlib `Algebra/Group/AddChar.lean:242`, `:354`, `:463`, `NumberTheory/LegendreSymbol/AddCharacter.lean:240`, `FieldTheory/Finite/Trace.lean:49`, `NumberTheory/GaussSum.lean`, `NumberTheory/MulChar/Basic.lean:455`, `NumberTheory/Padics/Complex.lean`, `ZMod.algebra`. No Kloosterman sum at either pin.
- Cross-roadmap citations resolved: 21 roadmaps, about 130 section ids, by heading on main or at open heads (every cited `RD.*` heading, GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.3, 0.14, 1.1–1.6, 1.8, 1.9, 1.12; OrthogonalSpinGroups Layers 0–1 at layer level only). None missing. GlobalShtukasAndFunctionFieldLanglandsPartII cites the `KB.*` labels of the former-numbering table.
- Dependency check: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check 0, `OK`. `lake env lean` on `Suggested.lean`: four `sorry` warnings, nothing else.
- Signatures: the 10 elaborated types (`#check @name`, worker transcript) agree with README §§10.1–10.2, 11.1, 11.3; no binder lost; nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) on a scratch copy: none of the four theorems closes. No padding.
- Declared gaps: 13 slugs, each in the README under its supplier; R01 is the one whose README sentence is narrower than its use.

Overlap check: read KloostermanMomentsAndPotentialAutomorphy, GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, PadicDifferentialEquationsAndRigidCohomologyPartII, GeometricSatakeAndFusion and AffineLieAlgebras; scalar Kloosterman sheaves, connections and monodromy are owned by KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3, 2.1, 2.5–2.6, the scalar Kloosterman F-isocrystal by PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.97, the critical centre by AffineLieAlgebras A7–A8, the specified-map theorem by PadicDifferentialEquationsAndRigidCohomologyPartII §MS.4.6; GlobalShtukasAndFunctionFieldLanglandsPartII imports this roadmap's targets and constructs none; GeometricSatakeAndFusion is over the Fargues–Fontaine curve and shares no object.

Source independence: 13 passages compared with 5 sources (XZ, HNY, FG, Gaitsgory, Görtz–Haines), none shared beyond formulas and standard names; largest share XZ, about 100 of 190 locators; contents compared with XZ: independent (Layer 2 ↔ §4.3 precedes Layer 3 ↔ §4.2; Layer 5 ↔ §5.4 precedes Layer 7 ↔ §5.1; Layer 8 ↔ §5.3 precedes Layer 9 ↔ §5.2; Layers 0, 6, 11 have no single counterpart).

## Not verifiable

- AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC: uncertified, cited by locator only (§§6.3, 9.1, 9.2, 11.2 and four gap contracts).
- Lam–Templier Theorem 1.8 and Pech–Rietsch–Williams §3.3 (§8.4): not opened this round; the chart sum they support was checked by enumeration for `n = 3` only.
- Zhu Lemmas 18–21 (§2.5) and Miyatani (§9.1): outside the sample, not reopened.

## Source issues

- **Error** in XZ at Lemma 4.2.6(i), p. 44: the source says the map from the smooth locus of the quasi-minuscule family is affine and deduces holonomicity of its direct image; it should say the map is not affine (a normal variety minus a section of codimension at least two), and only the degree-zero part compares; affects the proof.
- **Misprint** in XZ at (1.2.9.1), p. 6: the source gives, for `p = 2`, a factor `−1/√q` and a sum over two variables; it should be the raw rank-three Kloosterman sum with no factor; affects a stated result.
- **Error** in XZ at Proposition 5.3.5(ii), (5.3.5.2), p. 59: the source gives the constant `(q − 1)q^{n−2}`; it should be `q^{n−1} − q` (they agree at `n = 3` and differ from `n = 4`); affects a stated result.
- **Misprint** in XZ at the proof of Proposition 5.3.8(i), p. 61: the source lists `0` as the middle Frobenius eigenvalue at zero; it should be `1`; affects nothing.
- **Misprint** in XZ at the proof of Lemma 4.5.5, p. 53: the source calls `ℓ_i + 1` the exponents while using `Sym^{2ℓ_i}`; it should say the `ℓ_i` are the exponents; affects nothing.
- **Gap** in XZ at the proof of Corollary 4.5.6, p. 53: the source concludes that two closed subgroups of the dual group are isomorphic from a surjection between them; it should control the kernel or compare neutral components and component groups; affects the proof.
- **Misprint** in XZ at (5.3.9.1) and (5.3.11.1), p. 61: the source states the convolution without shift or half twist and the trace formula without sign; it should carry `[1](1/2)` and the factor `−q^{−1/2}`; affects a stated result.
- **Misprint** in FG at Proposition 11, (14.1), p. 29 (arXiv v3): the source subtracts the inertia invariants at `0` twice; it should subtract those at `0` and at `∞`; affects a stated result.

## For the human reviewers

- **Licence.** BD is an unpublished author-hosted preprint, cited at `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:756` and `:1052`.
- **Scope.** The README corrects XZ in §§3.3, 6.3, 7.6, 8.5, 9.3, 9.4 and 11.1; this review confirmed the corrections numerically or by a short argument (table rows above), not by a full proof of §3.3(i).
- **Scope.** The board package `packages/KloostermanSheavesAndBesselIsocrystals/README.md` differs from this head in about 500 lines (other suppliers for nearby cycles and weight–monodromy); this review read the pull request head only.
