# Review of HodgeClassesForJacquetLanglands (pull request #2436 at 11238e8)

**Verdict:** needs changes

## R01 (P3) — Locator of §5.1 omits the page that carries `h_B`

**Location** `TauCetiRoadmap/HodgeClassesForJacquetLanglands/README.md:1839`, §5.1: "(IP23, §4.2, p. 23; §12.2.2, pp. 94–95)".

**Claim** The section's formula `h_B(z) = diag(z², zz̄, zz̄)` and the identification of the data under the projective isomorphism are not on pp. 94–95. §12.2.2 runs on to p. 96.

**Witness** IP23 lines 4408–4412 (p. 96): the `B`-basis, `diag(z², zz̄, zz̄)` and "the chosen Shimura data are identified". §12.2.3 starts at line 4413.

**Repair** Replace the parenthesis with "(IP23, §4.2, p. 23; §12.2.2, pp. 94–96)".

## R02 (P3) — Locator of §5.4 omits the rational block projection

**Location** `TauCetiRoadmap/HodgeClassesForJacquetLanglands/README.md:1912`, §5.4: "(IP23, §11.3, pp. 83–85; Proposition 12.2 and §12.2.3, pp. 95–96)".

**Claim** Proposition 12.2 and §12.2.3 are both on p. 96 alone. The rational equivariant projection to `τ_k^∨ ⊠ τ_k^∨`, which the same sentence asserts, is in §§12.2.6 and 12.2.10 on p. 97.

**Witness** IP23 line 4413 (§12.2.3) and line 4445 (Prop. 12.2) are on p. 96. Lines 4470–4474 (§12.2.6, the projection preserves the `ℚ(k)`-structure) and 4487–4488 (§12.2.10, `V_ρ ≃ V_k ⊠ V_k`) are on p. 97.

**Repair** Replace with "(IP23, §11.3, pp. 83–85; Proposition 12.2 and §12.2.3, p. 96; §§12.2.6 and 12.2.10, p. 97)".

## R03 (P3) — The description drops `ℚ(π) = ℚ` from the weight-two theorem

**Location** Pull-request description, summary block: "and in parallel weight two it lives in H^{2d}(X₁ × X₂, ℚ)(d)". The prose repeats it: "the weight-two case is a rational Hodge class on `X₁ × X₂`".

**Claim** §10.9 at the head states the rational class only when every `k_v = 2` **and** `ℚ(π) = ℚ`. For `L ≠ ℚ` the class of §10.7 is `L`-rational, not a class in `ℚ`-cohomology.

**Witness** README.md:2921: "When every `k_v = 2` and `ℚ(π) = ℚ`". IP23 line 167–168 (p. 4): Theorem 1 assumes parallel weight two and rational Hecke eigenvalues.

**Repair** Use "and in parallel weight two with `ℚ(π) = ℚ` it lives in `H^{2d}(X₁ × X₂, ℚ)(d)`" and "the weight-two case with `ℚ(π) = ℚ` is a rational Hodge class on `X₁ × X₂`".

## R04 (P3) — The description misstates how `L` relates to the library Hodge stars

**Location** Pull-request description, summary block: "making Mathlib's `exteriorPower.hodgeStar` and Tau Ceti's `Orientation.barHodgeStar` special cases."

**Claim** The head says that `L` is the *inverse* of `hodgeStar` when `σ = id` and the form is bijective, and that it equals `± barHodgeStar`. Both statements hold only on `⋀²` of a four-dimensional space. Neither star in general degrees is a special case of `IsExteriorStar`.

**Witness** README.md:48–57: "for `σ = id` and a bijective bilinear form it is the inverse of `exteriorPower.hodgeStar`", and `barHodgeStar` is `L` "and its negative for the opposite sign". Mathlib `HodgeStar.lean:48` is defined for every `k + l = finrank`.

