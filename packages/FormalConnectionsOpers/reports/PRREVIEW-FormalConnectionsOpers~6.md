# Review of FormalConnectionsOpers (pull request #1056 at 7e7e507)

**Verdict:** needs changes

Incremental re-review of the 16 lines changed since 0694b63: the rewritten ReductiveGroups bullet of `## Scope and ownership` (lines 78–85) and the deleted ReductiveGroups Layer 11 bullet of `## Downstream consumers`. Also checked: everything those passages cite or that cites them (§4.3's lower dictionary at lines 1410–1441, the C−1.1 bullet at lines 47–60, §2.4's use of C−1.1, the ReductiveGroups heads, ComplexComparisonPartII C−1.1, and the roadmaps that consume F4.3), and the gate. `Suggested.lean` is byte-identical to 0694b63 and the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The previous finding is repaired. The README repair made alongside it reverses a correct attribution, which gives R01 below.

## R01 (P2) — The Scope bullet now builds ReductiveGroups 3A.5's `G(ℂ)` on ComplexComparisonPartII C−1.1's topology and charts. Every ReductiveGroups revision this pull request depends on owns them itself

Location: `TauCetiRoadmap/FormalConnectionsOpers/README.md` lines 78–80 ("ReductiveGroups Layer 3A.5 owns the complex Lie-group structure on `G(ℂ)` … on the classical topology and smooth charts of ComplexComparisonPartII C−1.1"). Lines 1419–1420 make the same attribution, and lines 55–56 say this roadmap takes the classical topology "from C−1.1 alone".

Claim: ReductiveGroups Layer 3A.5 constructs the complex Lie group `G(ℂ)` on C−1.1's classical topology and smooth charts.

Witness: ReductiveGroups at #1676, lines 19–25: 3A.5 "owns the classical complex-point topology, smooth charts …". C−1.1 is "later in the merge order" and "ownership of the topology and charts rests with this earlier layer". #1808 and #1797 (line 20) agree.

Why the claim fails:
- ReductiveGroups is on main, and ComplexComparisonPartII is line 43 of the merge order. A 3A.5 built on C−1.1 would therefore be an upward supply inside ReductiveGroups.
- #1676 builds its own topology for every locally finite-type `ℂ`-scheme (lines 880–883). Its `G(ℂ)` Lie group uses "these charts" (lines 928–935).
- Only main's 3A.5 (lines 342–346) consumes C−1.1, and it states no Lie group `G(ℂ)`. No version of ReductiveGroups states what lines 78–80 attribute to it.
- The Scope wording before this head ("owns the classical topology, the smooth charts and the complex Lie-group structure on `G(ℂ)`") matched #1676. The repair aligned it with the attribution at lines 1419–1420, and that attribution is the wrong one.
- §4.3 then identifies §2.4's fixed-model atlas, which lives on C−1.1's carrier (lines 726–729, 760), "with those charts" (line 1424), which are 3A.5's. That needs 3A.5's topology and C−1.1's to be identified, and no supplier states it: #848's C−1.1 never mentions ReductiveGroups, and #1676 only asserts "the two agree by the identity on `X(ℂ)`".

Repair:
1. Lines 78–82. Restore the owner and add the comparison to §4.3's list: "ReductiveGroups Layer 3A.5 owns the classical topology and smooth charts on complex points and the complex Lie-group structure on `G(ℂ)` for every affine algebraic group `G` over `ℂ`, with the chart-at-the-identity identification of its Lie algebra with its Layer 2 tangent Lie algebra; §4.3 consumes these and owns only the comparison of that topology and those charts on `G(ℂ)` with ComplexComparisonPartII C−1.1's, their transport to …".
2. Line 1420. Replace "the classical topology and the smooth charts from ComplexComparisonPartII C−1.1" with "its classical topology and smooth charts".
3. Before "identify its fixed-model atlas with those charts" (line 1423), add: "Prove that the identity of `G(ℂ)` is a homeomorphism from Layer 3A.5's classical topology onto the underlying space of C−1.1's `G^an`: on the closed embedding `G ⊂ GL_N` both are the zero-locus subspace topology, by §2.4's affine identification".
4. Lines 55–56. Append "; the one other classical topology used, ReductiveGroups 3A.5's on `G(ℂ)`, is identified with it in §4.3".

