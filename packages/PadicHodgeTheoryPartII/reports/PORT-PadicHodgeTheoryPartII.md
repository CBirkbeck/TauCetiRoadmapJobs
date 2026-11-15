# PORT-PadicHodgeTheoryPartII

- Branch: `roadmap/padic-hodge-theory-part-ii`, created from `6ca082e` of main.
- Head commit: `fdbccfdc` ("PadicHodgeTheoryPartII: roadmap (README, Suggested.lean, metadata)").
- Files: `TauCetiRoadmap/PadicHodgeTheoryPartII/README.md`, `TauCetiRoadmap/PadicHodgeTheoryPartII/Suggested.lean`, `TauCetiRoadmap/PadicHodgeTheoryPartII/metadata.toml` (`topic = "math.NT"`). Nothing outside the folder changed.

## Checks

- Build, `lake build TauCetiRoadmap.PadicHodgeTheoryPartII.Suggested`: `Build completed successfully (18239 jobs).` with **0 warnings**. The file declares nothing, so there is no `sorry` either. With the package's bare `import Mathlib` header the build printed one non-`sorry` warning ("imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`"). I switched to the `module` / `public import Mathlib` header that the recently merged ports on main use (LefschetzPencilsAndVanishingCyclesPartII, AdicSpacesPartV), and the gate accepts it (`imports=0`, `no-import-mathlib=0`).
- Gate: `gate PadicHodgeTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`): no UPWARD, CYCLE or moved line.

  ```text
  depcheck: 239 roadmaps, 2255 edges, 0 problem(s)
  ```

- Citation resolver on the ported README (main at its newest index, 460 open heads): no cross-roadmap citation and no Lean name found nowhere. The package-stage lead `FilteredPhiNModule.IsWeaklyAdmissible` is supplier notation, at FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2, line 4713 of its head.
- `#check @name` audit: `Suggested.lean` has no declaration, so there was nothing to elaborate or compare, and nothing changed.

## Draft pull request body

This roadmap extends PadicHodgeTheory past the group-valued period torsor. It proves that generic filtrations are weakly admissible, and that for Hodge–Newton irreducible data the attached crystalline Galois representations have large monodromy. Precisely: for any connected reductive group G over Q_p (ramified and non-quasisplit groups included, p = 2 included) and a decent b with [b] ∈ B(G,μ), the filtration at a point of the flag variety Fl_μ lying over its generic point, taken over a finite extension of Q̆_p, gives weakly admissible filtered isocrystals. When (b, μ) is Hodge–Newton irreducible, the identity component of the monodromy group of the resulting crystalline representation contains G_der, and its image meets G_der(Q_p) in an open subgroup (Gleason–Lim–Xu, Theorem 5.8 and Proposition 5.9). The route has five layers. Layer 0 builds a decent fibre functor over a finite unramified field, Chen's rank-one coefficient objects and invariant-line criterion, and proves that the full crystalline monodromy group is connected when the residue field is algebraically closed. Layer 1 covers generic filtrations of representations of quasisplit groups and their highest-weight and Galois-average estimates; its threshold formula is corrected for non-normal reflex fields. Layer 2 proves generic weak admissibility and generic derived monodromy. Layer 3 constructs generic points over finite extensions of Q̆_p, proves Zariski density of open subgroups of p-adic points of smooth connected groups and central lifting of derived containment, and gives the open-image period point and its comparison along z-extensions. Layer 4 computes the stabilizers of connected components of compact-image period torsors over Spd K and of their images in an ambient tower. These are the arithmetic inputs of the Gleason–Lim–Xu theorem on connected components of local shtuka towers and affine Deligne–Lusztig varieties. None of the headline theorems can be stated against the pinned Mathlib and Tau Ceti: B(G), filtered G-isocrystals over finite extensions of Q̆_p, crystalline representations, the flag variety over a p-adic reflex field, the B_dR-Grassmannian and diamonds are all absent. So `Suggested.lean` states nothing, and its docstring says, for each headline, which carrier is missing.

## Dependencies that are still pull requests

PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicLocalLanglandsForGL2Qp, VectorBundlesAndIsocrystals, MotivesAndAlgebraicCycles, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, ArithmeticGaloisRepresentations, ShimuraData, AutomorphicBundles, AlgebraicModuliForArithmeticGeometry and DeligneWeightsAndPurity. DeligneWeightsAndPurity is named only in the Scope clause that says how §3.3 differs from its §2.2. All twelve are earlier in the merge order than this roadmap (line 199; HeckeStacksAndLocalShtukas, the last supplier, is line 198), and all twelve are still open at the index of 2026-11-15T21:27:33Z.

On main, cited by section: ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations and DiamondsAndVStacks. FlagVarieties is also on main; it is named only to say that it does not supply Fl_μ.

No citation uses an id that only an open revision defines, and no open pull request drops an id cited here. The overlaps file lists none, and the resolver found every cited section at the heads.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the rule: it has one module docstring and an empty namespace, and the docstring names each headline (README §§2.3, 2.4, 3.2, 3.5, 4.1–4.2) with the carrier it lacks. The changes to the Lean file are:

- the `module` / `public import Mathlib` header (see Checks);
- the docstring title, which now matches the README title;
- one closing paragraph saying that the supporting statements are README targets and are not stated here. These are the Layer 0 jumps, decent fibres and invariant lines, the Layer 1 generic filtrations and estimates, README §3.3 (density) and README §3.4 (central lifting).

