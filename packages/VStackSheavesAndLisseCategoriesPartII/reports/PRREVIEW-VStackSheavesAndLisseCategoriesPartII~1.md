# Review of VStackSheavesAndLisseCategoriesPartII (pull request #2288 at 1de1dfd)

**Verdict:** needs changes

## R01 (P2) — CoCorr_S, its trace maps and the relative Lefschetz–Verdier identity have a second owner at an open head

**Location:** `TauCetiRoadmap/VStackSheavesAndLisseCategoriesPartII/README.md` line 26: "the category of cohomological correspondences, its trace maps, the relative Lefschetz–Verdier identity and the base change of local terms that it uses … are CoCorr_S (VS8.7), the trace class (VS8.10), VS9.1 and VS9.6 here".

**Claim:** This roadmap is the single owner of these objects and `IgusaVarietiesAndTorsionConcentration` §7.9b only consumes them.

**Witness:** Head of pull request #1090, `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md` §7.9b, first paragraph: "construct the dualizable cohomological-correspondence category and its trace maps. Prove the relative Lefschetz–Verdier identity"; its *Needs:* cites only VStackSheavesAndLisseCategories VS0.2, VS4.2.

**Repair:** No change to this README (it is earlier in the merge order, 129 against 187, and stays the owner). In #1090, §7.9b: replace the two quoted sentences by "For torsion coefficients import CoCorr_S, the trace class, the relative Lefschetz–Verdier formula and the base change of local terms from VStackSheavesAndLisseCategoriesPartII VS8.7, VS8.10, VS9.1, VS9.6", keep only the rational-coefficient passage and the elliptic computation as its own, and add those four ids to its *Needs:* line.

## R02 (P3) — `Spd Z_p` is not a spatial v-sheaf

**Location:** README line 473 (VS6.11, Checks): "Spd Z_p is a spatial v-sheaf with two points that is not a diamond (VS6.5); by the spatial v-sheaf criterion its closed point is hit by no quasi-pro-étale map from a geometric point"; reused at line 670 (VS7.7).

**Claim:** `Spd Z_p` is spatial, so it shows that spatiality alone does not give (a).

**Witness:** Sch17 line 2974 (Definition 12.12) requires qcqs. `Spd F_p((t)) ×_(Spd Z_p) Spd F_p((t))` is the absolute product (both factor through the subsheaf `Spd F_p`), the punctured open unit disc over `F_p((t))`: not quasicompact. So `Spd Z_p` is not quasiseparated.

**Repair:** Replace the Check by: "`Spd Z_p` is decent (VS6.5) but not a spatial v-sheaf: it is not quasiseparated, since `Spd F_p((t)) ×_(Spd Z_p) Spd F_p((t))` is the absolute product, a punctured open unit disc, which is not quasicompact. Its closed point is hit by no quasi-pro-étale map from a geometric point: the base change of `Spa(C, C⁺) → Spd Z_p` along a characteristic-p geometric point `Spa(C′, C′⁺)` is the absolute product, of positive dim.trg over `Spa(C′, C′⁺)`. The equivalence (a) ⇔ (c) is therefore stated only over a separated spatial diamond V." In VS7.7 (line 670) drop "(VS6.11)" as the reason and give this base-change argument.

## R03 (P3) — the infinite ball does not have infinite dim.trg at every point

**Location:** README line 323 (VS6.6, Checks): "is not fine: it has infinite dim.trg at every point."

**Claim:** Every point of `Spa(C⟨T_1^(1/p^∞), T_2^(1/p^∞), …⟩)` has infinite transcendence degree over the base.

**Witness:** The C-point `T_i = 0` has residue field C, of transcendence degree 0 over C.

**Repair:** "is not fine: every nonempty open subset contains points whose residue field has infinite topological transcendence degree over C, so no chart W of the ball has W → V locally of finite dim.trg (charts are open and surjective, and the transcendence degree does not increase along W → ball)."

## R04 (P3) — two misprints in statements

**Location:** README line 224 (VS6.2, Checks): "(with F_ℓ coefficients, ℓ ≠ p, as in the definition of smoothness, its base change …" ; line 2014 (VS11.13): "fix(c̃)_U → U is étale".

**Claim:** The texts are well formed.

**Witness:** Line 224 opens a parenthesis before "with F_ℓ coefficients" that is closed only at the end of the bullet, after a second sentence; line 2014 writes `fix` for the object named `Fix(c̃)` in lines 1941 and 2016.

**Repair:** Line 224: close the parenthesis after "(FS21 Remark IV.1.10)" and start "In contrast, Rq^!F_ℓ = …" as an unparenthesised sentence ending "… are linearly independent." Line 2014: `Fix(c̃)_U → U`.

## R05 (P3) — a reference that no statement cites

