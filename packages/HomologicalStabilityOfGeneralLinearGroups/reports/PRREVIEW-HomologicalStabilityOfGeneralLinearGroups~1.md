# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at 9b02adb)

**Verdict:** needs changes

Paths below are `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md` ("README") and `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/Suggested.lean`. Kal80 is van der Kallen, Invent. Math. 60 (1980), read on the GDZ scan, cited by printed page.

## R01 (P1) — 2.2's parity rule for the `d¹` differentials is false without the hypotheses of van der Kallen's Lemma 4.5

**Location.** README lines 327–340 (2.2), stated for any `G`-module `M`: "for `r ≥ 1` the differential `E¹_(r+1,s) → E¹_(r,s)` is zero for `r` odd and the map induced by `Stab_G(σ_r) → Stab_G(σ_(r−1))` for `r` even"; route, line 338: "elements centralising `Stab_G(σ_r)`".

**Claim.** Kal80 Lemma 4.5 (pp. 285–286) proves the parity rule only for trivial coefficients `A` (set up in 4.3) and only for `r, s` with `1 ≤ r ≤ d + ε` such that `H_s(Sq(Stab_G σ_r), A) → H_s(Stab_G σ_r, A)` is onto. In general the differential is the alternating sum of the maps `H_s(Int(m_ir), l(m_ir))` (4.2, p. 285). The elements `m_ir` centralise only `Sq(Stab_G(σ_r))` (4.4, p. 285), not the whole stabiliser.

**Witness.** Take `G = GL₃(𝔽₂)` (`d = 1`, `ε = 0`), `r = s = 1`, `A = ℤ`. `Stab(σ₁) = {1 + aE₁₃ + bE₂₃} ≅ (ℤ/2)²`, and `H₁(Stab e₁) = ℤ/2` through the sign of the lower `GL₂(𝔽₂)` block. The two face maps send `(a,b)` to `b` and to `a`, so `d¹(a,b) = a + b ≠ 0`.

**Repair.** In 2.2, state the differential as `Σ_{i=1}^{r+1} (−1)^{i+1} H_s(Int(m_ir), l(m_ir))`, with `m_ir ∈ G` carrying `σ_(r−1)` to the `i`-th face of `σ_r` (Kal80 4.2, p. 285). State the parity rule only for trivial coefficients `A` and for `r, s` with `1 ≤ r ≤ d + ε` such that `H_s(Sq(Stab_G σ_r), A) → H_s(Stab_G σ_r, A)` is onto (Lemma 4.5, pp. 285–286). In the route, replace "centralising `Stab_G(σ_r)`" by "centralising `Sq(Stab_G(σ_r))`" (4.4). Add the `GL₃(𝔽₂)` computation as a negative Check. Tested on the instance: `Sq(Stab σ₁) = GL₁(𝔽₂) = 1`, so `H₁(1) = 0 → (ℤ/2)²` is not onto and the corrected statement asserts nothing there.

## R02 (P1) — 2.1 claims transitivity one frame length too far for square groups

**Location.** README line 311: "the action is transitive on frames of each length `k + 1 ≤ d + 2`".

**Claim.** Kal80 3.4 (p. 279) gives transitivity on `k`-simplices only for `0 ≤ k ≤ d + ε`, where `ε = 0` for square groups. For `P = Q`, Example 3.5.1 claims only `k ≤ d`.

**Witness.** Take `R = ℝ[x,y,z]/(x²+y²+z²−1)`, Noetherian of dimension 2, so `sdim = 2`, and `n = 3`, `P = Q = ∅`. Then `d = −1`, and 2.1 asserts that `GL₃(R)` acts transitively on unimodular vectors. The vector `(x,y,z)` is unimodular but completes to no basis: its complement is the stably free, non-free tangent module.

