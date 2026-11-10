# Review of DGFloer (pull request #1798 at 43731dc)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines changed since c3d8506. Every changed line is in 7.5 of `TauCetiRoadmap/DGFloer/README.md`, and nothing outside the folder changed. The gate passes and the dependency check reports no problem. `Suggested.lean` is unchanged and elaborates with only its seven `sorry` warnings.

The README repair (previous R03) is complete and introduces no new problem. The two findings about the pull-request description (previous R01 and R02) are not repaired, because the description has not changed. They are written again below as R01 and R02. The repair report answered both as correct but outside the repair job's files (H01, H02), so both are marked `Re-raised`. A further README repair round cannot close either one: they need an edit to the description's `merge-order` block.

| Id | Priority | Defect |
| --- | --- | --- |
| R01 | P2 | Layer 1 items 2–4 hand their ordinary targets to AlgebraicTopology stages that main does not have, and the `merge-order` block says nothing must merge first (previous R01). |
| R02 | P3 | The `merge-order` block fixes no order with #963, which changes the same Layer 1 targets in the opposite direction (previous R02). |

## R01 (P2) — Layer 1 items 2–4 send their targets to AlgebraicTopology stages that only open revisions define, and the description orders nothing first (previous R01, not repaired)

Re-raised: H01

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:160–175` says: "The ordinary targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there". It maps them to Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- `:4486` says: "AlgebraicTopology consumes nothing of Layer 1".
- In the description, the generated `merge-order` block says: "No open pull request must merge before this one".

**Claim.** The README describes the state after an AlgebraicTopology revision has merged, but the description does not order that revision first. If this pull request merged alone, main's AlgebraicTopology would still consume the Serre spectral sequences from DGFloer Layer 1 item 2. This head sends the same targets back to AlgebraicTopology Stage 5.5. The object would then have no owner.

**Witness.** On main (f8836c48), `TauCetiRoadmap/AlgebraicTopology/README.md:915–916` reads "Consume DGFloer Layer 1 item 2's homotopy LES and `arbitraryCWSerreSpectralSequence`", and main has no Stage 4.8, 5.0, 8.8c or 8.8d. These stages exist only at the heads of #1807 (b0d6406, README `:115–128`), #1808 and #1854.

**Why H01 does not settle it.** H01 agrees that the claim is correct and supplies the sentence to add. Its only reason for not acting is that the description lies outside the repair job's files. That does not make the finding wrong. The `merge-order` block is still the pull request's statement of order, and it is still false. The worker or the author must edit it.

**Repair** (description only, in the `merge-order` block).
1. Place before #1798 the AlgebraicTopology revision that lands Stages 4.8, 5.0, 8.8c, 8.8d and the Serre sequences of 5.5. That is #1807, or whichever of #1807, #1808 and #1854 merges with them.
2. Add: "#1652 is rebased on that revision before it merges (its 4.8 renumbered, its 5.5 no longer consuming DGFloer Layer 1 item 2)". #1652 (c610f76) still has `### 4.8 Compact generation and the pointed adjunction` at `:1795`, and its `:2035` still consumes DGFloer Layer 1 item 2.

**Test.** With the stated order, every step has exactly one owner of `arbitraryCWSerreSpectralSequence`:
- after the AlgebraicTopology revision merges: AlgebraicTopology Stage 5.5;
- after #1798 merges: still Stage 5.5, with DGFloer citing it.

Without the order, merging #1798 first leaves the object with no owner, as the witness shows.

## R02 (P3) — The `merge-order` block fixes no order with the conflicting revision #963 (previous R02, not repaired)

Re-raised: H02

**Location.** The description's `merge-order` block reads: "`DGFloer`: **this pull request**. Also changed by #963 (t4v1)." It also says: "No order is fixed against a pull request listed under “Also changed by”".

**Witness.** The overlap check on this head reports that #963 (62109eb) and #1798 conflict in `README.md` and `Suggested.lean`. #963's README `:555` reads "Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base". This head (`:168–170`) sends that same target to AlgebraicTopology Stage 5.5.

