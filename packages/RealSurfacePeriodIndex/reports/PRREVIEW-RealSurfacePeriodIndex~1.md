# Review of RealSurfacePeriodIndex (pull request #2462 at 36cfe04)

**Verdict:** needs changes

## R01 (P2) — Tsen–Lang and real closures at an ordering have two owners

**Location** `TauCetiRoadmap/RealSurfacePeriodIndex/README.md` line 24: "The Tsen–Lang theory of §0.7 (C_i fields, the Lang–Nagata theorem for systems of forms, algebraic and transcendental extensions) is owned here; QuadraticFormInvariantsPartII consumes it for its Layer 5." The same claim is at line 2780, and §0.3 defines real closures.

**Claim** At its head, QuadraticFormInvariantsPartII owns the same C_i, Lang–Nagata and Tsen–Lang statements and says that this roadmap takes them from it. Its §6.0 also defines the real closure of an ordered field, which is §0.3's object, and proves the fact used in §0.5 step 5 and §7.5 step 3: the algebraic part of a real closed extension is a real closure. Re-raised: F04 (FIX-PKG-RealSurfacePeriodIndex~4). That report says only the other roadmap can change this, but this README's lines 24 and 2780 and the summary are false at that head, and option (b) below is a repair made here.

**Witness** QuadraticFormInvariantsPartII README (b38ee3c): line 57 owns C_i, Lang–Nagata and Tsen–Lang, and line 118 says this roadmap "takes the Tsen–Lang theorem of 5.6 from this roadmap". Its Suggested.lean:288 declares `IsCi`; §6.0 is at line 1698.

**Repair** Choose one owner by the merge order (ORDER.txt line 247 for this roadmap, line 422 for QuadraticFormInvariantsPartII). Either:

- (a) keep §§0.3 and 0.7 here, and turn QuadraticFormInvariantsPartII §§5.1 and 5.4–5.6, the definition in its §6.0, its lines 57–60, 118 and 2029, and its `IsCi`, `IsCi.of_trdeg` and `IsCi.exists_common_zero` into citations of RealSurfacePeriodIndex §§0.3 and 0.7; or
- (b) move QuadraticFormInvariantsPartII before this roadmap in the merge order, replace §0.7 and the definition in §0.3 by citations of its §§5.1–5.6 and §6.0, and rewrite lines 9, 24 and 2780 and the summary sentence "QuadraticFormInvariantsPartII takes its Tsen–Lang theory".

## R02 (P2) — The pair-transport gap omits invariance of each stratum

**Location** `TauCetiRoadmap/RealSurfacePeriodIndex/README.md` line 105: "for f : M → B a smooth map of manifolds with commuting involutions, proper on a G-invariant closed Whitney-stratified subset whose strata all map submersively onto B, invariant f-compatible control data exist".

**Claim** As worded, the contract is false. Invariant control data force every stratum to be σ-invariant, and a G-invariant subset need not have invariant strata. AlgebraicTopologyPartII §16.2 (line 1675) itself assumes σ_M-invariant strata.

**Witness** Take M = ℝ, σ(x) = −x, B = a point, and A = {−1, 1} with strata {−1} and {1}. Invariance in AlgebraicTopologyPartII §16.1b (line 1573) needs σ(T₁) ⊂ T₁ and π₁σ = σπ₁. These force π₁(−1) = −1, which is not in X₁ = {1}.

