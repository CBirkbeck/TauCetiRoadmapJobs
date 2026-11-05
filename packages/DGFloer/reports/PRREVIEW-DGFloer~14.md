# Review of DGFloer (pull request #1798 at fc27fe2)

**Verdict:** accepted

Incremental re-review of the 92 changed lines of `TauCetiRoadmap/DGFloer/` since 1d67227 (README 56 lines, Suggested.lean 36 lines; 9 declarations). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty). The worker's gate at fc27fe2 passes every check, and a rerun this round agrees (below). No finding, new or carried.

## Previous findings

- R01 — repaired: `README.md:1746–1751` now reads "`CZ = n − ind_Morse(H, x) = ind_Morse(−H, x) − n`, as F1.4 writes it"; the Check at `:1765–1770` computes `X_H = ε(p ∂_q − q ∂_p)`, `S = −εI`, `CZ = −sign(S)/2 = +1`, and `−H` gives `−1`. Recomputed below; it agrees with HeegaardFloer F1.4 on main (`HeegaardFloer/README.md:2239–2248`: "`CZ=n−ind_Morse(H)=ind_Morse(−H)−n`", "`S=−εI` and `CZ=+1`") and with 7.C.0's `μ(x, const) = ind_Morse(H, x) − n` (`:1852, :1875`), which the repaired text now cites as the opposite sign of the same index. The added sentence that the complex of a `C²`-small `H` is the Morse complex of `−H` in degree `ind_Morse(−H) − n` is checked below.
- R02 — repaired: `README.md:2783–2790` instantiates the 8.6 Check on `X = T²` with indices `+1, 0, 0, −1` sent to `H₂, H₁ (rank 2), H₀`, agreeing with the 7.4 Check (`:1824–1828`: `FH_{−1}, FH_0, FH_1` of ranks `1, 2, 1`); `S²` is excluded with the reason `∫ ω ≠ 0`. The caveat that only the contractible-component statement is claimed for `T²` (not atoroidal) is correct: the source's Theorem J (bdho-cotangent lines 640–645) and Example 3.40 (lines 2746–2752) state the contractible-component comparison under asphericity, and 7.C.0 (`:1875`) records the standing comparison on `𝓛₀X` under asphericity alone.
- R03 — repaired: `README.md:1545–1552` states Corollary 2.13 for a map of Hurewicz fibrations over the closed orientable `Y` with `E` a closed orientable manifold, `j_![E] = [F]` by Remark 2.10, and `σ_*[F] ≠ 0`; this is bdho-cotangent lines 1237–1241 (the corollary and its proof) and 1209–1212 (Remark 2.10: for `E` finite-dimensional orientable the DG shriek map sends `[E, ∂E]` to `[F]`). The path–loop fibration over `S²` is recorded as the instance without `[E]`.
- R04 — repaired: `Suggested.lean:165–181` states `isAspherical_iff_double_loopSpace_homology` for a path-connected `Q : Type u` on Mathlib's `LoopSpace (LoopSpace Q q) (Path.refl q)`, with `TauCeti.IsAspherical Q q` on the left and path-connectedness plus vanishing of `H_n(−; ULift ℤ)` for `n ≥ 1` on the right; the docstring lists it among the stated headlines (`:23–24`); `README.md:2990–2997` names it, generalises Lemma 3.41 from closed manifolds to path-connected spaces with the source's route, and `:3005–3008` adds the two-point, `S²` and `S³` Checks. Statement and Checks are verified below.
- R05 — repaired: `Suggested.lean:73–78` states the mod-2 vanishing theorem for `Y : TopCat.{u}` with coefficients `ModuleCat.of ℤ (ULift.{u} (ZMod 2))` in `ModuleCat.{u} ℤ`; `README.md:906–908` says so ("for a space in an arbitrary universe, with the coefficient group `ZMod 2` lifted to that universe").

## Verified sound

