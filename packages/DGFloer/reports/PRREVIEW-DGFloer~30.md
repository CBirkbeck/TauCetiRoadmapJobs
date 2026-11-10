# Review of DGFloer (pull request #1798 at 2d41b2a)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines changed since 43731dc. All of them are in the last bullet of `## Downstream consumers` in `TauCetiRoadmap/DGFloer/README.md`, and nothing outside the folder changed. The gate passes, the dependency check reports no problem, and `Suggested.lean` (unchanged) elaborates with only its seven `sorry` warnings. The changed bullet is correct: each StringOrientation citation it adds resolves to an AlgebraicTopology stage that has the object.

The author part of the pull-request description was rewritten after the last review. Its new **Merge order.** paragraph repairs previous R02 in full and states the order previous R01 asked for. One problem is left. The dependency on #1807 is stated in a sentence the dependency tooling does not parse, so the generated `merge-order` block in the same description still says nothing must merge first. That problem is R01 below. It is in the description only: the README and `Suggested.lean` need no change.

| Id | Priority | Defect |
| --- | --- | --- |
| R01 | P3 | The order "#1807 first" is stated only in prose the tooling cannot read. The generated `merge-order` block contradicts it, and the pull request does not carry `awaiting-dependencies` (previous R01, partly repaired). |

## R01 (P3) — The order before #1807 is in prose the tooling cannot read, so the generated block still says this pull request can merge at once (previous R01, partly repaired)

**Location.** Two passages of the description contradict each other.
- The author's paragraph: "#1807 therefore merges before this pull request: merged alone, this one would leave the Serre spectral sequences with no owner."
- The generated `merge-order` block: "No open pull request must merge before this one; **this pull request** (#1798) can merge as soon as it is approved. The chain is the closure of the task list above".

**Claim.** The generated block builds its chain from a `<!-- depends-on -->` task list, and this description has none. The `awaiting-dependencies` label is computed from that block and from the prose, and the prose parser does not recognise "#1807 therefore merges before this pull request". As a result:
- the pull request has no `awaiting-dependencies` label;
- the block that approvers read says it can merge as soon as it is approved.

The danger is unchanged. If this pull request merged before #1807, main's AlgebraicTopology `:915` would still consume DGFloer Layer 1 item 2's Serre sequences, while this head (`README.md:166–171`) sends them to AlgebraicTopology Stage 5.5. The sequences would then have no owner.

**Witness.**
- The worker's own parser, `overlaps.declared_items`, returns `[]` on the current description.
- #1798's labels are `awaiting-review` and `roadmap-worker`.
- DGFloerPartII's description shows the form the chain reads: `<!-- depends-on -->`, then `- [ ] #1742 GeneralAlgebraicKTheoryPartII`. #1742 appears in its generated chain.

**Why P3 rather than P2.** The order is now stated correctly and in full: #1807 first, #1652 rebased onto it, #963 after this pull request. What is left is where it is declared.

**Repair** (description only; the folder needs no change). Insert above the `merge-order` block:

```text
<!-- depends-on -->
**Depends on** (suppliers still open; they merge first):
- [ ] #1807 AlgebraicTopology
<!-- /depends-on -->
```

If #1808 or #1854 lands the stages instead, name that pull request in the item. A smaller alternative is to delete "therefore" from the prose sentence.

**Test.** Both repairs were run through `declared_items` on a copy of the current description:
- with the block inserted, it returns `[(1807, 'AlgebraicTopology')]`;
- with only "therefore" deleted, it returns `[(1807, None)]`.

The paragraph's other numbers (#1652, #963, #1799) are not read as dependencies.

## Previous findings

- R01 — partly repaired: the prose now reads "#1807 therefore merges before this pull request"; the generated block still reads "No open pull request must merge before this one", and the parser finds no dependency. Written again as R01 (P3).
- R02 — repaired: the description reads "#963 … is rebased onto this pull request before it merges, consuming the ordinary Serre spectral sequences from AlgebraicTopology Stage 5.5 instead of owning them."

## Verified sound

