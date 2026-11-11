<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13086#issuecomment-6791518693 -->
Red team round 1 pass b (claude) of e8dde6d

Verdict: needs_changes

1. **F01** (P2) §4.9 asserts the period comparison for models where neither tool of its route exists

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:858` ("every reasonable `B_m`-model `W` of the full Fréchet or compact-type class of §4.2, without assuming a dense countably generated `B_m`-submodule, prove the Hom and `Ext¹` comparisons"); also `:742` ("The statements below quantify over this full class"), `:870` ("For every reasonable `B_m`-model `W`"), `:940` ("the full class of period models uses §4.9").

   Claim: `Hom_TVS(B_d, 𝐖) = W[t^d]` and `Ext¹_TVS(B_d, 𝐖) = W/t^dW` for every Fréchet or compact-type `B_m`-model, separable or not. §4.9 has no proof route; its only inputs (§4.7, §4.8) are stated for separable `W`, and §4.7's route is "apply continuous `C`-linear functionals on `W`" (Hom) and an orthonormal basis (`Ext¹`).

   Witness: CN25 line 2892–2895 (Remark A.2, p. 58): the spherical completion of `C_p` is a `C_p`-Banach space whose continuous `C_p`-dual is 0. It is a Banach `B_1`-model of §4.2's full class (`m = 1`), has no nonzero functional and no orthonormal basis, so both steps of the route are empty on it. CN25 Proposition 4.22 reduces to `m = d = 1`, i.e. Proposition 4.18 (CN25 line 1227), whose hypothesis "reasonable" includes separable (CN25 line 1193–1195). The source therefore proves the separable case only; the README's own Check (`c₀(I, C)`, `I` uncountable, line 865) is true because that space has coordinate functionals and a basis, not because of the general claim.

   Repair (tested on the witness: the spherical completion is excluded; `c₀(I, C)` with `I` uncountable stays included and its Check stays true):

   - §4.9, replace the first sentence by: "For integers `m ≥ 1` and `d ≥ 1` and every reasonable `B_m`-model `W` of §4.2 each of whose graded pieces `t^iW/t^(i+1)W` is, as a `C`-space, a Banach space isomorphic to `c₀(I, C)` for a set `I` of any cardinality, or a Fréchet or compact-type limit of such spaces, prove the Hom and `Ext¹` comparisons of CN25 Proposition 4.22 for the source `B_d`. Countable type is the case of countable `I`. On this class coordinate functionals separate points and an orthonormal basis exists, which is what the route of §4.7 uses." Delete "The same-type Module and Pair comparisons hold for this full class" and write "The same-type Module and Pair comparisons of §§4.10–4.16 are asserted for this class."
   - §4.9, add the proof route: "A proof route: repeat §4.7 with the coordinate functionals of `c₀(I, C)` in place of countable-type functional extension, and with its orthonormal basis in the Banach step; pass to Fréchet and compact-type limits by §4.8 and §4.5; then run the `t`-filtration dévissage of §4.10."
   - §4.9, add the negative Check: "The spherical completion of `C`, a `C`-Banach space with zero continuous dual (CN25, Remark A.2, p. 58), is outside the class: it has no coordinate functional, and no comparison is asserted for it."
   - Line 742: replace "The statements below quantify over this full class, and §4.9 covers the models without a countable-type hypothesis" by "The comparisons below are asserted for the class of §4.9, which contains every model of countable type."
   - Line 870: "For every reasonable `B_m`-model `W`" → "For every reasonable `B_m`-model `W` of the class of §4.9". Line 940: "the full class of period models uses §4.9" → "models beyond countable type are those of §4.9".

   If the general nonseparable statement is wanted instead, it needs a route that uses neither functionals nor bases; none is given and the source has none.

2. **F02** (P2) the embedding `K̄ → B_dR⁺` of §0.8 has no owner

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:104` ("Sections 1.5, 2 and 4.1–4.3 supply `B_dR⁺`, `B_dR`, `θ`, `t`, their topologies and continuous actions, the embedding of `K̄`, the fixed fields") and `:242` ("the canonical embedding `K̄ → B_dR⁺` has dense image").

   Claim: PadicPeriodRings supplies the embedding of `K̄` in `B_dR⁺`.

   Witness: PadicPeriodRings §4.3 at its open head constructs only "the `G_K`-fixed embedding `K→B_dR^+` whose composite with `θ` is `K→C_K`" (its README line 473); no section of that roadmap states a map from `K̄`. §0.8, §0.9 (smooth vectors, density) and Layer 1 all use the map from `K̄`.

   Repair:

   - Line 104: replace "the embedding of `K̄`" by "the `G_L`-fixed embedding `L → B_dR⁺` for each `p`-adic field `L` (§4.3), functorial in `L` (§4.1)".
   - §0.8, insert before the density statement: "For each finite `L/K` inside `K̄`, PadicPeriodRings §4.3 applied to `L` (a field of the same kind, with the same `K̄` and `C`) gives the `G_L`-fixed embedding `L → B_dR⁺` lifting `L → C`; these are compatible by the functoriality of its §4.1, and their union is the canonical `G_K`-equivariant embedding `K̄ → B_dR⁺`. Constructing it and proving its uniqueness as a `K`-algebra lift of `K̄ → C` (Hensel in the complete discrete valuation ring `B_dR⁺`) is part of this target."
   - §0.8 Checks, add: "On `L = K(√p)` (odd `p`) the embedding sends `√p` to the square root of `p` in `B_dR⁺` whose image under `θ` is `√p`; the other root has image `−√p`."