**Scope.** The diff of `changes.md` (71 insertions, 21 deletions) was read in full together with every passage it cites or that cites it: 7.1, 7.4, 7.C.0 and its Checks (`:1810–1831, :1867–1895`), the conventions on asphericity and atoroidality (`:203–217`), 6.1's Checks (`:1623–1639`), 8.1–8.6, 10.4, worked example 6 (`:3180–3181`), the references rows for Lemma 3.41 and Propositions 5.11/5.13 (`:3238, :3247`), Layer 1 items 1–2 for the Hurewicz and weak-equivalence inputs of the generalised Lemma 3.41 (`:545–582`, and the supplier contract `:360` for Hurewicz in degrees `≥ 2`), and the module docstring. Diff outside the folder: none.

**Gate and dependency check.** Rerun this round:

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 240 roadmaps, 2309 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** A scratch copy of `Suggested.lean` (same `module` header and imports) with `#check @name` for all 9 declarations and the new theorem's `sorry` replaced by a one-tactic probe, run with `lake env lean` from the worktree root (5.6 s): the only warnings are the four `sorry`s; every elaborated type agrees with the worker's record and with its README statement.

| Declaration | `#check` type | Probe | Result |
|---|---|---|---|
| `isAspherical_iff_double_loopSpace_homology` | `∀ (Q : Type u_1) [TopologicalSpace Q] [PathConnectedSpace Q] (q : Q), IsAspherical Q q ↔ PathConnectedSpace (LoopSpace (LoopSpace Q q) (Path.refl q)) ∧ ∀ n, 1 ≤ n → Subsingleton (H_n(−; ULift.{u_1,0} ℤ))` | `simp [TauCeti.IsAspherical]` | error: `IsAspherical` has no exposed body, `simp` made no progress; not padding |
| `bijective_sq_homotopyGroup_of_mod_two_acyclic` | `∀ (Y : TopCat.{u_1}) [SimplyConnectedSpace Y], (∀ n, 1 ≤ n → Subsingleton (H_n(Y; ULift.{u_1,0} (ZMod 2)))) → ∀ n y, Bijective (a ↦ a ^ 2)` on `π_(n+2) Y y` | carried (previous report: `simp [Function.Bijective]` leaves the goal) | universe now `u_1`, as the README says |
| `TwistingCocycle`, `gradingInvolution`, `totalGrading`, `twistedDifferential`, `twistedDifferential_mem_totalGrading`, `twistedDifferential_sq`, `isAspherical_iff_exists_continuousMulEquiv_torus` | unchanged since 1d67227, types identical to the previous report's | carried | — |

Section binders: the new theorem carries `[TopologicalSpace Q] [PathConnectedSpace Q]` and `q` in its own signature; the mod-2 theorem carries `[SimplyConnectedSpace Y]` and `hY`. No `set_option`, no `lemma`, no `#eval`; `public import Mathlib` plus the two `TauCeti.*` modules of the previous head.

**Pinned declarations opened** (Mathlib f6090c7, Tau Ceti 358314d):

| Declaration | File at the pin | Checked |
|---|---|---|
| `TauCeti.IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59–60` | `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_(n+2) X x)`; no CW or Hausdorff condition, so the Lean statement's left side is exactly "`K(π, 1)`" in the README's sense |
| `LoopSpace`, notation `Ω` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86, :89` | `abbrev LoopSpace := Path x x` with the compact-open topology; `Ω` is `scoped[Topology.Homotopy]`, which the `open scoped … in` line provides |
| `AlgebraicTopology.singularHomologyFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | `C ⥤ TopCat.{w} ⥤ C`, universe-polymorphic, so `ModuleCat.{u} ℤ` with `ULift.{u} ℤ` and `ULift.{u} (ZMod 2)` is the right instantiation |
| loop-space homology, H-space Hurewicz, double loop space | none at 358314d (grep of `TauCeti/` for `LoopSpace (LoopSpace`, `Ω (Ω`, `singularHomology` + `LoopSpace`) | no native statement of Lemma 3.41; this roadmap is its owner |