### Gate, dependency check and Lean

- **Gate.** Rerun on 2d41b2a: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also records `build=0`.
- **Dependency check.** `depcheck: 234 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty (main 87976be). `git diff 43731dc..HEAD` touches only `README.md` (9 insertions, 7 deletions).
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244) and nothing else.
- **Suggested.lean.** The file has been unchanged since 334507b. It imports `Mathlib` and four Tau Ceti modules. The worker's `signatures.md` shows no lost binder. The `#check @name` comparison, the padding probe and the headline list stand from PRREVIEW-DGFloer~27:
  - stated: 1.4, Theorems 5.10/A, 5.15/C and 11.3;
  - named in the module docstring as not statable: Theorems J, K, L and M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion.

### The changed passage

**StringOrientation's citations** at #948 (07f09815). The supplier contract `:233–236` cites:
- Layer 1 item 2 for the normalized long exact sequence of a homotopy fibre and for the homology and multiplicative cohomology Serre spectral sequences over a CW base;
- Layer 1 item 4 for Hurewicz modulo a Serre class.

Its uses at `:321`, `:363`, `:570`, `:604`, `:1176–1181`, `:1200`, `:1290` and `:1323` fall within these. The new parenthetical (`README.md:4484–4486`) names exactly these objects.

**Each resolves through the numbering note.** The note is at `:151–181`, under Scope and ownership (`:35`); the supplier row is `:216`. Each object has an AlgebraicTopology stage at #1807 (da5e14d0) that owns it:
- the fibration homotopy long exact sequence "including components": `:1461`, with the homotopy fibres as the fibres of the mapping-path pullback at `:1529–1533` (Stage 5.5);
- the homological Serre spectral sequence over every path-connected CW base: `:1537` (Stage 5.5);
- the multiplicative cohomological sequence, with `E₂` pairing `(−1)^{qp′}` times the local cup pairing and the Leibniz rule: `:1594–1611` (Stage 5.5);
- Hurewicz modulo a class: `:2963` onward (Stage 8.8d), consuming `isKilledBySomePower`.

**"Whichever roadmap makes it."** `roadmaps grep` finds Layer 1 items 2–4 cited by 17 other open heads and on main. I read 13 contexts, and each maps to an entry of the note:

| Citation | Object cited | Stage |
| --- | --- | --- |
| TangentialBordism `:1510` | `ΩK(A, n) ≃ K(A, n−1)` | 8.8c, loop identification |
| StableHomotopyKTheory `:1401` | Serre-class carrier with the tensor, Tor and K(A,1) hypotheses | 8.8d |
| StableHomotopyKTheory `:1389` | CW approximation | 4.8 |
| StableHomotopyKTheory `:1433` | multiplicative Serre spectral sequence | 5.5 |
| StableHomotopyKTheory `:1058` | Serre filtrations and convergence | 5.5 and 5.0 |
| MordellLawrenceVenkatesh `:2065` | fibration exact sequence, component actions, relative-CW lifting | 5.5 |
| HomotopySpheres `:1300` | fibration sequence, Hurewicz modulo a Serre class | 5.5 and 8.8d |
| HomotopySpheres `:1230` | CW-approximation comparison | 4.8 |
| InverseGaloisAndArithmeticFundamentalGroups `:2672` | fibration exact sequence | 5.5 |
| AlgebraicTopologyPartII `:88` | CW approximation, exact sequence, Serre spectral sequences | 4.8 and 5.5 |
| ArithmeticStatisticsPartVIII `:901` | convergence for exhaustive, bounded-below filtrations | 5.0 |
| ChromaticHomotopyTheory `:14` | Hurewicz | 8.8d |
| RiemannianGeometry `:2472` | homology invariance under weak equivalence | 4.8, connected-map comparison |

**Agreement inside the README and with AlgebraicTopology.**
- The first bullet (`:4464–4465`) still records StringOrientation's Layer 11 consumption.
- DGFloer names StringOrientation only as a consumer (`:4464`, `:4484`), so there is no cycle.
- AlgebraicTopology at #1807 consumes nothing of Layer 1. Every DGFloer mention there (`:136–141`, `:1307–1308`, `:1628–1630`, `:2579`, `:3012`) has AlgebraicTopology supplying DGFloer.