I re-checked every library name in the docstring at the pins: `TauCeti.reductiveCommHopfAlgProperty` (`Reductive/Basic.lean`:71), `TauCeti.HopfIdeal.IsParabolic` (`Parabolic/Basic.lean`:248), `TauCeti.Cocharacter.parabolicDefiningHopfIdeal` (`Dynamic/Representability.lean`:98), `CommHopfAlgCat.fppfHomogeneousQuotient` (`Fppf/Quotient/Homogeneous/Basic.lean`:217), `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`ProjectiveOrbit/Quotient.lean`:241) and `TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints` (`Coinvariants.lean`:236). The two quotient declarations carry exactly the hypotheses the docstring states: an algebraically closed field with reduced finite-type G, and a linearly reductive subgroup. `BDeRhamPlus` is at `Mathlib/RingTheory/Perfectoid/BDeRham.lean`:75. Neither library has any Kottwitz, flag-variety, crystalline or B_cris carrier.

Following the package review, README §§3.3 and 3.4 stay supporting statements and are not headlines.

## Supplier replacements and duplication removals

No restatement of a supplier was found, so nothing was deleted. Additions to the supplier contracts:

- **From Mathlib:** `IsFiltration` (`Mathlib/RingTheory/FilteredAlgebra/Basic.lean`:49) is now cited as the library's filtration vocabulary. It uses the increasing convention, and the README says how the decreasing filtrations and jumps of §0.1 correspond to it.
- **ShimuraData contract:** one sentence saying that FlagVarieties, on main, works over algebraically closed fields only, so `parabolicTypeVariety` is the owner of Fl_μ over the p-adic reflex field.

Duplication sweep, by object, over main, the open heads (through `roadmaps grep`) and the board packages:

- Hodge–Newton irreducibility: no match anywhere.
- Generic filtrations: the matches in GeometricSatakeAndFusionPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII and PadicDifferentialEquationsAndRigidCohomology(PartII) are generic-fibre filtrations of other objects.
- Filtration jumps of vectors and the ultrametric rule: no match. Mathlib has only the increasing `IsFiltration`.
- Decent fibre functors and Chen's criterion: no match.
- Connectedness of crystalline monodromy: no match.
- Zariski density of open subgroups: only the Sp(V) case in DeligneWeightsAndPurity §2.2, already recorded in Scope. AdelicAlgebraicGroups (main) has Borel density and closures of Zariski-dense subgroups, which are different statements. ReductiveGroupsPartII has no density statement.
- Central lifting of derived containment: no match.
- Component stabilizers of Galois torsors: no match.
- The GLX component theorem: no roadmap owns it.

Closest roadmaps:

- **AdmissiblePairsAndPadicHodgeStructures** (open, later in the order, line 261). Its §2.5 Mumford–Tate group is for G-admissible pairs over an algebraically closed C, a different object from the crystalline monodromy group of a finite extension of Q̆_p, so there is no shared target. Note for the maintainers: it requests `gap:strict-field-serre-openness` from PadicHodgeTheory, and this roadmap requests `gap:serre-sen-openness` from the same supplier. These are two forms of Serre's openness theorem for Hodge–Tate representations, and PadicHodgeTheory should meet both with one theorem.
- **ReductiveGroupsPartIII**, **BunGAndNewtonStrata** and **HeckeStacksAndLocalShtukas**: each is imported here by section, and none of them restates anything this roadmap owns.

## Fixes from the upstream read

- **Summary.** The first sentence said "a topologically generic filtration of an acceptable, Hodge–Newton irreducible pair … gives a crystalline representation …". "Topologically generic" is not standard, and the sentence dropped two hypotheses. Decency of b is needed: σ-conjugating b by an element of G(Q̆_p) need not preserve genericity, as the Conventions say. And weak admissibility (Theorem 5.8(1)) does not need Hodge–Newton irreducibility. The sentence now states the two results with the hypotheses of §§2.3–2.4 and the existence statement of §3.2. The suppliers listed in the Summary now include DiamondsAndVStacks, which Layer 4 uses.
- **Title.** The title is now in the main form, "Part II — …".
- **Backtick placement.** Ten code spans had swallowed an English suffix, for example "`Q_{p^s}-vector` space" and "`Γ_{Q_{p^s}}-orbit`". They now read "`Q_{p^s}`-vector space" and so on, in §§0.4, 0.5, 0.6, 1.4, 2.1.
- **Scope.** The "consumers, not targets" clause now names the sections the GLX component theorem consumes (§§3.2, 3.5, 4.2).

No statement, hypothesis, Check, locator or section number changed.

## Adversarial mathematics pass

I recomputed every row, independently of the package review; the values are mine. Notation: F = Q̆_p, χ the cyclotomic character.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions: Tate twist | Q_p(1); PadicHodgeTheory §3.3 Check "Q_p(n): Frobenius p^(−n)σ, jump −n" | φ = p⁻¹σ: t_N = −1. Jump −1: t_H = −1. Equal | consistent with the supplier | none |
| Conventions: GLX orientation | G_m, b = p^m, μ = z^h | κ(b) = m and μ^♮ = h, so [b] ∈ B(G,μ) iff m = h. Weak admissibility: t_H = h, t_N = m. HeckeStacks HS2.12 κ(b) = λ^♯ = −μ♯ with λ = μ⁻¹; reading its μ as our μ⁻¹ gives κ(b) = our μ^♮ | agree | none |
| Conventions: decency under G(Q_{p^s})-conjugation | b′ = gbσ(g)⁻¹ | (b′σ)^s = g(bσ)^s g⁻¹, since σ^s(g) = g; this equals (sν_{b′})(p)σ^s | decency preserved | none |
| Conventions: lift of σ | cyclic quartic L/Q_p, e = f = 2 | lifts g and g³ with g² ≠ 1; both send {e_1, e_{g²}} ↦ {e_g, e_{g³}} | only orbit actions are used, as stated | none |
| Conventions: H vs H° | ramified quadratic character over K | closure μ₂ ⊂ G_m, which is disconnected | H ≠ H° for arbitrary ξ, as stated | none |
| Conventions: torsor stabilizer | C ⊂ G(Q_p), coset gC | h·gC = gC iff h ∈ gCg⁻¹ | as stated | none |
| §0.1 jump | Fil^i = K for i ≤ a; two-step plane; v = 0; ultrametric case deg v = a < c = deg w | jump of 1 is a (a < 0 included). e_1 has jump 2 and e_1 + e_2 has jump −1 = min. 0 lies in every Fil^d, so it has no jump. v + w ∈ Fil^{a+1} would force v ∈ Fil^{a+1} | holds; equality when the jumps differ | none |
| §0.2 degree sum | identity map; involution with degrees ±1; 3-cycle with degrees 2, 0, −5 | s·d(v); 0 at both points (not 2); d_3 = −3, d_2 = 2 | holds | none |
| §0.3 tested sets | G_m, b = p^a, weight h; b = 1, jump 1; GL_2, b = diag(p,1), s = 1, Fil^1 = Ke_1 | need k = sa = sh. b = 1: k = 0 but d_s = s, so empty. e_1 ∈ V^{1,1} and e_2 ∈ V^{1,0}, while e_1 + e_2 is not an eigenvector of diag(p,1) | not closed under addition, as stated | none |
| §0.4 ω_s | unit; slope-1/2 block with s = 2; φ = pσ; b = p^m, s = 1 | Unit: dimension 1. Block: φ²(ae_1 + be_2) = p(σ²a e_1 + σ²b e_2), so ω_2 = Q_{p²}e_1 ⊕ Q_{p²}e_2. φ = pσ: the unnormalized fixed space is 0 and the normalized one has dimension 1. b = p^m: {p^mσx = p^m x} = Q_p | holds | none |
| §0.5 rank-one objects | X(1,−1), s = 2, wraparound 1 and wraparound p; coefficient compatibility at e_{s−1} | det φ = ±p^k, so t_N = k = Σd_i = 0. The φ-stable lines are F(e_0 + ce_1) with cσ(c) = 1 (c = ±1 works); they meet Fil^0 = Ke_0 in 0, so t_H = −1 ≤ 0 = t_N. Wraparound p: t_N = 1 ≠ 0 = t_H. φ(a·e_{s−1}) = σ^s(a)p^k e_0 = a·p^k e_0 | holds | none |
| §0.5 weak admissibility of X(d) | maximal destabilizing subobject D′ | D′ is stable under the coefficients, so D′ = ⊕(D′ ∩ Fe_i). φ cycles the Fe_i, so D′ = 0 or D′ = X; X is semistable of slope 0 | holds | none |
| §0.5 Hom description | v with φ^s v = p^k v, b s-decent | componentwise σ^s v_λ = p^{k−sλ}v_λ, so k = sλ and v_λ ∈ V⊗Q_{p^s}. Strictness of a nonzero (injective) map gives deg φ^i v = d_i exactly | holds; admissibility is needed (negative control: T = G_m², μ = (0,1), the projection of e_1 + e_2 has jump 1 ≠ 0) | none |
| §0.6 line criterion | G_m, b = p^m, μ = z^m, m ≠ 0; b = 1, μ = 0 on GL_2; G_m with 1 ⊕ χ | H_cris = G_m acting on Q_p e by a nontrivial character; fixing vectors would give 1. Stabilizing every line of V ⊕ 1 forces scalar 1, so the group is trivial; irreducibles alone give the centre G_m. A mixed power χ^{m_1}⊗χ^{∨m_2} has the single weight m_1 − m_2, so 1 ⊕ χ embeds in none | holds | none |
| §0.7 connectedness | W = O(H/H°) has finite image, hence weight 0. Negative control: unramified quadratic ε over Q_p | t_H = 0 on every subobject and t_N = 0 in total, so all slopes are 0 and W is unit^n over F, hence trivial. ε: φe = −e, jump 0, weakly admissible, image {±1}, closure μ₂. Over F, σ(x) = −x has a unit solution (√u for u a nonsquare unit, p odd; √−3 for p = 2) | needs the algebraically closed residue field, as stated | none |
| §0.7 comparison and derived containment | G_m, b = p^m: (F, p^mσ, jump m) ≅ D_cris(Q_p(−m)); change of trivialization by h | ξ = χ^{−m} with open image, so H = G_m = H_cris. H ↦ hHh⁻¹, and G_der normal is unchanged | holds | none |
| §1.1 generic filtration | GL_2 std and det, μ = (1,0); Res_{E/Q_5}G_m with E = Q_5(5^{1/3}) | std: every line is some Fil^1_x, so Fil^1_gen = 0; the rational flag gives ke_1 ≠ 0. det: Fil^1_gen = det. 3 ∤ 4, so E is not normal, E⊗E = E × E′ with [E′:E] = 2, and the diagonal meets the weight-one factor in 0. deg_gen(v) = min_g deg_μ(ρ(g)v), by v ∈ ρ(g)Fil iff ρ(g)⁻¹v ∈ Fil | holds | none |
| §1.2 threshold formula | the same three; μ = 0 | std: ⟨(0,1),(1,0)⟩ = 0. det: 1. Cubic torus: m_O = min(1,0,0) = 0 = computed jump, while indexing by Gal(E/k) = {1} gives 1. μ = 0: m_O = 0 | corrected form right; source form fails for non-normal E | none |
| §1.3 orbit bound | refined orbits of sizes 1, 2 with pairings 0, 3; cubic torus; GL_2 std | 0 ≤ (0 + 6)/3 = 2 (the unweighted 3/2 is not the orbit average). μ̄ = (1/3)(1,1,1): 0 ≤ 0 ≤ 1/3. 0 = 0. Identity: avg_γ⟨w_0γ⁻¹λ, μ⟩ = (1/\|O\|)Σ_{λ′∈O}⟨w_0λ′, μ⟩ | holds | none |
| §1.4 transport direction | Res_{Q_{p³}/Q_p}G_m, b = 1 | ((1⊗σ)w)_τ = σ(w_{σ⁻¹τ}), so the e_1-part goes to the e_σ-part; the inverse model gives e_{σ²} | direction as stated | none |
| §1.5 full-period bound | G_m; basic GL_2, s = 2; s ↦ ms; cyclic quartic torus | m = m. d_2 ≤ 2·0 < 1 = k, so V^{2,1} is empty. Reindexing Σ_{i<s}σ_0^{−i}μ̄ = sμ^◇ uses only σ_0^sμ̄ = μ̄. μ^◇ = (1/4)Σ_τ e_τ | holds | none |
| §1.6 Newton lowest weight | GL_2, ν = (a,b) with a ≥ b; torus | exponents lie in {sa, sb} and the lowest-weight value b ≤ k/s; for a torus, equality | holds; dominance of ν used | none |
| §1.7 strict positivity | SL_2, c > 0, weight −n; ordinary GL_2 with c = 0; SL_2 with λ = 0, 1 | −cn < 0 contradicts the sandwich. 0 ≤ 0 ≤ 0 holds while ⟨λ, α^∨⟩ = 1, so strictness is needed. dim L(0) = 1, dim L(1) = 2 | holds | none |
| §2.1 descent | b = 1, s = 1; simple block; diag(p,1) | the subobjects are rational lines; 0 and the block; Fe_1 and Fe_2. Slopes have sλ ∈ ℤ because φ^s = (sν_b)(p)σ^s | holds | none |
| §2.2 semicontinuity | telescoping formula; plane with a fixed line L | Σ_{i=A}^{B} i(d_i − d_{i+1}) = A·r + Σ_{i=A+1}^{B} d_i. t_H = dim(L ∩ ℓ_x) is 1 at [L] and 0 elsewhere, so the minimum is at the generic point | holds | none |
| §2.3 generic admissibility (headline) | ordinary GL_2; G_m; basic GL_2 | Fil^1 = Ke_2 gives t_H(Fe_2) = 1 > 0 while the totals are 1 = 1; at a generic flag t_H(Fe_2) = 0 ≤ 0 and t_H(Fe_1) = 0 ≤ 1. G_m: m = h. Basic: the isocrystal is simple, and direct summands of tensor constructions are weakly admissible | holds; no Hodge–Newton irreducibility needed | none |
| §2.4 derived monodromy (headline) | basic GL_2; ordinary GL_2 at a generic flag; torus | μ^◇ − ν = (1/2)α^∨ > 0, so SL_2 ⊆ H°. Ordinary: V^{1,0} = Q_p^×e_2 and V^{1,1} is empty (e_1 has generic jump 0); Fe_2 has t_H = t_N = 0, so ξ is reducible. Torus: 1 ⊆ H° | Hodge–Newton irreducibility needed and stated | none |
| §3.1 generic points | P¹_E; n = 0 | one coordinate in F transcendental over Q_p, hence over E; geometric integrality in dimension 0 gives X = Spec E and K = FE | holds | none |
| §3.2 open-image point (headline) | basic GL_2; norm-one quadratic torus with μ = 0; finite extension K′/K | open in H(Q_p) ⊇ SL_2(Q_p) gives open intersection. B(T) = X_*(T)_Γ = ℤ/2, and κ(b) ≠ 0 = μ^♮, so there is no point. A finite-index closed subgroup of a compact group is open | holds; acceptability needed | none |
| §3.3 density | 1 + pℤ_p in G_m (p = 2 included); SO(2) ⊂ O(2); diagonal compact subgroup of GL_2(ℤ_p) | infinite, so closure G_m. Closure SO(2) ≠ O(2). Closure of dimension 2 < 4 | connectedness and openness needed, as stated | none |
| §3.4 central lifting | GL_2 → PGL_2 with J = SL_2 or a torus; det: GL_2 → G_m | D(SL_2) = SL_2 → PGL_2 with kernel μ₂, 3 = 3. Torus: hypothesis and conclusion both fail. det: f(J°) ⊇ 1 but J° ⊉ SL_2 | central kernel needed | none |
| §3.5 z-extension (headline) | GL_2 → PGL_2, p odd and p = 2 | image of SL_2(Q_p) has index \|Q_p^×/Q_p^{×2}\| = 4, resp. 8: open and proper. f(H̃°) is connected of finite index in a conjugate of H, so it is that conjugate's H° ⊇ G_der | both directions hold | none |
| §4.1 components (headline) | ξ = 1; C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | stabilizers trivial. g·diag(1,−1)·g⁻¹ = [[1,−2],[0,−1]] ∉ C, also for p = 2. The fibre over gC is Spd Ω / ker ξ, which is connected | holds on a non-normal C | none |
| §4.2 stabilizers (headline) | trivial ξ for GL_2 with Y = T_ξ; Y = T_y ⊔ (G(Q_p) × Spd K); torus | {1} is not open in SL_2(Q_p), since [[1,pⁿ],[0,1]] → 1. The extra components g × Spd K have trivial stabilizer. Torus: automatic | open image and transitivity needed and stated | none |
| Gap `serre-sen-openness` | finite image; split torus with open image | finite image is open in its finite closure; an open subgroup of T(Q_p) is open in T(Q_p) | precise; PadicHodgeTheory §4.4 has only the zero-Sen-operator theorem for finite K/Q_p, so this is a real gap | none |
| Gap `quasisplit-highest-weights` | split G; cubic torus | orbits of size 1 (ReductiveGroups 10B); one orbit of size 3, with W_O = E having three geometric lines | precise; 10B is split only, so this is a real gap | none |

## Unresolved

- The two announced supplier gaps stay open. The acceptance is conditional on them: `gap:quasisplit-highest-weights` toward ReductiveGroups Layer 10, and `gap:serre-sen-openness` toward PadicHodgeTheory §4.4. The second should be harmonized with AdmissiblePairsAndPadicHodgeStructures' `gap:strict-field-serre-openness` toward the same supplier.
- LocallyAnalyticDistributionsPartII (open) uses "an open subgroup of SL₂(Q_p) is Zariski dense" (its README lines 721, 741) without a target. README §3.3 here is the general statement, available to it as a citation. That is for its author.
- Ownership against the board package LawrenceVenkateshMethod was not checked. It lives at another board pull request's head and is not in this checkout.
- Main moved on after this branch was cut: the resolver read main at `19ff3de`, and the branch is on `6ca082e`. Every supplier named here is still where it was, and the resolver found every citation.
- No suspicious instructions were found in any text read.


Pull request: #2412 (roadmap/padic-hodge-theory-part-ii at fdbccfd)
