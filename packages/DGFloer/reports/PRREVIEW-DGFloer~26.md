# Review of DGFloer (pull request #1798 at 1004825)

**Verdict:** needs changes

This head is the one the previous review read; neither the folder nor the description has changed since. This round is a full review of the whole folder. The gate passes, the build is clean and the dependency check reports no problem.

The two previous findings are not repaired; both are repaired in the description only. The full read found six new defects: two P2 statements and four P3 locator, numbering, Check and text defects.

- **R01 (P2).** The previous R01: Layer 1 items 2–4 are handed to AlgebraicTopology stages that only open revisions define, and no order is stated.
- **R02 (P2).** 6.4 plans the source's remark before Corollary E and calls it Corollary E.
- **R03 (P2).** 10.4 states Proposition 5.11 without fixing its DG local system, and the statement is false for `𝓕 = ℤ`.
- **R04 (P3).** The head drops the ids `G0–G7` and Layer 1 item 7, which open roadmaps cite, and gives no old → new numbering.
- **R05 (P3).** The locators of 0.1 point to appendices that do not contain the fundamental-chain theorem.
- **R06 (P3).** The previous R02: the order with the conflicting revision #963 is not stated.
- **R07 (P3).** An 8.2 Check sends the Morse cocycle the wrong way along `X → 𝓛₀X`.
- **R08 (P3).** A text substitution has left garbled words in Layers 7.C and 7.T.

## R01 (P2) — Layer 1 items 2–4 are handed to AlgebraicTopology stages that only open revisions define, with no stated order (previous R01, not repaired)

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:159–175`: "The ordinary targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there", mapped to Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- The same stages appear at `:197` and `:784–806`.
- The pull-request description: its body still says "Layer 1 items 1–6 are unchanged", and its merge-order paragraph still ends "#987 (AnalyticStableMaps) → **this pull request**".

**Claim.** CW approximation, the filtered-complex adapters, the fibration exact sequence, the Serre spectral sequences, `K(A, n)` and Hurewicz modulo a Serre class are consumed from AlgebraicTopology. Main's AlgebraicTopology, and its open revision #1652, consume the same objects from DGFloer Layer 1.

**Witness.**
- **Main, AlgebraicTopology (3090489).** `:915` reads "Consume DGFloer Layer 1 item 2's homotopy LES". Stage 4 has items 1–7 and Stage 8 only 8.8a–8.8b, so Stages 4.8, 5.0, 8.8c and 8.8d do not exist on main.
- **#1652 (db70d31).** `:2005` and `:2014` consume DGFloer Layer 1 items 2–3.
- **Where the stages are.** They exist only at #1797 (b5e7fcb) `:125–135`, #1807 (5004f71) `:115–128`, #1808 (eabc47f) and #1854 (f743cc2).

**Repair** (description only, as before).
1. Place the AlgebraicTopology revision that defines Stages 4.8, 5.0, 5.5, 8.8c and 8.8d before this pull request in the merge-order paragraph.
2. Replace "Layer 1 items 1–6 are unchanged" with "Layer 1 items 2–4 consume AlgebraicTopology Stages 4.8, 5.0, 5.5, 8.8c and 8.8d as <that revision> defines them".
3. Add: "#1652 is rebased on <that revision> before it merges".

**Test.** At each point of the stated order the homological Serre spectral sequence has exactly one owner.

## R02 (P2) — 6.4 calls the remark before Corollary E "Corollary E", without the corollary's hypothesis or conclusion

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:2245–2249`: "Own the Liouville-flow argument that gives the Theorem A and Theorem C forms of Corollary E … for `Σ` of contact type … gives a contractible closed characteristic on `Σ` itself."
- The same claim is at `:84` and `:4017–4018`, and in the coverage row `:4375` ("Cor D, E | 6.3, 6.4, 10.5").

**Claim.** What 6.4 plans is the source's remark that precedes Corollary E (`bdho-cotangent` lines 293–299). That remark gives one contractible Reeb orbit, for the contact form `λ|_Σ`.
- Corollary E (`bdho-cotangent` lines 304–317) assumes that `Σ` is of **restricted contact type with a complete Liouville vector field**.
- It concludes the Weinstein conjecture for **every** contact form defining `ξ`.
- Its route: the flow of `Z` embeds the symplectization `(0, ∞) × Σ`. After scaling, `α = f_α α₀` with `f_α > 1`, and Theorems A and C are applied to the graph `Σ_α` of `f_α`, which bounds a domain containing `U`.