**Why H02 does not settle it.** H02 likewise agrees and gives the sentence to add. It is not applied only because the description is outside the repair job's files.

**Repair** (description only). Add: "#963 changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its ownership of `arbitraryCWSerreSpectralSequence`, before it merges." If the intended order is the reverse, state that instead.

## Previous findings

- R01 — not repaired: the `merge-order` block still reads "No open pull request must merge before this one"; main's AlgebraicTopology `:915` still consumes DGFloer Layer 1 item 2's Serre sequences. Written again as R01.
- R02 — not repaired: the description still says "No order is fixed" against #963, which still conflicts and still owns `arbitraryCWSerreSpectralSequence` (`:555`). Written again as R02.
- R03 — repaired: `:2602–2610` reads "For a local system `L` on the free loop space … `SH^{=0}_*(W; L) ≅ H_{*+n}(W, ∂W; i_W^*L)` … `ι_! : SH_*(W; L) → SH_*(V; ι^*L)`"; `:2625` reads "`L` trivial".

## Verified sound

### Gate, dependency check and Lean

- **Gate.** Rerun on 43731dc: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also records `build=0`.
- **Dependency check.** `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty. `git diff c3d8506..HEAD` touches only `README.md` (8 insertions, 8 deletions).
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244) and nothing else.
- **Suggested.lean.** The file is unchanged since 334507b. The worker's `signatures.md` shows no lost binder. The earlier results stand: the `#check @name` comparison, the padding probe (all seven statements resist `rfl | simp | infer_instance | trivial | decide`) and the headline list (PRREVIEW-DGFloer~27). Stated headlines: 1.4, Theorems 5.10/A, 5.15/C and 11.3. Theorems J, K, L, M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion are named in the module docstring as not statable.

### The changed passage and what depends on it

- **The letter audit.** Every remaining `𝓛` in the README is a free loop space: `𝓛₀` 48 times, `𝓛Q` 21, `𝓛S` 16, `𝓛ʳ` 11, `𝓛T` 6, `𝓛X` 6, and `𝓛^{r'}Q`, `𝓛¹S¹`, `𝓛⁴` once each. No coefficient system uses the letter.
- **Agreement with neighbouring sections.**
  - 7.5's `L` is now the letter of 9.2 (`:3890`, "every classical local system `L` on `𝓛Q`", `SH_*(T*Q; Π^*L)`).
  - It is distinct from the DG systems `𝓕` of 8.7 (`:3818–3820`) and 10.1–10.2 (`:4024–4051`).
- **Dependents of 7.5, read at this head.**
  - 8.7: the *Needs:* line and the degree-0 Check (`:3825–3829`).
  - 9.2: the *Needs:* line (`:3903`).
  - 10.1: the Check citing "(7.5)" (`:4036`).
  - References: `:4684`, `:4687`.
  - All are consistent with the renamed statement, and their ids are unchanged.
- **Citers outside this roadmap.** `roadmaps grep --fixed 'DGFloer Layer 7 item 5'` gives "no match on main or in any open roadmap pull request". DGFloerPartII (c8e0b93) cites no 7.5 statement.
- **Source.** Re-read `bdho-cotangent` lines 2916–2935. Propositions 3.44–3.46 use the windows `(−ε, ε)` and `(ε, ∞)`, `i_W : W → 𝓛₀W` (constant loops), a connecting map into `H_{*−1+n}`, and `ι^*` along `𝓛V → 𝓛W`. The renamed statement says exactly this in its classical case.
- **Sources.** The seeded sample does not fall in the changed passage. The README flags no locator as unverified.

### Adversarial table

