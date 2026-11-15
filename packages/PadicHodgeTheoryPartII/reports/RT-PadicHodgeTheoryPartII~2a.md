<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6901046715 -->
Red team round 2 pass a (claude) of 1c4f533

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §4.1 does not say what T_ξ is, and the Galois torsor it is built from is not cited

   Location: `packages/PadicHodgeTheoryPartII/README.md:482` "ξ: Γ_K → G(Q_p) continuous, and T_ξ → Spd K
   its locally profinite G(Q_p)-torsor"; `README.md:484` *Needs:* "DiamondsAndVStacks §§D0.6, D3.10,
   D5.3, D5.16, D6.5" (the same list at `README.md:19` and `README.md:511`).

   Claim: the object T_ξ and the descent of the geometric Galois orbits gC ("descends to a closed
   subdiamond") are supplied by the cited sections.

   Witness: DiamondsAndVStacks §D3.10 defines torsors and their level spaces but attaches no torsor to
   a homomorphism; the Γ_K-torsor `Spd C → Spd K` is §D6.3 (§D6.7: "the `G̲_K`-torsor
   `Spd C = Spa(C♭, O_{C♭}) → Spd K` of D6.3"), which the README never cites.

   Repair (three edits):

   1. `README.md:482`, replace "and T_ξ → Spd K its locally profinite G(Q_p)-torsor" by "C the
      completion of K̄, and T_ξ → Spd K the G(Q_p)-torsor obtained from the Γ_K-torsor Spd C → Spd K
      (DiamondsAndVStacks §D6.3) by change of group along ξ: T_ξ is the quotient of Spd C × G(Q_p) by
      Γ_K acting through γ·(x, g) = (γx, gξ(γ)⁻¹), with G(Q_p) acting by left multiplication on the
      second factor".
   2. In the *Needs:* line of §4.1 and in the Layer 4 Dependencies, replace "D5.16, D6.5" by "D5.16,
      D6.3, D6.5".
   3. `README.md:19`, replace "(DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.5)" by
      "(DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.3, D6.5)".

   Tested on the README's instances: the geometric fibre of the repaired T_ξ is G(Q_p) with Γ_K acting
   by g ↦ gξ(γ)⁻¹, so its orbits are the cosets gC and the left stabilizer of gC is gCg⁻¹, as the
   Torsors convention (`README.md:37`) and §4.1 state; for C = {1, diag(1,−1)} and g = [[1,1],[0,1]]
   this gives [[1,−2],[0,−1]] (Check 2 of §4.1); for trivial ξ it gives G(Q_p) × Spd K (Check 1).
   Section D6.3 is earlier in the merge order (DiamondsAndVStacks is on main), so the edit adds no
   upward edge.

One new finding, S01 (P3). All ten round-1 findings are repaired at this head and no repair
introduced an error. No statement of the README was refuted on the instances computed below; every
supplier citation, pinned declaration and source locator resolved.

## Round-1 findings at this head

| Round-1 id | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (PadicLocalLanglandsForGL2Qp §0.2 contract overstated) | repaired | `README.md:63` "PadicHodgeTheory §3.4 records what that API contains: strictness of morphisms between weakly admissible objects"; §0.5 *Needs:* now "PadicLocalLanglandsForGL2Qp §0.2 with PadicHodgeTheory §3.4". PadicHodgeTheory §3.4 at its open head lists these imports. |
| 1a/F02 = 1b/F03 (ArithmeticGaloisRepresentations §7.6 hypothesis dropped) | repaired | `README.md:87` "the equality, over an algebraically closed field, of the closure of α(Σ) with α of the closure"; the Q_p form is then derived: I(α(Σ)) = (α*)⁻¹(I(Σ)) = ker(O(G′) → O(Σ̄)). Recomputed on squaring on 𝔾_m, Σ = {±1}: (α*)⁻¹(x²−1) = (y−1), closure of {1}. Correct over any field. |
| 1a/F03 = 1b/F06 (§2.3: E must lie in K) | repaired | `README.md:384` "let E ⊆ K be the compositum of `Q_{p^s}` ⊂ F ⊆ K and the reflex field E_0 ⊆ K". Recomputed: Γ_E ⊆ Γ_{E_0} fixes {μ} and Γ_E ⊆ `Γ_{Q_{p^s}}` preserves B-dominance, so γμ = μ; κ(η_0) ⊗_{E_0} E is a field (geometric integrality), so one point lies over the generic point. Instance D^×, K = F: E = `Q_{p²}` ⊂ K. |
| 1a/F04 ("rank-two" for X(1,−1)) | repaired | `README.md:244` "the rank-one coefficient object X(1, −1) with s = 2 (of dimension 2 over F)"; k = 1 − 1 = 0, φ(e_1) = e_0, d_2(e_0) = 0. |
| 1b/F01 (H = H°) | repaired | `README.md:230` "Connectedness: H = H°. This uses that the residue field of K is algebraically closed." Proof recomputed: W = O(H/H°) has finite image, jumps all 0, t_H = 0 on subobjects, isoclinic parts have λ·dim ≥ 0 summing to 0, slope 0 over F gives unit objects, full faithfulness gives trivial action. Negative control recomputed: p = 2, σ(√−3) = −√−3 in `Q_2(ζ_3)`; p odd, σ(√u) = −√u. |
| 1b/F02 (§1.4 direction Check) | repaired | `README.md:311` "`((1⊗σ)w)_τ = σ(w_{σ⁻¹τ})`, so the e_1-part is carried onto the e_σ-part". Recomputed: (1⊗σ)(x⊗y) ↦ (τ(x)σ(y))_τ = (σ(σ⁻¹τ(x)·y))_τ; support τ′ moves to στ′; `γ·e_τ = e_{γτ}` from (γt)_τ = γ(t_{γ⁻¹τ}). |
| 1b/F04 (Milne 8.20–8.21 cited for the image equality) | repaired | `README.md:47` "Milne states no image equality; it follows by comparing k̄-points, as in §3.4"; 8.20, 8.21(b) at MilneiAG line 5283, 5297 (p. 131), 8.22, 8.23 at MilneiAG line 5319, 5330 (p. 132). |
| 1b/F05 (μ^♮ versus μ♯) | repaired | `README.md:33` "the Hodge invariant written μ♯ in BunGAndNewtonStrata §§1.7 and 1.23 and μ^♮ in GLX26 §2 ¶2"; BunGAndNewtonStrata §1.7 "Put `μ♯=[μ*]`"; GLX26 line 582. |

New text introduced by the repairs (the Monodromy convention, the fourth item and fifth Check of
§0.7, the §7.6 contract, the E paragraph of §2.3, the cubic Check of §1.4, the Milne sentences, "a
G(Q_p)-conjugate of H" in §3.5) was recomputed line by line; no error found.

## The adversarial pass: record

`Suggested.lean`: 0 declarations (one import, the module docstring and an empty namespace
`TauCetiRoadmap.PadicHodgeTheoryPartII`); there is no signature, variable or instance context to
tabulate, and no `#check` comparison to run. README targets: 25 numbered sections and the
Conventions.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: covariant Q_p(1) | 𝔾_m, b = p^m, μ = z^h | t_N = m, t_H = h; line with jump m and φ = p^mσ realizes Q_p(−m) (PadicHodgeTheory §5.5 Check), so Q_p(1): φ = p⁻¹σ, jump −1 | agrees | none |
| Conventions: decency and quasisplit s | L/Q_p a splitting field with inertia degree f, f ∣ s | `L·Q_{p^s}` has residue field `F_{p^s}`, so it is totally ramified and Galois over `Q_{p^s}`; (gbσ(g)⁻¹σ)^s = g(sν_b)(p)g⁻¹σ^s for g ∈ `G(Q_{p^s})` | arrangeable | none |
| Conventions: HN irreducibility | torus; GL_2 basic; GL_2 ordinary | Δ = ∅; c = 1/2 > 0; c = 0 | consistent with GLX26 line 607–611 | none |
| Conventions: Monodromy | ramified quadratic character into 𝔾_m over K/F | image {±1}, closure V(x²−1) = μ_2, two components | true | none |
| 0.1 jump | Fil^i = K (i ≤ a); v = 0; e_1, e_1+e_2 in the three-step example | a; no jump; 2 and −1 = min(2,−1) | sound | none |
| 0.2 degree sum | identity; involution (1,−1); 3-cycle (2,0,−5) | s·d; 0; d_3 = −3, d_2 = 2 | sound | none |
| 0.3 `V^{s,k}` | 𝔾_m (a,h); b = 1 with jump 1; GL_2 diag(p,1) | k = sa = sh; Newton 0, d_s = s; e_1 ∈ `V^{1,1}`, e_2 ∈ `V^{1,0}`, e_1+e_2 not an eigenvector | sound | none |
| 0.4 ω_s | unit; slope-1/2 block, s = 2; φ = pσ; decent b on a ν-weight space of weight λ | `Q_{p^s}`; φ²e_i = pe_i, dim 2; {φ^s x = x} = 0 but ω_s of dim 1; φ^s = `p^{sλ}σ^s` gives (V⊗F)^{σ^s} = `V⊗Q_{p^s}` | sound | none |
| 0.5 rank-one objects | s = 1; s = 2 jumps (1,−1); wraparound p | t_H = t_N = k; lines F(e_0+ce_1), cσ(c) = 1, t_H = −1 ≤ 0; t_N = 1 ≠ 0. Hom description: (ρ(b)σ)^s w = p^k w on V_λ⊗F forces σ^s w_λ = `p^{k−sλ}`w_λ, so w_λ = 0 unless sλ = k and then w_λ ∈ `V_λ⊗Q_{p^s}` | sound | none |
| 0.5 morphisms of tested vectors | 𝔾_m², b = 1, μ = (0,1), v = e_1+e_2 | jump 0 = k, image e_2 has jump 1; pair not admissible (t_H = 1 > 0) | hypothesis needed and present | none |
| 0.6 line criterion | 𝔾_m, b = p^m, μ = z^m; b = 1, μ = 0, GL_2 | H_cris,1 = 𝔾_m (slopes jm distinct); all lines of V ⊕ 1 stabilized forces scalar 1; irreducibles only would give the centre | sound | none |
| 0.7 comparison, containment, H = H° | trivial pair; 𝔾_m; K = Q_p unramified quadratic | H = 1; χ^{−m} with open image in ℤ_p^×, H = 𝔾_m; μ_2 with φ(e) = −e, unit object over F | sound; residue hypothesis needed | none |
| 1.1 generic filtration | GL_2 standard and det; `Res_{E/Q_5}𝔾_m`, E = `Q_5(5^{1/3})` | Fil^1_gen = 0; Fil^1_gen det = det; 3 ∤ 4 so E nonnormal, E⊗E = E × E(ζ_3), diagonal E meets the weight-one factor in 0. Subrepresentation: (V⊗O(G)) ∩ (W⊗O(G)) = (V∩W)⊗O(G) | sound | none |
| 1.2 threshold | cubic torus; GL_2; trivial weight with E/k quadratic | pairings (1,0,0), m_O = 0; m = 0 and 1; one Γ_E-orbit, v_O = v (the Gal-indexed sum gives 2v) | sound | none |
| 1.3 orbit bound | sizes 1,2 with pairings 0,3; cubic torus | 0 ≤ 0 ≤ 2; 0 ≤ 0 ≤ 1/3; (1/∣O∣)Σ_{λ′∈O}⟨w_0λ′,μ⟩ = ⟨w_0λ, μ̄⟩ | sound | none |
| 1.4 Frobenius transport | `Res_{Q_{p²}/Q_p}𝔾_m`; `Res_{Q_{p³}/Q_p}𝔾_m`; split G | swap; e_1 ↦ e_σ (inverse model gives `e_{σ²}`); identity | sound | none |
| 1.5 full-period inequality | 𝔾_m; GL_2 basic, s = 2; s ↦ ms | m = m; d_2 ≤ 0 < 1 = k so `V^{2,1}` = ∅; φ^{s+i}v = g′φ^i v with g′ ∈ `G(Q_{p^s})`, both sides × m | sound | none |
| 1.6 Newton inequality | GL_2 ν = (a,b); torus; a component v^λ | exponents in {sa, sb} ≥ sb; equality; isotypic projection commutes with ρ((sν_b)(p)), so each v^λ is an eigenvector | sound | none |
| 1.7 strict positivity | SL_2, λ = n > 0; GL_2 ordinary c = 0; torus | −cn < 0 contradicts 0 ≤ Σc_αa_α; sandwich 0 ≤ 0 ≤ 0 with ⟨λ,α^∨⟩ = 1; vacuous | sound | none |
| 2.1 descent | b = 1; simple block; diag(p,1) | rational lines; 0 and the block; Fe_1, Fe_2 only | sound | none |
| 2.2 semicontinuity | plane, L fixed; D′_0 = V | t_H = A·r + Σ_{i>A} dim(D′_0 ∩ Fil^i_x) (telescoped from Σ i(f_i − f_{i+1})); 1 at [L], 0 elsewhere; constant 1 | sound | none |
| 2.3 generic admissibility | GL_2 diag(p,1); 𝔾_m; GL_2 basic; comparison point x over K_x ⊇ F·E_0 ⊇ E | Fe_2: t_H = 1 > 0 at Fil^1 = Ke_2, 0 at η; m = h; only the total degree 1 = 1; x lifts to G_E/P_μ | sound | none |
| 2.4 derived monodromy | GL_2 basic; torus; GL_2 ordinary | (1/2)α^∨, `V^{2,1}` = ∅; 1 ⊆ H°; `V^{1,0}` = Q_p^×e_2, Fe_2 weakly admissible, H° ⊉ SL_2 | sound | none |
| 3.1 generic K-point | ℙ^1; torus; n = 0 | transcendental coordinate; K = FE; X = Spec E | sound | none |
| 3.2 open-image point | torus; norm-one torus with κ(b) ≠ 0, μ = 0 | automatic; slope 0 and trivial filtration are weakly admissible but [b] ∉ B(T,0), no admissible point (HeckeStacksAndLocalShtukas §HS2.12 has the same control) | sound | none |
| 3.3 Zariski density | 𝔾_m, 1+pℤ_p; O(2) ⊃ SO(2)(Q_p); diagonal in GL_2(ℤ_p); J = 1; 𝔾_a, ℤ_p | 𝔾_m; SO(2); torus; trivial; 𝔾_a | sound | none |
| 3.4 central lifting | GL_2 → PGL_2 with J = GL_2, SL_2, torus; det | SL_2 ⊆ J°; hypothesis fails; f(J°) ⊇ 1 but J° ⊉ SL_2. ker f ∩ G̃_der ⊆ Z(G̃) ∩ G̃_der finite | sound | none |
| 3.5 z-extension | GL_2 → PGL_2; G × 𝔾_m → G | index [Q_p^× : `Q_p^{×2}`] = 4 or 8; central character survives; f(H̃°) = f(H̃)° (connected, finite index) | sound | none |
| 4.1 components | C = 1; C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | trivial stabilizers; gdg⁻¹ = [[1,−2],[0,−1]] ∉ C | sound | S01 (definition of T_ξ only) |
| 4.2 ambient stabilizers | Y a point; Y = T_y ⊔ (G(Q_p) × Spd K); trivial ξ for GL_2 | G(Q_p); {1} not open in G_der(Q_p) when G_der ≠ 1; conclusion fails without open image | sound | none |

## Dependency check

```
depcheck: 244 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. PadicHodgeTheoryPartII is at position 192 of the merge order,
after HeckeStacksAndLocalShtukas; ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations
and DiamondsAndVStacks are on main.

## Verified sound

- **Declarations read:** 0 of 0. `Suggested.lean` (53 lines) has the single line `import Mathlib`,
  no `set_option`, no sorry'd data, no `lemma`, one module docstring in the required form. Its six
  bullets agree with README §§2.3, 2.4, 3.2, 3.5, 4.1, 4.2 in hypotheses and conclusions. What it
  says the pins have and lack was checked at the pins: `TauCeti.reductiveCommHopfAlgProperty`
  (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`:71);
  `TauCeti.HopfIdeal.IsParabolic` is a predicate (`TauCeti/Algebra/AlgebraicGroup/Parabolic/Basic.lean`);
  `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean`:75); Mathlib's `Isocrystal`
  (`Mathlib/RingTheory/WittVector/Isocrystal.lean`:112) carries no filtration; no σ-conjugacy set,
  Kottwitz invariant, crystalline-representation predicate, flag scheme or diamond occurs in the
  pinned Mathlib or Tau Ceti.
- **Headlines and padding:** the README's headlines (§§2.3, 2.4, 3.2, 3.5, 4.1–4.2) are not statable
  at the pins and the docstring names each with its missing carriers; nothing is stated in their
  place; there is no declaration, so no padding. §§3.3 and 3.4 are auxiliary general lemmas, not
  headlines of this roadmap.
- **Targets read:** 25 of 25, and every line of the Conventions and the supplier contracts.
- **Checks tested:** 85 of 85 (27, 24, 12, 15, 7 by layer); every definition and target has at
  least three; none false, vacuous or a restatement.
- **Pinned declarations:** 21 of 21 found at the cited file and line (5 Mathlib, 16 Tau Ceti), with
  the hypotheses the README states (`[T1Space R]` for the closed embedding, finite type for the
  open integral points, an injective coordinate map and an algebraically closed value field for
  `mapPointsFunctor_derivedMap_app_surjective`, `[IsAlgClosed k]` and `[IsReduced H]` for
  `faithfullyFlat_derivedMap`).
- **Sibling citations checked:** 45 section or layer citations in 16 roadmaps, each at main or at
  its open head: PadicHodgeTheory §§3.3, 3.4, 3.6, 4.4, 5.5;
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1, R07.3.2; PadicLocalLanglandsForGL2Qp
  §0.2; VectorBundlesAndIsocrystals Layer 1 (four headings, stated for every local field E);
  MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; BunGAndNewtonStrata §§1.7, 1.8, 1.9, 1.12, 1.23, 1.43;
  HeckeStacksAndLocalShtukas §§HS2.11, HS2.12, HS2.13, HS2.15, HS2.16 (its λ = μ⁻¹ comparison and
  κ(b) = −μ♯ as the Conventions say); ReductiveGroupsPartII §§RG2.0.2, RG2.0.4, RG2.1.5;
  ArithmeticGaloisRepresentations §§1.1, 7.6; ShimuraData §3.8; AutomorphicBundles §0.4;
  AlgebraicModuliForArithmeticGeometry §1.7; SchemeAndStackFoundations §0.8; DiamondsAndVStacks
  §§D0.6, D3.10, D5.3, D5.16, D6.5; DeligneWeightsAndPurity §2.2; ReductiveGroups Layers 1, 2, 3,
  6, 7, 10 (10B). The named targets `parabolicTypeVariety`, `associatedCoefficient`, `rankLocus`,
  `etale_coordinates`, `transcendenceDegree_infinite`, *smooth-morphism-open-map*,
  *smooth-group-analytic-charts*, *points-topological-group*, `FilteredPhiNModule` and
  `FilteredPhiNModule.IsWeaklyAdmissible` exist in the cited sections. The one lead of the
  citation tool (`FilteredPhiNModule.IsWeaklyAdmissible`) is notation of
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2, not a pinned declaration, as the README
  says.
- **Gaps:** both declared gaps have the same slug and the same `needs` sentence in
  `design/plan.json` and in the README, a named supplier and section, and ask for nothing the
  supplier already states (ReductiveGroups 10B is for split groups; PadicHodgeTheory §4.4 has the
  Sen operator, not openness in the algebraic envelope).
- **Ownership:** searched main and the open heads by object for the generic filtration, the
  crystalline monodromy group of a pair (b, μ), `V^{s,k}`, and Zariski density of open subgroups.
  No other owner; DeligneWeightsAndPurity §2.2 states only Sp(V) over Q_ℓ and is cited. The closest
  open roadmap, AdmissiblePairsAndPadicHodgeStructures, is later in the merge order, imports
  HeckeStacksAndLocalShtukas and PadicHodgeTheory, and states none of this roadmap's targets.
- **Policy:** the pull request changes only `packages/PadicHodgeTheoryPartII/`; no pull-request
  number, process word, `lemma`, `set_option`, machine path or algorithm in the README or the Lean
  file; every target has a locator or is marked as the roadmap's own argument.
- **Locators verified:** 54 (GLX26 33, Chen14 11, Serre79 2, MilneiAG 4, Stacks 4), all at the
  stated place. Samples: GLX26 line 1284 (Definition 5.1), 1287 (Theorem 5.2), 1340, 1428, 1435,
  1501, 1591, 1712, 1727, 1970, 2142; Chen14 line 918–950 (Définition 3.3.1, Lemme 3.3.2,
  Proposition 3.3.3), 1303 (Théorème 5.0.6); Serre79 line 125 (Théorème 1, p. 158); Stacks line
  2128, 3577, 3611, 3743.
- **Wording:** thirteen README passages were set beside the sources (§0.3 against GLX26 line
  1296–1318; §0.4 against Chen14 line 776–800; §0.5 against Chen14 line 990–1081; §0.6 against
  Chen14 line 950–1031; §1.1 proof plan against GLX26 line 1440–1456 and Chen14 line 1131–1150;
  §1.2 against GLX26 line 1501–1585; §1.5 against GLX26 line 1650–1680; §1.7 against GLX26 line
  1697–1710; §2.3 against Chen14 line 1320–1365; §3.1 against GLX26 line 1727–1736; §4.1 against
  GLX26 line 2142–2180; the gap sentence against Serre79 line 125; the Tau Ceti
  contract's description of the derived group against MilneiAG line 5283–5333). No sentence, list or proof plan
  reproduces or translates a source; the longest shared run is a formula or a standard name. No
  table, figure or list is taken over.

Source independence: 13 passages compared with 4 sources, none shared; largest share GLX26, 42 of 68 locators; contents compared with GLX26 (sections 5.1–5.3 and 6.2, 6.7): independent. Layer 0 draws on GLX26 §5.1 and Chen14 §§3.1–3.3, Layer 1 on §5.2 and the second half of the proof in §5.3, Layer 2 on the first half of §5.3 and Chen14 §5, Layer 3 on the end of §5.3, on §6.2 and on two lemmas of the roadmap's own, Layer 4 on §6.7; no layer has the scope of one section, and the order 0, 1 → 2 → 3 → 4 is forced by the *Needs:* lines of §§2.4, 3.2 and 4.2.

## Not verifiable

- Elaboration of `Suggested.lean`: no Lean command is permitted in this pass. The file has no
  declaration; only the import and the namespace would be checked.
- The published version of GLX26 (Inventiones mathematicae): not read. All locators are to arXiv
  v3, which is what the README says it cites.
- Whether the "root-subgroup generation" of ReductiveGroups 10B is generation of the group or of
  highest-weight modules: the section does not say. §1.7 uses it only to see that G_der acts
  trivially on a one-dimensional module, which also follows from G/ker being commutative, so
  nothing depends on the reading.
- The 238 open pull requests of the brief's list were searched by object through the grep tool,
  not read in full. The suppliers' open heads were read through `roadmaps show`.

Note outside the repair scope (not a finding of the README or the Lean file):
`packages/PadicHodgeTheoryPartII/design/plan.json` still carries the `sourceIssues` entry
`PadicHodgeTheoryPartII/E1`, which records GLX26 §5.1 ¶14 as an error. The connectedness item of
§0.7 shows that paragraph is correct, so the entry should not reach the errata register; the same
file keeps the old Milne locator at lines 142 and 1257.

## Source issues

- **Error** in GLX26 at Proposition 5.7, formula (5.18), arXiv v3 p. 36: the source says the threshold is tested on the Γ_E-orbits of τ(λ) for τ in Gal(E/K) at one chosen λ; it should be tested on every Γ_E-orbit inside the Γ_K-orbit, which automorphisms of a nonnormal E do not reach; affects a stated result.
- **Error** in GLX26 at equation (5.29), proof of Theorem 5.8, arXiv v3 p. 38: the source says the isotypic component is the sum over Gal(E/K) of the refined components; it should be the sum over the distinct Γ_E-orbits, each once (trivial weight, E/K quadratic: the sum gives twice the vector); affects the proof.
- **Gap** in GLX26 at Proposition 6.7, crystalline step, arXiv v3 p. 47: the source says openness transfers because the Galois image lies in the derived group of the z-extension; it should compare intersections with the derived groups, since the image has a central part; affects the proof.
- **Misprint** in GLX26 at Lemma 5.10, proof, arXiv v3 p. 40: the source says the étale chart of the flag variety is over affine space over Q_p; it should be affine space over the field of definition of the flag variety; affects nothing.
- **Misprint** in Chen14 at Lemme 3.3.5, p. 744: the source says the underlying module is a sum of lines over the degree-s unramified field; it should be a sum of lines over K_0, on which that field acts through its embeddings; affects nothing.
- **Error** in Chen14 at Proposition 3.3.4(2) and Proposition 3.3.6(2), pp. 743 and 745: the source says every representation is a subrepresentation of one mixed tensor power of a faithful one; it should allow direct sums and subquotients (𝔾_m, b = 1, μ = 0: the formula gives 𝔾_m, not 1); affects a stated result.

## For the human reviewers

- **Scope.** None observed: the headline theorems are GLX26 Theorem 5.8 and Proposition 5.9 (Inventiones 2026 per `packages/PadicHodgeTheoryPartII/README.md:519`) and Chen14 Théorème 5.0.6 (Annales ENS 2014).
- **Licence.** None observed: the five sources are recorded `certified`, `open-repository` in `packages/PadicHodgeTheoryPartII/sources.toml`; `Suggested.lean` has no declaration to compare with a public formalisation.
- **Not tested.** The published text of GLX26 was not read; wording and arrangement were compared with arXiv v3 only (`packages/PadicHodgeTheoryPartII/README.md:519`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1c4f5337d47c4d4cc810b5f4f3bac6ae055fc5dc", "job": "RT-PadicHodgeTheoryPartII~2a", "model": "fable", "worker": "chris-x91"} -->