**Cross-roadmap citations resolved.** HeegaardFloer F1.4 on main (`HeegaardFloer/README.md:2239–2248`) states the normalisation `−signature(S)/2`, `CZ = −μ_RS`, and for `ι_(X_H)ω = dH` the formula `CZ = n − ind_Morse(H) = ind_Morse(−H) − n` with the Check `H = ε(x²+y²)/2`, `S = −εI`, `CZ = +1`: the repaired 7.1 text and Check reproduce it. `roadmaps grep` for `isAspherical_iff_double` finds the name only in this pull request; the only other roadmap stating Lemma 3.41 is the other open revision of this same folder (#963, as `aspherical_iff_homology_loopSpace_loopSpace`), which is the same roadmap, not a second owner; DGFloerPartII at its open head declares no such name. The remaining citations are unchanged since 1d67227 and were resolved in the previous report.

**Seeded sample.** Of the sampled targets, only "10.4 The kernel of `i_{Q*}`" falls in the diff: Lemma 3.41 is bdho-cotangent lines 2753–2771 (stated for a closed manifold `Q`; the proof uses only `π_i(Ω²Q) ≅ π_{i+2}(Q)`, the abelian `π₁` of the H-space `Ω²Q` and weak contractibility, so the README's generalisation to path-connected `Q` is supported by the source's own proof, and the README says so rather than citing the lemma for the general statement), Proposition 5.11 at lines 4154–4161 as before. "5.2", "6.1", "8.1", "9.2", "9.4", "10.1" and the Layer 0–3 and 11 targets are untouched by the diff; their locators stand as in the previous report. Corollary 2.13 (5.5, touched) is at lines 1237–1241 with Remark 2.10 at 1209–1212.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-DGFloer~13), cited as "prev."; the rows below are recomputed on the changed statements. `J ∂_q = ∂_p`, `ω = dq ∧ dp`; "source" is bdho-cotangent.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 7.1 standing `CZ` of a constant orbit (changed) | `H = ε(q²+p²)/2` on `ℝ²`, `n = 1`; `−H` | `ι_X(dq∧dp) = a dp − b dq` for `X = a∂_q + b∂_p`, `dH = εq dq + εp dp`, so `X_H = ε(p∂_q − q∂_p)`; at `(1,0)` the velocity is `(0,−ε)`: clockwise. Linearisation `A = [[0,ε],[−ε,0]]`; `J(−εI) = [[0,ε],[−ε,0]] = A`, so `S = −εI`, `sign S = −2`, `CZ = −(−2)/2 = +1 = n − ind_Morse = 1 − 0`; `ind_Morse(−H, 0) − n = 2 − 1 = 1`. For `−H`: `S = +εI`, `CZ = −1 = 1 − 2`. The rejected formula `ind − n` gives `−1`, contradicting 7.C.0's `μ = ind − n = −1`, `CZ = −μ = +1` at the minimum of `S²` | holds; the two Checks of this roadmap and the supplier now agree |
| 7.1 "the complex of a `C²`-small `H` is the Morse complex of `−H` in degree `ind_{−H} − n`" (changed) | `T²` height function, `n = 1` | `u_s = J X_H = ∇H` for `t`-independent cylinders, so `H` increases from `x₋` to `x₊` and `𝒜_H = −H` decreases; `E = H(x₊) − H(x₋) ≥ 0`. Differential from `x₋` to `x₊` with `CZ(x₋) − CZ(x₊) = 1`, i.e. `ind_H(x₊) − ind_H(x₋) = 1`, i.e. `ind_{−H}(x₋) − ind_{−H}(x₊) = 1`: negative gradient lines of `−H` from the higher to the lower `−H`-index, the Morse complex of `−H`; degree `CZ = ind_{−H} − 1`, so `FH_k ≅ H_{k+1}(T²)`: `FH_{−1}, FH_0, FH_1` of ranks `1, 2, 1` | holds; agrees with HeegaardFloer F1.4 ("negative gradient trajectories of `−H`") and 7.C.0 |
| 8.6 Check on `T²` (changed) | height function: min, two saddles, max | `CZ = 1 − ind`: `+1, 0, 0, −1`; comparison `FH_k ≅ H_{k+1}`: `+1 ↦ H₂ (rank 1)`, `0 ↦ H₁ (rank 2)`, `−1 ↦ H₀ (rank 1)`; agrees with the 7.4 Check. `π₂(T²) = 0`: aspherical; identity `T² → T²` has `∫ω = 1`: not atoroidal, so only the `𝓛₀` statement is claimed (source Theorem J, lines 640–645, is stated under asphericity). `S²`: the identity has `∫ω ≠ 0`, and composing with a degree-one `T² → S²` gives a torus with `∫ω ≠ 0`, so `S²` is neither aspherical nor atoroidal | holds |
| Corollary 2.13 as restated (changed) | Hopf `S¹ → S³ → S²`, `σ = id`; path–loop fibration over `S²`; `B × pt → B` | Hopf: `E = S³` closed orientable, `j_![S³] = [S¹] ≠ 0`, so `[S³]` lives over `[S²]` (the 5.5 Check). Path–loop: `E ≃ pt`, `H₃(E) = 0`, no `[E]`: excluded by the hypothesis, as the README says. `B × pt`: `[E] = [B]`, `j_![B] = 1 ∈ H₀(pt)`, lives over `[B]` | holds; hypotheses now those of source lines 1237–1241 |
| `isAspherical_iff_double_loopSpace_homology` (new) | `Q = pt`; `S¹`; `S²`; `S³`; `ℂP^∞`; pseudocircle; two points | `pt`: both sides hold. `S¹`: aspherical; `π_k(Ω²S¹) = π_{k+2}(S¹) = 0`, weakly contractible, `H_n = 0` for `n ≥ 1`, path-connected. `S²`: `π₀(Ω²S²) = π₂(S²) = ℤ`, not path-connected; left side fails. `S³`: `π₂ = 0` so `Ω²S³` path-connected, but `H₁(Ω²S³) = π₁(Ω²S³)^{ab} = π₃(S³) = ℤ`; both sides fail. `ℂP^∞`: `π₀(Ω²) = π₂ = ℤ`; both fail. Pseudocircle (finite, non-Hausdorff, weakly `S¹`): aspherical, `Ω²` weakly contractible, singular homology of a point by weak invariance; both hold. Two points: excluded by `[PathConnectedSpace Q]`; the README Check records that `Ω²Q` at either point is a point while `Q` is not aspherical | holds; `π₀(Ω(Y,y)) = π₁(Y,y)` since `I` is locally compact, so `π₀(Ω²Q) = π₂(Q,q)` |
| 10.4 new Checks | two points; `S²`; `S³` | as in the previous row: `H₀(Ω²S²) = ℤ^{(ℤ)}` of rank `ℵ₀`; `H₁(Ω²S³) = ℤ` | hold |
| mod-2 vanishing at universe `u` (changed) | `Y = ULift S³ : Type 1`; `Y = pt : Type 1` | `H₃(ULift S³; ULift 𝔽₂) = 𝔽₂ ≠ 0`: excluded, and `π₃ = ℤ` is not 2-divisible; point: trivial both sides | holds; the universe-`0` rows of prev. carry over |
| Everything else (Layers 0–6, 7.C, 7.G, 7.T, 8.1–8.5, 8.7, 9, 10.1–10.3, 10.5, 11, Layer 4 Lean statements, torus criterion) | prev. | prev. rows, values as recorded there | unchanged |