Rows for the changed statement, with values computed this round:

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 7.5 zero part and long exact sequence, `L` trivial | `W = D²ⁿ` | `SH_* = 0`; `SH^{=0}_k ≅ H_{k+n}(D²ⁿ, S²ⁿ⁻¹)` is `ℤ` iff `k = n`; `SH^{>0}_k ≅ H_{k+n−1}` is `ℤ` iff `k = n + 1`; the wrong shift `H_{k+n+1}` gives `k = n − 1` | holds; the Check at `:2625–2629` agrees |
| 7.5 zero part, `L` trivial, contractible sector | `W = D*S¹ = S¹ × [−1, 1]`, `n = 1` | `H_j(W, ∂W) ≅ H^{2−j}(S¹)` is `ℤ` for `j = 1, 2`, so `SH^{=0}_k = ℤ` for `k = 0, 1`; there are no contractible Reeb orbits on `S*S¹`, so `SH^{>0} = 0` there; `H_*(𝓛₀S¹) = H_*(S¹)` is `ℤ` in degrees `0, 1` | holds; agrees with worked example 7 on the component of `0` |
| 7.5 zero part, sign system | `D*S¹`, `i_W^*L` with monodromy `−1` | `H_1(W, ∂W; ℤ_−) ≅ H^1(S¹; ℤ_−) = ℤ/2` and `H_2 ≅ H^0(S¹; ℤ_−) = 0`, so `SH^{=0}_0 = ℤ/2`, `SH^{=0}_1 = 0`; loop side `H_0(S¹; ℤ_−) = ℤ/2`, `H_1 = 0`; dropping `i_W^*` gives `ℤ, ℤ` | holds; the pullback is needed |
| 7.5 transfer | `ι = id_W`; `ι : D²ⁿ ⊆ W` | `ι^*L = L` and `ι_! = id`; `𝓛D²ⁿ` is contractible, so `ι^*L` is constant and `SH_*(D²ⁿ; ι^*L) = 0`, giving `ι_! = 0` | holds; the Check at `:2624` agrees |
| 8.7 degree-0 Check against the renamed 7.5 | `𝓕 = L[0]` | `E²_{p,q} = SH_p(W; H_q 𝓕)` vanishes for `q ≠ 0`, so `SH_*(W; 𝓕) = SH_*(W; L)` of 7.5 | holds |

Rows carried from PRREVIEW-DGFloer~28 (statements the diff leaves untouched):

| Statement | Instances | Values computed (PRREVIEW-DGFloer~28) | Result |
| --- | --- | --- | --- |
| 6.4 Stokes sign | `ι_Z ω = λ_Z`, `dλ_Z = ω` | `ι_Z(ωⁿ) = n λ_Z ∧ ω^{n−1}`; `∫_Σ = ∫_U ωⁿ > 0` forces outward `Z` on connected `Σ` | holds |
| 6.4 `Φ` open embedding | `dim((0, ∞) × Σ) = 2n` | injective (`injOn_flowOf`) immersion in equal dimension | holds |
| 6.4 `Φ^*λ_Z = r α₀` | `S*Q`, `Z = p∂_p` | `Φ(r, (q, p)) = (q, rp)`; `L_Z λ_Z = λ_Z` | holds |
| 6.4 rescaling to `f_α > 1` | `α = −α₀`; `α = ½α₀` | multiply by `−2`, by `4`: `f = 2` both; `R_{cα} = c⁻¹R_α` | holds |
| 6.4 `{F_α < 1} = U_α` | outward, `f_α > 1` | `U_α = {r < f_α} = {r/f_α < 1}` | holds |
| 6.4 negative controls | one shell `{½ < |p| < 2}`; two shells | `Φ(4, x) = Φ(1, 4x)` for `|x| = ½`; `Φ(7/4, S*_2) = S*_{7/2}` | excluded by the hypothesis |
| 6.4 last Check sentence | outer component `S*_2S³` | connected, degree 1, outward: Corollary E applies | holds |
| CG4 sign dictionary | `ω = −dλ` against `ω = dλ_Z` | `λ = −λ_Z`; `Φ^*λ_Z = eˢ λ_Z|_Σ` | holds |
| 7.5 conformal factor | `ρ = 0` | `ι^*θ' = θ + d(function)` | holds |
| Scope sentence | Def 1.7, Thms B, G, H, I | source lines 384, 415, 424, 430; DGFloerPartII §§3.2, 3.3, 4.1, 4.5, 4.6 | holds |

