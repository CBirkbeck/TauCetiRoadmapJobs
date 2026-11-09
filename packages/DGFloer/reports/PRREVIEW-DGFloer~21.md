# Review of DGFloer (pull request #1798 at 3166898)

**Verdict:** needs changes

This is an incremental re-review of the 150 lines that changed in `TauCetiRoadmap/DGFloer/` since a64ca16, the head the previous review read. All of them are in `README.md`. `Suggested.lean` is unchanged, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty. The gate passes on this head.

Four of the five previous findings are repaired, and the repairs introduce no new defect. One finding remains, a P3 that does not block: the order with the conflicting open revision #963 is still not stated.

## R01 (P3) — The conflicting open revision #963 still has no stated order (previous R05, not repaired)

- **Location.** The pull request description. Its merge-order paragraph lists the supplier chain up to "#987 (AnalyticStableMaps) → **this pull request** (#1798)" and does not mention #963.
- **Claim.** #963 (`@t4v1`, head 62109eb) changes this roadmap's `README.md` and `Suggested.lean`, and its head conflicts with this one. Neither pull request says which is rebased on the other. Whichever merges second breaks the other.
- **Witness.**
  - `roadmaps overlaps DGFloer` reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`".
  - `roadmaps list` shows `#963  DGFloer  @t4v1  62109eb` open.
  - Neither `scratch/pull-request.md` nor #963's README mentions the other pull request.
- **Repair.** Add one sentence to the description's merge-order paragraph. For example: "#963 (DGFloer, `t4v1`) also changes this roadmap and conflicts with it; it is rebased on this pull request before it merges." If the intended order is the reverse, state that instead.
  - Tested against the witness: with that sentence, the one conflicting head the overlap report lists has a stated order.

## Previous findings

- R01 — repaired: `README.md:2537–2539` now reads "it maps `FC^{<b}(H₋)` into `FC^{<b+c}(H₊)` for every `b`, with `c = 0` when `∂_s H_s ≥ 0` everywhere, with `c = ∫ max_{X × S¹}(−∂_s H_s) ds` for an arbitrary homotopy"; the `ε`-bound is a property of the chosen homotopy (`:2543–2544`).
- R02 — repaired: From Tau Ceti (`:447–455`) names `ContMDiff.continuous_diffeomorphWeakWhitney`, `Diffeomorph.ofSmoothFamily` and `TauCeti.globalFlowDiffeotopy`. 1.6's *Needs:* (`:1466–1468`) cites them. GeometricTopology is now consumed for Layer 1 only (`:183`, `:793–794`, `:1494`).
- R03 — repaired: 4.1 (`:1784`) reads "the complex has homology `A[t, t⁻¹]·e₀` in degree `0` and `H₀(ΩS¹)·e₁ = A[t, t⁻¹]·e₁` in degree `1`". 7.C.2c (`:2893–2895`) uses `A_ε = [[I, εB], [0, I]]` and notes that the unscaled `A` gives the non-tame member `ε = 1`.
- R04 — repaired: `:1086–1088` reads "Hatcher's Theorem 1.14 states it when `π₁(B)` acts trivially on `H^*(F; M)` … the local-coefficient form is this item's". `hatcher-ssat` is recorded in `packages/DGFloer/sources.toml:396–409` with `cited_for = ["1.2"]`.
- R05 — not repaired: the description still states no order with #963, and the overlap report still lists "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`". Raised again as R01 above.

## Verified sound

### Gate, dependency check, elaboration

Both the gate and the dependency check were rerun on 3166898:

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