3. **F03** (P3) §0.5 uses the statement of §1.8 without naming it; Layer 0 depends on a Layer 1 theorem

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:204` ("The independent BC lemma is this. An infinite-dimensional image in `V₁` is all of `V₁`, since its only proper BC subobjects are finite `ℚ_p`-spaces. Additivity then computes the kernel.") and `:206` (the `*Needs:*` line of §0.5).

   Claim: §0.5 follows Fontaine03 §5.1 with §0.3 and the parent only.

   Witness: Fontaine03 line 2409 (inside the proof of Théorème 5.1, which runs from line 2317 to line 2467) applies Théorème 4.1; CN25 line 422–425 (footnote 2) says the same. Théorème 4.1 is this roadmap's §1.8, a Layer 1 target, whose own `*Needs:*` are §§0.1–0.3 and the parent. §0.5 re-derives it in two sentences and omits the parent's *Banach–Colmez morphism calculus* that §1.8 lists.

   Repair: in §0.5 replace the three quoted sentences by "Where Fontaine03 §5.1 applies its Théorème 4.1 and the corollary, use §1.8, which needs only §§0.1–0.3 and the parent and is proved before this target." Add "§1.8" to the `*Needs:*` of §0.5 and to the Layer 0 Dependencies paragraph (line 277), and in "How to read the build" (line 128) add: "The fundamental theorem §1.8 is stated in Layer 1 with the extension theory but depends only on §§0.1–0.3; it is proved before §0.5, which uses it." (No renumbering: CstConjectureForDaggerVarieties cites §§0.8–0.9 by number.)

4. **F04** (P3) Fontaine03 "Proposition 5.6" does not exist; the result is Théorème 5.6

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:285` ("Fontaine03 Propositions 5.5–5.6 move extension classes into the finite-period or finite-`ℚ_p` subcategory") and `:299` ("using Propositions 5.5–5.6").

   Claim: Fontaine03 has Propositions 5.5 and 5.6.

   Witness: Fontaine03 line 2470 is Proposition 5.5 (p. 344); Fontaine03 line 2526 is "THÉORÈME 5.6" (p. 346). There is no Proposition 5.6. CN25 line 419 has the same mislabel.

   Repair: in both places write "Fontaine03 Proposition 5.5, p. 344, and Théorème 5.6, p. 346".

5. **F05** (P3) a scope bullet names AlgebraicVectorBundles, which nothing in the roadmap consumes

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:18` ("AlgebraicVectorBundles, Scope and ownership and Layers 1–2: pullback of module sheaves along morphisms of ringed spaces with its strong monoidal (tensor) comparison, exactness of flat pullback and the base change of internal Hom").

   Claim: the roadmap leaves these objects to AlgebraicVectorBundles, i.e. it meets them.

   Witness: `grep -n AlgebraicVectorBundles README.md` returns line 18 only: no `*Needs:*` line, no supplier-contract subsection, no Dependencies paragraph, no proof route. No target of Layers 0–6 uses a module sheaf on a ringed space or its pullback. The bullet creates a dependency edge to a roadmap the build never uses.

   Repair: delete line 18.

6. **F06** (P3) a locator into the worker's text extraction in the README

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:24` ("which is Fontaine's setting (Fontaine03 line 167)").

   Claim: a reader can find the passage.

   Witness: "line 167" is a line of the cached extraction, not of the published text; every other locator in the README is a section, theorem or page. The passage is §1.2, p. 289 of the paper (Fontaine03 line 166–168).

   Repair: replace "(Fontaine03 line 167)" by "(Fontaine03, §1.2, p. 289)".

