# Review of DGFloer (pull request #1798 at a64ca16)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at a64ca16. The folder changed by 226 lines since 63e59c6, the head the previous review read, all in `README.md`. Nothing outside the folder changes: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty. The gate passes on this head. There are five findings, one of them blocking:

- **R01 (P1).** 7.4's new filtration bound uses the source's sign, which is the reverse of this roadmap's continuation direction. It also claims for every homotopy what the source proves only for a chosen one. 8.4's own Check refutes it.
- **R02 (P3).** 1.6 now cites GeometricTopology Layer 3 for the smooth-families map, which the pinned Tau Ceti already declares.
- **R03 (P3).** Two Checks are false as written: 4.1's rejected resolution and 7.C.2c's tame structure.
- **R04 (P3).** 1.2's new cohomological locator cites a trivial-monodromy theorem for the local-coefficient sequence, and `hatcher-ssat` is missing from the roadmap's manifest.
- **R05 (P3).** The conflicting open revision #963 still has no stated order. This is previous R04, not repaired.

## Previous findings (review at 63e59c6)

- **R01, Layer 11 restating LieGroups Layers 5A and 6: repaired.**
  - `README.md:97–100` now owns only "the negative semidefinite Killing form of the Lie algebra of a compact connected Lie group with its kernel, the Cartan 3-form argument…, the finite cover `T × K → G`… and the torus criterion".
  - 11.1 (`:4149–4155`) consumes "Layer 5A for the Lie algebra `𝔤`… an `Ad`-invariant inner product…, the orthogonal splitting…, and the fact that `[𝔤, 𝔤]` is a centreless semisimple ideal whose Killing form is negative definite".
  - 11.2 (`:4197`) reads "*Root homomorphisms*, consumed from LieGroups Layer 6".
  - The HamiltonianReduction R5 row and bullet are gone (`:179`, `:817–821`).
  - Every consumed item is on main: `RepresentationTheory/LieGroups/README.md:641–672` (5A); `:675`, `:713`, `:750` and `:751` for Layer 6's tori, exhaustion `exists_mem_maximalTorus`, real roots spanning `t_ss*`, and rank-one representatives with `dφ(diag(i,−i)) = α∨`.
- **R02, the restriction bundle cited from GeometricTopology Layer 3: repaired.** 1.6 (`:1434–1444`) now owns the local triviality of evaluation, with its own construction. Layer 3 is cited only for the smooth-families map, which Layer 3 on main does build (`GeometricTopology/README.md:381–386`). That map is, however, already at the Tau Ceti pin: R02 below.
- **R03, missing locators: repaired, with two defects in the new text.**
  - Locators now stand at 1.2 (`:1045–1047`, `:1066`, `:1081–1082`, `:1114–1115`), 3.1 (`:1648–1650`), 7.1 (`:2431–2438`) and 7.4 (`:2511–2517`). All were read and resolve (Verified sound).
  - 7.4's newly stated bound has the wrong sign (R01).
  - 1.2's cohomological locator does not cover local coefficients (R04).
- **R04, the order with #963: not repaired.** See R05 below.

## R01 (P1) — 7.4's one-sided filtration bound has the source's sign, the reverse of this roadmap's continuation direction

- **Location.** `README.md:2514–2516`: "the action filtration is preserved by monotone homotopies and shifted by at most the one-sided bound `∫₀¹ max_x (H₊ − H₋) dt + ε`, for every `ε > 0`, by general ones".
  - Its Check at `:2534–2538` reads "shifts the filtration by exactly `δ`, which is `∫₀¹ max (H₊ − H₋) dt`".
  - `:3673` calls Corollary 3.25 "the … Hofer-norm corollar[y]".