- The dependency check prints no UPWARD, CYCLE or `moved:` line. The worker's gate record also has `build=0`.
- `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives 7 `sorry` warnings, at lines 86, 112, 145, 168, 198, 221 and 247, and nothing else.
- **Signatures.** A scratch copy with `#check @name` for all 7 declarations elaborated without error. Each type is identical to `scratch/signatures.md`. No section binder is lost. 5.10 and both A theorems keep `[ConnectedSpace Q]`, both `HomologicalOrientation`s and `d ≠ 0` (resp. `IsUnit d`). The torus criterion keeps `[LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G]`. Nothing changed.
- **Padding probe.** Every `sorry` was replaced by `first | rfl | simp | infer_instance | assumption` in a scratch copy, and all 7 fail. Nothing is padding.
- **Headline theorems** (`README.md:17–21`) are unchanged: the fibration theorem (5.4), the DG Floer comparison and Theorem J (8.6), Theorem K (9.3), Theorems L and M (10.1–10.2), Theorems A and C (10.5) and the torus criterion (11.3).
  - Stated in `Suggested.lean`: mod-2 vanishing, 5.10, A (two forms), 5.15, C and the torus criterion.
  - Named in the docstring with the carrier each lacks: J, K, L, M and the fibration theorem.

### The repairs, read against their sources and the pin