7. **F07** (P3) two Checks that test nothing

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:816` ("For a continuous map `H → W` that is not a cocycle, or an action that is not isometric on the steps, the hypotheses fail and the conclusion is not claimed") and `:328` ("The definition of `W_(1)` makes sense when `t` acts nilpotently").

   Claim: these are discriminating Checks of §4.5 and §1.3.

   Witness: the first states only that the theorem is not applied outside its hypotheses and holds for any theorem; without it §4.5 has two Checks. The second asserts well-definedness with no value; the README's own explanation of why (the period twist is not an inverse operator) is already in the statement.

   Repair:

   - Line 816, replace by: "For `H = ℤ_p` acting trivially on `W = colim_n C^n` (coordinate inclusions), a continuous cocycle is `x ↦ x·w` with `w = c(1) ∈ C^N`, and its image lies in `W_N`. The step `N` depends on the cocycle: `w = e_N` needs `N`, so no single step contains all cocycles."
   - Line 328, replace by: "For `W = C(1) = tB₂`, where `t′` acts by zero, `(t′)^(−1)W` is `C` with its untwisted action, so `W_(1) = t′·K = Kt′` and `W_(0) = 0`; reading `(t′)^(−1)` as an inverse operator on `W` would be meaningless here." (Values: generalized invariants of `C` are `K`, of `C(1)` are 0; consistent with the complex of §1.4 for `C(1)`, cohomology `0, K, K`.)

Two P2 findings (R01, R02) and five P3 findings (R03–R07). No P1: no stated theorem, Check or Lean statement was refuted. No finding re-raises a settled one (the repair reports mark none "not actionable in this package").

## Verified sound

Counts: 3 Suggested.lean declarations read (whole file, 106 lines); 62 numbered targets and the Conventions read (whole README, 1205 lines); 96 locators checked against the cached texts, 95 correct (R04 is the exception); 224 Checks read, of which every one carrying a number, a sign or an explicit object was recomputed (table below), 2 found empty (R07); 47 sibling citations resolved; 21 pinned declarations opened at their cited file and line, all present with the stated hypotheses.

Dependency check, run on the package README:

```
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` touches only the package folder (README.md, Suggested.lean, sources.toml, two reports).

Suggested.lean. I ran no Lean (this pass is read-only); I compared the three elaborated types in the worker's `signatures.md` with the README statements. No section `variable` is used, every binder is in the declaration's own signature, and nothing was lost. `SemilinearRep`: real body, native carriers, no sorry'd data. `semilinearRep_equivariant_map_smul` equals §0.2 (finite `K` via `[FiniteDimensional ℚ_[p] K]`, module topologies, continuous additive map). `fundamental_extension_surjective` equals §1.8 (Fontaine03 line 1816–1820): `V = ker q`, `finrank W = 1`, `range η ≠ η(V)`. Form: one `import Mathlib`, module docstring of the required shape, namespace, layer comments, no `lemma`, `set_option`, `#check`, `#eval` or `True`. Headlines of the README summary: full faithfulness for `C`-representations (stated), fundamental theorem (stated), `B_dR⁺` full faithfulness, structure theorem and Euler–Poincaré duality, disc extension class, qBC full faithfulness, height–rank formula (each named in the docstring with the missing carrier; I confirmed at the pin that `BDeRhamPlus` in Mathlib/RingTheory/Perfectoid/BDeRham.lean:75 has no topology or action and that neither library has a Banach-representation category or sympathetic algebras). No padding: the file has one structure and two deep theorems. No declaration name collides with one in another roadmap (`roadmaps grep --lean-only` for the three names: no match). The nearest object, `GaloisGerbs.ContinuousSemilinearAction` of SchemeAndStackFoundations (on main), is an action of `Gal(L/k)` on an `L`-algebra with open stabilizers, not a completed action on a `ℂ_p`-module, so it is not an owner.