- **Claim.** In this roadmap the input is at the negative end, so continuation goes `FC(H₋) → FC(H₊)`. 8.4's Check (`:3679–3683`) writes this as `𝒜_{H₊}(x₊) = 𝒜_{H₋}(x₋) − E(u) − ∫∫ ∂_s H_s(u)`.
  - So the action rises by at most `∫ max_{X×S¹}(−∂_s H_s) ds`. For a homotopy near the linear interpolation this is `∫₀¹ max_x (H₋ − H₊) dt + ε`.
  - The source's `∫ max(H₊ − H₋)` belongs to its opposite map `FC(H₊) → FC(H₋)`. As written, the statement is false.
  - 7.4's Check (shift `+δ`) contradicts 8.4's Check (shift `−δ` for the same homotopy).
  - The source's Corollary 3.25 is existential: some homotopy satisfies the bound, not every one.
- **Witness.** For `H_s = H − ε(s)`, `ε` rising from `0` to `δ`: `X_{H_s} = X_H`, the map is the identity on generators, and `𝒜_{H₊} = 𝒜_H + δ` against the stated bound `−δ + ε`. Compare `bdho-cotangent` lines 2133 and 2185–2191.
- **Repair.**
  - In 7.4, replace the clause by: "preserved by homotopies with `∂_s H_s ≥ 0`, raised by at most `∫ max_{X×S¹}(−∂_s H_s) ds` by an arbitrary homotopy, and, for every `ε > 0`, by at most `∫₀¹ max_x (H₋ − H₊) dt + ε` by a homotopy chosen `ε`-close to the linear interpolation (the source's Proposition 3.22 and Corollaries 3.24–3.25 under `s ↦ −s`, which exchanges its `H₊` and `H₋`)".
  - In 7.4's Check, write "lowers every action by exactly `δ`, the bound `∫₀¹ max (H₋ − H₊) dt = −δ`". Add the instance `H − ε(s)`, which raises every action by `δ = ∫₀¹ max (H₋ − H₊) dt`.
  - At `:3673`, write "the monotone and one-sided corollaries".
  - Tested on both instances. For `H + ε(s)` the bound is `−δ` and the shift `−δ`; for `H − ε(s)` the bound is `+δ` and the shift `+δ`.

## R02 (P3) — 1.6 consumes GeometricTopology Layer 3 for a smooth-families map that the pinned Tau Ceti declares

- **Location.** `README.md:1432–1434`: "GeometricTopology Layer 3's smooth-families map, which turns a smooth family of diffeomorphisms into a continuous map into `Diff(M)`". The same citation recurs at `:1453–1454` (*Needs:*), `:183`, `:786–788` and `:1479–1480`.
- **Claim.** What exists at the pins is cited by name, not to a roadmap. With this citation dropped, Layer 3 is consumed nowhere: its other listed item, `O(n+1) → Diff(Sⁿ)` (`:787`), is used by no target.
- **Witness.** In Tau Ceti 2fd255d, `TauCeti/Geometry/Diffeomorphism/Topology.lean` declares:
  - `:125` `ContMDiff.continuous_diffeomorphWeakWhitney`: a jointly `C^n` family is continuous for the weak Whitney topology;
  - `:133` `Diffeomorph.ofSmoothFamily`, under `[CompactSpace M]` (`:80`).
- **Repair.** Add both names to the From Tau Ceti bullet on `TauCeti.Diff` (`:444–447`) and use them in 1.6's text and *Needs:* line. Drop GeometricTopology Layer 3 from `:183`, `:786–788` and `:1480`.
  - Tested on 1.6's instance. The parameter space is an open set of a chart, hence a manifold, and `M` is closed, which is what the pinned theorem needs.

## R03 (P3) — Two Checks are false as written

- **Location.**
  - 4.1, `README.md:1767–1768`: "The zero-cocycle two-generator complex `R·e₀ ⊕ R·e₁` with `de₁ = 0` is rejected as a resolution: its augmentation has `H₁ = H₁(ΩS¹) ⊗ … ≠ 0`".
  - 7.C.2c, `:2853–2854`: "`J_ε = A J₀ A⁻¹` with `A = [[I, B], [0, I]]`, `B = diag(1, −1)`, that is `J_ε = [[J₀, εC], [0, J₀]]`".