**Repair** Use "so that, on `⋀²` of a four-dimensional space, the inverse of Mathlib's `exteriorPower.hodgeStar` (for `σ = id` and a bijective form) and, up to the orientation sign, Tau Ceti's `Orientation.barHodgeStar` are special cases."

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
| --- | --- | --- | --- | --- |
| §0.4 division reduction | `F` real quadratic, `Ram B₁={∞₂,𝔭}`, `Ram B₂={∞₂,𝔮}`; `B₁=B₂` | `B` ramified exactly at `{𝔭,𝔮}`; zero class not division | invariants ½,½ at `𝔭,𝔮`, 0 at `∞₁,∞₂`; IP23 line 891–893 (p. 21), line 2813 (p. 65) | agrees |
| §1.3 basis images | `diag(2,−3,5,7)`, `d_U(e₁₂₃₄)=−1` | `−a₁a₂e₃₄, a₁a₃e₂₄, −a₁a₄e₂₃, −a₂a₃e₁₄, a₂a₄e₁₃, −a₃a₄e₁₂` | computed `6, 10, −14, 15, −21, −35`; IP23 line 1207–1212 (p. 29); rescaling `α⁻¹L` line 1169 | agrees |
| `existsUnique_isExteriorStar` | `σ` a non-surjective endomorphism; `H=0` | unique `σ`-semilinear `L` for every `σ`, `H` | basis construction `Σσ(c_I)Φ(e_I)` works for every ring endomorphism; `H=0` forces `L=0` by perfectness | true |
| `IsExteriorStar.comp_self` | `A=Pᴴdiag(1,−2,3,5)P` over `ℚ(i)`, `c=3+2i`; Gram `1+E₁₂`; alternating Pf 8 | `L∘L = det A/(σ(c)c)` | exact: `−1830/13` on 18 vectors; `c²` model differs; `L(Le₁₃)=e₂₃` (non-Hermitian); `64=det A` | true; hypothesis needed |
| `IsExteriorStar.map_similitude` | `M=P⁻¹(1+2i)·diag((3+4i)/5,1,i,(5−12i)/13)P`, `ν=5`; scalar `t` | `L∘⋀²g = (ν²/det g)·⋀²g∘L` | factor `56/65+33i/65` holds on test vector; conjugate factor fails; IP23 (5.10) line 1267 | true |
| §1.5 skew identities | `diag(i,1,1,1)`, `d_U=−1` | Hermitian needed | `b(Le₁₂,e₃₄)=−1`, `b(Le₃₄,e₁₂)=1`; IP23 Lemma 5.4 line 1225–1227 (p. 29) | agrees |
| §2.3 block isogeny | dimensions; `g=−1` | dim 8, kernel `μ₂` | `4+4=8`, `2·3+1+1=8`; IP23 line 1334–1338 (p. 32); `⋀²(−1)=1` | agrees |
| §2.5 block groups | `(t,t⁻¹)`, `α ∈ E^×` on `W₀` | kernel `(t,t⁻¹)`, multipliers `Nrd b₁·Nrd b₂`, `N(α)` | IP23 line 1430, 1435 (p. 35), line 1402–1408 (p. 34); multiplier `t²t⁻²=1` | agrees |
| §2.6 tensor model | `H=diag(1,−J₁,1,−J₂)` | images `e₂₄, J₁e₁₄, J₂e₂₃, J₁J₂e₁₃`; `W` form `diag(1,−J₁,−J₂,J)` | recomputed from §1.3 formulas; IP23 line 1517–1536 (pp. 36–37) | agrees |
| §3.1 signatures | above / outside `Σ` | `(4,2)/(0,6)`, `(2,2)/(0,4)`, `(2,0)/(0,2)` | IP23 line 2888–2895 (p. 66); `2+2=4`, `0+0=0` | agrees |
| §3.2 split torus map | `(z,z,N z)`; `t₁=t₂=1` | `(N(t₁t₂), νN t₁, νt₁σ(t₂))` | IP23 Lemma 6.1 line 1715 (p. 41); centre ↦ `(N z)²` thrice; `(1,ν,ν)` | agrees |
| §3.5 archimedean theta | `k=2`, `k=3`, `(0,6)` | `A_{q₁}(k−2,0,0)` dims `1,2,1`; compact lift `(k−2,0,0)` | IP23 line 2008–2035 (pp. 47–48); Metaplectic §3.35 swapped labels match the dualization | agrees |
| §4.1 harmonic tensors | `ℝ²`, degree 2; `V′` of §4.4 | undivided pairing, `⟨v²,w²⟩=2⟨v,w⟩²` | IP23 line 2105–2119 (p. 50); `ℋ²ℝ²=⟨e₁²−e₂²,e₁e₂⟩`; projection `e₁²−Q/4` | agrees |
| §4.6 compact restriction | `ℓ=0,1,2`, `x=e₁` | `(x₁+εix₂)^ℓφ₀` | (8.2) line 2166–2168 gives `(−1)^ℓ` twice, product `+1`; IP23 line 2345 prints `(−1)^ℓ` | roadmap right, source wrong |
| §5.1 Shimura diagram | `v ∈ Σ` | `h_U ~ diag(z1₂,z̄1₂)`, `h_B=diag(z²,zz̄,zz̄)` | IP23 line 4386–4391 (p. 95), line 4408–4409 (p. 96) | content agrees; locator R01 |
| §5.4 harmonic coefficients | `k_v=2,4` | weight `((k−2)/2,(k−2)/2,−(k−2)/2,−(k−2)/2)`; twist `ν^{−ℓ/2}` | IP23 line 4436, 4440–4442 (p. 96); `k=4`: `(1,1,−1,−1)` = §3.4 image of `(2,0,0)` | content agrees; locator R02 |
| §8.1 unramified parameter | dihedral vs cuspidal `σ_E` | `ψ=σ_E⊠Sym¹`; `As⁺∘BC=Sym²⊕∧²⊗ξ_E` | IP23 line 3975–3985 (p. 86), Lemma 11.1 line 3610–3629 (p. 80) | agrees |
| §8.3 negative similitude | `δ=antidiag(1₂,1₂)` | multiplier `−1`, `q₀↔q₂`, `q₁` fixed | `ᵗδ̄·diag(1₂,−1₂)·δ = −diag(1₂,−1₂)`; IP23 line 3836–3844 (p. 83); `δ²=1` | agrees |
| §8.6 Hodge criterion | `w⁻¹=(23)`; `w=1` | types `(k−1,k−1)`, `(0,2k)` | `½(k−2,−k,k,−k+2)`, `τ_Z=α⁻²=λ_Zμ^{−(k−1)}`; IP23 line 4069–4076 (p. 88) | agrees |
| §0.3 degree formula | `Res_{ℚ(√2)/ℚ}𝔾_m`, `K(9)⊂K(3)` | 1 and 3 points; degree 3; normalized `f_*f^*=1` | `ord ε = 8` mod 3, 24 mod 9; `ε¹²≡−1`; `−ε⁴≡1+6√2`, order 3; Haar gives `1/3` | agrees |
| §0.2 definite Check | Hurwitz order, `V=Nrd⁻¹⊗Sym²` | `V^{O^×}=0`; neat level `3·#Sh_K` | `#O^×=24`, image `A₄` fixes no vector of the adjoint representation; `ℚ^×∩K=1` | agrees |
| §9.1 dual group | `F=ℚ(√2)`; `g=1+i` | dims 34 vs 33; `θ̂(z1₄,1)=(z⁻¹1₄,z⁴)` | `2·17=34`, `1+16+16=33`; `N(det α)=16=ν⁴` | agrees |
| §6.3 doubling point | `s=3/2` | `δ_P=|Nrd|⁵`; pole from `ζ^S(1)` | IP23 (9.3) line 2760 (p. 63) and `a_v,b_v` line 2720–2721; `b/a=ζ(4)ζ(6)ζ(8)/ζ(3)ζ(1)ζ(−1)` | agrees |
| §10.7 headline | `d=0`; `B₁≃B₂`; weights | rank-one weight-0 iso; diagonal; `d≥1` via §§10.4–10.6 | weight `d+d−2d=0`; IP23 Thm 12.4(i) line 4527–4529 (p. 98) | agrees |
| §10.8 headline | `d=0`; hypothesis | only `K_{2d}(Π)` assumed | IP23 Thm 12.4(ii) line 4533 assumes full Kottwitz; degree-`2d` case suffices by Prop 11.9 | narrower hypothesis, sound |
| §10.9 headline | Iwahori level, `d=1` | multiplicity `2≃2`; isotypic summands 4 vs 2 | `dim π_v^{Iw}=2`, `dim π_v^{K₀}=1`; IP23 line 167–168 (p. 4) needs `ℚ(π)=ℚ` | agrees; PR text R03 |