Rows carried from PRREVIEW-DGFloer~27, and for sampled targets from ~22, ~23 and ~26 (statements untouched since):

| Statement | Instances | Values computed (cited report) | Result |
| --- | --- | --- | --- |
| 0.1 boundary formula | `I`; `I²` | `∂ι₁ = (1) − (0)`; four signed edges of `∂ι₂` (~27) | holds |
| 1.1 Check | `S¹ ∨ S¹`; `S¹ ⊔ pt` | `σ_{aba⁻¹b⁻¹} ∼ 0`; `H₁ = ℤ` against `π₁(pt) = 0` (~27) | holds |
| 1.3 regradings | `(p, q)`; `G_t = F^{−t}` | `(a, b) = (1 − 2p − q, p − 1)`; `a + b = p + q` (~27) | holds |
| 1.3 negative control | `F_p C = C` | every `E^r = 0` while `H(C) ≠ 0` (~27) | holds |
| 1.4 mod-2 vanishing (Lean) | `pt`; `M(ℤ/3, 2)`; `S³` | trivial; `2·2 ≡ 1 (3)`; `H₃(S³; 𝔽₂) ≠ 0` excluded (~27) | holds |
| 1.5 sign | `T²`, `N = S¹ × {y₀}` | `[T²] ⌢ β = −a = (−1)^{1·1} i_*[N]` (~27) | holds |
| 2.1 rescaling | `(L, γ) ↦ (L, γ(L·))` | inverse `δ(min(t/L, 1))`, continuous for `L > 0` (~27) | holds |
| 2.3 Checks | `Map_*(S², S²)`, `Ω²Tⁿ`, `Ω²S³` | `π₀ = ℤ`; contractible; `H₁ = π₃(S³) = ℤ` (~23) | holds |
| 3.1 Check | degree-2 cover of `S¹` | `ℤ[t^{±1}]` over `ℤ[t^{±2}]` free on `1, t` (~26) | holds |
| 5.3 `f_*f_! = d·Id` | `z ↦ z²` on `S¹`; `T² → S²` | `f_*[S¹] = 2[S¹]`; `f_!f_*` kills `H₁(T²)` (~27) | holds |
| 5.4 Check | double cover of `S¹` | `H₀(S¹; ℤ[ℤ/2]) = ℤ`, `H₁ = ℤ` (~27) | holds |
| 5.6 cut | `Q = S¹`, `r = 1` | `𝓛¹ = S¹`; constant loop of duration `1` gives `0 ≠ 1` (~27) | holds |
| 6.1 Checks | `p²/2`; `(|q|² + |p|²)/2` | `ι_{p∂_q}(dq ∧ dp) = p dp`; eigenvalues `e^{±i} ≠ 1` (~27) | holds |
| 6.2 Liouville ball | `D²ⁿ` | `d(½(q dp − p dq)) = dq ∧ dp`; flow `e^{t/2}z`, `r = |z|²` (~23) | holds |
| 6.3 magnetic translation | `σ = x dy` on `T*ℝ²` | `Ψ'^*λ_can = λ_can − π^*σ` (~27) | holds |
| 6.4 Corollary E Check | `S*Q`, `α = fα₀` | `|P| = f`, `K = 1` (~27) | holds |
| 7.1 CZ normalization | `ε(q² + p²)/2` | `CZ = −sign(S)/2 = +1 = n − ind` (~27) | holds |
| 7.3 orientations | height on `S¹` | opposite signs give `ℤ, ℤ`; equal signs give `ℤ/2, 0` (~22) | holds |
| 7.4 Checks | `T²`; `H ± ε`, bump | ranks `1, 2, 1`; `ε(−∞) − ε(+∞)` (~27) | holds |
| 7.5 `a|z|²` Check | unit circle | `X_H = 2a(p∂_q − q∂_p)`; `∫ λ = π` (~27) | holds |
| 8.2 Check | small Morse `H` | `(Ωi_X)_*` of the Morse cocycle of `−H` (~27) | holds |
| 8.7 Check | `⊕ ℤ[k]` on `D²ⁿ` | Künneth with `SH(D²ⁿ) = 0` gives `0` (~27) | holds |
| 9.1 `η₀` | `ℝP²` | `w = −1`: `η₀ = σ`; rotation loop `+1`; `ev₀^*o⁻¹` alone `−1` (~26) | holds |
| 9.3 truncation and S³ Check | `τ_{≥k}`; `⊕_{k≤−m} ℤ[k]` | sub-DG module; degree `n` is `⊕_{0≤p≤n−m} H_p(𝓛S³)` (~27) | holds |
| 9.4 Check | `ℝP²` | `H₂(ℝP²; o) = ℤ`, `H₂(ℝP²; ℤ) = 0` (~27) | holds |
| 10.1 Theorem L | `D²ⁿ`, `𝓕 = ℤ` | `i_{W*}[W, ∂W] = 0`; `j_{U!}[W, ∂W] = [U, ∂U] ≠ 0` (~27) | holds |
| 10.2 Theorem M Checks | `T^r`; `S²` | `i_{Q*}` isomorphism; `H_{−2}(C_*(Ω𝓛₀S²)) = 0` (~27) | holds |
| 10.4 Prop 5.11, third case | `S²`; `ℤ/4`, `d = 2` | kernel `0`, or free of infinite rank; `ℤ/4` is not 2-torsion (~27) | holds |
| 10.5 Thms 5.10, 5.15, A, C (Lean) | `π₃ = ℤ/3`; `ℝP²`; Klein bottle; `ℝP⁴` | `a² = a⁻¹ ≠ 1`; doubling not onto `ℤ`; `H₃(ΩS⁴; 𝔽₂) = 𝔽₂` (~27) | holds |
| 11.1 Killing form | `𝔲(n)`; `𝔰𝔩(2, ℝ)` | `2n(−n) − 2(in)² = 0`; `8 > 0` (~27) | holds |
| 11.2 Cartan 3-form | `SU(2) → SU(3)` | `−3`; `−2` (~27) | sign `< 0` |
| 11.3 torus criterion (Lean) | `T^r`; `SO(3)`; `∏_ℕ S¹` | both sides true; `π₃ = ℤ`; excluded by `LieGroup` (~27) | holds |