**Location:** README line 2080: "**[Stacks07LT]** The Stacks Project Authors, *The Stacks Project*, More on Algebra, Tag 07LT (compact objects of D(R) are perfect complexes)".

**Claim:** The reference supports a statement of the roadmap.

**Witness:** `07LT` occurs only on line 2080; compact = perfect is imported from `DGAInfinity` Layer 5 (lines 21, 142, 912).

**Repair:** Delete the entry from `## References`, or cite it once at line 142 as the locator of the imported statement ("Stacks, Tag 07LT").

## R06 (P3) — the description's sentences about the Lean file do not match the head

**Location:** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** `Suggested.lean` states definitions and theorems, with `sorry` warnings.

**Witness:** `TauCetiRoadmap/VStackSheavesAndLisseCategoriesPartII/Suggested.lean` at 1de1dfd has an empty namespace (0 declarations); it elaborates with no warning at all.

**Repair:** "`Suggested.lean` states nothing: no headline theorem is statable at the pins (no perfectoid spaces, v-site, small v-stacks or D_ét in either library), and its module docstring lists each headline with what it lacks. It builds with no warning." Add one sentence naming the six declared supplier gaps (four on `EnhancedDerivedSheaves` §E3.4, two on `EtaleDualityAndPerverseSheaves` §§6.2–6.3).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| VS6.3 decent ⇒ Artin | `[S/C₂]`, S = Spd C; GHW22 line 1001 | chart q finite étale, diagonal fibre `C₂ × S`; source: Prop. 4.4, p. 20 | holds; locator exact |
| VS6.4 fibre products | `In_S(BC₂) = BC₂ ×_(BC₂×BC₂) BC₂` | two components `BC₂ ⊔ BC₂`, decent; GHW22 line 1011, pp. 20–21 | holds |
| VS6.6 fine maps | identity; `BC₂ → S`; infinite ball | top maps `id`, `id_S` (dim.trg 0); ball: C-point has tr.deg 0 | statement holds; Check wording R03 |
| VS6.8 smooth fine maps | `S → [S/Z_p]`; S = ∅ | base change `Z_p × S → S`: stalk of dualizing sheaf at 0 has rank ≥ 2 (δ₀, ν: values (1,0) on `U_n`, (0,1) on `W_n`); ∅: `id_∅` | holds; GHW22 Def. 1.3(ii), p. 3, Remark 4.6, p. 22 |
| VS6.11 (c) ⇔ (a) | `Spd Z_p` | fibre product over `Spd Z_p` of two copies of `Spd F_p((t))` not quasicompact | Check false: R02 |
| VS7.7 comparison `c_f` | `q : S → BC₂`, Λ = F₃; `BC₃ → S`, p = 2 | swap of `e_1, e_σ` commutes with `e_g ↦ δ_g`; `H⁻¹(Rf_!Λ) = F₃` vs `H⁻¹(Rf_*Λ) = 0` | holds; fineness alone insufficient |
| VS7.8 intrinsic smoothness | `BC₃ → S` (p = 2, F₃); `S → [S/Z_p]`, M = `C(Z_p, Λ)` | `Rf^!M = M`, `H₁(C₃, F₃) = F₃`; `Haar ⊗ M` countable rank vs `Dist(Z_p, Λ)` uncountable | holds; GHW22 lines 1594–1602, p. 31 |
| VS7.9 dualizing complex, integration | `S/S`; `P¹`; `T = Z_p`; Λ = 0 | `Λ`, `∫ = id`; `Λ(1)[2]`; `H⁰ = Dist(Z_p, Λ)`, two independent germs at 0; `K = 0` invertible | holds; HKW22 Def. 4.1.9, p. 24 |
| VS7.10 twists | `I = e₁Λ ⊕ e₂Λ[1]`, Λ = F₃ × F₃, f = `P¹ → S` | `I ⊗ J = Λ`; both sides `e₁Λ(1)[2] ⊕ e₂Λ(1)[3]` | holds; source's "étale locally L[n]" too narrow |
| VS7.11 diagonal | f = id; `P¹ → S` | `Λ ⊗ Λ = Λ`; `Λ(−1)[−2] ⊗ Λ(1)[2] = Λ` | holds; HKW22 Lemma 4.1.11, pp. 24–25 |
| VS8.3 Grothendieck construction | B terminal; direction of p | `C_F = F(∗)`; `u′` uses `F(p) : F(c′f)L → F(gc)L`, so `p : gc ⇒ c′f` in B | holds; LZ22 lines 364–441, pp. 7–9 |
| VS8.4 biduality criteria | `Λ = Z/6`, `P = 3Λ`; `Λ ⊕ Λ[1]`; `Q` over `Z` | `tr(id_P) = 3`, `LinearMap.trace = 0`; `1 − 1 = 0`; `H⁰`: 0 vs `Q` | holds; HKW22 Lemma B.1.2(2), p. 73 |
| VS8.9 dualizable = ULA | `(S, A)`; Λ = 0; `j_!Λ` on closed disc | perfect ⇔ dualizable; 0 dualizable; not ULA for Λ ≠ 0 | holds; FS21 Thm IV.2.23, p. 124 |
| VS8.10 trace class | `Λ²`, matrix u; `C = S ⊔ S`, `u = (1, 2)`, F₅ | matrix trace; class `(1, 2)`, integral 3 | holds; HKW22 pp. 31–32 chain matches |
| VS9.1, VS9.2 | `C = ∅`; `X′ = S`, `X = P¹` | `0 = 0`; `∫ cc = χ = 2` | holds; HKW22 Thm 4.3.8, Cor. 4.3.9, pp. 32–33 |
| VS9.3 Lefschetz | `z ↦ az` on `P¹`; `T ↦ T + p` on closed disc | `1 + 1 = 2 = tr` on `H⁰ ⊕ H²`; `Fix = ∅` vs trace 1 | holds; source omits Y proper (HKW22 line 1625) |
| VS9.4 local terms | `β = ∅`; `β₁ ⊔ β₂`; `id` on `P¹` | 0; sum; only the integral 2 is a number | holds; HKW22 Def. 4.3.11, p. 33 |
| VS10.5, Conventions (Haar character) | affine group over `ℚ_p`, `g = diag(p, 1)`; `Z_p` over `F_p` | `μ(Eg) = pμ(E)`, `χ_G = p`, `δ_G = [K : gKg⁻¹]⁻¹ = 1/p`; `Haar = 0` | holds |
| VS10.7 point of `[S/G_S]` | G finite; `G = Z_p`, M = Λ | `Rq_* = Rq_! = Λ[G] ⊗ −`; `Rq^!Λ = Haar(Z_p, Λ)` | holds; HKW22 Example 4.2.2, pp. 25–26 |
| VS10.8 subgroups | `H = 1`; H open; `H′` finite | reduces to VS10.7; `Rq^! = q^*`; `Rq^!M = M` | holds; HKW22 Example 4.2.3, p. 26 |
| VS10.9 structure map | adjunction; `G = C₃`, F₃ | `Hom((M ⊗ Haar)_G, N) = Hom_G(M, Haar^* ⊗ N)`; `H₁ = F₃` | holds; HKW22 Example 4.2.4, p. 27 |
| VS6.9, VS11.2 orientations | `S₃`, `h = (123)`, `f₂(t) = (12)` | `h⁻¹f₁(t) = (13) = f₂(t)h⁻¹`; `hf₁(t) = (12) ≠ (23)`; `g⁻¹cg = (13)` | holds |
| VS11.3, VS11.4 trace distribution | `Z/2`, sign, F₃; affine group over `ℚ₂`, F₅ | `1, −1`; `2·3 = 1` stated direction, `2·2 = 4` other | holds; HKW22 Prop. 4.4.3, p. 35 |
| VS11.9 Künneth | `T = S`; `X_i = T`, `A_i = Λ` | `cc ⊠ cc = cc(A₁ ⊠ A₂)`; both sides `cc_(T/S)(Λ_T)` | holds; HKW22 Thm 4.5.3, p. 38 |
| VS11.12, VS11.13 | `S₃`, `x = (12)`, `a = (123)`; matrices `[[a, b], [0, 1]]` on `P¹` | converted map: `xa = (23)` both ways, unconverted `(13)` vs `(23)`; `w(bw + a − 1) = 0`, double root at `a = 1` | holds; étaleness hypothesis needed |
| VS7.5 existence of `Rf_!`, `Rf^!` | `BC₂ → S`; separated representable f | coinvariants; Scholze's functor (GHW22 Thm 1.4(1)) | holds conditional on the four declared gaps |