**Headline inventory.** As in the previous report, with Lemma 3.41 moved from "statable and unlisted" to "stated": the docstring's stated list (`:15–24`) now has four entries and the unstatable list (`:26–48`) nine, each with its missing carrier; no headline is forced through a stand-in.

**Ownership.** The new Lean statement's object (asphericity of a space against the homology of its double loop space) was searched by object at the pins and across main and the open heads (`roadmaps grep`): no owner other than this roadmap and its other open revision. Ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- Unchanged since the previous report: Weibel §5.5, Massey Chapters II and VII, Whitehead Chapter I, Palais 1960, Hofer–Zehnder Chapters 1, 3, 4, Bröcker–tom Dieck Chapter V, Struwe 1990, Hofer–Salamon §4, Floer–Hofer–Salamon Lemma 6.5, Piunikhin–Salamon–Schwarz §4 (books or paywalled, cited by locator); BDHO Chapters 9–13 proofs not read line by line; Salamon's lectures cached as the 1997 preprint. None of the changed lines cites a text outside the cache or main.

## Source issues

- **Gap** in bdho-cotangent at Theorem J, printed p. 15 (line 640–641): the source says the DG local system of Theorem J comes from a Serre fibration; it should be a Hurewicz fibration, or a Serre fibration through the Moore-path replacement, since the module structure is built from a lifting function; affects a stated result.
