# Review of FormalConnectionsOpers (pull request #1056 at 0694b63)

**Verdict:** needs changes

Incremental re-review of the 98 lines changed since 19aacea (the ReductiveGroups Scope bullet, the `laurentSeriesCoefficientAlgebra`, `AlgHom.mapValue` and `Gluing/Basic.lean` supplier bullets, the §2.2 symbol Check, §3A.3's last paragraph and `*Needs:*` line, the §3A.5 lattice Check, §4.3's lower dictionary, compact-form paragraph, `*Needs:*` line and Layer 4 Dependencies, the §6.4 gauge Check, the ReductiveGroups Layer 11 and SchubertGeometry consumer bullets; in `Suggested.lean` the `module` header and the two `AlgHom.mapValue` bodies), of everything that cites them, and of the gate. The pins are unchanged since the previous review (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The worker's gate at this head: every check `0`, `build=0 OK`. `lake env lean` on the head file: the three `declaration uses sorry` warnings (lines 71, 130, 160), nothing else, exit `0`. Dependency check run here: `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. All nine findings of the previous review are repaired; one residue of the ownership repair remains (R01 below).

## R01 (P3) — §4.3 consumes from ReductiveGroups Layer 3A.5 a Lie-group dictionary that only the open ReductiveGroups revisions state, and the pull request names none of them

Location: `TauCetiRoadmap/FormalConnectionsOpers/README.md` lines 1417–1422 ("consume ReductiveGroups Layer 3A.5's complex comparison on `G(ℂ)`: … the holomorphic multiplication, unit and inverse, hence the complex Lie-group structure, and the chart-at-the-identity identification of its Lie algebra with Layer 2's tangent Lie algebra"), 1434–1435 ("prove that the composite is Layer 3A.5's chart-at-the-identity identification"), and the Scope bullet at lines 78–84.

Claim: ReductiveGroups Layer 3A.5 states the complex Lie-group structure on `G(ℂ)` for every affine algebraic group `G` over `ℂ`, with the identification of its Lie algebra with Layer 2's tangent Lie algebra by the chart at the identity.

Witness: on main, `TauCetiRoadmap/ReductiveGroups/README.md` lines 335–372 (3A.5 "Properness and the complex comparison") apply ComplexComparisonPartII C−1.1's smooth interface to the closed orbit, construct the orbit map `G(ℂ) → O_x(ℂ)` and the homogeneous-space identification, and mention no Lie algebra, tangent space or chart at the identity of `G(ℂ)`; main's Layer 11 (line 1964) still takes "the lower smooth/holomorphic dictionary" from this roadmap's F4.3. The sentence "`G(ℂ)` is a complex Lie group whose Lie algebra is identified with Layer 2's tangent Lie algebra by the chart at the identity" exists only at the open heads of #1676 (ReductiveGroups README line 884, with lines 19–24 "FormalConnectionsOpers §4.3 consumes the complex Lie-group dictionary on `G(ℂ)` and transports it to the Hopf-point carrier"), #1808 (line 855) and #1797 (line 1230); #1854's ReductiveGroups keeps main's wording. The description names ReductiveGroups only as #1011, which is not among the open pull requests; the merge-order paragraph lists no ReductiveGroups revision.

Repair: the README text is the right one at those heads and needs no change. Name in the pull-request description (its merge-order paragraph, or one sentence beside it) the ReductiveGroups revision whose Layer 3A.5 §4.3 consumes (#1676, with #1808 and #1797 carrying the same passage), so that the intake merges it first; until one of them is on main, main's Layer 3A.5 has no chart-at-the-identity identification for the composite of lines 1434–1435 to be compared with.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 113 and 119 read `AlgHom.mapValue (H := H) …`, README line 209 names `AlgHom.mapValue`; the head file elaborates with only the three `sorry` warnings.
- R02 — repaired: lines 78–84 and 1417–1422 say ReductiveGroups Layer 3A.5 owns the complex Lie group `G(ℂ)` and §4.3 "owns only their transport to the native Hopf-point carrier"; the one-owner resolution matches the three open ReductiveGroups heads, and its residue is R01 of this report.
- R03 — repaired: line 1272 reads "would contain the sublattices `t^k ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁` of `ℂ[[t]]²`, of colength `k`, for every `k`".
- R04 — repaired: the comparison sentence is gone from §3A.3 (line 1176 ends "ReductiveGroups Layers 4, 7, 9; RootSystems") and stands in §4.3's compact-form paragraph (lines 1522–1525); §4.3's `*Needs:*` and Layer 4's Dependencies name §3A.3; Layer 3A's Dependencies name Layers 1–3 only.
- R05 — repaired: line 653 reads "`1 ⊗ f = f + f′ξ + f^[2] ξ²` with `f^[2]` the second Hasse derivative `x^n ↦ binom(n, 2) x^(n−2)`".
- R06 — repaired: line 181 names "the local instance `laurentSeriesCoefficientAlgebra`"; all nine Lean names now occur in the README.
- R07 — repaired: line 2033 reads "whose gauge `−3t⁻⁴x` has order `−4`".
- R08 — repaired: line 229 reads `TauCeti/Geometry/Manifold/Gluing/Basic.lean`, where both declarations are at the pin.
- R09 — repaired: lines 2482–2484 add the SchubertGeometry bullet, matching SchubertGeometry README line 111 on main ("for every separated smooth finite-type ℂ-scheme … identify its independently constructed manifold with the smooth carrier of ComplexComparisonPartII's same analytification").

## Verified sound

**Gate and direction.** Worker's gate at 0694b63: all counters `0`, `build=0 OK`. My dependency check: `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for this roadmap. The new `*Needs:*` entries (§4.3 → §3A.3; "ReductiveGroups Layers 0–4 (3A.5 included)") point to an earlier layer of this roadmap and to a roadmap on main. DFS over the `*Needs:*` lines after the move: §4.3 → §3A.3 → {§3A.1, ReductiveGroups, RootSystems}; §3A.3 no longer needs §4.3; Layer 3A's Dependencies (lines 1347–1348) name Layers 1–3 and no Layer 4; "How to read the build" (lines 379–393) builds Layer 3A before Layer 4. No outside-folder change.

**Lean form and elaboration.** `Suggested.lean` now opens with `module` then `import Mathlib` and the two `TauCeti.*` imports, which exist at `2fd255d9` with built object files; no `set_option`, no `lemma`, no sorry'd data, one module docstring naming the headlines not statable. `lake env lean` on the head file: warnings only at 71, 130, 160 (`sorry`), exit `0`, 12 s. The worker's `signatures.md` at this head lists the nine elaborated types; compared with the README statements they are unchanged from the previous review's `#check @name` probe, with the hypotheses in scope (`[Algebra ℚ R]` on `regularGauge_constantCoeff_bijective`, `reductiveCommHopfAlgProperty ℂ H` on `formalLoop_eq_polynomial_mul_positive`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]` and `IsDifferentialModuleMap F D` on `exists_cyclicVector`); the only textual change is the namespace prefix of the two bodies. At the pin, `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean` opens `namespace AlgHom` at line 64 and closes it at line 237 with no enclosing `TauCeti`, so `AlgHom.mapValue` is the full name. The one-tactic padding probes were not re-run: the three theorems are byte-identical to the heads where they were run and the pins are unchanged.

**Pinned declarations opened at `2fd255d9`.** `TauCeti/Geometry/Manifold/Gluing/Basic.lean` lines 40–41 (`TauCeti.chartedSpaceOfIsOpenEmbedding`, `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`); the `Gluing/` directory holds `Basic.lean`, `Double.lean`, `GlueData.lean`, `Map.lean`, `ModelChange.lean`, `OpenSubsets.lean`, `Reindex.lean` and no `Gluing.lean`. `AlgHom.mapValue` as above. The other supplier bullets are unchanged since the previous review, which resolved them at these pins.

**Cross-roadmap citations resolved.** ReductiveGroups on main: Layer 3A.5 at lines 335–372 (orbit charts from C−1.1, orbit map, homogeneous-space identification), Layer 11 at line 1964 ("The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here"); at #1676: lines 19–24, 881–887 (3A.5 owns the complex Lie group `G(ℂ)` and its Lie-algebra identification; "consumed by Layer 11 and by FormalConnectionsOpers §4.3"), 3351–3352 and 3720–3722 ("FormalConnectionsOpers consumes Layers 0–9, Layer 3A.5's complex Lie-group dictionary on `G(ℂ)` (in its §4.3) … Layer 11 consumes no target of FormalConnectionsOpers"); #1808 line 855 and #1797 line 1230 carry the same 3A.5 sentence (read through `roadmaps show --pr`). The rewritten Scope bullet (lines 78–84) and §4.3 (1417–1441) agree with those heads: one owner, ReductiveGroups 3A.5, and §4.3 owns the native-carrier transport, the Maurer–Cartan trivialization and rank, the germ-to-counit comparison with its bracket, the realification comparison and the exponential chart. The Downstream consumers bullet on ReductiveGroups Layer 11 (lines 2479–2481) is true of main's Layer 11 (line 1964) and vacuous at #1676's (line 3722, which consumes nothing from this roadmap): a consumer note, not a supplier citation, so no finding. SchubertGeometry on main line 111: separated smooth finite-type `ℂ`-scheme, independently constructed manifold compared with ComplexComparisonPartII's smooth carrier, specialized to flag and word objects: the new bullet (2482–2484) states exactly that. NilpotentOrbits on main line 60 consumes "Maurer–Cartan/cotangent rank, fixed complex atlas, tangent/counit derivation bracket comparison" from §4.3: still what §4.3 owns. ComplexKahlerGeometry line 475 remains a supplier (K4 into F2.4), rightly absent from the consumers.

**Ownership against open work.** Searched by object (complex Lie-group structure on `G(ℂ)`, Lie-algebra/counit identification) with `roadmaps grep` over the 466 open heads and main: owners are ReductiveGroups 3A.5 at #1676, #1808, #1797 and this roadmap's transport only; #1854's ReductiveGroups keeps main's 3A.5 wording. The polynomial/formal loop comparison, opers, Drinfeld–Sokolov reduction, Tate modules, the isomonodromy groupoid and the cyclic-vector theorem were not touched by the diff; the previous review's search stands (the recorded PadicDifferentialEquationsAndRigidCohomology duplicate of the cyclic-vector theorem is settled in the Downstream consumers section).

**Headline theorems** (Summary, lines 10–19): unchanged by the diff. Stated: `regularGauge_constantCoeff_bijective`, `formalLoop_eq_polynomial_mul_positive`, `exists_cyclicVector`; named in the docstring as not statable: the zero-curvature/bracket equivalence, Drinfeld–Sokolov normal form and Chevalley–Kostant restriction, intrinsic opers, Frenkel–Zhu with torsor triviality, the Poisson structure and the isomonodromy algebroid. The pins are unchanged, so no carrier for these appeared.

**Sources.** No sampled target (F2.1, F2.2, F3.1–F3.4, F5.2, F6.1–F6.5, F7.4, F8.1, F8.4) has a changed locator: the changed Checks of §2.2 and §6.4 cite no source in the changed lines, and §3A.3, §3A.5 and §4.3 are not sampled and cite no new source. The locators of the sampled targets were read in the earlier rounds and are unchanged at this head.

**Adversarial table.** Rows marked "(r4)" carry forward the previous report's rows for statements the diff leaves untouched, with their computed values; the last eight rows are new, for the changed passages.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `Res(f′dt) = 0`, `d(t⁻¹)` (r4) | `f = Σ f_j t^j`; `t⁻¹` | `t⁻¹` coefficient of `f′` is `0·f₀ = 0`; `d(t⁻¹) = −t⁻²`; `Res(t⁻¹dt) = 1` | as stated | none |
| §1.1 `⊗^!` witness (r4) | `V = W = k((t))`, `Σ t^n ⊗ t^(−n)` | in `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only `n < M` survive; one-sided completion keeps all `t^(−n)` | lies in `⊗^!` only | none |
| §1.2 inverse of `t + t²` (r4) | `ψ = t − t² + 2t³` | `ψ + ψ² = t + O(t⁴)`; truncation `t − t²` gives `t − 2t³ + O(t⁴)` | as stated | none |
| §1.2 contravariance (r4) | `φ = 2t`, `ψ = t + t²` | `σ_φσ_ψ(t) = 2t + 4t²`; `σ_ψσ_φ(t) = 2t + 2t²` | as stated | none |
| §1.2 chain rule, residue (r4) | `f = t⁻¹`, `φ = t + t²`; `φ = t²` | `(f′∘φ)φ′ = −t⁻² + 1 + O(t)`, `Res = 1`; `Res(t⁻²·2t dt) = 2` | unit hypothesis needed, as stated | none |
| §1.2 `Aut(O)` semidirect product (r4) | `φ = at`, `Aut⁺` | `φ′(0) = a`; `Der⁺ = t²ℂ[[t]]∂` | as stated | none |
| §1.3 elementary module, lattices (r4) | `R((t))`, `U = t^M O ⊂ L = t^N O` | `L/U` free of rank `M − N`; `R[t⁻¹]` not open | as stated | none |
| §1.3 residue annihilator (r4) | pairings `i + j = −1`, `i + j = 0` | annihilator of `{i ≥ 0}`: `{j ≥ 1} = tV^∨[[t]]` | as stated | none |
| §1.3 topological nilpotence (r4) | `t`, `t⁻¹`, `0` | `t^n O ⊂ t^N O` for `n ≥ N`; `t^(−n)O ⊄ O`; `0` not injective | as stated | none |
| §2.1 negative control (r4) | `A = k[x,y]/(x,y)²`, `∇ = d + x dy` | curvature `dx∧dy ≠ 0`; `xξ(y) = 0`, `∇_ξ = ξ` | hypothesis needed, as stated | none |
| §2.1 dual sign (r4) | `∇ = d + a dx` | `∇^∨ = d − a dx`, `∇ ⊗ ∇^∨ = d`; wrong sign gives `d + 2a dx` | as stated | none |
| §2.2 Atiyah sequence exactness (r4) | `M = A`; general `M` | `0 → I/I² → P¹(A) → A → 0` splits on the right by the jet, stays exact after `⊗_{A,right} M` | as stated | none |
| §2.2 splitting criterion Leibniz (r4) | `∇s = 1⊗s − σ(s)` | `∇(as) = a∇s + da ⊗ s` with `da ↦ 1⊗a − a⊗1` | as stated | none |
| §2.2 first Check (r4) | `A = k[x]`, `σ(f) = f(1⊗1 − aξ)` | `∇f = (f′ + af)dx`; wrong identification gives `(−1 + ax)dx` | as stated | none |
| §2.2 jet is not `A`-linear (r4) | `s = 1` | `1⊗x − x(1⊗1) = ξ ≠ 0` | as stated | none |
| §2.2 char `p` PBW failure (r4) | `k = 𝔽_p`, `(d/dx)^p` | `(d/dx)^p x^n = 0`; image of `U(A, Der)` has orders `≤ p − 1` | as stated | none |
| §2.2 kernel of order transition (r4) | `A` smooth | `0 → I^m/I^(m+1) → P^m(A) → P^(m−1)(A) → 0`, `I^m/I^(m+1) = Sym^m Ω¹` | as stated with smoothness | none |
| §2.3 flatness criterion (r4) | `∇ = d + yN dx` | curvature `N dy∧dx`; `[∂_x + yN, ∂_y] = −N` | signs agree | none |
| §2.3 Bianchi rank one (r4) | `a = y, b = x`; `a = 0, b = x` | `0`; `dx∧dy` | as stated | none |
| §2.4 frame dictionary (r4) | `g = h⁻¹` | `g⁻¹dg = −(dh)h⁻¹` | as stated | none |
| `regularGauge` law (r4) | symbolic | `g′ = gA − Bg`; `(j+1)g_(j+1) = Σ_(i≤j)(g_iA_(j−i) − B_(j−i)g_i)` | docstring recursion exact | none |
| `regularGauge_constantCoeff_bijective` (r4) | `n = 1, A = 1, B = 0, R = ℚ`; `R = 𝔽_p`; `R = ℚ[ε]/ε²`; `n = ∅`; `R = 0` | `g = g₀e^t`; `g = 1 + t^p` solves `g′ = 0` (needs `[Algebra ℚ R]`); `g₀(1 + εt)`; singletons | holds with the stated hypothesis | none |
| §2.4 smoothness controls (r4) | `Spec ℂ[x,y]/(xy)`; `Spec ℂ[x]/x²`; `D(x−1) ⊂ 𝔾_m` | cotangent ranks `2`/`1`; Krull dimension `0`; complex point `x = 2` | as stated | none |
| §3.1 nonreduced unit (r4) | `R = ℂ[ε]/ε²`, `1 + εt⁻¹` | inverse `1 − εt⁻¹`; not of the form `a t^n u` with `a` a unit | as stated | none |
| §3.1 `exp_1`, `K_N` normal (r4) | `𝔾_m`, `ℚ`; `𝔽_p`; `GL_n` | `1 + t + t²/2 + ⋯`; `1/p!` absent; `g(1 + t^N X)g⁻¹ = 1 + t^N gXg⁻¹` | as stated | none |
| §3.2 descent overlap (r4) | `R = k`, `S = k[x]` | `Σ x^n y^n t^n ∉ S((t)) ⊗_{R((t))} S((t))` | as stated | none |
| §3.3 infinitesimal gauge, cocycle (r4) | `g = 1 + εx`; `𝔾_m` | `A + ε([x,A] − x′)`; `(gh)′/(gh) = g′/g + h′/h` | as stated | none |
| §3.3 left action (r4) | `h, g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹` | as stated | none |
| §3.4 `𝔾_m` classes (r4) | `g = c t^n e^f` | `a ↦ a − nt⁻¹ − f′`; classes = (polar part below `t⁻¹`, residue mod `ℤ`) | as stated | none |
| §3.4 stabilizers, deformation complex (r4) | `𝔾_m` over `ℂ`, `𝔽_p` | `g′ = 0 ⇒ g ∈ ℂˣ`; `t^p` over `𝔽_p`; kernel `ℂ`, cokernel `ℂ` | as stated | none |
| §3A.1 non-normality (r4) | `SL₂`, `[[1,t],[0,1]]` | `diag(t,t⁻¹)` conjugate `[[1,t³],[0,1]]`, `diag(t,t⁻¹) ∉ G(ℂ[t])` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` (r4) | `G = 1`; `𝔾_m`; `ℂ[ε]/ε²`, `1 + εt⁻¹`; `SL₂` | singleton; `u = at^n·w`; polynomial factor `u`, positive `1`; `(1−t)⁻¹t⁻¹ − t⁻¹ = (1−t)⁻¹` | holds | none |
| same, hypothesis (r4) | `reductiveCommHopfAlgProperty ℂ H` | split over `ℂ` ⇒ `G_ad` totally isotropic ⇒ Česnavičius Theorem 19 for every `R` | holds | none |
| §3A.2 injectivity (r4) | `t⁻¹ + t` | not in `R[[t]]` | as stated | none |
| §3A.3 semidirect law (r4) | `(λ,w)(μ,v)(ν,u)` | both bracketings `(λ + wμ + wvν, wvu)` | as stated | none |
| §3A.3 `Y/Q^∨` (r4) | `𝔾_m`, `SL₂`, `PGL₂`, `GL_n` | `ℤ`; `0`; `ℤ/2`; `ℤ` | as stated | none |
| §3A.3 conjugation (r4) | `n = [[0,1],[−1,0]]` | `n diag(a,b) n⁻¹ = diag(b,a)` | `t^(−λ)`, as stated | none |
| §3A.4 Iwahori (r4) | `SL₂` | `[[1,0],[t,1]]` in `I`; `[[1,0],[1,1]]` not; `α(λ) = 2` | as stated | none |
| §3A.5 stratum bound (r4) | `t^λ` | `N = max|⟨λ,ω⟩|` bounds the chart | as stated | none |
| §3A.5 Cartan decomposition (r4) | `GL₁`; `SL₂` | `ℂ((t))ˣ = ⊔ Oˣt^n`; elementary divisors `(t,t⁻¹) ≠ (t²,t⁻²)`; `W\(Y⋊W)/W ≃ Y⁺` | as stated | none |
| §3A.5 `SL₂` Schubert variety (r4) | `λ = α^∨` | `dim = 2`; closure adds `L₀`; fibre `ℙ¹` | as stated | none |
| §3A.5 Iwahori–Matsumoto hypotheses (r4) | their `G` | adjoint Chevalley group, any discretely valued field; reductive extension is a target | as stated | none |
| §3A.6 positive double cosets (r4) | `GL₂` | `diag(t,1)`, `diag(1,t)` Weyl-conjugate; `det = t²` component `2` | as stated | none |
| §3A.7 `PGL₂` cocharacter (r4) | `α^∨/2` | `[diag(t,1)]² = [diag(t,t⁻¹)]` | as stated | none |
| §4.1 oper condition (r4) | `PGL₂`, `ψ = t`, `0`, `ε + t⁻¹` | unit in `ℂ((t))`, not `ℂ[[t]]`; never; `t⁻¹(1 + εt)` unit | as stated | none |
| §4.2 normalization (r4) | `[[1,u],[0,1]]` on `[[a,b],[1,−a]]` | `u = −a` gives `b + a² + a′`; `ψ = 2` not normalizable over `ℚ` | as stated | none |
| §4.3 Chevalley checks (r4) | `𝔰𝔩₂`, `𝔤𝔩₂`, `𝔰𝔩₃`, `μ₂` | `ℂ[h²]`; `ℂ[h₁+h₂, h₁h₂]`; exponents `1, 2`; `Lie(μ₂) = 0` | as stated | none |
| §4.3 normal form over `ℂ[ε]/ε²` (r4) | `a = εt⁻¹` | `q = −εt⁻²` | as stated | none |
| §4.3 torus matching, realification (r4) | `𝔾_m`; `S¹`, `μ_n` | Zariski closure of `S¹` is `𝔾_m`, of `μ_n` is `μ_n` | as stated | none |
| §4.4 `SL₂`-lifts (r4) | `g = diag(√t, 1/√t)` | residue `−½ ∉ ℤ` | as stated | none |
| §5.1 Schwarzian cocycle (r4) | `ψ = t + t²` | `{ψ,t} = −6/(1+2t)²`; `{at,t} = 0` | as stated | none |
| §5.2 evaluation (r4) | `q = t⁻²`, `N = 2, 5` | `eval_q(q_(−2)) = 1`; `q_j ↦ 1` kills no `ker(proj_N)` | as stated | none |
| §5.3 elimination (r4) | `n = 2`, `(a,−a)` | `−y₂″ + (a′ + a² + q)y₂ = 0` | agrees with §4.2 and Frenkel | none |
| §5.4 gauge witness (r4) | `g = [[c − ts, −s],[−s + tc, c]]` | `gA₀ − A₁g = g′` | `gauge(g, A₀) = A₁` | none |
| §6.1 finite monodromy, torsors (r4) | `𝔾_m`; `μ₂` | kernel open ⇒ root of unity; `H¹(ℂ((t)), μ₂) = ℤ/2` | as stated | none |
| `exists_cyclicVector` (r4) | `V = 0`; `D = 0` on `F²`; `𝔽_p(t)`, `V = F^(p+1)` | `Fin 0` independent; no cyclic vector; `D^p v = 0` | both hypotheses needed | none |
| §6.2 Katz candidates (r4) | `e₀ = (1,t)`, `e₁ = (−t⁻¹,0)` | `a = 1`: determinant `t⁻²` | as stated | none |
| §6.2 lattice estimate (r4) | `∇ = ∂ + t⁻²` | relative dimension `−2` | as stated | none |
| §6.3 coordinate derivation sign (r4) | `φ_s = t + sε` | `d/ds f∘φ_s⁻¹ = −εf′`; `r ≤ −2` | as stated | none |
| §6.3 conjugation formula (r4) | `(g⁻¹,1)` | first component `t^(−r) gauge(g⁻¹, A)` | as stated | none |
| §6.3 `SL₂` Schubert cells (r4) | `s₀`, `s₁`, `s₀s₁` | `ℓ = 1, 1, 2` | as stated | none |
| §6.4 leading coefficient (r4) | `SL₂`, `t⁻²h`; `t⁻²f` | `h` semisimple; at `r = −3`, `A_(−3) = 0`; `f` regular nilpotent | as stated | none |
| §6.5 cohomology (r4) | `μ_n`, `𝔾_m` | `H¹(μ_n) = ℤ/n`; `H²(μ_n) = 0` | as stated | none |
| §7.1 cotangent algebroid (r4) | `{x,y} = 1`; `{x,y} = x`; `k[x,y]/(x²,y²)` | `[dx,dy] = dx`, `anchor(dy)(x) = −x`; `{x²,y} = 2x ≠ 0` | as stated | none |
| §7.2 anchor sign, Heisenberg (r4) | `𝔤 = ℂ`, `t^m`, `t^n` | `−nδ_(m+n,0)` | as stated | none |
| §7.2 freeness (r4) | `𝔰𝔩₂` | `u = −a` forced | as stated | none |
| §7.3 Virasoro, KdV (r4) | `L_n = Res t^(n+1)q` | `c = −6`; `P_q(2q) = 6qq′ − q‴` | as stated | none |
| §7.4 coisotropy (r4) | `I = (q_j : j < 0)` | `{L₂,L₋₂} ↦ −3`; `{L₋₁,L₋₂} = q₁ ∉ I` | as stated | none |
| §7.5 Miura, screening, modes (r4) | `[[−u,0],[1,u]]` | `q = u² − u′`; `δq = 0`; `(q′)_(−a−1) = −a q_(−a)` | as stated | none |
| §8.1 `IsomOp` (r4) | `𝔾_m`; `g ∈ N((t))` | automorphisms `ℂˣ`; `g = 1` forced | as stated | none |
| §8.2 tangent and algebroid (r4) | `𝔰𝔩₂` | `[F_x,F_y] = −F_[x,y]` | as stated | none |
| §8.3 regular extension (r4) | `𝔾_m` | `dlog g ∈ ℂ[[t]]dt ⇒ g ∈ ℂ[[t]]ˣ` | as stated | none |
| §8.4 critical level (r4) | `κ_c = −½ Killing` | `κ₀(h,h) = 2` | as stated | none |
| §4.3 lower dictionary at the new generality (every affine algebraic `G` over `ℂ`) (r4) | `μ_n`; `𝔾_a`; `𝔾_m × ℤ/2`; trivial group; `GL_N` | `H = ℂ[x]/(xⁿ−1)`: `𝔤 = 0`, Krull dim `0`, `d = 0`, `n` discrete points modelled on `Fin 0 → ℂ`; `𝔾_a`: `d = 1`; `𝔾_m × ℤ/2`: `d = 1`, both components of dimension `1` by translation, Krull dim `1`; `H = ℂ`: `0 = 0`; `GL_N`: `d = N²`, chart with `det⁻¹` | holds; no nonreduced group exists in characteristic `0` (Cartier), so no counterexample to the smoothness step | none |
| §4.3 Cartier citations (r4) | hypotheses at the pin | `smoothCommHopfAlgProperty_of_charZero`: `[Field k] [CharZero k]`, `H : CommHopfAlgCat k`, `[Algebra.FiniteType k H]`; `finrank_lie_eq_ringKrullDim_of_charZero`: `(finrank k 𝔤 : WithBot ℕ∞) = ringKrullDim H`, same hypotheses | "`H` finitely generated" is `Algebra.FiniteType`; both as the bullet states | none |
| §4.3 bracket compatibility (r4) | `D, E ∈ 𝔤`, `h ∈ H`, `Δ = μ*` | `D^L h = Σ h_(1) D(h_(2))`; `D^L E^L h = Σ h_(1) D(h_(2)) E(h_(3))`; at `1` (apply `ε`): `Σ D(h_(1))E(h_(2)) = (D*E)(h)`; commutator at `1`: `D*E − E*D` | no minus sign, as stated | none |
| Scope: §2.4 versus ComplexComparisonPartII C−1.1 (r4) | #848 head lines 913–919, 148 | C−1.1 hands "fixed-model maximal atlases, second countability, tangent/derivation, toric, group and gauge comparisons" to F2.4 and keeps complex points, open subspaces, fibre products, smooth charts, étale local inverses | consistent, one owner each | none |
| §2.2 symbol of `(d/dx)²` with the Hasse derivative (new) | `k[x]`, char `0`, `2`, `3`; `f = x²` | `1 ⊗ x^n = (x + ξ)^n`, `ξ²` coefficient `C(n,2)x^(n−2)`; `2·C(n,2) = n(n−1)` in every characteristic; `D(x^n) = n(n−1)x^(n−2) = 2 f^[2]`, so `ξ² ↦ 2`; char `2`: `f^[2](x²) = 1`, `(d/dx)²(x²) = 2 = 0`, and `n(n−1)` is always even | as stated | none |
| §3A.5 chart bounds (new) | `GL₂`, `N = 0, 1`, `L_k = t^k O e₂ ⊕ O e₁` | `L_k ⊂ O² ⊂ t^(−N)O²` for every `k`; `t^N O² ⊂ L_k` fails for `k > N`; `O²/L_k ≃ O/t^k` of length `k`, unbounded | as stated | none |
| §4.3 compact comparison `λ ↦ dλ(2πi)` (new, moved from §3A.3) | `𝔾_m`, `λ = id`; `SL₂`, `λ = α^∨`; `PGL₂`, `λ = α^∨/2` | `exp_G ∘ dλ = λ ∘ exp` by naturality; `exp_G(dλ(2πi)) = λ(1) = 1`; `𝔾_m`: `1 ↦ 2πi ∈ iℝ = Lie(S¹)`; `SL₂`: `diag(2πi, −2πi) ↦ diag(1, 1)`; `PGL₂`: `diag(πi, −πi) ↦ [diag(−1, −1)] = 1`; `λ(S¹) ⊂ T(ℂ)` compact, hence in `T_K = K ∩ T` | as stated; placed after `T`, `T_K` and `K ∩ T = T_K` are built | none |
| §3A.3 → §4.3 build order (new) | the `*Needs:*` lines after the move | §4.3 → §3A.3 → §3A.1, ReductiveGroups, RootSystems; Layer 3A Dependencies: Layers 1–3; Layer 4 Dependencies: Layers 2–3, §3A.3 | no forward edge from Layer 3A | none |
| §6.4 order bound (new) | `A = 0`, `r = −2`; `g = exp(t⁻³x)`, `x ∈ 𝔫` | convention line 151 `gauge(g, A) = Ad(g)A − (dg)g⁻¹`; §6.4 tests `gauge(g⁻¹, A)`; `g⁻¹ = exp(−t⁻³x)`, `(g⁻¹)′ = 3t⁻⁴x·g⁻¹`, `gauge(g⁻¹, 0) = −3t⁻⁴x`, order `−4 < −2`; `gauge(t^(−λ), 0) = −(−λt⁻¹) = λt⁻¹`, order `−1 ≥ −2` | as stated | none |
| §4.3 lower dictionary: ownership of `G(ℂ)` (new) | main 3A.5 (335–372), #1676 884, #1808 855, #1797 1230, #1854 | one owner at the open heads (ReductiveGroups 3A.5), this roadmap transports; on main 3A.5 states orbit charts and `G(ℂ)/H(ℂ) ≃ O_x(ℂ)` and no chart-at-the-identity Lie-algebra identification; description names no open ReductiveGroups revision | right at the open heads; dependency unrecorded | R01 |
| §4.3 composite equals 3A.5's identification (new) | `𝔾_a`; `𝔾_m` | restriction `Der_ℂ(O_(G,e), ℂ) → Der_ℂ(H, ℂ_ε)`; `𝔾_a`: `H = ℂ[x]`, `D = ∂_x|_0`, `D(x/(1+x)) = D(x)/1 − 0 = 1`; `𝔾_m`: `H = ℂ[x, x⁻¹]`, `D(x⁻¹) = −ε(x)⁻²D(x) = −1`, the chart-at-`1` coordinate derivative of `x⁻¹` | the localization formula gives the chart-at-the-identity value; the equality is a target with a referent at the open heads | R01 (record only) |
| `polynomialLoopToFormal`, `positiveLoopToFormal` at the pin (new) | `AlgHom.mapValue (H := H) …`; `module` header | file elaborates, exit `0`, three `sorry` warnings; elaborated types as in `signatures.md`: `↑(points ↧(LaurentPolynomial R)) →* ↑(points ↧(LaurentSeries R))` with `[HopfAlgebra k H] [Algebra k R]`, and the `PowerSeries` version | builds | none |

## Not verifiable

- Nothing new in this round. The earlier reviews' items stand: Kazhdan–Lusztig 1988 §4 Lemmas 6 and 8 and Kazhdan–Lusztig 1980 §2 (no legal copy; uncertified in the README); Kostant 1963, Chevalley 1955, Matsushima 1960, Drinfeld–Sokolov 1985, Rinehart 1963 cited by locator and marked uncertified.
- The ReductiveGroups revisions #1808, #1797 and #1854 were read through `roadmaps show --pr`, not from a checkout; their line numbers are those of that listing.

## Source issues

- none