- Source locators checked against the text: IP23 47 (pp. 4–5, 11, 16–23, 25–42, 47–52, 55, 63, 65–66, 75–80, 83–90, 94–99, 101); Mil17 5; Wal85 3; FM06 3. All 15 sampled targets were checked; the two locator slips are R01 and R02.
- Library declarations opened at the pins: Mathlib 11 (`WedgePairing.lean:42,79,92,130`, `Pairing.lean:64,72`, `HodgeStar.lean:48`, `BilinForm.lean:34`, `ExteriorPower/Basic.lean:273`, `Funext.lean:83`, `Hilbert90.lean:107`). Tau Ceti 17 (including `ExteriorPower/Basis.lean:157,175`, `HodgeStar/Complex.lean:126,144`, `SymbolEquiv.lean:226,426`, `BrauerClass.lean:255`, `Comparison.lean:274`, `Naturality.lean:51`, `Transfer/Basic.lean:179`).
- Cross-roadmap citations: 27 supplier roadmaps, about 110 section ids and 45 declaration names resolved, on main or at their open heads. ClassFieldTheory "§5.4" resolves through that roadmap's own map from §5.4 to W.4.
- Gate: the worker's gate passed every check at 11238e8. Dependency check output: `depcheck: 248 roadmaps, 2377 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives three `sorry` warnings and nothing else. `#check @` on all four declarations shows no lost binders, and the signatures match the generality of README §§1.3, 1.4 and 1.7.
- Padding probe: `simp`, `rfl`, `infer_instance` and `exact?` each fail on all three theorems, so none of them is padding.
- Declared gaps: the eight slugs in `plan.json` and the README's "What … must provide" lines match. Searches for Matsushima relative to `K_h`, Hodge theory with VHS coefficients, unitary stable range and norm-subgroup restriction found no earlier provider.