**Repair.** Write "transitive on frames of each length `k + 1 ≤ d + ε + 1`, with `ε = 0` when `P = Q` and `ε = 1` otherwise (Kal80 3.4 and Examples 3.5, pp. 279–280)". Rewrite the reason in 2.1's second Check: for the square group `GL₂(ℤ)`, `d = −1` and nothing is claimed. Add the sphere ring as a negative Check. Cite Theorem 2.6(i)–(ii) rather than (i)–(iv), since Remark 2.7.1 (p. 274) says that parts (iii)–(iv) serve only the proof. Tested on the instance: `d + ε + 1 = 0`, so the corrected statement claims nothing.

## R03 (P1) — The routes of 2.5 and 3.2 use inputs that no target and no supplier states

**Location.** README lines 419–421 (2.5): "through the spectral sequence of 2.2 for frames in general position". Lines 508–510 (3.2): "through the spectral sequences of 2.2 with coefficients and the map `τ`".

**Claim.**
- (a) Van der Kallen's proof of Theorem 5.6 (5.9 and 5.12–5.14, pp. 291–293) runs on the relative spectral sequence `E(P, Q; n+1, n)` of Proposition 3.14 (p. 284), whose `E¹` terms are relative homology groups of pairs of stabilisers, and on Lemma 5.13. 2.2 states only the absolute spectral sequence, and no cited supplier states the relative one.
- (b) 2.5's route needs a complex of frames in general position over a local ring with infinite residue field, and its acyclicity. 2.2 covers only the frame complexes of 2.1, and the analogue cited in the route, K3BlochGroups 4.2, is for fields only.

**Witness.** Kal80 5.9 (p. 291) and Lemma 5.13 (p. 293) work in `E(P, Q; n+1, n)` of Proposition 3.14. K3BlochGroups README at #1430 head dcd87e4, line 1169: §4.2 is stated "For a field F".

**Repair.**
- (a) Add a Layer 3 target: the spectral sequence of the pair `G_n^(P,Q) ⊂ G_(n+1)^(P,Q)` with coefficients `(ρ_n, ρ_(n+1))` acting on the frame complexes (Kal80 3.12–3.15, pp. 282–284), with its `E¹` terms and its `d¹` into column 0, together with Lemma 5.13's vanishing statement. List both in 3.2's *Needs:*.
- (b) Add a 2.5 target stating the general-position complex over a local ring with infinite residue field, its acyclicity in the range used, and the spectral sequence of the action, with exact Nesterenko–Suslin locators. Alternatively, route 2.5 through a named supplier section that states these.

## R04 (P2) — SchemeKTheoryOperations §6.7 owns Layer 1, the group hyperhomology and van der Kallen's theorem for `GL`, while this roadmap claims the reverse

**Location.** README lines 64–71, "Owned here and cited by K3BlochGroups and SchemeKTheoryOperations … Those roadmaps cite these targets"; lines 572–574, "SchemeKTheoryOperations §6.7 consumes 2.4 and 2.6". Affected targets: 1.1–1.4, the `GL_n` part of 2.3, 2.4, and the first claim of 2.6. Hyperhomology is cited from K3BlochGroups 4.1 at lines 52–58, 152–155, 341, 421 and 471.

**Claim.** The same objects have two owners. The other owner is earlier in the merge order (SchemeKTheoryOperations is 36th, this roadmap 139th), so this roadmap must cite it.

**Witness.** SchemeKTheoryOperations README at #1229 head 07d5e4d:
- line 11: §6.7 owns van der Kallen's stability with the `GL(R)` comparison, frame acyclicity and hyperhomology, which are "consumed by the later roadmaps HomologicalStabilityOfGeneralLinearGroups and K3BlochGroups";
- line 2564: Theorem 2.6(i)–(ii), for both δ and for row vectors;
- line 2590: Theorem 4.11, with the Noetherian and semilocal forms.

**Repair.**
- **Cite and delete.** Cite SchemeKTheoryOperations §6.7 and delete the restated targets:
  - 1.1–1.4: frames, faces, the augmented complex, and its acyclicity for both δ, transversal frames and row vectors, with the Noetherian and semilocal instances through AlgebraicKTheory 4.2;
  - the `GL_n` part of 2.3, and 2.4;
  - the claim of 2.6 that `H_m(GL_n(R)) → H_m(GL(R))` is onto, and bijective, in van der Kallen's range.