The repaired statement, tested on the instances:
- `G = 𝔾_m`, `H = ℂ[x,y]/(xy − 1)` inside `GL₁`. 3A.5's topology is the subspace `{xy = 1} ⊂ ℂ²` (#1676 line 882). §2.4 lines 728–729 make C−1.1's topology the same subspace. The identity is a homeomorphism, `x` is a chart in both atlases, and the transition is the identity.
- `G = μ_n`: `n` discrete points on both sides, modelled on `Fin 0 → ℂ`.
- Trivial group: one point on both sides.

## Previous findings

- R01 — repaired: the description now says "Merge after the ReductiveGroups revision whose Layer 3A.5 states the complex Lie group `G(ℂ)` … (#1676; #1808 and #1797 carry the same passage); §4.3 consumes it." Its README companion is this report's R01.

## Verified sound

**Gate and direction.**
- The gate run here at 7e7e507: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0 OK`.
- Dependency check run here: `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean.**
- `lake env lean` on the head file: three `declaration uses sorry` warnings (lines 71, 130, 160) and nothing else, exit `0`.
- `git diff 0694b63 HEAD -- Suggested.lean` is empty.
- The worker's `signatures.md` lists the nine elaborated types. They are those of the previous review's `#check @name` probe, with the same binders: `[Algebra ℚ R]`, `reductiveCommHopfAlgProperty ℂ H`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]`, and `[HopfAlgebra k H] [Algebra k R]` on the two loop maps.
- The padding probes and the headline list were not re-run: the theorems and pins are unchanged.

**Cross-roadmap citations resolved (8 sources).**
- ReductiveGroups at #1676 (head `66eb91ba`): lines 19–27 (3A.5 owns the topology, charts and the Lie group `G(ℂ)`; "FormalConnectionsOpers §4.3 consumes the complex Lie-group dictionary on `G(ℂ)` and transports it to the Hopf-point carrier"), 880–883, 928–935 and 3804–3806 ("Layer 11 consumes no target of FormalConnectionsOpers"). The rest of the Scope bullet (lines 81–85, chart-at-the-identity identification; §4.3 owns the transport, Maurer–Cartan rank, germ-to-counit comparison, realification and exponential chart) matches lines 26–27 and 932–935.
- The same 3A.5 ownership paragraph was already at the previous #1676 head `528579c6` (lines 19–21, 31–34), so R01 is not drift after this repair was written.
- ReductiveGroups at #1808: lines 20–31, 856 and 3684–3690. Its FormalConnectionsOpers mentions are lines 1334 and 3678 only, so Layer 11 does not cite F4.3.
- ReductiveGroups at #1797: lines 20, 30 and 1231. Its FormalConnectionsOpers mentions are lines 1802 and 4233 only.
- ReductiveGroups at #1854 keeps main's wording: line 343 consumes C−1.1, and line 1965 cites F4.3.
- ReductiveGroups on main: 3A.5 at lines 335–372, and Layer 11 at line 1964, which still cites "the lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3".
- ComplexComparisonPartII at #848: §C-1.1 at line 864 and the F2.4 hand-off at lines 934–936 and 148. There is no mention of ReductiveGroups.
- Merge order: ComplexComparisonPartII at line 43 and FormalConnectionsOpers at line 44. ReductiveGroups is on main.

**The deleted Layer 11 consumer bullet.**
- Correct for the revisions the description names: #1676 line 3806, and #1808 and #1797, where Layer 11 cites nothing here. Main's line 1964 citation goes away when #1676 merges first, as the description requires.
- Searched with `roadmaps grep` for consumers of F4.3. AffineLieAlgebras (main, lines 36 and 982) and NilpotentOrbits (main, lines 60 and 63) are listed in `## Downstream consumers`.
- The open consumers #1202 LanglandsParameterStacks, #1828 SpringerResolutionAndCharacteristicCycles, #1842 QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and #999 EndoscopicTransferAndUnitaryTraceComparison cite §4.3's Chevalley restriction, slice and descent. The diff leaves those untouched.
- NilpotentOrbits' bullet (lines 2474–2479) still names the connectedness and central/derived dictionary that the deleted bullet listed, so nothing §4.3 owns lost its consumer.