- **Claim.**
  - In 4.1, `ΩS¹` is homotopy discrete, so `H₁(ΩS¹) = 0`. The class that survives is `H₀(ΩS¹)·e₁`.
  - In 7.C.2c, the displayed `A` gives `[[J₀, C], [0, J₀]]`, the member `ε = 1`. That member is not tame, so it is not the structure the Check describes.
- **Witness.**
  - 4.1: `H₁(R e₀ ⊕ R e₁) = H₁(R)e₀ ⊕ H₀(R)e₁ = 0 ⊕ A[t, t⁻¹]`.
  - 7.C.2c: at `ε = 1` and `v = (e_q, e_q)`, `ω(v, Jv) = 1 + 1 + ω₀(e_q, (0, −2)) = 0`.
- **Repair.**
  - 4.1: "its homology is `A[t, t⁻¹]` in degrees `0` (on `e₀`) and `1` (on `e₁`), so the augmentation is no quasi-isomorphism".
  - 7.C.2c: `A = [[I, εB], [0, I]]`. Tested: this gives `[[J₀, εC], [0, J₀]]`, with `ω(v, J_ε v) ≥ (1 − |ε|)|v|²` and `ω(J_ε e₃, J_ε e₄) = 1 − 4ε²`.

## R04 (P3) — 1.2's cohomological locator assumes trivial monodromy, and `hatcher-ssat` is not in the manifest

- **Location.** `README.md:1080–1082`: "`E₂^{p,q} = H^p(B; H^q(F; M))`, with path-transport local coefficients, and converges to `H^{p+q}(E; M)` (Hatcher Theorem 1.14, `hatcher-ssat` lines 1414–1419)".
- **Claim.**
  - Theorem 1.14 assumes that `π₁(B)` acts trivially. Hatcher's local-coefficient remark covers only the homology sequence.
  - The line citations are against the key `hatcher-ssat`, which the roadmap's `sources.toml` does not record.
- **Witness.**
  - `hatcher-ssat` lines 1414–1415 state the trivial-action hypothesis; the "Local Coefficients" remark is at lines 984–994, under homology.
  - `packages/DGFloer/sources.toml` has 24 keys and no `hatcher-ssat`. The key is in `packages/AlgebraicTopology/sources.toml:206`, with sha256 d34a09b….
- **Repair.**
  - Write "(Hatcher Theorem 1.14 for trivial monodromy, `hatcher-ssat` lines 1414–1419; the local-coefficient form is this item's, by the filtration argument of the homological remark at lines 984–994)".
  - Record `hatcher-ssat` in `packages/DGFloer/sources.toml`, with AlgebraicTopology's url, sha256 and licence class, `cited_for` "1.2".

## R05 (P3) — The conflicting open revision #963 still has no stated order (previous R04, not repaired)

- **Location.** The pull request description. Its merge-order paragraph does not mention #963.
- **Claim.** #963 (`@t4v1`, 62109eb) changes this roadmap's `README.md` and `Suggested.lean`, and its head conflicts with this one.
- **Witness.** `roadmaps overlaps DGFloer` reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`". `roadmaps list` shows #963 open.
- **Repair.** State in the description which of #963 and #1798 is rebased on the other before either merges.

## Verified sound

**Gate and dependency check**, both rerun on a64ca16:

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 239 roadmaps, 2354 edges, 0 problem(s)
```

The dependency check prints no UPWARD, CYCLE or `moved:` line. The worker's gate record has `build=0`. `PROGRESS.md` and `STATUS.md` are the generated status files (`stray-files=0`).

**Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives 7 `sorry` warnings and nothing else. The file is unchanged since 63e59c6.
- A scratch copy with `#check @name` for all 7 declarations elaborated without error.
- Each elaborated type matches `scratch/signatures.md` and its README statement:
  - 5.10 and both A theorems keep `[ConnectedSpace Q]`, `[IsManifold 𝓘(ℝ, E) ∞ S]`, both `HomologicalOrientation`s and `d ≠ 0` (resp. `IsUnit d`). The disjunction matches `:4036–4039`.
  - 5.15 and C keep `IsEmpty (HomologicalOrientation Q E (Module.finrank ℝ E))` and the `ZMod 2` degree map.
  - The torus criterion keeps `[LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G]`.
- No section binder is lost.

**One-tactic probes.** Every `sorry` was replaced by `first | rfl | simp | infer_instance | assumption` in a scratch copy: all 7 fail (7 errors). No declaration restates a definition, mirrors a Check or computes a value, so nothing is padding.

**Headline theorems** (`README.md:17–21`): the fibration theorem (5.4), the DG Floer comparison and Theorem J (8.6), Theorem K (9.3), Theorems L and M (10.1–10.2), Theorems A and C (10.5) and the torus criterion (11.3).
- Stated in `Suggested.lean`: mod-2 vanishing, 5.10, A in two cases, 5.15, C and the torus criterion.
- J, K, L, M, the fibration theorem, the Arnold bound, the Serre sequences and the Floer–Novikov torsion are named in the docstring with the carrier each lacks. No statable headline is absent.

**Seeded sample** ("the source" is `bdho-cotangent`; BDHO is `bdho-morse-dg`):

| Target | Locator read | Result |
|---|---|---|
| 1.4 | Hatcher Prop 4.30, Lemma 4.31 (`hatcher-at` 15928, 15931); the source's Thm 5.12 (4204–4206) | supported (misprint below) |
| 1.6 | `TauCeti.Diff`, `exists_diffeotopy_final_apply_eq` at the pin; GeometricTopology L3 on main (381–386) | supported; R02 |
| 2.1 | pinned `MooreLoopSpace.map`, `IsHurewiczFibration.loopMap`, `loopMap_loopMap`, `pullback`, `comp_homeomorph`, `comp`, `lengthHomeomorph`, `isHurewiczFibration_fst` | all exist; supported |
| 2.2 | Hatcher Prop 4.48 and remark (16461–16466); BDHO §7.1 (3053–3056, citing [DK69, Prop 5.5]) | supported |
| 5.1 | BDHO Thm 5.2.1 (1461), Prop 5.2.6 (1638), (5.12) (1648), Prop 5.2.8 (1699) | supported |
| 5.2 | BDHO Thm 3.3.5 (1019), §5.2, Ch 6 | supported |
| 5.4 | BDHO Thm 7.2.1 (3101–3111) | supported |
| 5.6 | BDHO Props 13.2.2–13.2.3, Def 13.3.1, Props 13.3.2–13.3.3 (8753, 8777, 8848, 8852, 8864); `abouzaid-viterbo` 2902, 2946, 2949, 2952; the source §4.3 (3100) | supported |
| 6.1 | the source §3.2 (1466); pinned `timeDependentFlowOf`, `periodicSolutions`, `IsNondegenerateFixedPt` | supported |
| 6.2 | `seidel-biased` 74–97 ((2.2)–(2.3): `e^r α` on `[0,∞) × ∂M`) | supported, with `ρ = e^r` |
| 7.1 | `salamon-lectures` 342–346, 463–468, 734–739, 879–884, 1477 | supported |
| 9.1 | the source 2992–3007 (`η = σ ⊗ µ ⊗ õ`), §4.2 (3055) | supported |
| 9.3 | the source Lemma 4.5 (3137–3143), Props 4.6–4.16, Lemma 4.15 (3295–3749) | supported |
| 11.1 | `meinrenken-lie` 2131–2140; LieGroups 5A (main 641–672) | supported |
| 11.2 | `bott-lie-groups` 92–93; `meinrenken-lie` 3466–3543; LieGroups 6 (main 751) | supported |