- **Hyperhomology.** Replace K3BlochGroups 4.1 by §6.7 (group hyperhomology and the Shapiro identification) at the lines listed above.
- **Supplier contract.** Add a "From SchemeKTheoryOperations" contract.
- **Suggested.lean.** Remove `UnimodularFrame`, `UnimodularFrame.face`, `frameBoundary`, `frameAugmentation`, both `frameComplex_acyclic_*` theorems, `homology_stabilization_of_ringKrullDim_le` and `homology_stabilization_of_isSemisimpleRing`. Name them in the docstring as §6.7's.
- **Scope and Downstream consumers.** Rewrite lines 64–71. Drop the SchemeKTheoryOperations and K3BlochGroups bullets of Downstream consumers: K3BlochGroups (138th) "takes nothing from it" (its README line 27 at dcd87e4).
- **What stays here.** Keep what §6.7 does not state: `E_n(R)` stability (R06), 2.5, the plus-construction claims of 2.6, Layer 3, and 2.1–2.2 in the generality only this roadmap needs (`XL(R) = E(R)`, twisted and relative coefficients). Say in Scope that §6.7's proof covers the constant-coefficient `GL` case.
- **Dependency list.** The pull request's depends-on list then gains SchemeKTheoryOperations.

The dependency check reads main only, and neither roadmap is on main, so it cannot see this.

## R05 (P2) — `stabilization` restates Tau Ceti's `TauCeti.stabilizeGL`, and the elementary-subgroup names are Tau Ceti's, not AlgebraicKTheory's

**Location.**
- Suggested.lean lines 115–130 (`stabilization`).
- README line 144: "**From Tau Ceti.** Nothing is consumed."
- README lines 47–48, 146–147, 365 and 446 cite `elementary n` (AlgebraicKTheory 1.1) and `elementary_le_commutator` (AlgebraicKTheory 1.3).