The scope (`:37–40`) puts every numbered statement of §§1–6.2 in scope, so Corollary E itself has to be planned. DGFloerPartII §3.3 consumes 6.4 for the Theorem B form and inherits the gap.

**Witness.** Take `Σ = S*Q` with `Z = p ∂_p`, which is complete and gives restricted contact type, and `α = f α₀` with `f` nonconstant. The Reeb orbits of `α` are the closed characteristics of the graph `{|p| = f}`, a different hypersurface. 6.4's argument applied to `S*Q` yields only Reeb orbits of `α₀`, the closed cogeodesics.

**Repair.**
1. In 6.4, state Corollary E with its hypothesis: restricted contact type (`TauCeti.IsRestrictedContactType`) with a complete Liouville vector field.
2. State its conclusion: every contact form defining `ξ` has a closed Reeb orbit contractible in `T*Q`.
3. Give the graph route of lines 308–317. Keep the present argument as its case `f_α = 1`, citing lines 293–299.
4. Add the `S*Q`, `α = fα₀` Check.

## R03 (P2) — 10.4 states Proposition 5.11 without its DG local system

**Location.** `TauCetiRoadmap/DGFloer/README.md:3967–3974`: "Then prove Proposition 5.11 … If `k = 2`, `ker i_{Q*}` contains an infinite cyclic subgroup." The same unqualified kernel is used at `:4024–4026`.

**Claim.** `i_{Q*} : H_*(Q; i_Q^*𝓕) → H_*(𝓛₀Q; 𝓕)` (10.3, `:3927–3928`) depends on `𝓕`, and 10.4 never fixes it. The source fixes `𝓕 = C_*(Ω𝓛₀Q)` acting on itself by right multiplication (`bdho-cotangent` lines 4151–4152). Its proof then identifies `i_{Q*}` with the map from `H_*(P_{⋆→Q}𝓛₀Q)` to `H_*(pt)` (lines 4162–4173). For Theorem 5.15 the source uses the same `𝓕` with mod-2 coefficients (line 4310).

**Witness.** Take `Q = S²` and `𝓕 = ℤ`, acting through the augmentation. Then `ev₀ ∘ i_Q = id_Q`, so `i_{Q*} : H_*(S²) → H_*(𝓛₀S²)` is injective and `ker i_{Q*} = 0`, although `k = 2`. With `𝓕 = C_*(Ω𝓛₀S²)` the kernel contains the reduced `H₀(Ω²S²)`, which is infinite cyclic and more, as the Check at `:3994–3997` computes.

**Repair.** Begin 10.4 with: "For the DG local system `𝓕 = C_*(Ω𝓛₀Q)`, a right module over itself, for which `H_*(Q; i_Q^*𝓕) ≅ H_*(P_{⋆→Q}𝓛₀Q)` and `H_*(𝓛₀Q; 𝓕) ≅ H_*(pt)` (lines 4162–4173)". Name the same `𝓕`, and `𝓕 ⊗ ℤ/2` for Theorem 5.15, in 10.5's route.

## R04 (P3) — ids this pull request drops are still cited, and no old → new numbering is given

**Location.** `TauCetiRoadmap/DGFloer/README.md:150–179`. The numbering note maps Layers 0, 2, 3 and 4 and Layer 1 items 2–4. It says nothing of `G0–G7` or of Layer 1 items 7–8, which this head no longer has: Layer 1 ends at 1.6, and the global-seam application is 7.G.