The changed locators were also read:
- `hatcher-ssat` 433–438, 806–814, 984–994 and 1508–1524 (1414–1419: R04);
- BDHO 2867–2890, with (6.16) at 2883;
- `salamon-lectures` 1140, 1162, 1202–1205 and 1343–1394;
- the source 2131–2191 (R01).

**Adversarial table** (`ω = dq ∧ dp`, `ι_X ω = dH` unless stated otherwise):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Mod-2 vanishing (Lean) | point; `M(ℤ/3,2)`; `S³` | trivial; `a ↦ 2a` on `ℤ/3` bijective (`2·2 ≡ 1`); `H̃₃(S³;𝔽₂) = 𝔽₂` excludes `S³`, where doubling `ℤ` is not onto | holds; hypothesis needed |
| 1.4 fibre placement | `Y = S²`, `n = 3` | `0 = π₂(E) → ℤ → π₁(K(π₃S²,2)) = 0` not exact | Check correct |
| 1.4, `n = 1` | f.g. `ℤ[1/2]`-modules | `ℤ[1/2]^r ⊕ ⊕ℤ/mᵢ`, `mᵢ` odd; `H̃(ℤ/3;𝔽₂) = 0` | holds |
| 1.2 sequence | double cover; Hopf | `ker ∂ = 2ℤ`; `∂ : π₂(S²) ≅ ℤ` | holds |
| 1.3 regrading | `(p,q) ↦ (1−2p−q, p−1)` | `(p−r, q+r−1) ↦ (a+r+1, b−r)`, page `r+1` | holds |
| 1.6 | `S¹`; two points; `S¹ ⊔ S²` | fibre `Diff(S¹,1)`; `O = M`, `H = {id}`; fibre over `S²` empty | holds |
| 2.1 | `B × S¹ → B` | unrestricted fibre over durations `0`, `1`: point, `Ω^{[0,1]}S¹` (`π₀ = ℤ`); restricted map `id × Ωp` | holds as restricted |
| 2.2 | `z ↦ z²` | transport swaps `{1, −1}`: `ℤ²` permutation module, not sign | holds |
| 4.1 Check | `S¹`, `de₁ = 0` | `H₁(ΩS¹) = 0`; `H₁ = A[t,t⁻¹]·e₁` | R03 |
| 5.1 | index difference 2 | `(−1)^1 = −1`, as (5.12) | holds |
| 5.2 | height on `S¹` | half-loops `1`, `t`: `d = 1 − t` | holds |
| 5.4 | path-loop over `Sⁿ`; double cover | `H(pt)` vs trivial action `ℤ` in degree `n−1`; `H(S¹;ℤ[ℤ/2]) = ℤ, ℤ` | holds |
| 5.6 | `S¹`, `r = 1`; const loop of duration 1 | `𝓛¹S¹ = S¹`; `geo∘ev(c)` has duration `0` | holds |
| 6.0 Leibniz | `(ℝ², dq∧dp)` | `X_q = −∂_p`, `X_p = ∂_q`, `X_{qp} = q∂_q − p∂_p`, `{q,p} = 1` | holds |
| 6.0 weak/strong | `c₀ × ℓ¹` | `X_f = (0,−a)`, `X_g = (b,0)`, `ω(X_f, X_g) = a(b)`, pinned field `0` | holds |
| 6.1 bridge | `T*ℝ`, `H = p²/2` | `ι_{p∂_q} ω = p dp`; source field `−p∂_q` = `ν`-transport of `p∂_q` | holds |
| 6.2 | `D²ⁿ`, `Z = ½(q∂_q + p∂_p)` | `ι_Z dλ = ½(p dq − q dp) = λ` | holds |
| 6.3 | `σ = f dq`; `σ = x dy` | `−d((p−f)dq) = dq∧dp`; `π^*dσ = dx∧dy ≠ 0` | holds |
| 7.1 | `εH`, `H = (q²+p²)/2` | `S = −εI`, `CZ = +1 = n − ind`; Salamon `μ_H = ind_{−H} = 2`, `μ_CZ = n − μ_H = −1 = μ` | consistent |
| 7.4 bound | `H ± ε(s)` | action change `∓δ`; stated bound `±δ + ε`; corrected `∓δ + ε` | R01 |
| 8.4 Check | `H + ε(s)` | `∫max(−∂_sH) = 0`, shift `−δ` | holds |
| 7.C.1 | `S² × S²`, areas `(1,2)` | joint kernel `0`, `N_C = 2`; `(1,−1)`: `c₁ = 0`, `ω = −1` | holds |
| 7.C.2 | `S = diag(1,−1)` | `C_J = [[0,−2],[−2,0]]`, `C_J(1,−1) = 2(1,−1)`, `LJz = (−4,−4)` | holds |
| 7.C.2c Check | `A` with `B`, with `εB` | `ε = 1`: `ω(v,Jv) = 0`; `εB`: `≥ (1−|ε|)|v|²`, `1 − 4ε²` | R03 |
| 7.C.2d | `z + ε/z`; `M̄_(0,4)` | bubble `1/w`, energy `L + L`; bounds `2`, `1` met | holds |
| 9.1 | `ℝP²`, rotation loop | `w = −1`: `µ ⊗ õ` trivial; adjoint factors through `S¹`, `w₂ = 0`, monodromy `+1` | holds |
| 9.3 | `γ_n` in flat `T²` | `|γ_n′| = 1`, `sup|γ_n| = 1/(πn) → 0`, limit has duration `1` | part 1 of Lemma 4.5 not consumed |
| 5.10 (Lean) | `S³`, `d = 2`; `T³`; `π₃ = ℤ/2`, `d = 2` | `k = 0`, `a² ≠ 1`; silent; `a² = 1`, second alternative fails | holds |
| A (Lean) | `S²`, `d = 1`; `T² ⊔ T²` | `π₂ = ℤ`; excluded by `ConnectedSpace` | holds |
| A, second (Lean) | `S³`, `d = 3` | `π₃ = ℤ` not torsion | applies |
| 5.15 (Lean) | `ℝP²`; Klein bottle; `ℝP⁴` | `π₂ = ℤ`, `H₂(;ℤ/2)` map `id`; all `π_{≥2} = 0`, excluded; `π₄ = ℤ` (`n = 1`) | holds |
| C (Lean) | `S = ℝP² ⊔ ℝP²` | `(a,b) ↦ a + b ≠ 0`, total degree `0` | holds |
| 10.5 non-vacuity | proper `F`, connected `Q` | `F(T*Q) = [min F, ∞)`, `F(φ s) < c` ⇒ `F⁻¹(c) ≠ ∅` | non-vacuous |
| 11.1 | `U(n)`; `𝔰𝔩(2,ℝ)`; `𝔰𝔲(2)` | `B(iI,iI) = −2n² + 2n² = 0`; `B(h,h) = 8`; `tr(ad e₁)² = −2` | holds |
| 11.1 cover | `U(n)`; `SO(3)`; `T^r` | kernel `μ_n`; `K = SU(2)`, `r = 0`; `K = 1` | holds |
| 11.2 | `SU(3)`, `α = ε₁ − ε₂` | `6·tr(¼ diag(−1,−1,0)) = −3`; `𝔰𝔲(2)`'s own `−2`; conjugation flips `α∨` | holds |
| Torus criterion (Lean) | `T^r`; `SO(3)`; trivial group; `ℕ → S¹` | both sides true; `π₃ = ℤ`, both false; `r = 0`; not a Lie group | holds |