**Remarks** (untouched text; no change requested).
- MorseTheory on main (`:885`) and ArithmeticStatisticsPartVIII (`:27`) cite Layer 1 item 3 for the generic filtered-complex spectral sequence itself. That sequence is Tau Ceti's `CochainComplex.spectralSequence` (`SpectralObject.lean:409`), consumed by 1.3 and by AlgebraicTopology Stage 5.0. The note maps only the regrading and the convergence theorems to Stage 5.0.
- The generated `roadmap-summary` block of the description still says that AlgebraicTopology and others "consume its fibrations, spectral sequences, homology comparisons and Serre classes". It has the same text as before the last review.

### The rewritten description, claim by claim

- **Old suppliers.** Main's DGFloer names TangentialBordism twice, HomotopySpheres 7 times and ImplicitAtlases 3 times; this head names none of them.
- **Layer 7.T contracts.** The rows at `:211–213` match the description: S0's mapping torus at `f⁻¹`, TaubesGromov not consumed, R1a.2's `Symp₀`.
- **AlgebraicTopology stages.**
  - #1807 defines Stages 4.8 (`:115`), 5.0, 5.5, 8.8c (`:2889`) and 8.8d (`:2963`).
  - #1808 (705e4f6a) and #1854 (48aba52f) carry the same stages.
  - #1652 (c610f76e) heads `:1795` "4.8 Compact generation and the pointed adjunction", and its `:2035` consumes DGFloer Layer 1 item 2.
- **#963 (62109eb9).** It owns `arbitraryCWSerreSpectralSequence` (`:555`) and `arbitraryBaseSerreSpectralSequence` (`:566`), and it builds a cubical Serre spectral sequence directly (`:223`).
- **Main.** AlgebraicTopology `:915` consumes DGFloer Layer 1 item 2.
- **DGFloerPartII's description** reads "merges after DGFloer's revision #1798".

### Library declarations opened at the pinned Tau Ceti

- `CochainComplex.filtrationFunctor`: `Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304`.
- `CochainComplex.spectralSequence`: same file, `:409`.
- `spectralSequenceFirstPageXIsoCokernel`: same file, `:425`.
- `spectralSequence_first_page_d_eq`: `FirstPage.lean:89`.
- `filtrationAbutmentIso`: `Convergence.lean:51`.
- `filtrationFunctorMap`: `Naturality.lean:83`.
- `TauCeti.ComplexTower`: `Algebra/Category/ModuleCat/Tower/Milnor/Basic.lean:106`.
- `TauCeti.fibrationLocalSystem`: `AlgebraicTopology/DGLocalSystem/Fibration.lean`, defined for any continuous map through the Moore-path replacement.

### Sources

- The changed passage has no locator, and the README flags none as unverified.
- None of the seeded targets falls in the changed passage. For the five sampled targets that earlier tables had no row for (1.6, 4.1, 5.2, 6.0, 8.6), rows were computed this round (below).
- 8.6's locators were re-read in `bdho-cotangent`:
  - Proposition 3.36: line 2595.
  - Theorem 3.37: lines 2617–2622. It is stated for atoroidal `X`; the README states only the contractible component, under asphericity, citing 7.C.0.
  - Definition 3.38: line 2707.
  - Theorem 3.39: lines 2713–2720.
  - Theorem J: lines 640–648.

### Adversarial table

