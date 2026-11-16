# Review of VirtualFundamentalClassPartII (pull request #2446 at fd554cb)

**Verdict:** needs changes

## R01 (P3) — 8.1 identifies Kresch's rational equivalence with VirtualFundamentalClass §2.5's, which is Vistoli's

**Location:** `TauCetiRoadmap/VirtualFundamentalClassPartII/README.md:1877–1880`: "on a smooth ambient it is the rational equivalence to which VirtualFundamentalClass §2.5 applies kresch1999b Theorem 3.1"; also lines 1912–1913 ("owned by VirtualFundamentalClass §2.5") and 1924–1925.

**Claim:** `β` is Kresch's `−ω`. VirtualFundamentalClass §2.5, and this README's own contract at lines 348–349, take Vistoli's construction (behrend-fantechi1997 Propositions 3.3–3.4). No cited text shows the two are equal in `W_*`, and the same sentence calls Vistoli's construction only "one with the same boundary".

**Witness:** VirtualFundamentalClass §2.5 at the #1996 head: "Construct Vistoli's canonical rational equivalence by deformation to the normal cone (Behrend–Fantechi Props. 3.3–3.4)". See behrend-fantechi1997 line 890. kresch1999b lines 334–336 are about its own Prop. 2.3 construction.

**Repair:** At lines 1877–1880, replace "on a smooth ambient it is the rational equivalence to which VirtualFundamentalClass §2.5 applies kresch1999b Theorem 3.1 (lines 334–336 name the rational equivalence of this proof), and on a reduced equidimensional scheme vistoli1989 Lemmas 3.16 and 4.6 (lines 1172–1174 and 1451–1470) give one with the same boundary by normalising a blow-up;" with: "on a smooth ambient kresch1999b Theorem 3.1 is a statement about it (lines 334–336 name the rational equivalence of this proof). VirtualFundamentalClass §2.5's rational equivalence is Vistoli's (behrend-fantechi1997 Propositions 3.3–3.4), which vistoli1989 Lemmas 3.16 and 4.6 (lines 1172–1174 and 1451–1470) build on a reduced equidimensional scheme by normalising a blow-up. It has the same boundary, and no statement here uses that the two agree in `W_*`;".

At lines 1912–1913, replace "owned by VirtualFundamentalClass §2.5, whose statement" with "for `β`, the restricted invariance that VirtualFundamentalClass §2.5 states for Vistoli's rational equivalence; Kresch's statement".

In the *Needs:* at lines 1924–1925, replace "for `β`, all of these and VirtualFundamentalClass §2.5;" with "for `β`, all of these;".

Tested on the plane example: 8.1's `ω(D, E)` Check gives `β = ν/η`, while VirtualFundamentalClass's plane example leaves the constant `c` free. No step uses `c = 1`.

## R02 (P3) — 9.1 and 9.3 API bullets take a projective curve where the definition needs a prestable one

**Location:** `README.md:2260`: "For `𝔅 = Spec k`, a fixed projective curve `C` and `X` an open subscheme of a projective `k`-scheme `X̄`, every open subscheme of finite type of … `Mor(C, X)` … satisfies it." Also line 2364: "a fixed curve `C`".

**Claim:** *RelativeSpaceOfMaps* is defined only when `𝒞 → 𝔅` is a prestable family étale locally on the base (9.1). For a projective curve that is not prestable, such as a cuspidal cubic or `ℙ¹ ⊔ ℙ¹`, the condition the bullet asserts is not defined.

**Witness:** `TauCeti.AlgebraicGeometry.PrestableFamily` (`TauCeti/AlgebraicGeometry/Curves/Prestable.lean:45`) extends `IsProper` and `GeometricallyConnected` with `AtWorstNodalOfRelativeDimensionOne`. The cusp of `y² = x³` is not nodal, and `ℙ¹ ⊔ ℙ¹` is not connected.

**Repair:** Line 2260: "a fixed projective curve `C` with `C → Spec k` a prestable family (`TauCeti.AlgebraicGeometry.PrestableFamily`: geometrically connected, at worst nodal)". Line 2364: "For `𝔅 = Spec k` and a fixed prestable projective curve `C`". Tested on `C = ℙ¹` (9.1's second Check, 9.3's second Check): both are still covered.