**Witness.**
- **Main's DGFloer** defines `:104` "G0–G7. Closed-aspherical global-seam application" and Layer 1 item 7 at `:834`.
- **Open roadmaps citing them.**
  - FukayaTheory (#1045, 31de88a) cites "DGFloer … G0–G7" at `:31`, `:856` and `:1001`.
  - RiemannianGeometry (#1683, df3f6d4) `:122` reads "DGFloer Layer 1 item 7 owns the complex projective form comparison".
  - ManifoldOptimization (#1506, 344c8fe) `:342` reads "DGFloer Layer 1 item 7's Stiefel manifold".
- **The overlap tool did not list these ids.** They were found by searching the open heads.

**Repair.** Add to the numbering note:

> `G0–G7` is Layer 7.G. Layer 1 item 7 (homogeneous carriers, frames and the projective form comparison) is DGFloerPartII §1.3, and Layer 1 item 8 (degrees of explicit maps) is DGFloerPartII §1.4.

These are the sections of DGFloerPartII (9de4d71) with the same titles and content.

## R05 (P3) — The 0.1 locators do not contain the fundamental-chain theorem

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:923–924`: "(Barraud–Cornea, *Lagrangian intersections and the Serre spectral sequence*, Appendix A; BDHO Appendix A)".
- Again at `:950` and in the References at `:4451–4452`.

**Witness.**
- **Barraud–Cornea Appendix A** gives Floer strip spaces the structure of topological manifolds with corners (`barraud-cornea-serre` lines 1882–1884). Its inductive construction of chains with `∂s_{xy} = Σ s_{xz} × s_{zy}` is Lemma 2.2 (lines 541–555).
- **BDHO Appendix A** compares geometric and analytic orientations of Morse trajectory spaces (`bdho-morse-dg` lines 9057–9065). The fundamental-chain induction is Proposition 5.2.6 and its proof (lines 1638–1700).

**Repair.** Cite "Barraud–Cornea Lemma 2.2; BDHO Proposition 5.2.6 and its proof" at `:923–924` and `:950`. Keep Barraud–Cornea Appendix A only as the corner-structure input, as 7.2 already does at `:2373–2375`.

## R06 (P3) — The order with the conflicting open revision #963 is not stated (previous R02, not repaired)

**Location.** The pull-request description, which never mentions #963.

**Witness.**
- The overlap check reports that #963 and #1798 conflict in `README.md` and `Suggested.lean`.
- #963 (62109eb, unchanged) still reads at `:555` "Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base", and at `:222` "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets".
- This head hands the same targets to AlgebraicTopology Stage 5.5 (`:167–170`).

**Repair** (description only). Add: "#963 changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its Layer 1 item 2 ownership, before it merges." If the order is the reverse, state that instead.

## R07 (P3) — An 8.2 Check maps the Morse cocycle in the wrong direction

**Location.** `TauCetiRoadmap/DGFloer/README.md:3577–3578`: "the cocycle is the Morse cocycle of Layer 5 item 2 pulled back along the constant-loop inclusion `X → 𝓛₀X`."

**Witness.** The Floer cocycle lies in `C_*(Ω𝓛X)` (`bdho-cotangent` line 1787). Layer 5's cocycle lies in `C_*(ΩX)`. Chains go forward along `Ωi_X : ΩX → Ω𝓛₀X`; nothing pulls a chain back along `X → 𝓛₀X`. By 7.1 (`:2342–2344`) the Floer complex of a small `H` is the Morse complex of `−H`.

**Repair.** Replace the Check with: "it is the image under `(Ωi_X)_* : C_*(ΩX) → C_*(Ω𝓛₀X)` of the Morse cocycle of `−H` (Layer 5 item 2)."

## R08 (P3) — Garbled words from a text substitution in Layers 7.C and 7.T

**Location and repair.**

| Line | Text now | Should read |
| --- | --- | --- |
| `:2576` | "M1–M5. this roadmap owns" | "M1–M5. This roadmap owns" |
| `:2692` | "near0" | "near 0" |
| `:3243` | "application7.T" | "application 7.T" |
| `:3264` | "separate7.T.9" | "separate 7.T.9" |
| `:3314` | "the displayed this roadmap PDE" | "the displayed 7.C equation" |
| `:3314` | "capped7.C" | "capped 7.C" |
| `:3338` | "require7.T.5's" | "require 7.T.5's" |
| `:3362` | "scalar0" | "scalar 0" |
| `:3424` | "leading1/s" | "leading `1/s`" |

## Previous findings

- **R01, not repaired.** The description still says "Layer 1 items 1–6 are unchanged", and its merge-order paragraph still ends "#987 (AnalyticStableMaps) → **this pull request**". Written again as R01.
- **R02, not repaired.** The description still does not mention #963, whose head 62109eb still owns `arbitraryCWSerreSpectralSequence` (`:555`). Written again as R06.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** The worker's gate on this head passed every check, `build=0` included.
- **Dependency check.** `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives 7 `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244) and nothing else.
- **Signatures.** `#check @name` on all 7 declarations, in one scratch file elaborated once, matches the README.
  - The binders `ConnectedSpace Q`, `CompactSpace S`, `FiniteDimensional ℝ E`, `IsUnit d`, `¬ IsMulTorsion …`, `IsEmpty (HomologicalOrientation …)` and `LieGroup I₀ ∞ G` are all present.
  - No declaration lost a binder.
- **Padding probe.** On a scratch copy, `simp`, `rfl`, `infer_instance` and `exact?` each fail on all 7 statements ("could not close the goal"). Nothing is padding.
- **Headlines.**
  - Stated: mod-2 vanishing (1.4), Theorem 5.10 and Theorem A in its two cases, Theorem 5.15 and Theorem C (10.5), and the torus criterion (11.3).
  - Named as not statable, with the missing carrier: Theorems J, K, L and M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion.
  - Corollaries D and E are not headlines.

### Pinned declarations opened

| Declaration | File and line at the pin | What was checked |
| --- | --- | --- |
| `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` | `TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence.lean:167` | `∃ ε > 0, ∀ᵐ c'` in `(c − ε, c + ε)`, regular `c'` only |
| `…IsNondegenerate.exists_homeomorph_isMIntegralCurve_comp` | `TauCeti/Geometry/Symplectic/Hamiltonian/Characteristic.lean:143` | 6.4 input, under `[I.Boundaryless]` |
| `TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology` | `TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.lean:229` | `[PathConnectedSpace X]`, as the 10.4 Check says |
| `TauCeti.IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | includes path-connectedness |
| `IsMulTorsion` | `Mathlib/GroupTheory/Torsion.lean:56` | definition |
| `…IsNondegenerate.hasContractibleAlmostExistence_smul_iff` | (`#check`) | `a ≠ 0`, used for `ω ↦ −ω` |
| `TauCeti.HomologicalOrientation.mapFundamentalClass` | (`#check`) | integral, needs `finrank ℝ E = n` |

### Seeded sample: locators read at the text

| Target | Locator | Lines read | Result |
| --- | --- | --- | --- |
| 0.1 | Barraud–Cornea App. A; BDHO App. A | `barraud-cornea-serre` 541–555, 1875–1890; `bdho-morse-dg` 9053–9075 | wrong locator (R05) |
| 1.1 | Hatcher Thm 2A.1 | `hatcher-at` 7238–7258 | supported |
| 1.3 | Weibel 5.5.1(2), 5.5.10 | — | not verifiable |
| 3.1 | BDHO §6.4, (6.16) | `bdho-morse-dg` 2867–2895 | supported: §6.4 treats only `𝓕_i = η_i^*𝓕` |
| 5.1 | BDHO Thm 5.2.1, Props 5.2.6, 5.2.8, (5.12) | `bdho-morse-dg` 1461, 1638–1650, 1699 | supported |
| 5.3 | BDHO §5.3, Prop 10.6.1 | `bdho-morse-dg` 57, 1870, 7085–7095 | supported: closed oriented, equal dimension |
| 5.4 | BDHO Thm 7.2.1 | `bdho-morse-dg` 3101–3111 | supported |
| 6.4 | Tau Ceti; Hofer–Zehnder Ch. 4; source Cor E | `bdho-cotangent` 293–317 | Tau Ceti declaration supported; Hofer–Zehnder uncertified; Corollary E misstated (R02) |
| 7.4 | Salamon Thms 3.5–3.6, Lemmas 3.10–3.11; source Prop 3.22, Cors 3.24–3.25 | `salamon-lectures` 1162, 1202–1205, 1343–1395; `bdho-cotangent` 2120–2194 | supported, the `s ↦ −s` translation recomputed |
| 8.1 | source Prop 3.4, Def 3.5, Prop 3.6 | `bdho-cotangent` 1721–1746 | supported |
| 8.2 | source Def 3.7, Props 3.8–3.9 | `bdho-cotangent` 1786–1810 | supported (one Check, R07) |
| 8.4 | source Props 3.14–3.29 | `bdho-cotangent` 1915, 1943, 1947, 2066, 2072, 2082, 2109, 2131–2194, 2198, 2209, 2251, 2258 | supported |
| 9.4 | source Prop 4.1, Cor 4.17 | `bdho-cotangent` 2992–3046, 3772–3801 | supported; `η = σ ⊗ µ ⊗ õ` matches 9.1 |
| 10.4 | source Props 5.11, 5.13, Thm 5.10 | `bdho-cotangent` 4140–4175, 4229–4265 | locators supported; statement incomplete (R03) |
| 11.2 | Bott §1; Meinrenken Thm 12.4, Prop 12.5, Rem 12.6 | `bott-lie-groups` 92–93; `meinrenken-lie` 3466, 3526, 3537 | supported |

Also read this round:
- `meinrenken-lie` 2131–2140, Proposition 8.33, for 11.1.
- `bdho-cotangent` 688–699 (Theorem K, bounded below), 3755–3767 (its proof uses that hypothesis) and 4291–4330 (Theorem 5.15 and its proof).

### Adversarial table

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 boundary formula | `I`; `I²` | Massey `∂ι₁ = (1) − (0)`; `∂ι₂ = {1}×I − {0}×I + I×{0} − I×{1}`, equal to `∂(ι₁ × ι₁) = ∂ι₁×ι₁ − ι₁×∂ι₁` | holds |
| 1.1 Check | `S¹ ∨ S¹` commutator; `S¹ ⊔ pt` | `σ_{aba⁻¹b⁻¹} ∼ a + b − a − b = 0` by lines 7250–7255; `H₁ = ℤ` against `π₁(pt) = 0` | holds |
| 1.3 regrading | homological `(p, q)` | `(a, b) = (1 − 2p − q, p − 1)`; `d^r` target `(p − r, q + r − 1)` maps to `(a + r + 1, b − r)`, the page-`r+1` shift | holds |
| 1.3 regrading | cohomological `(p, q)` | `(a, b) = (2p + q + 1, −p − 1)`; target `(p + r, q − r + 1)` maps to `(a + r + 1, b − r)` | holds |
| 1.4 mod-2 vanishing (Lean) | `pt`; `M(ℤ/3, 2)`; `S³`; `K(ℚ, 2)` | trivial; `ℤ/3 ⊗ 𝔽₂ = 0`, `2·2 ≡ 1 (3)`; `H₃(S³; 𝔽₂) ≠ 0` excludes it; `ℚ` uniquely 2-divisible | holds |
| 3.1 Check | `f : S¹ → S¹`, degree 2 | `ℤ[t^{±1}]` over `ℤ[t^{±2}]` is free on `1, t` | holds |
| 5.1 (5.12) | index difference 2 | `(−1)^{ind x − ind z} = (−1)¹ = −1` | holds |
| 5.3 `f_*f_! = d·Id` | `z ↦ z²` on `S¹` | degree 0: `f_![pt]` is 2 points, `f_*` of them is `2[pt]`; degree 1: `f_*[S¹] = 2[S¹]` | holds |
| 5.4 | Hopf fibration | `E²` is `ℤ` at `(0,0), (2,0), (0,1), (2,1)`; `d²: E²_{2,0} ≅ E²_{0,1}`; abutment `ℤ` in degrees 0, 3 | holds |
| 6.4 / Corollary E | `S*Q`, `α = fα₀` | 6.4 gives Reeb orbits of `α₀` only; Corollary E needs closed characteristics of `{|p| = f}` | fails (R02) |
| 7.1 CZ normalization | `H = ε(q² + p²)/2` | `X_H = ε(p∂_q − q∂_p)`, `S = −εI`, `μ_RS = −1`, `CZ = +1 = n − ind` | holds |
| 7.4 / 8.4 estimate | `H + ε(s)`, `ε: 0 → δ` | general bound `∫ max(−ε′) = −δ`, attained | holds |
| 7.4 / 8.4 estimate | `H − ε(s)` | bound `+δ`, attained | holds |
| 7.4 / 8.4 estimate | bump `0 → 2δ → δ` | bound `ε(−∞) − ε(+∞) = −δ` | holds |
| 7.4 source translation | source `K_ϑ = K′_{1−ϑ}` | `E_src = ∫ max ∂_ϑK = ∫ max(−∂_ϑK′)` | holds |
| 7.5 Check | `a|z|²` | angular speed `2a`; 1-periodic orbits at `a ∈ πℤ`; `∫λ` over a Hopf circle is `π` | holds |
| 7.C.2c Check | `J_ε`, `B = diag(1, −1)` | `C = Bj − jB = [[0,−2],[−2,0]]`; `ω(v, J₁v) = 1 + 1 − 2 = 0`; `ω(J_εe₃, J_εe₄) = 1 − 4ε²` | holds |
| 7.C.3a dimension | general `(p, q, r)` | `Σ(2n + 2c₁(B_j) − 6) + 4r − 2n(r − 1) − (2n − ind p + ind q) = 2(Σc₁(B_j) − c₁(A_end)) − 2r` | holds |
| 7.C.6d Check | `1 − t` in `Λ` | `(1 − t)⁻¹ = −t⁻¹ Σ_{k≥0} t^{−k} = −Σ_{k≥1} t^{−k}` | holds |
| 7.T.7 Check | `b = βe^A` | `(1 + b)(1 + b)⁻¹` truncated at first order is `(1 + βe^A)(1 − βe^A) = 1 − β²e^{2A}` | holds |
| 8.1 Prop 3.4 | `|x| − |z| = 1` | sign `−1` (line 1732) | holds |
| 8.2 Check | `m_{x,y}` | Floer cocycle in `C_*(Ω𝓛X)`, Morse cocycle in `C_*(ΩX)`; the map goes `C_*(ΩX) → C_*(Ω𝓛₀X)` | wrong direction (R07) |
| 9.1 `η₀` | `ℝP²`, orientation-reversing component | `w = −1`: `η₀ = σ`; rotation loop monodromy `+1`; `ev₀^*o^{−1}` alone gives `−1` | holds |
| 9.3 Theorem K | `S³`, `𝓕 = ⊕ℤ[k]` | both sides `⊕_{p≥0} H_p(𝓛S³)`, with `H_p = ℤ` for `p = 0` and `p ≥ 2`, and `H₁ = 0` | holds |
| 9.3 truncation | `τ_{≥k}` | degree-0 chains `c` keep `Z_k` (since `dc = 0`); positive degrees raise degree | sub-DG module |
| 9.4 Check | `ℝP²` | `SH^{=0}_2 = H₂(ℝP²; o) = ℤ` against `H₂(ℝP²; ℤ) = 0` | holds |
| 10.1 Theorem L | `D²ⁿ`, `𝓕 = ℤ` | `SH = 0`, so `i_{W*}[W, ∂W] = 0` while `j_{U!}[W, ∂W] = [U, ∂U] ≠ 0` | holds |
| 10.2 Theorem M | `T^r`; `S²` | `Ω²T^r ≃ *`, so no `α`; for `S²`, `j_!` has degree `−2` on a degree-0 class, landing in `H_{−2} = 0` | holds |
| 10.4 Prop 5.11 | `S²`, `𝓕 = ℤ` | `ev₀ ∘ i_Q = id`, so `ker i_{Q*} = 0` while `k = 2` | fails (R03) |
| 10.4 Prop 5.11 | `S²`, `𝓕 = C_*(Ω𝓛₀S²)` | reduced `H₀(Ω²S²)` contains `ℤ` | holds |
| 10.4 Prop 5.11 | `S³`, `d = 2` | `H₁(Ω²S³) = ℤ`, not 2-torsion; `ℤ/4` is `2²`-torsion | holds |
| 10.5 Theorem 5.10 (Lean) | `π₃ = ℤ/3`, `d = 2`; `π₃ = ℤ/2`; `T³`; `S³`, `d = 1` | `a² = a⁻¹ ≠ 1`; `a² = 1` fails; every disjunct fails; `k = 0` with the generator | holds |
| 10.5 Theorem A (Lean) | `T² ⊔ T²` | `¬IsAspherical` holds there, but `ConnectedSpace Q` excludes it | holds |
| 10.5 Theorems 5.15 / C (Lean) | `ℝP²`; Klein bottle; `π₂ = ℤ/3`; `S = ℝP² ⊔ ℝP²` | doubling not onto `ℤ`; all `π_{ℓ≥2} = 0`; 5.15 accepts and C refuses; `(a, b) ↦ a + b ≠ 0` | holds |
| 10.5 non-orientable route | `ℝP⁴` | `Ω₀ℝP⁴ ≃ ΩS⁴`, `H₃ = 𝔽₂`, `π₄ = ℤ` | holds |
| 11.1 Killing form | `𝔲(n)`; `𝔰𝔲(2)` | `B(iI, iI) = −2n² + 2n² = 0`; `tr((ad e₁)²) = −2` | holds |
| 11.2 Cartan form | `SU(2) → SU(3)` | `6 tr(¼ diag(−1, −1, 0)) = −3`; own Killing form gives `−2`; sign `< 0` either way | holds |
| 11.3 torus criterion (Lean) | `T^r`; `SO(3)`; `r = 0`; `∏_ℕ S¹` | both sides true; `π₃ = ℤ`; trivial group; `(ℤ/2)^ℕ` uncountable, excluded by `LieGroup` | holds |

### Cross-roadmap citations resolved this round

- **Main (3090489).**
  - LieGroups Layers 4, 5, 5A and 6 (`RepresentationTheory/LieGroups:463, 518, 641, 673`); CompactGroups Layer 0 (`:205`).
  - HamiltonianReduction R1a.2 (`:97`); SymplecticGeometry S0 (`:84`).
  - MorseTheory M4, with `c(M)` at `:592`; SmoothBundlesConnections B6.0 (`:1306`, normal and strong-convexity radius bounds).
  - HeegaardFloer F2.6c and F2.6d (`:2915`, `:2975`); DGAInfinity Layer 5 (`:431`); MorseNovikov N1 and N4; RiemannianGeometry R2–R3 (`:322`, `:369`); CharacteristicClasses C3.2; PseudoholomorphicCurveAnalysis PH6–PH7 (`:1043`, `:1221`).
  - UniversalCovers (`Completed/`). AlgebraicTopology: R01.
- **Citations of DGFloer by roadmaps on main.** HamiltonianFloerOperations (7.C, 7.C.1, 7.C.2b), MorseNovikov (§7.C, §7.T) and GeometricCurrents (Layer 0) resolve at this head. The Layer 1 items 1–4 citations resolve through the numbering note.
- **Open heads.**
  - #1652, #1797, #1807, #1808 and #1854: R01.
  - #963: R06.
  - #1045, #1683 and #1506: R04.
  - DGFloerPartII (9de4d71): its citations of Layer 1 items 1, 2, 5 and 6, Layer 4 item 5 (through the numbering note), Layer 5 item 6, Layer 6 items 3–4 and Layer 10 items 2–5 resolve. Its §3.3 inherits R02.
  - AnalyticStableMaps (#987, 41557ba): §§3.2, 3.3, 3.4, 3.7 and 11.1 exist (`:581, 597, 609, 645, 998`).
- **Not raised: the AnalyticStableMaps gap.** The contract gap:genus-zero-stable-map-compactness names AnalyticStableMaps, which is not on main. It is not raised for three reasons:
  - Main's DGFloer already consumes AnalyticStableMaps M3 (main `:219, 240, 1157`), so the edge is not new.
  - The dependency check reports no edge.
  - The description orders #987 first.
- **Ownership.** FukayaTheory's scope leaves 7.G here and takes the general polygon operations. No other object found by these checks has two owners.

## Not verifiable

- Weibel, *An Introduction to Homological Algebra*, 5.5.1 and 5.5.10 (1.3): no legal copy in the cache.
- Serre 1951 and 1953 (1.2, 1.4): not in the cache.
- Hofer–Zehnder (6.4, 6.5), Struwe, Palais, Bröcker–tom Dieck, Massey and Whitehead: settled as uncertified, cited by locator.
- McDuff–Salamon, Abraham–Marsden, Chernoff–Marsden, Hartman, Hofer–Salamon, Floer–Hofer–Salamon and Piunikhin–Salamon–Schwarz: not in the cache this round, and outside the sample.

## Source issues

- **Gap** in bdho-cotangent at Corollary 4.17, p. 87 (line 3772): the source states the corollary for every DG local system and proves it from Theorem K, which assumes `H_*(𝓕)` bounded below (lines 688–689, 3763–3766); it should either add that hypothesis or extend Theorem K by truncation and colimits; affects a stated result.
- **Error** in bdho-cotangent at the proof of Theorem 5.15, p. 99 (lines 4322–4323): the source says the abelian groups `G` with `G ⊗ ℤ/2 = 0` form a Serre class; they do not, since `ℚ` lies in it and its subgroup `ℤ` does not; affects the proof.
