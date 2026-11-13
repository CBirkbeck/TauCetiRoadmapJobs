# Review of KloostermanSheavesAndBesselIsocrystals (pull request #2289 at 8199100)

**Verdict:** needs changes

## R01 (P2) — Four supplier contracts are gaps that the plan does not declare

**Location:** `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md` lines 339, 354, 366, 407: "What PadicDifferentialEquationsAndRigidCohomology must provide (gap:dense-convergence-detection)", "(gap:toric-exponential-sum-hodge-bound)", "(gap:toric-exponential-sum-ordinarity)", "What AffineLieAlgebras must provide (gap:critical-center-rational-forms)".

**Claim:** These four prerequisites are supplier gaps announced to their suppliers; §§2.4–2.5, 3.4, 11.2 and the Lean headline `orthogonalSum_ordinary` (through §11.2, for odd `p`) rest on them.

**Witness:** The plan's `gaps` list has seven slugs and none of these four. PadicDifferentialEquationsAndRigidCohomology at its open head has no Adolphson–Sperber 1989, Wan or dense-open convergence statement; AffineLieAlgebras A8 on main specialises centres to `ℂ`.

**Repair:** Register the four slugs in the plan's top-level `gaps` list with the supplier, section and `needs` sentence of README lines 339–376 and 407–411, splitting gap:toric-exponential-sum-ordinarity into its parts (a) and (b); add gap:dense-convergence-detection to the list of supplier gaps in the Scope paragraph (README lines 96–98).

## R02 (P3) — Locator `(4.1.3.2)` does not exist in Xu–Zhu

**Location:** README line 716, §1.4: "with quasi-inverse `M ↦ A_γ ⊠ M` (Xu–Zhu Lemma 4.1.4 and (4.1.3.2), pp. 38–39; HNY Lemma 2.3 and Definition 2.4, pp. 256–257)".

**Claim:** Xu–Zhu has a display numbered (4.1.3.2) carrying the equivalence.

**Witness:** XZ has only (4.1.3.1), at XZ line 1820 (p. 38); the equivalence and its quasi-inverse are the unnumbered display of Lemma 4.1.4(ii), XZ lines 1830–1834 (p. 39).

**Repair:** Replace the locator by "(Xu–Zhu §4.1.3, (4.1.3.1), p. 38, and Lemma 4.1.4(i)–(ii), p. 39; HNY Lemma 2.3 and Definition 2.4, pp. 256–257)".

## R03 (P3) — Beilinson–Drinfeld §5.3 is cited for a base field it does not treat

**Location:** README lines 684–686, §1.3: "For holonomic `D`-modules on `Gr_G ⊗ K` over a field `K` of characteristic zero, prove the same equivalence with `Rep(H)` (Beilinson–Drinfeld, *Quantization of Hitchin's integrable system*, §5.3)."

**Claim:** The cited section supports the de Rham Satake equivalence over every characteristic-zero field `K`, with `H` split over `K`.

**Witness:** BD line 6182 (p. 200) fixes `K = ℂ((t))`, `O = ℂ[[t]]`; BD lines 6179–6180 refer the proofs to Mirković–Vilonen. The section is over `ℂ` only.

**Repair:** Write "(Beilinson–Drinfeld §5.3, p. 200, over `ℂ`). Over a general `K` of characteristic zero the statement, with `H` split over `K` and pinned by the semi-infinite orbits, is part of this target; its route is that of the arithmetic case with Frobenius dropped."

## R04 (P3) — The pull request description misstates the suppliers

**Location:** Pull request description, dependencies paragraph: "In open pull requests of ours: … #1056 (FormalConnectionsOpers) … #1712 (CharacterSumsOverFiniteFields) … #1716 (HypergeometricMotives)"; block `<!-- merge-order -->`: "It depends on no other author's open pull request."

**Claim:** Every supplier is in an open pull request of the author or on main, and all are listed.

