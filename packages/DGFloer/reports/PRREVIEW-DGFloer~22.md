# Review of DGFloer (pull request #1798 at 3166898)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at 3166898. That is the head the previous review read; the folder has not changed since. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty, and the gate passes.

Six findings follow, one of them blocking (R01, P2):

- R01: Layer 1 items 2–4 are owned both here and by the author's own open AlgebraicTopology revisions.
- R02: the order with #963 is still unstated (carried over from the previous review).
- R03–R06: four Checks whose stated values or witnesses are wrong.

## R01 (P2) — Layer 1 items 2–4 have a second owner in the open AlgebraicTopology revisions

- **Location.** `TauCetiRoadmap/DGFloer/README.md`:
  - `:1048–1049`: "Own, for every path-connected CW base, the spectral sequence consumed by AlgebraicTopology Stage 5.5".
  - `:153`, `:961`, `:973`, `:1172`, `:1217–1224`, `:1236`: the other ownership statements.
  - `:4327–4339`: Downstream consumers.
- **Claim.** This roadmap owns the following, and says AlgebraicTopology, GeneralizedCohomology and CharacteristicClasses consume them from here:
  - the fibration homotopy sequence and the homological, cohomological and multiplicative Serre spectral sequences;
  - Serre preimage excision;
  - CW approximation of arbitrary spaces and the connected-map comparison;
  - the filtered-complex adapter (item 3);
  - the functorial `K(A, n)` family and Hurewicz modulo a Serre class (item 4).
- **Witness.** Four open AlgebraicTopology revisions, all by the same author, move exactly these objects into AlgebraicTopology. Two of them, #1807 and #1808, are the companions this pull request's description names. Lines are of `TauCetiRoadmap/AlgebraicTopology/README.md` at each head:
  - **#1797** (c62aafd): `:139–149` reads "A citation of DGFloer Layer 1 for one of these ordinary targets resolves here". It maps item 2 to Stages 4.8 and 5.5, item 3 to Stage 5.0, and item 4 to Stages 8.8c and 8.8d.
  - **#1807** (f3a5953): `:118` "Stage 5.5 owns the fibration homotopy long exact sequence"; `:1381` "Own the homological Serre spectral sequence".
  - **#1808** (09909fe): the same claims at `:117` and `:1241`.
  - **#1854** (a7b81af): the same claims at `:118` and `:1335`.
  - On main, AlgebraicTopology `:915` reads "Consume DGFloer Layer 1 item 2's homotopy LES". Each side therefore hands the objects to the other.
- **Repair.** Settle one owner before either side merges.
  - **Recommended: AlgebraicTopology owns.** It is this roadmap's supplier (Layer 1 consumes its Stages 1–8), so a single direction of supply puts the objects there.
    - In 1.2, 1.3 and 1.4, replace each "Own …" paragraph listed above with a citation of AlgebraicTopology Stage 4.8, 5.0, 5.5, 8.8c or 8.8d, as numbered at the revision that will carry them.
    - Keep here what #1797 `:148–149` leaves here: the cubical transport, the mod-2 vanishing theorem and its one-step lemma.
    - Delete those items from "Owned here" and from the AlgebraicTopology, GeneralizedCohomology and CharacteristicClasses rows of Downstream consumers.
    - Add one old → new line per moved id to "Numbering for citing roadmaps".
    - Name that AlgebraicTopology revision in the merge-order paragraph, since its numbering becomes a dependency.
  - **Otherwise: this roadmap keeps them.** Then the four revisions must consume DGFloer Layer 1, as main's AlgebraicTopology does, and the description must say so.
  - **Test.** After the repair, the homological Serre spectral sequence has one owner, and no README states that its counterpart consumes it.

## R02 (P3) — The order with the conflicting open revision #963 is still not stated (previous R01, not repaired)

- **Location.** The pull request description. Its merge-order paragraph ends "#987 (AnalyticStableMaps) → **this pull request** (#1798)" and does not mention #963.
- **Witness.** `roadmaps overlaps DGFloer` (index of 2026-11-09T10:35:51Z) reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`". `roadmaps list` shows `#963 DGFloer @t4v1 62109eb` open.
- **Repair.** Add one sentence, for example: "#963 (DGFloer) also changes this roadmap and conflicts with it; it is rebased on this pull request before it merges." State the reverse if that is the intended order.

## R03 (P3) — The `SH_*(D²ⁿ) = 0` Check puts the slope spectrum at `2πℤ` instead of `πℤ`