Adversarial pass (statement; instances; values on each side; result):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `SemilinearRep` law | `σ = 1`; trivial action on `ℂ_p`; `p = 2` | `c•w = c•w`; `ζ_p ≠ ζ_p^a` for `a ≢ 1`; `i ≠ −i` for `χ ≡ 3 mod 4` | trivial action excluded; holds |
| §0.2 / Lean thm 1 | `W₁ = 0`; `C → C`; `C → C(1)`; `B₁ → B₂` | Hom `0`; `K`; `H⁰(C(1)) = 0`; `1 ↦ tc` has `σ(tc) = χ(σ)tσ(c)`, not equivariant, Hom 0 | holds |
| §0.4 height | `ℚ_p`; `C`; `C/ℚ_p`; `C ⊕ ℚ_p` with two presentations | `(0,1)`; `(1,0)`; `(1,−1)`; `1` and `2 − 1 = 1` | independent of presentation here |
| §0.5 additivity | `ℚ_p → C → C/ℚ_p`; `C(1) → B₂ → C` | `1 = 0+1`, `0 = 1−1`; `2 = 1+1`, `0 = 0+0` | holds |
| §0.9 items 1–4 | `(N,k) = (1,1)`; `k < ℓ`; `k = ℓ` | `K` (not `K²`); composite `B⁺ → B_k → B_ℓ` is a scalar `κ` with `κt^k = 0`, so 0; identity survives | agrees with CN25 line 496–530 |
| §1.1 almost split | `B₂` with `Z = ℚ_pt`; `C/ℚ_p`; `log χ` | `U₁ ∩ tB₂ = ℚ_pt`, `U₁/ℚ_pt ≅ C` splits; quotient sequence `0 → 0 → C/ℚ_p`; `Z = ℚ_p` | agrees with Fontaine03 line 278–291 |
| §1.3 `W_(0)`, `W_(1)` | `C`; `B₂`; `C(1)` | `(K, 0)`; `(K, Kt′)`; `(0, Kt′)` | agrees with CN25 line 456–459 |
| §1.4 complex | `C`; `C(1)`; `B₂`; wrong sign of `χ⁽¹⁾` | cohomology `K,K,0`; `0,K,K`; `0,0,0`; `d₁d₀ = (1 − χ⁽¹⁾(γ)²)t′γz ≠ 0` | signs as in Fontaine03 line 1019–1023 |
| §1.5 Euler characteristic | `(ℚ_p,ℚ_p)`; `(C/ℚ_p, ℚ_p)`; `(C, C(j))` | `1 − (n+1) + 0 = −n`; `0 − (−n) = n = −n·(−1)·1`; 0 | sign correct; FF18's unsigned sum is a misprint |
| §1.6 table | `k=1,j=0`; `k=1,j=1`; `k=2,j=0,1,2` by long exact sequences | `(1,1,0)`; `(0,1,1)`; `(1,1,0)`, `(0,0,0)`, `(0,1,1)` | holds; ranges `1≤j≤k`, `0≤j≤k−1` recomputed |
| §1.7 | `N=0,i=1,j=2`; `N=1,i=1,j=2`; `i=j` | twists of source `0..i−1`, each has `W_(0)`, `W_(1)` both lines; acyclic; identity survives at `i=j` | holds |
| §1.8 / Lean thm 2 | `V ⊕ C`, `η=(g,1)`; `η=(g,0)`; `V=0, W=C(1)`; `U₁, θ` | kernel `≅ V`; excluded, kernel `ker g ⊕ C`; `η = 0` excluded; kernel `ℚ_pt`, dim 1 | holds |
| §2.1, §2.3 | `[0→C]`; `[C=C]`; `T(x)_n = p^nx_n` on `c₀` | usual; 0; `(p^n) = T(1,1,…)`, `(1,1,…) ∉ c₀`, class ≠ 0, separated quotient 0 | holds |
| §3.1 `ψ_1` normalisation | odd `p`; `p = 2` | `E_(1/p^k)` is a `p^(k+1)`-th root of `exp(pX)`, `ψ_1 = c/p`; fourth root of `exp(4X)`, `ψ_1 = c/4`, `ψ_2 = c/2` | `κ = pψ_1`, `κ = 4ψ_1` consistent with §3.4 |
| §3.2 congruences | `p=3,n=0`; `n≥1`; `p=2` | middle terms of valuation `≥ 1/p`; `≥ 1 − 1/p^n + 1/p^(n+1) > 1/p`; `Y_0²+Y_0 = X + 2X² + …`, `Y_n² + 2^(1−1/2^n)Y_n = Y_(n−1)` | holds; CN25's proof covers odd `p` only |
| §3.4 valuations | `3^k/k!`, `k = 0,1,2,3,6,9`; `4^k/k!`, `k = 0..4`; degrees | `0,1,2,2,4,5`; `0,2,3,5,5`; `6,3,18` and `2,2,4`; `|ζ_p−1|^(−1) = p^(1/(p−1)) ≤ p` | holds |
| §3.4 last Check | `(1+cX)^(1/p)` | coefficient valuation `k·v(c) − k − v_p(k!)`; at `v(c) = p/(p−1)` it is `s_p(k)/(p−1)`, not → ∞ | holds |
| §3.5 | `f = c`; `f = YZ`; `k = p^r m` | `u = −c`; `u = X²/2`; `v_p(binom(k, p^(r−1))) = 1` by one carry | holds, including `k` a power of `p` |
| §3.7, §4.4 sign | relation `(tc, −c)` versus `(tc, c)` | `(b,c′) ↦ b + tc′` gives class 1; other sign gives −1 | README sign is the consistent one |
| §4.10 | `W = B_m`; `d ≥ m`; `d = 0` | both of length `min(d,m)`; both `W`; `W[1] = 0 = W/W` | holds |
| §4.13 | `d = 1, W = C`; general | `C → C` identity, next term 0; Hom is an extension of `t^dW` by `W[t^d]` | `Ext¹ = 0`; CN25's displayed `W` is a misprint |
| §5.2 | `C/ℚ_p`; `B_d/ℚ_p^h`; `U_1/ℚ_pt_x` | `H¹(O(−d/h)) = B_d/ℚ_p^h` from `0 → O(−d/h) → O^h → B_d`; unit `v`, unit `t_x` | holds |
| §5.3, §5.4 | `ℚ_p ⊕ B₁ ⊕ U_1/ℚ_pt_x` | pieces `(>0, =0, <0) = (U_1/ℚ_pt_x, B₁, ℚ_p)`, matching the parent's *Canonical curvature filtration* | holds |
| §6.5 | `V₁`, lattice targets | `Hom(V₁, B_m) → Hom(V₁, B_(m−1))` zero, `lim = 0`, `Ext¹ = C`, transition 0 | agrees with LeBras18 line 1176–1186 |
| §6.7 | `ℚ_p`; `C`; `C/ℚ_p` | `1 = 1+0`; `0 = 0+0`; `0 = −1+1` | holds |
| gap:G-HOM | `W = ℚ_p` | a map is `1 ↦ b`, `b ∈ t^(−N)B⁺` for one `N`; pointwise reading empty as the README says | precise, minimal, same slug in `design/plan.json` and the README; parent proves the torsion-source case only |