### Cross-roadmap citations resolved this round

- **AlgebraicTopology on main (f8836c48).**
  - Stages 1–8 are headed `## Stage k`, and there is no 4.8, 5.0, 8.8c or 8.8d.
  - `:915–916` consumes DGFloer Layer 1 item 2 (R01).
- **AlgebraicTopology at the open heads.**
  - #1807 (b0d6406) defines Stage 4.8 (`:115`), 5.0 (`:117`), 5.5 (`:119`), 8.8c (`:108`, `:124`) and 8.8d (`:128`).
  - #1808 (705e4f6) and #1854 (48aba52) define the same stages.
  - #1652 (c610f76) does not (`:1795`, `:2035`).
- **#963 (62109eb).** `:555` owns `arbitraryCWSerreSpectralSequence` (R02).
- **Overlaps.** The overlap check lists:
  - no id this README cites that an open pull request drops;
  - no id that only an open revision defines (it does not read "Stage 4.8"-style ids, so R01 stands on the reading above);
  - no id of DGFloer this pull request drops that others cite.
- **Ownership against the other open pull requests** was checked in earlier rounds and not searched again: the change adds no construction, only a letter.

## Not verifiable

- Nothing new in the changed passage: its locators (`bdho-cotangent` 2916–2935, `seidel-biased` 486–515 and 1323–1329) were read at the text in PRREVIEW-DGFloer~28, and 2916–2935 again this round.
- Carried from the previous reports:
  - Weibel 5.5.1(2) and 5.5.10 (1.3);
  - Serre 1951 and 1953 (1.2, 1.4);
  - the texts settled as uncertified: Hofer–Zehnder, Struwe, Palais, Bröcker–tom Dieck, Massey, Whitehead and Hofer–Salamon.

## Source issues

- none