- **Location.** `TauCetiRoadmap/DGFloer/README.md:2589–2591` (7.5): "a linear Hamiltonian of slope not in `2πℤ` has only the constant orbit … the index rises by `2n` each time the slope crosses `2πℤ`".
- **Witness.** With 6.2's unit-disc normalization (`:2321`, and `r λ|_{∂W}` on the end, `:2314`), the radial coordinate is `r = |z|²`. Each Hopf circle has `|∫ λ| = π`, so the Reeb periods are `kπ`.
  - Take slope `a = π ∉ 2πℤ`, so `H = π|z|²` on the end.
  - Then `X_H` rotates at angular speed `2π`, and every point of the end lies on a 1-periodic orbit.
- **Repair.** Replace `2πℤ` by `πℤ` (the periods `kπ` of the Reeb orbits on `∂D²ⁿ` for 6.2's `λ`) in both places.
  - Tested: at `a = π` the corrected Check predicts the degenerate slope that the computation exhibits.

## R04 (P3) — 6.2's ball Check uses the source's sign of `ω` on `ℝ²ⁿ`

- **Location.** `TauCetiRoadmap/DGFloer/README.md:2321`: "The unit disc `D²ⁿ` with `λ = ½ Σ (p dq − q dp)` is a Liouville domain with `Z = ½(q ∂_q + p ∂_p)`".
- **Witness.** `d(½(p dq − q dp)) = dp ∧ dq = −dq ∧ dp`.
  - This roadmap's standard form on `ℝ²` is `dq ∧ dp`: 6.0's Checks (`:2251`), and 7.1's clockwise `X_H = ε(p ∂_q − q ∂_p)` (`:2479`).
  - The sign dictionary also says "No second canonical form is introduced" (`:314`).
  - For `ω = dq ∧ dp` this `Z` gives `ι_Z ω = −λ`.
- **Repair.** Use `λ = ½ Σ (q dp − p dq)` with the same `Z`.
  - Tested: `d λ = Σ dq ∧ dp` and `ι_Z(dq ∧ dp) = ½(q dp − p dq) = λ`.

## R05 (P3) — The DG ball Check uses Theorem 3.49 outside its convergence hypotheses

- **Location.** `TauCetiRoadmap/DGFloer/README.md:3783–3784` (8.7): "`SH_*(D²ⁿ; 𝓕) = 0` for every `𝓕` pulled back from a point, since … the spectral sequence of Theorem 3.49 has zero `E²`".
- **Witness.** Theorem 3.49(ii) gives convergence only under (A) `H_*(𝓕)` bounded below, or (B) bounded above (`bdho-cotangent` lines 2962–2967).
  - `𝓕 = ⊕_{k ∈ ℤ} ℤ[k]`, pulled back from a point, meets neither. So `E² = 0` proves nothing for it.
  - The conclusion itself is true for that `𝓕`. The loop algebra acts through the augmentation, so `FC(H; 𝓕) = 𝓕 ⊗ FC(H)`.
- **Repair.** Do one of the following:
  - restrict to `𝓕` with `H_*(𝓕)` bounded below or above, citing (A) or (B), where `SH_*(D²ⁿ; H_q(𝓕)) = 0` uniformly in `q`; or
  - give the tensor identity as the reason.

## R06 (P3) — 1.1's `S¹ ∨ S¹` Check gives a nullhomology witness that cannot exist

- **Location.** `TauCetiRoadmap/DGFloer/README.md:951–952`: "the commutator `aba⁻¹b⁻¹` is nullhomologous (its `1`-cycle bounds the `2`-chain of a square with identified edges) but not nullhomotopic".
- **Witness.** A singular square in `S¹ ∨ S¹` whose boundary is the commutator loop would be a null-homotopy of that loop, and the same Check says none exists.
  - The bounding chain is a sum of concatenation simplices: `σ_{fg} ∼ σ_f + σ_g` and `σ_{f̄} ∼ −σ_f` (`hatcher-at` lines 7250–7255).
- **Repair.** Replace the parenthesis with: "by Hatcher's proof of Theorem 2A.1, `σ_{aba⁻¹b⁻¹} ∼ σ_a + σ_b − σ_a − σ_b = 0`".

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
```

- **Dependency check.** No UPWARD, CYCLE or `moved:` line.
- **Gate.** The worker's gate record has `build=0`.
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives 7 `sorry` warnings, at lines 86, 112, 145, 168, 198, 221 and 247, and nothing else.
- **Signatures.** A scratch copy with `#check @name` for all 7 declarations elaborated cleanly, and every type equals `scratch/signatures.md`. Nothing changed.
  - 5.10 and both A theorems keep `[ConnectedSpace Q]`, both `HomologicalOrientation`s, and `d ≠ 0` (respectively `IsUnit d`).
  - 5.15 and C keep `IsEmpty (HomologicalOrientation …)`.
  - The torus criterion keeps `[LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G]`.
- **Padding probe.** Every `sorry` was replaced by `first | rfl | simp | infer_instance | assumption | trivial | decide | aesop`. All 7 fail (7 errors), so nothing is padding.
- **Library names.** The resolver did not check library names on this host ("no pinned Lake packages"). So all 448 backticked tokens of the README were extracted and every Lean-shaped one was matched against Tau Ceti 2fd255d and the pinned Mathlib.
  - Every `TauCeti.*`, Mathlib and root-namespace name resolves; for example `IsMIntegralCurveOn.apply_eq_of_mvfderiv_apply_eq_zero` is in `TauCeti/Geometry/Manifold/IntegralCurve/Monotone.lean:91`, and `killingForm` is an abbrev at `Mathlib/Algebra/Lie/TraceForm.lean:374`.
  - The only misses were notation and this roadmap's own `Suggested.lean` names.
- **Pinned definitions opened.**
  - `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` (`TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence.lean:167`) matches the source's Definition 1.1 (`bdho-cotangent` lines 102–106), with contractibility in `W = Set.univ`.
  - `IsNondegenerate.hasContractibleAlmostExistence_smul_iff` (`:186`) covers `a = −1`, as 10.5 uses it.
  - `isUniquelyTwoDivisible_homotopyGroup_of_isZero_mod_two` (`…/Hurewicz/TwoDivisible.lean:43`) is the first step only, for `X : Type`, with π below `n + 2` trivial.
  - `TauCeti.degreeRaising` takes `X : BasedTopologicalSpace.{0}` and ring coefficients (`…/DegreeRaising.lean:71`), and `piIteratedLoopSpaceMulEquiv` covers only degrees `m + 1`. This is as 2.3 says.

### Headline theorems

`README.md:17–21` lists:

- the fibration theorem (5.4);
- the DG Floer comparison and Theorem J (8.6);
- Theorem K (9.3);
- Theorems L and M (10.1–10.2);
- Theorems A and C (10.5);
- the torus criterion (11.3).

`Suggested.lean` states mod-2 vanishing, 5.10, A in two forms, 5.15, C and the torus criterion. The docstring names J, K, L, M, the fibration theorem, the Arnold bound, the Serre sequences and the torsion invariant, each with the carrier it lacks.

### Seeded sample, read at the locators

- **1.4.**
  - `bdho-cotangent` line 4204: Theorem 5.12, citing [Ser52, Theorem 1].
  - Lines 4197–4225: the proof of Proposition 5.11, with the `d^m`-class.
  - Lines 4322–4328: the `{G ⊗ ℤ/2 = 0}` class the README replaces.
  - Hatcher SSAT lines 827–861: the class properties.
  - Serre 1953: see Not verifiable.
- **1.5.**
  - `bdho-morse-dg` lines 4090–4093 (Remark 9.2.4, `(Or X, Or N) = Or Y`), 4094–4100 (Remark 9.2.5) and 7870–7880 (Proposition 11.3.2).
  - `hatcher-at` lines 10391–10395 (cap product), 10478–10480 (`[M] ⌢ ψ_i = −a_i`), 10777–10779 (cup–cap), 19035–19046 (Corollary 4D.9) and 19264–19267 (Exercise 8).
- **2.3.** Every Tau Ceti homeomorphism named exists at the pin (files under `TauCeti/Topology/MappingSpace/`).
- **3.1.** `bdho-morse-dg` lines 2867–2890: §6.4 settles basepoint change only under (6.16), as the README says.
- **5.3.** `bdho-morse-dg` lines 7091–7094: Proposition 10.6.1, `φ_* φ_! = d · Id` for closed oriented `X`, `Y`. §5.3 is the boundary version cited at 3438–3439.
- **5.6.**
  - `bdho-morse-dg` lines 8753, 8777, 8848, 8852 and 8864: Propositions 13.2.2, 13.2.3, Definition 13.3.1, Propositions 13.3.2–13.3.3.
  - `abouzaid-viterbo` lines 2902 (Proposition 3.2.4), 2946 (Lemma 3.2.6), 2949 (Exercise 3.2.7, Kragh) and 2952–2954 (Definition 3.2.8, `0 < δ_i^r ≤ δ_j^{r+1} < 2`).
- **6.1.** The pinned flows and periodic solutions; the Checks are recomputed in the table.
- **6.4.** Only the Hofer–Zehnder locator, which is uncertified (see Not verifiable); the Checks are recomputed in the table.
- **6.5.** `bdho-cotangent` lines 3863–3867 (Definition 5.3), 4340–4346 (Definition 6.1), 4354–4359 (monotonicity and `c°_HZ(V, Z) ≤ c°_HZ(V)`) and 4366–4368 (Proposition 6.3).
- **7.3.** `bdho-cotangent` lines 1464–1465 (Lemma 3.1, sign `(−1)^{dim V₂ · ind D₁}`) and 1705–1715 (Proposition 3.3).
- **8.7.** `bdho-cotangent` lines 2924–2935 (Propositions 3.44–3.46) and 2956–2967 (Theorem 3.49; see R05).
- **9.2.**
  - `bdho-cotangent` lines 671–681.
  - `abouzaid-viterbo` lines 3595–3603 (Theorem 4.1.1, Remark 4.1.2), 4610–4614 (Theorem 5.1.1) and 6464–6468 (Corollary 6.1.2).
  - `abbondandolo-schwarz` lines 1771–1789 (Theorem 3.1).
- **10.3.** `bdho-cotangent` lines 4107–4117, 4118–4137, 4299–4302 and 256–260; `hatcher-at` lines 19073–19074 and 19262–19263.
- **10.4.** `bdho-cotangent` lines 4154–4161 and 4231–4242.
- **10.5.** `bdho-cotangent` lines 214–222 (A), 249–255 (C), 4140–4150 (5.10), 4260–4265, 4293–4298 (5.15) and 4330.
- **Further locators.** Theorems L and M (735–739, 753–757, 3843–3849, 4382–4385) and Propositions 6.6–6.7 (4394–4396, 4429–4432).

All of these support the statements as the README writes them. No locator is flagged unverified in the README.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Mod-2 vanishing (Lean, 1.4) | point; `M(ℤ/3,2)`; `S³`; `ℝP^∞` | `π₂ = ℤ/3`: `a ↦ 2a` bijective (`2·2 ≡ 1`); `H₃(S³;𝔽₂) = 𝔽₂` excludes `S³` (`π₃ = ℤ`, doubling not onto); `H₁(ℝP^∞;𝔽₂) ≠ 0` excludes it | holds |
| 1.4 one-step lemma | `Y = S²`, `n = 3` | `0 = π₂E → π₂S² = ℤ → π₁K(π₃S²,2) = 0` not exact | negative control holds |
| 1.4 Serre-class Checks | `ℤ/4`; `ℤ ⊂ ℚ` | `ℤ/4` not killed by `2`; `ℚ⊗ℤ/2 = 0`, `ℤ⊗ℤ/2 = ℤ/2` | hold |
| 1.5 sign `(−1)^{nk}` | `T²`, `N = S¹×{y₀}` | cross–cap sign `(−1)^{k·n} = −1`; the simplex `[v₀₀,v₀₁,v₁₁]` alone has `Δy = 1`, so `[T²]⌢β = −a`, as in Hatcher line 10478 | holds |
| 1.5 Checks | point in `Sⁿ`; two points in `S¹` | degree `±1`; degrees `2` and `0` against `i_*[N] = 2[pt]` and `0` | hold |
| 1.1 `S¹∨S¹` (R06) | singular square, boundary `aba⁻¹b⁻¹` | would be a null-homotopy; the chain witness is Hatcher 7250–7255 | witness wrong |
| 1.2 Serre Checks | double cover, Hopf | `H₀(S¹;ℤ²_swap) = ℤ`, `H₁ = ℤ`; trivial action gives `ℤ²,ℤ²`; `d²: E²_{2,0} ≅ E²_{0,1}` | hold |
| 1.3 regrading | `(p,q) ↦ (1−2p−q, p−1)` | `d^r` target `(p−r, q+r−1) ↦ (a+r+1, b−r)`; decreasing `(2p+q+1, −p−1)` likewise | holds |
| 2.3 Checks | `Map_*(S²,S²)`, `Ω²Tⁿ`, `Ω²S³`, `Map_*(S²,S¹)` | `π₀ = ℤ`; `π_j(Ω²Tⁿ) = 0` and one component; `π₁(Ω²S³) = ℤ` gives `H₁ = ℤ`; `π_j(Ω²S¹) = 0` for `j ≥ 0` | hold |
| 3.1 Check | degree-2 pullback on `S¹` | `ℤ[t,t⁻¹]` over `ℤ[t²]` has basis `1, t` | holds |
| 4.1 Check | `B = S²` | `de₂ = a e₀`; `H(𝓕 ⊗ P_B) = A` in degree `0` | holds |
| 5.3 | `z ↦ z²`; collapse `T² → S²` | `f_*f_![S¹] = 2[S¹]`, `f_![pt] = 2` points; `f_!f_* = 0` on `H₁(T²) = ℤ²` | holds |
| 5.6 | `S¹`, `r = 1`; `Q = pt` | `𝓛¹S¹` = constants; every `𝓛ʳ(pt)` is a point | holds |
| 6.0 | `(ℝ², dq∧dp)`; `V = c₀` | `X_q = −∂_p`, `X_p = ∂_q`, `X_{qp} = q∂_q − p∂_p`, `{q,p} = 1`; `ω((0,−a),(b,0)) = a(b)`; `H_t = tq` gives `p − (t²−s²)/2` | hold |
| 6.1 | `T*ℝ`, `H = p²/2`; rotation | `ι_{p∂_q}(dq∧dp) = p dp`; `ν`-transport `−p∂_q`; eigenvalues `e^{±i} ≠ 1` | hold |
| 6.2 (R04) | `D²ⁿ` | `d(½(p dq − q dp)) = −dq∧dp`; `ι_Z(dq∧dp) = −λ` | sign inconsistent |
| 6.3 | `σ = f dq`; `σ = x dy` | `−d((p−f)dq) = ω_can`; `π^*dσ = dx∧dy` | holds |
| 6.4 | `S*Q`; `S^{2n−1}` | `p∂_p` flow scales the radius by `eᵗ`; Hopf circles | hold |
| 6.5 | annulus in `D(2)` | radial `H` in `A`: orbits wind once, so the capacity is `∞`; `c_HZ(D) = 4π` | holds |
| 7.1 CZ | `ε(q²+p²)/2` | `JS`, `S = −εI`, `CZ = −sign(S)/2 = +1 = n − ind` | holds |
| 7.3 | height on `S¹` | opposite signs give `ℤ, ℤ`; equal signs give `ℤ/2, 0` | holds |
| 7.5 (R03) | `H = π|z|²` | Reeb period `π`; slope `π ∉ 2πℤ` and all of the end is 1-periodic | Check false |
| 7.C.0–7.C.2 | `tanh` model; `S²×S²` with areas `(1,2)`; `S = diag(1,−1)` | kernel `sech`, cokernel `0`, index `1`; `Γ ≅ ℤ²`, `N_C = 2`; `C_J = [[0,−2],[−2,0]]`, `LJz = (−4,−4)` | hold |
| 7.T | `(S²)⁴` with areas `1,3,1,1` | `c₁ = 2`, `ω = −1` | holds |
| 8.7 (R05) | `𝓕 = ⊕_k ℤ[k]` | `E² = 0`; (A) and (B) both fail | reason incomplete |
| 9.1 | `ℝP²` | `η₀ = σ` on `w = −1`; rotation loop gives `+1`; `ev₀^*(o⁻¹)` alone gives `−1` | holds |
| 9.2 | `Q = S¹`, `pt` | `⊕_{k∈ℤ} ℤ` in degrees `0, 1`; `ℤ` | holds |
| 10.1 / 10.2 | `D²ⁿ`; `D*T^r` | `i_{W*}[W,∂W] = 0`, `j_{U!}[W,∂W] = [U,∂U]`; `𝓛₀T^r ≃ T^r`, so `i_{Q*}` is an isomorphism | hold |
| 10.3 | graph of `λα` on `S³` | `∂U ≅ S³×S²`; `ker π_{U!} = 0`; `ker i_{Q*} ⊇ ℤ` | holds |
| 10.4 | `S²`, `S³`, `d = 2`, `ℤ/4` | `π₀Ω²S² = ℤ`; `H₁(Ω²S³) = ℤ` not 2-torsion; `ℤ/4` is `2²`-torsion | holds |
| 5.10 (Lean) | `S³`, `d = 2`; `T³`; `π₃ = ℤ/3` or `ℤ/2` | `2a ≠ 0`; all disjuncts false on `T³`; `a² = a⁻¹ ≠ 1`; `a² = 1` | holds |
| A (Lean) | `S²` with `d = ±1` and with `d = 3`; `T²⊔T²` | not aspherical; `π₂ = ℤ` not torsion; `T²⊔T²` excluded by `ConnectedSpace` | holds |
| 5.15 / C (Lean) | `ℝP²`, `ℝP⁴`, `K`, `S = ℝP²⊔ℝP²` | doubling on `π₂ = ℤ` and `π₄ = ℤ` not onto; `π_{≥2}(K) = 0`; `(a,b) ↦ a+b ≠ 0` | holds |
| Torus criterion (Lean) | `T^r`, `SO(3)`, trivial group, `(S¹)^ℕ` | aspherical tori; `π₃ = ℤ`; `r = 0`; `(S¹)^ℕ` aspherical, excluded by `LieGroup` | holds |
| 11.1 / 11.2 | `U(n)`, `𝔰𝔲(2)`, `SU(3)` | `B(iI,iI) = −2n²+2n² = 0`; `−2`; `6·tr(¼diag(−1,−1,0)) = −3` | hold |

### Ownership, citations and overlaps

- **Suppliers on main.** These sections exist on main:
  - LieGroups 4, 5, 5A and 6 and CompactGroups Layer 0 (under `RepresentationTheory/`);
  - HamiltonianReduction R1a.2 (`SymplecticGeometry/HamiltonianReduction/README.md:97`);
  - UniversalCovers (`Completed/`);
  - AlgebraicTopology Stage 8, items 1–12 (`:1602`).
- **AnalyticStableMaps (#987).** At its head it has §§3.2–3.4, 3.7 and 11.1. Its bounds `#ghost ≤ n − 2 + 2a` and `#edges ≤ 3a − 3 + n` at `g = 0` match the README's `k − 2 + 2a` and `k − 3 + 3a`.
- **DGFloerPartII (#1799, 0cb1f18).** It cites DGFloer Layers 0–2, 4, 5, 6, 10 and 11. Every id resolves, including "Layer 4 item 5" through the README's numbering note.
- **Name collisions.** No other readable `Suggested.lean` declares in `TauCetiRoadmap.DGFloer`, apart from main and #963.
- **Open revisions.** The overlap report lists no dropped or revision-only id. The two conflicts found are R01 and R02.

## Not verifiable

- J.-P. Serre, *Groupes d'homotopie et classes de groupes abéliens* (1953), Theorem 1, cited by 1.4. It is paywalled and not in the cache; the class axioms were checked against Hatcher SSAT instead.
- Hofer–Zehnder, Chapter 4, and Struwe 1990, cited by 6.4 and 6.5. Both are settled as uncertified and cited by locator.
- Palais 1960 (1.6) and Bröcker–tom Dieck, Chapter V (11.1): settled as uncertified.
- Weibel, Theorems 5.5.1 and 5.5.10 (1.3): no legal copy in the cache; 1.3 is not sampled.

## Source issues

- **Misprint** in bdho-cotangent at Proposition 5.11, proof, p. 96 (line 4220): the source says the differential leaving `E^r_{ℓ,0}` lands in bidegree `(ℓ − r, ℓ + r − 1)`; it should be `(ℓ − r, r − 1)` (cf. Hatcher SSAT line 876); affects nothing.
- **Misprint** in bdho-cotangent at Proposition 5.11, proof, p. 96 (line 4215): the source says `E²_{p,q}` is `H_p(Ω₀Q;ℤ) ⊗ H_q(Ω²Q;ℤ)`; it should also have the `Tor(H_{p−1}, H_q)` summand of universal coefficients; affects nothing.
- **Gap** in bdho-cotangent at Theorem 5.12, p. 96 (lines 4197–4206): the source says mod-C Hurewicz holds for every class closed under three-term exactness; it should also require closure under `⊗`, `Tor` and the homology of `K(A, 1)`; affects a stated result.
- **Error** in bdho-cotangent at Theorem 5.15, proof, p. 99 (lines 4322–4324): the source says `{G : G ⊗ ℤ/2 = 0}` is a Serre class; it should not, since `ℚ` lies in it while its subgroup `ℤ` does not; affects the proof.