**Witness.**
- `TauCeti.stabilizeGL` is in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79` at the pin. A scratch proof of `stabilization R n = TauCeti.stabilizeGL R (Nat.le_succ n)` closes by `ext`, `TauCeti.coe_stabilizeGL_apply` and `simp`.
- AlgebraicKTheory README at #1142 head 0f463f1, line 239: `E_n(R)` is Tau Ceti's `TauCeti.elementarySubgroup n R`. Neither cited name occurs in that roadmap's README or its Suggested.lean.

**Repair.**
- **Suggested.lean.** Delete `stabilization`. Add `public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable` and write `TauCeti.stabilizeGL R (Nat.le_succ n)` in the statements. Tested: the twisted statements elaborate with it, and a scratch `example` proves with `simp` that the inclusion `v ↦ (v; 0)` is equivariant along it.
- **"From Tau Ceti" contract.** List `TauCeti.stabilizeGL`, `TauCeti.coe_stabilizeGL_apply`, `TauCeti.elementarySubgroup`, `TauCeti.map_stabilizeGL_elementarySubgroup_le`, `TauCeti.StableGeneralLinearGroup` and `TauCeti.StableGeneralLinearGroup.of` (in `…/GeneralLinearGroup/Elementary.lean` and `…/GeneralLinearGroup/Stable.lean`).
- **Perfectness of `E_n`.** Cite `TauCeti.commutator_elementarySubgroup_self` (Elementary.lean:101) for "`E_n(R)` is perfect for `n ≥ 3`". `TauCeti.elementarySubgroup_le_commutator` (Elementary.lean:117) says only `E_n ≤ [GL_n, GL_n]`.
- **AlgebraicKTheory 1.1–1.3.** Cite them only for what they add.

## R06 (P2) — The `E_n(R)` stability headline is statable at the pins, but the docstring says it is not

**Location.** Suggested.lean lines 29–30: "the stability of `H_m(E_n(R))` in 2.3 lacks also its `elementary` (AlgebraicKTheory 1.1)". Lines 35–37: 2.6 is "lacking AlgebraicKTheory's stable linear group".

**Witness.** A scratch file elaborates, with only the `sorry` warning, two statements:
- `elementaryHomology_stabilization_of_isSemisimpleRing`, on `TauCeti.elementarySubgroup (Fin n) R` with the map `(Subgroup.inclusion (TauCeti.map_stabilizeGL_elementarySubgroup_le _)).comp ((TauCeti.stabilizeGL R _).subgroupMap _)`;
- the comparison `H_m(GL_n(R)) → H_m(GL(R))`, along `TauCeti.StableGeneralLinearGroup.of R n`.

**Repair.**
- Add the definition `elementaryStabilization R n`, that composite.
- Add the two `E_n` headlines of Kal80 Theorem 4.11 (p. 289), named in README 2.3–2.4:
  - for Noetherian `R` of Krull dimension `≤ d`: onto for `2m + max 1 d ≤ n + 1`, bijective for `2m + max 1 d ≤ n`;
  - for `R ⧸ Ring.jacobson R` semisimple: onto for `2m ≤ n`, bijective for `2m + 1 ≤ n`.
- In the docstring, say that the `GL(R)` comparison is SchemeKTheoryOperations §6.7's (R04), and that only `π_m(BGL_n(R)⁺)` and `K_m(R)` lack carriers, namely the plus construction.

## R07 (P3) — 2.5 is stated more narrowly than its source

**Location.** README lines 414–421 and Suggested.lean lines 162–174: local rings, onto for `m ≤ n` and injective for `m < n`.

**Witness.** GKRW25, line 3333 (arXiv v3, Theorem 9.4), covers connected semi-local rings with all residue fields infinite. Lines 3348–3352: the isomorphism with `K^M_n` factors through `H_n(GL_n(A))`, so `H_n(GL_n) → H_n(GL_n, GL_(n−1))` is onto.

**Repair.**
- State 2.5 for connected semilocal rings with all residue fields infinite. Tested: `[Finite (MaximalSpectrum R)] [ConnectedSpace (PrimeSpectrum R)] [∀ m : MaximalSpectrum R, Infinite (R ⧸ m.asIdeal)]` elaborates.
- Strengthen the conclusion to bijective for `m ≤ n`. Injectivity at `m = n` follows from the surjection above, from GKRW25's proof of Theorem 9.4, through Convention 5's exact sequence.
- Keep local rings and infinite fields as Checks, and update Examples line 462.

## R08 (P3) — GeneralAlgebraicKTheory locator: the plus/Q comparison is §3.14, not §3.12

**Location.** README lines 77, 161, 447 and 472–473: "GeneralAlgebraicKTheory 3.2 and 3.12 (`K_m(R) ≅ π_m(BGL(R)⁺)`)".

**Witness.** GeneralAlgebraicKTheory README at #1212 head 43e9df6:
- line 615: §3.12 is split-exact group completion, `ΩBQA ≃ B(S⁻¹S)`;
- line 649: §3.14 gives `BGL(R)⁺ ≃ K(R)₀` and hence the plus/Q comparison in positive degrees.

**Repair.** At all four places, cite GeneralAlgebraicKTheory 3.2 for `K_m(R)` and 3.14 for `π_m(BGL(R)⁺) ≅ K_m(R)`, `m ≥ 1`.

## R09 (P3) — README shape: API lists, the universe convention, and an unlisted reference

**Location.** The definitions of 1.1, 1.2, 2.4, 3.1 and 3.3 are prose only; Conventions (lines 95–127); lines 616–618 (Quillen's notebooks).

**Witness.**
- None of these definitions lists its API as bullets.
- Suggested.lean lines 13–14 put rings in `Type`, but Conventions says nothing about universes.
- The Clay notebooks are cited but are absent from References.

**Repair.**
- Add API bullets under each definition that remains after R04–R06: `G_n^(P,Q)` and its actions (2.1); coefficient systems, `Σρ`, `τ`, degree and relative groups (3.1); `standardRep` (3.3); `elementaryStabilization`.
- Add the universe choice to Conventions.
- List the notebooks in References with their Clay archive locators, or drop the sentence.

## Verified sound

- **Gate.** The worker's gate at 9b02adb passed every check. My hand rerun gave 0 on every scanner, `outside-folder=0` and `stray-files=0`. Its one failure, `depcheck: NOT IN ORDER`, comes from the hand run reading the board's order file. Against the candidate order the dependency check prints `depcheck: 236 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD and no CYCLE line. R04 lies outside what it can see.
- **Elaboration.** `lake env lean` on Suggested.lean gives exactly the 7 `declaration uses sorry` warnings.
- **Signatures.** I compared the 13 elaborated types with the README. Every instance hypothesis (`IsNoetherianRing`, `IsSemisimpleRing (R ⧸ Ring.jacobson R)`, `IsLocalRing`, `Infinite (IsLocalRing.ResidueField R)`) and every `hφ` is present, and every bound matches its README statement.
- **Padding probe.** I tried each of the 7 theorems with `first | (simp; done) | rfl | infer_instance | trivial`. None closes.
- **`standardRep`.** Its action is left multiplication: `(standardRep R n).ρ g v = g * v` holds by `rfl`.
- **`hφ` is satisfiable.** It holds for the inclusion `v ↦ (v; 0)`, proved equivariant in a scratch file. The alternative `v ↦ (0; v)` fails at `n = 2`: `diag(e₁₂,1)(0,v₁,v₂) = (v₁,v₁,v₂) ≠ (0,v₁+v₂,v₂)`.
- **Library names.**
  - The 28 Mathlib names in the supplier contracts all resolve at 1b1ccf4 under `#check`.
  - `Module.IsUnimodular` (Mathlib/LinearAlgebra/Unimodular.lean:46) is `∃ f, f v = 1`, as 1.1's Check uses it.
  - Tau Ceti declarations opened: Stable.lean lines 79, 87, 122, 141, 155 and 162; Elementary.lean lines 75, 101 and 117.