- Source locators checked at number and page: 72 (GHW22 14, HKW22 31, LZ22 12, Sch17 6, FS21 9), plus LiuZhengEnhanced Prop. 2.2.4 (p. 79), Thm 4.1.8 (p. 105), LiuZhengGluing Thm 5.4 (p. 38), Cor. 0.4 (p. 3); all exact.
- Library declarations opened at the pins: `Module.IsReflexive` (Mathlib/LinearAlgebra/Dual/Defs.lean:203), the two instances (Dual/Lemmas.lean:262, 284), `FGModuleCat.rightRigidCategory` (Basic.lean:265), `LocallyConstant.charFn` (Algebra.lean:92), `LinearMap.projectiveTrace`, `projectiveTrace_cyclic`, `projectiveTrace_eq_trace` (TauCeti/LinearAlgebra/Trace/Projective.lean:72, 96, 118), `TauCeti.IsSmoothDiscrete`, `PreAdicSpace` (Basic.lean:40); no monoidal bicategory in Mathlib.
- Cross-roadmap citations resolved at main or at the open heads: all sections cited of the 15 suppliers exist with the cited content (base roadmap VS0.1, VS0.2, VS1.1, VS1.2, VS4.2, VS5.2 by target name).
- Declared gaps: six, same slugs in `design/plan.json` and in the README, each with a named supplier and section; precise and not already provided (`EtaleDualityAndPerverseSheaves` §§6.2–6.3 are stated for finite ℓ-power rings and `D^b_ctf` only).
- Gate: every check passed. Dependency check: `depcheck: 239 roadmaps, 2172 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: no error, no warning; no declaration, so the `#check` comparison and the one-tactic probe have nothing to test. Headlines (VS7.5, VS8.9, VS9.1, VS9.2, VS9.3, VS9.6, VS9.8, VS11.4, VS11.9, VS11.12) are each named in the docstring with the missing carrier; none is statable at the pins.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas, AdicCoefficientsAndComparisons, GeometricSatakeAndFusion, EnhancedDerivedSheaves, and EtaleDualityAndPerverseSheaves, IgusaVarietiesAndTorsionConcentration; shared: CoCorr_S with its trace maps and the relative Lefschetz–Verdier identity (owner: this roadmap; IgusaVarietiesAndTorsionConcentration §7.9b must cite, R01); scheme correspondences (owner: EtaleDualityAndPerverseSheaves §6, cited); nothing else shared.