## R03 (P3) — The description's sentences about the Lean file do not match the head

**Location:** pull-request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** `Suggested.lean` declares nothing. Its module docstring says that no headline theorem is statable at the pins, and elaboration produces no warning at all.

**Witness:** `TauCetiRoadmap/VirtualFundamentalClassPartII/Suggested.lean:70–72`: `namespace` and `end`, with nothing between them. The worker's change summary reads "Lean declarations: 0 removed, 0 added". `lake env lean` on the file printed nothing.

**Repair:** Replace with: "`Suggested.lean` states no declaration: no headline theorem is statable at the pins (no algebraic stacks, no Chow groups beyond schemes, no cotangent complex or derived `Rπ_*`). Its module docstring lists the twelve headline theorems and the carrier each lacks." Also replace the validation clause with "the targeted Lake build succeeds with no warnings".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 proper covers (rydh2015 Thm B) | `L`; `B_{𝔸¹}G`, `G = ℤ/2` minus non-identity point over 0; `Spec k → BG` | `L → B_{𝔸¹}G` base-changes to `Q → 𝔸¹`, rank 2 everywhere; a separated `X` forces torsor degrees 2 and 1 on one component | holds; Rydh's hypotheses are Convention 1 | none |
| 1.3 degree | `BG`; `ℤ/p` on `k[x,y]` in char `p`; inertia of `BS₃`, `Bμ₃/ℚ`; `L → B_{𝔸¹}G` | `|G|·(1/|G|) = 1`; `(1/p)·p = 1 = p/p`; `1+3+2 = 6`; `1+2 = 3`; `(2/1)·1 = 2` = rank of `Q → 𝔸¹` | holds | none |
| 2.1 cycles | `[V(x²)/μ₂]`; atlas `⊔_ℕ Spec k → Spec k` | length of `k[x]/(x²)` = 2, so `2[Bμ₂]`; pullback of `[Spec k]` is an infinite sum, not in the free group | holds; finite-type atlas needed | none |
| 3.1 flat pullback | `Spec k → BG`; coarse map of `[𝔸¹/μ₂]`; étale 2-isogeny `E′ → E` | `π^*[BG] = [Spec k]`; `[0] ↦ 2[Bμ₂]`; `π^*([P]−[O])` has degree 0 and sum `2Q = π̂(P) = O`, so 0 | holds | none |
| 3.2 proper representable pushforward | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `ℙ¹ → Spec k` | left `|G|[0×BG]`; `N(t) = t`, `div = [0×BG]`, factor `|G|/1`; `|G|·c = 1` has no solution in `ℤ` | holds | none |
| 3.5 refined Gysin, homotopy invariance | `{0} → 𝔸¹` along `z ↦ z²`; flat change `𝔸² → 𝔸¹` with `t ↦ (t², t)`; `Spec k → BG`; real space `X` | `2[pt]`; both sides `2[pt]`; non-flat `{0}`: `[pt]` vs `c₁(O)∩[pt] = 0`; `Σ[κ(z):k] = |G|`; `A₀(X) = 0 = A₁(X×𝔸¹)` | holds | none |
| 5.1 products, Poincaré duality | `g : BG → Spec k`; `T = 𝔸¹ ⊔ 𝔸¹ → 𝔸¹`; `L → 𝔸¹` | `g_*(g^*x·y) = (1/|G|)[pt] = x·g_*y`; the degree-weighted product gives `[pt]`; evaluation `ℚ²` in dim 1, 0 in dim 0 | holds; `T` separated needed | none |
| 6.1 comparison bundle | `ℙ¹`, `E = [O(−4) →0 Ω]`, automorphism `1+ξ`; `H• = F• ⊕ [G = G]` | `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`; `P = O(3)²`; at a point rank `2 = 1+1`; `P = F₁⊕G₁⊕F₀` | holds | none |
| 6.3 relative formulas | `Spec k[ε]/ε²` over itself; node `× ℙ¹`, `E = [O(1)→Ω]`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | `2[pt]`; `−[𝔜×pt] ↦ −([ℓ_a]+[ℓ_b])`; `s = 1 ≠ 0 = dim X−d−r`, class `p[pt] ≠ 0`; `[pt]` | holds; smoothness and rank exponent needed | none |
| 7.1 relative obstruction class | `k[x]/(x²) → k[ε]/(ε³)`, `x ↦ ε`; `Spec k → B𝔾_m` | `(ε+aε²)² = ε² ≠ 0` for every `a`; lifts form a torsor under `1+J ≅ J = Hom(O, J)`; the `L_X` version gives 0 | holds | none |
| 8.3 functoriality | `𝔸¹×Z → Z` with `X = Z = 𝔜 = pt`; non-quasi-compact `Z′ = pt ⊔ ⊔_ℕ pt` | `𝔠 = B T_{𝔸¹}`, dim 0 over `𝔸¹` (dim 1), relative dim −1; for `Z′₀` one point or finitely many: `[pt]` both sides | holds; independent of `Z′₀` | none |
| 8.4 deformation invariance | `x² − b y²`; `{xb = 1}`; base `L`; `y² = x^p − a` over `𝔽_p(a)` | counts 2, 2, 2; 1 vs 0 without properness; 2 at `0₁`, `0₂`, `t ≠ 0`; `𝔪 = (y)`, both partials vanish at `b₀`: regular, not smooth | holds | none |
| 9.1 relative spaces of maps | `X = Spec k`; `Mor_d(ℙ¹, ℙ^r)`; `id_{ℙ¹}` at a point; cuspidal cubic `C` | étale iff formally étale; dim `(r+1)(d+1)−1`; `H⁰(T_{ℙ¹}) = k³ ≠ 0`; cusp is not nodal, so outside the setting | API bullet lacks the prestable hypothesis | R02 |
| 9.2 duality along prestable families | genus-`g` curve with `L` of degree `e`; nodal fibre; `R = k[x_i]/(x_i)²` | `χ = e+1−g`, `χ(ω) = g−1`; `deg ω|_E = 2g(Ẽ)−2+#branches`; `t·x₁ = x₁² = 0`, not flat; ranks 1 and `g` | holds | none |
| 9.4 global resolutions | `V = O`, genus `g`; `L = O` not ample; embedded point on `ℙ¹` | `χ = 1−g`; `[0 → R¹π_*O]` misses `H⁰ = O_M`; `H⁰(O(−N) ⊕ k_p) = k` | holds; ampleness and reduced fibres needed | none |
| H1 integral Chow groups (2.2–2.3) | `[𝔸¹/μ₂]`; `L`; `[V(x⁴+1)/μ₂]` over `ℚ` | `div y = 2[Bμ₂]`; `k[x]/P(x²) = K[x]/(x²−ȳ)` reduced, so `A₀ = ℤ/2`; `A₀(L) = ℤ²/ℤ(1,1)`; `div(y²+1) = [W]` | holds | none |
| H2 rational operations (4.1–4.3) | `BG → pt`; `L × B(ℤ/2) → L`; `π^![BG]` | `[BG] ↦ (1/|G|)[pt]`, composite 1; `[0₁×B(ℤ/2)] ↦ ½[0₁]`; `|G|⁻¹·|G|[pt] = [pt]` | holds | none |
| H3 intersection ring (5.1) | as row 5.1; `[ℙ¹/μ₂]` | `[𝒫]·[𝒫] ∈ A_{−1} = 0`, `[𝒫]·[ℳ] = [𝒫]` | holds | none |
| H4 moduli comparison (5.2) | `[𝔸¹/μ₂] → 𝔸¹`; `ℤ/p` quotient in char `p` | `p_*[Bμ₂] = ½[0]`; `deg(𝒱/p(𝒱)) = 1 ≠ 1/p = 1/e` because `k(y^p)` is imperfect | holds | none |
| H5 Edidin–Graham ring (5.3) | `𝔾_m` with weights (1,2) on `𝔸²∖0`; `μ_n` on a point | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `t ↦ [Bμ₂]`, `∫t = ½`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ` | holds | none |
| H6 degree of a point (5.4) | `[Spec ℂ/(ℤ/4)]` over `ℝ`; `[ℙ¹/μ₂]` | `[ℝ:ℝ]/2 = ½ = 2/4`; `div(t²/(t²−1)) = 2[𝒫]−[𝒪]`, `∫ = 2·½ = 1 = ∫[𝒪]` | holds | none |
| H7 virtual class without resolution property (6.2) | `L` with `𝓛_n`; `ℙ¹`, `E = [O(1)→Ω]` | `n[0₂] = −n[0₁]` because `div t = [0₁]+[0₂]`; `c₁(O(−1)) = −1`, the dual convention gives `+1` | holds | none |
| H8 relative characterisation (7.2) | char 2, `k[x]/(x²)`, `φ = (0, id)` | `φ^*ω = 0`, yet `(x+ax²)² = x² ≠ 0` in `k[x]/(x³)`: surjectivity on `H^{−1}` needed | holds | none |
| H9 canonical rational equivalence (8.1) | double deformation `sη = tν`; `𝔸¹ × Spec k[ε]`; `P`-divisors `a`, `2a`; nodal cubic | `ord_W s = ord_W t = 1`, `β = ν/η`; `∂β = 2[ν=0]−2[T=0]`; `(W, ½) ≠ 0`; `(node, 3) ≠ 0` | holds; identification with VirtualFundamentalClass §2.5 unsupported | R01 |
| H10 regular pullback (8.2) | node base, `𝔜′ = Spec k[a]/(a²)`; base `𝔸¹ × Spec k[ε]` | `v^!(−[𝔜×pt]) = −2[pt×pt] = c₁(O(−1))∩[𝔜′×ℙ¹]`; `2[pt]` on both sides | holds | none |
| H11 deformation invariance (8.4) | as row 8.4 | as row 8.4 | holds | none |
| H12 maps obstruction theory and vdim (9.3–9.5) | `ℙ^r`, `g = 0`; CY threefold; abelian threefold; `ℙ¹` with a doubled point; `ℙ¹×𝔸¹` | `Ob = 0`, dim `(r+1)d+r`, value 2 at `(2,1,0)`; `n`; `3`; `δ = 2`, `ℓ = 1`, vdim `3 = h⁰(O(2))`; vdim 4, `β = div t = 0` | holds | none |
| Conv. 6 full vs truncated `L` | abelian surface; elliptic curve | class in `H²(O_A) = k` is nonzero, so `id` lifts to no `O_A[1] → L`; `H¹(O) = k`, `H²(O) = 0` | holds | none |
| Conv. 2 regular local immersion | `η_b` with `𝔐 = B𝔾_m`; `Spec k → BG` | chart `V = B`, `U = {b}`: codim 1; `U → G` unit section, open and closed: codim 0 | holds | none |
| Description, Lean sentences | head `Suggested.lean` | 0 declarations, elaboration output empty; the text claims real-bodied statements and `sorry` warnings | contradicted | R03 |

- Source locators checked against the cached texts: 85 ranges, all supporting the statements as written (vistoli1989 31, stacks-chow-spaces 19, behrend-fantechi1997 11, kresch1999b 9, behrend1997 4, li-tian1998 4, rydh2015 2, edidin-graham1998 2, deligne-mumford1969 1, keel-mori1997 1, stacks-chow 1).
- Pinned library declarations: all 25 contract names (Mathlib 12, Tau Ceti 13) elaborate by `#check` (exit 0). For example: `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52`, `Normalization.lean:576` and `:598`, `TauCeti/AlgebraicGeometry/Chow/Basic.lean:86, 112, 168, 304, 369`, `Normalization/Finite.lean:120`, `VectorBundle/Degree.lean:82`. Grep confirms that the pins have no algebraic stacks and no cotangent complex as a derived object.
- Cross-roadmap citations resolved:
  - VirtualFundamentalClass at the #1996 head: §§0.2–9.6, 52 sections.
  - StackPointsAndResidualGerbes at the #2429 head: §§0.1, 0.3, 0.5, 1.3, 2.3, 2.5, 4.5, 5.3, 5.4.
  - SchemeAndStackFoundations: 23 sections and 30 named declarations on main, unchanged at #1808.
  - On main: EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2; StableReduction Layers 2–3; EnhancedDerivedSheaves §0.3, E1.4, E1.8; DerivedModuleAlgebra §§0.7, 0.12, 0.25.
  - StableReductionPartII §5.15; AlgebraicGromovWittenTheory §§4.1–4.3.