Rows computed this round, for the changed statement and the sampled targets without earlier rows:

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Downstream bullet: StringOrientation's Layer 1 citations resolve to AlgebraicTopology | StringOrientation `:233–236` against #1807 | 4 cited objects: exact sequence → 5.5 `:1461`; homological sequence → 5.5 `:1537`; multiplicative sequence → 5.5 `:1594–1611` (`d_r(uv) = d_r(u)v + (−1)^{p+q} u d_r(v)`); Hurewicz mod C → 8.8d `:2963`. None is left unmapped. | holds |
| The class StringOrientation uses (groups killed by some power of 2) | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | The ends are killed by `2` and the middle by `4 = 2²`, so the class contains the extension. Under a fixed exponent `2`, `ℤ/4` falls out, as 8.8d's remark says. | it is a Serre class |
| "whichever roadmap makes it" | 13 citation contexts (table above) | 13 of 13 map to a numbering-note entry | holds |
| 1.6 local sections | `v_z = ρ(z − y)` with `ρ = 1` on convex `U`; two points; `S¹ ⊔ S²` | The flow line `y + t(z − y)` has velocity `z − y = v_z` in `U`, so time 1 gives `z`, and `s(z)(x₀) = φ_z(g x₀) = z`. Two points: `O = M`, `H = {id}`. `S¹ ⊔ S²`: `O = S¹`, and the fibre over `S²` is empty. | holds |
| 4.1 Brown resolution Checks | `S¹`; zero cocycle; `S²` | `S¹`: `H₀ = A[t^{±1}]/(t − 1) = A` and `H₁ = ker(t − 1) = 0`. Zero cocycle: `H₀ = A[t^{±1}] ≠ A`. `S²`: right multiplication by `a` on `H_*(ΩS²) = A[a]` is injective with cokernel `A` in degree 0. | holds |
| 5.2 cocycle on `S¹` | height function, 2 critical points | `d = 1 − t` over `ℤ[t^{±1}]` gives `H₀ = ℤ`, `H₁ = 0`, which is `H_*(ℝ)`; the wrong `d = 0` gives `ℤ[t^{±1}]` in degrees 0 and 1 | holds |
| 6.0 conventions | `(ℝ², dq ∧ dp)`, `ι_X ω = df` | `X_q = −∂_p`, `X_p = ∂_q`, `{q, p} = 1`; `X_H = p∂_q − q∂_p` with flow `(q cos t + p sin t, −q sin t + p cos t)`; `H_t = tq` gives `p − (t² − s²)/2` | holds |
| 6.0 weak against strong | `V = c₀`, `f = a(q)` with `a ∈ ℓ¹` | `ω♭(0, −a) = df`, so `X = (0, −a)` exists; `ω♭` misses `(q′, β) ↦ Ψ(β)` for `Ψ ∈ ℓ^∞ ∖ c₀` | holds |
| 8.6 grading | `T²`, `n = 1`, height function | Morse indices `0, 1, 1, 2` give `CZ = n − ind = 1, 0, 0, −1`, which go to `H₂`, `H₁` (rank 2) and `H₀` | holds |

Rows carried from PRREVIEW-DGFloer~29 (7.5, untouched since):

| Statement | Instances | Values computed (PRREVIEW-DGFloer~29) | Result |
| --- | --- | --- | --- |
| 7.5 zero part and long exact sequence, `L` trivial | `W = D²ⁿ` | `SH_* = 0`; `SH^{=0}_k = ℤ` iff `k = n`; `SH^{>0}_k = ℤ` iff `k = n + 1` | holds |
| 7.5 zero part, contractible sector | `D*S¹`, `n = 1` | `SH^{=0}_k = ℤ` for `k = 0, 1`; `SH^{>0} = 0` there | holds |
| 7.5 zero part, sign system | `D*S¹`, monodromy `−1` | `SH^{=0}_0 = ℤ/2`, `SH^{=0}_1 = 0`; dropping `i_W^*` gives `ℤ, ℤ` | holds |
| 7.5 transfer | `ι = id_W`; `D²ⁿ ⊆ W` | `ι_! = id`; `SH_*(D²ⁿ; ι^*L) = 0`, so `ι_! = 0` | holds |
| 8.7 degree-0 Check | `𝓕 = L[0]` | `E²_{p,q} = 0` for `q ≠ 0`, so `SH_*(W; 𝓕) = SH_*(W; L)` | holds |

Rows carried from PRREVIEW-DGFloer~28:

| Statement | Instances | Values computed (PRREVIEW-DGFloer~28) | Result |
| --- | --- | --- | --- |
| 6.4 Stokes sign | `ι_Z ω = λ_Z`, `dλ_Z = ω` | `ι_Z(ωⁿ) = n λ_Z ∧ ω^{n−1}`; positivity forces outward `Z` | holds |
| 6.4 `Φ` open embedding | `dim((0, ∞) × Σ) = 2n` | injective immersion in equal dimension | holds |
| 6.4 `Φ^*λ_Z = r α₀` | `S*Q`, `Z = p∂_p` | `Φ(r, (q, p)) = (q, rp)`; `L_Z λ_Z = λ_Z` | holds |
| 6.4 rescaling | `α = −α₀`; `α = ½α₀` | multiply by `−2`, by `4`: `f = 2` both | holds |
| 6.4 `{F_α < 1} = U_α` | outward, `f_α > 1` | `{r < f_α} = {r/f_α < 1}` | holds |
| 6.4 negative controls | one shell; two shells | `Φ(4, x) = Φ(1, 4x)`; `Φ(7/4, S*_2) = S*_{7/2}` | excluded |
| 6.4 last Check | outer `S*_2S³` | connected, degree 1, outward | holds |
| CG4 sign dictionary | `ω = −dλ` against `ω = dλ_Z` | `λ = −λ_Z` | holds |
| 7.5 conformal factor | `ρ = 0` | `ι^*θ' = θ + d(function)` | holds |
| Scope sentence | Def 1.7, Thms B, G, H, I | source lines 384, 415, 424, 430 | holds |

Rows carried from PRREVIEW-DGFloer~27, and for sampled targets from ~22, ~23 and ~26 (untouched since):