Overlap check: I read the scope of MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, ShimuraData, ArithmeticLocallySymmetricSpaces and AdelicAlgebraicGroups. Two objects are shared:
- The real Weil generator formulas are owned here (§4.2); MetaplecticAutomorphicForms §2.5 states only the nonarchimedean ones.
- The `GU` group scheme is constructed in AutomorphicLFunctionsAndLocalFactorsPartII §0.0, which is not earlier in the merge order. Here it is used only inside §1.7, with no claim of ownership.

Nothing else is shared.

Source independence: 21 passages compared with 4 sources (the 15 sampled locators, §§1.1, 4.3, 7.7, 9.4 and 10.6, and the `IsExteriorStar` docstring). None share wording beyond forced formulas and hypothesis lists; the longest overlap is about 6 words in §4.1, "the kernel of the contraction". The largest share of locators is IP23, with 126 of 146 source-id citations.

The contents were compared with IP23's table of contents (IP23 line 60–110). Layers 1–4 and 6–10 follow IP23 §§5–12 in an order the *Needs:* lines force:
- L2 needs §§1.6–1.8; L3 needs §2.6; L4 needs §3.1.
- L6 needs §§1.6, 2.6 and 3.1; L7 needs Layers 4–6.
- L8 needs §§6.5 and 7.10; L9 needs §§8.1 and 8.4; L10 needs all earlier layers.

Layer 0, the placement of Layer 5 and §§9.3–9.4 are the roadmap's own. Result: independent.

## Not verifiable

- none

## Source issues

- **Error** in IP23 at Remark 2.2, p. 17: the source says that the factor `vol(K₁)/vol(K₂)`, for Haar measures on `G(𝔸_f)`, makes the trace `f_*` independent of level. It should use the effective groups `G(𝔸_f)/Z(ℚ)⁻`, because `Z(ℚ)` need not be discrete. Affects the proof.
- **Misprint** in IP23 at §3.2, p. 19: the source says the `π_B`-isotypic multiplicity space is concentrated in degree `2d`. It should be degree `d`, the dimension of the quaternionic Shimura variety. Affects nothing.
- **Misprint** in IP23 at §4.1, diagram, p. 22: the source labels the rank-one factor `U_E(V♯₀)`. It should be `U_B(V♯₀)`, as on p. 21 and in §5.3.1. Affects nothing.
- **Error** in IP23 at Proposition 8.2, p. 55: the source says the compact contraction equals `(−1)^ℓ(x₁+εix₂)^ℓφ₀`. It should be `(x₁+εix₂)^ℓφ₀`, because the sign from (8.2) and the sign of the negative-definite pairing cancel. Affects a stated result.
- **Misprint** in IP23 at the proof of Proposition 11.6, p. 88: the source's Hodge-type display for the `(1,1)` case lacks a closing parenthesis. It should read `(1,1)+(k_v−2,k_v−2)=(k_v−1,k_v−1)`. Affects nothing.
- **Gap** in IP23 at the proof of Theorem 12.4, p. 99: the source asserts without proof that `Gal(ℚ̄/F_Σ)` acts trivially on the components of `Sh_{G̃_B}`. It should take the component class in the Galois-invariant subspace, since reciprocity can permute components. Affects the proof.
- **Misprint** in IP23 at Proposition A.1(i), p. 101: the source writes the second denominator of the cocycle quotient as `s(g₂)`. It should be `s_v(g₂)`. Affects nothing.

## For the human reviewers

- none