**Pinned declarations** (Tau Ceti 2fd255d, Mathlib 1b1ccf4).
- All 224 distinct backticked `TauCeti.*` names of the README exist as declaration heads at the pin. `TauCeti.IsHurewiczFibration` is at `Topology/Homotopy/HurewiczFibration/Basic.lean:58`.
- Opened: `Geometry/Diffeomorphism/Topology.lean:80–137` (R02) and `Group.lean:214` (`Diff`).
- Mathlib names opened:
  - `LieAlgebra.IsKilling.exists_isSl2Triple_of_weight_isNonZero` (`Algebra/Lie/Weights/Killing.lean:556`);
  - `killingForm` (`Algebra/Lie/TraceForm.lean:374`);
  - `exists_embedding_euclidean_of_compact` (`Geometry/Manifold/WhitneyEmbedding.lean:132`);
  - `exists_contMDiffMap_forall_mem_convex_of_local` (`PartitionOfUnity.lean:643`);
  - `exists_isMIntegralCurveAt_of_contMDiffAt_boundaryless` (`IntegralCurve/ExistUnique.lean:121`);
  - `Monotone.ae_differentiableAt` (`Analysis/Calculus/Monotone.lean:213`);
  - `exists_dual_vector` (`HahnBanach.lean:66`);
  - `IsMulTorsion` (`GroupTheory/Torsion.lean:56`).