**Witness:** The open-pull-request index gives #1056 to `kim-em` and #1712, #1716 to `roed-math`. README lines 239 and 378 name KloostermanMomentsAndPotentialAutomorphy and PadicDifferentialEquationsAndRigidCohomologyPartII as suppliers; neither is on main nor in an open pull request, and the description omits both.

**Repair:** Write "In open pull requests of other authors: #1056 (FormalConnectionsOpers), #1712 (CharacterSumsOverFiniteFields), #1716 (HypergeometricMotives). Not yet in a pull request, earlier in the merge order: KloostermanMomentsAndPotentialAutomorphy, PadicDifferentialEquationsAndRigidCohomologyPartII." Regenerate the `merge-order` block accordingly.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 normalized datum | `q = 2, 3`, `a = 1`; `p = 3, 5` | `R₂(1) = 1`, `−1`; traces `−1/√2`, `1/√3`; `(π/c₃)² = −3/3 = −1`; `c_4^{−2} = 1/4` | holds; XZ lines 58, 158, 245, 2323 |
| §0.3 level models | `SL₂`, `PGL₂` | `dim V = 2`; `Ω = ℤ/2`; HNY lines 527, 548, 561 (pp. 253–254); XZ lines 1747, 1943 | holds |
| §1.3 Satake | locators | XZ lines 1243 (p. 26), 1566, 1578 (p. 33), 1688 (p. 36), 1259, 1356, 1409, 1721; BD line 6178 over `ℂ` | R03 |
| §1.4 clean datum | locators | XZ Lemma 4.1.4 at line 1827 (p. 39); `(4.1.3.2)`: 0 hits; HNY line 669 (p. 256) | R02 |
| §1.6 eigenobject | `SL₂`, `q = 3` | HNY Theorem 1 at line 857 (p. 261); XZ line 1836 (p. 39); trace `−R₂(1)/c₃ = 1/√3` | holds |
| §2.7 Zhu's comparison | `r = 3`, `λ = 1` | `m³c_m = ±c_{m−1}`: `1 ± x + x²/8`; XZ line 2201 (p. 47); Zhu lines 1011–1030 (p. 23) | holds |
| §2.9 symmetries | `SL₂` rotation; (ii)–(iv) | `b₁b₀ ↦ a·b₁b₀`; XZ (4.1.10.1)–(4.1.10.5) at lines 1921–1941 (p. 41), `(a^h)^+` at 1931 | holds |
| §4.2 log extension | `SL₂` residue | `E₁₂`: rank 1, square 0; XZ lines 2314–2322 (p. 50), 1128–1134 (p. 24) | holds |
| §4.3–4.5 conventions | `SL₂`; rank one | `N C(0) = c_q E₁₂ = q C(0) N`; `C = exp(π(x − x^q))`; `C = x^{−(q−1)a}`; `δΦ = ΦA − qA(x^q)Φ` | holds |
| §5.1 Newton class | `GL₂` | `(0,0) ≤ (−1/2, 1/2)`; XZ lines 2918–2931 (p. 62), `v(q^{deg x}) = 1` at 2933 | holds |
| §6.5 negative control | `𝔽₅((t))`, degree 20 | `v(u) = 5`, `v(z) = −2`, `i(σ) = 3`; `φ(2) = 1/2`; `b(Ad) = 1`; `c = 2`; GR lines 1302–1312, 1352–1354 | holds |
| §7.6 companions | `SL₂ → PGL₂` | kernel `μ₂ ≠ 1`; XZ line 2469 (p. 53); source step at lines 2476–2477 | holds |
| §8.2 orthogonal matrices | even `n = 3, 4, 5`; odd `n = 1, 2, 3` | `XᵗJ + JX = 0` for `N`, `E`; `(N, E)(e_n − e_{n+1}) = 0`; adding `E_{n,n+1}` breaks both; `c_r = (2λ^{2n})^r (2r−1)!!/(r!)^{2n+1}` | holds |
| §8.5 boundary count | direct chart sum, `n = 3, 4, 5` | `𝔽₂`: 3, 7, 15; `𝔽₄` (`n=3`): 37, 5, 5; `𝔽₃`: 13, 4 and 13, 40; printed constant gives 5 and 7, 34 | holds |
| §9.2 normalization | `k`-point; `𝔽₃ ⊂ 𝔽₉` | `(q^{−(n−1)/2}/α)(−1)^{n+m−1} = 1/((−c_q)^{n−1}∏g_j)`; `g = −i√3`, `g₉ = 3 = −g²`; XZ lines 2630–2645 | holds |
| §9.4 convolution check | `𝔽₃`, `n = 2`; `𝔽₂` | `U₂(1) = 7`; `Σ = −4/(3√3)`; `T_{SO₅} = 4/9`; `𝔽₂`: `−1/4` both sides | holds |
| §10.5 quotient Frobenius | `c = q^n F(x^q)/F(x)` | `c′/c = q x^{q−1}η(x^q) − η(x)`; `c(0) = q^n`; XZ lines 3088–3124 (pp. 65–66) | holds |
| §11.3, `orthogonalSum_ordinary` | `F = 𝔽₂`, `a = 1`, `n = 1, 2, 3`, `L = 𝔽_{2^m}`, `m ≤ 7` | `n = 2`: `S_m = −1, 21, −151, 657, 2049`; `e_k = −1, −10, −40, −64, 1024`; `v₂(e_k) = k(k−1)/2` in all three ranks | holds |
| `orthogonalSum_sub_card_eq_kloostermanSum` | `𝔽₂, 𝔽₄, 𝔽₈`, `n ≤ 3`, all `a`; non-trace character | e.g. `𝔽₈`, `n = 2`: `−151, 41, 9` both sides; `𝔽₄` with `ψ₀(Tr(cx))`: `−3` against `5` | holds; negative control fails as stated |
| `gaussSum_mul_orthogonalSum_sub_card` | `𝔽₃, 𝔽₅, 𝔽₇, 𝔽₉`, two characters each, non-trace on `𝔽₉`, `n = 1, 2` | equal in all cases; `H₃(1) = 2i√3` over `𝔽₃`; `Σρ(y)ψ(y)` fails over `𝔽₃`, `𝔽₇` | holds |
| `orthogonalSum_sub_card_eq_convolution` | seven fields, non-trace characters on `𝔽₄, 𝔽₈, 𝔽₉`, `N = 2, 3` | equal in all 20 cases | holds |
| `signed_dwork_congruence` | `B = (−2)^{3j}/(j!)³`; alternating pairs `r = 3, 5`; `B = 1`; `s ≤ 3`, `m ≤ 2`, `N ≤ 40` | (b), (c′) hold, (c) fails (`1/27 ≡ −1 mod 4`); least `v₂` of quotient: 0, 3, 2; XZ lines 3048, 3059 | holds; modulus `2^s` sharp |
| §11.2 polyhedron | `Δ(f_d)` | volumes `d/(2n+1)! + 2nd/(2n+1)! = d/(2n)!`; facet determinants `±d`; `S_m(f₂) − S_m(f₁) = H_{2n+1}(a)` by `x_{2n+1} = ay/∏x` | holds |
| Supplier gaps | plan against README | plan: 7 slugs; README: 11 slugs | R01 |