Sibling citations resolved at the suppliers' current versions: all 18 parent target names of VectorBundlesAndIsocrystals Layer 5 exist as headings with the properties this README attributes to them (curvature signs, `ht = dim V₁ − dim V₂`, "a proper subobject of `V₁` is finite-dimensional over `ℚ_p`", the extension criterion); PadicPeriodRings §§1.1, 1.2, 1.5, 2, 4.1–4.3 (general-base `H⁰(G_K, C(i))`, the identification with `PadicComplex`, the fixed fields; R02 is the one statement not found); PadicHodgeTheory §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; ArithmeticGaloisRepresentations §1.1; ArithmeticGaloisDuality §§R02.1.3, R02.2.1, D7.4; LocallyAnalyticDistributions §§0.0–0.3, Layer 1 and its four named targets, with hypothesis (a) of its §0.2 (finite `K/ℚ_p`) correctly not applied over `C`; PerfectoidTowers §P9.6 and its three named targets with the hypotheses the README repeats; PerfectoidSpaces Layers P1, P3, P6 (on main). All suppliers are earlier in the merge order or on main. CstConjectureForDaggerVarieties cites §§0.8–0.9, 2.3, 2.7–2.8, 4.2–4.3, 5.1, 5.3, 6.6–6.7 of this roadmap; each exists under the cited number with the cited content.

Ownership: almost `C`-representations, TVS, period Pairs, qBC and the height functor occur in no roadmap on main and in no other open roadmap except as citations of this one (`roadmaps grep` over all open heads and main).