**Ownership against open work (changed objects only).**
- The classical topology on `X(ℂ)` is constructed twice at the open heads: by ReductiveGroups 3A.5 (#1676, #1808, #1797) and by ComplexComparisonPartII C−1.1 (#848). That double construction is between those two roadmaps.
- This roadmap consumes both. R01 asks it to own only the comparison its §4.3 needs; it is later than both, so it may.
- The polynomial/formal loops, opers, Drinfeld–Sokolov, Tate modules, the isomonodromy groupoid and the cyclic-vector theorem are untouched by the diff. The previous review's search stands for them.

**Sources.**
- No sampled target (F1.1, F1.2, F2.2, F2.3, F2.4, F3.2, F3.3, F5.2, F6.4, F6.5, F7.5, F8.1–F8.4) falls in the changed lines, and no locator changed.
- The README flags no locator as unverified. Its "uncertified" entries (lines 1561, 1950, 1974, 2497–2550) are paywalled works cited by locator.

**Adversarial table.** Rows marked "(r5)" carry forward the previous report's rows for statements the diff leaves untouched, with their computed values. The last six rows are new, for the changed passages.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| --- | --- | --- | --- | --- |
| §1.1 `Res(f′dt) = 0`, `d(t⁻¹)` (r5) | `f = Σ f_j t^j`; `t⁻¹` | `t⁻¹` coefficient of `f′` is `0·f₀ = 0`; `d(t⁻¹) = −t⁻²`; `Res(t⁻¹dt) = 1` | as stated | none |
| §1.1 `⊗^!` witness (r5) | `V = W = k((t))`, `Σ t^n ⊗ t^(−n)` | in `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only `n < M` survive; one-sided completion keeps all `t^(−n)` | lies in `⊗^!` only | none |
| §1.2 inverse of `t + t²` (r5) | `ψ = t − t² + 2t³` | `ψ + ψ² = t + O(t⁴)`; truncation `t − t²` gives `t − 2t³ + O(t⁴)` | as stated | none |
| §1.2 contravariance (r5) | `φ = 2t`, `ψ = t + t²` | `σ_φσ_ψ(t) = 2t + 4t²`; `σ_ψσ_φ(t) = 2t + 2t²` | as stated | none |
| §1.2 chain rule, residue (r5) | `f = t⁻¹`, `φ = t + t²`; `φ = t²` | `(f′∘φ)φ′ = −t⁻² + 1 + O(t)`, `Res = 1`; `Res(t⁻²·2t dt) = 2` | unit hypothesis needed, as stated | none |
| §1.2 `Aut(O)` semidirect product (r5) | `φ = at`, `Aut⁺` | `φ′(0) = a`; `Der⁺ = t²ℂ[[t]]∂` | as stated | none |
| §1.3 elementary module, lattices (r5) | `R((t))`, `U = t^M O ⊂ L = t^N O` | `L/U` free of rank `M − N`; `R[t⁻¹]` not open | as stated | none |
| §1.3 residue annihilator (r5) | pairings `i + j = −1`, `i + j = 0` | annihilator of `{i ≥ 0}`: `{j ≥ 1} = tV^∨[[t]]` | as stated | none |
| §1.3 topological nilpotence (r5) | `t`, `t⁻¹`, `0` | `t^n O ⊂ t^N O` for `n ≥ N`; `t^(−n)O ⊄ O`; `0` not injective | as stated | none |
| §2.1 negative control (r5) | `A = k[x,y]/(x,y)²`, `∇ = d + x dy` | curvature `dx∧dy ≠ 0`; `xξ(y) = 0`, `∇_ξ = ξ` | hypothesis needed, as stated | none |
| §2.1 dual sign (r5) | `∇ = d + a dx` | `∇^∨ = d − a dx`, `∇ ⊗ ∇^∨ = d`; wrong sign gives `d + 2a dx` | as stated | none |
| §2.2 Atiyah sequence exactness (r5) | `M = A`; general `M` | `0 → I/I² → P¹(A) → A → 0` splits on the right by the jet, stays exact after `⊗_{A,right} M` | as stated | none |
| §2.2 splitting criterion Leibniz (r5) | `∇s = 1⊗s − σ(s)` | `∇(as) = a∇s + da ⊗ s` with `da ↦ 1⊗a − a⊗1` | as stated | none |
| §2.2 first Check (r5) | `A = k[x]`, `σ(f) = f(1⊗1 − aξ)` | `∇f = (f′ + af)dx`; wrong identification gives `(−1 + ax)dx` | as stated | none |
| §2.2 jet is not `A`-linear (r5) | `s = 1` | `1⊗x − x(1⊗1) = ξ ≠ 0` | as stated | none |
| §2.2 char `p` PBW failure (r5) | `k = 𝔽_p`, `(d/dx)^p` | `(d/dx)^p x^n = 0`; image of `U(A, Der)` has orders `≤ p − 1` | as stated | none |
| §2.2 kernel of order transition (r5) | `A` smooth | `0 → I^m/I^(m+1) → P^m(A) → P^(m−1)(A) → 0`, `I^m/I^(m+1) = Sym^m Ω¹` | as stated with smoothness | none |
| §2.3 flatness criterion (r5) | `∇ = d + yN dx` | curvature `N dy∧dx`; `[∂_x + yN, ∂_y] = −N` | signs agree | none |
| §2.3 Bianchi rank one (r5) | `a = y, b = x`; `a = 0, b = x` | `0`; `dx∧dy` | as stated | none |
| §2.4 frame dictionary (r5) | `g = h⁻¹` | `g⁻¹dg = −(dh)h⁻¹` | as stated | none |
| `regularGauge` law (r5) | symbolic | `g′ = gA − Bg`; `(j+1)g_(j+1) = Σ_(i≤j)(g_iA_(j−i) − B_(j−i)g_i)` | docstring recursion exact | none |
| `regularGauge_constantCoeff_bijective` (r5) | `n = 1, A = 1, B = 0, R = ℚ`; `R = 𝔽_p`; `R = ℚ[ε]/ε²`; `n = ∅`; `R = 0` | `g = g₀e^t`; `g = 1 + t^p` solves `g′ = 0` (needs `[Algebra ℚ R]`); `g₀(1 + εt)`; singletons | holds with the stated hypothesis | none |
| §2.4 smoothness controls (r5) | `Spec ℂ[x,y]/(xy)`; `Spec ℂ[x]/x²`; `D(x−1) ⊂ 𝔾_m` | cotangent ranks `2`/`1`; Krull dimension `0`; complex point `x = 2` | as stated | none |
| §3.1 nonreduced unit (r5) | `R = ℂ[ε]/ε²`, `1 + εt⁻¹` | inverse `1 − εt⁻¹`; not of the form `a t^n u` with `a` a unit | as stated | none |
| §3.1 `exp_1`, `K_N` normal (r5) | `𝔾_m`, `ℚ`; `𝔽_p`; `GL_n` | `1 + t + t²/2 + ⋯`; `1/p!` absent; `g(1 + t^N X)g⁻¹ = 1 + t^N gXg⁻¹` | as stated | none |
| §3.2 descent overlap (r5) | `R = k`, `S = k[x]` | `Σ x^n y^n t^n ∉ S((t)) ⊗_{R((t))} S((t))` | as stated | none |
| §3.3 infinitesimal gauge, cocycle (r5) | `g = 1 + εx`; `𝔾_m` | `A + ε([x,A] − x′)`; `(gh)′/(gh) = g′/g + h′/h` | as stated | none |
| §3.3 left action (r5) | `h, g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹` | as stated | none |
| §3.4 `𝔾_m` classes (r5) | `g = c t^n e^f` | `a ↦ a − nt⁻¹ − f′`; classes = (polar part below `t⁻¹`, residue mod `ℤ`) | as stated | none |
| §3.4 stabilizers, deformation complex (r5) | `𝔾_m` over `ℂ`, `𝔽_p` | `g′ = 0 ⇒ g ∈ ℂˣ`; `t^p` over `𝔽_p`; kernel `ℂ`, cokernel `ℂ` | as stated | none |
| §3A.1 non-normality (r5) | `SL₂`, `[[1,t],[0,1]]` | `diag(t,t⁻¹)` conjugate `[[1,t³],[0,1]]`, `diag(t,t⁻¹) ∉ G(ℂ[t])` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` (r5) | `G = 1`; `𝔾_m`; `ℂ[ε]/ε²`, `1 + εt⁻¹`; `SL₂` | singleton; `u = at^n·w`; polynomial factor `u`, positive `1`; `(1−t)⁻¹t⁻¹ − t⁻¹ = (1−t)⁻¹` | holds | none |
| same, hypothesis (r5) | `reductiveCommHopfAlgProperty ℂ H` | split over `ℂ` ⇒ `G_ad` totally isotropic ⇒ Česnavičius Theorem 19 for every `R` | holds | none |
| §3A.2 injectivity (r5) | `t⁻¹ + t` | not in `R[[t]]` | as stated | none |
| §3A.3 semidirect law (r5) | `(λ,w)(μ,v)(ν,u)` | both bracketings `(λ + wμ + wvν, wvu)` | as stated | none |
| §3A.3 `Y/Q^∨` (r5) | `𝔾_m`, `SL₂`, `PGL₂`, `GL_n` | `ℤ`; `0`; `ℤ/2`; `ℤ` | as stated | none |
| §3A.3 conjugation (r5) | `n = [[0,1],[−1,0]]` | `n diag(a,b) n⁻¹ = diag(b,a)` | `t^(−λ)`, as stated | none |
| §3A.4 Iwahori (r5) | `SL₂` | `[[1,0],[t,1]]` in `I`; `[[1,0],[1,1]]` not; `α(λ) = 2` | as stated | none |
| §3A.5 stratum bound (r5) | `t^λ` | `N = max|⟨λ,ω⟩|` bounds the chart | as stated | none |
| §3A.5 Cartan decomposition (r5) | `GL₁`; `SL₂` | `ℂ((t))ˣ = ⊔ Oˣt^n`; elementary divisors `(t,t⁻¹) ≠ (t²,t⁻²)`; `W\(Y⋊W)/W ≃ Y⁺` | as stated | none |
| §3A.5 `SL₂` Schubert variety (r5) | `λ = α^∨` | `dim = 2`; closure adds `L₀`; fibre `ℙ¹` | as stated | none |
| §3A.5 Iwahori–Matsumoto hypotheses (r5) | their `G` | adjoint Chevalley group, any discretely valued field; reductive extension is a target | as stated | none |
| §3A.6 positive double cosets (r5) | `GL₂` | `diag(t,1)`, `diag(1,t)` Weyl-conjugate; `det = t²` component `2` | as stated | none |
| §3A.7 `PGL₂` cocharacter (r5) | `α^∨/2` | `[diag(t,1)]² = [diag(t,t⁻¹)]` | as stated | none |
| §4.1 oper condition (r5) | `PGL₂`, `ψ = t`, `0`, `ε + t⁻¹` | unit in `ℂ((t))`, not `ℂ[[t]]`; never; `t⁻¹(1 + εt)` unit | as stated | none |
| §4.2 normalization (r5) | `[[1,u],[0,1]]` on `[[a,b],[1,−a]]` | `u = −a` gives `b + a² + a′`; `ψ = 2` not normalizable over `ℚ` | as stated | none |
| §4.3 Chevalley checks (r5) | `𝔰𝔩₂`, `𝔤𝔩₂`, `𝔰𝔩₃`, `μ₂` | `ℂ[h²]`; `ℂ[h₁+h₂, h₁h₂]`; exponents `1, 2`; `Lie(μ₂) = 0` | as stated | none |
| §4.3 normal form over `ℂ[ε]/ε²` (r5) | `a = εt⁻¹` | `q = −εt⁻²` | as stated | none |
| §4.3 torus matching, realification (r5) | `𝔾_m`; `S¹`, `μ_n` | Zariski closure of `S¹` is `𝔾_m`, of `μ_n` is `μ_n` | as stated | none |
| §4.4 `SL₂`-lifts (r5) | `g = diag(√t, 1/√t)` | residue `−½ ∉ ℤ` | as stated | none |
| §5.1 Schwarzian cocycle (r5) | `ψ = t + t²` | `{ψ,t} = −6/(1+2t)²`; `{at,t} = 0` | as stated | none |
| §5.2 evaluation (r5) | `q = t⁻²`, `N = 2, 5` | `eval_q(q_(−2)) = 1`; `q_j ↦ 1` kills no `ker(proj_N)` | as stated | none |
| §5.3 elimination (r5) | `n = 2`, `(a,−a)` | `−y₂″ + (a′ + a² + q)y₂ = 0` | agrees with §4.2 and Frenkel | none |
| §5.4 gauge witness (r5) | `g = [[c − ts, −s],[−s + tc, c]]` | `gA₀ − A₁g = g′` | `gauge(g, A₀) = A₁` | none |
| §6.1 finite monodromy, torsors (r5) | `𝔾_m`; `μ₂` | kernel open ⇒ root of unity; `H¹(ℂ((t)), μ₂) = ℤ/2` | as stated | none |
| `exists_cyclicVector` (r5) | `V = 0`; `D = 0` on `F²`; `𝔽_p(t)`, `V = F^(p+1)` | `Fin 0` independent; no cyclic vector; `D^p v = 0` | both hypotheses needed | none |
| §6.2 Katz candidates (r5) | `e₀ = (1,t)`, `e₁ = (−t⁻¹,0)` | `a = 1`: determinant `t⁻²` | as stated | none |
| §6.2 lattice estimate (r5) | `∇ = ∂ + t⁻²` | relative dimension `−2` | as stated | none |
| §6.3 coordinate derivation sign (r5) | `φ_s = t + sε` | `d/ds f∘φ_s⁻¹ = −εf′`; `r ≤ −2` | as stated | none |
| §6.3 conjugation formula (r5) | `(g⁻¹,1)` | first component `t^(−r) gauge(g⁻¹, A)` | as stated | none |
| §6.3 `SL₂` Schubert cells (r5) | `s₀`, `s₁`, `s₀s₁` | `ℓ = 1, 1, 2` | as stated | none |
| §6.4 leading coefficient (r5) | `SL₂`, `t⁻²h`; `t⁻²f` | `h` semisimple; at `r = −3`, `A_(−3) = 0`; `f` regular nilpotent | as stated | none |
| §6.5 cohomology (r5) | `μ_n`, `𝔾_m` | `H¹(μ_n) = ℤ/n`; `H²(μ_n) = 0` | as stated | none |
| §7.1 cotangent algebroid (r5) | `{x,y} = 1`; `{x,y} = x`; `k[x,y]/(x²,y²)` | `[dx,dy] = dx`, `anchor(dy)(x) = −x`; `{x²,y} = 2x ≠ 0` | as stated | none |
| §7.2 anchor sign, Heisenberg (r5) | `𝔤 = ℂ`, `t^m`, `t^n` | `−nδ_(m+n,0)` | as stated | none |
| §7.2 freeness (r5) | `𝔰𝔩₂` | `u = −a` forced | as stated | none |
| §7.3 Virasoro, KdV (r5) | `L_n = Res t^(n+1)q` | `c = −6`; `P_q(2q) = 6qq′ − q‴` | as stated | none |
| §7.4 coisotropy (r5) | `I = (q_j : j < 0)` | `{L₂,L₋₂} ↦ −3`; `{L₋₁,L₋₂} = q₁ ∉ I` | as stated | none |
| §7.5 Miura, screening, modes (r5) | `[[−u,0],[1,u]]` | `q = u² − u′`; `δq = 0`; `(q′)_(−a−1) = −a q_(−a)` | as stated | none |
| §8.1 `IsomOp` (r5) | `𝔾_m`; `g ∈ N((t))` | automorphisms `ℂˣ`; `g = 1` forced | as stated | none |
| §8.2 tangent and algebroid (r5) | `𝔰𝔩₂` | `[F_x,F_y] = −F_[x,y]` | as stated | none |
| §8.3 regular extension (r5) | `𝔾_m` | `dlog g ∈ ℂ[[t]]dt ⇒ g ∈ ℂ[[t]]ˣ` | as stated | none |
| §8.4 critical level (r5) | `κ_c = −½ Killing` | `κ₀(h,h) = 2` | as stated | none |
| §4.3 lower dictionary at the new generality (every affine algebraic `G` over `ℂ`) (r5) | `μ_n`; `𝔾_a`; `𝔾_m × ℤ/2`; trivial group; `GL_N` | `H = ℂ[x]/(xⁿ−1)`: `𝔤 = 0`, Krull dim `0`, `d = 0`, `n` discrete points modelled on `Fin 0 → ℂ`; `𝔾_a`: `d = 1`; `𝔾_m × ℤ/2`: `d = 1`, both components of dimension `1` by translation, Krull dim `1`; `H = ℂ`: `0 = 0`; `GL_N`: `d = N²`, chart with `det⁻¹` | holds; no nonreduced group exists in characteristic `0` (Cartier), so no counterexample to the smoothness step | none |
| §4.3 Cartier citations (r5) | hypotheses at the pin | `smoothCommHopfAlgProperty_of_charZero`: `[Field k] [CharZero k]`, `H : CommHopfAlgCat k`, `[Algebra.FiniteType k H]`; `finrank_lie_eq_ringKrullDim_of_charZero`: `(finrank k 𝔤 : WithBot ℕ∞) = ringKrullDim H`, same hypotheses | "`H` finitely generated" is `Algebra.FiniteType`; both as the bullet states | none |
| §4.3 bracket compatibility (r5) | `D, E ∈ 𝔤`, `h ∈ H`, `Δ = μ*` | `D^L h = Σ h_(1) D(h_(2))`; `D^L E^L h = Σ h_(1) D(h_(2)) E(h_(3))`; at `1` (apply `ε`): `Σ D(h_(1))E(h_(2)) = (D*E)(h)`; commutator at `1`: `D*E − E*D` | no minus sign, as stated | none |
| Scope: §2.4 versus ComplexComparisonPartII C−1.1 (r5) | #848 head lines 913–919, 148 | C−1.1 hands "fixed-model maximal atlases, second countability, tangent/derivation, toric, group and gauge comparisons" to F2.4 and keeps complex points, open subspaces, fibre products, smooth charts, étale local inverses | consistent, one owner each | none |
| §2.2 symbol of `(d/dx)²` with the Hasse derivative (r5) | `k[x]`, char `0`, `2`, `3`; `f = x²` | `1 ⊗ x^n = (x + ξ)^n`, `ξ²` coefficient `C(n,2)x^(n−2)`; `2·C(n,2) = n(n−1)` in every characteristic; `D(x^n) = n(n−1)x^(n−2) = 2 f^[2]`, so `ξ² ↦ 2`; char `2`: `f^[2](x²) = 1`, `(d/dx)²(x²) = 2 = 0`, and `n(n−1)` is always even | as stated | none |
| §3A.5 chart bounds (r5) | `GL₂`, `N = 0, 1`, `L_k = t^k O e₂ ⊕ O e₁` | `L_k ⊂ O² ⊂ t^(−N)O²` for every `k`; `t^N O² ⊂ L_k` fails for `k > N`; `O²/L_k ≃ O/t^k` of length `k`, unbounded | as stated | none |
| §4.3 compact comparison `λ ↦ dλ(2πi)` (new, moved from §3A.3) | `𝔾_m`, `λ = id`; `SL₂`, `λ = α^∨`; `PGL₂`, `λ = α^∨/2` | `exp_G ∘ dλ = λ ∘ exp` by naturality; `exp_G(dλ(2πi)) = λ(1) = 1`; `𝔾_m`: `1 ↦ 2πi ∈ iℝ = Lie(S¹)`; `SL₂`: `diag(2πi, −2πi) ↦ diag(1, 1)`; `PGL₂`: `diag(πi, −πi) ↦ [diag(−1, −1)] = 1`; `λ(S¹) ⊂ T(ℂ)` compact, hence in `T_K = K ∩ T` | as stated; placed after `T`, `T_K` and `K ∩ T = T_K` are built | none |
| §3A.3 → §4.3 build order (r5) | the `*Needs:*` lines after the move | §4.3 → §3A.3 → §3A.1, ReductiveGroups, RootSystems; Layer 3A Dependencies: Layers 1–3; Layer 4 Dependencies: Layers 2–3, §3A.3 | no forward edge from Layer 3A | none |
| §6.4 order bound (r5) | `A = 0`, `r = −2`; `g = exp(t⁻³x)`, `x ∈ 𝔫` | convention line 151 `gauge(g, A) = Ad(g)A − (dg)g⁻¹`; §6.4 tests `gauge(g⁻¹, A)`; `g⁻¹ = exp(−t⁻³x)`, `(g⁻¹)′ = 3t⁻⁴x·g⁻¹`, `gauge(g⁻¹, 0) = −3t⁻⁴x`, order `−4 < −2`; `gauge(t^(−λ), 0) = −(−λt⁻¹) = λt⁻¹`, order `−1 ≥ −2` | as stated | none |
| `polynomialLoopToFormal`, `positiveLoopToFormal` at the pin (r5) | `AlgHom.mapValue (H := H) …`; `module` header | file elaborates, exit `0`, three `sorry` warnings; elaborated types as in `signatures.md`: `↑(points ↧(LaurentPolynomial R)) →* ↑(points ↧(LaurentSeries R))` with `[HopfAlgebra k H] [Algebra k R]`, and the `PowerSeries` version | builds | none |
| Scope lines 78–80: 3A.5's `G(ℂ)` "on the classical topology and smooth charts of ComplexComparisonPartII C−1.1" (new) | ReductiveGroups at #1676, #1808, #1797, #1854 and main; merge order | owner of the topology and charts: 3A.5 itself at #1676 (lines 19–25, 880–883), #1808 and #1797 (line 20); C−1.1 is "later" (#1676) or a consumer (#1808 lines 30–31); 3A.5 consumes C−1.1 only on main and #1854 (lines 342–346 and 343), with no Lie group `G(ℂ)`; ReductiveGroups is on main, ComplexComparisonPartII at merge-order line 43 | false at every head that states `G(ℂ)`; would be an upward edge in the supplier | R01 |
| Identification of 3A.5's topology and charts with C−1.1's, needed at line 1424 (new) | `𝔾_m` with `H = ℂ[x,y]/(xy−1)`; `μ_n`; trivial group | 3A.5: subspace `{xy = 1} ⊂ ℂ²`; C−1.1 via §2.4 lines 728–729: the same subspace; identity homeomorphism; chart `x` common to both atlases, transition `id`; `μ_n`: `n` discrete points on both sides, model `Fin 0 → ℂ`; trivial group: one point | true; stated by no supplier (#848 silent, #1676 asserts it) | R01 (owner: §4.3) |
| Scope lines 81–85: chart-at-the-identity clause and what §4.3 owns (new text, unchanged content) | #1676 lines 26–27, 932–935 | 3A.5: "Lie algebra is identified with Layer 2's tangent Lie algebra by the chart at the identity"; §4.3 "transports it to the Hopf-point carrier" | matches | R01 adds the comparison to the "owns only" list |
| Deleted Downstream bullet "ReductiveGroups Layer 11 consumes … §4.3" (new) | main line 1964; #1676 line 3806; #1808; #1797; #1854 line 1965 | main and #1854 cite F4.3 in Layer 11; #1676: "Layer 11 consumes no target of FormalConnectionsOpers"; #1808 and #1797: no F4.3 in Layer 11 (FormalConnectionsOpers only at lines 1334/3678 and 1802/4233) | correct once #1676 merges first, as the description requires | none |
| Previous R01: dependency on the ReductiveGroups revision named (new) | description; #1676 lines 930–935; #1808 line 856; #1797 line 1231 | the description names #1676, with #1808 and #1797; each carries "identified with Layer 2's tangent Lie algebra by the chart at the identity" | repaired | none |
| §4.3 composite equals 3A.5's identification (lines 1433–1435) (r5 values, new referent) | `𝔾_a`; `𝔾_m` | `𝔾_a`: `D(x/(1+x)) = 1`; `𝔾_m`: `D(x⁻¹) = −1`, the chart-at-`1` derivative; referent at #1676 lines 932–933 | as stated | none |

## Not verifiable

- Nothing new in this round. The earlier reviews' items stand:
  - Kazhdan–Lusztig 1988 §4 Lemmas 6 and 8, and Kazhdan–Lusztig 1980 §2: no legal copy; marked uncertified in the README.
  - Kostant 1963, Chevalley 1955, Matsushima 1960, Drinfeld–Sokolov 1985 and Rinehart 1963: cited by locator and marked uncertified.
- ReductiveGroups at #1808, #1797 and #1854, and ComplexComparisonPartII at #848, were read through `roadmaps show --pr`, not from a checkout. Their line numbers are those of that listing.

## Source issues

- none