- Source locators checked against the text: about 70 (XZ 41, HNY 7, Zhu 5, FG 5, GR 5, Miy 6, BD 1, Car 1, Tsu 1, DAd 1, VL 1, by theorem number and page); 2 wrong (R02, R03).
- Pinned declarations opened: Mathlib `AddChar.sum_eq_ite` (`Algebra/Group/AddChar.lean:354`), `AddChar.sum_eq_zero_of_ne_one` (`NumberTheory/LegendreSymbol/AddCharacter.lean:240`), `FiniteField.algebraMap_trace_eq_sum_pow`, `trace_to_zmod_nondegenerate` (`FieldTheory/Finite/Trace.lean:49, 37`), `PowerSeries.expand` (`RingTheory/PowerSeries/Expand.lean:33`), `PadicComplex` (`NumberTheory/Padics/Complex.lean:137`); Tau Ceti `map_restrictNormalHom_lowerRamificationGroupReal` (`NumberTheory/LocalField/Herbrand/Quotient.lean:176`), `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`), `pointsFunctorIsoTensorAutFunctor` (`Tannaka/GroupFunctor.lean:138`), `FGComoduleCat` (`Coalgebra/Comodule/Finite/Basic.lean:95`). No Kloosterman sum in either library.
- Cross-roadmap citations resolved: all 56 cited `RD.*` headings; CongruenceSpectralGap §§4.2a–4.2b; CharacterSumsOverFiniteFields §3.3; HypergeometricMotives §§4.2–4.3; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3, 2.1, 2.5, 2.6; PartII §MS.4.6; BunGAndNewtonStrata §§1.5, 1.22; MotivesAndAlgebraicCycles §§6.1–6.3, 6.5; FormalConnectionsOpers F2, F4, F6; AffineLieAlgebras A7–A8; SpringerResolutionAndCharacteristicCycles §§8, 9.1–9.7; DeligneWeightsAndPurity §§8.5, 8.12, 8.14, 8.19; GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.3, 0.14, 1.1–1.6, 1.8, 1.9, 1.12; ReductiveGroupsPartII RG2.3.3, RG2.3.6, RG2.4.1; ReductiveGroups Layers 1, 7, 9, 10; OrthogonalSpinGroups Layers 0–1 (completed, on main).
- The seven declared gaps: precise, single-supplier, and absent from their suppliers as read (no Baldassarri, D'Addezio monodromy, arithmetic `D`-module operations, V. Lafforgue estimate, relative level geometry, principal `SL₂` classification or scalar ordinarity there).
- Dependency check: `depcheck: 238 roadmaps, 2162 edges, 0 problem(s)`; no UPWARD or CYCLE line. No reciprocal supplier citation of this roadmap (GlobalShtukasAndFunctionFieldLanglandsPartII and KloostermanMomentsAndPotentialAutomorphy name it as consumer and supplier of theirs respectively, in one direction each).
- Gate: every check passed. `lake env lean` on `Suggested.lean`: five `sorry` warnings, nothing else. `#check @name` for the 11 declarations: no binder lost; each type agrees with README §§10.1–10.2, 11.1, 11.3.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the five definitions unfolded) on a scratch copy: none of the five theorems closes. No padding found; every headline not stated is named in the module docstring with its missing carrier.
- Overlap check: read GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, MixedHodgeModulesAndIrregularHodgeTheory, GeometricSatakeAndFusion, PotentialAutomorphyDworkMotivesPartII, AffineLieAlgebras; nothing shared (scalar Kloosterman F-isocrystal: PadicDifferentialEquationsAndRigidCohomology §RD.6.95, cited; Kloosterman connections: KloostermanMomentsAndPotentialAutomorphy Layer 2, cited; raw hyper-Kloosterman sums: CongruenceSpectralGap §4.2a, cited; characteristic-zero Adolphson–Sperber Newton–Hodge theory: MixedHodgeModulesAndIrregularHodgeTheory, a different object from the `p`-adic bound).
- Source independence: 19 passages compared with 6 sources (XZ, BD, Zhu, GR, Miy, VL), none shared beyond formulas and hypothesis lists; largest share XZ, 96 of about 190 source mentions; contents compared with XZ: not one to one (Layers 2 and 3 reverse its §§4.2–4.3, Layer 5 precedes its §4.5, Layers 8 and 9 reverse its §§5.2–5.3, Layer 1 merges its §§2.8–2.10, 3 and 4.1): independent.