- Gate rerun at `fd554cb`: every check 0, `OK`. Dependency check: `depcheck: 253 roadmaps, 2400 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` exits 0 with no output. The file has no declarations, so the binder `#check` probe and the one-tactic padding probe are empty. The twelve headline theorems named in the docstring are not statable at the pins.
- Declared gaps `closed-substacks-of-stacks` and `normal-cones-of-local-immersions`: the same slug appears in `design/plan.json` and in the README, and the supplier is named. The `needs` sentence is precise. Neither object is stated by VirtualFundamentalClass §§1.5, 2.1, StackPointsAndResidualGerbes §§0.3–0.5 or SchemeAndStackFoundations.
- Shape: every one of the 31 named definitions has an API and at least 3 Checks. All nine layers end with Examples and Dependencies. No process words and no LaTeX.

Overlap check: read VirtualFundamentalClass, StackPointsAndResidualGerbes, AlgebraicGromovWittenTheory, SchemeAndStackFoundations (main and #1808), MotivicStructuresInModuliOfCurves, EquivariantIntersectionTheory and StableReduction. Shared objects and their owners:
- rational Chow groups of separated stacks: VirtualFundamentalClass;
- closed substacks and residual gerbes: StackPointsAndResidualGerbes;
- integral closed substacks and normal cones of local immersions: VirtualFundamentalClass, through the two gaps;
- Edidin–Graham groups: StableReductionPartII §5.15;
- the stable-map obstruction theory: AlgebraicGromovWittenTheory §4.1 (9.3 here is the general relative statement);
- Chow groups of Artin stacks: excluded here (MotivicStructuresInModuliOfCurves asks SchemeAndStackFoundations for them).

Source independence: 90 passages compared with 11 sources: the 85 verified locators, plus 1.2 against vistoli1989 (1.14), 5.2 against vistoli1989 (2.1), the *PDivisor* definition against kresch1999b Definition 1.4, 9.4 against behrend1997 Proposition 5, and the `Suggested.lean` docstring. None shares wording beyond forced formulas and names. The largest share is vistoli1989, with 79 of 173 locator mentions. Contents compared with vistoli1989 §§1–7: independent. Layers 1–5 regroup that paper's §§1, 3, 5, 2 and 6 in the order the *Needs:* lines force (2.x needs 1.2; 3.x needs 2.2; 4.x needs 1.1 and 3.x; 5.x needs 4.x), and Layers 6–9 rest on other sources.

## Not verifiable

- gillet1984 §4 (2.1, 2.2): settled as uncertified (paywalled). Not read; wording not compared.
- fulton1998 Prop. 1.8, §1.10, Ch. 3, Cor. 6.3, Prop. 8.1.1, Prop. 10.2: settled as uncertified (paywalled). Not read; wording not compared.

## Source issues

- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, p. 48: the source writes the right-hand Ext over `O_C`; it should be over `O_T`, the base of `p : C × T → T`; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1, p. 10: the source names `T_{Y′}|_{X′}`, with `Y′` the arbitrary stack, as the acting bundle; it should be `T_X|_{X′}`, the tangent bundle of the smooth regularly embedded `X`, which the proof uses; affects a stated result.
- **Misprint** in stacks-chow-spaces at Lemma 27.2 (0ERV), p. 43: the source takes `(S, δ)` from Situation 2.1 and `X` locally of finite type over `S`; it should take `X/B` good, with `δ` on `|B|` as in that Situation; affects nothing.

## For the human reviewers

- The Scope of StackPointsAndResidualGerbes at the #2429 head (`README.md`, lines 54–62) names VirtualFundamentalClasses, a stopped board package, as the owner of integral closed substacks and cycles. This roadmap's `gap:closed-substacks-of-stacks` assigns integral closed substacks to VirtualFundamentalClass §2.1.