Source independence: 21 passages compared with 5 sources, none shared beyond statements the mathematics forces; largest share HKW22, about 201 of 405 source mentions; contents compared with HKW22 §§4.1–4.6, 5.3, Appendix B: independent (§4.2 ↔ VS10 is placed after §4.3 ↔ VS8–VS9, §5.3 is merged into VS9, Appendix B is split between VS8 and VS10; the order inside VS11 is forced by its *Needs:* lines VS11.9 → VS11.5–VS11.8, VS11.12 → VS11.7, VS11.8).

## Not verifiable

- GHW22 and HKW22 internals of the three DESCENT iterations (VS7.5, steps 1–4) against LiuZhengEnhanced §4.1: outside the sample, read only at the statement of Theorem 4.9 and Theorem 4.1.8.
- Ownership against board packages not yet in a pull request: only the three listed in the package index were available by name; not read.

## Source issues

- **Error** in HKW22 at §4.1, parenthesis before Theorem 4.1.6, printed p. 23: the source says an object is invertible exactly when it is étale locally a shifted invertible module; it should be only the "if" direction, since shifts may differ on idempotent factors of Λ; affects nothing.
- **Error** in HKW22 at Example 4.1.1, printed p. 22: the source says maps between classifying stacks of group diamonds are homomorphisms; it should be torsors for the target group with a commuting action of the source group; affects nothing.
- **Gap** in HKW22 at Theorem 4.1.8, printed p. 24: the source says the cited theorem gives a pseudo-natural isomorphism of exceptional and ordinary pushforward on proper maps; it should be proved separately, the cited theorem listing five properties without it; affects the proof.
- **Misprint** in HKW22 at Definition 4.1.7, printed p. 23: the source says the diagonal condition and strict surjectivity are Definitions 4.3 and 4.1 of the cited paper; it should be Definitions 4.1 and 1.1 of arXiv:2202.12467v1; affects nothing.
- **Error** in HKW22 at Example 4.2.5, printed p. 27: the source says any chosen Haar measure identifies the twisted invariants with invariant distributions; it should be a generator of the rank-one module of Haar measures; affects a stated result.
- **Gap** in HKW22 at Example 4.3.10, printed p. 33: the source says properness of X suffices to apply the trace theorem to a correspondence Y; it should also require Y proper over the base; affects a stated result.
- **Error** in HKW22 at §4.6, closing remark, printed p. 44: the source says isolated fixed points over a conjugation-invariant open make the restricted inertia étale; it should assume the fixed locus étale over that open; affects a stated result.
- **Misprint** in GHW22 at §1.2, item (3), printed p. 5: the source says the partial-adjoint statement is Proposition 1.4.4 of the cited paper; it should be Proposition 2.2.4 of arXiv:1211.5948v4, p. 79; affects nothing.

## For the human reviewers

- GHW22, the source of Layers VS6–VS7 (87 mentions), is an arXiv preprint (2202.12467v1, 2022) with one public version; HKW22, the published article, cites a later numbering of it that is not public.
- The README carries a section `## Corrections to the sources` (lines 2045–2062, 14 items); no roadmap on main has a section of that name.