## Not verifiable

- Adolphson–Sperber 1989 (Corollary 3.11), Wan 1993, Wan 2004 (Theorem 3.1, Corollary 2.6), Baldassarri 1982, Davenport–Hasse 1935, Katz ESDE 7.0.7 and Katz *From Clausen to Carlitz* 2.6.1: uncertified, cited by locator only.
- Sperber 1980, Theorem (2.35): present (Spe80 line 537), but the scan renders the hypothesis on `p` inconsistently (Spe80 lines 37, 103, 358); "`p > r + 2`" against "`p ≥ n + 3`, rank `n + 1`" could not be settled.
- Xu–Zhu Lemma 4.2.6(i): the README's statement that `τ` is not affine, and §3.3(ii) replacing it, were checked only on the `PGL₂` dimension count of the Checks, not in general.
- Lam–Templier and Pech–Rietsch–Williams locators of §8.4: not opened (outside the sample); the potential was tested through the chart sums of §8.5.
- KloostermanMomentsAndPotentialAutomorphy and PadicDifferentialEquationsAndRigidCohomologyPartII were read as board packages; neither is on main or in an open pull request.
- Ownership against the open pull requests whose files were not given was checked only through the search tool over their heads.

## Source issues

- **Error** in XZ at Proposition 5.3.5(ii), (5.3.5.2), p. 59: the source says the constant term of the even orthogonal trace sum is `(q − 1)q^{n−2}`; it should be `q^{n−1} − q` (direct sums at `n = 4`: 7 over `𝔽₂`, not 5); affects a stated result.
- **Error** in XZ at (1.2.9.1), p. 6: the source says that at `p = 2` the squared rank-two sum minus `q` equals `−1/√q` times the rank-three sum; it should be the rank-three sum itself (`−1 = −1` over `𝔽₂`); affects a stated result.
- **Misprint** in XZ at the proof of Proposition 5.3.8(i), p. 61: the source says the Frobenius eigenvalues at `0` are `q^{−n}, …, q^{−1}, 0, q, …, q^n`; it should be `1` in the middle; affects nothing.
- **Misprint** in XZ at §5.2.3, p. 57: the source says the eigenvalues of a Frobenius lift at `0` on the rank-`n` hypergeometric sheaf run up to `q^{2n}α`; it should be `q^{n−1}α`; affects nothing.
- **Gap** in XZ at the proof of Corollary 4.5.6, p. 53: the source says a surjection between two closed subgroups of the dual group makes them isomorphic; it should control the kernel, as D'Addezio's comparison of neutral components and component groups does; affects the proof.
- **Misprint** in FG at Corollary 10, p. 28: the source says type `D_{2n+1}` with `n ≥ 4` has group of type `B_n`; it should be `D_{n+1}`, matching `so_{2n+1} ⊂ so_{2n+2}`; affects nothing.
- **Misprint** in FG at (14.1), p. 29: the source says the dimension formula subtracts the invariants of inertia at `0` twice; it should subtract those at `0` and at `∞`; affects nothing.

## For the human reviewers

- **Licence.** BD (Beilinson–Drinfeld, *Quantization of Hitchin's integrable system*) is an unpublished author-hosted preprint; README §§1.3 and 2.4 cite it (README lines 685, 928).
- **Scope.** Two suppliers, KloostermanMomentsAndPotentialAutomorphy and PadicDifferentialEquationsAndRigidCohomologyPartII, exist only as board packages; after a merge the README's citations of them (lines 239, 378) point at roadmaps not yet in the repository.
- **Scope.** The roadmap corrects its main source in several places (README §§3.3, 6.5, 7.6, 8.5, 9.4, 11.1); the corrections to XZ Proposition 5.3.5 and (1.2.9.1) were confirmed numerically, the replacement of XZ Lemma 4.2.6 was not confirmed in general.