- **Citations resolved.**
  - AlgebraicKTheory 4.1–4.2 names: its Suggested.lean lines 274–317 at 0f463f1.
  - K3BlochGroups at dcd87e4: 4.1, 4.2, 4.8 (`generalLinear_homology_stable`) and 4.15 (`symmetricGroup_homology_stable`, line 1578).
  - StableHomotopyKTheory at 23a1323: 1.30, 1.32, 3.25–3.27 and 4.14.
  - GeneralAlgebraicKTheory 3.2.
  - MotivicStructuresInModuliOfCurves §3.4 and InverseGaloisAndArithmeticFundamentalGroupsPartII: board packages, mentioned in Scope only; neither is a supplier.
- **Ownership against open pull requests.** I ran `roadmaps grep` for van der Kallen, unimodular frames, Nesterenko and homology stability across main and the open heads. The only second owner is SchemeKTheoryOperations (R04). CyclicHomologyLieHomologyAndQuasiFreeAlgebras (#2037) treats Lie-algebra homology of `𝔤𝔩_n(A)`, a different object. `overlaps.md` lists no pull request changing this roadmap and no dropped id.
- **Seeded sample, all 13 targets, read on Kal80** (printed page = PDF page + 267). The pages listed after each target are the pages I read.
  - 1.1: 2.4 (p. 273).
  - 1.2: 2.3–2.4 (pp. 273–274).
  - 1.3: Theorem 2.6(i) and Remark 2.7.3 (p. 274); 2.9–2.14 and 2.18 (pp. 275–278).
  - 1.4: 2.2, the standard example (p. 273); Cohn66 Theorem (6.1) on p. 22 (line 683) and the `ℚ(√−19)` matrix on p. 23 (line 723).
  - 2.1: 3.2 and 3.4–3.5 (pp. 278–280), giving R02.
  - 2.2: Proposition 3.7 (p. 280) and 4.2–4.5 (pp. 285–286), giving R01.
  - 2.3, 2.4, 2.6: Theorems 4.8 and 4.11 and Corollary 4.12 (pp. 287 and 289).
  - 2.5: GKRW25 Theorem 9.4 (line 3333), which attributes the local case to Nesterenko–Suslin's Theorems 2.7 and 3.25 (line 3331).
  - 3.1: 5.2–5.5 (p. 290), including `γ = 1` and the degree of `⊗ᵏRⁿ`.
  - 3.2: Theorem 5.6 (p. 291) and 5.12 (p. 292).
  - 3.3: Theorem 5.6 with `k = 1`.
  - Also read outside the sample: GKRW24 Theorems A and B (lines 55–60) and Szy20 Theorem 1.1 (line 26), for the non-target after 2.4 and for Research context.

### Adversarial table

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conv. 1, 1.1 frames | ℤ; zero ring; `n = 0` | `[[1,−1],[0,1]]·[[1,1],[0,1]] = I`; `det[[1,0],[0,2]] = 2 ∉ ℤˣ`; zero ring: one frame of every length; `R ≠ 0`, `n = 0`: `B·A = 0 ≠ 1` | holds | — |
| 1.1 Check counts | `𝔽₂²`, `𝔽₂³`, `(ℤ/4)²` | 3; 6 = \|GL₂(𝔽₂)\|; 168; 16 − 4 = 12 | holds | — |
| 1.2 `ε∘∂` | `(e₁, e₂)` | `ε(e₂ − e₁) = 0`; the unsigned sum gives 2 | holds | — |
| 1.2 zero ring | `R = 0` | `Σ_{i<k+2}(−1)ⁱ` = 0 (k even), 1 (k odd); `ε = 1`; all reduced homology 0 | holds | — |
| 1.2 top ranks | `𝔽₂, 𝔽₃, ℤ/4` with `n = 2`; `𝔽₂`, `n = 3` | 6−3+1 = 4; 48−8+1 = 41; 96−12+1 = 85; −(1−7+42−168) = 132 | holds | — |
| 1.4, Noetherian | `𝔽₂`, `d = 0`, `n = 2, 3`; ℤ, `n = 3` | `n = 2`: `H₀ = 0` claimed and true, `H₁` (rank 4) not claimed; `n = 3`: `H₁ = 0` claimed and true; `det[(2,3,0),(0,0,1),(1,1,0)] = 1` | holds | R04 |
| 1.4, semilocal | `ℤ/4`, `n = 2`; `𝔽₂×𝔽₂`, `n = 1` | `H₀ = 0`, graph connected; `(1,1)` unimodular | holds | R04 |
| 1.4 non-target | ring of integers of `ℚ(√−19)` | Cohn's matrix: `det = 21 − 4θ + 4θ² = 1`, using `θ² = θ − 5` | holds | — |
| 2.1 transitivity | sphere ring, `n = 3` | README: length ≤ `d + 2 = 1`; Kal80: `k ≤ d = −1`; `(x,y,z)` not completable | **false** | R02 |
| 2.2 parity of `d¹` | `GL₃(𝔽₂)`, `r = s = 1` | README: 0; computed: `(a,b) ↦ a + b` on `(ℤ/2)²` | **false** | R01 |
| 2.2 Check | `GL₂(𝔽₂)`, `r = 0` | `E¹₁,₁ = ℤ/2 → ℤ/2`; the transvection is an odd permutation of the three nonzero vectors, so the map is onto | holds | — |
| 2.3/2.4, GL | `𝔽₂`, `m = 1`; ℤ, `m = 1`; `m = 0` | `H₁(GL_n(𝔽₂)) = 0, ℤ/2, 0, 0` for `n = 1,…,4`: onto from `n = 2`, bijective from 3; ℤ: `(ℤ/2)², ℤ/2, ℤ/2`; `m = 0`: `id_ℤ` | holds | R04 |
| 2.4 non-target, `m = 2`, `m ≥ 4` | `𝔽₂` | `H₂(A₈) = ℤ/2 → 0`: not injective at `n = 4`; GKRW24 Theorem B: `⌊3·5/2⌋ + 1 = 8 < 9 = 2m + 1` at `m = 4` | holds | — |
| `stabilization` | ℚ, `n = 1`; `n = 0` | `(2) ↦ diag(2,1)`, det 2; empty matrix `↦ (1)`; equal to `TauCeti.stabilizeGL` (proved) | holds | R05 |
| 2.5 | `ℤ_(2)`, `m = n = 1`; `𝔽₂`, `m = 1`, `n = 2`; infinite `F` | composite `GL₁(ℤ_(2)) → S₃` trivial while `H₁(GL₂(ℤ_(2))) ↠ ℤ/2`; `ℤ/2 → 0`; `Fˣ → Fˣ` identity; GKRW: relative groups vanish for `d ≤ n` ⇒ onto for `m ≤ n`, injective for `m < n` | holds | R07 |
| 2.6 | ℤ, `m = 2`; `m = 1` | onto from `max(3, 4) = 4`, injective from 6; `m = 1`: `e + 3 ≥ sdim + 2` | holds | R08 |
| `E_n` form of 4.11 | semilocal, `m = 1`, `n = 2, 3` | `H₁(E₂) → H₁(E₃) = 0` onto; `0 → 0` | holds | R06 |
| 3.1, standard system | `Rⁿ` with the inclusion; `F_n = 0` | `τ(v) = (0, v)`; `Σρ_n = Re₁ ⊕ τ(Rⁿ)`, degree 1; `τ = 0` gives no degree | holds | — |
| 3.2 ranges | exact sequence of Conv. 5 | onto ⇐ `Rel_m = 0` (`n ≥ 2m+sdim+k`); injective ⇐ `Rel_{m+1} = 0` (`n ≥ 2m+sdim+k+2`); for `k = 0`: equal to 2.3 at `sdim = 0`, one weaker for `sdim ≥ 1` | holds | R03 |
| 3.2 Check, `m = 0` | coinvariants of `Rⁿ⁺¹` | `e₁ = (e₁₂ − 1)e₂` ⇒ zero for `n ≥ 1`; `Rel₀⁰(𝔽₂) = 𝔽₂` | holds | — |
| 3.3, twisted | `𝔽₂`, `m = 0, 1`; ℤ, `m = 0` | `𝔽₂ → 0` onto at `n = 1` (claimed), bijective from 3; `dim H₁ = 0,0,1,0,0`: `𝔽₂ → 0` onto at `n = 3`; ℤ: `ℤ/2 → 0` | holds | — |
| 3.3 Examples | field with a scalar `λ ≠ 1` | `(λ − 1)` kills `H`, and `λ − 1` is a unit, so `H = 0` | holds | — |
| Conv. 3 | ℤ, row `(2,5)` | `2 + 5c ∈ {±1}` has no integer solution: ℤ fails `SR₂` | holds | — |

## Not verifiable

- Nesterenko–Suslin 1989, Theorems 2.7 and 3.25: the DOI landing page on mathnet.ru timed out. The numbers and the local-ring hypothesis are confirmed only through GKRW25 line 3331.
- Not opened, being outside the sample: Dwyer 1980, Suslin 1984, Charney 1980, Nakaoka 1960, Maazen 1979, Quillen 1972, Sprehn–Wahl 2020, Schlichting 2017, Randal-Williams–Wahl 2017 Theorem 5.11, Hatcher–Wahl 2010, and the Quillen notebooks.
- The author's own computations for `ℤ/9` in Research context, and the `n = 4, 5` values of `dim H₁(GL_n(𝔽₂); 𝔽₂ⁿ)` in the non-target after 3.3. I checked `n = 1, 2, 3` against known facts.

## Source issues

- **Misprint** in Kal80 at Theorem 4.11, printed p. 289: the source writes the target of the first stabilization as the homology of `GL` with index `m + 1`; it should be `GL` with index `n + 1`; affects nothing.