Policy: no pull-request number, process word, `lemma` or `set_option`; every target has a locator.

## Not verifiable

- §3.4's three-step route (tower comparison, inflation, decompletion with the constant `p`) is the roadmap's own elaboration of the two-line argument at CN25 line 1092–1096. I checked its numbers and its use of PerfectoidTowers §P9.6, not the uniform boundedness of the normalized traces or the almost-purity bookkeeping.
- §4.8 (all separable Fréchet targets): CN25 argues only the nuclear case. The statement looks right (dense transition maps of Banach quotients give vanishing `lim¹`), but no source proves it.
- §6.2 and §6.4 (comparison of VS with v-sheaves, pseudocoherence of BC sources): the cited passages of LeBras18, AnschutzLeBras25 and TVS25 exist where cited; that they yield the VS statements is this roadmap's own target and was not checked.
- The mathematical content of Colmez02 Propositions 5.20 and 5.23 and Théorème 10.5 beyond their location and the use CN25 makes of them.
- Lean elaboration: not run in this pass; the comparison used the worker's elaborated signatures.
- CstConjectureForDaggerVarieties declares two gaps on this roadmap (`gap:qbc-pairs`, `gap:natural-period-hom`). They are that roadmap's contracts and are not findings here; nothing in this package states them yet.

## Source issues

- **Misprint** in CN25 at proof of Lemma 2.10, p. 11: the source says the second generalized-invariant space is nonzero for `0 ≤ j ≤ j−1`; it should be `0 ≤ j ≤ k−1`; affects nothing.
- **Misprint** in CN25 at the paragraph before Proposition 2.5, p. 9: the source says the reduction relies on Propositions 5.5 and 5.6 of Fontaine's paper; it should be Proposition 5.5 and Théorème 5.6; affects nothing.
- **Misprint** in CN25 at Remark 4.3, p. 21: the source says the two-term description of the left heart is Schneiders's Corollary 1.2.20; it should be Corollary 1.2.21; affects nothing.
- **Gap** in CN25 at proof of Lemma 4.9, p. 23: the source says the first equation is a `p`-th power equal to `exp(pX)` for every `p`; it should use `exp(4X)` and a quadratic first relation at `p = 2`, where `exp(2X)` is not a closed-disc series; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.9, p. 23: the source says the recursion relates `Y_(n+1)` to `Y_(n−1)` with the constant 1 only on the right; it should be the `p`-th power of `1 + p^(1/p^(n+1))Y_n` equal to `1 + p^(1/p^n)Y_(n−1)`; affects nothing.
- **Gap** in CN25 at proof of Lemma 4.13, p. 24: the source says to use the index `i = p^r` with `r = v_p(k)`; it should be `i = p^(r−1)`, since `p^r = k` is out of range when `k` is a power of `p`; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, p. 24: the source says the coefficient is a multiple of `b_(i,k−1)`; it should be `b_(i,k−i)`; affects nothing.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, pp. 25–27: the source says the pushout is the quotient by the pairs `(t^d c, cw)`; it should be by `(t^d c, −cw)`, which is what makes the class of `B₂` equal to 1; affects nothing.
- **Misprint** in CN25 at Lemma 4.24(i), p. 28: the source says the first extension group from `U_d` into a reasonable Module is `W`; it should be 0, as its own proof derives; affects a stated result.
- **Gap** in CN25 at proof of Lemma 4.29, p. 30: the source says linearity holds for all `c` in the ring of integers but treats only units; it should add the nonunit case through `c = (1+c) − 1` and additivity; affects the proof.
- **Gap** in CN25 at Proposition 4.18 and proof, p. 26: the source says the result holds for every reasonable space but argues the Fréchet case only for nuclear spaces; it should treat general separable Fréchet spaces through dense Banach quotients; affects the proof.
- **Gap** in CN25 at §4.3.2 and Proposition 4.22, pp. 26–27: the source says a reasonable period module needs no separability, while the proof reduces to the separable case of Proposition 4.18; it should assume separability, or a basis, of the graded pieces; affects a stated result.
- **Misprint** in FF18 at Preface, Proposition 2.28(i), printed p. 23: the source says the plain sum of the three dimensions equals the height product term; it should be the alternating sum; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e8dde6d40630181eb688112978700fb83530b5f8", "job": "RT-VectorBundlesAndIsocrystalsPartII~1b", "model": "fable", "worker": "chris-x10"} -->