- **R01, 7.4 and 8.4.** Read against `bdho-cotangent` lines 2125–2194.
  - The source's Proposition 3.22 (2131–2138) has `Ψ : FC(H₊) → FC(H₋)` and `E = ∫₀¹ max_{x,ϑ} ∂_ϑ K` for `H_s = K_{β(s)}`, with `K` running from `H₋` to `H₊`. Its proof is at 2141–2167.
  - Under `s ↦ −s`, this item's path is `K'_ϑ = K_{1−ϑ}`, and `β'(s') = 1 − β(−s')` is still nondecreasing. Then `max ∂_ϑ K = max(−∂_ϑ K')`, which gives 7.4's `c = ∫₀¹ max_{x,ϑ}(−∂_ϑ K_ϑ^t) dt`.
  - The source's Corollary 3.24 (`∂_s H ≤ 0`, 2180–2184) becomes `∂_s H ≥ 0`. Its Corollary 3.25 ("there exists a homotopy", 2185–2194) becomes `∫ max(H₋ − H₊) + ε`, for a chosen homotopy.
  - The energy identity in 7.4 follows from the source's `0 ≤ E = 𝒜_{H₊}(x₊) − 𝒜_{H₋}(y₋) + ∫∫ ∂_s H_s` after exchanging the ends. Both use the action `∫ γ̄^*ω − ∫ H dt` of 7.1 (`:2449–2450`).
  - The subcomplex claim for `FC^{<b}` matches 7.1's "the differential that decreases `𝒜_H` along `s`" (`:2461`).
  - Values are in the table below.
  - Every other use of the estimate was grepped ("Hofer", "Cor 3.24/3.25", "Prop 3.22", "7.4's"). The only other reader is 8.6's `T²` Check (`:3770`), and it cites 7.4's unchanged first Check. Layer 10 (`:3936`) consumes the source's Proposition 5.8 through Layer 8 item 7 and restates no sign.
- **R02, 1.6 and the contracts.** Opened at Tau Ceti 2fd255d:
  - `TauCeti/Geometry/Diffeomorphism/Topology.lean`: `:125` `ContMDiff.continuous_diffeomorphWeakWhitney`, which needs `[CompactSpace M]` (`:80`) and `[IsManifold I' n P]` (`:120`) and only joint `C^n` regularity of `z ↦ f z.1 z.2`; and `:133` `Diffeomorph.ofSmoothFamily`. The docstring at `:122–124` says the converse fails. Both match the contract's "the converse is not claimed".
  - `TauCeti/Geometry/Diffeomorphism/Diffeotopy/Flow.lean:55` `TauCeti.globalFlowDiffeotopy`, with hypotheses `[FiniteDimensional ℝ E] [T2Space M] [BoundarylessManifold I M]`, `hn : 1 ≤ n`, `IsCompleteVectorField v` (`:47–58`). Its motion is the maximal integral curve at time `a·t` (`:79–85`), and its inverse runs time `−(a·t)` (`:87–95`). The contract's wording matches.
  - `TauCeti/Geometry/Diffeomorphism/Group.lean:214` `TauCeti.Diff` (`n : ℕ∞ω`) accepts the `ℕ∞`-indexed diffeotopy at `n = ∞`.
  - `Diffeotopy/Homogeneity.lean:253` `TauCeti.exists_diffeotopy_final_apply_eq` needs `[PreconnectedSpace M]`, as 1.6 uses it.
  - The construction itself checks out. `U × M` is Hausdorff, boundaryless and finite-dimensional. The field `(0, v_z)` is complete because `z` is constant and `M` is compact. Using `globalFlowDiffeotopy` rather than `compactlySupportedFlowDiffeotopy` is required here, since `U × M` is not compact. `v_y = 0` gives `φ_y = id` and `s(y) = g`.
  - No section, Layer 1 Dependencies included, still cites GeometricTopology Layers 3 or 7. The dropped "Riemannian structures" row had no consumer at a64ca16 (grep of `git show a64ca16:…README.md`).
  - DifferentialGeometry Layer 3 remains consumed by Layer 6 (`:2287`, `:2318`, `:2369`, `:2429`).
  - GeometricTopology Layer 3 on main plans the smooth-families map (`GeometricTopology/README.md:382`), as `:183` says.
- **R03.** 4.1: `H₀ = A[t,t⁻¹]·e₀` and `H₁ = A[t,t⁻¹]·e₁`, and `t ↦ 1` has kernel `(t − 1)`. For the correct `de₁ = (t − 1)e₀`, `H₀ = A` and `H₁ = 0`. 7.C.2c: values in the table.
- **R04.** `hatcher-ssat` lines 1414–1419 state Theorem 1.14 under trivial `π₁`-action. The local-coefficient remark at 984–994 is homological. Lines 1539–1541 take cohomology with local coefficients for the product sequence. The README now attributes exactly this. The References entry (`:4529–4531`) scopes "both for trivial monodromy" to Theorem 1.14 and the multiplicative structure, which matches lines 1508–1541.

### Seeded sample

Of the sampled targets, only 4.1 falls in the changed passages (its Check). Its locators were read:
- BDHO Theorem 3.3.5 (`bdho-morse-dg` lines 1019–1024): the Barraud–Cornea and Brown cocycles are both universal, hence equivalent, via semi-free resolutions of the trivial `C_*(ΩX)`-module `ℤ`. This supports 4.1's "compares it with the Barraud–Cornea cocycle over `ℤ`".
- The source's §1.4 (`bdho-cotangent` line 466, with the Brown connection at 816–818).

Both are supported. The other sampled targets (1.3, 2.3, 5.1, 5.2, 5.6, 6.0, 6.1, 6.5, 8.3, 9.2, 10.2, 10.4, 10.5, 11.3) are untouched by the diff. They were not re-read in this incremental review; the previous reviews' locator checks of them stand.

### Adversarial table

Conventions: `ω = dq ∧ dp`, `ι_X ω = dH`, and `𝒜_H = ∫ γ̄^*ω − ∫ H dt`. Rows marked (r20) are carried from the previous report for statements the diff leaves untouched; their values are that report's.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 7.4 estimate, lowering Check (new) | `H + ε(s)`, `ε: 0 → δ` | `∂_sH = ε′ ≥ 0` ⇒ monotone `c = 0`; general `∫max(−ε′) = −δ`; path `K_ϑ = H + ϑδ`: `max(−∂_ϑK) = −δ`; `∫max(H₋ − H₊) = −δ`; actual change `𝒜_{H+δ} − 𝒜_H = −δ` | all bounds hold, `−δ` attained |
| 7.4 estimate, raising Check (new) | `H − ε(s)`, `ε: 0 → δ` | general `∫max(ε′) = +δ`; `∫max(H₋ − H₊) = +δ`; actual `+δ`; source's unexchanged `∫max(H₊ − H₋) = −δ` | holds; unexchanged form refuted |
| 7.4 bump Check (new) | `ε: 0 → δ → 0` | ends equal, change `0`; `∫max(−ε′) = ε(−∞) − ε(+∞) = 0`; `−∫ε ≠ 0` | holds |
| 7.4 `ε`-bound (new) | `H₊ = H₋ + f`, `f ∈ [−1, 1]`, linear path | `∂_ϑK = f`, `c = ∫max(−f) = 1 = ∫max(H₋ − H₊)`; `ε`-perturbed: `≤ 1 + ε` | holds |
| 7.4 vs source (new) | `s ↦ −s`, `K′_ϑ = K_{1−ϑ}` | source `E = ∫max ∂_ϑK = ∫max(−∂_ϑK′)`; source `∂_sH ≤ 0` ↔ `∂_{s′}H′ ≥ 0`; Cor 3.25 `∫max(H₊ − H₋)` ↔ `∫max(H′₋ − H′₊)` | consistent |
| 8.4 Check (new) | `ε: 0 → 2δ → δ` | `∂_sH = ε′ < 0` on the fall; `∫max(−ε′) = 0 − δ = −δ`; actual `−δ` | holds |
| 1.2 cohomological, local coefficients (new) | `z ↦ z²` on `S¹`, `M = ℤ`; Hopf | `H⁰(F) = ℤ²` with swap: `H⁰(S¹; ·) = ℤ` (invariants), `H¹ = ℤ²/(1 − swap) = ℤ`, total `ℤ, ℤ = H^*(S¹)`; trivial-monodromy formula gives `ℤ², ℤ²` ✗; Hopf `d₂: E₂^{0,1} ≅ E₂^{2,0}` gives `H^*(S³)` | local form needed and correct |
| 1.6 local sections (new) | `S¹`, `y = 0`, `z = 0.5`, `U = (−1,1)`; two points; `S¹ ⊔ S²` | flow of `0.5` from `0` reaches `0.5` at `t = 1`; `v_y = 0` ⇒ `s(y) = g`; `ℝ⁰` chart, `v ≡ 0`, `O = M`; `O` = component of `x₀` | holds |
| 1.6 contract (new) | pinned hypotheses | `CompactSpace M`, `IsManifold I′ n P`, joint `C^n` of `f z.1 z.2`; flow: `T2`, boundaryless, `FiniteDimensional`, `1 ≤ n`, complete | matches prose |
| 4.1 Check (new) | `S¹`, `de₁ = 0` vs `(t − 1)e₀` | wrong: `H₀ = A[t,t⁻¹]`, `H₁ = A[t,t⁻¹]`, `ker(t ↦ 1) = (t − 1)`; right: `H₀ = A`, `H₁ = 0` | holds |
| 7.C.2c Check (new) | `A_ε`, `B = diag(1,−1)`, `j e_q = e_p` | `Bj = [[0,−1],[−1,0]]`, `jB = [[0,1],[1,0]]`, `C = [[0,−2],[−2,0]]`; `ε = 1`, `v = (e_q,e_q)`: `1 + 1 − 2 = 0`; `ω(J_εe₃, J_εe₄) = −4ε² + 1`; `|ω₀(v₁,Cv₂)| ≤ 2|v₁||v₂| ≤ |v|²` | holds |
| Mod-2 vanishing (Lean) (r20) | point; `M(ℤ/3,2)`; `S³` | `2·2 ≡ 1` on `ℤ/3`; `H̃₃(S³;𝔽₂) = 𝔽₂` excludes `S³` | holds |
| 1.4 (r20) | `Y = S²`, `n = 3`; f.g. `ℤ[1/2]`-modules | `π₂(E) = 0 → ℤ → 0` not exact; `H̃(ℤ/3;𝔽₂) = 0` | holds |
| 1.2 homological sequence (r20) | double cover; Hopf | `ker ∂ = 2ℤ`; `∂: π₂(S²) ≅ ℤ` | holds |
| 1.3 regrading (r20) | `(p,q) ↦ (1−2p−q, p−1)` | page `r + 1`, bidegree `(r+1, −r)` | holds |
| 2.1 (r20) | `B × S¹ → B` | durations `0`, `1`: point, `π₀ = ℤ` | holds as restricted |
| 2.2 (r20) | `z ↦ z²` | permutation module `ℤ²` | holds |
| 5.1 / 5.2 / 5.4 (r20) | index difference 2; height on `S¹`; path-loop, double cover | `(−1)¹`; `d = 1 − t`; `H(S¹;ℤ[ℤ/2]) = ℤ, ℤ` | hold |
| 5.6 (r20) | `S¹`, `r = 1`; constant loop | `𝓛¹S¹ = S¹`; duration `0` | holds |
| 6.0–6.3 (r20) | `(ℝ², dq∧dp)`; `c₀ × ℓ¹`; `T*ℝ`; `D²ⁿ`; `σ = x dy` | `{q,p} = 1`; pinned field `0`; `ι_{p∂_q}ω = p dp`; `ι_Zdλ = λ`; `π^*dσ ≠ 0` | hold |
| 7.1 (r20) | `ε(q²+p²)/2` | `CZ = +1 = n − ind`, `μ_CZ = −1` | consistent |
| 7.C.1 / 7.C.2 / 7.C.2d (r20) | `S²×S²` (1,2); `S = diag(1,−1)`; `z + ε/z` | `N_C = 2`; `C_J(1,−1) = 2(1,−1)`; energies `L + L` | hold |
| 9.1 / 9.3 (r20) | `ℝP²` rotation loop; `γ_n` in `T²` | monodromy `+1`; `sup|γ_n| = 1/(πn)` | hold |
| 5.10, A, 5.15, C (Lean) (r20) | `S³`, `d = 2, 3`; `T³`; `S²`; `ℝP²`, Klein bottle, `ℝP⁴`; `ℝP² ⊔ ℝP²` | `a² ≠ 1`; `π₃ = ℤ` non-torsion; `π₂ = ℤ`; total degree `0` | hold |
| 10.5 non-vacuity (r20) | proper `F`, connected `Q` | `F⁻¹(c) ≠ ∅` | non-vacuous |
| 11.1–11.2, torus criterion (Lean) (r20) | `U(n)`, `𝔰𝔩₂`, `𝔰𝔲(2)`; `SU(3)`; `T^r`, `SO(3)`, trivial group | `B(iI,iI) = 0`; `−3`; `π₃(SO(3)) = ℤ` | hold |

### Ownership, citations and overlaps

- `roadmaps resolve` reports no unresolved cross-roadmap citation or Lean name. The three new Tau Ceti names, which the tool does not check at the pin, were opened above.
- DGFloerPartII (#1799, 58c40ae) cites "the evaluation bundle of `Diff(M)` | DGFloer Layers 0–1" (its `:84`, `:314`). That still resolves to 1.6.
- No other roadmap owns a Hamiltonian Floer continuation action-filtration estimate. `roadmaps grep 'action filtration'` finds only InstantonFloerTheory's unrelated index table. Tau Ceti has no action-filtration declaration.
- No `Suggested.lean` of a readable roadmap declares a name in `TauCetiRoadmap.DGFloer`.
- `roadmaps overlaps DGFloer` lists no dropped or revision-only id. The only overlap is #963 (R01).

### Remarks on untouched text (no change requested)

- GeometricTopology's open revision #903 (5859c0d, its 3.3, `:1515–1523`) plans the restriction fibration `Diff_c(M) → Emb(N, M)`. Its `N = pt` case is 1.6's evaluation bundle. A revision is never a dependency, and GeometricTopology on main has no such item, so 1.6 rightly owns the point case at main. If #903 merges, 1.6 should cite GeometricTopology 3.3.
- `packages/DGFloer/sources.toml:400` gives "the multiplicative structure (p. 25)". The local-coefficient sentence the README cites (lines 1539–1541) is on p. 26 of the same discussion.
- The previous report's two source issues (Theorem 5.12 misprint; Theorem 5.15 Serre-class error) are unaffected by this change.

## Not verifiable

- Palais 1960, *Local triviality of the restriction map for embeddings* (1.6): settled as uncertified, cited by locator. The point case is checked here by its own construction, not against the text.
- Hirsch, *Differential Topology*, Chapter 2 §1: cited only in the pinned Tau Ceti docstring, not by the README.

## Source issues

- none