| Statement | Instances | Values computed (cited report) | Result |
| --- | --- | --- | --- |
| 0.1 boundary formula | `I`; `I²` | `∂ι₁ = (1) − (0)`; four signed edges (~27) | holds |
| 1.1 Check | `S¹ ∨ S¹`; `S¹ ⊔ pt` | commutator `∼ 0`; `H₁ = ℤ` against `π₁(pt) = 0` (~27) | holds |
| 1.3 regradings | `(p, q)`; `G_t = F^{−t}` | `(a, b) = (1 − 2p − q, p − 1)`; `a + b = p + q` (~27) | holds |
| 1.3 negative control | `F_p C = C` | every `E^r = 0`, `H(C) ≠ 0` (~27) | holds |
| 1.4 mod-2 vanishing (Lean) | `pt`; `M(ℤ/3, 2)`; `S³` | trivial; `2·2 ≡ 1 (3)`; `H₃(S³; 𝔽₂) ≠ 0` excluded (~27) | holds |
| 1.5 sign | `T²`, `N = S¹ × {y₀}` | `[T²] ⌢ β = −a = (−1)^{1·1} i_*[N]` (~27) | holds |
| 2.1 rescaling | `(L, γ) ↦ (L, γ(L·))` | inverse continuous for `L > 0` (~27) | holds |
| 2.3 Checks | `Map_*(S², S²)`, `Ω²Tⁿ`, `Ω²S³` | `π₀ = ℤ`; contractible; `H₁ = ℤ` (~23) | holds |
| 3.1 Check | degree-2 cover of `S¹` | `ℤ[t^{±1}]` free on `1, t` over `ℤ[t^{±2}]` (~26) | holds |
| 5.3 `f_*f_! = d·Id` | `z ↦ z²`; `T² → S²` | `f_*[S¹] = 2[S¹]`; `f_!f_*` kills `H₁(T²)` (~27) | holds |
| 5.4 Check | double cover of `S¹` | `H₀ = ℤ`, `H₁ = ℤ` (~27) | holds |
| 5.6 cut | `Q = S¹`, `r = 1` | `𝓛¹ = S¹`; duration `1` gives `0 ≠ 1` (~27) | holds |
| 6.1 Checks | `p²/2`; `(|q|² + |p|²)/2` | `ι_{p∂_q}(dq ∧ dp) = p dp`; eigenvalues `e^{±i} ≠ 1` (~27) | holds |
| 6.2 Liouville ball | `D²ⁿ` | `d(½(q dp − p dq)) = dq ∧ dp`; flow `e^{t/2}z` (~23) | holds |
| 6.3 magnetic translation | `σ = x dy` | `Ψ'^*λ_can = λ_can − π^*σ` (~27) | holds |
| 6.4 Corollary E Check | `S*Q`, `α = fα₀` | `|P| = f`, `K = 1` (~27) | holds |
| 7.1 CZ normalization | `ε(q² + p²)/2` | `CZ = +1 = n − ind` (~27) | holds |
| 7.3 orientations | height on `S¹` | `ℤ, ℤ` against `ℤ/2, 0` (~22) | holds |
| 7.4 Checks | `T²`; `H ± ε`, bump | ranks `1, 2, 1`; `ε(−∞) − ε(+∞)` (~27) | holds |
| 7.5 `a|z|²` Check | unit circle | `X_H = 2a(p∂_q − q∂_p)`; `∫ λ = π` (~27) | holds |
| 8.2 Check | small Morse `H` | Morse cocycle of `−H` (~27) | holds |
| 8.7 Check | `⊕ ℤ[k]` on `D²ⁿ` | Künneth with `SH(D²ⁿ) = 0` gives `0` (~27) | holds |
| 9.1 `η₀` | `ℝP²` | `η₀ = σ`; rotation loop `+1` (~26) | holds |
| 9.3 truncation, S³ Check | `τ_{≥k}`; `⊕_{k≤−m} ℤ[k]` | degree `n` is `⊕_{0≤p≤n−m} H_p(𝓛S³)` (~27) | holds |
| 9.4 Check | `ℝP²` | `H₂(ℝP²; o) = ℤ`, `H₂(ℝP²; ℤ) = 0` (~27) | holds |
| 10.1 Theorem L | `D²ⁿ`, `𝓕 = ℤ` | `i_{W*}[W, ∂W] = 0`; `j_{U!}[W, ∂W] ≠ 0` (~27) | holds |
| 10.2 Theorem M Checks | `T^r`; `S²` | isomorphism; `H_{−2} = 0` (~27) | holds |
| 10.4 Prop 5.11, third case | `S²`; `ℤ/4`, `d = 2` | kernel `0` or free of infinite rank; `ℤ/4` not 2-torsion (~27) | holds |
| 10.5 Thms 5.10, 5.15, A, C (Lean) | `π₃ = ℤ/3`; `ℝP²`; Klein bottle; `ℝP⁴` | `a² = a⁻¹ ≠ 1`; `H₃(ΩS⁴; 𝔽₂) = 𝔽₂` (~27) | holds |
| 11.1 Killing form | `𝔲(n)`; `𝔰𝔩(2, ℝ)` | `0`; `8 > 0` (~27) | holds |
| 11.2 Cartan 3-form | `SU(2) → SU(3)` | `−3`; `−2` (~27) | sign `< 0` |
| 11.3 torus criterion (Lean) | `T^r`; `SO(3)`; `∏_ℕ S¹` | both sides true; `π₃ = ℤ`; excluded by `LieGroup` (~27) | holds |

### Overlaps and ownership

- **Overlap check.** It lists:
  - #963 as the only other open pull request changing this roadmap; the description now orders it after this one (R02 repaired);
  - no id this README cites that an open pull request drops;
  - no id that only an open revision defines (it does not read "Stage 4.8"-style ids; R01 rests on the reading above);
  - no dropped id that others cite.
- **Ownership against open pull requests.** It was checked in earlier rounds and not searched again: the change adds no construction, only a consumer name.

## Not verifiable

- Nothing new in the changed passage, which has no locator.
- Carried from the previous reports:
  - Weibel 5.5.1(2) and 5.5.10 (1.3);
  - Serre 1951 and 1953 (1.2, 1.4);
  - the texts settled as uncertified: Palais 1960 (1.6), Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead and Hofer–Salamon.

## Source issues

- none