- Neither pin has a Killing-form sign lemma for compact Lie algebras, so 11.1's corollary is owned correctly.

**Cross-roadmap citations resolved.** `roadmaps resolve` lists nothing unresolved. The changed citations were opened on main (19d2a1c):
- LieGroups Layers 4, 5, 5A and 6 (`:463`, `:518`, `:641`, `:673`);
- GeometricTopology Layers 1 (collars and tubular neighbourhoods, `:205–222`) and 3 (`:357–408`).

DGFloerPartII (#1799, 9e65f2b) cites this roadmap's Layer 1 item 6 "local evaluation bundle" (its `:1566`, `:1604`), Layer 4 item 5 (resolved by `README.md:164`) and Layer 11 (`:89`, `:1569`). All resolve here.

**Ownership.** By object, with `roadmaps grep` over main and the open heads:
- The Cartan 3-form argument, `π₃(K) ≠ 0`, the finite cover and the torus criterion are owned only here. DGFloerPartII consumes them; no other roadmap on main states `π₃` of a compact Lie group.
- No `Suggested.lean` of a readable roadmap declares a name in `TauCetiRoadmap.DGFloer`.

**Gap.** gap:genus-zero-stable-map-compactness (`:830–852`) is unchanged and precise. Its graph bounds were recomputed: `b ≤ k − 2 + 2a` and nodes `≤ k − 3 + 3a`, from `k + 2(a + b − 1) ≥ 3b`. AnalyticStableMaps (#987, 41557ba) is earlier in the merge order.

## Not verifiable

Books or paywalled texts, cited by locator; none was read:
- Serre 1951 Chapter II and Serre 1953 Theorem 1 (1.2, 1.4); Weibel 5.5.1 and 5.5.10 (1.3); Whitehead Chapter I (2.2); Palais 1960 (1.6); Massey;
- McDuff–Salamon §3.1, Abraham–Marsden, Chernoff–Marsden and Hartman (6.0); Hofer–Zehnder and Struwe (6.5);
- Bröcker–tom Dieck Chapter V (11.1);
- Floer–Hofer–Salamon, Piunikhin–Salamon–Schwarz and Hofer–Salamon (7.C).

The constructions of 7.C, 7.G and 7.T were read for their Checks, not proof by proof.

## Source issues

- **Misprint** in bdho-cotangent at Theorem 5.12, printed p. 97 (lines 4204–4206): the source says `π_i ∈ C` for `i ≤ k` exactly when `H_i(Y; ℤ) ∈ C` for `i ≤ k`; it should be stated for `1 ≤ i ≤ k`, since `H₀(Y; ℤ) = ℤ` lies in no torsion class; affects nothing.
- **Error** in bdho-cotangent at the proof of Theorem 5.15, printed p. 99 (lines 4322–4324): the source says the groups `G` with `G ⊗ ℤ/2 = 0` form a Serre class; it should be a genuine class or a mod-2 vanishing argument, since `ℚ` is in this one and its subgroup `ℤ` is not; affects the proof.