**Repair** Replace the sentence (and the same `needs` in the plan's gap entry) with: "What AlgebraicTopologyPartII must provide (gap:at2-stratified-pair-transport): for f : M → B a smooth map of manifolds with commuting involutions σ_M, σ_B, and a closed Whitney-stratified subset A ⊂ M whose strata are each σ_M-invariant and map submersively onto B, with f proper on A, invariant f-compatible control data exist, so that §16.2 applies without assuming them." §6.11 already supplies invariant strata.

## R03 (P3) — The description omits the EnriquesSurfaces dependency

**Location** The pull-request description: "The open pull requests that must merge first are in the merge order below. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim** The README consumes EnriquesSurfaces §§1.1, 1.3 and 1.4 (line 147, §§9.2–9.3, Layer 5 Examples). EnriquesSurfaces is an open new-roadmap pull request by another author. It is not on main, it is absent from the merge-order list, and the generated `merge-order` block says "It depends on no other author's open pull request."

**Witness** `roadmaps list` shows #1286 as a new EnriquesSurfaces roadmap by another author, and ORDER.txt has no EnriquesSurfaces line. The README's line 145 heading is "From TauCetiRoadmap.WeilConjectures and TauCetiRoadmap.EnriquesSurfaces".

**Repair** After the quoted sentences, add: "It also consumes EnriquesSurfaces §§1.1, 1.3 and 1.4, an open pull request by another author (#1286), which must merge first." Then regenerate the `merge-order` block so that it lists #1286.

## R04 (P3) — Downstream consumers names importers that do not exist

**Location** `TauCetiRoadmap/RealSurfacePeriodIndex/README.md` line 2780: "and for the real-function-field applications of Benoist–Wittenberg, which import Layer 0 by section."

**Claim** No roadmap, on main or in an open pull request, imports Layer 0. QuadraticFormInvariantsPartII is the only roadmap that cites this one.

**Witness** `roadmaps grep RealSurfacePeriodIndex` returns only QuadraticFormInvariantsPartII README lines 118 and 2029.

**Repair** Replace the clause with: "and is the natural input for the real-function-field applications of Benoist–Wittenberg (BW20, BW20II)."

## Verified sound

| Target | Instance | Computed: hypotheses or left side | Computed: conclusion or right side | Result |
|---|---|---|---|---|
| §0.2 compactness, limits | F_n = ℚ(√p₁,…,√p_n); Z_n = {√p₁ < 0}; Z_n = {−1 > 0} | \|X_{F_n}\| = 2ⁿ, restriction 2-to-1, \|Z_n\| = 2ⁿ⁻¹ | first limit {ε₁ = −1} ≠ ∅; second family all empty, limit empty | consistent; B19 line 1317–1318 (p. 96) |
| §0.11 Amer–Brumer | ℝ, φ = ⟨1,1⟩, ψ = ⟨1,−1⟩ | common zero needs x² + y² = 0, so none | φ + tψ = ⟨1+t, 1−t⟩; −(1+t)/(1−t) is not a square, so anisotropic | both sides false; EKM line 3877 (p. 74), any field |
| §1.9 extension, injectivity | Σ = ℝ² ⊂ ℝℙ², one point; ℙ² ⊃ 𝔸²; quadric cone | H¹(ℝ²) = 0 → H¹(ℝ² ∖ pt) = 𝔽₂ injective; Pic ℤ → 0 onto | cone: Pic X = 0 → Pic V = ℤ/2, not onto (non-smooth control) | B19 lines 897, 1662, 1671 |
| §2.3 no obstruction | X = ℙ¹ × S, dim 3 | i_*: H³(T_b) ≅ H₁(T_b) → H₁(X) ≅ H⁵(X), iso since 1 ≤ n − 2 | i_*τ = dn·c₁(H) ∪ pr₂*τ_S = 0, so τ = 0 | B19 lines 263–279 |
| §2.4 compatible lift | n = 2, d = 1, β′ = β + cl(L) with p_*cl(L) odd | compatible β: p_*β ≡ 2α̃ ≡ 0 mod 2 | β′: p_*β′ ≡ p_*cl(L) ≢ 0 mod 2 | E2 confirmed, B19 lines 280–283 |
| §2.5 Voisin cone | S = ℙ², A = O(1); quintic with O(1), O(2) | H²K_X = 2(−3 − 1) = −8 | quintic: 2(5 − 5) = 0, excluded; O(2): 2(10 − 20) = −20 | B19 lines 294–311; VOI06 lines 724, 773 (pp. 20–21) |
| §2.9 de Jong, char 0 | ℂ(x,y), (x,y); class of period 4 | ⟨1,−x,−y,xy⟩ anisotropic (Springer twice), so ind = 2 = per | period 4: β = 2α, ind ∣ 2·2 = 4 | B19 line 24 states it for every algebraically closed k; CT05 lines 860–871, char-0 case |
| §3.4 strata | 𝔸², R = {x = 0}, D = {y = 0} | over (0,0): ℙ¹ (r = s = 0); over (0,1): k[z]/z², length 2 | over (1,1): two points; flat degree 2 on S₀ | B19 lines 562–563, 608–610 |
| §5.4 boundary on Ψ | Ψ₀ ⊔ Ψ₁, a₀ = (0,1), a₁ = 0, [e]₁ = (e₀, e₁) | source's diagonal formula gives [ζ]₁ = (0, e₁) | printed conclusion (e₀, e₁); they differ iff e₀ ≠ 0 | E3 confirmed, B19 lines 855–861 |
| §5.6 Picard correction | α̃ = 0; n = 4 trace | η = ζ = β = 0, μ = 0 | ψ[(1,0,0,0)] = (−3,1,1,1), trace 0, so p_*b = 2η | BW20 line 1361: torsion-free over every real closed field |
| §7.4 Theorem 0.3 | K = ℝ(x,y,z \| x²+y²+z² = −1); ℝ(x,y) | −1 = x² + y² + z², nonreal: ind = per | ℝ(x,y): Albert class per 2, ind 4, excluded by ¬IsSemireal | B19 lines 43–44, 1301–1302 |
| §8.6 monodromy | m_i = 1, 2, 4 | 4 ∤ 1 and 4 ∤ 2: term ι*cl_R(Δ_i) added | m_i = 4: no term | B19 lines 1544–1548, 1609–1611 |
| §8.7 θ | n = 2 | alternating cover is p over S*; every m_i = 1 | θ = ϕ ⊗ O(ΣΔ_i), every component counted | B19 lines 1620–1639 |
| §9.2 halves | S(ℝ) = ∅; one half empty | Pic(S)[2] = {0, K_S}; H¹_G has 4 elements | lift with half S(ℝ) has [δ]₀ = 0; the other has [δ]₀ = 1 | B19 lines 1767–1775 |
| §9.8 deg w₁² = 0 | 4·ℝℙ²; 1·ℝℙ²; Lefschetz on S(ℂ) | 4·ℝℙ²: deg w₁² ≡ 4 ≡ 0; 1·ℝℙ²: 1, excluded | χ(S(ℝ)) = 2 + tr(σ* on H²) ≡ 2 + 10 ≡ 0 mod 2 | MVH98 lines 500–540; E23 confirmed |
| `HasZeroTotalSignature` | over ℝ: ⟨1,−1⟩, ⟨1,1⟩, ⟨1,0⟩; over ℂ(x,y) | ⟨1,−1⟩: line x = y, 2·1 = 2, holds; ⟨1,1⟩: no isotropic line | ⟨1,0⟩ holds (degenerate, already isotropic); nonreal: vacuous | README line 336 records the degenerate case |
| `index_eq_orderOf_of_isAlgClosed` | ℂ(x,y), (x,y); k = ℝ | ind 2 = per 2 | ℝ(x,y) Albert class: per 2, ind 4; excluded by `IsAlgClosed k` | holds |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | ℝ(x,y) Albert class | per 2, ind 4 | 4 ∣ 2·2, sharp | holds |
| `index_eq_orderOf_of_forall_isRealClosed` | ℝ(s,t): (−1, 1+s²+t²); Albert class | trivial at every real closure, nonzero; ind 2 = per 2 | Albert class at x, y < 0: (x,−1) ≠ 0 and (y,xy) = 0, so the hypothesis fails | holds |
| `not_anisotropic_of_hasZeroTotalSignature` | ℝ(x,y): 5⟨1⟩; any odd-dimensional form over a real K | 5⟨1⟩ anisotropic, but its signature is 5 | no W with 2·dim W = 5, so the hypothesis fails | holds; non-finitely-generated case via §7.8 |
| `exists_anisotropic_hasZeroTotalSignature` | ℝ(x,y); ℂ(x,y); a real closure of ℝ(x,y) | ⟨1, y₁, −y₂, −y₁y₂⟩ with signature 0; ℂ(x,y): ⟨1,x,y,xy⟩ | real closure: u = 0, so `EssFiniteType` is needed | holds |
| `not_anisotropic_of_not_isSemireal` | x²+y²+z² = −1 field; ℂ(x,y,z) | ⟨1,1,1,1,a⟩ isotropic | ℂ(x,y,z): ⟨1,x⟩⊗⟨1,y⟩⊗⟨1,z⟩ anisotropic; transcendence degree 3 excluded | holds |
| `exists_common_zero_of_not_isSemireal` | ℝ(x); ℂ(x,y) | ℝ(x): 5⟨1⟩ has no zero (real, excluded) | ℂ(x,y): ⟨1,x,y,xy,0⟩ and ⟨0,0,0,0,1⟩ have no common zero; transcendence degree 2 excluded | holds through K(t) and Amer–Brumer |
| §0.7 Tsen–Lang (R01) | ℂ(x,y), ⟨1,x,y,xy⟩ | C₂: every 5-dimensional form is isotropic | ⟨1,x,y,xy⟩ anisotropic, so the bound 4 is attained | mathematics sound; ownership R01 |
| §0.3 real closure (R01) | ℚ(√2) at the ordering with √2 < 0 | real algebraic numbers, √2 ↦ −√2 | same object as QuadraticFormInvariantsPartII §6.0 | R01 |
| gap at2 (R02) | M = ℝ, σ = −id, A = {±1} | A invariant, f proper, strata submersive | invariant control data impossible | R02 |

- Source locators checked against the text: 48 (38 in B19, 3 each in CT05 and MVH98, 2 in VOI06, 1 each in EKM and BW20). Corrections E1–E6, E9, E10, E16, E17, E21, E23 and E24 are confirmed at the source.
- Library declarations opened at the pins: 37 in Mathlib and 36 in Tau Ceti, every one at the file and line stated in the supplier contracts.
- About 75 cross-roadmap citations resolved across 23 roadmaps, on main or at their heads. AlgebraicTopology "Stage 6" is valid through that roadmap's old → new list (Stage 6 = §§6.0–6.5).
- Gate: every check 0, OK. Dependency check: `depcheck: 264 roadmaps, 2584 edges, 0 problem(s)`.
- `lake env lean Suggested.lean`: the 8 `sorry` warnings are the only output. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`, `exact?`) closes none of the 8 theorems. `#check @` on all 9 declarations shows every needed binder kept, at the README's generality.
- Gaps real-artin-comparison and picard-cokernel-torsion-free are precise and not yet provided: MotivesAndAlgebraicCycles §7.8 uses the cokernel fact without stating it. The slugs match plan.json.
- No padding. Theorems 0.3 and 0.10 follow from 0.4 and 0.12, but they are named headline theorems of B19. The docstring names Theorems 0.4 (scheme form), 0.5, 0.6 and 0.13 (del Pezzo form) and Proposition 0.7 as not statable.

Overlap check: read QuadraticFormInvariantsPartII, LogicAndDefinabilityInNumberTheoryPartII, AlgebraicTopologyPartII, QuadraticFormInvariants (main and #1411), MotivesAndAlgebraicCycles, SchemeAndStackFoundations and RealAlgebraicGeometry.

- C_i fields, Tsen–Lang and the real closure at an ordering: two owners, R01.
- Quantifier elimination for real closed fields: K3BlochGroups §5.8 (RealAlgebraicGeometry covers ℝ only).
- Witt ring, Pfister forms and the Clifford invariant: QuadraticFormInvariants.
- cl and cl_R: MotivesAndAlgebraicCycles.
- Double-cover topology: AlgebraicTopologyPartII.
- Br of schemes: SchemeAndStackFoundations.
- Existence of real closures: RealAlgebraicGeometry Layer 1, in its Tau Ceti form.

Source independence: 21 passages compared with 6 sources, none shared beyond forced statements. The longest shared run is 12 words, at B19 line 609–610, a one-line fact. The closest proof plan is §5.2 step 4 against B19 lines 695–704: the same steps, reworded and condensed.

The largest share is B19, with 130 of 257 locators. Contents compared with B19: Layers 2–9 meet B19 §§1, 3, 5, 4, 6, 6, 7, 8. That is not one-to-one and not in B19's order, and the Needs lines force it: §4.1 and §5.1 need §3.2, §6.13 needs §§4.8 and 5.8, §7.2 needs §6.13, and §9.7 needs §8.10. Layers 0 and 1 are the roadmap's own. Independent.

## Not verifiable

- BCR, Example 7.1.4 a), p. 135, and Proposition 7.1.7, p. 136 (§0.2): uncertified, a paywalled Springer book cited by locator. B19 line 1317 supports the compactness step.
- DK96, §1.3 (§9.2): uncertified. I checked only that B19 line 1773 cites it for the two halves.

## Source issues

- **Error** in B19 at §3.1, p. 76: the source says {rv² = sw²} is a finite double cover of S; it should be proper of generic degree 2 with ℙ¹ fibres over R ∩ D, finite only off Sing Δ; affects a stated result.
- **Misprint** in B19 at §3.1, pp. 76–77: the source says the fixed singular points lie over Sing R where v vanishes; it should be where w vanishes; affects nothing.
- **Gap** in B19 at Lemma 1.4, proof, p. 70: the source says p_*β reduces to p_*p*α̃ for any integral lift β of p*α; it should first choose β with β mod n = p*α̃; affects the proof.
- **Misprint** in B19 at Theorem 1.5, proof, p. 71: the source says Voisin's Proposition 9 is applied with n = dl; it should be degree dn; affects nothing.
- **Error** in B19 at Proposition 4.4, proof, p. 84: the source says [ζ]₁ = [e]₁ on Ψ; it should be [α̃]₀ ∪ [e]₁, so the proposition fails for some Ψ ⊋ Θ; affects a stated result.
- **Gap** in B19 at Proposition 4.5, proof, p. 84: the source says β restricted to T_U equals p*α̃ + 2ε + cl(ϕ), adding a mod-2 class to integral ones; it should use an integral lift; affects the proof.
- **Gap** in B19 at Proposition 4.5, proof, p. 85: the source says Proposition 3.3 and Assumption 4.1 (ii) give p_*γ = δ − cl(θ₂); it should first subtract curve classes avoiding Ψ; affects the proof.
- **Misprint** in B19 at Proposition 4.5, proof, p. 85: the source says [p_*ε]₁ = 0 in H¹(S(ℝ)); it should say only that its restriction to Ψ vanishes; affects nothing.
- **Misprint** in B19 at Lemma 7.3, p. 98, and (7.13), p. 103: the source says p*α̃ is the reduction of p*η + ψ(ζ); it should be p*η − ψ(ζ); affects nothing.
- **Gap** in B19 at the proof of Theorem 0.12, p. 95: the source says K is the union of the finite extensions of K₀; it should first add a transcendence basis to K₀; affects the proof.
- **Error** in B19 at the proof of Theorem 0.12, p. 96: the source says z_j not proportional to w² + 1 make y₁, y₂ parameters; it should replace w by (w² − 1)/(2w), as α₁ = α₂ = −(1 + i) fails; affects the proof.
- **Gap** in B19 at the proof of Theorem 0.6, p. 107: the source says one nonempty half with deg(w₁²) ≠ 0 gives index 4; it should note that this case never occurs, as w₁ = cl_R(K_S) is orthogonal to w₁; affects nothing.
- **Misprint** in CT05 at the proof of Théorème 3.14 and Lemme 3.15, pp. 400–402: the source says the component birational to X lies over 0; it should be over 1 for s_t = t^l s₁^l + (1 − t)^l s₀; affects the proof.

## For the human reviewers

- none
